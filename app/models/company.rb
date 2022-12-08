class Company < ApplicationRecord
  validates :resident, inclusion: [true, false]
  validates :legal_name_company, presence: true, length: { minimum: 3 }
  validates :inn, uniqueness: true, presence: true, length: { is: 12 }, if: :is_resident?
  validates :kpp, uniqueness: true, presence: true, length: { is: 9 }, if: :is_resident?
  validates :okpo, uniqueness: true, presence: true, length: { is: 10 }, if: :is_resident?
  validates :ogrn, uniqueness: true, presence: true, length: { is: 13 }, if: :is_resident?
  validates :okved, uniqueness: true, presence: true, length: { is: 5 }, if: :is_resident?
  validates :full_name_director,  presence: true, length: { minimum: 3}
  validates :phone_number, presence: true, 
    format: { 
      with: /(\d|\+\d)+\d{10}/,
      message: 'A phone number should be 11 numbers'
    }
  validates :email, presence: true, format: { with: /([\w\-\.])+@([\w\-\.]+\.)+([a-z]{2,4})/ }

  def is_resident?
    self.resident == true
  end

  has_many :account_numbers, dependent: :destroy
  has_one :post_address, dependent: :destroy
  has_one :legal_address, dependent: :destroy
  has_many :delivery_addresses, dependent: :destroy
  has_many :company_contacts, dependent: :destroy

  accepts_nested_attributes_for :account_numbers, allow_destroy: true
  accepts_nested_attributes_for :legal_address, :post_address, update_only: true
end
