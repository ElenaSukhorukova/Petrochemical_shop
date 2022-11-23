class Kind < ApplicationRecord
  has_many :products, dependent: :destroy
end
