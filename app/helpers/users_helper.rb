module UsersHelper

# Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def correct_user?(user)
    @user = User.find(params[:id])
    if current_user?(@user)
       link_to "Edit profile", edit_user_path(current_user)
    end
  end
end
