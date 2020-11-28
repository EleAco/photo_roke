FactoryBot.define do
  factory :photo do
    title               { Faker::Lorem.characters(number: 20) }
    explanation         { Faker::Lorem.characters(number: 500) }
    association :user
  end
end
