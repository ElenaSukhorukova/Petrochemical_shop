class Department < ApplicationRecord
  has_many :employees

  has_many :department_products, dependent: :destroy
  has_many :products, through: :department_product, dependent: :destroy
end
