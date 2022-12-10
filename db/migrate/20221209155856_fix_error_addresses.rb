class FixErrorAddresses < ActiveRecord::Migration[7.0]
  def change
    remove_column :addresses, :post_nubmer, :string
    add_column :addresses, :post_number, :string
  end
end
