class Entrance < ApplicationRecord
  belongs_to :entrancable_supplier, plymorphic: true
  belongs_to :entrancable_item, plymorphic: true
end
