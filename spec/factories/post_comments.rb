FactoryBot.define do
  factory :post_comment do
    content { "MyText" }
    reply_id { 1 }
    user { nil }
    post { nil }
  end
end
