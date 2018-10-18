$:.unshift File.expand_path("./../lib/app", __FILE__)
require "bundler"
require "townhalls_scrapper.rb"
require 'open-uri'
require "townhalls_adder_to_db.rb"


#add = AdderToDb.new 
#add.save_the_scrapper_in_csv
