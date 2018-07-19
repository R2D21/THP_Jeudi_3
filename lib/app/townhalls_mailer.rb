require 'gmail'
require 'json'


def send_mail(my_mail)

  username = "thp.thehackingproject@gmail.com"
  password = ENV["GMAIL_PASSWORD"]

  p gmail = Gmail.connect(username, password)

gmail.deliver do
  to my_mail
  subject "Having fun in Puerto Rico!" #objet
  text_part do
    body "Text of plaintext message." #aucune idée de ce que ça fait
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body "<p>Text of <em>html</em> message.</p>" #message
  end
  # add_file "/path/to/some_image.jpg"
end

end

# send_mail("kyg972@msn.com")



json = File.read('hola.json')
    hash = JSON.parse(json)
p hash

hash.each do |k, v|
send_mail(v)

end