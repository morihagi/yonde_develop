class UsersController < ApplicationController
  # skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "登録が完了しました！"
      redirect_to @user
    else
      flash.now[:danger] = "登録できませんでした。"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :agreement)
  end
end
