class CreateTimeTables < ActiveRecord::Migration[5.2]
  def change
    create_table :time_tables do |t|
      t.integer :days
      t.integer :lecture_id
      t.string :period

      t.timestamps
    end
  end
end
