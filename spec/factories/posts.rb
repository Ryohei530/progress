FactoryBot.define do
  factory :post do
    content { "コーヒー豆じゃぁねぇーよ" }
    created_at { 1.hour.ago }
    user { User.first }
  end
  
  factory :brian, class: Post do
    content { "BJです" }
    created_at { 5.minutes.ago }
    association :user
  end
  
  factory :most_recent, class: Post do
    content { "most recent" }
    created_at { 10.minutes.ago }
    user { User.first }
  end
  
  factory :post2, class: Post do
    content { "田中です。駅前の自動販売機の近くで500円拾いました。" }
    created_at { 3.hours.ago }
    association :user, factory: :user2 
  end
  
  factory :post3, class: Post do
    content { "熱斗くんアンダーシャツをロールちゃんのお家に忘れてきてしまったよ！" }
    created_at { 30.minutes.ago }
    association :user, factory: :user3 
  end
  
  factory :post4, class: Post do
    content { "異議あり！" }
    created_at { 2.days.ago }
    association :user, factory: :user4
  end

  
  factory :samples, class: Post do
    sequence(:content) { |n| "Sample #{n}" } 
    sequence(:created_at) { |n| (n + 1).hours.ago }
    association :user, factory: :users
  end
  
  factory :brians, class: Post do
    sequence(:content) { |n| "Sample #{n}" } 
    sequence(:created_at) { |n| (n + 1).hours.ago }
    user { User.first }
  end
end