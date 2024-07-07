## SES チェッカー

## サービス概要
自分が応募しようとしている求人が SES かどうかを診断するサービスです。

## このサービスへの思い・作りたい理由
「SES 企業は見抜くのが難しい」

エンジニア採用のハードルが年々上がっていく中で、未経験エンジニアにとって何がいい企業なのか分かりません。
また、未経験エンジニアが SES 企業に入社て家電量販店に配属されたと言う漫画のような話をよく聞きます。

私自身が前職で SES 企業に勤めており、沢山の同業種の企業を見てきました。そんな私の知見を生かして、SES 企業の特徴を分析するアプリを作ります。

SES 企業は全てが悪いわけではありません。

でも、一度立ち止まって、何故その企業で働きたい理由を考えるきっかけにしてください。

## ユーザー層について
これから就職をしようと思っている未経験エンジニアの方

## サービスの利用イメージ
これから就職活動をしようとしているエンジニアの方に、企業の求人情報ページの URL を入力してもらい、そのテキストデータの内容から SES かどうかの診断を行います。
また、ログインユーザーには、企業が SES だった場合はどのような種類の SES なのか（高還元 SES など）を診断することができます。

SES 企業に対する解像度を高めることで、自分がどのような企業で働きたいのかを見つめ直きっかけ作りにして欲しいです。

## ユーザーの獲得について
少々物議を醸し出しそうな内容なので、SNS 上で告知するつもりはありません。RUNTEQ 生の就活の時に使ってもらえればいいかなと思っています。

## サービスの差別化ポイント・推しポイント
現状、SES 企業の見分け方と言うサイトは沢山見つかるのですが、アプリは見つけられていないので差別化はできてきると思っているのですが、その中でも、ログインした後に SES 企業の分析を行うことができるのが推しポイントかなと思っています。

## 機能候補
### MVP リリース
- SES診断機能
  - 使用する gem
    - nokogiri
    - httparty

### 本リリース
- ログイン・ログアウト機能
- ページネーション機能
- 履歴閲覧機能
- SES に騙されやすい度診断
  - 使用する gem
    - device
    - material_icons
    - omniauth-google-oauth2
    - httparty
    - kaminari

### 機能の実装方針予定
- SES診断機能
  - URL を入力して送信することで、SES 企業かそうでないかを診断
- あなたは大丈夫！？SES に騙されやすい度診断
  - SES 企業に騙されやすいかどうかをクイズ形式で診断します
- タレコミフォーム機能
  - 無記名で実際に経験した悪徳SESの会社名を報告できるフォーム。名前は見れませんが、
- SESポイント集
  - 実録SES失敗談
  - 求人広告から SES を見分けるポイント
  - 面接で確認するポイント
  - 勤めてはいけない SES 企業の特徴

### 使用技術
- RubyOnRails
- HTML
- JavaScript
- Tailwind css
