class AnalyzerController < ApplicationController
  SES_COMPANIES = ENV['SES_COMPANIES'].to_s.split(',').map(&:strip).freeze
  KEYWORDS = ENV['KEYWORDS'].to_s.split(',').map(&:strip).freeze
  HIGH_PROBABILITY_THRESHOLD = ENV['HIGH_PROBABILITY_THRESHOLD'].to_i
  MEDIUM_PROBABILITY_THRESHOLD = ENV['MEDIUM_PROBABILITY_THRESHOLD'].to_i

  def index
  end

  def analyze
    url = params[:url]
    content = fetch_content(url)
    result, keyword_counts, matched_company = analyze_content(content)
    log_analysis_result(url, keyword_counts, matched_company)
  
    # デバッグ用にログに出力
    Rails.logger.info "Analysis result: #{result}, Matched company: #{matched_company}, Keyword counts: #{keyword_counts}"
  
    # ログインユーザーの場合、分析結果を保存
    if user_signed_in?
      analysis_result = {
        result: result,
        matched_company: matched_company,
        keyword_counts: keyword_counts
      }
      current_user.analyses.create(url: url, result: analysis_result.to_json)
    end
  
    render json: { result: result, matched_company: matched_company, keyword_counts: keyword_counts }
  rescue SocketError => e
    handle_network_error(e)
  rescue => e
    handle_general_error(e)
  end

  private

  def fetch_content(url)
    Rails.logger.info "Attempting to fetch content from URL: #{url}"
    
    response = Retriable.retriable(tries: 3, base_interval: 1) do
      HTTParty.get(url, request_options)
    end

    Rails.logger.info "Response received. Status code: #{response.code}"
    raise "HTTPリクエストエラー: ステータスコード #{response.code}" unless response.success?

    Nokogiri::HTML(response.body)
  end

  def request_options
    {
      timeout: 30,
      ssl_version: :TLSv1_2,
      verify: !Rails.env.development?,
      headers: {
        'User-Agent' => random_user_agent,
        'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        'Accept-Language' => 'en-US,en;q=0.5',
        'Accept-Encoding' => 'gzip, deflate, br',
        'Connection' => 'keep-alive',
        'Upgrade-Insecure-Requests' => '1'
      },
      follow_redirects: true
    }
  end
  # ブロック回避
  def random_user_agent
    [
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15',
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0',
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36',
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36 Edg/91.0.864.59'
    ].sample
  end

  # 診断するメソッド
  def analyze_content(content)
    text_content = content.text.downcase
    # デバッグ用 最初の500文字をログに出力
    Rails.logger.debug "Analyzing content: #{text_content.slice(0, 500)}..." 
    matched_company = SES_COMPANIES.find { |company| text_content.include?(company.downcase) }
    # カンパニーにマッチした場合
    return ["SES企業である確率が98%以上です", {}, matched_company] if matched_company

    keyword_counts = count_keywords(text_content)
    score = keyword_counts.values.sum
    result = determine_result(score)

    [result, keyword_counts, nil]
  end

  # キーワードのカウント
  def count_keywords(text_content)
    KEYWORDS.each_with_object({}) do |keyword, counts|
      count = text_content.scan(/\b#{Regexp.escape(keyword.downcase)}\b/).count
      # ログに出力するために保存
      counts[keyword] = count
    end
  end

  def determine_result(score)
    if score > HIGH_PROBABILITY_THRESHOLD
      "高い確率でSES企業です"
    elsif score > MEDIUM_PROBABILITY_THRESHOLD
      "SES企業の可能性があります"
    else
      "SES企業である可能性は低いです"
    end
  end

  # デバッグ用にログを出力する
  def log_analysis_result(url, keyword_counts, matched_company)
    log_message = "URL: #{url}\n"
    if matched_company
      log_message += "Matched SES Company: #{matched_company}\n"
    else
      log_message += "Keyword Counts:\n"
      keyword_counts.each { |keyword, count| log_message += "#{keyword}: #{count}\n" }
      log_message += "Total Score: #{keyword_counts.values.sum}\n"
    end
    Rails.logger.info(log_message)
  end

  # ネットワークエラーを処理する
  def handle_network_error(error)
    error_message = "ネットワークエラー: URLに接続できませんでした。インターネット接続を確認し、再試行してください。"
    Rails.logger.error "#{error_message} 詳細: #{error.message}"
    render json: { error: error_message }, status: :service_unavailable
  end

  # 一般的なエラーを処理する
  def handle_general_error(error)
    error_message = "URLの解析中にエラーが発生しました: #{error.message}"
    Rails.logger.error "Error analyzing URL: #{error_message}\n#{error.backtrace.join("\n")}"
    render json: { error: error_message }, status: :unprocessable_entity
  end
end