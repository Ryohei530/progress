FactoryBot.define do
  factory :goal do
    aim { "aim" }
    indicator { "indicator" }
    term_start { "2021-07-17" }
    term_end { "2021-12-17" }
  end
  
  factory :goal0, class: Goal do
    aim { nil }
    indicator { nil }
    term_start { nil }
    term_end { nil }
    association :user
  end
end
