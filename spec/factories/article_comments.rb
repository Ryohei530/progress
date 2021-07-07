FactoryBot.define do
  factory :article_comment do
    content { "MyText" }
    reply_id { 1 }
    user { nil }
    article { nil }
  end
end
