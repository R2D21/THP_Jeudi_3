require 'twitter'
require 'dotenv'
require 'pry'
Dotenv.load


# quelques lignes qui enregistrent les clés d'APIs
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_API_KEY"]
    config.consumer_secret     = ENV["TWITTER_API_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
  @client = client

def extract_data

  fichier = File.read('./db/town_halls.json') #lecture du fichier to_json
  new_hash = JSON.parse(fichier) #transportation(parsing) des données

  # création d'un tableau avec le nom des villes
  names = []
  new_hash.keys.each do |k|
    names << k
  end
  @names = names

end

def search_accounts


  users = []
  @names.each do |name|

    begin
      if @client.user_search(name)[0] == nil
        users << " "
      else
        users << @client.user_search(name)[0]
      end
    rescue Twitter::Error::TooManyRequests, Twitter::Error::BadRequest, Twitter::Error::NotFound
      next
    end
  end

  @users = users

end

def follow_accounts(users) #follow les differents comptes Twitter

  begin
    @users.each do |user|
      @client.follow(user)

    rescue Twitter::Error::TooManyRequests, Twitter::Error::BadRequest, Twitter::Error::NotFound
      next
    end
  end
end

def perform
  extract_data
  search_accounts
  follow_accounts(search_accounts)
end

perform
