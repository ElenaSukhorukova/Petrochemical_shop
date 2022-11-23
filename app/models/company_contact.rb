class CompanyContact < ApplicationRecord
  belongs_to :contactabable, polymorphic: true
end
