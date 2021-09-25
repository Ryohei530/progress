FactoryBot.define do
  factory :article do
    title { "MyString" }
    content { "MyText" }
    view { 1 } 
    
    trait :title1 do
      title { "You are string" }
    end
    
    trait :title2 do
      title { "My String is long" }
    end
    
    trait :title3 do
      title { "My String and Your string" }
    end
  end
end
