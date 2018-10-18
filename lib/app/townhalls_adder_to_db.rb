require 'csv'
require 'townhalls_scrapper.rb'
require 'rubygems'

#Création de la classe AdderToDb

class AdderToDb

#Méthode qui enregistre les mails dans un csv

 def save_the_scrapper_in_csv
  towns = [
    'http://www.annuaire-des-mairies.com/seine-saint-denis.html',
    'http://www.annuaire-des-mairies.com/seine-et-marne.html',
    'http://www.annuaire-des-mairies.com/seine-et-marne-2.html', 
    'http://www.annuaire-des-mairies.com/seine-et-marne-3.html', 
    'http://www.annuaire-des-mairies.com/gard.html',
    'http://www.annuaire-des-mairies.com/gard-2.html'
  ]

  #On crée l'objet scrapper qui va créer l'array avec tous les hashes des mairies que l'on souhaite
  scrapper = Scrapper.new(towns)
  begin
  scrapper.array_of_emails = scrapper.compute
  rescue OpenURI::HTTPError => e
  return nil
  end 
  #Insertion des mairies, mails et départements dans un tableau csv
  CSV.open("db/database.csv", "wb") do |csv|
    scrapper.array_of_emails.each do |hashes|
      csv <<	["#{hashes[:name]}", "#{hashes[:townhall_mail]}", "#{hashes[:zip_code]}"]
    end
  end
end

end 

