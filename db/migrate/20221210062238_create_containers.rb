class CreateContainers < ActiveRecord::Migration[7.0]
  def change
    create_table :containers do |t|
      t.string :name_container
      t.decimal :length
      t.decimal :height
      t.decimal :width
      t.decimal :weight
      t.text :description

      t.timestamps
    end
    add_reference :line_items, :container, foreign_key: true
    add_column :line_items, :unit, :string 
  end
end
