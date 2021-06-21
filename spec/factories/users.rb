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
    
    factory :user3 do
      name { "ロックマン" }
      email { "megaman@example.com" }
    end
    
    factory :user4 do
      name { "ミツルギ" }
      email { "mitsu_igiari@example.com" }
    end
  end
  
  factory :users, class: User do
    sequence(:name) { |n| "Test#{n + 1}" }
    sequence(:email) { |n| "test-#{n + 1}@example.com" }
    password { "012345" }
    password_confirmation { "012345" }
  end
  
end
