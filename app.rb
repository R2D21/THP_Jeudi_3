
require 'gmail'
require 'json'


$LOAD_PATH.unshift File.expand_path('./../lib', __dir__)
require_relative './lib/app/townhalls_mailer'





Mailer.new.perform