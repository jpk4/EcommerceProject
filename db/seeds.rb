# frozen_string_literal: true

require 'csv'

# if Rails.env.development?
#   AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
# end

OrderProduct.destroy_all
DeliveryPerson.destroy_all
Product.destroy_all
Category.destroy_all
Order.destroy_all
Customer.destroy_all
Payment.destroy_all

csv_file = Rails.root + 'db/groceries.csv'
products = CSV.parse(File.read(csv_file), headers: true)

products.each do |product|
  parent = product['parent category']
  sub_category = product['category']
  name = product['name']
  price = product['price']
  description = product['description']
  size = product['size']
  sku = product['sku']
  sku = sku[6..-1]
  qty = rand(150)
  image = 'placeholder-300x300.jpg'

  category = Category.where(name: parent).first_or_create
  sub = category.sub_categories.where(name: sub_category).first_or_create
  sub.products.create(name: name, current_price: price, size: size, sku: sku, qty_on_hand: qty, image: image, description: description)
end

puts "Created #{Category.count} Categories."
puts "Created #{Product.count} Products."
