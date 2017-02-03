class SessionsController < ApplicationController
  include SessionsHelper

  def create
    info = request.env["omniauth.auth"]
    user = User.find_or_create_by(uid: info["uid"])
    session[:user] = user
    valid_user?(user, info)
  end
end