class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.boolean :payed, default: false
      t.boolean :ready_to_delivery, default: false
      t.boolean :sent, default: false
      t.boolean :documents_was_recieved, default: false
      t.string :status
      t.text :comment
      t.references :orderable, polymorphic: true

      t.timestamps
    end
  end
end
