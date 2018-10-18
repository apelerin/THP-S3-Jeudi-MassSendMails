# Projet Envoi de mails en masse

Bonjour! L'équipe est composée de Fred (FredS), Axel Pélerin et Juliette Audema. (Oui nous n'étions que trois pour faire tout ça #yeuxdechatonspourimplorervotreclémence)
Ce programme sert à envoyer un mail présentant la formation The Hacking Project ainsi qu’une relance sur Twitter à toutes les mairies: 
- du Gard (30), 
- de la Seine-et-Marne (77), 
- de la Seine-Saint-Denis (93)

## Les gem utilisées

- Nokogiri (鋸): it's an HTML, XML, SAX, and Reader parser. Among Nokogiri's many features is the ability to search documents via XPath or CSS3 selectors.
- Gmail: a Rubyesque interface to Gmail, with all the tools you will need. Search, read and send multipart emails; archive, mark as read/unread, delete emails; and manage labels
- Dotenv: Shim to load environment variables from .env into ENV in development.
- Twitter: A Ruby interface to the Twitter API.
- CSV: This library provides a complete interface to CSV files and data. It offers tools to enable you to read and write to and from Strings or IO objects, as needed.
- Pry: i's a powerful alternative to the standard IRB shell for Ruby.
- Googleauth: allows simple authorization for accessing Google APIs. Provide support for Application Default Credentials
- Fileutils: Several file utility methods for copying, moving, removing, etc.

## Comment se servir du programme 

Pour faire marcher ce programme, il vous faut d'abord faire ```$ bundle install```
Ensuite, lancez le programme en faisant ```$ ruby app.rb```
Une interface se présentera à vous et vous pourrez réaliser quelques actions.

## L'arborescence du dossier et les programmes

Dans ce dossier vous allez tout d'abord trouver les fichiers suivants :
- le <strong>README.md</strong> (que vous êtes en train de lire #lamatrix)
- le <strong>.gitignore</strong> pour cacher certaines clés que vous ne saurez voir...
- le <strong>Gemfile</strong> qui indique notre source, la version de Ruby et les gems utilisées
- le <strong>Gemfile.lock</strong> qui accompagne le Gemfile (ils vont par deux, c'est comme les témoins de Jéhovah ou les paires de...)
- le fichier <strong> app.rb </strong> qui vous permettra de lancer le programme (duh)

Vous trouverez également un dossier <strong>db</strong> contenant le fichier <strong>townhalls.csv</strong> qui contient les noms des mairies, leur adresse mail, leur département ainsi que leur compte Twitter associé (quand c'est possible, hein !).

Il y a enfin un dossier lib, contenant deux sous-dossiers:
- app
- views

Le dossier <strong>app</strong> contient les programmes:
- <strong>townhalls_scrapper.rb</strong>: ce programme contient la classe Scrapper a pour but de lire un array d'URL de trois départements du site 'http://www.annuaire-des-mairies.com/' et de retourner sous forme d'un array de hashes 
({:name => NOM, :townhall_mail => MAIL, :zip_code => DEPARTEMENT}) les infos attendues.
- <strong>townhalls_mailer.rb</strong>: ce programme va chercher dans la bse de donnée les noms et addresses mails des mairies, les associent dans un hash, puis envoit un mail en utilisant le mail en destinataire et le nom dans le message en html
- <strong>townhalls_adder_to_db.rb</strong>: ce programme crée un objet de la classe Scrapper et met tous les hashes récupérés dans le fichier database.csv
- <strong>townhalls_follower.rb</strong>: ce programme se connecte à un compte Twitter grâce à l'API Twitter. Ensuite, l'idée est de récupérer le nom des mairies contenues dans le fichier townhalls.csv. A partir de là, le programme passe par Google et par Twitter pour recupérer les handles. Ces handles sont ensuite copiés (parce que oui, il faut bien les garder sous le coude ;)), puis pour terminer on follow directement les comptes Twitter récupérés ! Le bot que nous avons utilisé est [@happen_next](https://twitter.com/happen_next?lang=fr) et pour voir les comptes suivis, c'est par [ici](https://twitter.com/following?lang=fr) (nous en avons suivi que quelques uns car nous avons des restrictions côté API) !

Le dossier view contient les programmes:
- <strong>index.rb</strong>: qui lance une petite interface
- <strong>done.rb</strong>: qui vous dit <a href=https://www.youtube.com/watch?v=0obJfkU9xB4>au revoir</a>.


## Ce qui a été fait:

1) Nous avons récupéré les adresses mails des mairies du département du Gard, de la Seine-et-Marne et de la Seine-et-Denis, ils ont été stockés dans un fichier csv (grâce aux programmes townalls_scrapper.rb et townhalls_adder_to_db.rb), cela représente un peu plus de 900 mails. Et même si ça a été un peu long pour les récupérer, c'est toujours plus rapide qu'à la main.

2) Nous avons followé une quinzaine de comptes Twitter de mairie grâce à notre bot Twitter (programme townhalls_follower.rb) (on n'a pas followé plus pour pas être banni).

3) Nous avons envoyé 75 mails aux mairies dont on a récupéré les adresses mails (programme townhalls_mailer.rb). Si tu veux vérifier (je vois que la confiance règne), le mail est: 
```thptastytoastytest@gmail.com```(nous te donnerons le mot de passe par téléphone) (pas folle la guêpe!) (quoique après cette journée...)