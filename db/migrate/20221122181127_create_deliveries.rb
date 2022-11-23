class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.belongs_to :delivery_order, foreing_key: true
      t.belongs_to :order, foreing_key: true
      t.belongs_to :driver, foreing_key: true
      t.belongs_to :logistic_manager, foreing_key: true
      t.decimal :rate
      t.text :comments
      t.date :data_delivery
      t.string :status

      t.timestamps
    end
  end
end
