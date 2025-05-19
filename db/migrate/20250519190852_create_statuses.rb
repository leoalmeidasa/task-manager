class CreateStatuses < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:statuses)
      create_table :statuses do |t|
        t.string :name

        t.timestamps
      end
      add_index :statuses, :name, unique: true
    end
  end
end
