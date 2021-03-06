require 'gmail'
require 'json'
require 'dotenv'
Dotenv.load

class Mailer
  attr_accessor :username, :password, :gmail
  
  def initialize
    # puts "Connexion à ton compte MAIL pour envoyer les mails aux mairies"
    # puts "Entre ton mail (GMAIL)"
    # print ">"
    # @username = gets.chomp
    # puts "Entre ton mot de passe"
    # print ">"
    # @password = gets.chomp


  @username = ENV['GMAIL_MAIL']
  @password = ENV['GMAIL_PASSWORD']



    @gmail = Gmail.connect(username, password)
  end

  def send_mail(commune, my_mail)
    @gmail.deliver do
      to my_mail
      subject 'J\'aimerai vous présenter une formation gratuite de programmation informatique' # objet
      text_part do
        body 'Text of plaintext message.' # aucune idée de ce que ça fait
      end
      html_part do
        content_type 'text/html; charset=UTF-8'
        body "Bonjour,\n
          Je m'appelle Henry LENG, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique.\n
          La pédagogie de ntore école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code.\n
          Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.\n \n

          Déjà 500 personnes sont passées par The Hacking Project. Est-ce que votre mairie veut changer le monde avec nous ?\n
          Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"
      end
    end
    puts "Mail envoyé!!!!!"
  end

  def perform
    json = File.read('./db/town_halls.json')
    hash = JSON.parse(json)
    hash.each do |k, v|
      send_mail(k, v)
    end
    @gmail.logout
  end
end


