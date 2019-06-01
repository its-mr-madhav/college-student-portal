class CreateTimeTables < ActiveRecord::Migration[5.2]
  def change
    create_table :time_tables do |t|
      t.integer :days
      t.string :period

      t.timestamps
    end
  end
end
