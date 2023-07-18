class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  protected

  # ログイン後に遷移するpathを設定
  def after_sign_in_path_for(resource)
    root_path
  end

  # ログアウト後に遷移するpathを設定
  def after_sign_out_path_for(resource)
    root_path
  end
end
