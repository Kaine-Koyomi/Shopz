module ApplicationHelper
  def user_avatar(user)
    if user.avatar?
        avatar= user.avatar.url
    else
        avatar ="https://cvhrma.org/wp-content/uploads/2015/07/default-profile-photo.jpg"
    end
    image_tag avatar, class: "rounded-circle img-fluid",  style: "width: 140px;"
  end

  def isfavorite(id)
    @favorites.each do |favorite|
      favorite.product_id === id ? "salve" : "eita"
    end
  end
end
