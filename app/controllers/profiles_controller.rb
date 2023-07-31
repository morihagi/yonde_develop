class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit edit_for_goods update ]

  def show; end

  def edit; end

  def edit_for_goods; end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, notice: t('defaults.message.updated', item: Profile.model_name.human)
    else
      flash.now['alert'] = t('defaults.message.not_updated', item: Profile.model_name.human)
      render :edit_for_goods, status: :unprocessable_entity
      # render :edit, status: :unprocessable_entity if controller_name == 'profiles#edit'
      # render :edit_for_goods, status: :unprocessable_entity if controller_name == 'profiles#edit_for_goods'
    end
  end

  private

  def set_profile
    @profile = current_user&.profile
  end

  def profile_params
    params.require(:profile).permit(:email_for_post, :zip_code, :prefecture, :city, :other_address, :radio_name, :phone, :legal_name)
  end
end
