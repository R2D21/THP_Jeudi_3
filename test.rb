$:.unshift File.expand_path("./../lib/app", __FILE__)
require 'townhalls_scrapper'

scrapper = Scrapper.new
