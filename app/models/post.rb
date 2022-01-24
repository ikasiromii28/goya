class Post < ApplicationRecord
  validates :kibun, presence: true
  validates :date, presence: true

  belongs_to :user

  scope :by_recently_created, -> {order(created_at: :desc)}
end
