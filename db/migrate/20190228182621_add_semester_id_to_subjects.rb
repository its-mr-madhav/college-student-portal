class AddSemesterIdToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :semester_id, :integer
  end
end
