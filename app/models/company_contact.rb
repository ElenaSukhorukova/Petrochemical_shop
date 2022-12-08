class CompanyContact < ApplicationRecord
  validates :full_name, :position, presence: true, length: {minimum: 3 }
  validates :additional_phone_number, presence: true, length: { is: 5 }
  validates :personal_phone_number, :work_phone_number, presence: true, 
    format: { 
      with: /(\d|\+\d)+\d{10}/,
      message: 'A phone number should be 11 numbers'
    }
  validates :email, presence: true, format: { with: /([\w\-\.])+@([\w\-\.]+\.)+([a-z]{2,4})/ }

  belongs_to :company
end
