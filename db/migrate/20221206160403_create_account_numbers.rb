class CreateAccountNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :account_numbers do |t|
      t.string :account_number
      t.string :alias
      t.references :bank, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
