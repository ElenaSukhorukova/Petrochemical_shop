class CreateReceptions < ActiveRecord::Migration[7.0]
  def change
    create_table :receptions do |t|
      t.references :our_company, index: true, foreign_key: { to_table: :companies }
      t.references :supplier, index: true, foreign_key: { to_table: :companies }
      t.boolean :confirmation, default: false

      t.timestamps
    end
  end
end
