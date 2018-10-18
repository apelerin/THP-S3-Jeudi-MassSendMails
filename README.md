# Projet Envoi de mails en masse

Bonjour! L'équipe est composée de Fred (FredS), Axel Pélerin et Juliette Audema. (Oui nous n'étions que trois pour faire tout ça #yeuxdechatonspourimplorervotreclémence)

## Comment lancer le programme

Pour faire marcher ce programme, il vous faut d'abord faire ```$ bundle install```
Ensuite, lancez le programme en faisant ```$ ruby app.rb```


## Comment se servir du programme et les gems utilisées

???


## L'arborescence du dossier et les programmes

Dans ce dossier vous allez tout d'abord trouver les fichiers suivants :
- le README.md (que vous êtes en train de lire #lamatrix)
- le .gitignore pour cacher certaines clés que vous ne saurez voir...
- le Gemfile qui indique notre source, la version de Ruby et les gems
- le Gemfile.lock qui accompagne le Gemfile (c'est comme les témoins de Jéhovah ou les paires de...)
- le fichier <strong> app.rb </strong> qui vous permettra de lancer le programme

Vous trouverez également un dossier db contenant le fichier database.csv qui contient les noms des mairies, leur adresse mail et leur département.

Il y a enfin un dossier lib, contenant deux sous-dossiers:
- app
- views

Le dossier app contient les programmes:
- townhalls_scrapper.rb: ce programme contient la classe Scrapper a pour but de lire un array d'URL de trois départements du site 'http://www.annuaire-des-mairies.com/' et de retourner sous forme d'un array de hashes 
({:name => NOM, :townhall_mail => MAIL, :zip_code => DEPARTEMENT}) les infos attendues.
- townhalls_mailer.rb
- townhalls_adder_to_db.rb: ce programme crée un objet de la classe Scrapper et met tous les hashes récupérés dans le fichier database.csv
- townhalls_follower.rb

Le dossier view contient les programmes:
- done.rb
- index.rb


## Ce qui a été fait:

Nous avons 
    une partie qui explique ce qui a été fait : l'email envoyé, le nombre de mairies touchées, le handle Twitter qui a été utilisé