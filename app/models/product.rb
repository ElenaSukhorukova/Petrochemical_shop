class Product < ApplicationRecord
  has_many :department_products
  has_many :departments, through: :department_products
end
