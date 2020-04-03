# frozen_string_literal: true

class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :order, :product, :qty_ordered, :sales_price, presence: true
  validates :sales_price, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than_or_equal_to: 0 }
  validates :qty_ordered, numericality: { only_integer: true }
end
