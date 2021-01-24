FactoryBot.define do
  factory :user do
      sequence(:name) { |n| "test#{n}"}
      sequence(:user_name) { |n| "test-0#{n}"}
      sequence(:email) { |n| "test-0#{n}@test.com"}
      sequence(:password) { |n| "test-0#{n}"}
    end
end
