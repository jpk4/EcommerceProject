# frozen_string_literal: true

class DeliveryPerson < ApplicationRecord
  belongs_to :order

  validates :employee_id, :name, :order, presence: true
  validates :employee_id, numericality: { only_integer: true }
  validates :order, numericality: { only_integer: true }
end
