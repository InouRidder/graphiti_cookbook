puts "Emptying db ..."

Recipe.destroy_all

puts 'Creating categories'

Recipe::BASE_CATEGORIES.each { |category| Category.create(name: category) }

puts 'Creating 100 recipes'

categories = Category.all

100.times do
  Recipe.create(
    title: Faker::Food.dish,
    description: Faker::Food.description,
    cooked: [true, false].sample,
    rating: rand(100),
    category: categories.sample
  )
end

puts 'Done'
