FactoryBot.define do
  factory :user do
    nickname                  { Faker::Name.initials(number: 6) }
    email                     { Faker::Internet.free_email }
    password                  { Faker::Internet.password(min_length: 6) }
    encrypted_password        { password }
  end
end
