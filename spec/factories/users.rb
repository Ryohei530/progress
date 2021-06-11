FactoryBot.define do
  factory :user do
    name { "brian" }
    email { "brian@example.com" }
    password { "012345" }
    password_confirmation { "012345" }
    password_digest { User.digest("012345") }
  end
end
