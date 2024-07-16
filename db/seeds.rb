# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# クイズの問題データを作成
questions_data = [
  {
    content: "派遣とSESの違いについて理解している",
    correct_answer: true
  },
  {
    content: "”商流”という言葉の意味を知っている",
    correct_answer: true
  },
  {
    content: "みなし残業に関して、理解している",
    correct_answer: true
  },
  {
    content: "労働環境に関しての法律について調べたことがある、もしくは知っている",
    correct_answer: true
  },
  {
    content: "自社開発をやっているSES企業は信用できる",
    correct_answer: false
  },
  {
    content: "高還元SESと聞くと、優良企業の印象を受ける",
    correct_answer: false
  },
  {
    content: "SES企業では、正しく技術スキルを評価してもらえると思う",
    correct_answer: false
  },
  {
    content: "いいSES企業はいいエンジニアの先輩がいることだと思う",
    correct_answer: false
  },
  {
    content: "PMO業務と聞くと、ゆくゆくはエンジニアになれそうだと思う",
    correct_answer: false
  },
  {
    content: "エンジニアを採用する面接にはエンジニアの人が面接官をしてくれると思う",
    correct_answer: false
  },
  {
    content: "研修期間は3ヶ月くらいあるのが当たり前だと思う",
    correct_answer: false
  },
  {
    content: "SES企業なので、チームで常駐先に派遣されるものだと思う",
    correct_answer: false
  },
  {
    content: "SES企業がHPに記載している取引先や取り扱っている案件は、現在もその案件に入れると思う",
    correct_answer: false
  },
  {
    content: "テスト案件（システムテストを実施するテスター案件）と聞くと、テストコードを書く仕事だと思う",
    correct_answer: false
  },
]

questions_data.each do |question_data|
  Question.create!(content: question_data[:content], correct_answer: question_data[:correct_answer])
end