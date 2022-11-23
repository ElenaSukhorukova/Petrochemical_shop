class LineItem < ApplicationRecord
  belongs_to :itematable, polymorphic: true
  belongs_to :product
end
