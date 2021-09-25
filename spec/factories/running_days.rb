FactoryBot.define do
  factory :running_day do
    start_date { "2021-07-15" }
    sequence(:date) { "2021-07-15" }
    sequence(:s_or_c) do |n|
      if n == 0
        false 
      else
        true
      end
    end
    sequence(:r_days) { |n| n }
  end
  
  factory :r_day, class: RunningDay do
    start_date { "2021-07-15" }
    date { "2021-07-16" }
    s_or_c { true }
    r_days { 2 }
    
    trait :day3 do
      date { "2021-07-17" }
      r_days { 3 }
      association :user, factory: :user2
    end
    
    trait :day5 do
      date { "2021-07-19" }
      r_days { 5 }
      association :user, factory: :user3
    end
    
    trait :day10 do
      date { "2021-07-24" }
      r_days { 10 }
      association :user, factory: :user4
    end
    
    trait :day20 do
      date { "2021-08-04" }
      r_days { 20 }
      association :user, factory: :user5
    end
    
    trait :day30 do
      date { "2021-08-14" }
      r_days { 30 }
      association :user, factory: :user6
    end
  end
end
