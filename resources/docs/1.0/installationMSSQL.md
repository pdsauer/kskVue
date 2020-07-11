# Installation MSSQL

Innerhalb der MSSQL-Datenbank muss die integrierte db.sql datei ausgeführt werden, damit die Tabellen angelegt werden.

### Installation sqlsqrv PHP-Treiber

Unter https://docs.microsoft.com/de-de/sql/connect/php/microsoft-php-driver-for-sql-server?view=sql-server-ver15 können die Erweiterungen für PHP heruntergeladen werden.

Am einfachsten ist es, wenn mit einem `phpinfo()`-Aufruf die Systemeigenschaften überprüft werden. So steht hier, ob die Umgebung _thread-safe_ ist, welche PHP-Version vorhanden ist und ob es sich um eine
x86- oder x64-Architektur handelt. Dementsprechend müssen die beiden erweiterungen `php_pdo_sqlsrv_[php-version]_[thread-safe]_[Architektur].dll` und `php_sqlsrv_[php-version]_[thread-safe]_[Architektur].dll`
in das `/ext`-Verzeichnis im php-Ordner abgelegt werden. In der `php.ini` müssen dann diese Erweiterunge besipielhaft folgende vermerkt werden:

```
extension=php_sqlsrv_74_ts_x64.dll
extension=php_pdo_sqlsrv_74_ts_x64.dll

```

### Installation und Kofiguration MSSQL-Server

Unter https://www.microsoft.com/de-de/sql-server/sql-server-downloads kann die Express-Version des MSSQL-Servers heruntergeladen werden.

Ebenfalls ist das MSSQL-Management-Studio (MSSMS) sinvoll, diese findet man unter: https://docs.microsoft.com/de-de/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15

Sind beide installiert und wurde der Rechner neugestartet, so muss nun im MSSMS die SQL-Authentifizierung aktiviert werden.
Dafür klickt man mit Rechtsklick auf den Server > Eigenschaften > Sicherheit > SQL Server- und Windows-Authentifizierungsmodus.
Weiterhin sollte ein user `root` hinzugefügt werden, der Serverrollen public, serveradmin und sysadmin besitzt. Mit diesem wird später auf die Datenbank zugegriffen.
Mit dem Tool _Sql Server Configuration Manager_ muss über _SQL Server-Netzwerkkonfiguration_ > TCP/IP (Doppel-Klick) > IP-Adressen der entsprechende Port für die Verbindung ausgewählt werden. Mehrere IP-Adressen für den SQL-Server können ebenfalls dort aktiviert werden. (z.B. 127.0.0.1)
