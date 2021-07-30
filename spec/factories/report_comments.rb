FactoryBot.define do
  factory :report_comment do
    content { "MyText" }
    reply_id { 1 }
    user { nil }
    report { nil }
  end
end
