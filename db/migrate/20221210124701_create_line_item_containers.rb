class CreateLineItemContainers < ActiveRecord::Migration[7.0]
  def change
    create_table :line_item_containers do |t|
      t.references :container, foreign_key: true
      t.string :unit
      t.decimal :quantity
      t.decimal :price
      t.references :source, polymorphic: true
      
      t.timestamps
    end
  end
end
