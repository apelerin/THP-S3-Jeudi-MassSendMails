require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'
require 'gmail'
require 'csv'

class EMail
  attr_accessor :gmail, :arr_mail_mairies

  def initialize
    @gmail = Gmail.connect('un mail', 'un mot de passe')
    @arr_mail_mairies = []
    salvage_mail
    send_mails
  end

  def salvage_mail
    CSV.foreach('./data/test.csv') do |row|
      @arr_mail_mairies << row[1]
    end
    puts @arr_mail_mairies
  end

  def send_mails
    @arr_mail_mairies.each do |mail|
      gmail.deliver do 
        to mail
        subject "tasty"
        text_part do
          body "This is gorgeous"
        end
        html_part do
          content_type 'text/html; charset=UTF-8'
          body "<p>Text of <em>html</em> message.</p>"
        end
      end
    end
  end
end

launch = EMail.new
