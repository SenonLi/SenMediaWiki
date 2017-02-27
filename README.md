# SenMediaWiki
## MariaDB database and MySQL database problem
* First, install MySQL;
* Second, stop MySQL server (port = 3306)
* Third, install MariaDB, make sure MariaDB server port is same with MySQL server port (3306)

## Database character-set problem, make sure export and import database using UTF8

## MediaWiki set-up
* remember to install ImageMagic on Windows system before setting up MediaWiki
* remember to check the checkbox "Install Legacy utilities (e.g. convert)" during the ImageMagic installation
* check the LocalSettings.php, change based on OS (Linux or Windows)

### install Widgets extension
### solve the folder writeable permission problem (No need on windows system)
### MediaWiki/includes/page/Article.php  
* change "protected function getContentObject" -> "public function getContentObject"

## Dumping and importing from/to MySQL in an UTF-8 safe way
* mysqldump -uroot -p database  --default-character-set=utf8 -r utf8.dump
*
* mysql -uroot -p --default-character-set=utf8 database
* mysql> SET names 'utf8'
* mysql> SOURCE utf8.dump

