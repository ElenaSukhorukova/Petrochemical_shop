class Driver < Employee
  has_many :deliveries, dependent: :destroy
end
