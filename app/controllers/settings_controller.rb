class SettingsController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def update
    if Current.user.update(user_params)
      redirect_to Current.user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :biography)
  end
end