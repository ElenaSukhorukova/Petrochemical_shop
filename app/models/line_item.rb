class LineItem < ApplicationRecord
  UNITS = %w[unit kilo]
  validates :price, :quantity, presence: true, numericality: true
  validates :unit, inclusion: { in: UNITS }
  validate :unit_eq_container

  def unit_eq_container
    if self.container.present?
      unless self.unit == 'kilo' && self.container.name_container == 'kilogram'
        errors.add(:unit, 
          'should be at the same as container'
        )
      end
    end
  end

  belongs_to :source, polymorphic: true
  belongs_to :product
  belongs_to :container
end
