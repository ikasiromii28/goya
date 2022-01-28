# README

## アプリケーション名
Go-Ya

## アプリケーション概要
その日の気分を投稿することができる。
一覧ページには匿名で日付と該当の気分のみが表示される。
他ユーザーをフォローすることで、オリジナルのタイムラインが作成され、フォロー中のユーザーと自身の投稿が一覧で表示できるようになる。タイムライン上では一覧ページで表示されるものの他に投稿者も合わせて表示される。また、投稿者のマイページに遷移することができる。


## URL
https://goya-app-0117.herokuapp.com/

## テスト用アカウント
・メールアドレス：test@test<br> ・パスワード：test01<br>・Basic認証ID：admin<br>・Basic認証PASS：2222




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