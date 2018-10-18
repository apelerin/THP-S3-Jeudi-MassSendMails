$:.unshift File.expand_path("./../lib/app", __FILE__)
require "bundler"
require "townhalls_scrapper.rb"
#require "townhalls_adder_to_db.rb"


#scrapper93 = Scrapper.new
#puts scrapper93.get_all_the_urls_of_region_townhalls('http://www.annuaire-des-mairies.com/seine-saint-denis.html',93)

scrapper = Scrapper.new 
scrapper.array_of_all_townhalls = scrapper.compute
puts scrapper.array_of_all_townhalls

#add = AdderToDb.new 
#add.save_the_scrapper_in_csv