class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :nickname, length: { maximum: 6 }
  end

  has_many :posts, dependent: :destroy
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages

  has_many :followeds,
           class_name: 'Relationship',
           foreign_key: 'followed_id',
           dependent: :destroy,
           inverse_of: :followed
  has_many :followings,
           class_name: 'Relationship',
           foreign_key: 'following_id',
           dependent: :destroy,
           inverse_of: :following
  has_many :following_users, through: :followeds, source: :following # フォローする側
  has_many :followed_users, through: :followings, source: :followed # フォローされる側
end
