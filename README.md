# Eine Stunden-Anwedung für KSK Ingenieure

Das Projekt clonen und in das Verzeichnis wechseln:

`git clone && cd kskVue/`

## Installationsanweisungen


Projekt installieren

`composer install`


Die Datei .env erstellen bzw kopieren und dort die Datenbank daten eintragen.

Dann muss ein app-key generiert werden

`php artisan key:generate`

Danach kann mit 

`php artisan migrate`

und

`php artisan db:seed`

die Datenbank mit Daten gefüllt werden.

Nun sollte die Anwendung mit 
`php artisan serve` laufen


## Entwicklung

Soll an dem Frontend der Anwendung etwas geändert werden, so müssen auch die NPM-Packages mit

`npm install`

installiert werden.

Nach der Installation der Pakte kann mit 

`npm run watch`

der watch-server gestartet werden.
