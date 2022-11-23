class SupplierResident < CompanyResident
  has_many :entrances, as: :entrancable_supplier, plymorphic: true, dependent: :destroy
end
