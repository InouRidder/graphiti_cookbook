FactoryBot.define do
  factory :recipe do
    title { "MyString" }
    cooked { false }
    rating { 1 }
    description { "MyText" }
  end
end
