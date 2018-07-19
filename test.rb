$:.unshift File.expand_path("./../lib", __FILE__)
require 'scrapper'
scrapper = Scrapper.new("http://annuaire-des-mairies.com/")
country = ["val-de-marne", "gironde"]
links = scrapper.scrapping(country)
country = ["aube"]
links += scrapper.scrapping(country)
links.each do |link|
  puts link
end
