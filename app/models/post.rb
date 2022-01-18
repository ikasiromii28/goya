class Post < ApplicationRecord
  validates :kibun, presence: true
  validates :date, presence: true

  belongs_to :user
end
