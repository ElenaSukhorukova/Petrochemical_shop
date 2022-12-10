class AddColumnLineItems < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :sum, :integer
    add_column :line_item_containers, :sum, :integer
  end
end

  