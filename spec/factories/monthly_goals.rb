FactoryBot.define do
  factory :monthly_goal do
    monthly_aim { "monthly aim" }
    monthly_indicator { "monthly indicator" }
    term_start { "2021-07-17" }
    term_end { "2021-08-17" }
  end
end
