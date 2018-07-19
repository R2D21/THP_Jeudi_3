
require 'gmail'
require 'json'

$LOAD_PATH.unshift File.expand_path('./../lib', __dir__)
require_relative './lib/app/townhalls_mailer'
require_relative './lib/app/townhalls_scrapper'


puts 'BONJOUR! Tout d\'abord, , nous allons scrapper tous les mails des mairies du département 10...'
puts '(Cela peut prendre du temps suivant votre connexion, désolé...)'


save_cities


puts 'Bien! le fichier a été sauvegardé dans un fichier JSON dans le dossier /db'
puts 'Souhaitez vous envoyer le message de THP aux mairies (tapez 1)'


loop do
  puts '(press 0 to quit)'
  print '> '

   choice = gets.chomp.to_i

   unless [0, 1].include?(choice)
    loop do
      puts 'Wrong entry. Please choose 1 or 2:'
      print '> '
      choice = gets.chomp.to_i

      break if [1].include?(choice)
    end
  end

    if choice.zero?
    puts 'Au revoir!'
    break
  end


  if choice == 1
    Mailer.new.perform
  end

end

