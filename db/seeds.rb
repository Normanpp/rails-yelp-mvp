require 'faker'

10.times do
  categories = %w[chinese italian japanese french belgian]
  r = Restaurant.new
  r.name = Faker::Restaurant.name
  r.phone_number = Faker::PhoneNumber.cell_phone
  r.address = Faker::Address.full_address
  r.category = categories.sample
  r.save
end
