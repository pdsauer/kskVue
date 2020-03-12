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

## Konfiguration

Danach muss mit 

``php artisan key:generate ``

der Applikations-Schlüssel generiert werden. Ab nun können in `.env`
Die Umgebungsvariablen konfiguriert werden. 
