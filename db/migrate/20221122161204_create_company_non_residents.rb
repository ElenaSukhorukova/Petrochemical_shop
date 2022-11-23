class CreateCompanyNonResidents < ActiveRecord::Migration[7.0]
  def change
    create_table :company_non_residents do |t|
      t.text :legal_name_company
      t.bigint :inn
      t.bigint :kpp
      t.bigint :ogrn
      t.bigint :okpo
      t.string :okved
      t.bigint :account_number
      t.bigint :correspondent_account_number
      t.string :bank_name
      t.integer :bic
      t.string :full_name_director
      t.string :phone_number
      t.string :email
      t.string :type
      t.belongs_to :user, foreing_key: true

      t.timestamps
    end
  end
end
