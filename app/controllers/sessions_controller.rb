class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(uid: request.env["omniauth.auth"]["uid"])
    session[:user] = user
    if user.save
      user.update(name: request.env["omniauth.auth"]["info"]["name"], image: request.env["omniauth.auth"]["info"]["image"], token: request.env["omniauth.auth"]["credentials"]["token"])
    else
      redirect_to github_login_path
    end
    redirect_to root_path
  end
end