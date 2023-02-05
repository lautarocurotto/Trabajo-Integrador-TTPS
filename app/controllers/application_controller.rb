class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :home, :alert => exception.message
  end

  rescue_from SQLite3::ConstraintException do |exception|
    redirect_to :home, :alert => exception.message
  end

  def configure_permitted_parameters
    attributes = [:role]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
