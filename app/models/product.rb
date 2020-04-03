# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products
  has_many :orders, through: :order_products

  validates :product_id, :sku, :current_price, :description, :category, presence: true
  validates :qty_on_hand, numericality: { only_integer: true }
  validates :sku, numericality: { only_integer: true }
  validates :current_price, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0 }
  validates_format_of :image, with: /\.(png|jpg|jpeg)$/
end
