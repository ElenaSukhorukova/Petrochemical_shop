class Address < ApplicationRecord
  validates :post_nubmer, :town, :street, :number_building, presence: true
  validates :post_nubmer, length: { is: 6 }, if: :is_russia?

  belongs_to :company
  belongs_to :country
  belongs_to :region

  def is_russia?
    self.country.country_name == 'Russia'
  end
end
