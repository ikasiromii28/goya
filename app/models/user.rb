class User < ApplicationRecord
  with_options presence: true do
    validates :nickname, length: { maximum: 6 }
    validates :birthday
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'が不正な値です', on: :create

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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

  def self.search(search)
    if search != ''
      User.where('email LIKE(?)', "%#{search}%")
    else
      User.all
    end
  end
end
