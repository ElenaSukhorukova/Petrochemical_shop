class DeliveryOrder < ApplicationRecord
  has_one :delivery_order, dependent: :destroy
end
