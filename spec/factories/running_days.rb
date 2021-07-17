FactoryBot.define do
  factory :running_day do
    start_date { "2021-07-15" }
    date { "2021-07-15" }
    s_or_c { false }
    r_days { 1 }
    user { nil }
  end
end
