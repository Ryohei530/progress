FactoryBot.define do
  factory :user do
    name { "Example User" }
    email { "user@example.com" }
    password { "012345" }
    password_confirmation { "012345" }
  end
end
