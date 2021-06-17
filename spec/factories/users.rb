FactoryBot.define do
  factory :user do
    name { "brian" }
    email { "brian@example.com" }
    password { "012345" }
    password_confirmation { "012345" }
    admin { true }
  end
  
  factory :user2, class: User do
    name { "tanaka" }
    email { "tanaka@example.com" }
    password { "012345" }
    password_confirmation { "012345" }
  end
  
  factory :users, class: User do
    sequence(:name) { |n| "Test#{n + 1}" }
    sequence(:email) { |n| "test-#{n + 1}@example.com" }
    password { "012345" }
    password_confirmation { "012345" }
  end
  
end
