class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.date :date_bithday
      t.string :personal_phone_number
      t.string :work_phone_number
      t.integer :additional_number
      t.text :about
      t.string :type

      t.timestamps
    end
  end
end
