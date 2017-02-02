class UsersController < ApplicationController
  before_action :set_username

  def show
    @user_info = GithubService.account_info(@username)
    @repositories = GithubService.repositories(@username)
  end

private

  def set_username
    @username = session[:user]["username"]
  end
end