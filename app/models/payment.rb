# frozen_string_literal: true

class Payment < ApplicationRecord
  has_many :orders
  has_many :customers, through: :orders

  validates :card_number, :card_type, :billing_address, :expiry_month, :expiry_year, :cvv_code, presence: true
  validates :card_number, numericality: { only_integer: true }
  validates :expiry_month, numericality: { only_integer: true }
  validates :expiry_year, numericality: { only_integer: true }
  validates :cvv_code, numericality: { only_integer: true }
  validates :card_number, length: {is: 16}
end
