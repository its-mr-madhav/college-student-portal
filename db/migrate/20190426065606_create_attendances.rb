class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.boolean :present
      t.integer :lecture_id
      t.integer :user_id

      t.timestamps
    end
  end
end
