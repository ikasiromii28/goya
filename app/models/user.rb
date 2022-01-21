class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
  end

  has_many :posts, dependent: :destroy
  has_many :room_users
  has_many :rooms, through: :room_users

  has_many :followeds,
  class_name: 'Follows',
  foreign_key: 'followed_id',
  dependent: :destroy,
  inverse_of: :followed
  has_many :followings,
    class_name: 'Follows',
    foreign_key: 'following_id',
    dependent: :destroy,
    inverse_of: :following
  has_many :following_users, through: :followeds, source: :following #フォローする側
  has_many :followed_users, through: :followings, source: :followed #フォローされる側

  def follow(other_user_id)
  followeds_follows.find_by(following_id: other_user_id).create
  end

  def following?(other_user)
  following_users.include?(other_user)
  end

  def unfollow(other_user_id)
  followed_users.find_by(following_id: other_user_id).destroy
  end  
end
