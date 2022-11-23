class CreateContainers < ActiveRecord::Migration[7.0]
  def change
    create_table :containers do |t|
      t.string :name_container
      t.string :description
      t.decimal :price
      t.decimal :length
      t.decimal :height
      t.decimal :width
      t.decimal :weight

      t.timestamps
    end
  end
end
