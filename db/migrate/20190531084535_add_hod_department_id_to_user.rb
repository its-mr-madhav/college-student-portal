class AddHodDepartmentIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hod_department_id, :integer
  end
end
