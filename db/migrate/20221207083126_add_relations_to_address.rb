class AddRelationsToAddress < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :country, foreign_key: true
    add_reference :addresses, :region, foreign_key: true
  end
end
