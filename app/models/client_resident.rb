class ClientResident < CompanyResident
  has_many :orders, as: :orderable, polymorphic: true, dependent: :destroy
end
