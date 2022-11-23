class CompanyResident < ApplicationRecord
  belongs_to :user
  has_many :company_addresses, as: :addressadable, dependent: :destroy
  has_many :contacts, as: :contactable, dependent: :destroy
end
