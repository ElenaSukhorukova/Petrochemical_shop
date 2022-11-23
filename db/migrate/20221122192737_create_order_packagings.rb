class CreateOrderPackagings < ActiveRecord::Migration[7.0]
  def change
    create_table :order_packagings do |t|
      t.belongs_to :container, foreing: true
      t.belongs_to :product, foreing: true
      t.belongs_to :supply_manager, foreing: true
      t.belongs_to :warehouse_worker, foreing: true
      t.decimal :quality_container
      t.string :status

      t.timestamps
    end
  end
end
