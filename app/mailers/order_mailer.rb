class OrderMailer < ApplicationMailer
  default from: 'catzy957@gmail.com'

  def order_confirmation(order)
    
    @order = order 
    @user = @order.user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    # @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Confirmation de votre commande ##{@order.id}') 
  end
end
