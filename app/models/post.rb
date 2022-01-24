class Post < ApplicationRecord
  validates :kibun, presence: true
  validates :date, presence: true

  belongs_to :user

  def self.sort(selection)
    case selection
    when 'new'
      all.order(created_at: :DESC)
    when 'old'
      all.order(created_at: :ASC)
    when 'date-new'
      all.order(date: :DESC)
    when 'date-old'
      all.order(date: :ASC)
    end
  end
end
