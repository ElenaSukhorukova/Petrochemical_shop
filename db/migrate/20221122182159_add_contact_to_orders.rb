class AddContactToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :contact, foreing_key: true
  end
end
