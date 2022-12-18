# アプリケーション名

Game Review

# アプリケーション概要

誰でも簡単かつ気軽にレビューできるようなゲーム評価サイトです。

# URL

[オリジナルアプリケーション](http://35.73.247.122:3000/)
<br>（デプロイ時エラー発生12月12日、修正完了日12月14日）

# テスト用アカウント

・Basic認証パスワード：2222<br>
・Basic認証ID：admin<br>
・メールアドレス：test@gmail.com<br>
・パスワード：test1234<br>

# 利用方法

### タイトル投稿

1.トップページのヘッダーからテスト用アカウントでログイン<br>
2.トップページの右下にある投稿ページからゲームタイトル名と内容とジャンルを入力して投稿する<br>

### 評価基準の投稿

1.トップページの投稿したゲームタイトルから詳細ページに移行する<br>
2.詳細ページの評価投稿ページをクリックして投稿ページに移行する<br>
3.戦闘・ビジュアル・音楽等の評価を入力し、1〜５の評価を選び投稿する<br>

# アプリケーションを作成した背景

誰でも簡単かつ気軽にレビューできるようなゲーム評価サイトを作ろうと考えました<br>
私自身Amazonや食べログ等のレビューサイトを参考にしたりするのですが<br>少しでも悪い所があるとネガティブなレビューが目立ってしまう傾向にあると感じる事が多々ありました<br>
そこで評価基準を細分化する事によって良い部分もあるんだよと分かるようなサイトを目指したいと思っています。

# アプリケーションを作成する際に意識したこと

プログラミングスクールではHTMLとCSSの基礎は学びましたが、基本的にコーディングされたものが用意されており<br>
コントローラーで実装したインスタンスメソッドをHTMLに穴埋め的に記入するという事を行なっていたので<br>
HTMLとCSSは自力でコーディングするという事を心がけながら書きました<br>
その他にもスクール内で行なった事の深掘り(JqueryやMySQL等)を行ない復習し、学んでいない事もいくつか実装を行ないました(いいねボタン)<br>

# 洗い出した要件

[要件を定義したシート](https://docs.google.com/spreadsheets/d/17TTOlsw2V_Em366VBEqWCuHJKIHR_3Y4KYgbR5R76gk/edit#gid=982722306)

# 実装予定の機能

検索機能やYoutubeと連携してPVを引っ張ってきたりしていきたいです。

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/67a1ce2492a60abbddb67c182461a618.png)](https://gyazo.com/67a1ce2492a60abbddb67c182461a618)

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/b8e9a4e293d0309d731fb4375e894a89.png)](https://gyazo.com/b8e9a4e293d0309d731fb4375e894a89)

[![Image from Gyazo](https://i.gyazo.com/185a991e7e65b8989a4ca419d53e1598.png)](https://gyazo.com/185a991e7e65b8989a4ca419d53e1598)

# 開発環境

・HTML/CSS<br>
・ruby on rails<br>
・VScode<br>
・Github desktop<br>

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
| rate             | integer    | null: false                    |
| item                | references | null: false, foreign_key: true |


### Association
has_many :items


# likesテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |


### Association
belongs_to :user
belongs_to :item