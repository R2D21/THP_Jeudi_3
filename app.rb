
require 'gmail'
require 'json'


$LOAD_PATH.unshift File.expand_path('./../lib', __dir__)
require_relative './lib/app/townhalls_mailer'
require_relative './lib/app/townhalls_scrapper'


puts 'Welcome! First of all, let me scrap the emails of all town halls of the 10th department...'
puts '(it may take few minutes depending on your connection, sorry)'

save_cities

puts ' =======> the files has been saved on ./lib/town_halls.json'





# Mailer.new.perform