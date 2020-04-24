# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :orders
  has_many :payments, through: :orders
  # belongs_to :province

  validates :name, :shipping_address, :province, presence: true
  # validates :password, length: { minimum: 8 }
  # validates :username, uniqueness: true
end
