class AddReferenceEmployeesDepartment < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :department, foreing_key: true 
  end
end
