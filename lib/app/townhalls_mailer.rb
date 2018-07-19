require 'gmail'
require 'json'

class Mailer
  attr_accessor :username, :password, :gmail
  def initialize
    @username = 'thp.thehackingproject@gmail.com'
    @password = 'av'
    @gmail = Gmail.connect(username, password)
    end

  def send_mail(my_mail)
    @gmail.deliver do
      to my_mail
      subject 'Having fun in Puerto Rico!' # objet
      text_part do
        body 'Text of plaintext message.' # aucune idée de ce que ça fait
      end
      html_part do
        content_type 'text/html; charset=UTF-8'
        body '<p>Text of <em>html</em> message.</p>' # message
      end
    end
  end

  def perform
    json = File.read('../../db/hola.json')
    hash = JSON.parse(json)
    hash.each do |_k, v|
      send_mail(v)
    end
    @gmail.logout
  end
end

Mailer.new.perform
