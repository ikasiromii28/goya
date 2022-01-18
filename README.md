# README

## usersテーブル

| Column             | Type       | Options                    |
| ------------------ | ---------- | -------------------------- |
| nickname           | string     | null: false                |
| email              | string     | null: false, UNIQUE: true  |
| encrypted_password | string     | null: false                |

### Association
- has_many :kimochis

## kimochisテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| kibun           | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user