FactoryBot.define do
  factory :post do
    kibun   { 'ごっつええかんじ'}
    date   { 2000-01-01 }
    association :user
  end
end
