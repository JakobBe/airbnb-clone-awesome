# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



puts "Seeding starts"

Flat.destroy_all
User.destroy_all
Registration.destroy_all
Booking.destroy_all

10.times do
  reg = Registration.create(email: Faker::Internet.email, password: "123456")
  reg
  user = User.create(first_name: Faker::StarWars.character, registration_id: reg.id)
  user
  flat = Flat.create(name: Faker::StarWars.vehicle, location: Faker::StarWars.planet, price: 42, user_id: user.id)
  booking = Booking.create(user: user, flat: flat, total_price: 42, status: "Pending")
  booking
end

puts "Seeding done"
