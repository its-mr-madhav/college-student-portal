class CreateStudentLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :student_lectures do |t|
      t.integer :student_id
      t.integer :lecture_id

      t.timestamps
    end
  end
end
