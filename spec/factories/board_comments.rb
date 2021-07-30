FactoryBot.define do
  factory :board_comment do
    content { "MyText" }
    reply_id { 1 }
    user { nil }
    board { nil }
  end
end
