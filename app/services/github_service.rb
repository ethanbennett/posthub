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

  def self.recent_activity(username)
    response = connection.get "/users/#{username}/events?#{keys}"
    parse(response)
  end

  def self.following(username)
    response = connection.get "/users/#{username}/following?#{keys}"
    parse(response)
  end

  def self.organizations(username)
    response = connection.get "/users/#{username}/orgs?#{keys}"
    parse(response)
  end
end