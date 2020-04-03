# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :orders
  has_many :payments, through: :orders
end
