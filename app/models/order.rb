# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :payment
  has_many :order_products
  has_many :products, through: :order_products
end
