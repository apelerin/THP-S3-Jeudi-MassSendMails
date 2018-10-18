$:.unshift File.expand_path("./../lib/app", __FILE__)
require "bundler"
require "townhalls_scrapper.rb"
require 'open-uri'

#require "townhalls_adder_to_db.rb"


#add = AdderToDb.new 
#add.save_the_scrapper_in_csv

towns = [
  'http://www.annuaire-des-mairies.com/seine-saint-denis.html',
  'http://www.annuaire-des-mairies.com/seine-et-marne.html',
  'http://www.annuaire-des-mairies.com/seine-et-marne-2.html', 
  'http://www.annuaire-des-mairies.com/seine-et-marne-3.html', 
  'http://www.annuaire-des-mairies.com/gard.html',
  'http://www.annuaire-des-mairies.com/gard-2.html'
]

scrapper = Scrapper.new(towns)
puts scrapper.compute