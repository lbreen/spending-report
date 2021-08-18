require 'faker'

puts "Seeding DB..."

Transaction.destroy_all
User.destroy_all

user = User.create!(email: 'l.b@gmail.com', password: '123456')
Transaction.create!(user: user, amount_cents: '3665', description: Faker::Commerce.product_name, category: 'Shopping', account: 'Monzo', currency: 'GBP', settled: DateTime.new(2021,8,18,14,05))
Transaction.create!(user: user, amount_cents: '50334', description: Faker::Commerce.product_name, category: 'Taxi', account: 'Barclays', currency: 'GBP', settled: DateTime.new(2021,8,17,14,02))
Transaction.create!(user: user, amount_cents: '1234', description: Faker::Commerce.product_name, category: 'Eating Out', account: 'Barclays', currency: 'GBP', settled: DateTime.new(2021,8,16,13,05))
Transaction.create!(user: user, amount_cents: '5612', description: Faker::Commerce.product_name, category: 'Eating Out', account: 'Monzo', currency: 'GBP', settled: DateTime.new(2021,8,12,21,22))
Transaction.create!(user: user, amount_cents: '7823', description: Faker::Commerce.product_name, category: 'Groceries', account: 'Monzo', currency: 'GBP', settled: DateTime.new(2021,8,11,11,00))
Transaction.create!(user: user, amount_cents: '5000', description: Faker::Commerce.product_name, category: 'Shopping', account: 'Monzo', currency: 'GBP', settled: DateTime.new(2021,7,21,14,59))

user_2 = User.create!(email: 'test@test.com', password: '123456')
Transaction.create!(user: user_2, amount_cents: '5612',category: 'Eating Out', account: 'Monzo', currency: 'GBP', settled: DateTime.new(2021,8,18,14,05))
Transaction.create!(user: user_2, amount_cents: '7823',category: 'Groceries', account: 'Monzo', currency: 'GBP', settled: DateTime.new(2021,8,18,14,05))

puts "Seeding complete!"
