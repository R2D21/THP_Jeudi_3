# THP-S3 - Travail en groupe - Mails en Masse

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


### envoi de mails avec votre compte gmail
 
Dans le terminal

1. `touch .env`
2. `open .env`

Dans le fichier .env

GMAIL_MAIL="votre adresse gmail"  
GMAIL_PASSWORD="votre mot de passe"

### utilisation du compte Twitter

Avant de follow les mairies à l'aide de votre compte twitter

Dans le terminal 

1. `touch .env`
2. `open .env`

Dans le fichier .env

TWITTER_API_KEY=" votre api_key"  
TWITTER_API_SECRET=" votre api_secret"  
TWITTER_ACCESS_TOKEN=" votre access_token"  
TWITTER_ACCESS_TOKEN_SECRET=" votre token_secret"  


### A propos du projet


app.rb démarre l'application, et rassemble les différentes parties entre elles  
db/ contient les fichiers json  
lib/ contient les classes utilisées pour le Scrapping, les tweets ainsi que l'envoi des mails  

### Répartition des tâches

Mailer :  Eangly ENG & Kwevan GOUACIDE  
Scrapping : Rémi BOIVIN & Jeremie EDERY  
Bot Twitter : Amélie FOULQUIER & Stéphane  
