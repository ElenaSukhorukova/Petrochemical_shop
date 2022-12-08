class Bank < ApplicationRecord
  validates :resident, inclusion: [true, false]
  validates :bank_name, presence: true, length: { minimum: 3 }
  validates :correspondent_account_number, uniqueness: true,
             presence: true, length: { is: 20 }, if: :is_resident?
  validates :bik, presence: true, uniqueness: true, length: { is: 9 }, if: :is_resident?
  validates :swift, uniqueness: true, presence: true, length: { is: 11 }, unless: :is_resident?
  validates :iban, uniqueness: true, presence: true, length: { maximum: 34 }, unless: :is_resident?

  has_many :account_numbers, dependent: :destroy

  def is_resident?
    self.resident == true
  end
end
