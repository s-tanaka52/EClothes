FactoryBot.define do
  factory :reviewcomment do
    sequence(:user_id) { |n| "#{n}"}
    sequence(:comment) { |n| "good!by_#{n}"}
  end
end