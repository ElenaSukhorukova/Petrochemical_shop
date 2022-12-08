class CreateBanks < ActiveRecord::Migration[7.0]
  def change
    create_table :banks do |t|
      t.text :bank_name
      t.string :bik
      t.string :correspondent_account_number
      t.string :swift
      t.string :iban
      t.boolean :resident

      t.timestamps
    end
  end
end
