require 'nokogiri'
require 'open-uri'
require 'rubygems'

get_townhalls_URL = Nokogiri::HTML(open('http://www.annuaire-des-mairies.com/seine-saint-denis.html'))
 hash_townhall_info = {:name => , :townhall_mail => , :zip_code => zip} #Création de hash
 get_townhalls_URL.xpath('/html/body/table/tbody/tr[3]/td/table/tbody/tr/td[1]/table[1]/tbody/tr[1]/td/font/b/a').each do |zipcode|
   zip = zipcode.text 
   zip = zip.pop
   puts zip 
   hash_townhall_info[:zip_code] = zip 
  end

  #puts hash_townhall_info

