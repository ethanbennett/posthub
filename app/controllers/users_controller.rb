class UsersController < ApplicationController
  before_action :set_user_variables

  def show
    @user_info       = GithubService.account_info(@username)
    @repositories    = GithubService.repositories(@username)
    @recent_activity = GithubService.recent_activity(@username)
    @following       = GithubService.following(@username)
    @organizations   = GithubService.organizations(@username)
  end

private

  def set_user_variables
    @username = session[:user]["username"]
    @image    = session[:user]["image"]
  end
end