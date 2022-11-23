class DeliveryCompanyAddress < CompanyAddress
  has_many :delivery_orders, dependent: :destroy
end
