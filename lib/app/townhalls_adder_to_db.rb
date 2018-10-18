require 'csv'
require 'townhalls_scrapper.rb'
require 'rubygems'


class AdderToDb
 def save_the_scrapper_in_csv
  towns = [
    'http://www.annuaire-des-mairies.com/seine-saint-denis.html',
    'http://www.annuaire-des-mairies.com/seine-et-marne.html',
    'http://www.annuaire-des-mairies.com/seine-et-marne.html-2', 
    'http://www.annuaire-des-mairies.com/seine-et-marne.html-2', 
    'http://www.annuaire-des-mairies.com/gard.html',
    'http://www.annuaire-des-mairies.com/gard-2.html'
  ]
  scrapper = Scrapper.new(towns)
  scrapper.array_of_all_townhalls = scrapper.compute
  CSV.open("db/database.csv", "wb") do |csv|
    scrapper.array_of_all_townhalls.each do |hashes|
      csv <<	["#{hashes[:name]}", "#{hashes[:townhall_mail]}", "#{hashes[:zip_code]}"]
    end
  end
end

end 

