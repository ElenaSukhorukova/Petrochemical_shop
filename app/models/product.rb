class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }

  belongs_to :kind
  has_many :department_products
  has_many :departments, through: :department_products
  has_many :line_items, as: :product, dependent: :destroy
end
