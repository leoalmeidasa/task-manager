class ReplaceStatusAndPriorityInTasks < ActiveRecord::Migration[7.1]
  def up
    # Só adiciona as referências se ainda não existirem
    unless column_exists?(:tasks, :status_id)
      add_reference :tasks, :status, foreign_key: true
    end

    unless column_exists?(:tasks, :priority_id)
      add_reference :tasks, :priority, foreign_key: true
    end

    # Só realiza a migração se as colunas antigas ainda existirem
    if column_exists?(:tasks, :status) && column_exists?(:tasks, :priority)
      # Atualiza os dados
      Task.reset_column_information

      Task.find_each do |task|
        status = Status.find_or_create_by!(name: task[:status])
        priority = Priority.find_or_create_by!(level: task[:priority])
        task.update_columns(status_id: status.id, priority_id: priority.id)
      end

      # Remove as colunas antigas
      remove_column :tasks, :status
      remove_column :tasks, :priority
    end

    # Torna as colunas obrigatórias, se existirem
    change_column_null :tasks, :status_id, false if column_exists?(:tasks, :status_id)
    change_column_null :tasks, :priority_id, false if column_exists?(:tasks, :priority_id)
  end

  def down
    # Recria as colunas antigas se não existirem
    unless column_exists?(:tasks, :status)
      add_column :tasks, :status, :string, default: "pending", null: false
    end

    unless column_exists?(:tasks, :priority)
      add_column :tasks, :priority, :string, default: "medium", null: false
    end

    Task.reset_column_information

    Task.find_each do |task|
      if task.status && task.priority
        task.update_columns(
          status: task.status.name,
          priority: task.priority.level
        )
      end
    end

    # Remove as referências se existirem
    remove_reference :tasks, :status, foreign_key: true if column_exists?(:tasks, :status_id)
    remove_reference :tasks, :priority, foreign_key: true if column_exists?(:tasks, :priority_id)
  end
end
