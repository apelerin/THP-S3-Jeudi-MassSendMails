require 'nokogiri'
require 'open-uri'
require 'rubygems'

#Création de la classe Scrapper

class Scrapper
	attr_accessor :array_urls, :array_of_emails

#La classe est initialisée avec un array d'urls (dans notre cas, ce sont les urls des départements dont on doit scrapper les mails des villes)  
	def initialize(array_urls)
    @array_urls = array_urls
    @array_of_emails = []
  end

	#Méthode pour récupérer l'adresse email d'une mairie à partir de sa page (va récupère le mail grâce à un xpath)
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

	#Méthode pour récupérer les liens de pages relatives à chaque mairie et qui exécute la première méthode sur la base des liens récupérés
	def get_all_the_urls_of_region_townhalls(page_url)
    get_townhalls_URL = Nokogiri::HTML(open(page_url))
		get_townhalls_URL.xpath('//a[@class = "lientxt"]').each do |url| 
			link = url['href']  #récupère l'url
			link[0] = '' #On enlève le points sur l'URL récupérée
      link = "http://annuaire-des-mairies.com#{link}" #On formatte au bon format d'URL
      zipcode = get_townhalls_URL.css('.lientitre').text #On va récupérer sur la page le nom de département
      zip_array = zipcode.split #On transforme le string en array de différents éléments
      zip_array = zip_array.pop #L'array est sous forme ["Département", "de", "Seine-Saint-Denis"], avec .pop on récupère le dernier élément de l'array, le nom du département, qui nous intéresse
      hash_townhall_info = {:name => url.text, :townhall_mail => get_the_email_of_a_townhall_from_its_webpage(link), :zip_code => zip_array} #Création de hash 
      @array_of_emails << hash_townhall_info #Ajout du hash dans un tableau. Celui-ci est un attribut de classe. A chaque fois que cette méthode tourne, elle ajoute à la suite les hashes.
      end 
    end 
  
   #Méthode globale qui permet de récupérer les hashes des mairies de chaque département
  def compute
    @array_urls.each do |url|
      get_all_the_urls_of_region_townhalls(url) #Fait passer toutes les URLs du hash donné dans la méthode d'au-dessus.
    end  
    return @array_of_emails #La méthode compute retourne l'array contenant tous les hashes des mairies.
  end  

end
