class Department < ApplicationRecord
  validates :name_department, :description, presence: true, length: { minimum: 3 }
  
  has_many :employees, dependent: :destroy

  has_many :department_products, dependent: :destroy
  has_many :products, through: :department_products
end
