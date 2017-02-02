class UsersController < ApplicationController
  def show
    @user_info = GithubService.account_info
    @respositories = GithubService.repositories
  end
end