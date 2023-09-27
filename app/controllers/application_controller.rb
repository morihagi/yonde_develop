class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  add_flash_types :success, :info, :warning, :danger

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[agreement])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[agreement])
  end

  def after_sign_in_path_for(_resource)
    posts_path
  end
end
