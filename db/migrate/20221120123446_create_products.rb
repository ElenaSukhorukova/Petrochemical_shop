class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :discount, default: 0
      t.text :description
      t.belongs_to :kind

      t.timestamps
    end
  end
end
