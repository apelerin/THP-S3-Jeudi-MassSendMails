require 'twitter'
require 'dotenv'
require 'pry'
require 'csv'
require 'nokogiri'
require 'watir'
Dotenv.load

class TwitterBot

	attr_accessor :session_twitter, :city_names_array

	def initialize
		@session_twitter =
			Twitter::REST::Client.new do |config|
  			config.consumer_key = ENV['TWITTER_API_KEY']
  			config.consumer_secret     = ENV['TWITTER_API_SECRET']
  			config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  			config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
			end
		@city_names_array = []
	end

	def follow_someone
		@session_twitter.follow("the_hacking_pro")
	end

	def follow_mass

	end

	def get_city_name_from_file
		CSV.foreach("townhalls.csv") do |line|
			@city_names_array << line[0]
		end
	end

	def get_townhalls_handle

	end

end

twitter_bot = TwitterBot.new
twitter_bot.get_city_name_from_file
puts twitter_bot.city_names_array