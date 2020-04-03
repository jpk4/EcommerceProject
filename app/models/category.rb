# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products

  validates :name, :category_id, presence: true
  validates :category_id, numericality: { only_integer: true }
  validates_associated :products
end
