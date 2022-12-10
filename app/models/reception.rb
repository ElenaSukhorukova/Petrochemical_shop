class Reception < ApplicationRecord
  belongs_to :our_company, class_name: "Company", optional: true
  belongs_to :supplier, class_name: "Company", optional: true
  has_many :line_items, as: :source, dependent: :destroy
  has_many :line_item_containers, as: :source, dependent: :destroy
end

