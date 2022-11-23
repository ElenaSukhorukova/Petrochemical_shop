class CreateContainerProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :container_products do |t|
      t.belongs_to :product
      t.belongs_to :container
      t.decimal :quantity
      
      t.timestamps
    end
  end
end
