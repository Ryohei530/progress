FactoryBot.define do
  factory :board_tag do
    board { nil }
    association :tag
  end
end
