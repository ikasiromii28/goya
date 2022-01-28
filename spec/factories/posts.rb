FactoryBot.define do
  factory :post do
    kibun { 'ごっつええかんじ' }
    date { 2000 - 0o1 - 0o1 }
    association :user
  end
end
