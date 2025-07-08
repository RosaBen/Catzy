class ProfilsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    update_params = user_params.dup
    if params[:user][:avatar].present?
    else
      update_params.delete(:avatar)
    end

    if @user.update(update_params)
      if params[:user][:avatar].present?
        flash[:notice] = "Profil et avatar mis à jour avec succès!"
      else
        flash[:notice] = "Profil mis à jour avec succès!"
      end
      redirect_to profil_path
    else
      flash[:alert] = "Erreur lors de la mise à jour du profil."
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :email)
  end
end
