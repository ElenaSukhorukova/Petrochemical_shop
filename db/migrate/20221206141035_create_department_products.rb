class CreateDepartmentProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :department_products do |t|
      t.references :product, foreign_key: true
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
