class Product < ApplicationRecord
  has_many :department_products, dependent: :destroy
  has_many :departments, through: :department_products, dependent: :destroy

  belongs_to :kind

  has_many :line_items, dependent: :destroy

  has_many :container_products, dependent: :destroy
  has_many :containers, through: :container_products, dependent: :destroy

  has_many :entrances, as: :entrancable_item, plymorphic: true, dependent: :destroy
  
  has_many :order_packagings, dependent: :destroy
end
