require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'
require 'gmail'
require 'dotenv'
require 'csv'

Dotenv.load

# Classe contenant les méthodes de récupération et d'envois de mails
class Mailsender
  attr_accessor :gmail, :hsh_mairies

# Utilisation de la gem 'gmail' pour se connecter à une boite mail, avec USERNAME comme adresse mail, puis lancement des méthodes
  def initialize
    @gmail = Gmail.connect(ENV['USERNAME'], ENV['PASSWORD'])
    @hsh_mairies = {}
    salvage_mail
    send_mails
  end

# Méthode de récupération dans le fichier csv contenant des données précédemment scrappées, et les mets dans un hash avec row[0] en nom et row[1] en email
  def salvage_mail
    CSV.foreach('../db/townhalls.csv') do |row|
      @hsh_mairies.store(row[0], row[1])
    end
    puts @hsh_mairies
  end

# Méthode d'envois de mail, le hash est décomposé pour chaque couple en name et mail, le mail est utilisé en destinataire et le name dans le message html, toujours avec des méthodes de la gem gmail
  def send_mails
    @hsh_mairies.each do |name, mail|
      gmail.deliver do 
        to mail
        subject "J'apprend à coder!"
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
