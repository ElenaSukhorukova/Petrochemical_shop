class Cart < ApplicationRecord
  has_many :line_items, as: :itematable, dependent: :destroy
end
