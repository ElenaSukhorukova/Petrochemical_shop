class WarehouseWorker < Employee
  has_many :order_packagings, dependent: :destroy
end
