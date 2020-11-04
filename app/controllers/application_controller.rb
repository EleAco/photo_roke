class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_account_update_parameters, if: :devise_controller?

  protected

  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:profile])
  end
  

  # def configure_account_update_parameters
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:profile])
  # end
  
end
