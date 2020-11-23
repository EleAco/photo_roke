FactoryBot.define do
  factory :photo do
    title               {'20字ギリギリを記述してテストを行いま'}
    association :user
  end
end
