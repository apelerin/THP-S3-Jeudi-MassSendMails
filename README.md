# Projet Envoi de mails en masse

Bonjour! L'équipe est composée de Fred (FredS), Axel Pélerin et Juliette Audema. (Oui nous n'étions que trois pour faire tout ça #yeuxdechatonspourimplorervotreclémence)

## Comment lancer le programme

Pour faire marcher ce programme, il vous faut d'abord faire ```$ bundle install```
Ensuite, lancez le programme en faisant ```$ ruby app.rb```


## Comment se servir du programme et les gems utilisées

???


## L'arborescence du dossier et les programmes

Dans ce dossier vous allez tout d'abord trouver les fichiers suivants :
- le <strong>README.md</strong> (que vous êtes en train de lire #lamatrix)
- le <strong>.gitignore</strong> pour cacher certaines clés que vous ne saurez voir...
- le <strong>Gemfile</strong> qui indique notre source, la version de Ruby et les gems
- le <strong>Gemfile.lock</strong> qui accompagne le Gemfile (c'est comme les témoins de Jéhovah ou les paires de...)
- le fichier <strong> app.rb </strong> qui vous permettra de lancer le programme

Vous trouverez également un dossier <strong>db</strong> contenant le fichier <strong>townhalls.csv</strong> qui contient les noms des mairies, leur adresse mail, leur département ainsi que leur compte Twitter associé (quand c'est possible, hein !).

Il y a enfin un dossier lib, contenant deux sous-dossiers:
- app
- views

Le dossier <strong>app</strong> contient les programmes:
- <strong>townhalls_scrapper.rb</strong>: ce programme contient la classe Scrapper a pour but de lire un array d'URL de trois départements du site 'http://www.annuaire-des-mairies.com/' et de retourner sous forme d'un array de hashes 
({:name => NOM, :townhall_mail => MAIL, :zip_code => DEPARTEMENT}) les infos attendues.
- <strong>townhalls_mailer.rb</strong>:
- <strong>townhalls_adder_to_db.rb</strong>: ce programme crée un objet de la classe Scrapper et met tous les hashes récupérés dans le fichier database.csv
- <strong>townhalls_follower.rb</strong>: ce programme se connecte à un compte Twitter grâce à l'API Twitter. Ensuite, l'idée est de récupérer le nom des mairies contenues dans le fichier database.csv. A partir de là, le programme passe par Google et par Twitter pour recupérer les handles. Ces handles sont ensuite copiés (parce que oui, il faut bien les garder sous le coude ;)), on follow directement les comptes Twitter récupérés ! Le compte que nous avons est le suivant : 

Le dossier view contient les programmes:
- <strong>done.rb</strong>:
- <strong>index.rb</strong>:


## Ce qui a été fait:

Nous avons 
    une partie qui explique ce qui a été fait : l'email envoyé, le nombre de mairies touchées, le handle Twitter qui a été utilisé
