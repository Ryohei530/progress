FactoryBot.define do
  factory :article do
    title { "MyString" }
    content { "MyText" }
    view { 1 }
    user { nil }
  end
end
