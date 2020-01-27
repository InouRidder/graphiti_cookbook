FactoryBot.define do
  factory :recipe do
    title { "Taco's" }
    cooked { false }
    rating { rand(10) }
    description { "Start by making guacamole. Then add taco's." }
  end
end
