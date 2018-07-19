
require 'gmail'
require 'json'


$LOAD_PATH.unshift File.expand_path('./../lib', __dir__)
require_relative './lib/app/townhalls_mailer'
require_relative './lib/app/townhalls_scrapper'




save_cities
# Mailer.new.perform