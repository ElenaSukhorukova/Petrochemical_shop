class ClientNonResident < CompanyNonResident
  has_many :orders, as: :orderable, polymorphic: true, dependent: :destroy
end
