puts "Emptying db ..."

Recipe.destroy_all

puts 'Creating 100 recipes'

100.times do
  Recipe.create(
    title: Faker::Food.dish,
    description: Faker::Food.description,
    cooked: [true, false].sample,
    rating: rand(100)
  )
end

puts 'Done'
