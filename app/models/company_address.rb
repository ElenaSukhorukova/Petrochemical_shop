class CompanyAddress < ApplicationRecord
  belongs_to :addressable, polymorphic: true
end
