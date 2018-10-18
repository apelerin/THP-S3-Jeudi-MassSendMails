$:.unshift File.expand_path("./../lib/views", __FILE__)
require 'bundler'
require 'index.rb'
require 'done.rb'

class Perform
  def launch_program
    index.rb
  end 

end 

app = Perform.new
app.launch program  


#add = AdderToDb.new 
#add.save_the_scrapper_in_csv
