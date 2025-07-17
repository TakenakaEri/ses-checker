## SES チェッカー
<img width="1245" height="727" alt="Image" src="https://github.com/user-attachments/assets/1ae8e4a1-a31b-4a4d-acf4-276a942cff77" />


## サービス概要
求人情報のURLをフォームに入力するだけで、SES企業 かどうかを診断するサービスです。
[![Image from Gyazo](https://i.gyazo.com/14695a90cf194b641677ea7aae7b83f6.gif)](https://gyazo.com/14695a90cf194b641677ea7aae7b83f6)

## このサービスへの思い・作りたい理由
「SES 企業は見抜くのが難しい」

自社開発や受託開発の会社に応募したつもりが、面接に行ったらSES企業だったという話はよく聞きます。

私自身が前職で SES 企業に勤めており、沢山の同業種の企業を見てきました。そんな私の知見を生かした、SES 企業の特徴を分析するアプリです。

SES 企業の全てが悪いわけではありません。
このアプリで、求職者と求人企業とのミスマッチが少しでも減るといいなと思っています。

## サービスの利用イメージ
企業の求人情報ページの URL をフォームに入力してもらい、そのテキストデータの内容からSES企業かどうかの診断を行います。
SES 企業に対する解像度を高めることで、自分がどのような企業で働きたいのかを見つめ直きっかけ作りにして欲しいです。

## 機能候補
- SES診断機能
- Googleログイン機能
- ページネーション機能
- 履歴閲覧機能
- 使用する gem
  - nokogiri
  - httparty
  - device
  - material_icons
  - omniauth-google-oauth2
  - httparty
  - kaminari

### 使用技術
- RubyOnRails
- HTML
- JavaScript
 - partical.js
- Tailwind css
