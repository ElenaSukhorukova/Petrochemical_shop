class AccountNumber < ApplicationRecord
  validates :account_number, uniqueness: true, presence: true, length: { is: 20 }
  validate :resident

  belongs_to :company
  belongs_to :bank

  def resident 
    unless self.bank.resident == self.company.resident
      errors.add(:bank_id, 
        'of the account number should be has the same residential status as the company'
      )
    end
  end
end
