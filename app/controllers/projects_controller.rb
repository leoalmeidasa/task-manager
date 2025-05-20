class ProjectsController < ApplicationController
  before_action :authenticate_user!, :set_project, only: %i[show edit update destroy]
  before_action :authorize_project, only: %i[show edit update destroy]

  def index
    @projects = current_user.projects
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      redirect_to @project, notice: 'Projeto criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Projeto atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      redirect_to projects_path, notice: 'Projeto excluído com sucesso.'
    else
      redirect_to projects_path, alert: 'Falha ao excluir o projeto.'
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Projeto não encontrado."
    redirect_to projects_path
  end

  def authorize_project
    authorize_user_resource(@project)
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end