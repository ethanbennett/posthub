class GithubService
  extend ServiceHelper

  def self.account_info(username)
    response = connection.get "/users/#{username}?#{keys}"
    parse(response)
  end

  def self.repositories(username)
    response = connection.get "/users/#{username}/repos?#{keys}"
    parse(response)
  end

  def self.recent_activity(uid)
  end

  def self.following(uid)
  end

  def self.organizations(uid)
  end
end