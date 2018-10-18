require 'nokogiri'
require 'open-uri'
require 'rubygems'
require 'pry'



class Scrapper
	attr_accessor :array_of_emails, :array_of_all_townhalls, :page_url, :zip, :array_urls

	def initialize(array_urls)
    @array_urls = array_urls
    @array_of_emails = []
  end

	#Méthode pour récupérer l'adresse email d'une mairie à partir de sa page
  def get_the_email_of_a_townhall_from_its_webpage(page_url) 
    begin
    data = Nokogiri::HTML(open(page_url))
    rescue OpenURI::HTTPError => e
    return nil
    end 
		data.xpath("/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]").each do |node|
		return node.text
		end
	end

	#Méthode pour récupérer les liens de pages relatives à chaque mairie et qui exécuter la première méthode sur la base des liens récupérés
	def get_all_the_urls_of_region_townhalls(page_url)
		get_townhalls_URL = Nokogiri::HTML(open(page_url))
		get_townhalls_URL.xpath('//a[@class = "lientxt"]').each do |url| #Solution avec XPATH autrement au-dessus en commentrequire "spreadsheet_manager.rb"
			link = url['href']
			link[0] = '' #On enlève les points sur les URLs récupérées
      link = "http://annuaire-des-mairies.com#{link}" #On formatte au bon format d'URL
      zipcode = get_townhalls_URL.css('.lientitre').text
      zip_array = zipcode.split
      zip_array = zip_array.pop
      hash_townhall_info = {:name => url.text, :townhall_mail => get_the_email_of_a_townhall_from_its_webpage(link), :zip_code => zip_array} #Création de hash 
			@array_of_emails << hash_townhall_info #Ajout du hash dans un tableau
      end 
      return @array_of_emails
    end 
  
  def compute
    @array_of_all_townhalls = []
    @array_urls.each do |url|
      @array_of_all_townhalls += get_all_the_urls_of_region_townhalls(url)  
      end 
    @array_of_all_townhalls = @array_of_all_townhalls.flatten      
  end  



  end

  #binding.pry