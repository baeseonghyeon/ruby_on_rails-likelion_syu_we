class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
  redirect_to main_app.root_url, :alert => exception.message
end
  
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :gitlink, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :gintlink, :image, :email, :password, :current_password])
  end
  
  def after_sign_in_path_for(resource)
    posts_path
  end
  
end



