class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.references :product, foreign_key: true
      t.decimal :quantity
      t.decimal :price
      t.references :source, polymorphic: true
      
      t.timestamps
    end
  end
end
