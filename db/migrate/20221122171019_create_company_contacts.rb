class CreateCompanyContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :company_contacts do |t|
      t.string :full_name
      t.string :position
      t.string :email
      t.string :personal_phone_number
      t.string :work_phone_number
      t.string :additional_phone_number
      t.references :contactabable, polymorphic: true
      
      t.timestamps
    end
  end
end
