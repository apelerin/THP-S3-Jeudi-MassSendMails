$:.unshift File.expand_path("./../lib/views", __FILE__)
require 'bundler'
require 'index.rb'
require 'done.rb'

class Perform

  def launch_program
		Index.new
  end 

end 

app = Perform.new
app.launch_program  