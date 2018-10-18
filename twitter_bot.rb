require 'twitter'
require 'dotenv'
require 'pry'
require 'csv'
require 'nokogiri'
require 'open-uri'
Dotenv.load

class TwitterBot

	attr_accessor :session_twitter, :city_names_array, :townhall_twitter_handle, :townhall_twitter_handle_via_csv

	def initialize
		#On initialise directement la session avec l'API Twitter
		@session_twitter =
			Twitter::REST::Client.new do |config|
  			config.consumer_key = ENV['TWITTER_API_KEY']
  			config.consumer_secret     = ENV['TWITTER_API_SECRET']
  			config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  			config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
			end
		@city_names_array = []
		@townhall_twitter_handle = []
		@townhall_twitter_handle_via_csv = []
	end

	#Cette méthode va suivre tous les handles présent dans le fichier CSV
	def follow_mass

		@townhall_twitter_handle_via_csv.each do |handle|
		@session_twitter.follow("#{handle}")
		end
		puts "----- OPERATION DONE. YOU FOLLOWED ALL THE HANDLES OF ANALYZED TOWNHALLS ------"

	end

	#On récupérer le nom des villes du CSV
	def get_city_name_from_file
		CSV.foreach("townhalls.csv") do |line|
			@city_names_array << line[0]
		end
	end

	#Cette méthode va récupérer les handles Twitter des mairies et les stocker dans une variable d'instance
	def get_townhall_handle

		@city_names_array.each do |name|
			#Cela permet d'encoder l'URL au format URI pour que Nokogori fonctionne correctement
			google_search_page_URL = URI.encode("https://www.google.fr/search?q=twitter+mairie+#{name}")
			google_search_page_URL = URI.parse(google_search_page_URL)

			text_URL = Nokogiri::HTML(open(google_search_page_URL))

			townhall_twitter_URL = URI.encode(text_URL.css('cite')[0].text)
			townhall_twitter_URL = URI.parse(townhall_twitter_URL)

			twitter_URL = Nokogiri::HTML(open(townhall_twitter_URL))			

			@townhall_twitter_handle << "#{twitter_URL.css('b.u-linkComplex-target')[0].text}"

		end
	end

	#Méthode qui va ajouter les handles en dernière colonne du fichier
	def add_a_handle_column_in_csv

		#On va tout d'abord récupérer les données du fichier pour les mettre dans un array tout en ajoutant les handles
		complete_line_for_CSV = []
		count = 0
		File.open("townhalls.csv") do |read|
			read.each_line do |line|
				complete_line_for_CSV << line.delete("\n")+",#{@townhall_twitter_handle[count]}"
				count += 1
			end
		end

		#On prend toutes les valeurs du tableau et on les ajouter dans le fichier .csv
		count = 0
		File.open("townhalls.csv", "w") do |file|
			while count < complete_line_for_CSV.size
				file.write(complete_line_for_CSV[count])
				file.puts
				count += 1
			end
		end
	end

	def get_handles_from_csv


		f = CSV.foreach("townhalls.csv") do |line|
			@townhall_twitter_handle_via_csv << line[3]
		end
		#@townhall_twitter_handle_via_csv.each do |value|

		#end
	end

end

twitter_bot = TwitterBot.new
twitter_bot.get_city_name_from_file
twitter_bot.get_townhall_handle
twitter_bot.add_a_handle_column_in_csv
twitter_bot.get_handles_from_csv
twitter_bot.follow_mass