class Analysis < ApplicationRecord
  belongs_to :user

  validates :url, presence: true
  validates :result, presence: true

  # JSON形式で保存されたkeyword_countsを扱うためのメソッド
  def keyword_counts_hash
    JSON.parse(keyword_counts) if keyword_counts
  end

  # JSON形式で保存されたデータを日本語に変換するためのメソッド
  def readable_result
    parsed_result = JSON.parse(result)
    parsed_result['result']
  rescue JSON::ParserError
    '結果の解析に失敗しました'
  end
end
