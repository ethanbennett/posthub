class GithubService
  extend ServiceHelper

  def self.account_info
    response = Faraday.get("https://api.github.com/user?#{keys}")
    account_info = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end

  def self.recent_activity(uid)
  end

  def self.following(uid)
  end

  def self.organizations(uid)
  end

  def self.repositories(current_user)
    response = connection.get "/users/#{current_user['username']}/repos?#{keys}"
    repositories = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end

end