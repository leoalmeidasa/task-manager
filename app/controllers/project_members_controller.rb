class ProjectMembersController < ApplicationController
    before_action :set_project
    before_action :authorize_project_owner, only: [:new, :create, :destroy]

    def index
      @project_members = @project.project_members.includes(:user)
    end

    def new
      @project_member = @project.project_members.build
      @available_users = User.where.not(id: @project.members.pluck(:id)).where.not(id: @project.user_id)
    end

    def create
      @project_member = @project.project_members.build(project_member_params)

      if @project_member.save
        redirect_to project_project_members_path(@project), notice: "Membro adicionado com sucesso ao projeto."
      else
        @available_users = User.where.not(id: @project.members.pluck(:id)).where.not(id: @project.user_id)
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @project_member = @project.project_members.find(params[:id])
      @project_member.destroy

      redirect_to project_project_members_path(@project), notice: "Membro removido do projeto com sucesso."
    end

    private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def project_member_params
      params.require(:project_member).permit(:user_id)
    end

    def authorize_project_owner
      unless @project.user_id == current_user.id
        flash[:alert] = "Apenas o proprietário do projeto pode gerenciar membros."
        redirect_to project_path(@project)
      end
    end
  end
