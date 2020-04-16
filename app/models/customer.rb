# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :orders
  has_many :payments, through: :orders
  belongs_to :province

  validates :customer_num, :name, :shipping_address, :province, presence: true
  validates :customer_num, numericality: { only_integer: true }
  validates :password, length: { minimum: 8 }
  validates :username, uniqueness: true
end
