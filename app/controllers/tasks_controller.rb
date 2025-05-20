class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authorize_task, only: %i[show edit update destroy]

  def index
    @project = Project.find(params[:project_id])
    @pagy, @tasks = pagy(@project.tasks, items: 2)
  end

  def show
  end

  def new
    @task = @project.tasks.build
  end

  def create
    @task = @project.tasks.build(task_params)
    @task.user = current_user
    if @task.save
      # TaskNotificationJob.perform_later(@task) # Sidekiq job
      redirect_to project_task_path(@project, @task), notice: "Tarefa criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to project_task_path(@project, @task), notice: "Tarefa atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_path(@project), notice: "Tarefa excluída com sucesso."
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(
      :title,
      :description,
      :due_date,
      :user_id,
      :status_id,
      :priority_id,
      attachments: []
    )
  end

  def authorize_task
    authorize_user_resource(@task)
  end
end