# Installation

## Voraussetzungen

Für die Installation von KSK-Vue wird Folgendes benötigt:

    - php >= 7.2 und Composer
    - Node-JS
    - MSSQL-Server

Weiterhin funtioniert die Eingabe momentan nur in der Deutschen lokalisation, wegen des `<input type="time">` fields

## Installationsvorgang

Zuerst muss das git-repository gecloned werden

`git clone linkEinfügen`

Danach muss in das Verzeichnis gewechselt werden und

`composer install`

und dann

`npm install`

eingegeben werden.

## Konfiguration

Danach muss eine `.env` Datei im Projekt verzeichnis angelegt werden. Dafür kann `.env.example` einfach kopiert werden.

Danach kann mit

`php artisan key:generate`

der Applikations-Schlüssel generiert werden. Ab nun können in `.env`
Die Umgebungsvariablen konfiguriert werden.

Folgende Eingaben sollten getätigt werden:
`APP_NAME = KS-ING`
...
`DB_COnnection=sqlsrv`, die restlichen SQL-Daten entsprechend der oben gennanten Konfiguration

Wenn dies erledigt wurde, kann über
`php artisan db:seed`

die Datenbank mit den nötigen Informationen gefüllt werden

zum Anmelden steht nun zwei User bereit

    - pds@web.de
    - hcs@web.de

Beide benutzen das Passwort 'password'

Zudem befinden sich unter `/docs` nun die Dokumentation zur API, zur Installtion und zur Programmstruktur
