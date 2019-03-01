class AddDepartmentIdToSemesters < ActiveRecord::Migration[5.2]
  def change
    add_column :semesters, :department_id, :integer
  end
end
