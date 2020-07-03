# Eine Stunden-Anwedung für KSK Ingenieure

Wird ohne die offizielle Datenbank nicht funktionieren

## Installationsanweisungen

In den dev branch wechseln

`git checkout dev`

Projekt installieren

`composer install`


Die Datei .env erstellen bzw kopieren und dort die Datenbank daten eintragen.

Dann muss ein app-key generiert werden

`php artisan key:generate`

Danach kann mit 

`php artisan migrate`

und

`php artisan seed`

die Datenbank mit Daten gefüllt werden.

Nun sollte die Anwendung mit 
`php artisan serve` laufen
