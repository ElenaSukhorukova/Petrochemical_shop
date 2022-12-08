class Country < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :regions, dependent: :destroy
end
