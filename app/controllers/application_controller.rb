class ApplicationController < ActionController::Base
  set_current_tenant_by_subdomain(:account, :subdomain)
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def after_sign_in_path_for(resource)
    projects_path if resource.present?
  end
end
