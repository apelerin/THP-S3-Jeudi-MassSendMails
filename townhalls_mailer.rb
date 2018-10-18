require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'
require 'gmail'
require 'dotenv'
require 'csv'

Dotenv.load

class EMail
  attr_accessor :gmail, :hsh_mairies

  def initialize
    @gmail = Gmail.connect(ENV['USERNAME'], ENV['PASSWORD'])
    @hsh_mairies = {}
    salvage_mail
    send_mails
  end

  def salvage_mail
    CSV.foreach('../db/townhalls.csv') do |row|
      @hsh_mairies.store(row[0], row[1])
    end
    puts @hsh_mairies
  end

  def send_mails
    @hsh_mairies.each do |name, mail|
      gmail.deliver do 
        to mail
        subject "tasty"
        text_part do
          body "This is gorgeous"
        end
        html_part do
          content_type 'text/html; charset=UTF-8'
          body "<p>Bonjour,
Je m'appelle Axel, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de ntore école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.

Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{name} veut changer le monde avec nous ?


Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80</p>"
        end
      end
    end
  end
end

launch = EMail.new
