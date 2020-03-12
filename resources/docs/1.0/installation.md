# Installation

## Voraussetzungen
Für die Installation von KSK-Vue wird Folgendes benötigt:

    - php >= 7.2 und Composer
    - Node-JS
    - MSSQL-Server

## Installationsvorgang

Zuerst muss das git-repository gecloned werden

``git clone linkEinfügen``
 
Danach muss in das Verzeichnis gewechselt werden und 

``composer install``

und dann

``npm install``

eingegeben werden.

Innerhalb der MSSQL-Datenbank muss die integrierte db.sql datei ausgeführt werden, damit die Tabellen angelegt werden.

## Konfiguration

Danach muss mit 

``php artisan key:generate ``

der Applikations-Schlüssel generiert werden. Ab nun können in `.env`
Die Umgebungsvariablen konfiguriert werden. 

Wenn dies erledigt wurde, kann über 
``php artisan db:seed``
die Datenbank mit den nötigen Informationen gefüllt werden

zum Anmelden steht nun zwei User bereit

    - pds@web.de
    - hcs@web.de
    
Beide benutzen das Passwort 'password'
