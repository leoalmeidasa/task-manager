class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.string :status, null: false, default: 'pending'
      t.string :priority, null: false, default: 'medium'
      t.date :due_date
      t.references :project, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.timestamps
    end
  end
end
