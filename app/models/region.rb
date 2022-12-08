class Region < ApplicationRecord
  has_many :addresses, dependent: :destroy
  belongs_to :country
end
