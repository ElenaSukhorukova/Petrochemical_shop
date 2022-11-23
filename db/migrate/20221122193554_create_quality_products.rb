class CreateQualityProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :quality_products do |t|
      t.belongs_to :entrence
      t.belongs_to :product
      t.decimal :quality_products # not in a container

      t.timestamps
    end
  end
end
