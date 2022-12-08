class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :post_nubmer
      t.string :town
      t.string :street
      t.string :number_building
      t.text :description
      t.string :type
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
