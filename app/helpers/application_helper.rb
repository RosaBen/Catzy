module ApplicationHelper
  def user_avatar_image(user, options = {})
    if user.avatar.attached?
      # Si l'utilisateur a un avatar attaché via Active Storage
      image_tag user.avatar, options
    elsif user.respond_to?(:avatar_url) && user.avatar_url.present?
      # Si l'utilisateur a une URL d'avatar
      if user.avatar_url.start_with?("http")
        # URL externe
        image_tag user.avatar_url, options.merge(onerror: "this.style.display='none'")
      else
        # Asset local
        image_tag user.avatar_url, options
      end
    else
      # Avatar par défaut
      image_tag "default-avatar.png", options.merge(alt: "Avatar par défaut")
    end
  rescue
    # En cas d'erreur, afficher un avatar par défaut
    image_tag "https://via.placeholder.com/150x150?text=Avatar", options.merge(alt: "Avatar par défaut")
  end
end
