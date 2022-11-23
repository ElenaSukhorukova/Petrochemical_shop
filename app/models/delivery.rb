class Delivery < ApplicationRecord
  has_one :delivery_order, dependent: :destroy
  has_one :order, dependent: :destroy
  has_one :driver, dependent: :destroy
  has_one :logistic_manager, dependent: :destroy
end
