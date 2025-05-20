class TasksController < ApplicationController
  before_action :set_project, :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authorize_task, only: %i[show edit update destroy]

  def index
    @task = Project.find(params[:project_id]).tasks
  end

  def show
  end

  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build
  end

  def create
    @project = Project.find(params[:project_id])
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
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to projects_path, notice: 'Task excluído com sucesso.'
    else
      redirect_to projects_path, alert: 'Falha ao excluir o task.'
    end
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