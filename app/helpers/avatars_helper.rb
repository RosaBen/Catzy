module AvatarsHelper
  def user_avatar_image(user, options = {})
    default_options = { alt: "Avatar de #{user.fullname}" }
    options = default_options.merge(options)

    if user.avatar.attached?
      image_tag user.avatar, options
    else
      image_tag "pexels-pixabay-416160.jpg", options.merge(alt: "Avatar par défaut")
    end
  rescue
    image_tag "https://via.placeholder.com/150x150?text=Avatar", options.merge(alt: "Avatar par défaut")
  end
end
