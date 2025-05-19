class ReplaceStatusAndPriorityInTasks < ActiveRecord::Migration[7.1]
  def up
  #   # Cria as colunas de referência
  #   add_reference :tasks, :status, foreign_key: true
  #   add_reference :tasks, :priority, foreign_key: true
  #
  #   # Popula IDs com base nos valores string existentes
  #   Task.reset_column_information
  #
  #   Task.find_each do |task|
  #     status = Status.find_or_create_by!(name: task[:status])
  #     priority = Priority.find_or_create_by!(level: task[:priority])
  #     task.update_columns(status_id: status.id, priority_id: priority.id)
  #   end
  #
  #   # Remove as colunas antigas
  #   remove_column :tasks, :status, :string
  #   remove_column :tasks, :priority, :string
  #
  #   # Garante que status_id e priority_id não aceitem nulo
  #   change_column_null :tasks, :status_id, false
  #   change_column_null :tasks, :priority_id, false
  # end

  def down
    # Recria as colunas antigas
    add_column :tasks, :status, :string, default: "pending", null: false
    add_column :tasks, :priority, :string, default: "medium", null: false

    Task.reset_column_information

    Task.find_each do |task|
      task.update_columns(
        status: task.status.name,
        priority: task.priority.level
      )
    end

    remove_reference :tasks, :status
    remove_reference :tasks, :priority
  end
end
