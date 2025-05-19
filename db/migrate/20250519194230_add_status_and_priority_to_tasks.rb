class AddStatusAndPriorityToTasks < ActiveRecord::Migration[8.0]
  def change
    add_reference :tasks, :status, foreign_key: true
    add_reference :tasks, :priority, foreign_key: true
  end
end
