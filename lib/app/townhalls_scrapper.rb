require 'nokogiri'
require 'open-uri'
require 'rubygems'


class Scrapper
	attr_accessor :array_of_emails, :array_of_all_townhalls

	def initialize
    @array_of_emails = []
  end
  
	#Méthode pour récupérer l'adresse email d'une mairie à partir de sa page
	def get_the_email_of_a_townhall_from_its_webpage(page_url)
		data = Nokogiri::HTML(open(page_url))
		data.xpath("/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]").each do |node|
		return node.text
		end
	end

	#Méthode pour récupérer les liens de pages relatives à chaque mairie et qui exécuter la première méthode sur la base des liens récupérés
	def get_all_the_urls_of_region_townhalls(page_url,zip)
		get_townhalls_URL = Nokogiri::HTML(open(page_url))
		get_townhalls_URL.xpath('//a[@class = "lientxt"]').each do |url| #Solution avec XPATH autrement au-dessus en commentrequire "spreadsheet_manager.rb"
			link = url['href']
			link[0] = '' #On enlève les points sur les URLs récupérées
			link = "http://annuaire-des-mairies.com#{link}" #On formatte au bon format d'URL
      hash_townhall_info = {:name => url.text, :townhall_mail => get_the_email_of_a_townhall_from_its_webpage(link), :zip_code => zip} #Création de hash
      @array_of_emails.push(hash_townhall_info)
      end
      return @array_of_emails
    end 
   # def put_them_in_array
   # end 
  
  
  def compute
    scrapper93 = Scrapper.new 
    scrapper77= Scrapper.new 
    scrapper30 = Scrapper.new 
    @array_of_all_townhalls = scrapper93.get_all_the_urls_of_region_townhalls('http://www.annuaire-des-mairies.com/seine-saint-denis.html',93) + scrapper77.get_all_the_urls_of_region_townhalls('http://www.annuaire-des-mairies.com/seine-et-marne.html',77) + scrapper93.get_all_the_urls_of_region_townhalls('http://www.annuaire-des-mairies.com/gard.html',30)
    return @array_of_all_townhalls = @array_of_all_townhalls.flatten     
  end  

  end