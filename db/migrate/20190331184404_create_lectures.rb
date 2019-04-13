class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.integer :faculty_subject_id
      t.integer :faculty_id

      t.timestamps
    end
  end
end
