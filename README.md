# README

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