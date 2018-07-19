require 'gmail'
require 'json'

class Mailer
  attr_accessor :username, :password, :gmail
  def initialize
    @username = 'thp.thehackingproject@gmail.com'
    @password = '1a2z3e4r'
    @gmail = Gmail.connect(username, password)
    end

  def send_mail(commune, my_mail)
    @gmail.deliver do
      to my_mail
      subject 'Having fun in Puerto Rico!' # objet
      text_part do
        body 'Text of plaintext message.' # aucune idée de ce que ça fait
      end
      html_part do
        content_type 'text/html; charset=UTF-8'
        body 'Bonjour je m\'appelle #{commune}'
      end
    end
  end

  def perform
    json = File.read('./db/hola.json')
    hash = JSON.parse(json)
    hash.each do |k, v|
      send_mail(k, v)
    end
    @gmail.logout
  end
end


