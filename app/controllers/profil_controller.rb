class ProfilController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :email, :password, :password_confirmation, :fullname)
  end
end
