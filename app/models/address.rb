class Address < ApplicationRecord
  validates :post_number, :town, :street, :number_building, presence: true
  validates :post_number, length: { is: 6 }, if: :is_russia?

  belongs_to :country
  belongs_to :region

  def is_russia?
    self.country.country_name == 'Russia'
  end
end
