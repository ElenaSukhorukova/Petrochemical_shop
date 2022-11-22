class Department < ApplicationRecord
  has_many :employees

  has_many :department_products
  has_many :products, through: :department_product
end
