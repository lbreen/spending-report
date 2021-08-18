# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding DB..."

User.destroy_all
Transaction.destroy_all

User.create!(email: 'l.b@gmail.com', password: '123456')
Transaction.create!(amount: '36.65',category: 'Shopping', account: 'Monzo', currency: 'GBP', settled: DateTime.new(2021,8,18,14,05))
Transaction.create!(amount: '503.34',category: 'Taxi', account: 'Barclays', currency: 'GBP', settled: DateTime.new(2021,8,18,14,05))
Transaction.create!(amount: '12.34',category: 'Eating Out', account: 'Barclays', currency: 'GBP', settled: DateTime.new(2021,8,18,14,05))
Transaction.create!(amount: '56.12',category: 'Eating Out', account: 'Monzo', currency: 'GBP', settled: DateTime.new(2021,8,18,14,05))
Transaction.create!(amount: '78.23',category: 'Groceries', account: 'Monzo', currency: 'GBP', settled: DateTime.new(2021,8,18,14,05))
Transaction.create!(amount: '50.00',category: 'Shopping', account: 'Monzo', currency: 'GBP', settled: DateTime.new(2021,8,18,14,05))



puts "Seeding complete!"
