FactoryBot.define do
  factory :report do
    content { "report" }
    r_days { 1 }
  end

  factory :reports, class: Report do
    sequence(:content) { |n| "report#{n}" }
    sequence(:r_days) { |n| n }
    user { User.first }
    monthly_goal { MonthlyGoal.first }
  end
end
