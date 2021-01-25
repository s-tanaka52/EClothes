FactoryBot.define do
  factory :user, class: User do
    name {"test"}
    user_name {"test"}
    email {"test@user.com"}
    password {"000000"}
    id {"1"}
  end
  factory :another_user, class: User do
    name {"test"}
    user_name {"test"}
    email {"test@another_user.com"}
    password {"000000"}
    id {"2"}
  end
end
