class LineItemContainer < ApplicationRecord
  UNITS = %w[unit]
  validates :price, presence: true, numericality: true
  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :unit, inclusion: { in: UNITS }

  belongs_to :source, polymorphic: true
  belongs_to :container
end
