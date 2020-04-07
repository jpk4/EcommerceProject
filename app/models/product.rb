# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products
  has_many :orders, through: :order_products

  validates :sku, :current_price, :name, presence: true
  validates :qty_on_hand, numericality: { only_integer: true }
  validates :current_price, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than_or_equal_to: 0 }

  paginates_per 24
end
