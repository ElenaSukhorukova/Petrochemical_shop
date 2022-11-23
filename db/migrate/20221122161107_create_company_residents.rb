class CreateCompanyResidents < ActiveRecord::Migration[7.0]
  def change
    create_table :company_residents do |t|
      t.text :legal_name_company
      t.bigint :account_number
      t.bigint :correspondent_account_number
      t.text :bank_name
      t.integer :bic
      t.string :sqift
      t.string :iban
      t.string :full_name_director
      t.string :phone_number
      t.string :email
      t.string :type
      t.belongs_to :user, foreing_key: true
      
      t.timestamps
    end
  end
end
