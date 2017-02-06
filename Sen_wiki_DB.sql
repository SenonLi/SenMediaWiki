-- MySQL dump 10.16  Distrib 10.1.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.21-MariaDB-1~trusty

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `SenIndex`
--

DROP TABLE IF EXISTS `SenIndex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SenIndex` (
  `a` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SenIndex`
--

LOCK TABLES `SenIndex` WRITE;
/*!40000 ALTER TABLE `SenIndex` DISABLE KEYS */;
INSERT INTO `SenIndex` VALUES (1),(2),(3),(4);
/*!40000 ALTER TABLE `SenIndex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive` (
  `ar_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ar_namespace` int(11) NOT NULL DEFAULT '0',
  `ar_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `ar_text` mediumblob NOT NULL,
  `ar_comment` varbinary(767) NOT NULL,
  `ar_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ar_user_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ar_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ar_minor_edit` tinyint(4) NOT NULL DEFAULT '0',
  `ar_flags` tinyblob NOT NULL,
  `ar_rev_id` int(10) unsigned DEFAULT NULL,
  `ar_text_id` int(10) unsigned DEFAULT NULL,
  `ar_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ar_len` int(10) unsigned DEFAULT NULL,
  `ar_page_id` int(10) unsigned DEFAULT NULL,
  `ar_parent_id` int(10) unsigned DEFAULT NULL,
  `ar_sha1` varbinary(32) NOT NULL DEFAULT '',
  `ar_content_model` varbinary(32) DEFAULT NULL,
  `ar_content_format` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`ar_id`),
  KEY `name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  KEY `ar_usertext_timestamp` (`ar_user_text`,`ar_timestamp`),
  KEY `ar_revid` (`ar_rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive`
--

LOCK TABLES `archive` WRITE;
/*!40000 ALTER TABLE `archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bot_passwords`
--

DROP TABLE IF EXISTS `bot_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bot_passwords` (
  `bp_user` int(11) NOT NULL,
  `bp_app_id` varbinary(32) NOT NULL,
  `bp_password` tinyblob NOT NULL,
  `bp_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `bp_restrictions` blob NOT NULL,
  `bp_grants` blob NOT NULL,
  PRIMARY KEY (`bp_user`,`bp_app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bot_passwords`
--

LOCK TABLES `bot_passwords` WRITE;
/*!40000 ALTER TABLE `bot_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `bot_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cat_pages` int(11) NOT NULL DEFAULT '0',
  `cat_subcats` int(11) NOT NULL DEFAULT '0',
  `cat_files` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_title` (`cat_title`),
  KEY `cat_pages` (`cat_pages`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,'Employees',1,0,0),(3,'SortDevices',1,0,0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorylinks`
--

DROP TABLE IF EXISTS `categorylinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorylinks` (
  `cl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `cl_to` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `cl_sortkey` varbinary(230) NOT NULL DEFAULT '',
  `cl_sortkey_prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `cl_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cl_collation` varbinary(32) NOT NULL DEFAULT '',
  `cl_type` enum('page','subcat','file') NOT NULL DEFAULT 'page',
  UNIQUE KEY `cl_from` (`cl_from`,`cl_to`),
  KEY `cl_sortkey` (`cl_to`,`cl_type`,`cl_sortkey`,`cl_from`),
  KEY `cl_timestamp` (`cl_to`,`cl_timestamp`),
  KEY `cl_collation_ext` (`cl_collation`,`cl_to`,`cl_type`,`cl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorylinks`
--

LOCK TABLES `categorylinks` WRITE;
/*!40000 ALTER TABLE `categorylinks` DISABLE KEYS */;
INSERT INTO `categorylinks` VALUES (3,'Employees','SEN','','2017-01-25 09:37:02','uppercase','page'),(17,'SortDevices','SORTDEVICESBYDEVICEID','','2017-02-01 05:58:18','uppercase','page');
/*!40000 ALTER TABLE `categorylinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_tag`
--

DROP TABLE IF EXISTS `change_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_tag` (
  `ct_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ct_rc_id` int(11) DEFAULT NULL,
  `ct_log_id` int(11) DEFAULT NULL,
  `ct_rev_id` int(11) DEFAULT NULL,
  `ct_tag` varchar(255) NOT NULL,
  `ct_params` blob,
  PRIMARY KEY (`ct_id`),
  UNIQUE KEY `change_tag_rc_tag` (`ct_rc_id`,`ct_tag`),
  UNIQUE KEY `change_tag_log_tag` (`ct_log_id`,`ct_tag`),
  UNIQUE KEY `change_tag_rev_tag` (`ct_rev_id`,`ct_tag`),
  KEY `change_tag_tag_id` (`ct_tag`,`ct_rc_id`,`ct_rev_id`,`ct_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_tag`
--

LOCK TABLES `change_tag` WRITE;
/*!40000 ALTER TABLE `change_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externallinks`
--

DROP TABLE IF EXISTS `externallinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externallinks` (
  `el_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `el_from` int(10) unsigned NOT NULL DEFAULT '0',
  `el_to` blob NOT NULL,
  `el_index` blob NOT NULL,
  PRIMARY KEY (`el_id`),
  KEY `el_from` (`el_from`,`el_to`(40)),
  KEY `el_to` (`el_to`(60),`el_from`),
  KEY `el_index` (`el_index`(60))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externallinks`
--

LOCK TABLES `externallinks` WRITE;
/*!40000 ALTER TABLE `externallinks` DISABLE KEYS */;
INSERT INTO `externallinks` VALUES (1,3,'http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html','http://cc.cu.senon./Sen_PSoC_BLE_Optical-Flow.html'),(2,3,'https://www.linkedin.com/in/sensprouting','https://com.linkedin.www./in/sensprouting'),(4,12,'https://www.youtube.com/embed/5pdaB2cejZU','https://com.youtube.www./embed/5pdaB2cejZU'),(10,14,'https://www.mediawikiwidgets.org/Iframe','https://org.mediawikiwidgets.www./Iframe'),(12,14,'https://www.mediawikiwidgets.org/User:Sergey_Chernyshev','https://org.mediawikiwidgets.www./User:Sergey_Chernyshev'),(13,14,'https://www.mediawiki.org/wiki/Extension:Widgets','https://org.mediawiki.www./wiki/Extension:Widgets'),(18,4,'http://192.168.1.61/addNewEmployee.php','http://61.1.168.192./addNewEmployee.php');
/*!40000 ALTER TABLE `externallinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filearchive`
--

DROP TABLE IF EXISTS `filearchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filearchive` (
  `fa_id` int(11) NOT NULL AUTO_INCREMENT,
  `fa_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `fa_archive_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `fa_storage_group` varbinary(16) DEFAULT NULL,
  `fa_storage_key` varbinary(64) DEFAULT '',
  `fa_deleted_user` int(11) DEFAULT NULL,
  `fa_deleted_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted_reason` varbinary(767) DEFAULT '',
  `fa_size` int(10) unsigned DEFAULT '0',
  `fa_width` int(11) DEFAULT '0',
  `fa_height` int(11) DEFAULT '0',
  `fa_metadata` mediumblob,
  `fa_bits` int(11) DEFAULT '0',
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') DEFAULT 'unknown',
  `fa_minor_mime` varbinary(100) DEFAULT 'unknown',
  `fa_description` varbinary(767) DEFAULT NULL,
  `fa_user` int(10) unsigned DEFAULT '0',
  `fa_user_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fa_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fa_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`fa_id`),
  KEY `fa_name` (`fa_name`,`fa_timestamp`),
  KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  KEY `fa_user_timestamp` (`fa_user_text`,`fa_timestamp`),
  KEY `fa_sha1` (`fa_sha1`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filearchive`
--

LOCK TABLES `filearchive` WRITE;
/*!40000 ALTER TABLE `filearchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `filearchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huawei_devices`
--

DROP TABLE IF EXISTS `huawei_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `huawei_devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceID` varchar(50) NOT NULL,
  `ownerID` varchar(60) NOT NULL,
  `ownerName` varchar(150) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huawei_devices`
--

LOCK TABLES `huawei_devices` WRITE;
/*!40000 ALTER TABLE `huawei_devices` DISABLE KEYS */;
INSERT INTO `huawei_devices` VALUES (1,'123456789','00759978','Charles','Mate8'),(3,'7777777777','00371537','Shouwen','Golden'),(4,'1234eqreq','z00759978','Charles','mate 9'),(5,'asdfadas23','00759978','charles','mate 9'),(7,'asdfasfdasdfasdfsadf','WX445227','asdfasdf','asdfsadf'),(8,'gwergwreg','WX445227','adsgreherh','asdfga'),(9,'ddddddddddd','WX445227','wwwwwwwwwwwwwwwww','asdfga');
/*!40000 ALTER TABLE `huawei_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huawei_employees`
--

DROP TABLE IF EXISTS `huawei_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `huawei_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employeeID` varchar(45) NOT NULL,
  `firstName` varchar(60) NOT NULL,
  `lastName` varchar(60) DEFAULT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huawei_employees`
--

LOCK TABLES `huawei_employees` WRITE;
/*!40000 ALTER TABLE `huawei_employees` DISABLE KEYS */;
INSERT INTO `huawei_employees` VALUES (6,'asdf sdfsadf','sadf dd','asdfasdf','dd'),(7,'WX445227','Sen','Li','');
/*!40000 ALTER TABLE `huawei_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huawei_projectRepo`
--

DROP TABLE IF EXISTS `huawei_projectRepo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `huawei_projectRepo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(40) NOT NULL,
  `path` varchar(120) DEFAULT NULL,
  `description` varchar(16380) DEFAULT NULL,
  `cloneCommand` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huawei_projectRepo`
--

LOCK TABLES `huawei_projectRepo` WRITE;
/*!40000 ALTER TABLE `huawei_projectRepo` DISABLE KEYS */;
INSERT INTO `huawei_projectRepo` VALUES (1,'Knock Knock','dddd','\\\'\"\'\\//\'\'\"\r\nd\\\\/d','fdd///\\\\\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\''),(2,'Hhhsdfadfd','C:\\usr\\root\\Knock......;\'df','hiasoi\'\r\nFodsa\'f;\r\nalsdfdf\r\n\'ldf\r\n\\];\\]/;\\/.d\\gfl.\\[\\d;p3]2\\;534\r\n^$#','\' git clone C:\\usr\\root\\Knock......;\'dfdsfdd'),(4,'Knock Knock Rock','C:\\usr\\root\\Knock......;','Knock Me!\r\nKnock \"Me\"!\r\nKnock @ \'Me\'?','git clone C:\\usr\\root\\Knock......;');
/*!40000 ALTER TABLE `huawei_projectRepo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huawei_sourceCodeRepo`
--

DROP TABLE IF EXISTS `huawei_sourceCodeRepo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `huawei_sourceCodeRepo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(6380) DEFAULT NULL,
  `buildInstruction` varchar(6380) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huawei_sourceCodeRepo`
--

LOCK TABLES `huawei_sourceCodeRepo` WRITE;
/*!40000 ALTER TABLE `huawei_sourceCodeRepo` DISABLE KEYS */;
INSERT INTO `huawei_sourceCodeRepo` VALUES (1,'Huawei MediaWiki','Team Member\r\nSample Devices Tracking\r\nProject Repositories\r\nAndroid Source Code Repo','Let\'s try the easy route first:\r\n\r\nInstall Java 8\r\n\r\nAnt 1.8 or later is required.\r\nClone the source repository from Github.\r\n\r\nOn the command line, enter:\r\ngit clone https://github.com/processing/processing.git','http://localhost/addNewSourceCode.php'),(3,'gww','aaaaaaageas.ee\r\n.\'\'\'\'d\r\n.\'\'\'\"\"','ggggggggggggggawewe\r\n.\r\n,','gaeweeeeeeeeeeeeeeeeeee'),(4,'ssssssssssss','ssgggggggggad\r\nk\r\n/.;l\r\n\r\n:\"\r\n\r\n;\'','klj.\r\n\r\n;oi\r\n/;\r\nol;/','dsfgsdh.;\'l/[p');
/*!40000 ALTER TABLE `huawei_sourceCodeRepo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `img_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `img_size` int(10) unsigned NOT NULL DEFAULT '0',
  `img_width` int(11) NOT NULL DEFAULT '0',
  `img_height` int(11) NOT NULL DEFAULT '0',
  `img_metadata` mediumblob NOT NULL,
  `img_bits` int(11) NOT NULL DEFAULT '0',
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `img_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `img_description` varbinary(767) NOT NULL,
  `img_user` int(10) unsigned NOT NULL DEFAULT '0',
  `img_user_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `img_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `img_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`img_name`),
  KEY `img_usertext_timestamp` (`img_user_text`,`img_timestamp`),
  KEY `img_size` (`img_size`),
  KEY `img_timestamp` (`img_timestamp`),
  KEY `img_sha1` (`img_sha1`(10)),
  KEY `img_media_mime` (`img_media_type`,`img_major_mime`,`img_minor_mime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES ('Sen.jpg',51400,451,451,'a:1:{s:22:\"MEDIAWIKI_EXIF_VERSION\";i:2;}',8,'BITMAP','image','jpeg','Sen Portrait',4,'Admin','20170125033000','01w9h8so5raxtslx1kdk1cstg5pzumg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagelinks`
--

DROP TABLE IF EXISTS `imagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagelinks` (
  `il_from` int(10) unsigned NOT NULL DEFAULT '0',
  `il_from_namespace` int(11) NOT NULL DEFAULT '0',
  `il_to` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  UNIQUE KEY `il_from` (`il_from`,`il_to`),
  KEY `il_to` (`il_to`,`il_from`),
  KEY `il_backlinks_namespace` (`il_from_namespace`,`il_to`,`il_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagelinks`
--

LOCK TABLES `imagelinks` WRITE;
/*!40000 ALTER TABLE `imagelinks` DISABLE KEYS */;
INSERT INTO `imagelinks` VALUES (3,0,'Sen.jpg');
/*!40000 ALTER TABLE `imagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interwiki`
--

DROP TABLE IF EXISTS `interwiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interwiki` (
  `iw_prefix` varchar(32) NOT NULL,
  `iw_url` blob NOT NULL,
  `iw_api` blob NOT NULL,
  `iw_wikiid` varchar(64) NOT NULL,
  `iw_local` tinyint(1) NOT NULL,
  `iw_trans` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `iw_prefix` (`iw_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interwiki`
--

LOCK TABLES `interwiki` WRITE;
/*!40000 ALTER TABLE `interwiki` DISABLE KEYS */;
INSERT INTO `interwiki` VALUES ('acronym','http://www.acronymfinder.com/~/search/af.aspx?string=exact&Acronym=$1','','',0,0),('advogato','http://www.advogato.org/$1','','',0,0),('arxiv','http://www.arxiv.org/abs/$1','','',0,0),('c2find','http://c2.com/cgi/wiki?FindPage&value=$1','','',0,0),('cache','http://www.google.com/search?q=cache:$1','','',0,0),('commons','https://commons.wikimedia.org/wiki/$1','https://commons.wikimedia.org/w/api.php','',0,0),('dictionary','http://www.dict.org/bin/Dict?Database=*&Form=Dict1&Strategy=*&Query=$1','','',0,0),('doi','http://dx.doi.org/$1','','',0,0),('drumcorpswiki','http://www.drumcorpswiki.com/$1','http://drumcorpswiki.com/api.php','',0,0),('dwjwiki','http://www.suberic.net/cgi-bin/dwj/wiki.cgi?$1','','',0,0),('elibre','http://enciclopedia.us.es/index.php/$1','http://enciclopedia.us.es/api.php','',0,0),('emacswiki','http://www.emacswiki.org/cgi-bin/wiki.pl?$1','','',0,0),('foldoc','http://foldoc.org/?$1','','',0,0),('foxwiki','http://fox.wikis.com/wc.dll?Wiki~$1','','',0,0),('freebsdman','http://www.FreeBSD.org/cgi/man.cgi?apropos=1&query=$1','','',0,0),('gentoo-wiki','http://gentoo-wiki.com/$1','','',0,0),('google','http://www.google.com/search?q=$1','','',0,0),('googlegroups','http://groups.google.com/groups?q=$1','','',0,0),('hammondwiki','http://www.dairiki.org/HammondWiki/$1','','',0,0),('hrwiki','http://www.hrwiki.org/wiki/$1','http://www.hrwiki.org/w/api.php','',0,0),('imdb','http://www.imdb.com/find?q=$1&tt=on','','',0,0),('kmwiki','http://kmwiki.wikispaces.com/$1','','',0,0),('linuxwiki','http://linuxwiki.de/$1','','',0,0),('lojban','http://mw.lojban.org/papri/$1','','',0,0),('lqwiki','http://wiki.linuxquestions.org/wiki/$1','','',0,0),('meatball','http://www.usemod.com/cgi-bin/mb.pl?$1','','',0,0),('mediawikiwiki','https://www.mediawiki.org/wiki/$1','https://www.mediawiki.org/w/api.php','',0,0),('memoryalpha','http://en.memory-alpha.org/wiki/$1','http://en.memory-alpha.org/api.php','',0,0),('metawiki','http://sunir.org/apps/meta.pl?$1','','',0,0),('metawikimedia','https://meta.wikimedia.org/wiki/$1','https://meta.wikimedia.org/w/api.php','',0,0),('mozillawiki','http://wiki.mozilla.org/$1','https://wiki.mozilla.org/api.php','',0,0),('mw','https://www.mediawiki.org/wiki/$1','https://www.mediawiki.org/w/api.php','',0,0),('oeis','http://oeis.org/$1','','',0,0),('openwiki','http://openwiki.com/ow.asp?$1','','',0,0),('pmid','https://www.ncbi.nlm.nih.gov/pubmed/$1?dopt=Abstract','','',0,0),('pythoninfo','http://wiki.python.org/moin/$1','','',0,0),('rfc','https://tools.ietf.org/html/rfc$1','','',0,0),('s23wiki','http://s23.org/wiki/$1','http://s23.org/w/api.php','',0,0),('seattlewireless','http://seattlewireless.net/$1','','',0,0),('senseislibrary','http://senseis.xmp.net/?$1','','',0,0),('shoutwiki','http://www.shoutwiki.com/wiki/$1','http://www.shoutwiki.com/w/api.php','',0,0),('squeak','http://wiki.squeak.org/squeak/$1','','',0,0),('theopedia','http://www.theopedia.com/$1','','',0,0),('tmbw','http://www.tmbw.net/wiki/$1','http://tmbw.net/wiki/api.php','',0,0),('tmnet','http://www.technomanifestos.net/?$1','','',0,0),('twiki','http://twiki.org/cgi-bin/view/$1','','',0,0),('uncyclopedia','http://en.uncyclopedia.co/wiki/$1','http://en.uncyclopedia.co/w/api.php','',0,0),('unreal','http://wiki.beyondunreal.com/$1','http://wiki.beyondunreal.com/w/api.php','',0,0),('usemod','http://www.usemod.com/cgi-bin/wiki.pl?$1','','',0,0),('wiki','http://c2.com/cgi/wiki?$1','','',0,0),('wikia','http://www.wikia.com/wiki/$1','','',0,0),('wikibooks','https://en.wikibooks.org/wiki/$1','https://en.wikibooks.org/w/api.php','',0,0),('wikidata','https://www.wikidata.org/wiki/$1','https://www.wikidata.org/w/api.php','',0,0),('wikif1','http://www.wikif1.org/$1','','',0,0),('wikihow','http://www.wikihow.com/$1','http://www.wikihow.com/api.php','',0,0),('wikimedia','https://wikimediafoundation.org/wiki/$1','https://wikimediafoundation.org/w/api.php','',0,0),('wikinews','https://en.wikinews.org/wiki/$1','https://en.wikinews.org/w/api.php','',0,0),('wikinfo','http://wikinfo.co/English/index.php/$1','','',0,0),('wikipedia','https://en.wikipedia.org/wiki/$1','https://en.wikipedia.org/w/api.php','',0,0),('wikiquote','https://en.wikiquote.org/wiki/$1','https://en.wikiquote.org/w/api.php','',0,0),('wikisource','https://wikisource.org/wiki/$1','https://wikisource.org/w/api.php','',0,0),('wikispecies','https://species.wikimedia.org/wiki/$1','https://species.wikimedia.org/w/api.php','',0,0),('wikiversity','https://en.wikiversity.org/wiki/$1','https://en.wikiversity.org/w/api.php','',0,0),('wikivoyage','https://en.wikivoyage.org/wiki/$1','https://en.wikivoyage.org/w/api.php','',0,0),('wikt','https://en.wiktionary.org/wiki/$1','https://en.wiktionary.org/w/api.php','',0,0),('wiktionary','https://en.wiktionary.org/wiki/$1','https://en.wiktionary.org/w/api.php','',0,0);
/*!40000 ALTER TABLE `interwiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipblocks`
--

DROP TABLE IF EXISTS `ipblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipblocks` (
  `ipb_id` int(11) NOT NULL AUTO_INCREMENT,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `ipb_reason` varbinary(767) NOT NULL,
  `ipb_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ipb_auto` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_anon_only` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_create_account` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_enable_autoblock` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_expiry` varbinary(14) NOT NULL DEFAULT '',
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_block_email` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_allow_usertalk` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_parent_block_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ipb_id`),
  UNIQUE KEY `ipb_address` (`ipb_address`(255),`ipb_user`,`ipb_auto`,`ipb_anon_only`),
  KEY `ipb_user` (`ipb_user`),
  KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  KEY `ipb_timestamp` (`ipb_timestamp`),
  KEY `ipb_expiry` (`ipb_expiry`),
  KEY `ipb_parent_block_id` (`ipb_parent_block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipblocks`
--

LOCK TABLES `ipblocks` WRITE;
/*!40000 ALTER TABLE `ipblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iwlinks`
--

DROP TABLE IF EXISTS `iwlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iwlinks` (
  `iwl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `iwl_prefix` varbinary(20) NOT NULL DEFAULT '',
  `iwl_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  UNIQUE KEY `iwl_from` (`iwl_from`,`iwl_prefix`,`iwl_title`),
  KEY `iwl_prefix_title_from` (`iwl_prefix`,`iwl_title`,`iwl_from`),
  KEY `iwl_prefix_from_title` (`iwl_prefix`,`iwl_from`,`iwl_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iwlinks`
--

LOCK TABLES `iwlinks` WRITE;
/*!40000 ALTER TABLE `iwlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `iwlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_cmd` varbinary(60) NOT NULL DEFAULT '',
  `job_namespace` int(11) NOT NULL,
  `job_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `job_timestamp` varbinary(14) DEFAULT NULL,
  `job_params` blob NOT NULL,
  `job_random` int(10) unsigned NOT NULL DEFAULT '0',
  `job_attempts` int(10) unsigned NOT NULL DEFAULT '0',
  `job_token` varbinary(32) NOT NULL DEFAULT '',
  `job_token_timestamp` varbinary(14) DEFAULT NULL,
  `job_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`job_id`),
  KEY `job_sha1` (`job_sha1`),
  KEY `job_cmd_token` (`job_cmd`,`job_token`,`job_random`),
  KEY `job_cmd_token_id` (`job_cmd`,`job_token`,`job_id`),
  KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`,`job_params`(128)),
  KEY `job_timestamp` (`job_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (246,'htmlCacheUpdate',0,'HQ_Android_Released_Image','20170201213937','a:6:{s:5:\"table\";s:8:\"redirect\";s:9:\"recursive\";b:1;s:13:\"rootJobIsSelf\";b:1;s:16:\"rootJobSignature\";s:40:\"135b03b804d2919f63ee3d1f020a45e2f62d7141\";s:16:\"rootJobTimestamp\";s:14:\"20170201213937\";s:9:\"requestId\";s:24:\"aa7cbbe6792fdcb4a61652ce\";}',1891077768,0,'',NULL,'cjik4fij52cdfhwfj84qvkuu83ofu4x');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l10n_cache`
--

DROP TABLE IF EXISTS `l10n_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l10n_cache` (
  `lc_lang` varbinary(32) NOT NULL,
  `lc_key` varchar(255) NOT NULL,
  `lc_value` mediumblob NOT NULL,
  KEY `lc_lang_key` (`lc_lang`,`lc_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l10n_cache`
--

LOCK TABLES `l10n_cache` WRITE;
/*!40000 ALTER TABLE `l10n_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `l10n_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langlinks`
--

DROP TABLE IF EXISTS `langlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `langlinks` (
  `ll_from` int(10) unsigned NOT NULL DEFAULT '0',
  `ll_lang` varbinary(20) NOT NULL DEFAULT '',
  `ll_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  UNIQUE KEY `ll_from` (`ll_from`,`ll_lang`),
  KEY `ll_lang` (`ll_lang`,`ll_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langlinks`
--

LOCK TABLES `langlinks` WRITE;
/*!40000 ALTER TABLE `langlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `langlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_search`
--

DROP TABLE IF EXISTS `log_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_search` (
  `ls_field` varbinary(32) NOT NULL,
  `ls_value` varchar(255) NOT NULL,
  `ls_log_id` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ls_field_val` (`ls_field`,`ls_value`,`ls_log_id`),
  KEY `ls_log_id` (`ls_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_search`
--

LOCK TABLES `log_search` WRITE;
/*!40000 ALTER TABLE `log_search` DISABLE KEYS */;
INSERT INTO `log_search` VALUES ('associated_rev_id','32',22);
/*!40000 ALTER TABLE `log_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logging`
--

DROP TABLE IF EXISTS `logging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logging` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` varbinary(32) NOT NULL DEFAULT '',
  `log_action` varbinary(32) NOT NULL DEFAULT '',
  `log_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  `log_user` int(10) unsigned NOT NULL DEFAULT '0',
  `log_user_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `log_namespace` int(11) NOT NULL DEFAULT '0',
  `log_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `log_page` int(10) unsigned DEFAULT NULL,
  `log_comment` varbinary(767) NOT NULL DEFAULT '',
  `log_params` blob NOT NULL,
  `log_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `type_time` (`log_type`,`log_timestamp`),
  KEY `user_time` (`log_user`,`log_timestamp`),
  KEY `page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  KEY `times` (`log_timestamp`),
  KEY `log_user_type_time` (`log_user`,`log_type`,`log_timestamp`),
  KEY `log_page_id_time` (`log_page`,`log_timestamp`),
  KEY `type_action` (`log_type`,`log_action`,`log_timestamp`),
  KEY `log_user_text_type_time` (`log_user_text`,`log_type`,`log_timestamp`),
  KEY `log_user_text_time` (`log_user_text`,`log_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logging`
--

LOCK TABLES `logging` WRITE;
/*!40000 ALTER TABLE `logging` DISABLE KEYS */;
INSERT INTO `logging` VALUES (1,'patrol','autopatrol','20170124225424',1,'SenLi',2,'SenLi',5,'','a:3:{s:8:\"4::curid\";i:15;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(2,'newusers','create','20170124231254',2,'Liziyuanhaha',2,'Liziyuanhaha',0,'','a:1:{s:9:\"4::userid\";i:2;}',0),(3,'newusers','create','20170124233751',3,'Liziyuanhaha',2,'Liziyuanhaha',0,'','a:1:{s:9:\"4::userid\";i:3;}',0),(4,'patrol','autopatrol','20170125003550',1,'SenLi',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:16;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(5,'patrol','autopatrol','20170125003613',1,'SenLi',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:17;s:9:\"5::previd\";i:16;s:7:\"6::auto\";i:1;}',0),(6,'patrol','autopatrol','20170125003630',1,'SenLi',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:18;s:9:\"5::previd\";i:17;s:7:\"6::auto\";i:1;}',0),(7,'patrol','autopatrol','20170125005325',1,'SenLi',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:19;s:9:\"5::previd\";i:18;s:7:\"6::auto\";i:1;}',0),(8,'patrol','autopatrol','20170125005437',1,'SenLi',0,'Huawei_Wiki',7,'','a:3:{s:8:\"4::curid\";i:20;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(9,'patrol','autopatrol','20170125005459',1,'SenLi',0,'Huawei_Wiki',7,'','a:3:{s:8:\"4::curid\";i:21;s:9:\"5::previd\";i:20;s:7:\"6::auto\";i:1;}',0),(10,'patrol','autopatrol','20170125005737',1,'SenLi',8,'Mainpage',8,'','a:3:{s:8:\"4::curid\";i:22;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(11,'patrol','autopatrol','20170125005814',1,'SenLi',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:23;s:9:\"5::previd\";i:19;s:7:\"6::auto\";i:1;}',0),(12,'patrol','autopatrol','20170125013333',1,'SenLi',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:24;s:9:\"5::previd\";i:13;s:7:\"6::auto\";i:1;}',0),(13,'patrol','autopatrol','20170125013555',1,'SenLi',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:25;s:9:\"5::previd\";i:24;s:7:\"6::auto\";i:1;}',0),(14,'patrol','autopatrol','20170125013612',1,'SenLi',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:26;s:9:\"5::previd\";i:25;s:7:\"6::auto\";i:1;}',0),(15,'patrol','autopatrol','20170125013634',1,'SenLi',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:27;s:9:\"5::previd\";i:26;s:7:\"6::auto\";i:1;}',0),(16,'patrol','autopatrol','20170125013935',1,'SenLi',14,'Employees',9,'','a:3:{s:8:\"4::curid\";i:28;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(17,'patrol','autopatrol','20170125014252',1,'SenLi',1,'Huawei_Wiki',10,'','a:3:{s:8:\"4::curid\";i:29;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(18,'patrol','autopatrol','20170125014355',1,'SenLi',1,'Huawei_Wiki',10,'','a:3:{s:8:\"4::curid\";i:30;s:9:\"5::previd\";i:29;s:7:\"6::auto\";i:1;}',0),(19,'newusers','create','20170125025355',4,'Admin',2,'Admin',0,'','a:1:{s:9:\"4::userid\";i:4;}',0),(20,'rights','rights','20170125025457',1,'SenLi',2,'Admin',0,'','a:2:{s:12:\"4::oldgroups\";a:0:{}s:12:\"5::newgroups\";a:2:{i:0;s:5:\"sysop\";i:1;s:10:\"bureaucrat\";}}',0),(21,'patrol','autopatrol','20170125031740',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:31;s:9:\"5::previd\";i:27;s:7:\"6::auto\";i:1;}',0),(22,'upload','upload','20170125033000',4,'Admin',6,'Sen.jpg',11,'Sen Portrait','a:3:{s:8:\"img_sha1\";s:31:\"01w9h8so5raxtslx1kdk1cstg5pzumg\";s:13:\"img_timestamp\";s:14:\"20170125033000\";s:17:\"associated_rev_id\";i:32;}',0),(23,'patrol','autopatrol','20170125033001',4,'Admin',6,'Sen.jpg',11,'','a:3:{s:8:\"4::curid\";i:32;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(24,'patrol','autopatrol','20170125033145',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:33;s:9:\"5::previd\";i:31;s:7:\"6::auto\";i:1;}',0),(25,'patrol','autopatrol','20170125033305',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:34;s:9:\"5::previd\";i:33;s:7:\"6::auto\";i:1;}',0),(26,'patrol','autopatrol','20170125033327',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:35;s:9:\"5::previd\";i:34;s:7:\"6::auto\";i:1;}',0),(27,'patrol','autopatrol','20170125033535',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:36;s:9:\"5::previd\";i:35;s:7:\"6::auto\";i:1;}',0),(28,'patrol','autopatrol','20170125033641',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:37;s:9:\"5::previd\";i:36;s:7:\"6::auto\";i:1;}',0),(29,'patrol','autopatrol','20170125033655',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:38;s:9:\"5::previd\";i:37;s:7:\"6::auto\";i:1;}',0),(30,'patrol','autopatrol','20170125033850',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:39;s:9:\"5::previd\";i:38;s:7:\"6::auto\";i:1;}',0),(31,'patrol','autopatrol','20170125034143',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:40;s:9:\"5::previd\";i:39;s:7:\"6::auto\";i:1;}',0),(32,'patrol','autopatrol','20170125035327',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:41;s:9:\"5::previd\";i:40;s:7:\"6::auto\";i:1;}',0),(33,'patrol','autopatrol','20170125035412',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:42;s:9:\"5::previd\";i:41;s:7:\"6::auto\";i:1;}',0),(34,'patrol','autopatrol','20170125035434',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:43;s:9:\"5::previd\";i:42;s:7:\"6::auto\";i:1;}',0),(35,'patrol','autopatrol','20170125035624',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:44;s:9:\"5::previd\";i:43;s:7:\"6::auto\";i:1;}',0),(36,'patrol','autopatrol','20170125035642',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:45;s:9:\"5::previd\";i:44;s:7:\"6::auto\";i:1;}',0),(37,'patrol','autopatrol','20170125035654',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:46;s:9:\"5::previd\";i:45;s:7:\"6::auto\";i:1;}',0),(38,'patrol','autopatrol','20170126181036',4,'Admin',10,'TableTestTemplate',12,'','a:3:{s:8:\"4::curid\";i:49;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(39,'patrol','autopatrol','20170126181037',4,'Admin',106,'Employees',13,'','a:3:{s:8:\"4::curid\";i:50;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(40,'patrol','autopatrol','20170126194236',4,'Admin',14,'Employees',9,'','a:3:{s:8:\"4::curid\";i:51;s:9:\"5::previd\";i:28;s:7:\"6::auto\";i:1;}',0),(41,'patrol','autopatrol','20170126210502',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:52;s:9:\"5::previd\";i:48;s:7:\"6::auto\";i:1;}',0),(42,'patrol','autopatrol','20170126215629',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:53;s:9:\"5::previd\";i:52;s:7:\"6::auto\";i:1;}',0),(43,'patrol','autopatrol','20170126215649',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:54;s:9:\"5::previd\";i:53;s:7:\"6::auto\";i:1;}',0),(44,'patrol','autopatrol','20170126215843',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:55;s:9:\"5::previd\";i:54;s:7:\"6::auto\";i:1;}',0),(45,'patrol','autopatrol','20170126215858',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:56;s:9:\"5::previd\";i:55;s:7:\"6::auto\";i:1;}',0),(46,'patrol','autopatrol','20170126221832',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:57;s:9:\"5::previd\";i:46;s:7:\"6::auto\";i:1;}',0),(47,'patrol','autopatrol','20170126221853',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:58;s:9:\"5::previd\";i:57;s:7:\"6::auto\";i:1;}',0),(48,'patrol','autopatrol','20170126222106',4,'Admin',10,'TableTestTemplate',12,'','a:3:{s:8:\"4::curid\";i:59;s:9:\"5::previd\";i:49;s:7:\"6::auto\";i:1;}',0),(49,'patrol','autopatrol','20170126222122',4,'Admin',10,'TableTestTemplate',12,'','a:3:{s:8:\"4::curid\";i:60;s:9:\"5::previd\";i:59;s:7:\"6::auto\";i:1;}',0),(50,'patrol','autopatrol','20170126222140',4,'Admin',10,'TableTestTemplate',12,'','a:3:{s:8:\"4::curid\";i:61;s:9:\"5::previd\";i:60;s:7:\"6::auto\";i:1;}',0),(51,'patrol','autopatrol','20170126222625',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:62;s:9:\"5::previd\";i:56;s:7:\"6::auto\";i:1;}',0),(52,'patrol','autopatrol','20170126222902',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:63;s:9:\"5::previd\";i:62;s:7:\"6::auto\";i:1;}',0),(53,'patrol','autopatrol','20170126232844',4,'Admin',274,'Iframe',14,'','a:3:{s:8:\"4::curid\";i:64;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(54,'patrol','autopatrol','20170126233045',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:65;s:9:\"5::previd\";i:63;s:7:\"6::auto\";i:1;}',0),(55,'patrol','autopatrol','20170126233701',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:66;s:9:\"5::previd\";i:65;s:7:\"6::auto\";i:1;}',0),(56,'patrol','autopatrol','20170126235115',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:67;s:9:\"5::previd\";i:66;s:7:\"6::auto\";i:1;}',0),(57,'patrol','autopatrol','20170126235248',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:68;s:9:\"5::previd\";i:67;s:7:\"6::auto\";i:1;}',0),(58,'patrol','autopatrol','20170126235257',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:69;s:9:\"5::previd\";i:68;s:7:\"6::auto\";i:1;}',0),(59,'patrol','autopatrol','20170126235634',4,'Admin',274,'Iframe',14,'','a:3:{s:8:\"4::curid\";i:70;s:9:\"5::previd\";i:64;s:7:\"6::auto\";i:1;}',0),(60,'patrol','autopatrol','20170127001141',4,'Admin',274,'Iframe',14,'','a:3:{s:8:\"4::curid\";i:71;s:9:\"5::previd\";i:70;s:7:\"6::auto\";i:1;}',0),(61,'patrol','autopatrol','20170127001205',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:72;s:9:\"5::previd\";i:69;s:7:\"6::auto\";i:1;}',0),(62,'patrol','autopatrol','20170127001215',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:73;s:9:\"5::previd\";i:72;s:7:\"6::auto\";i:1;}',0),(63,'patrol','autopatrol','20170127002301',4,'Admin',274,'Iframe',14,'','a:3:{s:8:\"4::curid\";i:74;s:9:\"5::previd\";i:71;s:7:\"6::auto\";i:1;}',0),(64,'patrol','autopatrol','20170127002317',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:75;s:9:\"5::previd\";i:73;s:7:\"6::auto\";i:1;}',0),(65,'patrol','autopatrol','20170127002423',4,'Admin',274,'Iframe',14,'','a:3:{s:8:\"4::curid\";i:76;s:9:\"5::previd\";i:74;s:7:\"6::auto\";i:1;}',0),(66,'patrol','autopatrol','20170127002502',4,'Admin',274,'Iframe',14,'','a:3:{s:8:\"4::curid\";i:77;s:9:\"5::previd\";i:76;s:7:\"6::auto\";i:1;}',0),(67,'patrol','autopatrol','20170127002656',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:78;s:9:\"5::previd\";i:75;s:7:\"6::auto\";i:1;}',0),(68,'patrol','autopatrol','20170127003049',4,'Admin',274,'Iframe',14,'','a:3:{s:8:\"4::curid\";i:79;s:9:\"5::previd\";i:77;s:7:\"6::auto\";i:1;}',0),(69,'patrol','autopatrol','20170130165228',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:80;s:9:\"5::previd\";i:78;s:7:\"6::auto\";i:1;}',0),(70,'patrol','autopatrol','20170130165712',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:81;s:9:\"5::previd\";i:80;s:7:\"6::auto\";i:1;}',0),(71,'patrol','autopatrol','20170130171224',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:82;s:9:\"5::previd\";i:81;s:7:\"6::auto\";i:1;}',0),(72,'patrol','autopatrol','20170130190021',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:83;s:9:\"5::previd\";i:82;s:7:\"6::auto\";i:1;}',0),(73,'patrol','autopatrol','20170130190056',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:84;s:9:\"5::previd\";i:83;s:7:\"6::auto\";i:1;}',0),(74,'patrol','autopatrol','20170130191155',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:85;s:9:\"5::previd\";i:84;s:7:\"6::auto\";i:1;}',0),(75,'patrol','autopatrol','20170130193939',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:86;s:9:\"5::previd\";i:85;s:7:\"6::auto\";i:1;}',0),(76,'patrol','autopatrol','20170130193956',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:87;s:9:\"5::previd\";i:86;s:7:\"6::auto\";i:1;}',0),(77,'patrol','autopatrol','20170130194004',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:88;s:9:\"5::previd\";i:87;s:7:\"6::auto\";i:1;}',0),(78,'patrol','autopatrol','20170130194020',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:89;s:9:\"5::previd\";i:88;s:7:\"6::auto\";i:1;}',0),(79,'patrol','autopatrol','20170130194029',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:90;s:9:\"5::previd\";i:89;s:7:\"6::auto\";i:1;}',0),(80,'patrol','autopatrol','20170130194042',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:91;s:9:\"5::previd\";i:90;s:7:\"6::auto\";i:1;}',0),(81,'patrol','autopatrol','20170130194050',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:92;s:9:\"5::previd\";i:91;s:7:\"6::auto\";i:1;}',0),(82,'patrol','autopatrol','20170130194712',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:93;s:9:\"5::previd\";i:92;s:7:\"6::auto\";i:1;}',0),(83,'patrol','autopatrol','20170130195003',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:94;s:9:\"5::previd\";i:93;s:7:\"6::auto\";i:1;}',0),(84,'patrol','autopatrol','20170130195230',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:95;s:9:\"5::previd\";i:94;s:7:\"6::auto\";i:1;}',0),(85,'patrol','autopatrol','20170130200046',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:96;s:9:\"5::previd\";i:95;s:7:\"6::auto\";i:1;}',0),(86,'patrol','autopatrol','20170131032317',4,'Admin',0,'Huawei_Wiki',7,'','a:3:{s:8:\"4::curid\";i:97;s:9:\"5::previd\";i:21;s:7:\"6::auto\";i:1;}',0),(87,'patrol','autopatrol','20170131032344',4,'Admin',0,'Huawei_Wiki',7,'','a:3:{s:8:\"4::curid\";i:98;s:9:\"5::previd\";i:97;s:7:\"6::auto\";i:1;}',0),(88,'patrol','autopatrol','20170131183559',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:99;s:9:\"5::previd\";i:96;s:7:\"6::auto\";i:1;}',0),(89,'patrol','autopatrol','20170131183615',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:100;s:9:\"5::previd\";i:99;s:7:\"6::auto\";i:1;}',0),(90,'patrol','autopatrol','20170131222055',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:131;s:9:\"5::previd\";i:23;s:7:\"6::auto\";i:1;}',0),(91,'patrol','autopatrol','20170131222135',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:132;s:9:\"5::previd\";i:131;s:7:\"6::auto\";i:1;}',0),(92,'patrol','autopatrol','20170131222208',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:133;s:9:\"5::previd\";i:132;s:7:\"6::auto\";i:1;}',0),(93,'patrol','autopatrol','20170131222222',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:134;s:9:\"5::previd\";i:133;s:7:\"6::auto\";i:1;}',0),(94,'patrol','autopatrol','20170131224959',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:135;s:9:\"5::previd\";i:130;s:7:\"6::auto\";i:1;}',0),(95,'patrol','autopatrol','20170131225357',4,'Admin',0,'Team_Member',15,'','a:3:{s:8:\"4::curid\";i:136;s:9:\"5::previd\";i:103;s:7:\"6::auto\";i:1;}',0),(96,'patrol','autopatrol','20170131225504',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:137;s:9:\"5::previd\";i:135;s:7:\"6::auto\";i:1;}',0),(97,'patrol','autopatrol','20170131230225',4,'Admin',0,'Team_Member',15,'','a:3:{s:8:\"4::curid\";i:138;s:9:\"5::previd\";i:136;s:7:\"6::auto\";i:1;}',0),(98,'patrol','autopatrol','20170131230413',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:139;s:9:\"5::previd\";i:137;s:7:\"6::auto\";i:1;}',0),(99,'patrol','autopatrol','20170131230441',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:140;s:9:\"5::previd\";i:139;s:7:\"6::auto\";i:1;}',0),(100,'patrol','autopatrol','20170131230634',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:141;s:9:\"5::previd\";i:140;s:7:\"6::auto\";i:1;}',0),(101,'patrol','autopatrol','20170131230659',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:142;s:9:\"5::previd\";i:141;s:7:\"6::auto\";i:1;}',0),(102,'patrol','autopatrol','20170131230726',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:143;s:9:\"5::previd\";i:142;s:7:\"6::auto\";i:1;}',0),(103,'patrol','autopatrol','20170201011300',4,'Admin',0,'Huawei_Wiki',7,'','a:3:{s:8:\"4::curid\";i:144;s:9:\"5::previd\";i:126;s:7:\"6::auto\";i:1;}',0),(104,'patrol','autopatrol','20170201011339',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:145;s:9:\"5::previd\";i:143;s:7:\"6::auto\";i:1;}',0),(105,'patrol','autopatrol','20170201011425',4,'Admin',0,'Project_Repositories',20,'','a:3:{s:8:\"4::curid\";i:146;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(106,'patrol','autopatrol','20170201021140',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:147;s:9:\"5::previd\";i:134;s:7:\"6::auto\";i:1;}',0),(107,'patrol','autopatrol','20170201182451',4,'Admin',0,'Project_Repositories',20,'','a:3:{s:8:\"4::curid\";i:148;s:9:\"5::previd\";i:146;s:7:\"6::auto\";i:1;}',0),(108,'patrol','autopatrol','20170201182509',4,'Admin',0,'Project_Repositories',20,'','a:3:{s:8:\"4::curid\";i:149;s:9:\"5::previd\";i:148;s:7:\"6::auto\";i:1;}',0),(109,'patrol','autopatrol','20170201182906',4,'Admin',0,'Project_Repositories',20,'','a:3:{s:8:\"4::curid\";i:150;s:9:\"5::previd\";i:149;s:7:\"6::auto\";i:1;}',0),(110,'patrol','autopatrol','20170201192422',4,'Admin',0,'Huawei_Wiki',7,'','a:3:{s:8:\"4::curid\";i:151;s:9:\"5::previd\";i:144;s:7:\"6::auto\";i:1;}',0),(111,'patrol','autopatrol','20170201192457',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:152;s:9:\"5::previd\";i:147;s:7:\"6::auto\";i:1;}',0),(112,'patrol','autopatrol','20170201192508',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:153;s:9:\"5::previd\";i:152;s:7:\"6::auto\";i:1;}',0),(113,'patrol','autopatrol','20170201200113',4,'Admin',0,'Android_Source_Code_Repo',21,'','a:3:{s:8:\"4::curid\";i:154;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(114,'patrol','autopatrol','20170201201603',4,'Admin',0,'Android_Source_Code_Repo',21,'','a:3:{s:8:\"4::curid\";i:155;s:9:\"5::previd\";i:154;s:7:\"6::auto\";i:1;}',0),(115,'patrol','autopatrol','20170201201622',4,'Admin',0,'Android_Source_Code_Repo',21,'','a:3:{s:8:\"4::curid\";i:156;s:9:\"5::previd\";i:155;s:7:\"6::auto\";i:1;}',0),(116,'patrol','autopatrol','20170201204520',4,'Admin',0,'Huawei_Wiki',7,'','a:3:{s:8:\"4::curid\";i:157;s:9:\"5::previd\";i:151;s:7:\"6::auto\";i:1;}',0),(117,'patrol','autopatrol','20170201204646',4,'Admin',0,'HQ_Android_Released_Image',22,'','a:3:{s:8:\"4::curid\";i:158;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(118,'patrol','autopatrol','20170201204714',4,'Admin',0,'HQ_Android_Released_Image',22,'','a:3:{s:8:\"4::curid\";i:159;s:9:\"5::previd\";i:158;s:7:\"6::auto\";i:1;}',0),(119,'patrol','autopatrol','20170201211654',4,'Admin',0,'HQ_Android_Released_Image',22,'','a:3:{s:8:\"4::curid\";i:160;s:9:\"5::previd\";i:159;s:7:\"6::auto\";i:1;}',0),(120,'patrol','autopatrol','20170201211710',4,'Admin',0,'HQ_Android_Released_Image',22,'','a:3:{s:8:\"4::curid\";i:161;s:9:\"5::previd\";i:160;s:7:\"6::auto\";i:1;}',0),(121,'patrol','autopatrol','20170201212744',4,'Admin',0,'HQ_Android_Released_Image',22,'','a:3:{s:8:\"4::curid\";i:162;s:9:\"5::previd\";i:161;s:7:\"6::auto\";i:1;}',0),(122,'patrol','autopatrol','20170201212929',4,'Admin',0,'HQ_Android_Released_Image',22,'','a:3:{s:8:\"4::curid\";i:163;s:9:\"5::previd\";i:162;s:7:\"6::auto\";i:1;}',0),(123,'patrol','autopatrol','20170201213822',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:164;s:9:\"5::previd\";i:153;s:7:\"6::auto\";i:1;}',0),(124,'patrol','autopatrol','20170201213937',4,'Admin',0,'HQ_Android_Released_Image',22,'','a:3:{s:8:\"4::curid\";i:165;s:9:\"5::previd\";i:163;s:7:\"6::auto\";i:1;}',0);
/*!40000 ALTER TABLE `logging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_deps`
--

DROP TABLE IF EXISTS `module_deps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_deps` (
  `md_module` varbinary(255) NOT NULL,
  `md_skin` varbinary(32) NOT NULL,
  `md_deps` mediumblob NOT NULL,
  UNIQUE KEY `md_module_skin` (`md_module`,`md_skin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_deps`
--

LOCK TABLES `module_deps` WRITE;
/*!40000 ALTER TABLE `module_deps` DISABLE KEYS */;
INSERT INTO `module_deps` VALUES ('ext.pageforms.collapsible','vector|en','[\"extensions/PageForms/skins/collapse-minus.png\",\"extensions/PageForms/skins/collapse-plus.png\"]'),('ext.pageforms.dynatree','vector|en','[\"extensions/PageForms/skins/dyntree-loading.gif\",\"extensions/PageForms/skins/icons.gif\",\"extensions/PageForms/skins/vline.gif\"]'),('ext.pageforms.fancybox','vector|en','[\"extensions/PageForms/skins/blank.gif\",\"extensions/PageForms/skins/fancy_title_over.png\",\"extensions/PageForms/skins/fancybox-x.png\",\"extensions/PageForms/skins/fancybox-y.png\",\"extensions/PageForms/skins/fancybox.png\"]'),('ext.pageforms.main','vector|en','[\"extensions/PageForms/skins/PF_add_above.png\",\"extensions/PageForms/skins/PF_add_above_active.png\",\"extensions/PageForms/skins/PF_add_above_hover.png\",\"extensions/PageForms/skins/PF_remove.png\",\"extensions/PageForms/skins/PF_remove_active.png\",\"extensions/PageForms/skins/PF_remove_hover.png\",\"extensions/PageForms/skins/rearrangeDots.png\"]'),('ext.pageforms.select2','vector|en','[\"extensions/PageForms/skins/select2/select2-spinner.gif\",\"extensions/PageForms/skins/select2/select2.png\",\"extensions/PageForms/skins/select2/select2x2.png\"]'),('jquery.spinner','vector|en','[\"resources/src/jquery/images/spinner-large.gif\",\"resources/src/jquery/images/spinner.gif\"]'),('jquery.tablesorter','vector|en','[\"resources/src/jquery/images/sort_both.png\",\"resources/src/jquery/images/sort_both.svg\",\"resources/src/jquery/images/sort_down.png\",\"resources/src/jquery/images/sort_down.svg\",\"resources/src/jquery/images/sort_up.png\",\"resources/src/jquery/images/sort_up.svg\",\"resources/src/jquery/jquery.tablesorter.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),('jquery.ui.button','vector|en','[\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_ffffff_256x240.png\"]'),('jquery.ui.core','vector|en','[\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_flat_100_000000_40x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_flat_15_cd0a0a_40x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_flat_70_000000_40x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_highlight-hard_100_f2f5f7_1x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_highlight-hard_80_d7ebf9_1x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_highlight-soft_100_e4f1fb_1x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_highlight-soft_100_ffffff_1x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_highlight-soft_25_ffef8f_1x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_inset-hard_100_f0f0f0_1x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_2694e8_256x240.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_2e83ff_256x240.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_3d80b3_256x240.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_666666_256x240.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_72a7cf_256x240.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_ffffff_256x240.png\"]'),('jquery.ui.core.styles','vector|en','[\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_flat_0_aaaaaa_40x100.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_flat_75_ffffff_40x100.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_glass_55_fbf9ee_1x400.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_glass_65_ffffff_1x400.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_glass_75_dadada_1x400.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_glass_75_e6e6e6_1x400.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_glass_95_fef1ec_1x400.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_highlight-soft_75_cccccc_1x100.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-icons_222222_256x240.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-icons_2e83ff_256x240.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-icons_454545_256x240.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-icons_888888_256x240.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-icons_cd0a0a_256x240.png\"]'),('mediawiki.action.view.categoryPage.styles','vector|en','[\"resources/src/mediawiki.action/mediawiki.action.view.categoryPage.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),('mediawiki.action.view.filepage','vector|en','[\"resources/src/mediawiki.action/images/checker.png\"]'),('mediawiki.action.view.postEdit','vector|en','[\"resources/src/mediawiki.action/images/green-checkmark.png\"]'),('mediawiki.feedlink','vector|en','[\"resources/src/mediawiki/images/feed-icon.png\",\"resources/src/mediawiki/images/feed-icon.svg\"]'),('mediawiki.helplink','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki/images/help.png\",\"resources/src/mediawiki/images/help.svg\",\"resources/src/mediawiki/mediawiki.helplink.less\"]'),('mediawiki.htmlform.styles','vector|en','[\"resources/src/mediawiki/htmlform/images/question.png\",\"resources/src/mediawiki/htmlform/images/question.svg\"]'),('mediawiki.icon','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki/images/arrow-collapsed-ltr.png\",\"resources/src/mediawiki/images/arrow-collapsed-ltr.svg\",\"resources/src/mediawiki/images/arrow-expanded.png\",\"resources/src/mediawiki/images/arrow-expanded.svg\",\"resources/src/mediawiki/mediawiki.icon.less\"]'),('mediawiki.legacy.shared','vector|en','[\"resources/src/mediawiki.legacy/images/ajax-loader.gif\",\"resources/src/mediawiki.legacy/images/spinner.gif\"]'),('mediawiki.notification','vector|en','[\"skins/Vector/skinStyles/mediawiki.notification.less\",\"skins/Vector/variables.less\"]'),('mediawiki.notification.convertmessagebox.styles','vector|en','[\"resources/src/mediawiki/mediawiki.notification.convertmessagebox.styles.less\"]'),('mediawiki.pager.tablePager','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki/images/arrow-sort-ascending.png\",\"resources/src/mediawiki/images/arrow-sort-ascending.svg\",\"resources/src/mediawiki/images/arrow-sort-descending.png\",\"resources/src/mediawiki/images/arrow-sort-descending.svg\",\"resources/src/mediawiki/images/pager-arrow-disabled-fastforward-ltr.png\",\"resources/src/mediawiki/images/pager-arrow-disabled-fastforward-ltr.svg\",\"resources/src/mediawiki/images/pager-arrow-disabled-fastforward-rtl.png\",\"resources/src/mediawiki/images/pager-arrow-disabled-fastforward-rtl.svg\",\"resources/src/mediawiki/images/pager-arrow-disabled-forward-ltr.png\",\"resources/src/mediawiki/images/pager-arrow-disabled-forward-ltr.svg\",\"resources/src/mediawiki/images/pager-arrow-disabled-forward-rtl.png\",\"resources/src/mediawiki/images/pager-arrow-disabled-forward-rtl.svg\",\"resources/src/mediawiki/images/pager-arrow-fastforward-ltr.png\",\"resources/src/mediawiki/images/pager-arrow-fastforward-ltr.svg\",\"resources/src/mediawiki/images/pager-arrow-fastforward-rtl.png\",\"resources/src/mediawiki/images/pager-arrow-fastforward-rtl.svg\",\"resources/src/mediawiki/images/pager-arrow-forward-ltr.png\",\"resources/src/mediawiki/images/pager-arrow-forward-ltr.svg\",\"resources/src/mediawiki/images/pager-arrow-forward-rtl.png\",\"resources/src/mediawiki/images/pager-arrow-forward-rtl.svg\",\"resources/src/mediawiki/mediawiki.pager.tablePager.less\"]'),('mediawiki.skinning.interface','vector|en','[\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.svg\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.svg\"]'),('mediawiki.special','vector|en','[\"skins/Vector/skinStyles/mediawiki.special.less\"]'),('mediawiki.special.preferences.styles','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"skins/Vector/images/preferences/break.png\",\"skins/Vector/images/preferences/fade.png\",\"skins/Vector/skinStyles/mediawiki.special.preferences.styles.less\",\"skins/Vector/variables.less\"]'),('mediawiki.special.userlogin.common.styles','vector|en','[\"resources/src/mediawiki.special/images/icon-lock.png\"]'),('mediawiki.special.userlogin.login.styles','vector|en','[\"resources/src/mediawiki.special/images/glyph-people-large.png\"]'),('mediawiki.special.userlogin.signup.styles','vector|en','[\"resources/src/mediawiki.special/images/icon-contributors.png\",\"resources/src/mediawiki.special/images/icon-edits.png\",\"resources/src/mediawiki.special/images/icon-pages.png\"]'),('mediawiki.toolbar','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.toolbar/images/en/button_bold.png\",\"resources/src/mediawiki.toolbar/images/en/button_extlink.png\",\"resources/src/mediawiki.toolbar/images/en/button_headline.png\",\"resources/src/mediawiki.toolbar/images/en/button_hr.png\",\"resources/src/mediawiki.toolbar/images/en/button_image.png\",\"resources/src/mediawiki.toolbar/images/en/button_italic.png\",\"resources/src/mediawiki.toolbar/images/en/button_link.png\",\"resources/src/mediawiki.toolbar/images/en/button_media.png\",\"resources/src/mediawiki.toolbar/images/en/button_nowiki.png\",\"resources/src/mediawiki.toolbar/images/en/button_sig.png\",\"resources/src/mediawiki.toolbar/toolbar.less\"]'),('mediawiki.ui','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/forms.less\",\"resources/src/mediawiki.ui/components/utilities.less\",\"resources/src/mediawiki.ui/default.less\"]'),('mediawiki.ui.button','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/buttons.less\"]'),('mediawiki.ui.checkbox','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/checkbox.less\",\"resources/src/mediawiki.ui/components/images/checked.png\",\"resources/src/mediawiki.ui/components/images/checked.svg\",\"resources/src/mediawiki.ui/components/images/checked_disabled.png\",\"resources/src/mediawiki.ui/components/images/checked_disabled.svg\"]'),('mediawiki.ui.input','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/inputs.less\"]'),('mediawiki.ui.radio','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/images/radio_checked.png\",\"resources/src/mediawiki.ui/components/images/radio_checked.svg\",\"resources/src/mediawiki.ui/components/images/radio_disabled.png\",\"resources/src/mediawiki.ui/components/images/radio_disabled.svg\",\"resources/src/mediawiki.ui/components/radio.less\"]'),('mediawiki.widgets','vector|en','[\"resources/src/mediawiki.widgets/mw.widgets.TitleWidget.less\"]'),('oojs-ui-core.styles','vector|en','[\"resources/lib/oojs-ui/themes/mediawiki/images/icons/check-invert.png\",\"resources/lib/oojs-ui/themes/mediawiki/images/icons/check-invert.svg\",\"resources/lib/oojs-ui/themes/mediawiki/images/textures/pending.gif\",\"skins/Vector/skinStyles/ooui.less\"]'),('oojs-ui-widgets','vector|en','[\"resources/lib/oojs-ui/images/grab.cur\",\"resources/lib/oojs-ui/images/grabbing.cur\"]'),('skins.vector.styles','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.animation.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.mixins.rotation.less\",\"skins/Vector/components/common.less\",\"skins/Vector/components/externalLinks.less\",\"skins/Vector/components/footer.less\",\"skins/Vector/components/navigation.less\",\"skins/Vector/components/personalMenu.less\",\"skins/Vector/components/search.less\",\"skins/Vector/components/tabs.less\",\"skins/Vector/components/watchstar.less\",\"skins/Vector/images/arrow-down-focus-icon.png\",\"skins/Vector/images/arrow-down-focus-icon.svg\",\"skins/Vector/images/arrow-down-icon.png\",\"skins/Vector/images/arrow-down-icon.svg\",\"skins/Vector/images/bullet-icon.png\",\"skins/Vector/images/bullet-icon.svg\",\"skins/Vector/images/external-link-ltr-icon.png\",\"skins/Vector/images/external-link-ltr-icon.svg\",\"skins/Vector/images/page-fade.png\",\"skins/Vector/images/portal-break.png\",\"skins/Vector/images/search-fade.png\",\"skins/Vector/images/search-ltr.png\",\"skins/Vector/images/search-ltr.svg\",\"skins/Vector/images/tab-break.png\",\"skins/Vector/images/tab-current-fade.png\",\"skins/Vector/images/tab-normal-fade.png\",\"skins/Vector/images/unwatch-icon-hl.png\",\"skins/Vector/images/unwatch-icon-hl.svg\",\"skins/Vector/images/unwatch-icon.png\",\"skins/Vector/images/unwatch-icon.svg\",\"skins/Vector/images/user-icon.png\",\"skins/Vector/images/user-icon.svg\",\"skins/Vector/images/watch-icon-hl.png\",\"skins/Vector/images/watch-icon-hl.svg\",\"skins/Vector/images/watch-icon-loading.png\",\"skins/Vector/images/watch-icon-loading.svg\",\"skins/Vector/images/watch-icon.png\",\"skins/Vector/images/watch-icon.svg\",\"skins/Vector/screen-hd.less\",\"skins/Vector/screen.less\",\"skins/Vector/variables.less\"]');
/*!40000 ALTER TABLE `module_deps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objectcache`
--

DROP TABLE IF EXISTS `objectcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectcache` (
  `keyname` varbinary(255) NOT NULL DEFAULT '',
  `value` mediumblob,
  `exptime` datetime DEFAULT NULL,
  PRIMARY KEY (`keyname`),
  KEY `exptime` (`exptime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectcache`
--

LOCK TABLES `objectcache` WRITE;
/*!40000 ALTER TABLE `objectcache` DISABLE KEYS */;
INSERT INTO `objectcache` VALUES ('Sen_wiki_DB:MWSession:8fochfndl5f3jegbjkjqdj23nnje6ou7','�Q�n� ��\0l�1��fh�����K��!����T��!I;t�ƻ��{�V���+zҤ��f�ȇ��W�6��^����$Ly��\Z�q�y./h�P\n��f؁(�=FoJ=`D�\"0��\n�w��\'�� �vz>Mw��\n�1]	!))2ZPVt�i��N�zY.���m�����}7��V)�F0����C�=��\r^����y��ko�9���d�ڵJԿ���Q�Zjg]�O��vQ�>?G���4�KQ�*�y�>���e�\"I6���OIxY�','2017-02-01 22:46:43'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:0408bd1e827336c91abe8ad58a9e19e76b255048','+�24�R22047042504165U�\0','2017-02-22 01:43:55'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:05d4331fbd42215e56d49df6063fc15d3ef8cc71','+�24�R22047042122512Q�\0','2017-02-21 22:54:24'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:1179a9d962abaf9c9a7dbe1c6ca54a281e7e49e1','+�24�R22047\0F��FFJ�\0','2017-03-01 21:38:22'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:119b78401feec80ee7170226442ef1293193054f','+�24�R22047042500655P�\0','2017-02-22 00:35:51'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:12da487f0bb36a5a7179e24460a266593bed7c97','+�24�R22047046424�4�T�\0','2017-02-28 21:59:59'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:135b03b804d2919f63ee3d1f020a45e2f62d7141','+�24�R22047\0F�Ɩ��J�\0','2017-03-01 21:39:37'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:16dd0c455e760f6c6658766534973cac3b7ce8f2','+�24�R22047042122052P�\0','2017-02-21 22:05:20'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:1a6c46a8a3f0212d42a3555159a470bfb635cadd','+�24�R220470423�4126S�\0','2017-02-23 19:42:36'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:234abbb8d1743c7865b2db92f8c1fe3ead206b7a','+�24�R22047\0���ƖJ�\0','2017-03-01 01:13:39'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:23fc69a9a7943845b9d1092f0ebe9d906438f710','+�24�R220470464�4072T�\0','2017-02-28 19:07:21'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:2b429f0fc0a917ab1c0b95dd0ed10252578d7395','+�24�R2204704642202�P�\0','2017-02-28 22:02:48'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:341aefe8a360fb43384dd8446e614308e983011d','+�24�R22047\0F&f&fJ�\0','2017-03-01 20:46:46'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:35480bb6ad31d82788b982e364a6fdecbcc24f91','+�24�R22047\0�F�fJ�\0','2017-03-01 18:29:06'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:36d4a14e17acaf6a123382efb0e788ed10421b78','+�24�R22047046426022U�\0','2017-02-28 23:02:25'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:3c0bb7368b9881e01b86dd4613268d78862beb39','+�24�R22047046424�44T�\0','2017-02-28 21:59:11'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:44229608879fc65677b8d592f5aaae0fd0c43611','+�24�R22047042500516W�\0','2017-02-22 00:54:37'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:46576c51ced8a42f5a854b1cc706cb1ab6a7ea23','+�24�R220470464�0634U�\0','2017-02-28 18:36:15'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:4882224e9e4f4131b450c64bfd3645a327ea04fd','+�24�R22047042504165U�\0','2017-02-22 01:43:55'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:4acca7fc35ad3b47ecc3011fa4e89b502b6793cf','+�24�R22047\0@dfd�d\r\0','2017-03-01 20:16:22'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:4cc3a5c71c85610d4448eb126b1373f0566a0c41','+�24�R22047042504125R�\0','2017-02-22 01:42:52'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:5003e16d4b52e48c386de155c91605475e7cd2e4','+�24�R22047046422�41U�\0','2017-02-28 22:09:45'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:5554965aebc58ecf1f75f441070b7380e7c3bb12','+�24�R22047042500576W�\0','2017-02-22 00:57:37'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:57188bec890d83f7f4c186523ed0179affc55af8','+�24�R220470464�0634U�\0','2017-02-28 18:36:15'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:5ac5e01b4980e5621025a49edc2cf8900fb65830','+�24�R22047\0F&�FJ�\0','2017-03-01 20:45:20'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:7ed42d95b43765319b848231c8f8da30b38bae98','+�24�R2204704642202�P�\0','2017-02-28 22:02:48'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:88f7313a58c80cd522a7e31b506b886ae984e226','+�24�R22047\0�F�fJ�\0','2017-03-01 18:29:06'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:894cbe72f8d9589d7f015980e6010ea2b5317552','+�24�R22047042322�05V�\0','2017-02-23 22:18:53'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:906140d54ed4d9061d5769dd24a78a86ce08c1f2','+�24�R22047\0@dfd�d\r\0','2017-03-01 20:16:22'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:936265a819aa9fd36bfd6d955575dd8e43024125','+�24�R2204704212�̔�','2017-02-21 22:20:16'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:948863d96085780f9090273630db8ceb2258e6ed','+�24�R22047\0��&FfJ�\0','2017-03-01 01:14:26'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:98dbdf12190fdf160ca15500f2031d07bcc5e152','+�24�R2204704270060�T�\0','2017-02-24 00:30:49'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:9b395c485c1adc62d3e274ea228569d760627757','+�24�R2204704642456�T�\0','2017-02-28 21:53:19'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:a30ce35bf32cb60724dfe75e5398985be0a184a8','+�24�R22047\0F���J�\0','2017-03-01 20:01:14'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:a91337fe1053757fa7ee9298f9b721a7776e5966','+�24�R22047\0F&�FJ�\0','2017-03-01 20:45:20'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:abd874b6b03bd106c670628b6eac536663e85667','+�24�R22047042506600T�\0','2017-02-22 03:30:01'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:aca8cce46d4fd7fb454d689180d300cdea261296','+�24�R22047042322241P�\0','2017-02-23 22:21:40'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:b41fb2c6dbf6387644315eee1163a040f8eaa16e','+�24�R22047042322�05V�\0','2017-02-23 22:18:53'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:b83f18bb7cc8c50fd322d1dd0c1f29e3c83d8b88','+�24�R22047\0F�Ɩ��J�\0','2017-03-01 21:39:37'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:bad40e7f1868e43a506f86621f31a5251af264d7','+�24�R22047\0���ƖJ�\0','2017-03-01 01:13:39'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:c2ed8b92f9d3c97a9a3cc9e30005d5232659844e','+�24�R22047\0F��FFJ�\0','2017-03-01 21:38:22'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:c5a18bc6dc8ee05c8c45b0c07dc4d75bd29514da','+�24�R22047042504�46U�\0','2017-02-22 01:39:36'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:c74b7bf1c3330597ed2831be0cd479c6a6f70250','+�24�R22047042322241P�\0','2017-02-23 22:21:40'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:c9308000b8216630965e2fce922d80b432336188','+�24�R2204704270060�T�\0','2017-02-24 00:30:49'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:ce1b99d07cc62402a199a1df16bb1f5870bd8e4b','+�24�R22047046422�41U�\0','2017-02-28 22:09:45'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:d09da34c6e7924aefff5f26907c37036a9ceea93','+�24�R220470421�4462U�\0','2017-02-21 19:13:25'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:d0ec6b94e0676151aaa7539be952998b227da929','+�24�R220470423�0406W�\0','2017-02-23 18:10:37'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:d3037086ca38af3608fc8dbbe6bd128245cd1203','+�24�R22047046426022U�\0','2017-02-28 23:02:25'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:d6410eb2a1895e662f690a502f6dbd8618cbdafb','+�24�R220470423�4126S�\0','2017-02-23 19:42:36'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:e20d3877bd6edfe9226ee195ff516da2d7637711','+�24�R22047046424�4�T�\0','2017-02-28 21:59:59'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:e5501a54e15830c0e8a73e6d8f0fd344e029ec56','+�24�R220470423�0406S�\0','2017-02-23 18:10:36'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:eae31eed812e13c59709bb2e0ba25d365792fb14','+�24�R22047042504�46U�\0','2017-02-22 01:39:36'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:ebb5753b4c42e405db43b7e13d46134fe99f066e','+�24�R22047046420214P�\0','2017-02-28 20:24:10'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:f1fe28a2aae7f77ac95603670114291745e6827f','+�24�R22047042326�01Q�\0','2017-02-23 23:28:45'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:f2e51c43c87229785453ab7155b371da8468b9a8','+�24�R22047042506600T�\0','2017-02-22 03:30:01'),('Sen_wiki_DB:jobqueue:refreshLinks:rootjob:90b38d763b6d80cfc4314d6161df5507b12fd0a7','+�24�R2204704232221�T�\0','2017-02-23 22:24:19'),('Sen_wiki_DB:messages:en',']�Ao�@����&M`A��D-���up+����w�6F��{�9̣dH�[2\"֒r���IKL,�p���x�2�Î*�\\����\0	z�%����:_+n��h	����	3Z7�g8q-�(�\\�\Z���V�X�Rhd�;��η��B�+�s�ɣb��2�>������e%�\nh9���+z��0��c{*Jh��:�8=BE.k�׿�\"M���1����Y��X�$Y<%[=-���5�E�oQ�͓�5�kG��Y�7�;s�.�y�C����1����)�+ڮ��G_�>�m\'�������kM~~','2038-01-19 03:14:07'),('Sen_wiki_DB:pcache:idhash:15-0!*!*!*!*!*!*','}Vmo�F���{�\"�U��!��$ҕ��*	(����bO`�ߴ�&��I�	���%�]��6�F �3���>3�縞=cB��f*͔��\\��.<;Z�N�C�\r\\ǳ���O�GF!�7d�a� �;�EKD%��\"�%\"b�\'qۺ�q����H���k�R��q�ܶ���v��@���o���&�f��\0čMm�����J�l��Z�{@�}{���\Z����V�X��>���G��4�\Z1\rQ<��Թ���:��� �إ\\�=2��(���1��O�$V+���P�5��\Z�I�B$ڦ�O$�Z �`���g�H|�2d�%WQ��^2����SW]A�)��D���3`q�����I��У�^]:.Y�Hk����,��\nŦ�V�\"U❒\0R���uz�\Z�R��-�԰��e��o��Dg�Z�Vq)�0���\05��/��tv�s���<WE�?[��e<#��?���!-�R�ba�ɜmA��77��՚l`O�{����W/52�k&מsѢ���]H�T,J�1B�1�;���Bw���Vzd�*C\n<�x#�!���ʰ��f�J��`�g*UՍ�Uewj���<�nC}����]Q��[9�ɥ� ��<��!́	=M�\rW�:��N��Y،�¤�2]�S��6��!�=\\ztX�<�\0N�tB��oH����`�|��븟� �m~:�OUU����}�L�~��$~㫯L4��҇$�&x��?��y�j�y5�<�QZ���|�9�}G3�� T�3�j1=,�5	���@���%!\r����v��^�4���-Cj����uR��E�}��O����%���]z����s�#���#]�%3�b�\'P�t1s���E�`����gJ�Gm���\r�e���Һ�;��^������֣���c���ǯ���T֭���==�v\08��1_Ly=�k(����ŭ�����\0G \'0��8Lp�j�na��S�曣�fa�t��\"��������ɟ��`��zL���U۰�i�S�3�	���	���0/\\C��,Պc��`o�|?,��k��\ZC��W��2C.|�i��j�>��zX6v	l�J�\Z�闧/�.�acպ���\0','2017-02-02 21:37:48'),('Sen_wiki_DB:pcache:idhash:16-0!*!*!!en!*!*','�X�N�F��y�=W\'��%�?�	�z��T �]?F���[��nR��G�3�I:�k��t>��$;���vf=�Sϲ=�f�e��.�Ṷw+�ϘO؍4³w]�3��h�S�ְ��Z��ʓ�?\Z|Ix�g���B�H$�����\'�d��.�vA	�-\"����[��m�*\\��mPfl�g�du��������e����d1��o2����i��y<K�9��;�G0 R\Z����\"cd\r�(�M�$��Qވ�F�D{��z#�)y��]\n�>���.��%�Y\r�@���4B�@���@��^��)ct�{xB�щ$+Љ��zڱm�\0�O\"t�F�T��!6��c�rM%6\Z`s�����$`�#��a=�}\Z�[�R�j�(�����UU�W`7���0t���W�� �13T=7,��Ć\Z9�$�Wlϸ��4by�\n2ɨ��+��jhC�Uw@P�\r�4.��^Cn��n�Ӱ�VmCV�������ސ�y��᧣!�eȝ��=#�2���(�i&Bv��ǵ�b|�I�� J�2����AV<�!T�i�3H��U(��^߄ò����^�m�MZ\'luvF\">���X\nZ��Y@$�3�ئ�7-ǲ�u--#�&���#�=�4[�ιO|ݣxdF#�Z�g_�\r���G̎i�\"aI��9���3�%K�6�L�\\p	��xY���D|Uu�$���������� �8�\"���	�7���]��зvl�-�Dk�`��\Z���b�r�M�#��	I�U�y�T�f�5[�7)��%�l¦���ή<<���n�Z��@��\"S��*��.��߽�����x/�0i����~1�zY�M�2�4*9��K�A�jkW\\�䚭���+~ͧ�T�<�T���k�o���,�O�DbhBB�ld�f�\0��X@�(�I�\\蘏i|��8��0�3��;�Y �TWI�٦`ܧ2���ol��ph��]����We#糼n���AI��h�Y{?�]0���i��]�#��ɲ�F��(x C��H�����1���A~�X��$�C��l]Y=��u�S��q�!��4\Z˻�Z��ÉE1�N*��V��3��r�΃L�#�)�C�L3�W_i�I���������Y[���V����[��h:����\Z����̃[|\nu�A1�5�~�d��Om�2�;즼1ϲd���J��=�����\nO�d6L\"���Fc?L���k�_�t��F\rQav\ra����fl�k�y\"gvs�\\80��.ձ�԰�\n[��[�`�ZQ$�yYp|{_UǓ[Ó�:<�:�<�=�-�ஸ_B��g�$�fx�]*�ԡ�%)�d�N�WMN��&���>(�ʣ�����p�~��}?^*��i��虫=�Q�p��2bA���k��_�E�g�9����\r6���,���h��cn)���łRS�~c\\� �u����cj\"�\').����-���9�J�p�Մp��깚�\n]u�>��dzFj��\r��w\05a��ެ���7���U��4�Dq�,�c�	����g��cf�z��p�m���6�8`t�sk>��0Z��a�㩲bW��b1�n������H���*�ծ��n]�G�bVp�{I�Ml�?L�K�\\�_�-:���l�����X[\Z)��	�uΖc����&nC�3��-�)*�g � ��\'����\\\':��_Y&�@�����:�}e��)�<��l��+\\�a�W����5�\r�!��','2017-02-01 23:04:41'),('Sen_wiki_DB:pcache:idhash:16-0!*!*!*!*!*!*','}V�n�F��<Ŭ���*��\\��$�nH\Z�P ۟��������1��V�#��$�fl\'��5���gΜ�̵ך3!A�2�f�r���]�׊��W�H�6u��u���rr��v12�i��J�\\�Ĭ�x���)�ģ�nz��P�Ö{p\"��\r��{��S���(�$Y�e��[X�{J|OF�{ĠC�a-@�˄�X��m���a��If��W|-t;Rx�V�T�v�a�0H���z_�ȓq\'\rR��U\"|��Ȏ�*��lJ?Y$\0�	Ե5<���U7O��L���6iMa7���G���n��O��%��)�P���.s�}���%�>���!f����\nGtɚ�Z����dgv	�PzN$��/[����1ϱ� �82�r�v#�X%�5�]�P?u�\r+ؑ3}�F���o���>��3���Ol�O��<�n��ZB����0��\"�}�c��Q���*�jH�T�^�O[w�pu���d�u{��e{��V�}�*6e)0\rvfR�\'5p�D~�t�3$F(�T���-̃0~\"��?���&m�V�ba�ȂmAP6噝�q�W8���v��qScs�0���M?���!\ZHݚT,J�1Fzq\0��?h݅Qԁ�ś)���Wi��K��?�f����$�C�0�}�1����j��*�Ri��k-��\n����^y��桮ިjrxVם��įX�u7�_����{����Y�w�j�s������f<�i�O��Gv�@�h��Q��}8a�M�_�( ��`��Sɯ�F\r�Bhv��.<�SU���m�PӦ��m���+M4��!I�^��w&bܡ�j1W�;T�´L^A�W�=*���$�j��Q������Q�\0��Fo�)X\\��Nf�L��w1[��ת�k��ˤ��A�}�އ4sa?O�\"9T����gOk\Z�G�q.�|5��F��b�\'�>j�6\ZR�^��F��-��K�CoDC���2�lN���W\'��u�4-D\\˲�_8b��!~m��zTLX�~����8A��H���K~��Z�kY�e�B�M������68Jr\"G�7577D-�)�������)osy�,ok�����r�����?J%,�zL���U�a�>�X��e�	���	���(������}�j�;��`�|w2�j�Re�Ρ��W�h�!��v�ogռ�,���YuJ���Nl����^�m#j���ǿ','2017-02-02 01:13:39'),('Sen_wiki_DB:pcache:idhash:16-0!*!0!!*!*!*','�W�n�Fͳ�bM ERD/��P��ėZ�c	��>\Zkr%n�vW��	��~Ig��LJ�]���ڙ�9gvvf4t-�5FTH&�s�Ε�m��t;�M�J=�Z�N�5��sڗ)��R)O�h��C3�p��\'B�������^��i��@��ъ���?��}�:L��U��(�B��d�r�EO�-Dxڏ�.�R�y�\'1I���(\r�7�����g��Nk��A��h�PH�$> *پg��\'y����Y�\r�174b/��,\n�{=�AFD��`����2\n$1[�Gsc����?�hĉ\"lťz����+���o�6���A�I\Z7l9\Z��G\\�R��8�^�|�1�ئudZ�e�fǴ3�I�X���6���:����Ċ��%S\ZJ�8}�6�\\����i#�$�e��������D��\\����чe�,S?U��tG����H��_\Z���^8=��D-��xdulr�VL6&���y���]�Y�$2�xj>KU\0�k����*e��`p�X,�tgg���T\Z���P�xc	���\'�:\\�!�wo?D�G�P~P9��\r�a|K�����\"M�T��a�ɘ.�/@y�d�\\䁭ɘ�wxo��?������\\��4~>0����I9��/Z( ��>��N� ��3D�4��!��I�G]���2dg@j�ζ���U�(Ll;x\'��c;�ދ�.z/�Z�w���`��I}�@��a�v�VVKs�c�b��jU�>n��\'Y�e��~Ir��� te�cX��!3*�`�b����b\"��v�;:� Ã�;(㬈�{����>�!���WHQ&֕�+���ڒ}�\r���lm�:�OUY�<�Ժ�\rE�ɳ$���7*���M+WIR&��SCrl����S��1�	�V���7w���}���̅�����Y�2�G�L�-#3�[Wy\rPME�TM����]9�1�X���T2����Fc/H���؏~�ls�k8ۯ����~���g��.k����*����� {,J��y�O����i�:0Iʄ��e�5�]M�\\�\0R\0���w���W��Q���1��_�\r�_E��Л�/�7��j���[��;��\'\'�J��т��3�3�9��T�{3��0G����X[u�>��>E��5�\\����:׬��E �:}�m��\rd���1�U�%��Z�nU/M�q\n磂>VHk��_�SP�n�LX5��g�\0�_���^8RU�(�K��F���������@l�*=�Uv���vƠ��1��9N�q��-3k�hb��aj]\0�3�؇?����n�\\��ܖkGc�2o1\\�l1�$��e��R�BW�|��⅞㍞�n.{yw�Z�ho�7&���:����a{s��o�I�z{��]�.Ѱ�-Vo�aC��N��_','2017-02-01 22:05:02'),('Sen_wiki_DB:pcache:idhash:17-0!*!*!*!*!*!*','uV�n�F���{�Nj����$��H�P%r��\'x�iw!�S�>B��O�ٵ\r��F �3��̷��x�;�oϘ� �k����{��C���,`����g߾̯/��`	)�+;R*���8XeRue&���\rlx\0���<�mb�_3����M�y��+ۡ��M\"��H]����/���u����c�C�\'x��H������,� $�\'��:��ץ�7,l�9;�����.e	H��\nR�7K�Ƴ�A֒-��S: �-��3���<ܛg����2�p�F�f!�)k}F���麄;r�o��߿��X\Z��\Z�$�C�hץ�΅K^w\n���$��0�\\\'�[����G�A*bP%�RB�\"d��Q�v��n��F�m�J{���N��*/e!#3PPCWqI�Og�<Ca��L�a�l!�����Pb�tHGe�ŵC�l��*����;WY���!���W���W?76�����:��/��D�ФbI��1\n�7�	�8.���B���X�\\�x�����������1�e&8���F�ϑ��\n����m��-�4�S��cQ]j\\�P՛�D9�6�uT�hB�s}ݭ�Oe�cI0����xs`\"���VAݮ���*)��\\��Ц��YX�s0²G�>�{�y\'L:���W�]c�X8AM��u܏Y���m�:�U��;�Ԯ�M�~��,}��oL��,��}������D��ek�̫��m�UiZd+��W��T�D��PZ9.������^T{��D��]���۔��6N+֦ӗIų��P�	�na;�b�j����@�:����|��L�a�<O�>�	�lzK�;4���P��N��Ȇ�\r�ez��\'�t{G]��M:�_���]�k��F�q��_G��=*3l������1@���iP��r���@�*�����R��jJ���h���fr4v��n�H�;�XL�j���r�xG�PB����#��V�`�u���X�bV/Þs�1�!X#\'�3l&XO�����#�~	Y�o�[�=\n���ݨ�/u�k]��@H�ˌ�������U�(��?��V~Ց\Z��W����a#k.��','2017-02-01 22:02:48'),('Sen_wiki_DB:pcache:idhash:17-0!*!0!*!*!*!*','�V�n�F��~����v�<�$쐤�%IC����jb���43&�h�>B��O�3c��Vur�ܿ��9���;�R��:˵˺>{U옹�V��+���=�.�8�Kx>w�1�����h�$��Q6�~�BGp>�\Zf�k6I����@����-��-��_B�dqN]D\\�s7��nܽ~ȇ�π�)�&�&�Jt/�}�gm~᜵3�:h��s/�1�D,4����3��B#�GO=ڡ>=�y�B�2!׌�N���\\���i�!ь<�H�3?Z$W�#ޑ��D���y\0��x����U�$K��ƌ�4����M=�l�� ɛ��7�T����IHDD9�)�ɠ�{�N�O��\Z�3�8���r��X��n�l���N�&	!�s�c�s�V��Hf	E����y��g�sZ�����D7��u��ԂU\\���0V��\"u��4?:�A|O�1/�%-�ҩ�Q-Ȅ/��_%�{}zN�&H�\"���2+c\"�s5g����|`>��MjJ#}t�B	���\0J=��,LQ���\'�	p��Wn�3��~GEY�vh\n�I(�ݩ�<ӛ�M��Q���/��exi�\'&v��W��⥰��hn�h}�+��\'��·aMrjҎ�кv�E�2��2C���\0t�� 5:�8����>���\'`����0���F��Gd\n�OEF�\\o��\0�H����]\Z�4�-N\'����:o2��63��� M���+�M4�|���?��w.��\Z�e]M��p���i�\0#b�_B5�iRo�XMG���ݭ�\"��7,+�^�x��n�ͯ�A��8���>��]}߼3��8�D����x;��3� ��ǲ��t��q9�y\Z�9`e~oǉ!��2�\\�7���5���N�J�g�!�v���6�d�F���n{��V{A���;��˲r	��n��XS�)F|U��f/��ww�;��=n�be��,�-\'U\"�f�N�m\'՜�����фa�\r��C����cXl�j���7<��g\\4.W�3 +�`���.U�#^���јd�	��\0�!R��_\0�P���!ό�����C6���C��\0Ƈ�ޯ �q�Z��䨻ia�;fZ�-�WzUH㘞T��^3i#jQ�','2017-02-01 21:58:03'),('Sen_wiki_DB:pcache:idhash:18-0!*!*!*!*!*!*','uV�n�8��y\no�Jw�R��R6i+�R���T��ϕ�L���D��p�����In�$4	\\*P���y��7c&�����		b�V�Zپ��?��۫9l�H��A���%lD��ʎ���n7�B�ęT]�	�ew�CAr�ǹM̖�LD �lj�7���v(=�I|�+�A���n�m]vs�����ަS��WD@�gXC��W��:��9�K?y^#�͹��d��(�nv)[�Y� U>ye�k8}6d-�����D�\"i=K��}x���,�U�\r�\\aF)V�����.V��&t)v\0��h��߿��\nX\Z���\Zq���)x��U^8�.y�)��Vy�l���z����6�U��a�<KI��Q��G��6\\�\0ɍ��:\r�F���N��*_�\\ \rff��I�\\�K\"�����)z#���L�WyP������8�C:*S,�2c�TI��;q�%����o|ɿ�|�s�y3�ΠC?���G��:5��*o��7���8��\":m|��.�g�b����R����\'��\r��E&8��4�!S����)��\Z�E��U4�lt�����c\rI)h}ݭ���Z�B�����.��f�DOr���q]�h�@�,igpn�Ø���*س30����;���.�1��N�k����h�\Z���Y\'�ζX������Ԯ�M�~��,}�oL��,�]�����?�Hy�h��u�UE\\��y�񝠔j*��jH�O�w�{mT���)m\\���f�����$5N+�&��q����P���ua;��j����s��\ZD�qX�%3$n�b��#��z�?�!Ra�BrPcs\r�\"\Z�й����6-E��7�U׷���</���˦�9j��>~�)FtPV�ܽ�G��C�^�E�c�����׃���U,�h7,n��\Z��up@r��-�~��+���-w{E	����\Z��s{=��\"��׏��3����p�}���YnVoÞs����Q��	6c�Ǡ�|`���5pd~>�A�o�r\Z<ם�9t�~!�,3�r��g޾W�O�yi���U��UGjb�_�>��NUs���\0','2017-02-01 22:09:44'),('Sen_wiki_DB:pcache:idhash:19-0!*!*!*!*!*!*','�V�n�8��y\n�H�����ũ*�R:0j*t���Mn�KH\"�P��H����${�$�f�T��������3f�c�	�\n�x�ӵn��Ǿ)�a�����+ֽ��q��L�*����F����Vk��\"�q��7��y��ɄDb%4��&R;}, $Z��ϥ�.mQ�vz�^#�M��1r�m��s���J$Hb��y��?y�5�ZṌ��K�L��<�����a�D��PB#�8	OY�3�u�:�$�\'�ɉ�����qHDDkLS�/���s{��㑗���\0��Z����������/@ib�*��$�T/ƶ��)��Hj��@���k�9�捓_�LbfK�Z��+\"�|8[���G�:�9�_��$~ �1_\\b?�4IS\'�G�C�|��T`��M�YL!��&�����,�1&�WF{M��o�?bx4ДF���b���a\"$��bP��6�����5\n�^�K��9sٷ�C	����<��Q���D���#(��Õ�ĎM��|쌘�kG�9��u��>\nK�Ke����W�x\'\"���b���.�MӃ�󨎠c{Ø��#8�S��i�/���=C�i�1��*�����#N��������h��i E�˱�!�w�m&�Y���U̿pYg3�a���a�.c�k�y_u���yh�,��_�s�&2IA�x̮ٸ?�=� \r��\\2�Jneq� �/��Ӳ���yT���ޕ����-l\'I$�]���{��10v�z���\\�%k�\\�C扪��䟬��W��ȱ}\02si��ll(.���8���PW\'�ռ4���8��_,�	�/�����;���[������V��\r?s��썇W�@rS�E�j��b����ԨӰ7r�8����u�>ژ= ��aߍ��S�A^�v��Jnyŷ��K���R��r����Q�4�`�� �\'،p\Z���Z��~yj�gC�����Ͻ๬sS����:��=��j��r��dR�\"�8���b�)�ld�����','2017-02-01 21:59:59'),('Sen_wiki_DB:pcache:idhash:20-0!*!*!*!*!*!*','mVmo�8���\no�Jw�R�@)���n_��ڂ��}\\�xJ��M�)p���\'�o�_rc\'��jfƏg?3f仞T G+����w<���/}\'��F;�����\\k6��S��Y���\r*��\'�\"�)���m�ZK�o�b�WC㺅�s�Q֩�U���|�\\�R�r�o%(�F�\'�0iWM��|r\Zd,���e3ŗ��z.I�Ļ�Ԉ���j���V�,\nS�[�c���@���Ef��;��:d-�o��3�� ��q�W��]st�s����&i��z<&�����KݸcA�h�O<�^Q|��6���G`�	��I�ۡ�q�MX,d<ѐh���HA�n�f1�J�\"�J{D�q՘\0�����{���4@�SI>�\Z3JRn�ue�趰B�9]@��}4��?�b,�D$A��8%��:�����{��V�j� �\"D#L.V1�V�㞐eP�XT%҄p�t�쵐��Mh�\0�Ye��UhU�g�k4����Pfa03��t�D~9;��9*#R�H��� �g?��qI�4u�YT�d�>�P&ؓ]�%l��嶺���3���\n}�6�����iRS��YM0�)��  8q/i��,L\'�l�g�,V(�g�,�3`>���>l���Z�R@�1L��Ne�A͐:�rRxh):ƶ3ʨ\0S~�l]��dV�^�>�ϕI%���=4>���d�2s�U�)�a�!aQ=�K[����~��U�3��tP�yN�LA������0>D�T�M�/)_EP�6�N)2]���>�=\\f\\��4y�oL��̧�S�V��O&�,j֢�:�\\��5K�`�s�T��g ��x̪���i��lD�L8��r\n	���+��ӮS����n~�[n�ކ%�J�S�2�dd�q\Z�`[پM��f�?R��;�5Z��i��<��l����2�gnW9�W@>\\�F#&7��e;U�֨�Z\\�)\n��eY1��L����.�#�w��5��x��\r���1@�]�����bܛ!~��)Q��nQ�C�rȖW��	�:�Qn����^�����9Z�_!��ao��ۻ���v�xS~`�w(��,��vZ=�cĪm�v�\"�+������u�W|a�/�e&���tp��>�i�VU��0m�\r���̊˽�^tv�j��\n����u��ƕ[\Z`�[Z\'ťd�F�.���','2017-02-02 18:30:40'),('Sen_wiki_DB:pcache:idhash:21-0!*!*!*!*!*!*','mV�N�8޿��HHw\'J��_���W`�	hE�ޟ+�L_�Ĳho��=�=�=ɍ���i�Z!����/��tx~�N�T \'��v���PA7p�s�hw���E/p/����iL����b�\Z$a)���>s.��\Z]/�B�5%�+7�Z�v��,�3��Kг,�!���Ad�L��%��k&#�W.u�;�t|�z���$������S���]����ϭq��}:%	_s��Ljg��\"��\Z�S�O������W�l�ۀzJ��m��<$a�jHu@,Q���/��-��Q�\'\n�-R�3���<ؙ����BP*��+�1�+�(���kc���w]B\n�8�o����\nX\Z��I�~���)thۧ}��׭��a-D#L.�5�V:6��eP�XTų�D t��;Թ���7 �,�4�ƫL�f�Z�N�R�a03�j�*^���t�NQ�:�e��:��4�|�?���#-�ҙfI-Ȍ��!�J*�o��똬`Kf�~�+����@X[����8�����1D�Ԕfk��5J0o��=��,L�x��.s��OW���?~��C��Zf�C�0N#2�ɺ����:��	}���F2��E��=Ĵ���L�FXRZ?�k��f�t�X@�{��w<�0�a^w�n\n���HY�̠k�C���+س3�\nr���w�yGL����+*�v��X4F���MޏY�\'�̶8���]����v��1��FY���oL6�,��}���@ßL�<]6N˺�,�Z���\n��5��%US�	�zO@��|2��?> �p��Rƕ:wj�^���\n�ߦ�5�h/Zq6���+�}�ا���d��i��p[N��f�At�p�k�d��\r�������v�T���<�خ�b��B�F6Ln(.;�mK�}�w�U�o������(���˶\\�9�A?��#zXV�{7؏ܧ�\0��\r\0���/G��{(�\n����G�m�@�`4�؍s�\"�n���NQB��b�F��a����!��h�~ܖo������+쳝V�r��z�{3a��`^��6�~x\Z�5��KĄq��?�a����4x�+�`�6�R�Yf����:�^�?E���z�n��~UH�����r1����no��','2017-02-02 21:29:51'),('Sen_wiki_DB:pcache:idhash:22-0!*!*!*!*!*!*','}V�n�6�o=ŭ��\'��8��H��v��vڟ#�؜%Q �$^Q`��gܓ쒒Yv� �}��<<�]��Ak̤By��,׭���Up����V_Q�w�N5{�)�{�/yaPB��,S���ΜS-�cq�,A���/P��g���n�J�<l�gl^���\\�Fgp�g_�%l�@��tĪ�t\0��A���+��\n��\n��RS��!�<��k,|Εdj1_��?�t3���(�bT���w��ۮ�Xc�	�#�|6`a�q,�әϵK`\Z���l^���$ۤJ���|\\�[���ݭv,A���}�\r�->��4܄k�UR;.hp�\'ؙ����I���d\\�8�u]׹X�,��HLu\0�,V���rE���w]RX��	��\r��j�\"DE��\'����Rf�&����:�%k{�h����K�4��qNq��M%x��y�><�4*g�I\Z09��l�\r�|���Uѡ�3�0Uv]��%C�>!d�p�c�ڣU���v{�)3I0T��z��*6	~������ű��e��:�Cc�`�`��\'<hC[��Z�){B3������3�X�\n��~3����c�Y_��S��\'J����� MiJ�$k�:%��x^��S��.)�5K�9Q���K���\r�� �G�u5�c�1J#2-d��\Z��:�J,}R��p�FRP�	�$%Ե)�3�y-J9Ѻݯ�GQ�sd�1���c2^���d���\n[���/_H�R7+8�\r��l���С���P����r͐G��e\Z���*(W�!�hD�᛺oD��ج��N�uQ�u^}z��̸>��H����i�ܐ���-��d��y�Z�՜�e�u隉%\Z�C���Q���P�\r�U���pvsmH@�h���)y\\�s�έ\n��_�FH��l����~T��\'���_��w�e,b�j�;�V�yhT\r�-���[��KV%.�f��;P���O��T���-üW�{�P�vH�4\rS��ʳ=S�f�3�jg\\o3.�J7�l{�wN3�O���/4�_v��z����\0�N�t��R�o��%J����D�����@v`4��s{G�D�h�����G���^;�{f%Dc��|��D��_,\\�9[su�,W1�Î�1�0�i&T��Ftn���\Z�7��<b�	����~�n���\Z�יn0�1��RY-����{���Y��\"��z?9�~W�4�^��NʛɔMS���','2017-02-02 21:39:37'),('Sen_wiki_DB:pcache:idhash:3-0!*!*!!en!5!*','�Ymo�����k���H|�,S�����.ۈ���`E�č��ʒ�`�?�����3�%MR�-��\\�ʈ@���<�ʙ͍o;�qK��������=��M�C�H��V\Z����7�! AL�85d�N�D|Ic���Ӕ�1f�Ɔ�2��ɷ �$*���0r��+n�4d�A��K\r\"��s�<��dIh,����|	l��}:�K&L%��#�Ԥ�cY��_T@N\rX5H����ܔ��rܦb��w䠃^렳5�9��tFȎM�K��mk�/_��G3�6�>�SɊ�Ƶ��Ә��B05A̞��4�M��T߽���W��e��x���٬���Q�`)rfg�H���𣒰��+��1{`q�&�(X�v��\r��t��\"ׁ���i�8��� g��ĝ�H�Y���DK|����4�т���\"���dp\n���m�\0�4�/�x�f��25c��W���׬�u��\n&�x	��J��^�2lb�P0���}H��e���2�M�+�id��&�~�h�\n�J;���\'��|�Z5�C�)\'�K���=�>x�JkJ\n�\Zi���8��	z�JA���r���o���Y:փ �����.;������\r�������i�$6f��gA��\r���k��%�c�l�k˛	���l`�(	Ȳ\n!�y��%ȩ�\\)�˴L/(cui�E\rKҋ��Ҽ����y>��\rGy��(*B�/�� ˂�k�g�P�1_0x��B\n�(��\\���A�G�S侦N]/�I�Jn�ԮR�R�>��%��t>K��9��Ⳝ��!�VS��ئ^�1����P�4j�N�8@�ul�o ������uљ�o�r�^�$Ւ.��P��ve9\0�������=�i\Z02gr�`�R>�!�iH�icE����\'�k����@K���̳B��h�1��ǲ�-۵�9\'�aۜ�>����}xLi����|�,h,X�����A�t�5�\\���P�>3�����[o��\"�YA���Y�@�\Ze�\'�m�O�vɠE�]j�{�΄��?�*�]x\Z�k��W�\0��ɱ=t��Q2ѻgI3��:ݾCw=\'DQL�1d9��āN�w�͡J��ņ�,���\Z���z������3\0L�zf��U:����w�x�6句���X֏>�`��I��e&i�rG�_�\n�g7\\Fd�	�|�6�~x��j��aDE�}��\'�;b����\'^��T�w�Em��\Z�=�p��=�E�h�\\C\0`�Ƅ�����ٰw:-��3�a����9(�=2\\@m���2\r�\r$�����z��Uz���Wr�=��JNE�}w�T��vn�w\Z�ac������0��1�a�hD7j���j����+��v��Ê���(\"j��oX��$\Z�lXЭ��^�+;r9�]\'�W���8�/��$�<0��{����_ߵM�ʗ\0p_`@Ѻ++�1������=[���o�*�xl�^@}���i�G��J3*�\"��8�L*���wA�s�D�>����������/�E7�ʑ�\"˚����\"SuV��juX����T�r�0��\r�|��!�^S�R~�=-�D�͍3�G\r��5\0�mJ9�R\r͍�2[,`�F,#����(+��~B��UqvUq:�\0s��uu\0\\0���y��{�U�!�	q�����w;��Dݹu5*\r���U�vuh�~B���N�F���%�7+q�u�hK-��K�}۫��G��[U�<{O,Ub����9�:��ô���V���rVH�:5������ӕr�5ҷ~��F��W:�{W:�;�?��N���A���w��U���4;O�<fa++˵��/�U��@�м���W���b<֭-Tk���\0�6�EW7��J��Z�W+F�ޡ܁���07.�%��xGv�j��@%}�){`]��Y�\'����	�Q�+G�~\0Ժ�����B|v�6�\Z�6ݱ�3Z�I��z>ā��[����D5=��*���q����2p�(�iR���\\,�D����fR�pՠy��!�AQ\r�m=�i����9X��`��ҽ�m��f�q?�����w������}7X>ƴ���ҡ��Y��\0�����zR\Z�C��n�Qع��0&�y�Q��ɗf�\\�����\n��[�K�^����~gȪ�ڪW-�*���U���̋��?O��','2017-02-01 21:46:29'),('Sen_wiki_DB:pcache:idhash:6-0!*!*!*!*!*!*','�V�n�H�g?��������%$p\"��޷j�\'������5����Invm�����������z�9�WS.��R����5]��.��z[Yk�q��W�IÏ7!�H\"�a*YY{Y?�/���b���us�jKcf@���s��1~�)]\'!�[�0�q�X�@|Ud�y�\r|I&�Ăɘ3Ľ���<f��)��t�\04M�\"Ӭ���r!P��Ю,0�8�II��z��ג�D�(��	�g��O��0Q�W���7�F�z�I�o}4\Z~\Z�aH������}ozp`Y7o�ub=��xLB�f#Ob.�.����dk��k;W6~�N��u3�m���#׭�m[�����O�8���G�i(�ꎟ��\n��#��m�D\0�aM����c,<�拘�\r�cD�����±��]@�V��8����؄E~�\"L�?U���ʹt�|\'AX3��D_��E���~����$ک�!$r�bl�Vo�\0J7@�s�9�|�IEp�\nΪ��-�q��]��be-\"��;[�3���8�y��-�E|G�l�?����%\r�C�t*�\"(_����%Y��L!���������h�ǂ%K�U���z�#��*2!q�+Ӣ�T�0~\\\"�մ�\nBSL�f�;�b��,Z�Z�z������u1����b̧����V��d{\n��j0�8ɛ�\0�+EK�[9O[�4�!��Jš6�D_����0���(Qm6�*��V�hX��R\'�:U�S��M����Z{���ܦ���P���{�໒�4���U�q��P�6�N}�i�\Z�ܕ͔�7э�g��Ly��ٝӏc3���By�$_��yU����U�xJ?��v^*��49�j6��gC5X�Z{?6��cY�Z��{���N�d��Ӡ���#�Ƽbߨ���8��3�o�G�������q���j�49�RI�^���\'�<\n쵺���&��X�>��\Z*6.���ٵ˰����V�$9w+6ֹ���\Z1,_��1s;ϰl���c��}�Q�G�Ϙ>\'z��%\'E 9�k\'n�IA��%�|T˰\'q}1�,C3ˠyd�]ť��;���J���`�]�շ�Uj?�ǣrRs	�b���bM0�	l�\r��p��v�(`O�2�ځ7x�k�\\�dι��3p��L��s�:o�7U�~����ɦ��8R9vZ�t��G*l�Z����/','2017-02-02 21:38:22'),('Sen_wiki_DB:pcache:idhash:7-0!*!0!!*!*!*','�V�n�6�o?#��6ԱnqR�	�%i�!#v۟#�lt�H��\"�aϸ\'�!%ڒ��C� ��s�?�{ϲ=cD3�}.�\\�k{߹w����p�rNPk��φ<�1�C������A�b0N�	�hz�#d�ِ�E�S�A��=��X���WU%��\ns��+?�=z6���g�h�7��,�IJ�hx��0�C��\ZV�I�=\"���A�i��0��%�O\'��X<����4�BNJ9ٹ}A��\"�?p�ʂ����L M8Iƀ��\Z�6���������K�Z+�t��s�ш�,b�dh���9�`�x�6�c?���t�uʲ�GN��iv.61��O�$��hȡs>��|��c�1MӖ�&q�;@��G�K��F�$#K�X0�8	\0��2�e�,S=u�9Đ�=��N;�⟿�F4��0G=���9�l���ud�Ǎ\0ޙ\0r\n�������w����(�\\�S\0�X`�z�ٹ\\���K�ݓ�����2;���n7�sLL��9U�*6����]���4�;Q��k�`�|�I�c�.�DаdL� ��|��+&�	6d�T�{z�*�ǂ��k�v`��YE�x\0tQ���a�, ��v��A�[��\r��9���O�P���?��B�9b��.���S�wU`�V.�ڶ��j���R_Fԑ,�;�L|q�M`�}��E3�lS�8ދ��г�:t����#c�M�ܴ*��~T$�t�e�j���G�h�/�SI��\\��r- �i�,\"�����¸����T�\\�\0ZD�]�	�٦�z�M�\Z	Z�/�M�<�f�����X*�2g\'�����ϓx��_h֬fq�_%I�{|�Y���X-q�UG��D����Bc�<k�f��7C��oD���\nȎH�8�?Pl�u�T�0�Y�D��Sy��,�+�O2�q2\'��@c�d�,|���\ZЎ���y8���jp��D�ó�H���t�H�4a:-0�W���m��}�Y7�K��K�N�\'��}T0�IF�2Q��jr~5���10�N[h��u�޶t�rLS#��1}!�E+���?_�6`#�7�����߰%!�7���������:���v�W�rh+�q�����Q���IXf���=��;����\n��NK\"7r@zPW��Uܲ�K֠����>jcKN��FobUm���U�_�K�r��Ì�/O:�X}��h�u��8�⠿��q\ZpX*&�rP��O͋΢����D�\'z��/>���Aj��Yۥ�[ p���K]j�j\ro�\Z�.\Zۏ#�3?G�>}�=���>Y>��z�8֞�8?ǚ`^��F��\r��5o��C@S�x��ncx�w����z8�y��@����e����V���^�x���Ў��)[}��Pt2m�����','2017-02-02 02:08:04'),('Sen_wiki_DB:pcache:idhash:7-0!*!0!!en!*!*','�X�n�8��Ѣ�nQǒ,�\"��I��\"7v�G�����,	\"�����Kvx�%[ZwZ�er8<g83��Eก5�9#�E���[��_X��bJ�5`�������>�ix0����~X(�1c�2�)�	�݃�4�$�l؃�t�E�bZZ�;w����4�:�\0�yN��X�L	^�����0�2��\'�\Zw�=1s�V��r t �C{�b�h�2�	^d1��;\Z6��8���M32��҇�>d�};�~�8O?���d)�<�)a����2TV����2��I��4�M�\"��0���ڌ�kǨ\"�	�����8G�g�%�	f$��,�\ri��G�ш��u�=+:nz:\n;\"�*���9�QLb�(����[���{zK{4���v6�zeQ$CW-Gfy%p2��6�m�2���\Z��P�	����zc9+J�Kdr�\nR�q�J�i�!�~-q����\Z�!�[�Q�Ƙ�.̛�##���mh��$�j��u�Mɤ-�ld�M�ViKY�fi^h�Ҙ�Z��F��[U֚�3��vQ�܏�(��Q��y��sX��ȵ�]��N߷5��CF��\0��x��9zL���(TL��q�H�p�A�@��m���$b�K���1`�S�|��莂��D�v�bg����S��!	���-�S��������$��c�/�������GNXgJ 	�2��b�\Z�F�fNGR)����aߞgw�2�w�PT��Hԑjt�\0��v��]�\0�T�T*ͥ	������q��\\���z��/|ă���A]��)�qi�	�#��ʓ��|�n�#��d&<~v�{�ɹ�Fs���n��z�eom��_!aF��qH�+�\"\'s\"��k:�n	�`v<��OqrS����Y���\'�s`�Hݨ�Z�8I\"\ZbH��	[��\"�LA.D��C;bG��|��\r�(�]@Ә�DyX�#��o�~-���T{�h![>���Z�9;�M�\0�s�5xzf��l�4~�fv�����1����L�iy^���\'y����������\\3Q9�\Z\\�����H͔ t��N����2�	8}I��}�FEL�\'�`���-گ����\'aN3^F�_��ǘ�N�ɠQ��7q�jf�\Z�Ҵ�|&>�<��\\Մ�o\\qO�\"�1ն5��3����\r���o`!/��s��s���\"[-��j�V,�y�P�h%lf&l��E�K�����v�I8O�Z�|�7&����j���[C�ݘ�뭲k\rR`�~�e�@�Ib�f��fc�;k�؜��c�;8.s�z�X�ӫ��m�s��Ƴ5�W�;��롩��!�א�7&��kl�/�\'����H�Ii�����$c���/2���e,VM/GӳS���>�//�~�7_?ɫ����O���g}�eTú,7��sun{��>ehC\'�*&Q%����ŇS~��W^�߃��8y�1\r�>�V|��5���h�HT**�\"�\n\\��3We�ɤ\01����0����y\Zk�O���ڎ�P����x��j�����RvVFVfg_�u�S]W7i��Nزe5�fY���Z���\\���V���\"��!�����T�j(V�?w��\n��YS��(�^X5º�mE����~W*q�JL�iz�ѱj��W��Uz��xkUomzj�R�n�h+�?����~6U���ugy�r)�w�$&	�	�$w\'��e��3��6<��T�A�����C9^�UH,>���FI:�����=G�|?3ծW�xُ[F��3[\n�Ύ���\rV�wO�','2017-02-02 21:35:01'),('Sen_wiki_DB:pcache:idhash:9-0!*!0!*!*!*!*','}V�n�6�g}#`���cQ�%t6�6q\ZIl���q�Hc��n ��n�@?���/鐒Y6*C���93<��Q��S.��Z�k����17��F�C��s/�y$	��e&�d�@Yd2!��D_�v��ob%�\"\ras�Gy�]�(��l�\\�����X��}^��ՙs�ί�˓V�8��6��X$B	y&�s̓B�J�ߣ�v�O�}�6�\\�-#����97۔\'\" A�jH5#+p�����KD��<�C�[��\'������Ef(�I�*���(�B�(k�oS�>��KHA�3�ygJ���?�OC\"� ^��!�ޠ�{����V�r�uC4��r�`n������&U�,%!�:2,��3�䀫�@r��X��6^%=ϰsZ�+�<��Ddf�>@m��C\"?}>M�i��X�����`?|̇G�CI��t�y\\2�`\nP�\n�ɾ	�l���Fk�o~e��1F\\E���rb^�#�����<�z�F	�\0��I�:�p0�]l�{�.�(�{���;��c�?�F�v]t���a���%�u�g\Z�ȿ�.z��b[k��M�* e�w��O�.���}L;���.FY�zl��>k��a�`~uo�܊f�eMr�����e�� S7�ҳ��α�aC�����0oX�!1����PF �{�w��1*��ox?d�:�&�buH�뺭�a���m�����҅X~�Y��Ҽ˲z�x4�\\�\"]6V˼�U�B��y�catX�j*��.�e�К�����cmnQ��}E���O����Ǝ�r�;��P)�h�O/�~��V�q�(�/1�{�����y\\��b�T$���a3�blk�;ށ���\\��$��R����ɢ�,.9`f���Q��n���=��L�\'{?U��6�N���j�e2�Q��ⷍ���*�������ʷI�����`>�Լ��_e��{73��#\0�N\0\'J1N�ibf�JoP��Sâ��(�^M���Y�ݤ���h!�E\n݃�ń�&�LG�SS��q�8�_��5�r�\'Vإ;��6��&���Y�\Zk����u�\"}�k8>��א��qd���Ð�o��]�\\o�a��HeoB+.z�?����˙���h�j�����B\Z`گV�ʡgh����','2017-02-01 21:46:10'),('Sen_wiki_DB:pcache:idoptions:15','E��\n�0D�e?��1���x�T�^l���+�����P�,�{�l�-h�]o�H�`V�\rg�};>��:0�E᳸�I3���MR�ʖ,���2,\r�c�n��Q����1M\n	�Y�����ʗC_��>,_','2017-02-02 21:37:48'),('Sen_wiki_DB:pcache:idoptions:16','E��\n�0D�e?��il\'G��SA�{�s����R��&B��\r�\Zо���)��PaQ��g\rC7=���{0�UQ\'q	�&J^S��p��Y8��R&dXv���e�f��)�����ٹ��+�/�!{��_�','2017-02-02 01:13:39'),('Sen_wiki_DB:pcache:idoptions:17','E��\n�0D�e?��1��Q<x*�z/6`��QJ��D(ކ���[Ю���)����d�g�]3<��nZ0��Pgq��eJ�r���+Y8��R!�,������Gu���C\Z?j�;�W*/��xQ�','2017-02-01 22:02:48'),('Sen_wiki_DB:pcache:idoptions:18','E��\n�@D�%P�����Qz�T�^�9TK#�����H�6�{̴R��-�tH [�M���������NP��$dpI���e��+�0��Ri�\0#�6Č��y�z�{��Q%x�X�_�1����C\\�','2017-02-01 22:09:44'),('Sen_wiki_DB:pcache:idoptions:19','E��\n�0D�e?��Il6G��SA�{��P-]���M��mxo��80���-�dL��e2�Y��MOy�b��˪�dqI�f\nQs��-�0��R!�� �j2�?j�^��d�@n�E,�o�^R^C�Du\\�','2017-02-01 21:59:59'),('Sen_wiki_DB:pcache:idoptions:20','E��\n�0D�e?���4��Qz�T�^l���+�����P�,�{�l�h�]o�H�1+Ā��ƾ��qW\n��Y\\⤙R��&�\\eK��T��-�#~ÖԬ��=��C!�;�\\�[�1�R�r苗���','2017-02-02 18:30:40'),('Sen_wiki_DB:pcache:idoptions:21','E��\n�0D�e?��$���x� �؀9TKWD)�w�xY����\rh�_o��HpXb@�Y��M���+��eU�Y\\⬙R��&�|eK��T���c�4N~�l��{J�BB�-sq~s��J�K;/·�','2017-02-02 21:29:51'),('Sen_wiki_DB:pcache:idoptions:22','E��\n�0D�e?��i�N���SA�{�s����R��&B��\r�ZЮ���)��PaQ��g\rC7=���{0�U�$q	�&J^S��p��Y8��R&dXjN�Hٖ�����Oq���h�e��m�^19ً���','2017-02-02 21:39:37'),('Sen_wiki_DB:pcache:idoptions:3','E���0D�e?�tT��O$F�W�H���Q	�nK$�v�Mf���`k�\r�c��&O(	��s]u�}����&KB����]��0hK4�ڠq߰�m{��@\n��s7�\r����̽�pN��J�x��?�+n�(1S�\\T��v����XU�L�q�Vv্-�:���','2017-02-01 21:46:29'),('Sen_wiki_DB:pcache:idoptions:6','E��\n�@D�%P���u�(<D�����QJ��]�x	�{ä��k��xJ}$�1DA��b������i6�Y\\�h�R��&�|�J��T�)ˆ�QYժ?�Ko�����P{�\\�_�1�R�r����','2017-02-02 21:38:22'),('Sen_wiki_DB:pcache:idoptions:7','E��\n�0E�e>@�h�N������v�A�A��E��&R�f���\nG�h�j;��x���y2�8١��4��Xd*�����\\K�ؾ	�\"�D�=���xQN�4�S�ȷ�ӀZ7�����7I\"�$O��sؿ�/O0^�0O%��U���=Z���e���a���lL9���,��','2017-02-02 21:35:01'),('Sen_wiki_DB:pcache:idoptions:9','E�A\n�0E�2(�4��g).\\D�Wh��ҩ����D(����*lA����S�<��,`\r���j�B�r5s�r� ��ש����!���q�D��T�8��I7������V�Q��fcY�V�z������\Z��ڕ�+�ʡI�`�|','2017-02-01 21:46:10');
/*!40000 ALTER TABLE `objectcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oldimage`
--

DROP TABLE IF EXISTS `oldimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oldimage` (
  `oi_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `oi_archive_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `oi_size` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_width` int(11) NOT NULL DEFAULT '0',
  `oi_height` int(11) NOT NULL DEFAULT '0',
  `oi_bits` int(11) NOT NULL DEFAULT '0',
  `oi_description` varbinary(767) NOT NULL,
  `oi_user` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_user_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `oi_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `oi_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `oi_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `oi_sha1` varbinary(32) NOT NULL DEFAULT '',
  KEY `oi_usertext_timestamp` (`oi_user_text`,`oi_timestamp`),
  KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  KEY `oi_sha1` (`oi_sha1`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oldimage`
--

LOCK TABLES `oldimage` WRITE;
/*!40000 ALTER TABLE `oldimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `oldimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_namespace` int(11) NOT NULL,
  `page_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `page_restrictions` tinyblob NOT NULL,
  `page_is_redirect` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_is_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_random` double unsigned NOT NULL,
  `page_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `page_links_updated` varbinary(14) DEFAULT NULL,
  `page_latest` int(10) unsigned NOT NULL,
  `page_len` int(10) unsigned NOT NULL,
  `page_content_model` varbinary(32) DEFAULT NULL,
  `page_lang` varbinary(35) DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `name_title` (`page_namespace`,`page_title`),
  KEY `page_random` (`page_random`),
  KEY `page_len` (`page_len`),
  KEY `page_redirect_namespace_len` (`page_is_redirect`,`page_namespace`,`page_len`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,0,'Main_Page','',0,1,0.768590149262,'20170122203959',NULL,1,717,'wikitext',NULL),(2,0,'Cats','',0,1,0.927722290135,'20170124191325','20170124191325',2,10,'wikitext',NULL),(3,0,'Sen','',0,0,0.070129717936,'20170130195151','20170130195152',58,524,'wikitext',NULL),(4,0,'Employees','',0,0,0.207509113291,'20170131183615','20170131185803',100,321,'wikitext',NULL),(5,2,'SenLi','',0,1,0.053177466931,'20170124225627','20170124225425',15,40,'wikitext',NULL),(6,8,'Sidebar','',0,0,0.793534719493,'20170201213822','20170201213846',164,363,'wikitext',NULL),(7,0,'Huawei_Wiki','',0,0,0.844647299031,'20170201211700','20170201204521',157,164,'wikitext',NULL),(8,8,'Mainpage','',0,1,0.020899195092,'20170125005736','20170125005743',22,11,'wikitext',NULL),(9,14,'Employees','',0,0,0.33334457273,'20170126233702','20170126194236',51,27,'wikitext',NULL),(10,1,'Huawei_Wiki','',0,0,0.203351937294,'20170125014355','20170125014407',30,82,'wikitext',NULL),(11,6,'Sen.jpg','',0,1,0.497397511109,'20170126221854','20170125033021',32,12,'wikitext',NULL),(12,10,'TableTestTemplate','',0,0,0.84527597703,'20170126222140','20170126222419',61,598,'wikitext',NULL),(13,106,'Employees','',0,1,0.926135402377,'20170126181036','20170126181036',50,812,'wikitext',NULL),(14,274,'Iframe','',0,0,0.201065282118,'20170127003049','20170127003050',79,1373,'wikitext',NULL),(15,0,'Team_Member','',0,0,0.457119883939,'20170131230225','20170131230238',138,160,'wikitext',NULL),(16,0,'Sample_Devices_Tracking','',0,0,0.019313476063,'20170201011339','20170201011340',145,370,'wikitext',NULL),(17,0,'SortDevicesByDeviceID','',0,0,0.734759189006,'20170131220248','20170131220249',120,122,'wikitext',NULL),(18,0,'SortDevicesByDeviceModel','',0,0,0.332940798637,'20170131220944','20170131220945',128,97,'wikitext',NULL),(19,14,'SortDevices','',0,1,0.540130064352,'20170131220945','20170131220017',113,25,'wikitext',NULL),(20,0,'Project_Repositories','',0,0,0.479966961183,'20170201183040','20170201183041',150,224,'wikitext',NULL),(21,0,'Android_Source_Code_Repo','',0,0,0.289711036697,'20170201201622','20170201201623',156,135,'wikitext',NULL),(22,0,'HQ_Android_Released_Image','',0,0,0.967661044333,'20170201213937','20170201213937',165,424,'wikitext',NULL);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_props`
--

DROP TABLE IF EXISTS `page_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_props` (
  `pp_page` int(11) NOT NULL,
  `pp_propname` varbinary(60) NOT NULL,
  `pp_value` blob NOT NULL,
  `pp_sortkey` float DEFAULT NULL,
  UNIQUE KEY `pp_page_propname` (`pp_page`,`pp_propname`),
  UNIQUE KEY `pp_propname_page` (`pp_propname`,`pp_page`),
  UNIQUE KEY `pp_propname_sortkey_page` (`pp_propname`,`pp_sortkey`,`pp_page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_props`
--

LOCK TABLES `page_props` WRITE;
/*!40000 ALTER TABLE `page_props` DISABLE KEYS */;
INSERT INTO `page_props` VALUES (9,'PFDefaultForm','Employees',NULL),(14,'notoc','',NULL);
/*!40000 ALTER TABLE `page_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_restrictions`
--

DROP TABLE IF EXISTS `page_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_restrictions` (
  `pr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pr_page` int(11) NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_user` int(11) DEFAULT NULL,
  `pr_expiry` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  UNIQUE KEY `pr_pagetype` (`pr_page`,`pr_type`),
  KEY `pr_typelevel` (`pr_type`,`pr_level`),
  KEY `pr_level` (`pr_level`),
  KEY `pr_cascade` (`pr_cascade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_restrictions`
--

LOCK TABLES `page_restrictions` WRITE;
/*!40000 ALTER TABLE `page_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagelinks`
--

DROP TABLE IF EXISTS `pagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagelinks` (
  `pl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `pl_from_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  UNIQUE KEY `pl_from` (`pl_from`,`pl_namespace`,`pl_title`),
  KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`),
  KEY `pl_backlinks_namespace` (`pl_from_namespace`,`pl_namespace`,`pl_title`,`pl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagelinks`
--

LOCK TABLES `pagelinks` WRITE;
/*!40000 ALTER TABLE `pagelinks` DISABLE KEYS */;
INSERT INTO `pagelinks` VALUES (7,0,0,'Android_Source_Code_Repo'),(7,0,0,'HQ_Android_Released_Image'),(7,0,0,'Project_Repositories'),(7,0,0,'Sample_Devices_Tracking'),(3,0,0,'Sen'),(4,0,0,'Sen'),(7,0,0,'Team_Member'),(5,2,0,'Sen'),(9,14,106,'Employees');
/*!40000 ALTER TABLE `pagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protected_titles`
--

DROP TABLE IF EXISTS `protected_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protected_titles` (
  `pt_namespace` int(11) NOT NULL,
  `pt_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pt_user` int(10) unsigned NOT NULL,
  `pt_reason` varbinary(767) DEFAULT NULL,
  `pt_timestamp` binary(14) NOT NULL,
  `pt_expiry` varbinary(14) NOT NULL DEFAULT '',
  `pt_create_perm` varbinary(60) NOT NULL,
  UNIQUE KEY `pt_namespace_title` (`pt_namespace`,`pt_title`),
  KEY `pt_timestamp` (`pt_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protected_titles`
--

LOCK TABLES `protected_titles` WRITE;
/*!40000 ALTER TABLE `protected_titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `protected_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache`
--

DROP TABLE IF EXISTS `querycache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycache` (
  `qc_type` varbinary(32) NOT NULL,
  `qc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qc_namespace` int(11) NOT NULL DEFAULT '0',
  `qc_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  KEY `qc_type` (`qc_type`,`qc_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycache`
--

LOCK TABLES `querycache` WRITE;
/*!40000 ALTER TABLE `querycache` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache_info`
--

DROP TABLE IF EXISTS `querycache_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycache_info` (
  `qci_type` varbinary(32) NOT NULL DEFAULT '',
  `qci_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  UNIQUE KEY `qci_type` (`qci_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycache_info`
--

LOCK TABLES `querycache_info` WRITE;
/*!40000 ALTER TABLE `querycache_info` DISABLE KEYS */;
INSERT INTO `querycache_info` VALUES ('activeusers','20170201214643');
/*!40000 ALTER TABLE `querycache_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycachetwo`
--

DROP TABLE IF EXISTS `querycachetwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qcc_namespace` int(11) NOT NULL DEFAULT '0',
  `qcc_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `qcc_namespacetwo` int(11) NOT NULL DEFAULT '0',
  `qcc_titletwo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  KEY `qcc_type` (`qcc_type`,`qcc_value`),
  KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycachetwo`
--

LOCK TABLES `querycachetwo` WRITE;
/*!40000 ALTER TABLE `querycachetwo` DISABLE KEYS */;
INSERT INTO `querycachetwo` VALUES ('activeusers',1485298464,2,'SenLi',0,''),('activeusers',1485314260,2,'Admin',0,'');
/*!40000 ALTER TABLE `querycachetwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recentchanges`
--

DROP TABLE IF EXISTS `recentchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recentchanges` (
  `rc_id` int(11) NOT NULL AUTO_INCREMENT,
  `rc_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `rc_user` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_user_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `rc_namespace` int(11) NOT NULL DEFAULT '0',
  `rc_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `rc_comment` varbinary(767) NOT NULL DEFAULT '',
  `rc_minor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_bot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_cur_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_this_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_last_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_source` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `rc_patrolled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_ip` varbinary(40) NOT NULL DEFAULT '',
  `rc_old_len` int(11) DEFAULT NULL,
  `rc_new_len` int(11) DEFAULT NULL,
  `rc_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_logid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_log_type` varbinary(255) DEFAULT NULL,
  `rc_log_action` varbinary(255) DEFAULT NULL,
  `rc_params` blob,
  PRIMARY KEY (`rc_id`),
  KEY `rc_timestamp` (`rc_timestamp`),
  KEY `rc_namespace_title` (`rc_namespace`,`rc_title`),
  KEY `rc_cur_id` (`rc_cur_id`),
  KEY `new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  KEY `rc_ip` (`rc_ip`),
  KEY `rc_ns_usertext` (`rc_namespace`,`rc_user_text`),
  KEY `rc_user_text` (`rc_user_text`,`rc_timestamp`),
  KEY `rc_name_type_patrolled_timestamp` (`rc_namespace`,`rc_type`,`rc_patrolled`,`rc_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recentchanges`
--

LOCK TABLES `recentchanges` WRITE;
/*!40000 ALTER TABLE `recentchanges` DISABLE KEYS */;
INSERT INTO `recentchanges` VALUES (1,'20170124191325',0,'0:0:0:0:0:0:0:1',0,'Cats','Created page with \"Hello cat!\"',0,0,1,2,2,0,1,'mw.new',0,'::1',0,10,0,0,NULL,'',''),(2,'20170124220520',0,'0:0:0:0:0:0:0:1',0,'Sen','Headers Added',0,0,1,3,3,0,1,'mw.new',0,'::1',0,66,0,0,NULL,'',''),(3,'20170124220754',0,'0:0:0:0:0:0:0:1',0,'Sen','/* Career */',0,0,0,3,4,3,0,'mw.edit',0,'::1',66,133,0,0,NULL,'',''),(4,'20170124221007',0,'0:0:0:0:0:0:0:1',0,'Sen','/* Contract */',0,0,0,3,5,4,0,'mw.edit',0,'::1',133,184,0,0,NULL,'',''),(5,'20170124221128',0,'0:0:0:0:0:0:0:1',0,'Sen','',0,0,0,3,6,5,0,'mw.edit',0,'::1',184,244,0,0,NULL,'',''),(6,'20170124221242',0,'0:0:0:0:0:0:0:1',0,'Sen','/* Introduction */',0,0,0,3,7,6,0,'mw.edit',0,'::1',244,283,0,0,NULL,'',''),(7,'20170124221257',0,'0:0:0:0:0:0:0:1',0,'Sen','/* Career */',0,0,0,3,8,7,0,'mw.edit',0,'::1',283,278,0,0,NULL,'',''),(8,'20170124221318',0,'0:0:0:0:0:0:0:1',0,'Sen','/* Career */',0,0,0,3,9,8,0,'mw.edit',0,'::1',278,282,0,0,NULL,'',''),(9,'20170124221429',0,'0:0:0:0:0:0:0:1',0,'Sen','/* Introduction */',0,0,0,3,10,9,0,'mw.edit',0,'::1',282,340,0,0,NULL,'',''),(10,'20170124221446',0,'0:0:0:0:0:0:0:1',0,'Sen','/* Introduction */',0,0,0,3,11,10,0,'mw.edit',0,'::1',340,343,0,0,NULL,'',''),(11,'20170124221507',0,'0:0:0:0:0:0:0:1',0,'Sen','/* Introduction */',0,0,0,3,12,11,0,'mw.edit',0,'::1',343,345,0,0,NULL,'',''),(12,'20170124221800',0,'0:0:0:0:0:0:0:1',0,'Sen','/* Introduction */',0,0,0,3,13,12,0,'mw.edit',0,'::1',345,345,0,0,NULL,'',''),(13,'20170124222016',0,'0:0:0:0:0:0:0:1',0,'Employees','Created page with \"== Software Group ==  === Contract === [[Sen]]<br>    == Hardware Group ==\"',0,0,1,4,14,0,1,'mw.new',0,'::1',0,74,0,0,NULL,'',''),(14,'20170124225424',1,'SenLi',2,'SenLi','Created page with \"= VIP of Huawei Software Group = [[Sen]]\"',0,0,1,5,15,0,1,'mw.new',1,'::1',0,40,0,0,NULL,'',''),(15,'20170124231254',2,'Liziyuanhaha',2,'Liziyuanhaha','',0,0,0,0,0,0,3,'mw.log',1,'::1',NULL,NULL,0,2,'newusers','create','a:1:{s:9:\"4::userid\";i:2;}'),(16,'20170124233751',3,'Liziyuanhaha',2,'Liziyuanhaha','',0,0,0,0,0,0,3,'mw.log',1,'::1',NULL,NULL,0,3,'newusers','create','a:1:{s:9:\"4::userid\";i:3;}'),(17,'20170125003550',1,'SenLi',8,'Sidebar','Created page with \" * navigation ** HuaweiWiki|huaweiwikipage-description ** mainpage|mainpage-description ** recentchanges-url|recentchanges ** randompage-url|randompage ** helppage|help * SEAR...\"',0,0,1,6,16,0,1,'mw.new',1,'::1',0,199,0,0,NULL,'',''),(18,'20170125003613',1,'SenLi',8,'Sidebar','',0,0,0,6,17,16,0,'mw.edit',1,'::1',199,172,0,0,NULL,'',''),(19,'20170125003630',1,'SenLi',8,'Sidebar','',0,0,0,6,18,17,0,'mw.edit',1,'::1',172,186,0,0,NULL,'',''),(20,'20170125005325',1,'SenLi',8,'Sidebar','',0,0,0,6,19,18,0,'mw.edit',1,'::1',186,187,0,0,NULL,'',''),(21,'20170125005437',1,'SenLi',0,'Huawei_Wiki','Created page with \"= Introduction =  == [[Employees]] ==  === [[[Software Group]]] ===  === [[[Hardware Group]]] ===\"',0,0,1,7,20,0,1,'mw.new',1,'::1',0,97,0,0,NULL,'',''),(22,'20170125005459',1,'SenLi',0,'Huawei_Wiki','/* Employees */',0,0,0,7,21,20,0,'mw.edit',1,'::1',97,93,0,0,NULL,'',''),(23,'20170125005736',1,'SenLi',8,'Mainpage','Created page with \"Huawei Wiki\"',0,0,1,8,22,0,1,'mw.new',1,'::1',0,11,0,0,NULL,'',''),(24,'20170125005814',1,'SenLi',8,'Sidebar','',0,0,0,6,23,19,0,'mw.edit',1,'::1',187,154,0,0,NULL,'',''),(25,'20170125013332',1,'SenLi',0,'Sen','',0,0,0,3,24,13,0,'mw.edit',1,'::1',345,370,0,0,NULL,'',''),(26,'20170125013555',1,'SenLi',0,'Sen','',0,0,0,3,25,24,0,'mw.edit',1,'::1',370,374,0,0,NULL,'',''),(27,'20170125013612',1,'SenLi',0,'Sen','',0,0,0,3,26,25,0,'mw.edit',1,'::1',374,370,0,0,NULL,'',''),(28,'20170125013634',1,'SenLi',0,'Sen','',0,0,0,3,27,26,0,'mw.edit',1,'::1',370,370,0,0,NULL,'',''),(29,'20170125013935',1,'SenLi',14,'Employees','Created page with \"This page contains all the employees of Huawei.\"',0,0,1,9,28,0,1,'mw.new',1,'::1',0,47,0,0,NULL,'',''),(30,'20170125014251',1,'SenLi',1,'Huawei_Wiki','/* Employees */ new section',0,0,1,10,29,0,1,'mw.new',1,'::1',0,53,0,0,NULL,'',''),(31,'20170125014355',1,'SenLi',1,'Huawei_Wiki','',0,0,0,10,30,29,0,'mw.edit',1,'::1',53,82,0,0,NULL,'',''),(32,'20170125025355',4,'Admin',2,'Admin','',0,0,0,0,0,0,3,'mw.log',1,'::1',NULL,NULL,0,19,'newusers','create','a:1:{s:9:\"4::userid\";i:4;}'),(33,'20170125025457',1,'SenLi',2,'Admin','',0,0,0,0,0,0,3,'mw.log',1,'::1',NULL,NULL,0,20,'rights','rights','a:2:{s:12:\"4::oldgroups\";a:0:{}s:12:\"5::newgroups\";a:2:{i:0;s:5:\"sysop\";i:1;s:10:\"bureaucrat\";}}'),(34,'20170125031740',4,'Admin',0,'Sen','',0,0,0,3,31,27,0,'mw.edit',1,'::1',370,399,0,0,NULL,'',''),(35,'20170125033000',4,'Admin',6,'Sen.jpg','Sen Portrait',0,0,0,11,32,0,3,'mw.log',1,'::1',NULL,NULL,0,22,'upload','upload','a:2:{s:8:\"img_sha1\";s:31:\"01w9h8so5raxtslx1kdk1cstg5pzumg\";s:13:\"img_timestamp\";s:14:\"20170125033000\";}'),(36,'20170125033145',4,'Admin',0,'Sen','',0,0,0,3,33,31,0,'mw.edit',1,'::1',399,419,0,0,NULL,'',''),(37,'20170125033305',4,'Admin',0,'Sen','',0,0,0,3,34,33,0,'mw.edit',1,'::1',419,424,0,0,NULL,'',''),(38,'20170125033327',4,'Admin',0,'Sen','',0,0,0,3,35,34,0,'mw.edit',1,'::1',424,422,0,0,NULL,'',''),(39,'20170125033535',4,'Admin',0,'Sen','',0,0,0,3,36,35,0,'mw.edit',1,'::1',422,432,0,0,NULL,'',''),(40,'20170125033641',4,'Admin',0,'Sen','',0,0,0,3,37,36,0,'mw.edit',1,'::1',432,433,0,0,NULL,'',''),(41,'20170125033655',4,'Admin',0,'Sen','',0,0,0,3,38,37,0,'mw.edit',1,'::1',433,427,0,0,NULL,'',''),(42,'20170125033850',4,'Admin',0,'Sen','',0,0,0,3,39,38,0,'mw.edit',1,'::1',427,435,0,0,NULL,'',''),(43,'20170125034143',4,'Admin',0,'Sen','',0,0,0,3,40,39,0,'mw.edit',1,'::1',435,435,0,0,NULL,'',''),(44,'20170125035327',4,'Admin',0,'Sen','',0,0,0,3,41,40,0,'mw.edit',1,'::1',435,443,0,0,NULL,'',''),(45,'20170125035412',4,'Admin',0,'Sen','',0,0,0,3,42,41,0,'mw.edit',1,'::1',443,452,0,0,NULL,'',''),(46,'20170125035434',4,'Admin',0,'Sen','',0,0,0,3,43,42,0,'mw.edit',1,'::1',452,454,0,0,NULL,'',''),(47,'20170125035624',4,'Admin',0,'Sen','',0,0,0,3,44,43,0,'mw.edit',1,'::1',454,515,0,0,NULL,'',''),(48,'20170125035642',4,'Admin',0,'Sen','',0,0,0,3,45,44,0,'mw.edit',1,'::1',515,520,0,0,NULL,'',''),(49,'20170125035654',4,'Admin',0,'Sen','',0,0,0,3,46,45,0,'mw.edit',1,'::1',520,524,0,0,NULL,'',''),(50,'20170126000719',0,'0:0:0:0:0:0:0:1',0,'Employees','/* Contract */',0,0,0,4,47,14,0,'mw.edit',0,'::1',74,123,0,0,NULL,'',''),(51,'20170126000833',0,'0:0:0:0:0:0:0:1',0,'Employees','/* Contract */',0,0,0,4,48,47,0,'mw.edit',0,'::1',123,72,0,0,NULL,'',''),(52,'20170126181036',4,'Admin',10,'TableTestTemplate','',0,0,1,12,49,0,1,'mw.new',1,'::1',0,351,0,0,NULL,'',''),(53,'20170126181036',4,'Admin',106,'Employees','',0,0,1,13,50,0,1,'mw.new',1,'127.0.0.1',0,812,0,0,NULL,'',''),(54,'20170126194236',4,'Admin',14,'Employees','',0,0,0,9,51,28,0,'mw.edit',1,'127.0.0.1',47,27,0,0,NULL,'',''),(55,'20170126210501',4,'Admin',0,'Employees','',0,0,0,4,52,48,0,'mw.edit',1,'::1',72,94,0,0,NULL,'',''),(56,'20170126215629',4,'Admin',0,'Employees','',0,0,0,4,53,52,0,'mw.edit',1,'::1',94,134,0,0,NULL,'',''),(57,'20170126215648',4,'Admin',0,'Employees','',0,0,0,4,54,53,0,'mw.edit',1,'::1',134,145,0,0,NULL,'',''),(58,'20170126215843',4,'Admin',0,'Employees','',0,0,0,4,55,54,0,'mw.edit',1,'::1',145,169,0,0,NULL,'',''),(59,'20170126215857',4,'Admin',0,'Employees','',0,0,0,4,56,55,0,'mw.edit',1,'::1',169,170,0,0,NULL,'',''),(60,'20170126221832',4,'Admin',0,'Sen','',0,0,0,3,57,46,0,'mw.edit',1,'::1',524,532,0,0,NULL,'',''),(61,'20170126221853',4,'Admin',0,'Sen','',0,0,0,3,58,57,0,'mw.edit',1,'::1',532,524,0,0,NULL,'',''),(62,'20170126222106',4,'Admin',10,'TableTestTemplate','',0,0,0,12,59,49,0,'mw.edit',1,'::1',351,474,0,0,NULL,'',''),(63,'20170126222122',4,'Admin',10,'TableTestTemplate','',0,0,0,12,60,59,0,'mw.edit',1,'::1',474,596,0,0,NULL,'',''),(64,'20170126222140',4,'Admin',10,'TableTestTemplate','',0,0,0,12,61,60,0,'mw.edit',1,'::1',596,598,0,0,NULL,'',''),(65,'20170126222624',4,'Admin',0,'Employees','',0,0,0,4,62,56,0,'mw.edit',1,'::1',170,170,0,0,NULL,'',''),(66,'20170126222902',4,'Admin',0,'Employees','',0,0,0,4,63,62,0,'mw.edit',1,'::1',170,166,0,0,NULL,'',''),(67,'20170126232844',4,'Admin',274,'Iframe','Created page with \"<noinclude>__NOTOC__ This widget allows you to embed any web page on your wiki page using an iframe tag.  Created by [https://www.mediawikiwidgets.org/User:Sergey_Chernyshev S...\"',0,0,1,14,64,0,1,'mw.new',1,'::1',0,1373,0,0,NULL,'',''),(68,'20170126233045',4,'Admin',0,'Employees','',0,0,0,4,65,63,0,'mw.edit',1,'::1',166,134,0,0,NULL,'',''),(69,'20170126233701',4,'Admin',0,'Employees','',0,0,0,4,66,65,0,'mw.edit',1,'::1',134,75,0,0,NULL,'',''),(70,'20170126235115',4,'Admin',0,'Employees','',0,0,0,4,67,66,0,'mw.edit',1,'::1',75,198,0,0,NULL,'',''),(71,'20170126235248',4,'Admin',0,'Employees','',0,0,0,4,68,67,0,'mw.edit',1,'::1',198,94,0,0,NULL,'',''),(72,'20170126235257',4,'Admin',0,'Employees','',0,0,0,4,69,68,0,'mw.edit',1,'::1',94,93,0,0,NULL,'',''),(73,'20170126235634',4,'Admin',274,'Iframe','',0,0,0,14,70,64,0,'mw.edit',1,'::1',1373,1352,0,0,NULL,'',''),(74,'20170127001141',4,'Admin',274,'Iframe','',0,0,0,14,71,70,0,'mw.edit',1,'::1',1352,1373,0,0,NULL,'',''),(75,'20170127001205',4,'Admin',0,'Employees','',0,0,0,4,72,69,0,'mw.edit',1,'::1',93,87,0,0,NULL,'',''),(76,'20170127001215',4,'Admin',0,'Employees','/* Hardware Group */',0,0,0,4,73,72,0,'mw.edit',1,'::1',87,87,0,0,NULL,'',''),(77,'20170127002301',4,'Admin',274,'Iframe','Blanked the page',0,0,0,14,74,71,0,'mw.edit',1,'::1',1373,0,0,0,NULL,'',''),(78,'20170127002317',4,'Admin',0,'Employees','',0,0,0,4,75,73,0,'mw.edit',1,'::1',87,94,0,0,NULL,'',''),(79,'20170127002423',4,'Admin',274,'Iframe','',0,0,0,14,76,74,0,'mw.edit',1,'::1',0,1180,0,0,NULL,'',''),(80,'20170127002501',4,'Admin',274,'Iframe','',0,0,0,14,77,76,0,'mw.edit',1,'::1',1180,657,0,0,NULL,'',''),(81,'20170127002655',4,'Admin',0,'Employees','/* Hardware Group */',0,0,0,4,78,75,0,'mw.edit',1,'::1',94,193,0,0,NULL,'',''),(82,'20170127003049',4,'Admin',274,'Iframe','',0,0,0,14,79,77,0,'mw.edit',1,'::1',657,1373,0,0,NULL,'',''),(83,'20170130165228',4,'Admin',0,'Employees','',0,0,0,4,80,78,0,'mw.edit',1,'::1',193,95,0,0,NULL,'',''),(84,'20170130165712',4,'Admin',0,'Employees','',0,0,0,4,81,80,0,'mw.edit',1,'::1',95,1424,0,0,NULL,'',''),(85,'20170130171224',4,'Admin',0,'Employees','Replaced content with \"   == Software Group ==  === Contract === [[Sen]]<br>   == Hardware Group ==\"',0,0,0,4,82,81,0,'mw.edit',1,'::1',1424,76,0,0,NULL,'',''),(86,'20170130190021',4,'Admin',0,'Employees','',0,0,0,4,83,82,0,'mw.edit',1,'::1',76,125,0,0,NULL,'',''),(87,'20170130190056',4,'Admin',0,'Employees','',0,0,0,4,84,83,0,'mw.edit',1,'::1',125,195,0,0,NULL,'',''),(88,'20170130191155',4,'Admin',0,'Employees','',0,0,0,4,85,84,0,'mw.edit',1,'::1',195,173,0,0,NULL,'',''),(89,'20170130193938',4,'Admin',0,'Employees','',0,0,0,4,86,85,0,'mw.edit',1,'::1',173,179,0,0,NULL,'',''),(90,'20170130193956',4,'Admin',0,'Employees','',0,0,0,4,87,86,0,'mw.edit',1,'::1',179,179,0,0,NULL,'',''),(91,'20170130194004',4,'Admin',0,'Employees','',0,0,0,4,88,87,0,'mw.edit',1,'::1',179,177,0,0,NULL,'',''),(92,'20170130194019',4,'Admin',0,'Employees','',0,0,0,4,89,88,0,'mw.edit',1,'::1',177,175,0,0,NULL,'',''),(93,'20170130194029',4,'Admin',0,'Employees','',0,0,0,4,90,89,0,'mw.edit',1,'::1',175,175,0,0,NULL,'',''),(94,'20170130194042',4,'Admin',0,'Employees','',0,0,0,4,91,90,0,'mw.edit',1,'::1',175,174,0,0,NULL,'',''),(95,'20170130194050',4,'Admin',0,'Employees','',0,0,0,4,92,91,0,'mw.edit',1,'::1',174,174,0,0,NULL,'',''),(96,'20170130194712',4,'Admin',0,'Employees','/* Hardware Group */',0,0,0,4,93,92,0,'mw.edit',1,'::1',174,175,0,0,NULL,'',''),(97,'20170130195003',4,'Admin',0,'Employees','/* Hardware Group */',0,0,0,4,94,93,0,'mw.edit',1,'::1',175,176,0,0,NULL,'',''),(98,'20170130195230',4,'Admin',0,'Employees','/* Hardware Group */',0,0,0,4,95,94,0,'mw.edit',1,'::1',176,236,0,0,NULL,'',''),(99,'20170130200045',4,'Admin',0,'Employees','/* Hardware Group */',0,0,0,4,96,95,0,'mw.edit',1,'::1',236,239,0,0,NULL,'',''),(100,'20170131032316',4,'Admin',0,'Huawei_Wiki','',0,0,0,7,97,21,0,'mw.edit',1,'::1',93,107,0,0,NULL,'',''),(101,'20170131032344',4,'Admin',0,'Huawei_Wiki','',0,0,0,7,98,97,0,'mw.edit',1,'::1',107,81,0,0,NULL,'',''),(102,'20170131183559',4,'Admin',0,'Employees','/* Hardware Group */',0,0,0,4,99,96,0,'mw.edit',1,'::1',239,324,0,0,NULL,'',''),(103,'20170131183615',4,'Admin',0,'Employees','/* Hardware Group */',0,0,0,4,100,99,0,'mw.edit',1,'::1',324,321,0,0,NULL,'',''),(104,'20170131190542',0,'0:0:0:0:0:0:0:1',0,'Huawei_Wiki','',0,0,0,7,101,98,0,'mw.edit',0,'::1',81,326,0,0,NULL,'',''),(105,'20170131190618',0,'0:0:0:0:0:0:0:1',0,'Huawei_Wiki','',0,0,0,7,102,101,0,'mw.edit',0,'::1',326,327,0,0,NULL,'',''),(106,'20170131190721',0,'0:0:0:0:0:0:0:1',0,'Team_Member','Created page with \"[http://192.168.1.61/addNewEmployee.php Add a New Employee] (Tip: You can click the middle button of the mouse to open this link in a New Page.)  {{#widget:Iframe |url=http://...\"',0,0,1,15,103,0,1,'mw.new',0,'::1',0,244,0,0,NULL,'',''),(107,'20170131190827',0,'0:0:0:0:0:0:0:1',0,'Huawei_Wiki','',0,0,0,7,104,102,0,'mw.edit',0,'::1',327,74,0,0,NULL,'',''),(108,'20170131202410',0,'0:0:0:0:0:0:0:1',0,'Sample_Devices_Tracking','Created page with \"{{#widget:Iframe |url=http://localhost/sortByDeviceID.php |width=100% |height=800 |border=0 }}\"',0,0,1,16,105,0,1,'mw.new',0,'::1',0,94,0,0,NULL,'',''),(109,'20170131202459',0,'0:0:0:0:0:0:0:1',0,'Huawei_Wiki','',0,0,0,7,106,104,0,'mw.edit',0,'::1',74,73,0,0,NULL,'',''),(110,'20170131215319',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','Created page with \"[[Categories:SortDevicesByDeviceID]]\"',0,0,1,17,107,0,1,'mw.new',0,'::1',0,36,0,0,NULL,'',''),(111,'20170131215734',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,108,107,0,'mw.edit',0,'::1',36,25,0,0,NULL,'',''),(112,'20170131215750',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,109,108,0,'mw.edit',0,'::1',25,25,0,0,NULL,'',''),(113,'20170131215803',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,110,109,0,'mw.edit',0,'::1',25,25,0,0,NULL,'',''),(114,'20170131215814',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,111,110,0,'mw.edit',0,'::1',25,24,0,0,NULL,'',''),(115,'20170131215910',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceModel','Created page with \"[[category:SortDevices]]\"',0,0,1,18,112,0,1,'mw.new',0,'::1',0,24,0,0,NULL,'',''),(116,'20170131215959',0,'0:0:0:0:0:0:0:1',14,'SortDevices','Show Devices',0,0,1,19,113,0,1,'mw.new',0,'::1',0,25,0,0,NULL,'',''),(117,'20170131220141',0,'0:0:0:0:0:0:0:1',0,'Sample_Devices_Tracking','Blanked the page',0,0,0,16,114,105,0,'mw.edit',0,'::1',94,0,0,0,NULL,'',''),(118,'20170131220159',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,115,111,0,'mw.edit',0,'::1',24,122,0,0,NULL,'',''),(119,'20170131220212',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,116,115,0,'mw.edit',0,'::1',122,122,0,0,NULL,'',''),(120,'20170131220223',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,117,116,0,'mw.edit',0,'::1',122,122,0,0,NULL,'',''),(121,'20170131220233',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,118,117,0,'mw.edit',0,'::1',122,122,0,0,NULL,'',''),(122,'20170131220241',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,119,118,0,'mw.edit',0,'::1',122,122,0,0,NULL,'',''),(123,'20170131220248',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,120,119,0,'mw.edit',0,'::1',122,122,0,0,NULL,'',''),(124,'20170131220352',0,'0:0:0:0:0:0:0:1',0,'Huawei_Wiki','/* Sample Devices Tracking */',0,0,0,7,121,106,0,'mw.edit',0,'::1',73,172,0,0,NULL,'',''),(125,'20170131220422',0,'0:0:0:0:0:0:0:1',0,'Huawei_Wiki','',0,0,0,7,122,121,0,'mw.edit',0,'::1',172,73,0,0,NULL,'',''),(126,'20170131220437',0,'0:0:0:0:0:0:0:1',0,'Sample_Devices_Tracking','',0,0,0,16,123,114,0,'mw.edit',0,'::1',0,93,0,0,NULL,'',''),(127,'20170131220448',0,'0:0:0:0:0:0:0:1',0,'Sample_Devices_Tracking','/* SortDevicesByDeviceID */',0,0,0,16,124,123,0,'mw.edit',0,'::1',93,96,0,0,NULL,'',''),(128,'20170131220502',0,'0:0:0:0:0:0:0:1',0,'Sample_Devices_Tracking','',0,0,0,16,125,124,0,'mw.edit',0,'::1',96,106,0,0,NULL,'',''),(129,'20170131220533',0,'0:0:0:0:0:0:0:1',0,'Huawei_Wiki','',0,0,0,7,126,122,0,'mw.edit',0,'::1',73,57,0,0,NULL,'',''),(130,'20170131220745',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceModel','',0,0,0,18,127,112,0,'mw.edit',0,'::1',24,125,0,0,NULL,'',''),(131,'20170131220944',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceModel','',0,0,0,18,128,127,0,'mw.edit',0,'::1',125,97,0,0,NULL,'',''),(132,'20170131221023',0,'0:0:0:0:0:0:0:1',0,'Sample_Devices_Tracking','',0,0,0,16,129,125,0,'mw.edit',0,'::1',106,94,0,0,NULL,'',''),(133,'20170131221429',0,'0:0:0:0:0:0:0:1',0,'Sample_Devices_Tracking','',0,0,0,16,130,129,0,'mw.edit',0,'::1',94,236,0,0,NULL,'',''),(134,'20170131222055',4,'Admin',8,'Sidebar','',0,0,0,6,131,23,0,'mw.edit',1,'::1',154,158,0,0,NULL,'',''),(135,'20170131222135',4,'Admin',8,'Sidebar','',0,0,0,6,132,131,0,'mw.edit',1,'::1',158,236,0,0,NULL,'',''),(136,'20170131222207',4,'Admin',8,'Sidebar','',0,0,0,6,133,132,0,'mw.edit',1,'::1',236,227,0,0,NULL,'',''),(137,'20170131222222',4,'Admin',8,'Sidebar','',0,0,0,6,134,133,0,'mw.edit',1,'::1',227,229,0,0,NULL,'',''),(138,'20170131224959',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,135,130,0,'mw.edit',1,'::1',236,151,0,0,NULL,'',''),(139,'20170131225357',4,'Admin',0,'Team_Member','',0,0,0,15,136,103,0,'mw.edit',1,'::1',244,98,0,0,NULL,'',''),(140,'20170131225504',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,137,135,0,'mw.edit',1,'::1',151,94,0,0,NULL,'',''),(141,'20170131230225',4,'Admin',0,'Team_Member','',0,0,0,15,138,136,0,'mw.edit',1,'::1',98,160,0,0,NULL,'',''),(142,'20170131230413',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,139,137,0,'mw.edit',1,'::1',94,300,0,0,NULL,'',''),(143,'20170131230441',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,140,139,0,'mw.edit',1,'::1',300,329,0,0,NULL,'',''),(144,'20170131230634',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,141,140,0,'mw.edit',1,'::1',329,307,0,0,NULL,'',''),(145,'20170131230659',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,142,141,0,'mw.edit',1,'::1',307,328,0,0,NULL,'',''),(146,'20170131230726',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,143,142,0,'mw.edit',1,'::1',328,319,0,0,NULL,'',''),(147,'20170201011300',4,'Admin',0,'Huawei_Wiki','',0,0,0,7,144,126,0,'mw.edit',1,'::1',57,90,0,0,NULL,'',''),(148,'20170201011339',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,145,143,0,'mw.edit',1,'::1',319,370,0,0,NULL,'',''),(149,'20170201011425',4,'Admin',0,'Project_Repositories','Created page with \"{{#widget:Iframe |url=http://localhost/getProjectRepos.php |width=100% |height=670 |border=0 }}\"',0,0,1,20,146,0,1,'mw.new',1,'::1',0,95,0,0,NULL,'',''),(150,'20170201021140',4,'Admin',8,'Sidebar','',0,0,0,6,147,134,0,'mw.edit',1,'::1',229,269,0,0,NULL,'',''),(151,'20170201182450',4,'Admin',0,'Project_Repositories','',0,0,0,20,148,146,0,'mw.edit',1,'::1',95,530,0,0,NULL,'',''),(152,'20170201182509',4,'Admin',0,'Project_Repositories','',0,0,0,20,149,148,0,'mw.edit',1,'::1',530,188,0,0,NULL,'',''),(153,'20170201182906',4,'Admin',0,'Project_Repositories','',0,0,0,20,150,149,0,'mw.edit',1,'::1',188,224,0,0,NULL,'',''),(154,'20170201192422',4,'Admin',0,'Huawei_Wiki','',0,0,0,7,151,144,0,'mw.edit',1,'::1',90,127,0,0,NULL,'',''),(155,'20170201192457',4,'Admin',8,'Sidebar','',0,0,0,6,152,147,0,'mw.edit',1,'::1',269,311,0,0,NULL,'',''),(156,'20170201192508',4,'Admin',8,'Sidebar','',0,0,0,6,153,152,0,'mw.edit',1,'::1',311,317,0,0,NULL,'',''),(157,'20170201200113',4,'Admin',0,'Android_Source_Code_Repo','Created page with \"{{#widget:Iframe |url=http://localhost/getSourceCodeRepos.php |width=100% |height=670 |border=0 }}\"',0,0,1,21,154,0,1,'mw.new',1,'::1',0,98,0,0,NULL,'',''),(158,'20170201201603',4,'Admin',0,'Android_Source_Code_Repo','',0,0,0,21,155,154,0,'mw.edit',1,'::1',98,134,0,0,NULL,'',''),(159,'20170201201622',4,'Admin',0,'Android_Source_Code_Repo','',0,0,0,21,156,155,0,'mw.edit',1,'::1',134,135,0,0,NULL,'',''),(160,'20170201204520',4,'Admin',0,'Huawei_Wiki','',0,0,0,7,157,151,0,'mw.edit',1,'::1',127,164,0,0,NULL,'',''),(161,'20170201204646',4,'Admin',0,'HQ_Android_Released_Image','Created page with \"{| class=\"wikitable sortable collapsible\" ! Name ! Description ! Instruction ! Tag |- | MediaWiki Image || reposR3 || To Be Determined |- |}\"',0,0,1,22,158,0,1,'mw.new',1,'::1',0,140,0,0,NULL,'',''),(162,'20170201204714',4,'Admin',0,'HQ_Android_Released_Image','',0,0,0,22,159,158,0,'mw.edit',1,'::1',140,149,0,0,NULL,'',''),(163,'20170201211654',4,'Admin',0,'HQ_Android_Released_Image','',0,0,0,22,160,159,0,'mw.edit',1,'::1',149,163,0,0,NULL,'',''),(164,'20170201211710',4,'Admin',0,'HQ_Android_Released_Image','',0,0,0,22,161,160,0,'mw.edit',1,'::1',163,166,0,0,NULL,'',''),(165,'20170201212744',4,'Admin',0,'HQ_Android_Released_Image','',0,0,0,22,162,161,0,'mw.edit',1,'::1',166,390,0,0,NULL,'',''),(166,'20170201212928',4,'Admin',0,'HQ_Android_Released_Image','',0,0,0,22,163,162,0,'mw.edit',1,'::1',390,440,0,0,NULL,'',''),(167,'20170201213822',4,'Admin',8,'Sidebar','',0,0,0,6,164,153,0,'mw.edit',1,'::1',317,363,0,0,NULL,'',''),(168,'20170201213937',4,'Admin',0,'HQ_Android_Released_Image','',0,0,0,22,165,163,0,'mw.edit',1,'::1',440,424,0,0,NULL,'','');
/*!40000 ALTER TABLE `recentchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirect`
--

DROP TABLE IF EXISTS `redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirect` (
  `rd_from` int(10) unsigned NOT NULL DEFAULT '0',
  `rd_namespace` int(11) NOT NULL DEFAULT '0',
  `rd_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `rd_interwiki` varchar(32) DEFAULT NULL,
  `rd_fragment` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`rd_from`),
  KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirect`
--

LOCK TABLES `redirect` WRITE;
/*!40000 ALTER TABLE `redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revision` (
  `rev_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rev_page` int(10) unsigned NOT NULL,
  `rev_text_id` int(10) unsigned NOT NULL,
  `rev_comment` varbinary(767) NOT NULL,
  `rev_user` int(10) unsigned NOT NULL DEFAULT '0',
  `rev_user_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `rev_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `rev_minor_edit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_len` int(10) unsigned DEFAULT NULL,
  `rev_parent_id` int(10) unsigned DEFAULT NULL,
  `rev_sha1` varbinary(32) NOT NULL DEFAULT '',
  `rev_content_model` varbinary(32) DEFAULT NULL,
  `rev_content_format` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`rev_id`),
  KEY `rev_page_id` (`rev_page`,`rev_id`),
  KEY `rev_timestamp` (`rev_timestamp`),
  KEY `page_timestamp` (`rev_page`,`rev_timestamp`),
  KEY `user_timestamp` (`rev_user`,`rev_timestamp`),
  KEY `usertext_timestamp` (`rev_user_text`,`rev_timestamp`),
  KEY `page_user_timestamp` (`rev_page`,`rev_user`,`rev_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 MAX_ROWS=10000000 AVG_ROW_LENGTH=1024;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` VALUES (1,1,1,'',0,'MediaWiki default','20170122203959',0,0,717,0,'6wzmf83s5t2n0ntohe3bmgww4dea1u3',NULL,NULL),(2,2,2,'Created page with \"Hello cat!\"',0,'0:0:0:0:0:0:0:1','20170124191325',0,0,10,0,'7g20z15a6qfuzpdurv7sulx2gts9er9',NULL,NULL),(3,3,3,'Headers Added',0,'0:0:0:0:0:0:0:1','20170124220520',0,0,66,0,'knb8gap9tqr903tr5vcj2cwx36lu31l',NULL,NULL),(4,3,4,'/* Career */',0,'0:0:0:0:0:0:0:1','20170124220754',0,0,133,3,'834ocemc04e4qj27m79jdkh3h5w4798',NULL,NULL),(5,3,5,'/* Contract */',0,'0:0:0:0:0:0:0:1','20170124221007',0,0,184,4,'ss26x9tk45c2ym8y1fl0lky4g40nuvs',NULL,NULL),(6,3,6,'',0,'0:0:0:0:0:0:0:1','20170124221128',0,0,244,5,'thgeokapjy9tpvph4pidv67bjm0nhz8',NULL,NULL),(7,3,7,'/* Introduction */',0,'0:0:0:0:0:0:0:1','20170124221242',0,0,283,6,'f7my96csskspg2b75wiplwpzjd6edek',NULL,NULL),(8,3,8,'/* Career */',0,'0:0:0:0:0:0:0:1','20170124221257',0,0,278,7,'i5zeub04u3urgdalm49uwg8x1czrl45',NULL,NULL),(9,3,9,'/* Career */',0,'0:0:0:0:0:0:0:1','20170124221318',0,0,282,8,'g8o0wz7ccsxwq40pdxx012u1f3hwlyl',NULL,NULL),(10,3,10,'/* Introduction */',0,'0:0:0:0:0:0:0:1','20170124221429',0,0,340,9,'gj98sjnuvxpfz3w0n7ybaex1c1ywzc8',NULL,NULL),(11,3,11,'/* Introduction */',0,'0:0:0:0:0:0:0:1','20170124221446',0,0,343,10,'re7kztc773qazsy899caunuatpw6z09',NULL,NULL),(12,3,12,'/* Introduction */',0,'0:0:0:0:0:0:0:1','20170124221507',0,0,345,11,'kg5r7a39wfz3zmu3f8ua9j3nhdt3qc6',NULL,NULL),(13,3,13,'/* Introduction */',0,'0:0:0:0:0:0:0:1','20170124221800',0,0,345,12,'h2vt52ozcqo6ymu4xzbx00l4hndp2fm',NULL,NULL),(14,4,14,'Created page with \"== Software Group ==  === Contract === [[Sen]]<br>    == Hardware Group ==\"',0,'0:0:0:0:0:0:0:1','20170124222016',0,0,74,0,'208f2es5mf0bxbuqdl0llfee3wd4hup',NULL,NULL),(15,5,15,'Created page with \"= VIP of Huawei Software Group = [[Sen]]\"',1,'SenLi','20170124225424',0,0,40,0,'4h8v1v8kh6qshiwpvc2x4y9z3f1vgvd',NULL,NULL),(16,6,16,'Created page with \" * navigation ** HuaweiWiki|huaweiwikipage-description ** mainpage|mainpage-description ** recentchanges-url|recentchanges ** randompage-url|randompage ** helppage|help * SEAR...\"',1,'SenLi','20170125003550',0,0,199,0,'4ofp8iwm2wy11adm3gwrxix337ewhcm',NULL,NULL),(17,6,17,'',1,'SenLi','20170125003613',0,0,172,16,'bzi1y235vwuxf37tonf5c957660mj0c',NULL,NULL),(18,6,18,'',1,'SenLi','20170125003630',0,0,186,17,'ibzuad7bnwho1estk33r7yuzbyjz0wu',NULL,NULL),(19,6,19,'',1,'SenLi','20170125005325',0,0,187,18,'pgxd6ose7rnwd2jnm2jk662x54srcf1',NULL,NULL),(20,7,20,'Created page with \"= Introduction =  == [[Employees]] ==  === [[[Software Group]]] ===  === [[[Hardware Group]]] ===\"',1,'SenLi','20170125005437',0,0,97,0,'rtn5m79c5hiqpzs90b9xaxqxmxnlrg8',NULL,NULL),(21,7,21,'/* Employees */',1,'SenLi','20170125005459',0,0,93,20,'j3fnfxupmqk63bxw1m81liznr8e4i55',NULL,NULL),(22,8,22,'Created page with \"Huawei Wiki\"',1,'SenLi','20170125005736',0,0,11,0,'hm416t17ijfa87cq1qundx86ivthy45',NULL,NULL),(23,6,23,'',1,'SenLi','20170125005814',0,0,154,19,'ovbse17xut7jsgzeog01qe10qcld0s8',NULL,NULL),(24,3,24,'',1,'SenLi','20170125013332',0,0,370,13,'9fvhr1mp84iizgioytu1o3n4anbnrs1',NULL,NULL),(25,3,25,'',1,'SenLi','20170125013555',0,0,374,24,'1hwowg30fdrrv4nmtsjyoj2w66zml9d',NULL,NULL),(26,3,26,'',1,'SenLi','20170125013612',0,0,370,25,'l45yx8quxt2aywc3d8pd2upobf57rl4',NULL,NULL),(27,3,27,'',1,'SenLi','20170125013634',0,0,370,26,'9fvhr1mp84iizgioytu1o3n4anbnrs1',NULL,NULL),(28,9,28,'Created page with \"This page contains all the employees of Huawei.\"',1,'SenLi','20170125013935',0,0,47,0,'cdr3d736f0jik3c7n7aub7xo5mmubr2',NULL,NULL),(29,10,29,'/* Employees */ new section',1,'SenLi','20170125014251',0,0,53,0,'9kbwmujawmnxvbf03xg5gfh0ajdjm1s',NULL,NULL),(30,10,30,'',1,'SenLi','20170125014355',0,0,82,29,'rhpahnwin5tuzyxcp2d7phi7278xfsd',NULL,NULL),(31,3,31,'',4,'Admin','20170125031740',0,0,399,27,'840x4sa8f868j321byudgox7i5na1wq',NULL,NULL),(32,11,32,'Sen Portrait',4,'Admin','20170125033001',0,0,12,0,'mex0r2pt8qi1ss9l4f4o9ocadziu62t',NULL,NULL),(33,3,33,'',4,'Admin','20170125033145',0,0,419,31,'j7encqoxnmf1tfi5xa2n25eg4o3j7ei',NULL,NULL),(34,3,34,'',4,'Admin','20170125033305',0,0,424,33,'q9mqpa9abgczj18033yyaeq1s9q7un8',NULL,NULL),(35,3,35,'',4,'Admin','20170125033327',0,0,422,34,'1rb3rheb4ez1t1du7t9a35yt291knzx',NULL,NULL),(36,3,36,'',4,'Admin','20170125033535',0,0,432,35,'oibg8wn0xggoub900xyp930el74jkm2',NULL,NULL),(37,3,37,'',4,'Admin','20170125033641',0,0,433,36,'7wp5dfn05tvp9bmcis61tkr778q4ep0',NULL,NULL),(38,3,38,'',4,'Admin','20170125033655',0,0,427,37,'sdn518g6s73plwm8w6dyfpsp1hz2cee',NULL,NULL),(39,3,39,'',4,'Admin','20170125033850',0,0,435,38,'dyae0y2x0lo1q1y85yi29wsigwcj6rt',NULL,NULL),(40,3,40,'',4,'Admin','20170125034143',0,0,435,39,'krmx5wuffery5z2s31vxq9aab6zzrhy',NULL,NULL),(41,3,41,'',4,'Admin','20170125035327',0,0,443,40,'9vkhm9p0ltkciiua734yoifvzkoyvqp',NULL,NULL),(42,3,42,'',4,'Admin','20170125035412',0,0,452,41,'b7l86euc3wxhu80js8jfb5n6mvsak7v',NULL,NULL),(43,3,43,'',4,'Admin','20170125035434',0,0,454,42,'cv6uljd9bvymtr6k6uo6o4ol3mduuis',NULL,NULL),(44,3,44,'',4,'Admin','20170125035624',0,0,515,43,'q566m75cslbnvfm9qlagb3wyabachse',NULL,NULL),(45,3,45,'',4,'Admin','20170125035642',0,0,520,44,'gkvfaupnxrybv5d3nj1ly8voucezqqv',NULL,NULL),(46,3,46,'',4,'Admin','20170125035654',0,0,524,45,'qu6q9tuznbujukep7an08187leg6wzw',NULL,NULL),(47,4,47,'/* Contract */',0,'0:0:0:0:0:0:0:1','20170126000719',0,0,123,14,'a7pg2n7uxhwk7hb4at4r2s83y837t8m',NULL,NULL),(48,4,48,'/* Contract */',0,'0:0:0:0:0:0:0:1','20170126000833',0,0,72,47,'qg2e3j7gb1gvj4dbm9t7if919iv22zc',NULL,NULL),(49,12,49,'',4,'Admin','20170126181036',0,0,351,0,'tkcgmjhbevu8cm329hkbs6rzf8fbugo',NULL,NULL),(50,13,50,'',4,'Admin','20170126181036',0,0,812,0,'1ghvp8xbcln0uouy8jg9ne4aw58256x',NULL,NULL),(51,9,51,'',4,'Admin','20170126194236',0,0,27,28,'0ddeiff5zt9kh7owa9szkmr8mqwzve4',NULL,NULL),(52,4,52,'',4,'Admin','20170126210501',0,0,94,48,'pzj9qvlo4iyubaj5v97zzie9s0z8hr3',NULL,NULL),(53,4,53,'',4,'Admin','20170126215629',0,0,134,52,'j7lqd88yg42dne3jb8h44ccwtgwnwf7',NULL,NULL),(54,4,54,'',4,'Admin','20170126215648',0,0,145,53,'g5k7an0jvqqrjq9cxic5hl9heb4nx9g',NULL,NULL),(55,4,55,'',4,'Admin','20170126215843',0,0,169,54,'sdvyfdlt3byp51saj5mc6ycdf79uihm',NULL,NULL),(56,4,56,'',4,'Admin','20170126215857',0,0,170,55,'690xjlj74drrlvyeakirlcvcuag26dk',NULL,NULL),(57,3,57,'',4,'Admin','20170126221832',0,0,532,46,'4v63xvaxyhnv3axkpgibjja1raszask',NULL,NULL),(58,3,58,'',4,'Admin','20170126221853',0,0,524,57,'qu6q9tuznbujukep7an08187leg6wzw',NULL,NULL),(59,12,59,'',4,'Admin','20170126222106',0,0,474,49,'eq1z5bi5124jiy0hdt9rbbxmfgb95mo',NULL,NULL),(60,12,60,'',4,'Admin','20170126222122',0,0,596,59,'93vm33tzr6i96hdjkzld5unzi83iuq2',NULL,NULL),(61,12,61,'',4,'Admin','20170126222140',0,0,598,60,'n4u6qrt15n6w4ckuwc39g8c7z0rt6o5',NULL,NULL),(62,4,62,'',4,'Admin','20170126222624',0,0,170,56,'m39z89wftizv3x45ngm2apesvtaamkm',NULL,NULL),(63,4,63,'',4,'Admin','20170126222902',0,0,166,62,'duf6wndln6gy8zvgmbq2p9i8pv90u0z',NULL,NULL),(64,14,64,'Created page with \"<noinclude>__NOTOC__ This widget allows you to embed any web page on your wiki page using an iframe tag.  Created by [https://www.mediawikiwidgets.org/User:Sergey_Chernyshev S...\"',4,'Admin','20170126232844',0,0,1373,0,'7hz9u8cn6stv2nzbyw9pkotiu1nn01s',NULL,NULL),(65,4,65,'',4,'Admin','20170126233045',0,0,134,63,'j7lqd88yg42dne3jb8h44ccwtgwnwf7',NULL,NULL),(66,4,66,'',4,'Admin','20170126233701',0,0,75,65,'0bgzckt522e3pyyu9dsw7rlwavzp7qw',NULL,NULL),(67,4,67,'',4,'Admin','20170126235115',0,0,198,66,'4z7zme2va8ehzv8wjhxsl3ecl2yegtb',NULL,NULL),(68,4,68,'',4,'Admin','20170126235248',0,0,94,67,'shrz9ybm3scu2vc84nc4fyd5xbqyd2z',NULL,NULL),(69,4,69,'',4,'Admin','20170126235257',0,0,93,68,'52eveiw44kk0wpholil5mmd6j15v0ib',NULL,NULL),(70,14,70,'',4,'Admin','20170126235634',0,0,1352,64,'iub4wdkkdj1m4m02jeu205g6jt9el9z',NULL,NULL),(71,14,71,'',4,'Admin','20170127001141',0,0,1373,70,'7hz9u8cn6stv2nzbyw9pkotiu1nn01s',NULL,NULL),(72,4,72,'',4,'Admin','20170127001205',0,0,87,69,'dlzty1wx0up7sm8jr3nhk6lukuusanw',NULL,NULL),(73,4,73,'/* Hardware Group */',4,'Admin','20170127001215',0,0,87,72,'4w7lsg3dbm2lxvxj2az8ku1j612cf9h',NULL,NULL),(74,14,74,'Blanked the page',4,'Admin','20170127002301',0,0,0,71,'phoiac9h4m842xq45sp7s6u21eteeq1',NULL,NULL),(75,4,75,'',4,'Admin','20170127002317',0,0,94,73,'ccipusuqqsl6am9kpqwkgjwemnubvsf',NULL,NULL),(76,14,76,'',4,'Admin','20170127002423',0,0,1180,74,'oudzoq8gnqw9hvuj48w2v75fm1yr0xv',NULL,NULL),(77,14,77,'',4,'Admin','20170127002501',0,0,657,76,'bxg1z0116ui3ew8myb027hj9m3v3am6',NULL,NULL),(78,4,78,'/* Hardware Group */',4,'Admin','20170127002655',0,0,193,75,'70hfjtpi5kphtb0pttyxn1pj1ehsz7q',NULL,NULL),(79,14,79,'',4,'Admin','20170127003049',0,0,1373,77,'7hz9u8cn6stv2nzbyw9pkotiu1nn01s',NULL,NULL),(80,4,80,'',4,'Admin','20170130165228',0,0,95,78,'nnvu5750pzxi6pjluguyv6dwdjpc8s1',NULL,NULL),(81,4,81,'',4,'Admin','20170130165712',0,0,1424,80,'63ilfoy0up98jc5ajhjrg6ggrg07ct8',NULL,NULL),(82,4,82,'Replaced content with \"   == Software Group ==  === Contract === [[Sen]]<br>   == Hardware Group ==\"',4,'Admin','20170130171224',0,0,76,81,'as3n9wynakai575ywcfanhy34wkitnd',NULL,NULL),(83,4,83,'',4,'Admin','20170130190021',0,0,125,82,'1fhv4i10yiuc6yjpk2l0cpncusj3pjn',NULL,NULL),(84,4,84,'',4,'Admin','20170130190056',0,0,195,83,'bqbhb52x3mas57dmqvhrt7fmfn22rpd',NULL,NULL),(85,4,85,'',4,'Admin','20170130191155',0,0,173,84,'cfl75arlwv17yfgyqx3ck2sntmjshpw',NULL,NULL),(86,4,86,'',4,'Admin','20170130193938',0,0,179,85,'iehybem6h24oalifws24uteze7imclc',NULL,NULL),(87,4,87,'',4,'Admin','20170130193956',0,0,179,86,'bo22fyo2fk1h9xkzhltznh6jp3umagz',NULL,NULL),(88,4,88,'',4,'Admin','20170130194004',0,0,177,87,'cvougzpru0ji8a7lm8gtgt28om70kmw',NULL,NULL),(89,4,89,'',4,'Admin','20170130194019',0,0,175,88,'sravac20p080gw5xq03pp50pq1pa90x',NULL,NULL),(90,4,90,'',4,'Admin','20170130194029',0,0,175,89,'n4dlq9hs81urfxd9l197q1dqrz110k1',NULL,NULL),(91,4,91,'',4,'Admin','20170130194042',0,0,174,90,'b5n267s9abb7ygkg2mp1h67xxti9vi9',NULL,NULL),(92,4,92,'',4,'Admin','20170130194050',0,0,174,91,'puhzyywj7qvpambtbmxaj0ztx9pll91',NULL,NULL),(93,4,93,'/* Hardware Group */',4,'Admin','20170130194712',0,0,175,92,'s9kuntckdv9gqhy7cf9n3w9h1s4mc1o',NULL,NULL),(94,4,94,'/* Hardware Group */',4,'Admin','20170130195003',0,0,176,93,'brgrl3kx6awka3zpxmw1obqbjlljv3e',NULL,NULL),(95,4,95,'/* Hardware Group */',4,'Admin','20170130195230',0,0,236,94,'3bvy43chw7e729jmjk30aga250bukgj',NULL,NULL),(96,4,96,'/* Hardware Group */',4,'Admin','20170130200045',0,0,239,95,'hht1fkc4o7f8z6o56u82ja5v7a33b2d',NULL,NULL),(97,7,97,'',4,'Admin','20170131032316',0,0,107,21,'9hpj93w1zjmk69jvpu6bsp92hfdsqxk',NULL,NULL),(98,7,98,'',4,'Admin','20170131032344',0,0,81,97,'9kf4ypuxesi5nrc6wzs9ci77apx4cll',NULL,NULL),(99,4,99,'/* Hardware Group */',4,'Admin','20170131183559',0,0,324,96,'h69cqy3b9o2q1fmnpt8w69jzl34kmk1',NULL,NULL),(100,4,100,'/* Hardware Group */',4,'Admin','20170131183615',0,0,321,99,'dz2ug6u8tkowkyokfnb08wxkerj1l7h',NULL,NULL),(101,7,101,'',0,'0:0:0:0:0:0:0:1','20170131190542',0,0,326,98,'24maej7d4exf9mmcjxruhsk5a1xbrpi',NULL,NULL),(102,7,102,'',0,'0:0:0:0:0:0:0:1','20170131190618',0,0,327,101,'qdf1rowf9tg96ffemj9p88x8q6rp4sy',NULL,NULL),(103,15,103,'Created page with \"[http://192.168.1.61/addNewEmployee.php Add a New Employee] (Tip: You can click the middle button of the mouse to open this link in a New Page.)  {{#widget:Iframe |url=http://...\"',0,'0:0:0:0:0:0:0:1','20170131190721',0,0,244,0,'o48ym347n4hi2znlw5k585q44nmv3e0',NULL,NULL),(104,7,104,'',0,'0:0:0:0:0:0:0:1','20170131190827',0,0,74,102,'26vzga28v7dcuxni740fv2d6o0buwhm',NULL,NULL),(105,16,105,'Created page with \"{{#widget:Iframe |url=http://localhost/sortByDeviceID.php |width=100% |height=800 |border=0 }}\"',0,'0:0:0:0:0:0:0:1','20170131202410',0,0,94,0,'muypvxqc4j3pcq8p2vge8g0k9jgptw0',NULL,NULL),(106,7,106,'',0,'0:0:0:0:0:0:0:1','20170131202459',0,0,73,104,'jsbqfvokodpcnotq0e2tbyym7e0rzig',NULL,NULL),(107,17,107,'Created page with \"[[Categories:SortDevicesByDeviceID]]\"',0,'0:0:0:0:0:0:0:1','20170131215319',0,0,36,0,'t6w8m9ipfok8a98fko8khh3oddv8y3m',NULL,NULL),(108,17,108,'',0,'0:0:0:0:0:0:0:1','20170131215734',0,0,25,107,'6nq6jbhsrt0kp5w160br7fwslaq5yb7',NULL,NULL),(109,17,109,'',0,'0:0:0:0:0:0:0:1','20170131215750',0,0,25,108,'fv6z4dpy347sv9n7e6fm5r2l0kfpa18',NULL,NULL),(110,17,110,'',0,'0:0:0:0:0:0:0:1','20170131215803',0,0,25,109,'43hjzsmlm24qc0znfaq9939tq7imvjm',NULL,NULL),(111,17,111,'',0,'0:0:0:0:0:0:0:1','20170131215814',0,0,24,110,'ow7l5gld71y5cr0a2bw7wbj5bhw6t9l',NULL,NULL),(112,18,112,'Created page with \"[[category:SortDevices]]\"',0,'0:0:0:0:0:0:0:1','20170131215910',0,0,24,0,'ow7l5gld71y5cr0a2bw7wbj5bhw6t9l',NULL,NULL),(113,19,113,'Show Devices',0,'0:0:0:0:0:0:0:1','20170131215959',0,0,25,0,'flxg6sc06tvvpukd9jh1m4c649un0ai',NULL,NULL),(114,16,114,'Blanked the page',0,'0:0:0:0:0:0:0:1','20170131220141',0,0,0,105,'phoiac9h4m842xq45sp7s6u21eteeq1',NULL,NULL),(115,17,115,'',0,'0:0:0:0:0:0:0:1','20170131220159',0,0,122,111,'ddo6mdax6syi8c03r6gmyrh0nmy7y7r',NULL,NULL),(116,17,116,'',0,'0:0:0:0:0:0:0:1','20170131220212',0,0,122,115,'ob7swcjl91bcsb8o8itof6tw0un7utr',NULL,NULL),(117,17,117,'',0,'0:0:0:0:0:0:0:1','20170131220223',0,0,122,116,'omwneg87yv3b1f3882tbqi4vdxvb9fj',NULL,NULL),(118,17,118,'',0,'0:0:0:0:0:0:0:1','20170131220233',0,0,122,117,'dmw8ol5oc9y420jkbn5j80txv2u22wf',NULL,NULL),(119,17,119,'',0,'0:0:0:0:0:0:0:1','20170131220241',0,0,122,118,'36fdvmg5j5iwiqeg1pul96c4y85j02f',NULL,NULL),(120,17,120,'',0,'0:0:0:0:0:0:0:1','20170131220248',0,0,122,119,'sxqn214hh0ycp4xve0gwqk6xzvkj6lz',NULL,NULL),(121,7,121,'/* Sample Devices Tracking */',0,'0:0:0:0:0:0:0:1','20170131220352',0,0,172,106,'tgxsc9hd232hcg3vjnwtn09syhu2cea',NULL,NULL),(122,7,122,'',0,'0:0:0:0:0:0:0:1','20170131220422',0,0,73,121,'jsbqfvokodpcnotq0e2tbyym7e0rzig',NULL,NULL),(123,16,123,'',0,'0:0:0:0:0:0:0:1','20170131220437',0,0,93,114,'gzryqjagr38l2fjdee4zzo4dyjwiupj',NULL,NULL),(124,16,124,'/* SortDevicesByDeviceID */',0,'0:0:0:0:0:0:0:1','20170131220448',0,0,96,123,'987bfit6741f1vrfx51fk8aaoo3zqkl',NULL,NULL),(125,16,125,'',0,'0:0:0:0:0:0:0:1','20170131220502',0,0,106,124,'pu1ekvpdz6d23bvvawij6winf7mwjnz',NULL,NULL),(126,7,126,'',0,'0:0:0:0:0:0:0:1','20170131220533',0,0,57,122,'ajam90zsonreg32ek17jxdb34khez6c',NULL,NULL),(127,18,127,'',0,'0:0:0:0:0:0:0:1','20170131220745',0,0,125,112,'dpx94wd2apexq7i453zrvs82pomhr4v',NULL,NULL),(128,18,128,'',0,'0:0:0:0:0:0:0:1','20170131220944',0,0,97,127,'3rv4pyqqy8natl32fv30gp5gznesps6',NULL,NULL),(129,16,129,'',0,'0:0:0:0:0:0:0:1','20170131221023',0,0,94,125,'kfeb9q8dz7pjfn82rt6o2c8newm555p',NULL,NULL),(130,16,130,'',0,'0:0:0:0:0:0:0:1','20170131221429',0,0,236,129,'nu86hoqt0ji38i6p59smocidpv5lj6y',NULL,NULL),(131,6,131,'',4,'Admin','20170131222055',0,0,158,23,'rvhoor2bamkt1gheew5n8akigxllwmn',NULL,NULL),(132,6,132,'',4,'Admin','20170131222135',0,0,236,131,'s2flp0mp8lt2vquuagq8jtotn2uqybg',NULL,NULL),(133,6,133,'',4,'Admin','20170131222207',0,0,227,132,'5l6h8p6hgvvbwj8zg3pmkzuulrqdkjs',NULL,NULL),(134,6,134,'',4,'Admin','20170131222222',0,0,229,133,'9ukj8xf38bugpmhuz2p5nv1xqkt7e99',NULL,NULL),(135,16,135,'',4,'Admin','20170131224959',0,0,151,130,'ez7ygksqlee3q2qco0d9tqy1e96u0y7',NULL,NULL),(136,15,136,'',4,'Admin','20170131225357',0,0,98,103,'bezge1s1ppyuaraoiwnfb66sa5wxz8f',NULL,NULL),(137,16,137,'',4,'Admin','20170131225504',0,0,94,135,'kfeb9q8dz7pjfn82rt6o2c8newm555p',NULL,NULL),(138,15,138,'',4,'Admin','20170131230225',0,0,160,136,'p958fryvap0794flngdizesy55slg6c',NULL,NULL),(139,16,139,'',4,'Admin','20170131230413',0,0,300,137,'o2fu4pxn0pzp6cefy1az5wy4hmdpb8b',NULL,NULL),(140,16,140,'',4,'Admin','20170131230441',0,0,329,139,'igy86oje8xu9kcd1v5euj35samj7u31',NULL,NULL),(141,16,141,'',4,'Admin','20170131230634',0,0,307,140,'ou8817e5tjcnvhqhtm6p6v4tdzkb70o',NULL,NULL),(142,16,142,'',4,'Admin','20170131230659',0,0,328,141,'fno2uhtr6yiqv31p9icp230713gq7tj',NULL,NULL),(143,16,143,'',4,'Admin','20170131230726',0,0,319,142,'n02lsan24urwwa2pg3tp5ddpueruluu',NULL,NULL),(144,7,144,'',4,'Admin','20170201011300',0,0,90,126,'kgxnfkbggr3aww8ojclr3rrgjhszjpi',NULL,NULL),(145,16,145,'',4,'Admin','20170201011339',0,0,370,143,'nx5wh3n4jvajg13o3csjulsrqg93qad',NULL,NULL),(146,20,146,'Created page with \"{{#widget:Iframe |url=http://localhost/getProjectRepos.php |width=100% |height=670 |border=0 }}\"',4,'Admin','20170201011425',0,0,95,0,'0wi19crotf1ymm7vowerjgq2vvkwope',NULL,NULL),(147,6,147,'',4,'Admin','20170201021140',0,0,269,134,'sdz56ouem93ac07bwjc6qhw7gej9um4',NULL,NULL),(148,20,148,'',4,'Admin','20170201182450',0,0,530,146,'lyy8t8lw357w57zwihygb3e1xrwgwgk',NULL,NULL),(149,20,149,'',4,'Admin','20170201182509',0,0,188,148,'0q71lxtdbnsiijwv7rr39c6xyp77lrp',NULL,NULL),(150,20,150,'',4,'Admin','20170201182906',0,0,224,149,'np934ir2eoucv6jrg2lshtmqq4efues',NULL,NULL),(151,7,151,'',4,'Admin','20170201192422',0,0,127,144,'jeb5muzxxblwm3hz3uz0wq9z3dlbeed',NULL,NULL),(152,6,152,'',4,'Admin','20170201192457',0,0,311,147,'bvpn8imw4eyvhybgr1vv702m20xbmfz',NULL,NULL),(153,6,153,'',4,'Admin','20170201192508',0,0,317,152,'8lw12a3icju18e3xbw8m1sfa8xv3618',NULL,NULL),(154,21,154,'Created page with \"{{#widget:Iframe |url=http://localhost/getSourceCodeRepos.php |width=100% |height=670 |border=0 }}\"',4,'Admin','20170201200113',0,0,98,0,'eo3caa9b3yne390ygeig6pv90384kif',NULL,NULL),(155,21,155,'',4,'Admin','20170201201603',0,0,134,154,'nft7lvo0crfae8eilwjgmkeyfprj9e0',NULL,NULL),(156,21,156,'',4,'Admin','20170201201622',0,0,135,155,'dfit0nui921830y2g2xvbzc47f0t7dz',NULL,NULL),(157,7,157,'',4,'Admin','20170201204520',0,0,164,151,'sx58vrljtrh1d905renc4d7tqbd7t6m',NULL,NULL),(158,22,158,'Created page with \"{| class=\"wikitable sortable collapsible\" ! Name ! Description ! Instruction ! Tag |- | MediaWiki Image || reposR3 || To Be Determined |- |}\"',4,'Admin','20170201204646',0,0,140,0,'4cxm27aj8ndcppnv23s2xc1dj4zyc28',NULL,NULL),(159,22,159,'',4,'Admin','20170201204714',0,0,149,158,'gbsn2f236blhgqbqoqz0oebi3839zmn',NULL,NULL),(160,22,160,'',4,'Admin','20170201211654',0,0,163,159,'ljvucsv3qmqsmtojfgmlr89ybwplsh0',NULL,NULL),(161,22,161,'',4,'Admin','20170201211710',0,0,166,160,'fbkgq4ac9g97fpbg1j5agr3csx4hoew',NULL,NULL),(162,22,162,'',4,'Admin','20170201212744',0,0,390,161,'nb0qus2o5kvr3rpkmlv0gzj69jmsk08',NULL,NULL),(163,22,163,'',4,'Admin','20170201212928',0,0,440,162,'28heix98yjvg1ztyteqjxv7pmdwzz59',NULL,NULL),(164,6,164,'',4,'Admin','20170201213822',0,0,363,153,'ixesu19xetyrjeg1515tbswov8kmuu4',NULL,NULL),(165,22,165,'',4,'Admin','20170201213937',0,0,424,163,'f3b2wmdgzwqh5aymv4uklxkhu9suuc4',NULL,NULL);
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `si_page` int(10) unsigned NOT NULL,
  `si_title` varchar(255) NOT NULL DEFAULT '',
  `si_text` mediumtext NOT NULL,
  UNIQUE KEY `si_page` (`si_page`),
  FULLTEXT KEY `si_title` (`si_title`),
  FULLTEXT KEY `si_text` (`si_text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (2,'cats',' hello catu800 '),(3,'senu800',' file senu800u82ejpgu800 link senu800 thumb 200px right introduction senu800 senu800\'su800 optical flow bleu800 tracking module senu800 senu800\'su800 linkedin career career career senu800 senu800\'su800 career after hisu800 graduation ofu800 master life starts from huawei. ---- contract contract contract there isu800  nou800   paid break   atu800 allu800 . interests interests interests * hiking * jogging * swimming dreams dreams dreams balance between constrained andu800 unconstrained category employees '),(4,'employees',' software group software group software group contract contract contract senu800 hardware group hardware group hardware group addu800 au800 newu800 employee tipu800 youu800 canu800 click theu800 middle button ofu800 theu800 mouse tou800 open this link inu800 au800 newu800 page. #widget iframe urlu800 width 100u800 height 800u800 border 0u800 '),(5,'senli',' vipu800 ofu800 huawei software group senu800 '),(6,'sidebar',' * navigation ** huawei wiki huawei wiki ** team member team member ** sample devices tracking devices tracking ** project repositories project repos ** android source code repo source code repos ** hqu800 android released image released image ** recentchanges-urlu800 recentchanges ** randompage-urlu800 randompage ** helppage help * search * toolbox * languages '),(7,'huawei wiki',' team member sample devices tracking sample devices tracking sample devices tracking project repositories android source code repo android source code repo android source code repo hqu800 android released image '),(8,'mainpage',' huawei wiki '),(9,'employees',' #default_form employees '),(10,'huawei wiki',' h1bu800 employees theu800 sponsorship ofu800 h1bu800 visa inu800 theu800 uu800u82esu800. foru800 huawei employees. '),(11,'senu800u82ejpgu800',' senu800 portrait '),(12,'tabletesttemplate',' this isu800 theu800 \"tabletesttemplate\" template. itu800 should beu800 called inu800 theu800 following format tabletesttemplate user_name firstname edit theu800 page tou800 seeu800 theu800 template text. class \"wikitable\" user_name user_name - firstname firstname category employees '),(13,'employees',' this isu800 theu800 \"employees\" form. tou800 create au800 page with this form enter theu800 page name below; ifu800 au800 page with that name already exists youu800 will beu800 sent tou800 au800 form tou800 edit that page. #forminput form employees foru800 template tabletesttemplate class \"formtable\" user_name field user_name - firstname field firstname endu800 template  free text   standard input free text rows 10u800 standard input summary standard input minor edit standard input watch standard input save standard input preview standard input changes standard input cancel '),(14,'iframe',' __notoc__ this widget allows youu800 tou800 embed anyu800 webu800 page onu800 your wiki page using anu800 iframe tagu800. created byu800 sergey chernyshev using this widget using this widget using this widget foru800 information onu800 howu800 tou800 useu800 this widget seeu800 widget description page onu800 mediawikiwidgetsu82eorgu800 .   this widget shouldn\'tu800 beu800 used onu800 au800 publicly-editable wiki.   while theu800 urlu800 isu800 validated tou800 beu800 au800 valid urlu800 there isu800 nou800 wayu800 theu800 widget canu800 check theu800 contents ofu800 theu800 page that isu800 included. when enabling this widget youu800 allow anyu800 user that canu800 edit tou800 include anyu800 page including malicious pages containing trojans backdoors viruses etcu800 pages that brake outu800 ofu800 theu800 iframe andu800 pages that look like your site butu800 actually isu800 au800 copy used foru800 phishing. copy tou800 your site copy tou800 your site copy tou800 your site tou800 useu800 this widget onu800 your site just install mediawiki widgets extension andu800 copy theu800 fullurl fullpagename action edit full source code ofu800 this page tou800 your wiki asu800 page   fullpagename  . \" frameborder \" -- border validate intu800 default 0u800 -- \" width \" -- width escape html default 400u800 -- \" height \" -- height escape html default 300u800 -- \" '),(16,'sample devices tracking',' 1u800. click owner idu800 number tou800 edit owner information; 2u800. click device idu800 number tou800 edit device information; 3u800. click owner name tou800 sort devices byu800 \"owner\"; 4u800. click model tou800 sort devices byu800 \"model\"; 5u800. refresh current page whenever youu800 edit. #widget iframe urlu800 width 100u800 height 670u800 border 0u800 '),(17,'sortdevicesbydeviceid',' #widget iframe urlu800 width 100u800 height 670u800 border 0u800 category sortdevices '),(18,'sortdevicesbydevicemodel',' #widget iframe urlu800 width 100u800 height 670u800 border 0u800 '),(15,'team member',' tips click employee idu800 number tou800 edit employee information. #widget iframe urlu800 width 100u800 height 800u800 border 0u800 '),(19,'sortdevices',' sample devices management '),(20,'project repositories',' class \"wikitable sortable collapsible\" user name password repo address - repos reposr3 tou800 beu800 determined - #widget iframe urlu800 width 100u800 height 670u800 border 0u800 '),(21,'android source code repo',' tips please refresh after anu800 edit. #widget iframe urlu800 width 100u800 height 670u800 border 0u800 '),(22,'hqu800 android released image',' class \"wikitable sortable collapsible\" name description instruction tagu800 - mediawiki image reposr3 useu800 this wayu800 tou800 continue more text just easy like this tou800 beu800 determined 2017-2u800-01u800 - knock knock hello look atu800 meu800 2017-1u800-16u800 - rock good byeu800 #time yu800-mu800-du800 - ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_identifiers`
--

DROP TABLE IF EXISTS `site_identifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_identifiers` (
  `si_site` int(10) unsigned NOT NULL,
  `si_type` varbinary(32) NOT NULL,
  `si_key` varbinary(32) NOT NULL,
  UNIQUE KEY `site_ids_type` (`si_type`,`si_key`),
  KEY `site_ids_site` (`si_site`),
  KEY `site_ids_key` (`si_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_identifiers`
--

LOCK TABLES `site_identifiers` WRITE;
/*!40000 ALTER TABLE `site_identifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_identifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_stats`
--

DROP TABLE IF EXISTS `site_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_stats` (
  `ss_row_id` int(10) unsigned NOT NULL,
  `ss_total_edits` bigint(20) unsigned DEFAULT '0',
  `ss_good_articles` bigint(20) unsigned DEFAULT '0',
  `ss_total_pages` bigint(20) DEFAULT '-1',
  `ss_users` bigint(20) DEFAULT '-1',
  `ss_active_users` bigint(20) DEFAULT '-1',
  `ss_images` int(11) DEFAULT '0',
  UNIQUE KEY `ss_row_id` (`ss_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_stats`
--

LOCK TABLES `site_stats` WRITE;
/*!40000 ALTER TABLE `site_stats` DISABLE KEYS */;
INSERT INTO `site_stats` VALUES (1,164,3,21,3,-1,1);
/*!40000 ALTER TABLE `site_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `site_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_global_key` varbinary(32) NOT NULL,
  `site_type` varbinary(32) NOT NULL,
  `site_group` varbinary(32) NOT NULL,
  `site_source` varbinary(32) NOT NULL,
  `site_language` varbinary(32) NOT NULL,
  `site_protocol` varbinary(32) NOT NULL,
  `site_domain` varchar(255) NOT NULL,
  `site_data` blob NOT NULL,
  `site_forward` tinyint(1) NOT NULL,
  `site_config` blob NOT NULL,
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `sites_global_key` (`site_global_key`),
  KEY `sites_type` (`site_type`),
  KEY `sites_group` (`site_group`),
  KEY `sites_source` (`site_source`),
  KEY `sites_language` (`site_language`),
  KEY `sites_protocol` (`site_protocol`),
  KEY `sites_domain` (`site_domain`),
  KEY `sites_forward` (`site_forward`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_summary`
--

DROP TABLE IF EXISTS `tag_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_summary` (
  `ts_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts_rc_id` int(11) DEFAULT NULL,
  `ts_log_id` int(11) DEFAULT NULL,
  `ts_rev_id` int(11) DEFAULT NULL,
  `ts_tags` blob NOT NULL,
  PRIMARY KEY (`ts_id`),
  UNIQUE KEY `tag_summary_rc_id` (`ts_rc_id`),
  UNIQUE KEY `tag_summary_log_id` (`ts_log_id`),
  UNIQUE KEY `tag_summary_rev_id` (`ts_rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_summary`
--

LOCK TABLES `tag_summary` WRITE;
/*!40000 ALTER TABLE `tag_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatelinks`
--

DROP TABLE IF EXISTS `templatelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatelinks` (
  `tl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `tl_from_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  UNIQUE KEY `tl_from` (`tl_from`,`tl_namespace`,`tl_title`),
  KEY `tl_namespace` (`tl_namespace`,`tl_title`,`tl_from`),
  KEY `tl_backlinks_namespace` (`tl_from_namespace`,`tl_namespace`,`tl_title`,`tl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatelinks`
--

LOCK TABLES `templatelinks` WRITE;
/*!40000 ALTER TABLE `templatelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text` (
  `old_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_text` mediumblob NOT NULL,
  `old_flags` tinyblob NOT NULL,
  PRIMARY KEY (`old_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 MAX_ROWS=10000000 AVG_ROW_LENGTH=10240;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (1,'<strong>MediaWiki has been installed.</strong>\n\nConsult the [https://meta.wikimedia.org/wiki/Help:Contents User\'s Guide] for information on using the wiki software.\n\n== Getting started ==\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings Configuration settings list]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ MediaWiki FAQ]\n* [https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce MediaWiki release mailing list]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources Localise MediaWiki for your language]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Combating_spam Learn how to combat spam on your wiki]','utf-8'),(2,'Hello cat!','utf-8'),(3,'= Introduction =\n\n== Career ==\n\n=== Contract ===\n\n\n== Interests ==','utf-8'),(4,'= Introduction =\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n=== Contract ===\n\n== Interests ==','utf-8'),(5,'= Introduction =\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==','utf-8'),(6,'= Introduction =\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==','utf-8'),(7,'= Introduction =\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==','utf-8'),(8,'= Introduction =\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==','utf-8'),(9,'= Introduction =\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==','utf-8'),(10,'= Introduction =\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==','utf-8'),(11,'= Introduction =\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module] \\n\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==','utf-8'),(12,'= Introduction =\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module] [\\n]\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==','utf-8'),(13,'= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==','utf-8'),(14,'== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n\n== Hardware Group ==','utf-8'),(15,'= VIP of Huawei Software Group =\n[[Sen]]','utf-8'),(16,'\n* navigation\n** HuaweiWiki|huaweiwikipage-description\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(17,'\n* navigation\n** HuaweiWiki\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(18,'\n* navigation\n** HuaweiWiki | Huawei Wiki\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(19,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(20,'= Introduction =\n\n== [[Employees]] ==\n\n=== [[[Software Group]]] ===\n\n=== [[[Hardware Group]]] ===','utf-8'),(21,'= Introduction =\n\n== [[Employees]] ==\n\n=== [[Software Group]] ===\n\n=== [[Hardware Group]] ===','utf-8'),(22,'Huawei Wiki','utf-8'),(23,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(24,'= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n\n\n[[Category:Employees]]','utf-8'),(25,'= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n\n\n[[Category:[[Employees]]]]','utf-8'),(26,'= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n\n\nCategory:[[Employees]]','utf-8'),(27,'= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n\n\n[[Category:Employees]]','utf-8'),(28,'This page contains all the employees of Huawei.','utf-8'),(29,'== Employees ==\n\nThe information for Huawei Employees','utf-8'),(30,'== H1B Employees ==\n\nThe sponsorship of H1B visa in the U.S. for Huawei Employees.','utf-8'),(31,'= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(32,'Sen Portrait','utf-8'),(33,'= Introduction = [[File:Example.jpg]]\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(34,'= Introduction = \n[[File:Sen.jpg | thumb]]\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(35,'= Introduction = \n[[File:Sen.jpg|thumb]]\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(36,'= Introduction = \n[[File:Sen.jpg | thumb | 300px]]\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(37,'= Introduction = \n[[File:Sen.jpg | link=employees]]\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(38,'= Introduction = \n[[File:Sen.jpg | link=Sen]]\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(39,'= Introduction = \n[[File:Sen.jpg | link=Sen | thumb]]\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(40,'= Introduction = \n[[File:Sen.jpg | link=Sen | 200px]]\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(41,'= Introduction = \n[[File:Sen.jpg | link=Sen | 200px | right]]\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(42,'[[File:Sen.jpg | link=Sen | thumb | 200px | right]]\n\n= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(43,'[[File:Sen.jpg | link=Sen | thumb | 200px | right]]\n\n= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(44,'[[File:Sen.jpg | link=Sen | thumb | 200px | right]]\n\n= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n== Dreams ==\nBalance between constrained and unconstrained\n\n\n[[Category:Employees]]','utf-8'),(45,'[[File:Sen.jpg | link=Sen | thumb | 200px | right]]\n\n<br>\n= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n== Dreams ==\nBalance between constrained and unconstrained\n\n\n[[Category:Employees]]','utf-8'),(46,'[[File:Sen.jpg | link=Sen | thumb | 200px | right]]\n\n<br><br>\n= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n== Dreams ==\nBalance between constrained and unconstrained\n\n\n[[Category:Employees]]','utf-8'),(47,'== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n<include src=\"http://www.ietf.org/rfc/rfc1945\"  />\n\n== Hardware Group ==','utf-8'),(48,'== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==','utf-8'),(49,'<noinclude>\nThis is the \"TableTestTemplate\" template.\nIt should be called in the following format:\n<pre>\n{{TableTestTemplate\n|user_name=\n|FirstName=\n}}\n</pre>\nEdit the page to see the template text.\n</noinclude><includeonly>{| class=\"wikitable\"\n! user_name\n| {{{user_name|}}}\n|-\n! FirstName\n| {{{FirstName|}}}\n|}\n\n[[Category:Employees]]\n</includeonly>','utf-8'),(50,'<noinclude>\nThis is the \"Employees\" form.\nTo create a page with this form, enter the page name below;\nif a page with that name already exists, you will be sent to a form to edit that page.\n\n\n{{#forminput:form=Employees}}\n\n</noinclude><includeonly>\n<div id=\"wikiPreview\" style=\"display: none; padding-bottom: 25px; margin-bottom: 25px; border-bottom: 1px solid #AAAAAA;\"></div>\n{{{for template|TableTestTemplate}}}\n{| class=\"formtable\"\n! User_name: \n| {{{field|user_name}}}\n|-\n! FirstName: \n| {{{field|FirstName}}}\n|}\n{{{end template}}}\n\n\'\'\'Free text:\'\'\'\n\n{{{standard input|free text|rows=10}}}\n\n\n{{{standard input|summary}}}\n\n{{{standard input|minor edit}}} {{{standard input|watch}}}\n\n{{{standard input|save}}} {{{standard input|preview}}} {{{standard input|changes}}} {{{standard input|cancel}}}\n</includeonly>','utf-8'),(51,'{{#default_form:Employees}}','utf-8'),(52,'{{TableTestTemplate}}\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==','utf-8'),(53,'{{TableTestTemplate\n|user_name=liziyuanhaha\n|FirstName=Sen\n}}\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==','utf-8'),(54,'{{TableTestTemplate\n|user_name=liziyuanhaha\n|FirstName=Sen\n}}\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n\n<?php\n\n?>','utf-8'),(55,'{{TableTestTemplate\n|user_name=liziyuanhaha\n|FirstName=Sen\n}}\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n\n<?xml version=\"1.0\"?>\n<api>\n/api>','utf-8'),(56,'{{TableTestTemplate\n|user_name=liziyuanhaha\n|FirstName=Sen\n}}\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n\n<?xml version=\"1.0\"?>\n<api>\n</api>','utf-8'),(57,'[[include:File:Sen.jpg | link=Sen | thumb | 200px | right]]\n\n<br><br>\n= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n== Dreams ==\nBalance between constrained and unconstrained\n\n\n[[Category:Employees]]','utf-8'),(58,'[[File:Sen.jpg | link=Sen | thumb | 200px | right]]\n\n<br><br>\n= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n== Dreams ==\nBalance between constrained and unconstrained\n\n\n[[Category:Employees]]','utf-8'),(59,'<noinclude>\nThis is the \"TableTestTemplate\" template.\nIt should be called in the following format:\n<pre>\n{{TableTestTemplate\n|user_name=\n|FirstName=\n}}\n</pre>\nEdit the page to see the template text.\n</noinclude><includeonly>{| class=\"wikitable\"\n! user_name\n| {{{user_name|}}}\n|-\n! FirstName\n| {{{FirstName|}}}\n|}\n\n[[Category:Employees]]\n</includeonly>\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/5pdaB2cejZU\" frameborder=\"0\" allowfullscreen></iframe>','utf-8'),(60,'<noinclude>\nThis is the \"TableTestTemplate\" template.\nIt should be called in the following format:\n<pre>\n{{TableTestTemplate\n|user_name=\n|FirstName=\n}}\n</pre>\nEdit the page to see the template text.\n</noinclude><includeonly>{| class=\"wikitable\"\n! user_name\n| {{{user_name|}}}\n|-\n! FirstName\n| {{{FirstName|}}}\n|}\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/5pdaB2cejZU\" frameborder=\"0\" allowfullscreen></iframe>\n[[Category:Employees]]\n</includeonly>\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/5pdaB2cejZU\" frameborder=\"0\" allowfullscreen></iframe>','utf-8'),(61,'<noinclude>\nThis is the \"TableTestTemplate\" template.\nIt should be called in the following format:\n<pre>\n{{TableTestTemplate\n|user_name=\n|FirstName=\n}}\n</pre>\nEdit the page to see the template text.\n</noinclude><includeonly>{| class=\"wikitable\"\n! user_name\n| {{{user_name|}}}\n|-\n! FirstName\n| {{{FirstName|}}}\n|}\n[[Category:Employees]]\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/5pdaB2cejZU\" frameborder=\"0\" allowfullscreen></iframe>\n\n\n</includeonly>\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/5pdaB2cejZU\" frameborder=\"0\" allowfullscreen></iframe>','utf-8'),(62,'{{TableTestTemplate\n|user_name=liziyuanhaha\n|FirstName=Sen\n}}\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n\n{{#widget:YouTube|id=cBr3uAcGXkQ}}','utf-8'),(63,'{{TableTestTemplate\n|user_name=liziyuanhaha\n|FirstName=Sen\n}}\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n\n{{#ev:YouTube|id=cBr3uAcGXkQ}}','utf-8'),(64,'<noinclude>__NOTOC__\nThis widget allows you to embed any web page on your wiki page using an iframe tag.\n\nCreated by [https://www.mediawikiwidgets.org/User:Sergey_Chernyshev Sergey Chernyshev]\n\n== Using this widget ==\nFor information on how to use this widget, see [https://www.mediawikiwidgets.org/Iframe widget description page on MediaWikiWidgets.org].\n\n<big>\'\'\'<font color=\"red\">This widget shouldn\'t be used on a publicly-editable wiki.</font>\'\'\'</big>\n\nWhile the url is validated to be a valid url, there is no way the widget can check the contents of the page that is included. When enabling this widget, you allow any user that can edit to include any page, including malicious pages (containing trojans, backdoors, viruses etc), pages that brake out of the iframe and pages that look like your site, but actually is a copy used for phishing.\n\n== Copy to your site ==\nTo use this widget on your site, just install [https://www.mediawiki.org/wiki/Extension:Widgets MediaWiki Widgets extension] and copy the [{{fullurl:{{FULLPAGENAME}}|action=edit}} full source code] of this page to your wiki as page \'\'\'{{FULLPAGENAME}}\'\'\'.\n</noinclude><includeonly><iframe src=\"<!--{$url|validate:url}-->\" frameborder=\"<!--{$border|validate:int|default:0}-->\" width=\"<!--{$width|escape:html|default:400}-->\" height=\"<!--{$height|escape:html|default:300}-->\"></iframe></includeonly>','utf-8'),(65,'{{TableTestTemplate\n|user_name=liziyuanhaha\n|FirstName=Sen\n}}\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==','utf-8'),(66,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==','utf-8'),(67,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/uvetMOMpHsw\" frameborder=\"0\" allowfullscreen></iframe>','utf-8'),(68,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n[[#widget:Iframe]]','utf-8'),(69,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n[[widget:Iframe]]','utf-8'),(70,'This widget allows you to embed any web page on your wiki page using an iframe tag.\n\nCreated by [https://www.mediawikiwidgets.org/User:Sergey_Chernyshev Sergey Chernyshev]\n\n== Using this widget ==\nFor information on how to use this widget, see [https://www.mediawikiwidgets.org/Iframe widget description page on MediaWikiWidgets.org].\n\n<big>\'\'\'<font color=\"red\">This widget shouldn\'t be used on a publicly-editable wiki.</font>\'\'\'</big>\n\nWhile the url is validated to be a valid url, there is no way the widget can check the contents of the page that is included. When enabling this widget, you allow any user that can edit to include any page, including malicious pages (containing trojans, backdoors, viruses etc), pages that brake out of the iframe and pages that look like your site, but actually is a copy used for phishing.\n\n== Copy to your site ==\nTo use this widget on your site, just install [https://www.mediawiki.org/wiki/Extension:Widgets MediaWiki Widgets extension] and copy the [{{fullurl:{{FULLPAGENAME}}|action=edit}} full source code] of this page to your wiki as page \'\'\'{{FULLPAGENAME}}\'\'\'.\n</noinclude><includeonly><iframe src=\"<!--{$url|validate:url}-->\" frameborder=\"<!--{$border|validate:int|default:0}-->\" width=\"<!--{$width|escape:html|default:400}-->\" height=\"<!--{$height|escape:html|default:300}-->\"></iframe></includeonly>','utf-8'),(71,'<noinclude>__NOTOC__\nThis widget allows you to embed any web page on your wiki page using an iframe tag.\n\nCreated by [https://www.mediawikiwidgets.org/User:Sergey_Chernyshev Sergey Chernyshev]\n\n== Using this widget ==\nFor information on how to use this widget, see [https://www.mediawikiwidgets.org/Iframe widget description page on MediaWikiWidgets.org].\n\n<big>\'\'\'<font color=\"red\">This widget shouldn\'t be used on a publicly-editable wiki.</font>\'\'\'</big>\n\nWhile the url is validated to be a valid url, there is no way the widget can check the contents of the page that is included. When enabling this widget, you allow any user that can edit to include any page, including malicious pages (containing trojans, backdoors, viruses etc), pages that brake out of the iframe and pages that look like your site, but actually is a copy used for phishing.\n\n== Copy to your site ==\nTo use this widget on your site, just install [https://www.mediawiki.org/wiki/Extension:Widgets MediaWiki Widgets extension] and copy the [{{fullurl:{{FULLPAGENAME}}|action=edit}} full source code] of this page to your wiki as page \'\'\'{{FULLPAGENAME}}\'\'\'.\n</noinclude><includeonly><iframe src=\"<!--{$url|validate:url}-->\" frameborder=\"<!--{$border|validate:int|default:0}-->\" width=\"<!--{$width|escape:html|default:400}-->\" height=\"<!--{$height|escape:html|default:300}-->\"></iframe></includeonly>','utf-8'),(72,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n{{#widget}}','utf-8'),(73,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n{{#Widget}}','utf-8'),(74,'','utf-8'),(75,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n{{#Widget:IFrame}}','utf-8'),(76,'\n== Using this widget ==\nFor information on how to use this widget, see [https://www.mediawikiwidgets.org/Iframe widget description page on MediaWikiWidgets.org].\n\n<big>\'\'\'<font color=\"red\">This widget shouldn\'t be used on a publicly-editable wiki.</font>\'\'\'</big>\n\nWhile the url is validated to be a valid url, there is no way the widget can check the contents of the page that is included. When enabling this widget, you allow any user that can edit to include any page, including malicious pages (containing trojans, backdoors, viruses etc), pages that brake out of the iframe and pages that look like your site, but actually is a copy used for phishing.\n\n== Copy to your site ==\nTo use this widget on your site, just install [https://www.mediawiki.org/wiki/Extension:Widgets MediaWiki Widgets extension] and copy the [{{fullurl:{{FULLPAGENAME}}|action=edit}} full source code] of this page to your wiki as page \'\'\'{{FULLPAGENAME}}\'\'\'.\n</noinclude><includeonly><iframe src=\"<!--{$url|validate:url}-->\" frameborder=\"<!--{$border|validate:int|default:0}-->\" width=\"<!--{$width|escape:html|default:400}-->\" height=\"<!--{$height|escape:html|default:300}-->\"></iframe></includeonly>','utf-8'),(77,'\n== Using this widget ==\nFor information on how to use this widget, see [https://www.mediawikiwidgets.org/Iframe widget description page on MediaWikiWidgets.org].\n\n<big>\'\'\'<font color=\"red\">This widget shouldn\'t be used on a publicly-editable wiki.</font>\'\'\'</big>\n\nWhile the url is validated to be a valid url, there is no way the widget can check the contents of the page that is included. When enabling this widget, you allow any user that can edit to include any page, including malicious pages (containing trojans, backdoors, viruses etc), pages that brake out of the iframe and pages that look like your site, but actually is a copy used for phishing.','utf-8'),(78,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n{{#Widget:IFrame\n|url=http://docs.google.com/present/embed?id=dcn37mcz_22cmnwnwf8\n|width=410\n|height=342\n|border=0\n}}','utf-8'),(79,'<noinclude>__NOTOC__\nThis widget allows you to embed any web page on your wiki page using an iframe tag.\n\nCreated by [https://www.mediawikiwidgets.org/User:Sergey_Chernyshev Sergey Chernyshev]\n\n== Using this widget ==\nFor information on how to use this widget, see [https://www.mediawikiwidgets.org/Iframe widget description page on MediaWikiWidgets.org].\n\n<big>\'\'\'<font color=\"red\">This widget shouldn\'t be used on a publicly-editable wiki.</font>\'\'\'</big>\n\nWhile the url is validated to be a valid url, there is no way the widget can check the contents of the page that is included. When enabling this widget, you allow any user that can edit to include any page, including malicious pages (containing trojans, backdoors, viruses etc), pages that brake out of the iframe and pages that look like your site, but actually is a copy used for phishing.\n\n== Copy to your site ==\nTo use this widget on your site, just install [https://www.mediawiki.org/wiki/Extension:Widgets MediaWiki Widgets extension] and copy the [{{fullurl:{{FULLPAGENAME}}|action=edit}} full source code] of this page to your wiki as page \'\'\'{{FULLPAGENAME}}\'\'\'.\n</noinclude><includeonly><iframe src=\"<!--{$url|validate:url}-->\" frameborder=\"<!--{$border|validate:int|default:0}-->\" width=\"<!--{$width|escape:html|default:400}-->\" height=\"<!--{$height|escape:html|default:300}-->\"></iframe></includeonly>','utf-8'),(80,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n{{#Widget:IFrame\n}}','utf-8'),(81,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n<noinclude>__NOTOC__\nThis widget allows you to embed any web page on your wiki page using an iframe tag.\n\nCreated by [http://www.mediawikiwidgets.org/User:Sergey_Chernyshev Sergey Chernyshev]\n\n== Using this widget ==\nFor information on how to use this widget, see [http://www.mediawikiwidgets.org/Iframe widget description page on MediaWikiWidgets.org].\n\n<big>\'\'\'<font color=\"red\">This widget shouldn\'t be used on a publicly-editable wiki.</font>\'\'\'</big>\n\nWhile the url is validated to be a valid url, there is no way the widget can check the contents of the page that is included. When enabling this widget, you allow any user that can edit to include any page, including malicious pages (containing trojans, backdoors, viruses etc), pages that brake out of the iframe and pages that look like your site, but actually is a copy used for phishing.\n\n== Copy to your site ==\nTo use this widget on your site, just install [http://www.mediawiki.org/wiki/Extension:Widgets MediaWiki Widgets extension] and copy [{{fullurl:{{FULLPAGENAME}}|action=edit}} full source code] of this page to your wiki as \'\'\'{{FULLPAGENAME}}\'\'\' article.\n</noinclude><includeonly><iframe src=\"<!--{$url|validate:url}-->\" frameborder=\"<!--{$border|validate:int|default:0}-->\" width=\"<!--{$width|escape:html|default:400}-->\" height=\" <!--{$height|escape:html|default:300}-->\"></iframe></includeonly>','utf-8'),(82,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==','utf-8'),(83,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=https://www.google.com/\n}}','utf-8'),(84,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=https://docs.google.com/present/embed?id=dcn37mcz_22cmnwnwf8\n|width=410\n|height=342\n|border=0\n}}','utf-8'),(85,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=http://192.168.1.61/getstudentinfo.php\n|width=410\n|height=342\n|border=0\n}}','utf-8'),(86,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=http://192.168.1.61/getstudentinfo.php\n|width=\"100%\"\n|height=\"auto\"\n|border=0\n}}','utf-8'),(87,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=http://192.168.1.61/getstudentinfo.php\n|width=\'100%\'\n|height=\"auto\"\n|border=0\n}}','utf-8'),(88,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=http://192.168.1.61/getstudentinfo.php\n|width=100%\n|height=\"auto\"\n|border=0\n}}','utf-8'),(89,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=http://192.168.1.61/getstudentinfo.php\n|width=100%\n|height=auto\n|border=0\n}}','utf-8'),(90,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=http://192.168.1.61/getstudentinfo.php\n|width=100%\n|height=100%\n|border=0\n}}','utf-8'),(91,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=http://192.168.1.61/getstudentinfo.php\n|width=100%\n|height=100\n|border=0\n}}','utf-8'),(92,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=http://192.168.1.61/getstudentinfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(93,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getstudentinfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(94,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(95,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n[http://192.168.1.61/addEmployee.php Add New Employee Info]\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(96,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n[http://192.168.1.61/addNewEmployee.php Add New Employee Info]\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(97,'= Introduction =\n\n== [[Team Member]] ==\n\n=== [[Sample Devices Tracking]] ===\n\n\n\n\n\n\n\n\n\n\n\n== [[Employees]] ==','utf-8'),(98,'= [[Team Member]] =\n\n= [[Sample Devices Tracking]] =\n\n\n\n\n\n\n\n\n\n\n\n= [[Employees]] =','utf-8'),(99,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n[http://192.168.1.61/addNewEmployee.php Add New Employee Info]\n(Tip: You can click the middle button of the mouse to open this link in a New Page.)\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(100,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n[http://192.168.1.61/addNewEmployee.php Add a New Employee]\n(Tip: You can click the middle button of the mouse to open this link in a New Page.)\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(101,'= [[Team Member]] =\n[http://192.168.1.61/addNewEmployee.php Add a New Employee]\n(Tip: You can click the middle button of the mouse to open this link in a New Page.)\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}\n\n= [[Sample Devices Tracking]] =\n\n\n\n\n\n\n\n\n\n\n\n= [[Employees]] =','utf-8'),(102,'= [[Team Member]] =\n[http://192.168.1.61/addNewEmployee.php Add a New Employee]\n(Tip: You can click the middle button of the mouse to open this link in a New Page.)\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=auto\n|border=0\n}}\n\n= [[Sample Devices Tracking]] =\n\n\n\n\n\n\n\n\n\n\n\n= [[Employees]] =','utf-8'),(103,'[http://192.168.1.61/addNewEmployee.php Add a New Employee]\n(Tip: You can click the middle button of the mouse to open this link in a New Page.)\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(104,'= [[Team Member]] =\n\n\n= [[Sample Devices Tracking]] =\n\n\n\n= [[Employees]] =','utf-8'),(105,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(106,'= [[Team Member]] =\n\n\n= [[Sample Devices Tracking]] =\n\n\n= [[Employees]] =','utf-8'),(107,'[[Categories:SortDevicesByDeviceID]]','utf-8'),(108,'[[Categoriy:SortDevices]]','utf-8'),(109,'[[Categoriy:sortDevices]]','utf-8'),(110,'[[categoriy:SortDevices]]','utf-8'),(111,'[[category:SortDevices]]','utf-8'),(112,'[[category:SortDevices]]','utf-8'),(113,'Sample Devices Management','utf-8'),(114,'','utf-8'),(115,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=800\n|border=0\n}}\n\n\n\n[[category:SortDevices]]','utf-8'),(116,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=600\n|border=0\n}}\n\n\n\n[[category:SortDevices]]','utf-8'),(117,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=700\n|border=0\n}}\n\n\n\n[[category:SortDevices]]','utf-8'),(118,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=680\n|border=0\n}}\n\n\n\n[[category:SortDevices]]','utf-8'),(119,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=660\n|border=0\n}}\n\n\n\n[[category:SortDevices]]','utf-8'),(120,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}\n\n\n\n[[category:SortDevices]]','utf-8'),(121,'= [[Team Member]] =\n\n\n= [[Sample Devices Tracking]] =\n== [[SortDevicesByDeviceID]] ==\n== [[SortDevicesByDeviceModel]] ==\n== [[SortDevicesByOwnerName]] ==\n\n= [[Employees]] =','utf-8'),(122,'= [[Team Member]] =\n\n\n= [[Sample Devices Tracking]] =\n\n\n= [[Employees]] =','utf-8'),(123,'= [[SortDevicesByDeviceID]] =\n= [[SortDevicesByDeviceModel]] =\n= [[SortDevicesByOwnerName]] =','utf-8'),(124,'== [[SortDevicesByDeviceID]] ==\n\n= [[SortDevicesByDeviceModel]] =\n= [[SortDevicesByOwnerName]] =','utf-8'),(125,'=== [[SortDevicesByDeviceID]] ===\n\n=== [[SortDevicesByDeviceModel]] ===\n=== [[SortDevicesByOwnerName]] ===','utf-8'),(126,'== [[Team Member]] ==\n\n\n== [[Sample Devices Tracking]] ==','utf-8'),(127,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceModel.php\n|width=100%\n|height=670\n|border=0\n}}\n\n\n\n[[category:SortDevices]]','utf-8'),(128,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceModel.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(129,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(130,'[http://192.168.1.61/addNewDevice.php Add a New Device]\n(Tip: You can click the middle button of the mouse to open this link in a New Page.)\n\n{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(131,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** \n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(132,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** Team Member | Team Member\n** Sample Devices Tracking | Sample Devices Tracking\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(133,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** Team Member | Team Member\n** Sample Devices | Sample Devices Tracking\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(134,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** Team Member | Team Member\n** Sample Devices Tracking | Devices Tracking\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(135,'[http://192.168.1.61/addNewDevice.php Add a New Device]\n\n{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(136,'{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(137,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(138,'Tips: Click Employee ID Number to edit employee information.\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(139,'Tips: \n1. Click Owner ID Number to edit owner information;\n2. Click Device ID Number to edit device information;\n3. Click Owner Name to sort devices by \"Owner\";\n4. Click Model to sort devices by \"Model\".\n\n\n{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(140,'Tips: \n=== 1. Click Owner ID Number to edit owner information; ===\n=== 2. Click Device ID Number to edit device information;===\n=== 3. Click Owner Name to sort devices by \"Owner\";===\n=== 4. Click Model to sort devices by \"Model\".===\n\n\n{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(141,'Tips: \n<p>1. Click Owner ID Number to edit owner information;</p>\n2. Click Device ID Number to edit device information;\n3. Click Owner Name to sort devices by \"Owner\";\n4. Click Model to sort devices by \"Model\".\n\n\n{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(142,'Tips: \n<p>1. Click Owner ID Number to edit owner information;</p>\n<p>2. Click Device ID Number to edit device information;</p>\n<p>3. Click Owner Name to sort devices by \"Owner\";</p>\n<p>4. Click Model to sort devices by \"Model\".</p>\n\n\n{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(143,'<p>1. Click Owner ID Number to edit owner information;</p>\n<p>2. Click Device ID Number to edit device information;</p>\n<p>3. Click Owner Name to sort devices by \"Owner\";</p>\n<p>4. Click Model to sort devices by \"Model\".</p>\n{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(144,'== [[Team Member]] ==\n\n\n== [[Sample Devices Tracking]] ==\n\n\n== [[Project Repositories]] ==','utf-8'),(145,'<p>1. Click Owner ID Number to edit owner information;</p>\n<p>2. Click Device ID Number to edit device information;</p>\n<p>3. Click Owner Name to sort devices by \"Owner\";</p>\n<p>4. Click Model to sort devices by \"Model\";</p>\n<p>5. Refresh current page whenever you edit.</p>\n\n{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(146,'{{#widget:Iframe\n|url=http://localhost/getProjectRepos.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(147,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** Team Member | Team Member\n** Sample Devices Tracking | Devices Tracking\n** Project Repositories | Project Repos\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(148,'title=Ew-nay Ample-say\nnamePattern={{{topic}}}\ninstructions=You can use this page to create a new article on a sample topic.\ntopic|Topic|text|Topic of the article.\npurpose|Purpose|select|Purpose of the\narticle|items=Business;Pleasure;Other\nintro|Introduction|textarea|An introductory paragraph about the topic.\ncolor|Color|radio|Color of the article|items=Red;Blue;Green\nconclusion|Conclusion|textarea|The conclusions of the topic.\n\n\n\n{{#widget:Iframe\n|url=http://localhost/getProjectRepos.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(149,'The topic is {{{topic}}}.\n\nThe purpose is {{{purpose}}}.\n\n== Introduction ==\n\n{{{intro}}}\n\n\n\n{{#widget:Iframe\n|url=http://localhost/getProjectRepos.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(150,'{| class=\"wikitable sortable collapsible\"\n! User Name\n! Password\n! Repo Address\n|-\n|repos || reposR3 || To Be Determined\n|-\n|}\n\n\n{{#widget:Iframe\n|url=http://localhost/getProjectRepos.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(151,'== [[Team Member]] ==\n\n\n== [[Sample Devices Tracking]] ==\n\n\n== [[Project Repositories]] ==\n\n\n== [[Android Source Code Repo]] ==','utf-8'),(152,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** Team Member | Team Member\n** Sample Devices Tracking | Devices Tracking\n** Project Repositories | Project Repos\n** Android Source Code Repo | Source Code\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(153,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** Team Member | Team Member\n** Sample Devices Tracking | Devices Tracking\n** Project Repositories | Project Repos\n** Android Source Code Repo | Source Code Repos\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(154,'{{#widget:Iframe\n|url=http://localhost/getSourceCodeRepos.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(155,'Tips: Please refresh after a edit.\n\n{{#widget:Iframe\n|url=http://localhost/getSourceCodeRepos.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(156,'Tips: Please refresh after an Edit.\n\n{{#widget:Iframe\n|url=http://localhost/getSourceCodeRepos.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(157,'== [[Team Member]] ==\n\n\n== [[Sample Devices Tracking]] ==\n\n\n== [[Project Repositories]] ==\n\n\n== [[Android Source Code Repo]] ==\n\n== [[HQ Android Released Image]] ==','utf-8'),(158,'{| class=\"wikitable sortable collapsible\"\n! Name\n! Description\n! Instruction\n! Tag\n|-\n| MediaWiki Image || reposR3 || To Be Determined\n|-\n|}','utf-8'),(159,'{| class=\"wikitable sortable collapsible\"\n! Name\n! Description\n! Instruction\n! Tag\n|-\n| MediaWiki Image || reposR3 || To Be Determined || Now()\n|-\n|}','utf-8'),(160,'{| class=\"wikitable sortable collapsible\"\n! Name            ! Description   ! Instruction  ! Tag\n|-\n| MediaWiki Image || reposR3 || To Be Determined || Now()\n|-\n|}','utf-8'),(161,'{| class=\"wikitable sortable collapsible\"\n! Name            \n! Description   \n! Instruction  \n! Tag\n|-\n| MediaWiki Image || reposR3 || To Be Determined || Now()\n|-\n|}','utf-8'),(162,'{| class=\"wikitable sortable collapsible\"\n! Name            \n! Description   \n! Instruction  \n! Tag\n|-\n| MediaWiki Image || reposR3                                   || To Be Determined || {{#time: Y-m-d }}\n|-\n|                 ||  Use this way to continue more text       ||                  ||\n|-\n|                 || Just easy like this                       ||                  ||\n|-\n|}','utf-8'),(163,'{| class=\"wikitable sortable collapsible\"\n! Name            \n! Description   \n! Instruction  \n! Tag\n|-\n| MediaWiki Image || reposR3   <br> Use this way to continue more text   <br>  Just easy like this                   || To Be Determined || {{#time: Y-m-d }}\n|-\n|  Knock Knock     ||  Hello       ||     Look at me   ||{{#time: Y-m-d }}\n|-\n|  Rock            ||       Good Bye                 ||                  ||{{#time: Y-m-d }}\n|-\n|}','utf-8'),(164,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** Team Member | Team Member\n** Sample Devices Tracking | Devices Tracking\n** Project Repositories | Project Repos\n** Android Source Code Repo | Source Code Repos\n** HQ Android Released Image | Released Image\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(165,'{| class=\"wikitable sortable collapsible\"\n! Name            \n! Description   \n! Instruction  \n! Tag\n|-\n| MediaWiki Image || reposR3   <br> Use this way to continue more text   <br>  Just easy like this                   || To Be Determined || 2017-2-01\n|-\n|  Knock Knock     ||  Hello       ||     Look at me   ||2017-1-16\n|-\n|  Rock            ||       Good Bye                 ||                  ||{{#time: Y-m-d }}\n|-\n|}','utf-8');
/*!40000 ALTER TABLE `text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transcache`
--

DROP TABLE IF EXISTS `transcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transcache` (
  `tc_url` varbinary(255) NOT NULL,
  `tc_contents` text,
  `tc_time` binary(14) NOT NULL,
  UNIQUE KEY `tc_url_idx` (`tc_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transcache`
--

LOCK TABLES `transcache` WRITE;
/*!40000 ALTER TABLE `transcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `transcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updatelog`
--

DROP TABLE IF EXISTS `updatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updatelog` (
  `ul_key` varchar(255) NOT NULL,
  `ul_value` blob,
  PRIMARY KEY (`ul_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updatelog`
--

LOCK TABLES `updatelog` WRITE;
/*!40000 ALTER TABLE `updatelog` DISABLE KEYS */;
INSERT INTO `updatelog` VALUES ('filearchive-fa_major_mime-patch-fa_major_mime-chemical.sql',NULL),('image-img_major_mime-patch-img_major_mime-chemical.sql',NULL),('oldimage-oi_major_mime-patch-oi_major_mime-chemical.sql',NULL),('user_former_groups-ufg_group-patch-ufg_group-length-increase-255.sql',NULL),('user_groups-ug_group-patch-ug_group-length-increase-255.sql',NULL),('user_properties-up_property-patch-up_property.sql',NULL);
/*!40000 ALTER TABLE `updatelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploadstash`
--

DROP TABLE IF EXISTS `uploadstash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploadstash` (
  `us_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `us_user` int(10) unsigned NOT NULL,
  `us_key` varchar(255) NOT NULL,
  `us_orig_path` varchar(255) NOT NULL,
  `us_path` varchar(255) NOT NULL,
  `us_source_type` varchar(50) DEFAULT NULL,
  `us_timestamp` varbinary(14) NOT NULL,
  `us_status` varchar(50) NOT NULL,
  `us_chunk_inx` int(10) unsigned DEFAULT NULL,
  `us_props` blob,
  `us_size` int(10) unsigned NOT NULL,
  `us_sha1` varchar(31) NOT NULL,
  `us_mime` varchar(255) DEFAULT NULL,
  `us_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `us_image_width` int(10) unsigned DEFAULT NULL,
  `us_image_height` int(10) unsigned DEFAULT NULL,
  `us_image_bits` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`us_id`),
  UNIQUE KEY `us_key` (`us_key`),
  KEY `us_user` (`us_user`),
  KEY `us_timestamp` (`us_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploadstash`
--

LOCK TABLES `uploadstash` WRITE;
/*!40000 ALTER TABLE `uploadstash` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploadstash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_newpass_time` binary(14) DEFAULT NULL,
  `user_email` tinytext NOT NULL,
  `user_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_email_authenticated` binary(14) DEFAULT NULL,
  `user_email_token` binary(32) DEFAULT NULL,
  `user_email_token_expires` binary(14) DEFAULT NULL,
  `user_registration` binary(14) DEFAULT NULL,
  `user_editcount` int(11) DEFAULT NULL,
  `user_password_expires` varbinary(14) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `FirstName` text,
  `LastName` text,
  `EmployeeID` text,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `user_email_token` (`user_email_token`),
  KEY `user_email` (`user_email`(50))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'SenLi','',':pbkdf2:sha512:30000:64:yIIKgTONyrYpuQ4HiqXNZg==:k07TmqPlLJgLQQIhY/XUvzqEnnN8Hz9s+1LbRDMOIH2W7GA1iOopXsQIN7at0OIuPClDeidfmRaXLQ9GVo98TQ==',':pbkdf2:sha512:30000:64:vmGIdVG9jlw6avFEXqArpA==:xfMVWXYRvGse29lk74gxjWFkVsuIcVcYJ16oNzIC6PLaErJBhLljgAXHLVI4eopz/Q4qi+DJpPKv26UXvzk4pQ==','20170124232831','liziyuanhaha@gmail.com','20170124225632','cc7d5a7d9011dc47adabd0d85d555f7c',NULL,NULL,NULL,'20170122203959',16,'','1990-02-20','Sen','Li','wx445227'),(2,'Liziyuanhaha','',':pbkdf2:sha512:30000:64:IQ203NbxQzZbH69MM26e3A==:7eeZdm+SiEw3umBN+KVIEGevx5kGBGP8kKX1lNpfoaIZfLZinLSFHUyq90OLzWRLj0lJcEPpATtR51gBbz4CHQ==','',NULL,'liziyuanhaha@gmail.com','20170124233759','e991c0afb2355890bcb3f6d9539d7dc7',NULL,'39e0e89e6d3bdacb694322db0686e6d5','20170131233752','20170124233751',0,NULL,'0000-00-00','Jeff','aa','aaa'),(4,'Admin','',':pbkdf2:sha512:30000:64:CTdMOLM+pu7AK2uA0dUY3A==:jZrivMxcNqKDX3wcwl6YVQDi9b09u8NogNifO7F+p9pgI7hbPerOWW4NkOYGTT7z3krD6jkTVtTnyFmCqY12UA==','',NULL,'Sen.Li@huawei.com','20170125025403','3436f82381e8b3a93d7e7c143239509a',NULL,'e44fcf85d7e68012c744fd8f0250ccb0','20170201025356','20170125025355',103,NULL,'0000-00-00','Charles','Zeng','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_former_groups`
--

DROP TABLE IF EXISTS `user_former_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_former_groups` (
  `ufg_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ufg_group` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `ufg_user_group` (`ufg_user`,`ufg_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_former_groups`
--

LOCK TABLES `user_former_groups` WRITE;
/*!40000 ALTER TABLE `user_former_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_former_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `ug_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ug_group` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `ug_user_group` (`ug_user`,`ug_group`),
  KEY `ug_group` (`ug_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,'bureaucrat'),(1,'sysop'),(2,'bureaucrat'),(2,'sysop'),(4,'bureaucrat'),(4,'sysop');
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_newtalk`
--

DROP TABLE IF EXISTS `user_newtalk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_newtalk` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_ip` varbinary(40) NOT NULL DEFAULT '',
  `user_last_timestamp` varbinary(14) DEFAULT NULL,
  KEY `un_user_id` (`user_id`),
  KEY `un_user_ip` (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_newtalk`
--

LOCK TABLES `user_newtalk` WRITE;
/*!40000 ALTER TABLE `user_newtalk` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_newtalk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_properties`
--

DROP TABLE IF EXISTS `user_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_properties` (
  `up_user` int(11) NOT NULL,
  `up_property` varbinary(255) NOT NULL,
  `up_value` blob,
  UNIQUE KEY `user_properties_user_property` (`up_user`,`up_property`),
  KEY `user_properties_property` (`up_property`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_properties`
--

LOCK TABLES `user_properties` WRITE;
/*!40000 ALTER TABLE `user_properties` DISABLE KEYS */;
INSERT INTO `user_properties` VALUES (1,'nickname','Give me Full-Time, Give you Full-Power');
/*!40000 ALTER TABLE `user_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valid_tag`
--

DROP TABLE IF EXISTS `valid_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valid_tag` (
  `vt_tag` varchar(255) NOT NULL,
  PRIMARY KEY (`vt_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valid_tag`
--

LOCK TABLES `valid_tag` WRITE;
/*!40000 ALTER TABLE `valid_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `valid_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchlist` (
  `wl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wl_user` int(10) unsigned NOT NULL,
  `wl_namespace` int(11) NOT NULL DEFAULT '0',
  `wl_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `wl_notificationtimestamp` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`wl_id`),
  UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  KEY `namespace_title` (`wl_namespace`,`wl_title`),
  KEY `wl_user_notificationtimestamp` (`wl_user`,`wl_notificationtimestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
INSERT INTO `watchlist` VALUES (1,1,2,'SenLi',NULL),(2,1,3,'SenLi',NULL),(3,2,2,'Liziyuanhaha','20170124233751'),(4,2,3,'Liziyuanhaha',NULL),(5,3,2,'Liziyuanhaha',NULL),(6,3,3,'Liziyuanhaha',NULL),(7,1,8,'Sidebar','20170131222055'),(8,1,9,'Sidebar',NULL),(9,1,0,'Huawei_Wiki','20170131032316'),(10,1,1,'Huawei_Wiki',NULL),(11,1,8,'Mainpage',NULL),(12,1,9,'Mainpage',NULL),(13,1,0,'Sen','20170125031740'),(14,1,1,'Sen',NULL),(15,1,14,'Employees','20170126194236'),(16,1,15,'Employees',NULL),(17,4,2,'Admin','20170125025457'),(18,4,3,'Admin',NULL),(19,4,0,'Sen',NULL),(20,4,1,'Sen',NULL),(21,4,6,'Sen.jpg',NULL),(22,4,7,'Sen.jpg',NULL),(23,4,0,'Employees',NULL),(24,4,1,'Employees',NULL),(25,4,10,'TableTestTemplate',NULL),(26,4,11,'TableTestTemplate',NULL),(27,4,274,'Iframe',NULL),(28,4,275,'Iframe',NULL),(29,4,0,'Huawei_Wiki',NULL),(30,4,1,'Huawei_Wiki',NULL),(31,4,8,'Sidebar',NULL),(32,4,9,'Sidebar',NULL),(33,4,0,'Sample_Devices_Tracking',NULL),(34,4,1,'Sample_Devices_Tracking',NULL),(35,4,0,'Team_Member',NULL),(36,4,1,'Team_Member',NULL),(37,4,0,'Project_Repositories',NULL),(38,4,1,'Project_Repositories',NULL),(39,4,0,'Android_Source_Code_Repo',NULL),(40,4,1,'Android_Source_Code_Repo',NULL),(41,4,0,'HQ_Android_Released_Image',NULL),(42,4,1,'HQ_Android_Released_Image',NULL);
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-05 18:36:58
