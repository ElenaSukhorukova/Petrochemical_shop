class Container < ApplicationRecord
  has_many :container_products, dependent: :destroy
  has_many :products, through: :container_products, dependent: :destroy
  has_many :order_packagings, dependent: :destroy

end
