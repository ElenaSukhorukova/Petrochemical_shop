class Employee < ApplicationRecord
  belongs_to :department
  belongs_to :users
end
