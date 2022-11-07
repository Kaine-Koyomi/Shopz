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
    return Favorite.where(:product_id => id, :user_id => current_user.id).first ? '<i class="bi bi-heart-fill"></i>': '<i class="bi bi-heart"></i>'
  end
end
