# ligne très importante qui appelle la gem. Sans elle, le programme ne saura pas appeler Twitter
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
# fichier = File.read('.fichier.json') #lecture du fichier to_json
# obj_hash = JSON.parse(fichier) #transportation(parsing) des données en JavaScript Obj)
# users_twt = []

def search_accounts

  names = ["bordeaux", "marseille", "aubervilliers"]
  users = []
  names.each do |name|
    if @client.user_search(name)[0] == nil
      users << " "
    else
      users << @client.user_search(name)[0]
  end

end
  @users = users
  # #envoie les comptes Twitter dans le fichier json
  # File.open("./db/...json", "w") do |f|
  #   f.write(obj.to_json)
  # end

end


def follow_accounts(users) #follow les differents comptes Twitter

  @users.each do |user|
    @client.follow(user)
  end
end

def perform
  search_accounts
  follow_accounts(search_accounts)
end

perform
