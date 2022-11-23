class Order < ApplicationRecord
  VALID_STATUS = ['actual', 'canceled', 'accomplished']

  has_many :line_items, as: :itematable, dependent: :destroy
  belongs_to :orderable, polymorphic: true
  has_one :delivery_order, dependent: :destroy
end
