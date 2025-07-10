class OrdersController < ApplicationController
  before_action :authenticate_user!

  def success
    flash[:notice] = "Merci pour votre commande !"
  end
end
