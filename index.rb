class Index

	def initialize
		loop do
			puts "------------------------- WELCOME TO OUR WONDERFUL PROGRAM -------------------------"
			puts ""
			puts ""
			puts "1 - Launch the scrapper and save it in a JSON file"
			puts ""
			puts "2 - Launch the scrapper and save it in a Google Drive Spreadsheet"
			puts ""
			puts "3 - Launch the scrapper and save it in a CSV file"
			puts ""
			puts "4 - Convert a JSON file in a CSV"
			puts ""
			puts ""
			puts "5 - Stop the program"
			puts ""
			puts "------------------------------------------------------------------------------------"
			puts ""
			print "> "
			action = gets.chomp.to_i

			if action == 1

			elsif action == 2

			elsif action == 3

			elsif action == 4

			end
			
		break if action == 5
	end

end
	end

end