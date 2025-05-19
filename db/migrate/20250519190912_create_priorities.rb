class CreatePriorities < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:priorities)
      create_table :priorities do |t|
        t.string :level

        t.timestamps
      end
      add_index :priorities, :level, unique: true
    end
  end
end
