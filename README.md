# Travail du Jeudi S3 THP en groupe

> Contributeurs : Jeremie EDERY, Eangly ENG, Rémi BOIVIN, Kwevan GOUACIDE, Amélie FOULQUIER, Stéphane

Ce projet à pour but d'informer toutes les mairies de l'existence de la formation The Hacking Project

Nous avons choisi de nous focaliser sur 3 départements :

* Le Val-de-Marne
* La Gironde
* L'Aube

Le script est réparti en 3 étapes :

Collecter les emails de chaque mairie en "scrappant" leurs sites en les sauvegardant dans un fichier JSON
Envoyer un email à chacune d'entre elles de part un message présentant la formation
Twitter chacune d'entre elles



### Utilisation

Installer les gems :

`bundle install`

Démarrer le script

`ruby app.rb`


### A propos du projet


app.rb démarre l'application, et rassemble les différentes parties entre elles
db/ contient les fichiers json
lib/ contient les classes utilisées pour le Scrapping, les tweets ainsi que l'envoi des mails

### Répartition des tâches

Mailer :  Eangly ENG & Kwevan GOUACIDE
Scrapping : Rémi BOIVIN & Jeremie EDERY
Bot Twitter : Amélie FOULQUIER & Stéphane
