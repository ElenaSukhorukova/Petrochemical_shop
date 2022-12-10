class Container < ApplicationRecord
  validates :name_container, uniqueness: true, presence: true, length: { minimum: 3 }
  validates :length, :height, :width, :weight, presence: true, numericality: true

  has_many :line_items
  has_many :line_item_containers
end
