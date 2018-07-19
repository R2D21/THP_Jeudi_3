# ligne très importante qui appelle la gem. Sans elle, le programme ne saura pas appeler Twitter
require 'twitter'
require 'dotenv'
require 'pry'
require 'twitter_search'
Dotenv.load

# quelques lignes qui enregistrent les clés d'APIs
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

def search_accounts

  towns : []

  towns.each do |town|git checkou

  end

end


def follow_accounts #follow les differents comptes Twitter

  towns_accounts.each do |account|
    client.follow(account)
  end
end
