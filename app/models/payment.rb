# frozen_string_literal: true

class Payment < ApplicationRecord
  has_many :orders
  has_many :customers, through: :orders
end
