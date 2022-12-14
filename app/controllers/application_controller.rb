class ApplicationController < ActionController::Base
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  include CartsHelper

  private

  def record_not_found
    render file: "#{Rails.root}/public/404.html",
           status: 404,
           layout: false
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :role])
  end

end
