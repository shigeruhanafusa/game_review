# アプリケーション名

Game Review

# アプリケーション概要

誰でも簡単かつ気軽にレビューできるようなゲーム評価サイトです。

# URL

[オリジナルアプリケーション](http://35.73.247.122:3000/)
<br>（現在本番環境でエラーが発生している為、修正中）
<br>（完成日12月12日、デプロイ時エラー発生12月12日、修正完了日12月15日予定）

# テスト用アカウント

・Basic認証パスワード：2222<br>
・Basic認証ID：admin<br>
・メールアドレス：test@gmail.com<br>
・パスワード：test1234<br>

# 利用方法

### タイトル投稿

1.トップページのヘッダーからユーザー新規登録を行なう<br>
2.投稿ページからゲームタイトル名を入力して投稿する<br>

### 評価基準の投稿

1.トップページの投稿したゲームタイトルから詳細ページに移行する<br>
2.詳細ページから各種評価基準を投稿する<br>
3.投稿した評価基準に評価をする<br>

# アプリケーションを作成した背景

誰でも簡単かつ気軽にレビューできるようなゲーム評価サイトを作ろうと考えました<br>
私自身Amazonや食べログ等のレビューサイトを参考にしたりするのですが<br>少しでも悪い所があるとネガティブなレビューが目立ってしまう傾向にあると感じる事が多々ありました<br>
そこで評価基準を細分化する事によって良い部分もあるんだよと分かるようなサイトを目指したいと思っています。

# 洗い出した要件

[要件を定義したシート](https://docs.google.com/spreadsheets/d/17TTOlsw2V_Em366VBEqWCuHJKIHR_3Y4KYgbR5R76gk/edit#gid=982722306)

# 実装予定の機能

SNSの連携やYoutubeと連携してPVを引っ張ってきたりしていきたいです。

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/b1a868d29a6b9bdde5140c7a0f915391.png)](https://gyazo.com/b1a868d29a6b9bdde5140c7a0f915391)

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/dee5747a3cb941738ad5be44a1fb2e42.png)](https://gyazo.com/dee5747a3cb941738ad5be44a1fb2e42)

[![Image from Gyazo](https://i.gyazo.com/185a991e7e65b8989a4ca419d53e1598.png)](https://gyazo.com/185a991e7e65b8989a4ca419d53e1598)

# 開発環境

・HTML/CSS<br>
・Java/ruby<br>
・VScode/Eclipse<br>
・Github<br>

# usersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| encrypted_password  | string     | null: false                    |
| email               | string     | null: false, unique: true      |

### Association
has_many :items



# itemsテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title         | string    | null: false                    |
| text          | text      | null: false                    |
| genre_id             | integer | null: false                       |
| user                | references | null: false, foreign_key: true |


### Association
belongs_to :user
belongs_to :rating



# ratingsテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| evaluation         | string     | null: false                    |
| rank             | integer    | null: false                    |
| item                | references | null: false, foreign_key: true |


### Association
has_many :items