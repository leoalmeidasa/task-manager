class ApplicationController < ActionController::Base
  set_current_tenant_by_subdomain(:account, :subdomain)
  allow_browser versions: :modern
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    projects_path if resource.present?
  end

  private

  def authorize_user_resource(resource)
    unless resource.user_id == current_user.id
      flash[:alert] = "Você não tem permissão para acessar este recurso."
      redirect_to projects_path
    end
  end
end