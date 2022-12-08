class Employee < ApplicationRecord
  include Gender

  validates :full_name, presence: true, length: { within: 2..100 }
  validates :additional_number, presence: true, length: { is: 5 }
  validates :date_birthday, presence: true
  validates :personal_phone_number, :work_phone_number, presence: true, 
    format: { 
      with: /(\d|\+\d)+\d{10}/,
      message: 'A phone number should be 11 numbers'
    }
  validates :email, presence: true, format: { with: /([\w\-\.])+@([\w\-\.]+\.)+([a-z]{2,4})/ }
  
  validate :validate_age

  def validate_age
    if date_birthday.present? && date_birthday > 18.years.ago
       errors.add(:date_birthday, 'You should be over 18 years old.')
    end
  end

  belongs_to :department
  belongs_to :user
end
