class LogisticManager < Employee
  has_many :deliveries, dependent: :destroy
end
