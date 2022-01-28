# README

## アプリケーション名
Go-Ya

## アプリケーション概要
その日の気分を投稿することができる。一覧ページでは匿名で日付と該当の気分が確認できる。

## URL
https://goya-app-0117.herokuapp.com/

## テスト用アカウント
・メールアドレス：tarou@test<br> ・パスワード：tarou01<br>・Basic認証ID：admin<br>・Basic認証PASS：4649

## 利用方法
1. トップページの一覧ページのサイドバーからユーザー登録を行う。
2. トップページ上部の気持ちの投稿より日付と気持ちを選択し、投稿を行う。
3. 一覧ページからはその日どのような気持ちの人がいるかのみ確認でき、ユーザーは特定できない。
4. サイドバーのユーザーリストより、他ユーザーのマイページへ遷移、フォローをすることができる。
5. フォロー中のユーザーと自身の投稿はタイムラインより確認することができる。タイムラインは1人もフォローしていないとサイドバーに表示されない。
また、タイムラインではトップページの情報に加え、フォロー中のどのユーザーが投稿したかも確認することができる。
6. 他ユーザーとチャットルーム（生存確認ルーム）でメッセージを送受信することができ、連絡を取り合うことができる。
7. 生存確認の観点から、ユーザーマイページでは気持ちの日付と、実際に投稿された投稿日が確認できる。

## アプリケーションを作成した背景
手軽にその日の気持ちを共有したいという思いがあったため。また、昨年の今日どんな気持ちだったかなと簡単に確認したかったため。
あまり連絡を取り合わない相手やSNSなどをまめに更新していない人が元気でいるか、離れたところに住んでいる祖父母たちが元気でいるかを確認できるようにしたかったため。

## 洗い出した要件
https://docs.google.com/spreadsheets/d/1-q7hczp2c5YLAE9uEucodyqDwc8mFIGidf91zcT8OS8/edit?usp=sharing

## usersテーブル

| Column             | Type       | Options                    |
| ------------------ | ---------- | -------------------------- |
| nickname           | string     | null: false                |
| email              | string     | null: false, UNIQUE: true  |
| birthday           | date       | null:false                 |
| encrypted_password | string     | null: false                |

### Association
- has_many :posts
- has_many :room_users
- has_many :rooms,through::room_users
- has_many :messages

## Postsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| kibun           | string     | null: false                    |
| date            | date       |null: false                     |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## Roomsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| message         | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_many :users,through::room_users
- has_many :messages
- has_many :room_users

## Messagesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| room            | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |
| content         | string     | null: false                    |

### Association

- belongs_to :room
- belongs_to :user 

## Room_usersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| room            | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user 