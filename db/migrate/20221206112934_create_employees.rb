class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.date :date_birthday
      t.string :gender
      t.string :personal_phone_number
      t.string :work_phone_number
      t.integer :additional_number
      t.text :about
      t.string :type
      t.references :department, foreing_key: true 
      t.references :user, foreing_key: true

      t.timestamps
    end
  end
end
