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

def random_numbers(size, upper)
  array = (1..upper).to_a.sample(size)
end

csv_groceries = Rails.root + 'db/groceries.csv'
products = CSV.parse(File.read(csv_groceries), headers: true)

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
  image = product['image']

  category = Category.where(name: parent).first_or_create
  sub = category.sub_categories.where(name: sub_category).first_or_create
  sub.products.create(name: name, current_price: price, size: size, sku: sku, qty_on_hand: qty, image: image, description: description)
end

on_sale_ids = random_numbers(products.count * 0.25, 1000)

on_sale_ids.each do |on_sale|
  product = Product.find_by(id: on_sale)
  current_price = product.current_price
  sales_price = (current_price - (current_price * 0.15)).round(2)
  product.update(sales_price: sales_price)
end

csv_provinces = Rails.root + 'db/provinces.csv'
provinces = CSV.parse(File.read(csv_provinces), headers: true)

provinces.each do |province|
  name = province['name']
  code = province['code']
  gst = province['gst']
  pst = province['pst']
  hst = province['hst']

  prov = Province.where(name: name, code: code, gst: gst, pst: pst, hst: hst).first_or_create
end
puts "Created #{Category.count} Categories."
puts "Created #{Product.count} Products."
