class CreateDepartmentProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :department_products do |t|

      t.timestamps
    end
  end
end
