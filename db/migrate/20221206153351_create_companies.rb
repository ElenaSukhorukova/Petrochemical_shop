class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.text :legal_name_company
      t.string :inn
      t.string :kpp
      t.string :ogrn
      t.string :okpo
      t.string :okved
      t.string :full_name_director
      t.string :phone_number
      t.string :email
      t.text :description
      t.boolean :resident
      t.string :type

      t.timestamps
    end
  end
end
