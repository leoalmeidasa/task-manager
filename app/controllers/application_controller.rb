class ApplicationController < ActionController::Base
  set_current_tenant_by_subdomain(:account, :subdomain)
  allow_browser versions: :modern
  before_action :authenticate_user!

  # Adiciona headers para evitar problemas de CORS
  before_action :set_cors_headers

  def after_sign_in_path_for(resource)
    projects_path if resource.present?
  end

  private

  def set_cors_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, PATCH, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def authorize_user_resource(resource)
    unless resource.user_id == current_user.id
      flash[:alert] = "Você não tem permissão para acessar este recurso."
      redirect_to projects_path
    end
  end
end