class CreateDeliveryOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_orders do |t|
      t.belongs_to :order, foreing_key: true
      t.belongs_to :delivery_company_address, foreing_key: true
      t.date :wished_date_deliver
      t.text :details
      
      t.timestamps
    end
  end
end
