require 'csv'
require 'townhalls_scrapper.rb'
require 'rubygems'


class AdderToDb
 def save_the_scrapper_in_csv
  CSV.open("db/database.csv", "wb") do |csv|
    @array_of_all_townhalls.each do |hashes|
      csv <<	["#{hashes[:name]}", "#{hashes[:townhall_mail]}", "#{hashes[:zip_code]"]
    end
  end
end

end 