class AddSemesterIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :semester_id, :integer
  end
end
