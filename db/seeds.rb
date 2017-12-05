# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



puts "Seeding starts"

Flat.destroy_all

10.times do
  flat = Flat.new(name: Faker::GameOfThrones.house, location: Faker::GameOfThrones.city, price: 42, user_id: rand(2..10))

  if flat.save
    puts "#{flat.name} #{flat.user_id} "
  else
    puts "#{flat.name} did not work for #{flat.user_id}"
  end
end

puts "Seeding done"
