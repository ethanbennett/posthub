module ServiceHelper
  def connection
    Faraday.new(url: "https://api.github.com")
  end

  def keys
    "client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}"
  end
end