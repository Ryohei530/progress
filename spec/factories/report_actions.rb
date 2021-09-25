FactoryBot.define do
  factory :report_action do
    sequence(:number) { |n| n + 1 }
    association :report, factory: :reports
  end
end
