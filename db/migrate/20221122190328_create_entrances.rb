class CreateEntrances < ActiveRecord::Migration[7.0]
  def change
    create_table :entrances do |t|
      t.belongs_to :entrancable_supplier, plymorphic: true
      t.belongs_to :entrancable_item, plymorphic: true
      t.decimal :quantity
      t.decimal :entrance_price

      t.timestamps
    end
  end
end
