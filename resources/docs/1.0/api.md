# API

Die Stundenanwendung ist eine Vue.js-App und braucht deshalb keinen Pa-
gereload, um Daten zu senden/empfangen. Damit zwischen dem Frontend
und dem Backend kommuniziert werden kann, ohne das eine Seite neu gela-
den werden muss, wird innerhalb der Anwendung über JavaScript eine API
kontaktiert. Als Libary wird für XMLHttpRequest die in Laravel mitgelieferte Axios-Bibliothek verwendet. Diese API wurde über Laravel realisiert und sendet/empfängt Daten im JSON-Format. Somit sind alle Requests von dem Typ JSON. Die Routen für die API sind der web.php zu entnehmen.

## Struktur

Die API-Endpunkte sind zur der Stundenverwaltung den jeweils vier Models
Day, Day UF, Order und Activity zuzuordnen. Die entsprechenden End-
punkte (Routes) sind in hier aufgelistet. Befindet sich in einer Route eine Ressource in geschweiften Klammern {id}, so ist damit die id der jeweiligen Resource einzusetzen. Diese wird dann im Controller direkt oder für Route-Model-Binding verwendet.

### Day

Für jede Aktion des CRUD-Prinzips gibt es eine entsprechende Route. So
gibt es Routen für das Anziegen eines Datensatzen oder für das Anzeigen
mehrerer Datensätze. Zudem gibt es Routen für das Erstellen, Aktualisiern oder Löschen von Datensätzen des Typen Arbeitstag

#### GET /api/v1/days/

Diese Route liefert alle Tage des eingeloggten Users der letzten drei Monate und sortiert diese absteigend anhand des Datums. Die Route braucht keine Parameter zur Entgegennahme und liefert ein Array von mehreren Tagen:

```
[
  {
    "Std_ID":3,
    "Dat_Kuerz":"test",
    "Datum":"2020-07-08",
    "Von":"10.50",
    "Bis":"18.00",
    "Pause":"0.00",
    "Std_gesamt":"7.50",
    ...
    "Eingabedatum":"2020-07-08 22:05:38",
    "PersNr":123
  },
  {...}
]
```
