module SessionsHelper
  def update_user_information(user, info)
    user.update(name: info["info"]["name"], 
                image: info["info"]["image"],
                token: info["credentials"]["token"],
                username: info["info"]["nickname"])
  end

  def valid_user?(user, info)
    if user.save
      update_user_information(user, info)
      redirect_to user_path(user)
    else
      redirect_to github_login_path
    end
  end
end