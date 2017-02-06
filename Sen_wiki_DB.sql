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
INSERT INTO `objectcache` VALUES ('Sen_wiki_DB:MWSession:8fochfndl5f3jegbjkjqdj23nnje6ou7','ïQ±n√ ¸æ\0l∞1û™fhá§ëí™KÏ˜!«¡ª≠T˘ﬂ!I;tÈ∆ªÉª{áVô˙Úä+z“§÷·f©»áıËûW§6ä◊^ï⁄€œ$Ly¶•\ZÄq†y./h÷P\nç–fÿÅ(„=FoJ=`DÑ\"0òã\n„w—∂\'∞ò ÿvz>Mwªí\n÷1]	!))2ZPVt≤ië≥NízY.…úÙmõ‡ü÷ù}7ÄÓ¢V)≤F0˙ÕÙÊ∞CÔç=≠Ì\r^ßÌØÎ¨¯yæækoà9ñ∑íd˛⁄µJ‘øíö¶QÏZjg]ãO˚˝vQö>?G„–«4åKQ…*£yÚ>Ÿ„·eû\"I6¢Û∆OIxYæ','2017-02-01 22:46:43'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:0408bd1e827336c91abe8ad58a9e19e76b255048','+∂24±R22047042504165U≤\0','2017-02-22 01:43:55'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:05d4331fbd42215e56d49df6063fc15d3ef8cc71','+∂24±R22047042122512Q≤\0','2017-02-21 22:54:24'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:1179a9d962abaf9c9a7dbe1c6ca54a281e7e49e1','+∂24±R22047\0FÜ∆FFJ÷\0','2017-03-01 21:38:22'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:119b78401feec80ee7170226442ef1293193054f','+∂24±R22047042500655P≤\0','2017-02-22 00:35:51'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:12da487f0bb36a5a7179e24460a266593bed7c97','+∂24±R22047046424µ4µT≤\0','2017-02-28 21:59:59'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:135b03b804d2919f63ee3d1f020a45e2f62d7141','+∂24±R22047\0FÜ∆ñ∆ÊJ÷\0','2017-03-01 21:39:37'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:16dd0c455e760f6c6658766534973cac3b7ce8f2','+∂24±R22047042122052P≤\0','2017-02-21 22:05:20'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:1a6c46a8a3f0212d42a3555159a470bfb635cadd','+∂24±R220470423¥4126S≤\0','2017-02-23 19:42:36'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:234abbb8d1743c7865b2db92f8c1fe3ead206b7a','+∂24±R22047\0ÜÜ∆∆ñJ÷\0','2017-03-01 01:13:39'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:23fc69a9a7943845b9d1092f0ebe9d906438f710','+∂24±R220470464¥4072T≤\0','2017-02-28 19:07:21'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:2b429f0fc0a917ab1c0b95dd0ed10252578d7395','+∂24±R2204704642202±P≤\0','2017-02-28 22:02:48'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:341aefe8a360fb43384dd8446e614308e983011d','+∂24±R22047\0F&f&fJ÷\0','2017-03-01 20:46:46'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:35480bb6ad31d82788b982e364a6fdecbcc24f91','+∂24±R22047\0ÜFñfJ÷\0','2017-03-01 18:29:06'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:36d4a14e17acaf6a123382efb0e788ed10421b78','+∂24±R22047046426022U≤\0','2017-02-28 23:02:25'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:3c0bb7368b9881e01b86dd4613268d78862beb39','+∂24±R22047046424µ44T≤\0','2017-02-28 21:59:11'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:44229608879fc65677b8d592f5aaae0fd0c43611','+∂24±R22047042500516W≤\0','2017-02-22 00:54:37'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:46576c51ced8a42f5a854b1cc706cb1ab6a7ea23','+∂24±R220470464¥0634U≤\0','2017-02-28 18:36:15'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:4882224e9e4f4131b450c64bfd3645a327ea04fd','+∂24±R22047042504165U≤\0','2017-02-22 01:43:55'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:4acca7fc35ad3b47ecc3011fa4e89b502b6793cf','+∂24±R22047\0@dfd§d\r\0','2017-03-01 20:16:22'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:4cc3a5c71c85610d4448eb126b1373f0566a0c41','+∂24±R22047042504125R≤\0','2017-02-22 01:42:52'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:5003e16d4b52e48c386de155c91605475e7cd2e4','+∂24±R22047046422∞41U≤\0','2017-02-28 22:09:45'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:5554965aebc58ecf1f75f441070b7380e7c3bb12','+∂24±R22047042500576W≤\0','2017-02-22 00:57:37'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:57188bec890d83f7f4c186523ed0179affc55af8','+∂24±R220470464¥0634U≤\0','2017-02-28 18:36:15'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:5ac5e01b4980e5621025a49edc2cf8900fb65830','+∂24±R22047\0F&¶FJ÷\0','2017-03-01 20:45:20'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:7ed42d95b43765319b848231c8f8da30b38bae98','+∂24±R2204704642202±P≤\0','2017-02-28 22:02:48'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:88f7313a58c80cd522a7e31b506b886ae984e226','+∂24±R22047\0ÜFñfJ÷\0','2017-03-01 18:29:06'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:894cbe72f8d9589d7f015980e6010ea2b5317552','+∂24±R22047042322¥05V≤\0','2017-02-23 22:18:53'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:906140d54ed4d9061d5769dd24a78a86ce08c1f2','+∂24±R22047\0@dfd§d\r\0','2017-03-01 20:16:22'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:936265a819aa9fd36bfd6d955575dd8e43024125','+∂24±R2204704212≤Ãî¨','2017-02-21 22:20:16'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:948863d96085780f9090273630db8ceb2258e6ed','+∂24±R22047\0ÜÜ&FfJ÷\0','2017-03-01 01:14:26'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:98dbdf12190fdf160ca15500f2031d07bcc5e152','+∂24±R2204704270060±T≤\0','2017-02-24 00:30:49'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:9b395c485c1adc62d3e274ea228569d760627757','+∂24±R2204704642456¥T≤\0','2017-02-28 21:53:19'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:a30ce35bf32cb60724dfe75e5398985be0a184a8','+∂24±R22047\0FÜÜ∆J÷\0','2017-03-01 20:01:14'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:a91337fe1053757fa7ee9298f9b721a7776e5966','+∂24±R22047\0F&¶FJ÷\0','2017-03-01 20:45:20'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:abd874b6b03bd106c670628b6eac536663e85667','+∂24±R22047042506600T≤\0','2017-02-22 03:30:01'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:aca8cce46d4fd7fb454d689180d300cdea261296','+∂24±R22047042322241P≤\0','2017-02-23 22:21:40'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:b41fb2c6dbf6387644315eee1163a040f8eaa16e','+∂24±R22047042322¥05V≤\0','2017-02-23 22:18:53'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:b83f18bb7cc8c50fd322d1dd0c1f29e3c83d8b88','+∂24±R22047\0FÜ∆ñ∆ÊJ÷\0','2017-03-01 21:39:37'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:bad40e7f1868e43a506f86621f31a5251af264d7','+∂24±R22047\0ÜÜ∆∆ñJ÷\0','2017-03-01 01:13:39'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:c2ed8b92f9d3c97a9a3cc9e30005d5232659844e','+∂24±R22047\0FÜ∆FFJ÷\0','2017-03-01 21:38:22'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:c5a18bc6dc8ee05c8c45b0c07dc4d75bd29514da','+∂24±R22047042504∂46U≤\0','2017-02-22 01:39:36'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:c74b7bf1c3330597ed2831be0cd479c6a6f70250','+∂24±R22047042322241P≤\0','2017-02-23 22:21:40'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:c9308000b8216630965e2fce922d80b432336188','+∂24±R2204704270060±T≤\0','2017-02-24 00:30:49'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:ce1b99d07cc62402a199a1df16bb1f5870bd8e4b','+∂24±R22047046422∞41U≤\0','2017-02-28 22:09:45'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:d09da34c6e7924aefff5f26907c37036a9ceea93','+∂24±R220470421¥4462U≤\0','2017-02-21 19:13:25'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:d0ec6b94e0676151aaa7539be952998b227da929','+∂24±R220470423¥0406W≤\0','2017-02-23 18:10:37'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:d3037086ca38af3608fc8dbbe6bd128245cd1203','+∂24±R22047046426022U≤\0','2017-02-28 23:02:25'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:d6410eb2a1895e662f690a502f6dbd8618cbdafb','+∂24±R220470423¥4126S≤\0','2017-02-23 19:42:36'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:e20d3877bd6edfe9226ee195ff516da2d7637711','+∂24±R22047046424µ4µT≤\0','2017-02-28 21:59:59'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:e5501a54e15830c0e8a73e6d8f0fd344e029ec56','+∂24±R220470423¥0406S≤\0','2017-02-23 18:10:36'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:eae31eed812e13c59709bb2e0ba25d365792fb14','+∂24±R22047042504∂46U≤\0','2017-02-22 01:39:36'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:ebb5753b4c42e405db43b7e13d46134fe99f066e','+∂24±R22047046420214P≤\0','2017-02-28 20:24:10'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:f1fe28a2aae7f77ac95603670114291745e6827f','+∂24±R22047042326≤01Q≤\0','2017-02-23 23:28:45'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:f2e51c43c87229785453ab7155b371da8468b9a8','+∂24±R22047042506600T≤\0','2017-02-22 03:30:01'),('Sen_wiki_DB:jobqueue:refreshLinks:rootjob:90b38d763b6d80cfc4314d6161df5507b12fd0a7','+∂24±R2204704232221¥T≤\0','2017-02-23 22:24:19'),('Sen_wiki_DB:messages:en',']ëAoÇ@ÖÔ˝é&M`A–ıD-∂µ«up+ÏíÌ°ˆøwó6FΩÕ{Ôõ9Ã£dHæ[2\"÷ír—–¨IKL,ÈpÙŒ‹x±2û√é*£\\ﬂ”»√\0	z‚%Ì∏É¡ı:_+nÄ÷h	ıîØî	3Z7†g8q-⁄( \\î\Zº∑ΩVÚXáRhdÀ;©∏Œ∑∂·Bë+…sî…£bÄ¶2á>‘ÏΩ’ÛÒÀe%Ö\nh9ö◊˙+z·÷0¥¢c{*Jhè™:ﬂ8=BE.kÛ◊ø¸\"M∏á™1ÛŸ˙óY¶”Xõ$Y<%[=-¬’Ï5úEŸoQöÕìï5·kGóáY‹7¢;s∆.ÓòyéCªä°ÏÇ1ˆÒàŸÿ)Á+⁄ÆÁÈG_¥>Äm\'∞±ç±„˘ûkM~~','2038-01-19 03:14:07'),('Sen_wiki_DB:pcache:idhash:15-0!*!*!*!*!*!*','}Vmo‚Fæœ˛{ñ\"µUÄµ!Ñò$“ïêÜ*	(êÎ«”bO`ãﬂ¥ª&–”I˝	˝ç˝%ù]€ƒ6®F ¥3ÛÃÀ>3„©Á∏û=cBÇòf*ÕîÌı\\ÔªÙ.<;Z¿NŸCÈ\r\\«≥Ø”€O•GF!˜7d•a≤ ì;ÚúEKD%Æî\"ø%\"bä\'q€∫Ó§∑àqÕﬂãÄH·ﬂÿk•RØ”qÆ‹∂”¥ùvﬂÈ¨@ïÿ¥oßÎ‘&∆fôà\0ƒçMmÚŒµæ±Jœl≤æZ´{@©}{›…‹\Zá÷ıÁVãXœ>õëêGùÄ4 \Z1\rQ<è∏‘π§¯„:›Àﬁ óÿ•\\Ï=2Ë˜(µÓˆ1ã∏O¸$V+èº±PÇ5öΩ\ZíI∂B$⁄¶¥O$†Z ≠`·ˇàgãH|ê2dÀ%WQúÄ^2Ì£ﬂ¡ıSW]AÇ)”ÌD™ˇ˛3`qÄ◊‡áÍI˛Ü–£ó^]:.YÓHk°Ô—´,¬‹\n≈¶ﬁV§\"U‚ùí\0Rµ∆Íuz‘\ZÔR¿”-ê‘∞âºe±ØoæœDgµZ∑Vq)Å0ôÅ˙\05Â /â¸tv…süÖ°<WEò?[àÉe<#¯Ë?îò«!-“Râba≈…úmA† 77˚Œ’öl`OÊ{Á˛ÌÓW/52èk&◊ûs—¢ü˘¯]HöT,JÑ1B˙1ß;∞àéBwè”√VzdÒ*C\n<Úx#Ì!Û®˜˝ ∞±¢fµJá¶`‹g*U’ç…Uewj’∞à<ÅnC}‘◊ûå]Q√Íπ[9ü…•é ¬ò´⁄<ºÁ!ÃÅ	=Mı\rWÂ:◊ÒNÅàYÿå‡¬§Ñ2]ÚSÖ¿6ùÉ!ç=\\ztXÿ<\0NàtBœ…oH˚⁄È∞`Ç|©‡Î∏üí °m~:˜OUU÷˝ê©}›Lã~ó£$~„´ØL4´ô“á$©&xÖÇ?òàyºjúy5´<∆QZà…¥|È9≈}G3ë§ Tç3⁄j1=,û5	∞ˆ@òÇπ%!\rÅùÆ„v©Î^î4“Ê„ò-CjﬁÚ≥ÈÙuR÷ŸEä}™ÓçOö≠∞õ%∏ˆ˜]z§¯≈◊sÇ#ˆ∏É#]Õ%3Óòbö\'Pıt1s£‘ËEÊ`çÕ‰œgJÀGm¨Üé\r…e≤˛Ô“∫⁄;ÚÍ§^øÆó¶≈‡÷£ÿ‰ÇÎìcç∏◊«Ø£ø˘T÷≠≥¸Ñ==Ëv\08ÈÛ1_Ly=ªk(Ω•òÊ≈≠£î≥µ‹\0G \'0öÖ8Lp≥j÷na›ÀSËÊõ£‹faútÔË\"çÎ«π≈»ÕÀ…üÃﬂ`ü∏zLñ˚êU€∞ÎiÃS3¨	∆ı€	ˆ√Û0/\\CÒâÌæ,’äcÛ∆`oÚ|?,¶¡kïÈ\ZC∑ÈW“Ã2C.|Ôi˜Ωjﬁ>ıΩzX6v	lÙJó\ZÿÈóß/≈.“ac’∫É·èˇ\0','2017-02-02 21:37:48'),('Sen_wiki_DB:pcache:idhash:16-0!*!*!!en!*!*','ÂXÔN„Føœyä=W\'µ’%Ò?Œ	ëz¿ïT »]?FãΩ¡[€ÚnRÑ‘GË3ˆI:≥kÉùt>›Ö$;„ô˘˝vf=„Sœ≤=„åfÇeßô.§·π∂w+ºœòOÿç4¬≥w]«3ÜÈh¬S·ë÷∞õéZ√˘ ìâ?\Z|Ix∞g¿É¯BØH$óÉ•–Ì\'±d±√.¸vA	å-\"¯Ò“ı[≤®m¯*\\üƒmPfl∂g¸du¶˚˜Øßß´òe”Ò¡Ùd1øÑo2ô≤ÄÀi¢÷y<K≤9≈Î;ŒG0 R\Zó‹ƒÍ\"cd\rª(ëMâ$å¨QﬁàÚF∆D{Éz# )y‰á]\nÔà>ªåœ.∞%˜Y\r¿@æ°˝4Bª@®˝’@‘˛^à—)ct™{xBÁ—â$+–âÈÂz⁄±m•\0üO\"tûFËT˜Ω!6Ùñc‰rM%6\Z`sÀÿ‹€Á$`—#∞îa= }\Zî[ÄR¶jÒ(â—Ÿ∆”UUóW`7ØÁ÷0t™¡ÃWÌê— ‚13T=7,Ω‘ƒÜ\Z9—$•Wlœ∏†Û4byæ\n2…®Õ„+É‰jhCßUw@PÚ\rº4.Ÿ’^CnÏ∆n≤”∞ÿVmCVúÚÒ‹‚˘ïﬁê˜yæÍ·ß£!üe»ù»¸=#î2ı∫›(Òi&Bv—ﬁ«µéb|–I√‘ Jˇ2…ñÌ¶AV<ê!T±iæ3H»¯U(˜å^ﬂÑ√≤´çèÚ^‰mªMZ\'luvF\">áƒÕX\nZ˚‘Y@$ü3èÿ¶’7-«≤”u--#Ï&ÂŸ⁄#ª=◊4[ÎòŒπO|›£xdF#¡Z˚g_î\r≤¿°GÃéiÓ\"aIà÷9£—‚3à%KÄ6ÄLñ\\p	≈¿xY†€ÏD|UuØ$›‘Ó˜¥Å»ˇ˛˘ –8Ä\"ı£Ë	˛7ƒ‡ö]€¸–∑vlÿ-…Dk¬`ﬂ¡\Z°Ÿ’b‡r≈MΩ#†ô	IîUÅy∞TÜf◊5[á7)É’%Él¬¶ëÃ±ŒÆ<<Ö•’nèZ˘Æ@Ç≈\"S¶å*æÙ.ëüﬂΩüã˜êëx/Û0iÅ‡ÒÅ~1âzY§M⁄2ë4*9π†KÜA˘jkW\\Ü‰ö≠…ãß+~ÕßΩT…<ÑTÑû’kõoÖø∑,∆OÇDbhBBôldåf∑\0ÄX@¡(∞I∂\\Ëòèi|µÄ8ÊÒµ0‘3Ω€;êY €TWI∆Ÿ¶`‹ß2… ˚olöÔõph¡´]˜–˚ÜWe#Á≥ºnó÷«AI“«hÊY{?Òà]0ö˘·iäª]ñ#Ó√…≤òFõÏ(x C˙ÎHÅöΩ–á1∏ÙÃA~ÕXçù$øC¢∞l]Y=Ç£uπS≤èq√!µà4\ZÀªÂZàú√âE1¶N*ÉÜVø3û r§ŒÉLÆ#∂)˙C¿L3„W_i∂I≥™éí§å¸˛§Y[∑±öV´Æòê[Ö¶h:ç˜¨Å\Z—Úﬂ‡ÃÉ[|\nuáA1¨5Ë~Úd €Om⁄2¥;Ï¶º1œ≤dÆßªJíÊ=êòñì∑\nOôd6L\"éæˆFc?Lî∑«kÿ_ÓêñÊtÅ„F\rQav\raˆ´÷€fl«k‹y\"gvsŒ\\80ûŸ.’±Â‘∞Âº\n[ñΩ[ó`ÕZQ$ÀyYp|{_U«ì[√ì˚:<Ì:õ<π=Ôπ-Í‡Æ∏_B ÂgŸ$πfx†]*é‘°ñ%)ÀdÂNàWMN˜è&üè¢>(æ £•„Ÿ“ÒpÈª~∫Ù}?^*éËiÛÊ∫Ëô´=∂Qúp∆Ù2bAÂË–kßß_∆E˚g√9ı¶¸˚\r6‘ÏÊ,Å∏◊h‹‚ácn)˛Ê„®≈ÇRS´~c\\ö Ÿuõ¶ÉÄcj\"ä\').›·„Ò-√ÿ´9ÁÄJ˙p»’Ñpå„ÍπöÉ\n]u±>‡ùdzFj˚†\r‘Âw\05a™ìﬁ¨™≠†7Æ’ÎUı“4üDq¥,Äcª	˝Ä©Óg÷cf±z˘˝p∫m†ﬂ€6‡8`t’sk>∂‚0Z±‚a‰„©≤bW≠√b1“n©±±…ƒ˝H™∆‹*˘’ÆÜ‡n]®G·bVp≠{I»MlÏ?L¸Kà\\Ÿ_≈-:œÏÌl˘—Ú»‡X[\Z)Û¿	ƒuŒñc®ûìÅ&nCÒ3Ω˘-†)*™g ∆ ∆\'ü˘‰Ú•\\\':ıÁ_Y&‘@¶≤ÀÍÙ:Ó}e´Á)ì<˜©lª–+\\¢a´W¨ûÁ√5Ü\r¨!Ôˇ','2017-02-01 23:04:41'),('Sen_wiki_DB:pcache:idhash:16-0!*!*!*!*!*!*','}VÎn‚F›ﬂ<≈¨•ï⁄*¿ÿ\\íò$“nH\Z™P €ü´¡˛¿”¯¶ô1óÆVÍ#Ù˚$˝fl\'∂°5°˘ÓgŒúÒÃµ◊ö3!AÃ2ïf r˚é˚]∫◊äñ∞W÷H∫6u˙ÆuïﬁÿrrÔïÃv12ìi≠üJ¯\\ëƒ¨Ûxùàà)ûƒ£´nz”¬Pß√ñ{p\"÷œ\rßÇ{ı∫SÅìâ(√$YàeÃ÷[Xø{J|OFÀ{ƒ†Cûa-@ƒÀÑÄXëîmÄÏàaã•If∫ÌîW|-t;Rx◊V†TÍvªa‚±0H§ÍÍz_˘»ìq\'\rRãˇU\"|◊µ»é˚*∏∂lJ?Y$\0æ	‘µ5<ß÷ÕU7OéÖLµèÌ6iMa7üìêGôÄ¥nôÄOè¿%µœ)˛P€Óı.sÅ} ≈¡%√>•≠Ò!f˜àóƒ\nGt…öÖZ∑ÛìÉdgv	ÌPzN$†õ/[œ¿¬ˇ1œ±ë ¨82Ÿr…v#∫X%”5Ü]úP?u◊\r+ÿë3}˜Fˇ˘ÎoúÄ≈>≤√3Ùì¸Ol°OªΩ<∑n¶ŸZBîÜòç0±…\"Ω}πc”ÔQ©à…*ëjHäTà^∑O[w˚pu∏˘˙dêu{öêe{¶ªVª}”*6e)0\rvfRΩ\'5pÂõD~˙t…3$F(œT—Êœ-ÃÉ0~\"¯Ë?îò«&m“Vâba•»ÇmAP6Âôù›qêW8êƒﬂv¸ïqScsπ0∏ˆ∞M?˛Ú˛!\ZH›öT,JÑ1Fzq\0Óª?h›ÖQ‘ÅËë≈õ)»„WiçòK›Ô?–f£Ìß⁄$ÇC”0â}Ó1ïà™Åjë·*ÑRiúûk-∞©\nùê°ı^yº—Ê°Æﬁ®jrxV◊ù ˙ƒØXŒu7ˆ_ıæ¿≈{¬òÇY™wªj◊sﬂÌàòÖÕf<¥i¯OÅÇGvÜ@÷hÂ“QÛ¿}8a“Mì_ë( µ’`˛πS…Ø˚F\rÀBhvõØ.<¡SUµıﬁmÍP”¶ﬂ‰mØ˘Ê+M4Û‚!I™^¢·w&b‹°∆j1WÂ;Tœ¬¥L^A€WÆ=*†öã$°j¸—QÀŸÌ√ÚÈQì\0ë∞Fo‰)X\\í≥Nf´Lã·w1[Ö‡◊™Âk≥ŸÀ§ƒŸAä}®ﬁá4sa?O\"9T ˜Ëë„gOk\Z¯GÏq.é|5óåFåôbÔû\'≤>j•6\ZR˙^Ë⁄FåÕ-êÎK€CoDC˜Ü‰2‚lN≠ªÌêW\'˝Üuø4-D\\À≤ô_8bƒ›!~m˝ÕzTLXè~”ıÒÙ8AØ◊HÄ™üK~°¯Z«kY˙eñBŸMßû•‘ŸÚ68Jr\"Gà7577D-⁄)¢˚˘˝£¿¸)osyú,okäçÌ«Àrãùõ˜ò?J%,∏zLñ˚êUèaœ>ÚX§‡eà	ˆı€	ûáÈ(Æ·¯ƒˆü}ñj«;Ûˆ`ç|w2ΩjRe∫Œ°èÈW“hô!ó›v˙og’ºâ,Í˝«YuJø≤§NlÀ’Á‚^“m#j˝¡Ë«ø','2017-02-02 01:13:39'),('Sen_wiki_DB:pcache:idhash:16-0!*!0!!*!*!*','≠W€n€FÕ≥æbM ERD/íÏP≤ãƒóZÖc	ñí>\Zkr%nÕvW∑˙	˝∆~Igñ§LJî]§¶ô⁄ôù9gvvf4t-€5FTH&ÜsïŒï·∂m˜ªt;ÆMÿJ=ÈZùN€5˙Ås⁄ó)çâR)OåhŸıC3Épˇƒ\'Bù≥˜ò¸ºŒ^Á∆iüí@∞Èâ—äòœÈí?è}∂:LÉ¥Uøâ(ÆB∂◊dÌrøEO˚-Dx⁄èñ.¯Ríyä\'1IÈç—(\r…7íâ†ﬁèg…’NkØÈ™A—h¸PHæ$> *Ÿægìﬁ\'yÖÿœYç\ró174b/ƒÁó,\nı{=öAFD˙ª`ËÛ·ƒ2\n$1[÷Gscàº√¿?Åhƒâ\"l≈•zøÉçˆ+ƒ◊Ÿoª6∫ç˛A≥I\Z7l9\ZëêG\\¡R∞–8£^¿|†1óÿ¶udZée€f«¥3êIπXª‰∏€6Õ∆˘:¶˜àóƒä≈ %S\ZJ÷8}’6»\\óòá¶i#ﬁ$ˆe„ñ—Ò∞àà»Dêó\\¢íºÃ—áe∂,S?U›⁄tGª˚§ùHıœ_\Z˚Ñ«^8=…ˇD-€¸xdulrøVL6&¢∆≥y‹ˆË]ÒY¿$2ïxj>KU\0—kµÕ∆≈*e∞∫`pñX,…tggõ£”T\ZÕÊÊP‡xc	¿¥©\'£:\\Ÿ!ëwo?DÚÉG√P~P9Ã˜\r∞a|K‡¡ìË«\"M“Tâ¢a……ò.Ú/@y˙dó\\‰Å≠…ò≈wxoÓŒ?ª©ñπ‹®\\´€4~>0‡˛ÜëI9∫ï/Z( ‡Á>±ÏNÉ ›†3D◊4ûÕ!Æ·ÜI£G]”˝˛2dg@jñŒ∂ÉÿÁUâ(Ll;x\'ãﬁc;Óﬁã‚.z/ºZÓwÓö‚`≥¡I}˚@≥ÆaÈóv≠VVKs≈c˝bª˚jUΩ>n‡Á\'Y¶eó÷~IrÑÅà teÌcXº‰!3*º`òbûïÂÚãïb\"¶·v»;:≤ √ÉØ;(„¨àΩ{¿ùÔπ‚>´!°õ‰WHQ&÷ï’+®‚»⁄í}ƒ\rÅõálm∂:ˆOUYÊ<…‘∫∫\rEø…≥$ûÚŸ7*∂£ôM+WIR&¯øSCrl≠ÊºÙ™S§…1¶	ÄVâ≤û7w≠ûû}ÚÔ‡ÃÖ™ˇÅÖÓYΩ2ûG˜L‰õ-#3®[Wy\rPMEÈTMÙª‹]9—1ÊX®íÈT2ï•úˆFc/Hƒ∏ëÿè~·éls∂k8€Ø¬ŸÈÏê~∂ˇÔgÆ¸.kßÜµÛ*¨èÏ÷œ {,J»ÃyﬁOíÜ…ØiÎ:0I Ñ™‘e‹5û]Mæ\\£\0R\0Ç¢úwá¢ËWõÑQòÖÌ1Ωô_Òñ≠\rá_E±Å–õÚ/è7ÿÿjîÑ‹[ó‹;Êé‚\'\'ÊóJ£˛—Ç∏≤3¡3´9àπTÛ{3•í0GúÌ„ÛX[u∑>ßä>Eß»5Œ\\∑∫õ∫:◊¨èòE À:}”mû•\rdàìÙ1öUµ%‘ŸZΩnU/MÛq\nÁ£Ç>VHk˝°_ÙSP¨nﬂLX5∫ªgÀ\0Ã_Ÿïœ^8RU¨(ÚK±´FäâßòÀ˛ãçÌ@lÊ*=´Uv€˘Óv∆†Ω≥1õÁä9NèqµÓ-3kÓhbÎ¯aj]\0Ú3»ÿá?äúß˜n≤\\Ü¥‹ñkGcú2o1\\∑l1Ä$ΩÈeÅ€R¸BWü|ö¢‚Öû„çûÔn.{yw¸Zæhoˆ7&§ÓÌ:π¨√Óa{sΩıoÇIûz{Æ∑]Ë.—∞’-VoÛaC‘ÏNÔÒ_','2017-02-01 22:05:02'),('Sen_wiki_DB:pcache:idhash:17-0!*!*!*!*!*!*','uVˇn‚Fæø˝{ñNj´÷∆Œ$ëÓH“P%r˝Û¥±\'xãiw!–S•>Bü±O“Ÿµ\r∂°F ¥3˚ÌÃ∑ﬂÃxÍ;Æoœòê ¶kïØïÌ{ÆˇC˙æù,`´ÏëÙﬁgﬂæÃØ/˘õ`	)Ç+;R*˜ª›8XeRue&‘◊›\rlx\0ìõÛ< mb¸_3Ç∏≤©Mﬁy®¢+€°ÙìM\"‡ÀH]Ÿ˝µØ/ª¯µuŸÕÒÁcßC¨\'xüÕHÃÆàÄ∞∆,à $ä\'‡ó:ÍÙ◊•Æ7,l∂9;ü˚•÷Õ.e	Hê•\nRÂì7K∞∆≥ÉA÷í-âûS: –-î÷3∞¯»<‹õgã»êò2Ÿp…Fîf!‡)k}FøãÍßÈ∫Ñ;r¶o‰Òﬂøˇ¡X\ZûÒ\Z˝$ˇCh◊•üŒÖK^w\n§µÄ$èç0±\\\'ò[ÈÿˆªGñA*bP%œRBÆ\"dØÎQÎvõÆnÄ‰F‰mùJ{ï·ôË¨NÁ⁄*/e!#3PPCWqI‰ßOgâ<CaƒÚLïa˛l!“¯â‡£ˇPbátHGeä≈µCÊlöÄ*®¿‹Ï;WY¡éÃ!˝˛ŒW¸˚ÕW?76üáìëÔ:Ù„/á—DÍ–§bIﬁå1\n–7à	ê8.µàéB´ﬁÒ∞X∫\\£x∫íˆà˘‘ˇÒ⁄¥ç1´e&8É£´FØœëÅ¢\n§Ü°æmè™-ì4‰Sô®cQ]j\\≈P’õ€D9ï6ˆuT≠hB…s}›≠≠O¬öe†cI0Ø∫˜Ôxs`\"à¶πVA›Æ˘∏›*)ã€\\ò‰–¶ØÂYX s0¬≤GØ>ï{Óy\'L:°ßÏWà]cıX8AM’u‹èY∏é°m±:œU›÷;ÿ‘ÆπMõ~ì„,}„ÀoL¥Ÿ,ö‰}ñ’ƒÓò¸ŒD ”ekµÃ´ÕÚm»UiZd+–ˆWﬂïTÕDñÉPZ9.¶„˚≈„√^T{ÈîÍÆD€π]¡‚ˆ€îΩ∆6N+÷¶”óI≈≥ã˚Pü	¥na;ÀbÏj«˜Ëë„ó@˜:è‘„è|µñLÔ∏aä<O†>Ë	lzKÂ;4ÂÜõÈPÙùNÄﬁ»Üé\r≈ez∫©\'⁄t{G]µ¸M:Ò∫_ûóÕ]∑kìéFéqøè_GãŒ=*3lÓﬁ˜˚˚È1@Ø◊¿iPåÇrË˛ﬁ@Ò*î≤„∑âRıﬂjJÅú¿h±ÔÚfr4vªÂnØH¡;⁄XLój™ò°rÚxGìPB¥ÆáË#£¸V∞`Öu∂◊Í±XÓbV/√ûs‰1œ!X#\'◊3l&XO£Ç∏ñ„#€~	YÆoÕ[Ö=\n˝…”›®Ï/u•k]¶ﬂ@H”Àå∏úÛ˛π∑ØUÛÜ≤(•˜?µÍV~’ë\ZÿÈW´œÂº“a#k.≤ˆ','2017-02-01 22:02:48'),('Sen_wiki_DB:pcache:idhash:17-0!*!0!*!*!*!*','çVÎn‚Fﬁﬂ~äâ•≠v´<Ü$Ïê§⁄%ICï»ˆÁjbü¿ﬂ43&–h•>Bü±O“3cõ√VurÊ‹ø˘Œ9åıô;ÊRÅÂ:ÀµÀ∫>{UÏòπÒV⁄Ì+÷ÛªÃ=À.Œ8ôKx>w€1ÑÇøàÖhã$Ñ’Q6œ~—BGp>‡\Zf©k6I•æÑ•@˝ƒ„¨œ-“‰-µ˝_BâdqN]D\\©s7Åón‹Ω~»áåœÄÑ)æ&©&∞Jt/Ç} gm~·úµ3¸:hµàs/„1âD,4ëê°¢3‡¡B#æGO=⁄°>=ÓyùBÜ2!◊åÙN∫ûÁ\\ÆãÄi¢!—å<ÛHÅ3?Z$Wò#ﬁëÁ˘D™Ö y\0˝áxåπ»ÛU©$K°Ñ∆åí4åíõ¥M=˚l´Œ …õ ›7ÂTÈ˛˙‡IHDD9™)Òß…†Ì{üNÈ±Oû÷\Zî3Ö8ã–·rñ«XŸÙnƒl ‡éNﬁ&	!”sìc◊sÆV‡ÈHf	EûÛƒﬁyïúgísZ≠ßºí©D7òòuıÊ‘ÇU\\˘˛0Váè\"u®À4?:ËA|O1/±%-““©ÊQ-»Ñ/¡‘_%ÿ{}zN∞&Hæ\"ª¸¬2+c\"ús5gÙ¥Â¸|`>ˆèMjJ#}t±B	Ê˛∞\0J=áò,LQÏü¯ñ\'≥	pã§Wnü3èΩ~GEY≈vh\nÜI(ê›©¨<”õ¶M™ıQµ∆¸/Î‚exiÑ\'&vì≤W¡º‚•∞€€hnﬂh}ﬂ+ÅØ\'·◊ŒáaMrj“é±–∫vØE‡2òè2Cã∫‹\0tµ“ 5:∂8†Ã‹”>Ù∞≥\'`ôÊˆü0Ô“ÊFÑ∞Gd\n∫OEFÅ\\oùﬁ\0áH≤öì˜]\ZÊ4≥-N\'ÅôÆÀ:o2Ωﬁ63¢ﬂ‘ Mû≈Ï+óM4ã|ì¶ı?°‡w.ëÃ\Zße]MîØpæñ¢i∫\0#b¥_B5ñiRoÕXMGÉõÈ›≠·\"·ˆ7,+È^±xõınÂÕØ˛A∏≠8çáŒ>≤Ò]}ﬂº3á’8çD∞ÆÖÔx;äü3˙ ¨±«≤ÿ‡™t˛§q9©y\Zï9`e~o«â!ôù2ó\\Û7ˆÑª5õ‚¡N°J∑g√!¯vã™†6¬díF÷Ÿ·n{“€V{A¬Ì’;Ÿ÷À≤r	ò±nãÙãûXS˘)F|U·∂ıf/Ï⁄wwÌ;ùÜ=nçbeî√,Ç-\'U\"Âf∞N¸m\'’úÆ∂…ˇÒ—Ña≥\rÏÜŸC∑®†ªcXl°j˚ÿÂ≥7<ıäg\\4.WÌ3 +`ÅÌ∑°.UÆ#^ÔŒ›—òd‰à	Êı\0À!RÙæ_\0◊Pº„´œ!œå‚ï˝Ì·ˆC6ºøÓóC‚±ﬁ\0∆áÈﬁØ ïqñZÙË‰®ªia˚;fZÔ-ÏWzUH„òûTßÂ^3i#jQ˚','2017-02-01 21:58:03'),('Sen_wiki_DB:pcache:idhash:18-0!*!*!*!*!*!*','uV·n‚8ﬁﬂy\no§JwßRúêR6i+ÌR∫Â‘TËﬁœïõLâèêD∂°p´ïÓÓÔInÏ$4	\\*PÂ˘¸yÊÀ7c&æ„˙ˆî		b≤V˘ZŸæÁ˙?§Ó€´9lïHˇ‚Aó˘ı%lDä éï ˝n7…BñƒôT]ô	ıew¬CArñ«πMÃñóLD Æljì7©¯ v(=±I|´+ªAÌÎÀn¡m]vs¸˙ÿÈÎﬁ¶SíWD@égXC∆≈W‡ó:‘È9ÆK?y^#∞Õπÿ˘d–˜(µnv)[ÒêÑY™ U>yeâk8}6d-ŸôË•ÁD¬\"i=K¬˝}xäπà,âUì\ró\\aF)Vçß¨ı˝.V®ü&t)v\0¶ÔhîÚﬂøˇ¡\nX\ZûÜ…\ZqíˇÖ)x¥ãU^8Á.yŸ)ê÷VyÇlÑâ≈zÖµï¿6ÓU©àaï<KIπäQΩÆG≠—6\\›\0…ç»Î:\rïFïÈôÏ¨NÁ⁄*_ \\ \rff®ﬁIç\\≈K\"øúúÆ‰)z#ëß™LÛWyP∆Çè˛áÛ8§C:*S,©2c–TIÖÊÕæqì%Ï»“Ôo|…øﬂ|ÒsÛy3˚Œ†C?˛ˆ˛G¥ê:5©ÿ*o∆Ë7àà8Ó¿\":m|«√.∏gÈbç∏ÁÈR⁄Û©ˇ„\'∆å\r±™E&8¥„4‚!Sô®®Ó)Æ®\ZÀE˛™U4çltèé˜ıÒ≠c\rI)h}›≠≠è£Z‰Bß≥¬ÍË.ﬁÚf¿DOr˝∫Îq]¯h´@§,igpnÍ√ò÷ˇò*ÿ≥30≤ÉüÂû;¡ëê.Ë1˚äN±k¨ﬁã∆hû\ZøŒÂY\'–Œ∂XùÖÇÁ™ÎΩ«‘ÆπMá~ó√,}ÂãoL¥’,‚]ñ’¸ÑÅ?òHy∫h≠ñuµUE\\ï°y∂Òù†îj*≤ÑjHÔöOÜwÛá{mT¬ˆÓ)m\\π≥Èfª¢≈Ì£îΩ$5N+÷&ìÁq•≥ã˚Püˇ¥ua;ÕÓj«˜Ës®á\ZDÓqXÌ%3$nòbÔ»#¨˜z‘?ô!Ra˙BrPcs\r¶\"\Z’–π°πÃ6-Eõ∞7ÙU◊∑À¬Î∏</ß∏ûÀ¶º9jƒ˝>~˝)FtPVÿ‹ΩÏGˆ”CÇ^ØEÄcøò˘Â»◊Éº¡‚U,Âh7,nì•\Z¥’up@rÑ£-ƒ~úõ+¢±€-w{E	ﬁ¡∆‚\Z©Æs{=ﬁ—\"î≠◊è∑Â3¢˝ñ≤pâ}∂˜Í°YnVo√ûsÄòÂÆQÃÎ	6cÏá«†Æ|`€œÀ5pd~>ÿA‰èoÉr\Z<◊ùÆ9tõ~!Õ,3ÊrŒ˙gﬁæWÕOëyiΩˇÈU∑¬UGjbß_≠>ïìNUs¡œˇ\0','2017-02-01 22:09:44'),('Sen_wiki_DB:pcache:idhash:19-0!*!*!*!*!*!*','çVÌn‚8ùﬂy\n“Hª´“∆·£≈©*ÕR:0j*tˆÁ»Mn¡KH\"€Pÿ—HÛ˚å˚${Ì$êfµTïêÔııπ«Á3f‘cç	ó\n‰x≠”µn∞∂«æ)÷aç’∂∫·+÷Ω§¨qùﬁL˘*çÄ‹¬F†»è˘VkÁ˙\"ΩqÆﬂ7õƒyÑ∑…ÑDb%4ëê&R;}, $Z¨Äœ•ó.mQèvzù^#∞MÖ‹1r’mªÆsªã˘J$Hbç’yÂëß?y∂5»Z·πå∏ÁÆKâLïÛ<˙è±»a´DíçPB#¢8	OYõ3ËuÌßö:á$Ø\'∑…â“ˇ¸¯‡qHDDkLS‚/É‡¬s{ó¥„ëóùÂÃ\0˘√ZÑÀ˘⁄ˆìº°ò/@ibã*ëƒ$ÑT/∆∂Î∂)‡ÍHjÔçºÆ„@õ¨úk¿9ÕÊçì_…LbfKäZ≤≤+\"ø|8[©≥ÄGë:”9Ã_¨É$~ ¯1_\\b?î4IS\'öG•C¶|¶ˇT`ÔıMËY¬éL!˛˙&ñ‚ÎÌÔ,µ1&¬WF{M˜˝oá?bx4–îFπ’‰bÉÃ˝a\"$î∂bPù“6äˆû«Û5\n‡^ƒK’9sŸ∑ÔC	Ø˙ÿ’<ëÍÅQäÄÎDñÆ°#(Ê¿√ïºƒéMë∂|Ïåò£kG⁄9ôÂuØ¥>\nKëKeÖ‡ÀŸW∏x\'\"òó¡búö´.«M”É≠Û®é†c{√ò·˛#8≠S∞Íi¯/ÃıÛ=C¬âêiË1˘Ñ*π´¨Åá#N©æ¡˝êÑÎÍh≥’i E™À±÷!¶w’m&ÙYıì¯UÃøpYg3ÛÆaíîÏa‡.cœk´y_uñ°–yhñ,¡ƒ_ıs™&2IAÍäxÃÆŸ∏?ú=‹ \rØú\\¬Ö2´Jneq˚ Ê/Ñï”≤µÒ¯yTÏ°ƒﬁï≠˙ùë-l\'I$Ç]È¯ñ{î¯10v·ëzº´£\\£%k∑\\ÛCÊâ™˜∆‰ü¨ÅπWÊÌ†»±}\02siòçll(.ÎÀ≈8ï”ﬁPW\'Û∫’º4Õ˝€8≤Ì_,Å	§/ˇœ‹Ÿœ;¨Óﬁ[˙Ò˛ˆÒ˛V´∂\r?s˚‹ÏçáWä@rS∑Eºjë¬bãá‡ˇ‘®”∞7r˚8ú§°ùu–>⁄ò= ≈√aﬂçì«S√A^¢v˘¯Jny≈∑¸ìKú≤ΩRè•rÒÚ∂ËQ∆4Ö`çú Æ\'ÿåp\Z˝å∏Z‚ﬂ~yjˆgC√ŸËÒŒœΩ‡π¨sS√Èê :ôï=Ôû∑˜ìjÇÃr·˝dRΩ\"Ø8“¶›bı)íldç∂¸Ôˇ','2017-02-01 21:59:59'),('Sen_wiki_DB:pcache:idhash:20-0!*!*!*!*!*!*','mVmo‚8ﬁœ¸\no§JwßRú@)Ñ∂“n_Æú⁄ÇÄÓ}\\ôxJº‰M∂)p´ìÓ\'‹oº_rc\'Å†jf∆èg?3f‰ªûÔåôT G+ù≠¥„w<ˇßÚ/}\'û¡F;Â˜ªÆÔ\\k6èÄSÍ∆Yã•»\r*ïÖ\'ç\"ñ)ÅÔŒm„ZKÛo…bìWC„∫Öﬂs„Q÷©‰U€≤î|·\\ÇRπr≈o%(ÇFû\'÷0iWM≥î|r\Zd,∞®e3≈óÏˆz.Iﬂƒªƒ‘àí¡çjù˘≠Vî,\nS•[–cô˛Ä@õ‹‘Ef±Êò;»á:d-∏oó“3áÑ °æq∫W‘¡]st≥sÜèœÕ&iº¬z<&ëàÖ∂˘K›∏cAúhÉO<Í^Q|∏Ω6Ì–‹G`ì	πıIØ€°¥qøMX,d<—êhüº≥HA„n¸f1»J±\"—J{DÜq’ò\0ãé‹˝ù{åπ»4@ÍSI>Ñ\Z3JRnŒueˆË∂∞BÛ9]@í”}4˘ﬂ?ˇb,·D$A¥¬8%˛¬:¥Â—˛ï{Èë˘VÉjÃ Œ\"D#L.V1÷V÷„ûêePöXT%“Ñp»tàÏµê≥áMh˝\0íYeì˜UhU§g≥k4õ∑ç‚Pfa03µµtÂáD~9;è’9*#RÁ∫HÛ◊‚ çg?ÊÖ˚qIì4u™YTŸd >¿P&ÿì]í%l…íÔ¶´æﬂı3ÎÛô\n}è6ÈÁﬂˆƒiRSö≈YM0÷)¡ú  8q/iÉò,L\'ªlÎgñ,V(Ågë,ï3`>ı˛ç>lÚ¯´Z§R@›1L∏òNe’AÕê:ÇrRxh):∆∂3 ®\0S~◊l]€“dVÌ^≈>‰œïI%∆‰´—=4>ä¶¿dé2s‘Uø)˙aÉ!aQ=ÉK[˙˜ß¡~ùÇUè3ò˚tP¨yN∏LAØÈÔ®ê€Î0>D·TMﬁ/)_EPœ6∑N)2]ıµ˜>Ω=\\f\\®ª4yãoL÷ŸÃß˚SöVÏ£„O&ë,j÷¢Æ:À\\Ë¬5Kó`¸sﬂT·…g ıÅxÃ™ŸËÓiˆÚlDÄL8Éùr\n	ó ‹+ŸÎ”ÆS¬‚Úáƒn~∞[nçﬁÜ%œJÏSı2˚ddõq\Zâ`[ŸæMèøf†?Rè◊;ä5Z≤‚ûi∂è<Å˙l∆¸ƒê2∂gnW9∂W@>\\öF#&7ó‹e;U√÷®´Z\\ﬂ)\nØ∆eY1¡ÕL∂µ‡ù.ê#·wÒﬂ5ˇ˘xÆﬁ\rıÎÈ1@ª]¿ëüœ˚b‹õ!~Ä“)Qä±nQºCîr»ñW¡»	å:ªQnØáÉ’^±∫ìó–9Zò_!Â’aoéì€ªÜÑ¢v¸xS~`Êw(øÂ,±œvZ=Àcƒ™mÿvè\"¶+‰Ûö¿«˚·uêW|aõ/úe&¡˛tp‹æ>äiVU∫¡0m˙\r§≤≥ÃäÀΩË^tvΩjÜÃ\nÈˆ™πuúÿ∆ï[\Z`∑[Z\'≈•d“F÷.ëµˇ','2017-02-02 18:30:40'),('Sen_wiki_DB:pcache:idhash:21-0!*!*!*!*!*!*','mVˇN„8ﬁøÛﬁHHw\'Jù–_§Ä¥W`È	hEÀﬁü+ìL_”ƒ≤hoµ“=¬=„=…çù§§iÉZ!œ¯õô/ﬂÃtx~‡NôT \'ππvÉé¸PA7p◊sÿhw®Ç˛E/p/≈ıúêiLë∞ê†b¬\Z$a)πç∏>s.€‚\Z]/˘B≤5%√+7÷ZÌvíÖ,â3•€K–≥,ó!å≤ûAdÍLƒ¬%ˆŒk&#êW.u…;èt|Âzîû∏$æåıï€ÎS˜˙≤]∏∂ùÀœ≠qû‡}:%	_sçÈâLjgƒ¬\"¢˘\Z‚SØOÒÀ˜¸ãÆWÿló€ÄzJùõm ÷<$añjHu@,Q‡å¶/É‰ä-âûQ⁄\'\n–-RŒ3∞‰¿<ÿôßòãÃBP*ì‰ç+Æ1£+«(πâ—kcÖÊŸw]B\ní8”o‰Úø˛≈\nX\ZûÜIé~äˇç)th€ß}ØÎì◊≠ÂÃa-D#L.Û5÷V:6˝ÓëePöXT≈≥îD tåÏµ;‘π›¿”7 ¬äÜ,Ú4‘∆´LœfÁ¥Z◊N˘RÊa03ıjÈ*^˘Â‰t≠NQâ:’eöø:àÉ4û|Ã?îÿ«#-““ôfI-»åΩÅ!†J*¥oˆùÎò¨`Kfê~Á+˛˝Ê˜@X[¿£ò©8Ω˝¸€«1Dö‘îfk—å5J0o‡Ò∫=áò,LìxÏòñ.sî¿OW ≤Ä?~¢ÕC€´ZfíC”0N#2ù…∫Åö˛„:Å™	}ƒˇíF2√¿EÛ”=ƒ¥è±˜L¯FXRZ?˜kÁ„®fÈõt÷X@›{Äáw<Å0∆a^w›n\nø›‡HY“Ã†kÎCõ·ˇ+ÿ≥3∞\nráØñwÓyGL¶†ßÏ+*‰vÔÙX4FÒ‘MﬁèYî\'–Ã∂8ùÖí]∑ùÿÙvˇö1˝°FY∫‡ÀoL6Ÿ,ÜÁ}ñ’º@√üL¶<]6NÀ∫ö,õZöÊŸ\nå˝5Ü%USô	êzO@Ê÷|2∫ü?> ÓpßûR∆ï:wj¶^œ˜›\nØﬂ¶Ï5Åh/Zq6ôºå+û}îÿß˙Æ¯d§õiñp[NøÑf®At†p‡k¥dáƒ\r”Ï√ÛÍÉıœvàTæ≥º<‰ÿÆÅb¿¥BÙF6Ln(.;ºmK—}∑w‘U√o‡ñÖ◊˝Ñ(ß∏ôÀ∂\\ô9‚A?û˘#zXV∏{7ÿè‹ßá\0ÁÁ\r\0˚≈Ã/Gæ‰{(ù\n•Ì≈ﬂG©mµ@é`4âÿçsª\"ˆn˚ÂÌNQBÁ‡b±F™ıa∑«—û!°Ñhº~‹ñoò˘Â∑˙ãÖ+Ï≥ùV≈ró∞zû{3aéú`^œ6∆~x\Zƒ5ŸÊKƒÑqºµ?‹aåüÓÜÂ4x©+›`ò6˝RŸYf≈ÂùıŒ:ª^µ?EÊ•Ùˆz’n∑∂~UHÏı™”Ár1ô¥ëµno¯Û','2017-02-02 21:29:51'),('Sen_wiki_DB:pcache:idhash:22-0!*!*!*!*!*!*','}VÌn€6Ìo=≈≠Å€\'íÏ8âúHù§vóœv⁄ü#›ÿú%Q ©$^Q`è∞g‹ìÏííYv„ Ç}ÔÂπ<<‘]‡˘AkÃ§ByóÎ,◊≠†ÎﬂUp¥íæËV_Qåw¥N5{à¬ò)ı{Îô/yaPBñ«,Súæ∑ŒúS-Õcq∑,AÁÙÄæø/PÖígöã¥n•JÀ<lögl^¸§á\\√FgpÉg_©%lé@˛®tIÃÑöt\0‡ÙA¬¡‹+Ω‡\nûŸ\n¥†RSÕ”!í<‘Ák,|Œïdj1_ñÎ∂?µt3ë⁄“(ûbT˜˘Æw‘ˆ€ÆÁXc≥	¯#·≤|6`aàq,∂”ôœµK`\Z‹Ÿl^€Î˝$€§J≥‡ì|\\·[Ìæ·≥˘›≠v,AŒÁÙ}ª\rŒ->è«4‹ÑkªUR;.hpö\'ÿôπÙΩŒIÁ®æd\\Æ8Óu]◊πX•,·°›HLu\0è,VË∆˜rEî¿›w]RX§ú	≤¯\r˜òjë\"DEåÜ\'Æ∏¶äRfÁ&á‡πˆ≥:«%k{µh°Ùˇ¸K∞4ûÜqNqäˇM%xÓÅÔûyá><¨4*gÜI\Z09œÍ≠l∆\r˘|ÅÜ®U—°Å3Ω0Uv]ÁÚ%C≤>!dˆp√cû⁄£UïÁöÍúv{Ω)3I0TôÖzµ„*6	~˘∞ó®Ωê≈±⁄”eôø:ÑCc¸`à`æ∏\'<hC[Õ‚Zí){B3Ä™®–ÓÏ3◊X‚\n¶ò~3∫ÚÌ‚cêY_¿£Sã¿\'JΩˇÌıÃ MiJ≥$k∆:%ö§x^Ô–SÖ≥.)€5KÁ9Q‡ößK’Í≥¿\ræˇ üGæu5íc”1J#2-d›·\Zù‰:∆J,}RŒ·üpûFRPÓ	∆$%‘µ)–3˘y-J9—∫›ØŸGQÕsdÍ1àıËc2^Òß»d∏∏≥\n[˜õŒ/_H•R7+8¥\ríœl¿Æ±–°ù¢•P´ˇ∏˝rÕêG∏√e\Z∫üà*(W÷!≤hDÏ©·õ∫oDî«ÿ¨∂∞NÌuQ˜u^}zµπÃ∏>´ÅH˘¸ìÕi∑‹ê‰≥Ê°€-˘ d ”y√Zˆ’úÚeƒuÈöâ%\ZˇC‡ıÀQç•»PÍ\rôU≥ª¡pvsmH@ìhı◊Ù)y\\—sìŒ≠\nññ_¶FH£çlÖÌÓÓ~TÕŸ\'äΩ´_ÍÔwÒe,bÆjÈ;ÓV‡yhT\r£-ˆ¯«[±ÜKV%.òfØë;PØç÷O¨äT±«Ê-√ºWÿ{†PòvH—4\rSëÀ ≥=SÓfÿ3Òjg\\o3.ÀJ7¬l{°wN3‚ÅOˇû˘/4∫_v∏πz≠Ï€ÎΩ\0ùNÄtø˝RÛçío¢∏%J©Ì≈ﬂD©î∂∫∂@v`4±÷s{GÏD∑h°ªµ∞∏G™˚√^;”{f%Dc˚È∫|¢ DøÂ_,\\“9[suõ,W1´√é∑1Õ0Ãi&T◊üFtn˚≈‡\ZÅ7ÏÂ<bô	º¥Ô≠~ånØ˙•\Z‹◊ôn0Ã1˝ÇRY-≥‰Úˆ{˚›ıYµÔ\"≥íz?9´~W•4¿^Ø≤N õ…îMSÎˆ¸','2017-02-02 21:39:37'),('Sen_wiki_DB:pcache:idhash:3-0!*!*!!en!5!*','ÌYmo€»æœ˙ká∂áH|ï,S≤Äã„‘.€àùÎ«`EÆƒç¯Ó íÔ`†?°ø±ø§3À%MRä-˜æ\\Å à@ÌŒŒ<Û ôÕço;æqK¡äõµÃ◊“=«ˇM¯CﬂHÓŸV\Z·ªˆ¯ƒ7¶! ALÖ85d¥NÊD|Ic∂≥√”îÚ1fß∆Üá2ÚÀ…∑ ¶$*ÿ‚‘0r∫·+nÚ4d€AÂÊK\r\"πƒs¯<õÚdIh,’œ¡∑|	lã†}:°K&L%Ÿô#œ‘§¶cY˘∂_T@N\rX5Hƒª˛—¬é‹î¡‰År‹¶bÜ€w‰†É^Î†≥5à9õötF»éMöKû•mk„î/_≥ÍG3ø6É>ÀS…äî∆µΩœ”ò†ªB05AÃûÔﬁ4üMÁ‚TﬂΩ©ô√W≤Òeîÿxê≥‡Ÿ¨‹⁄QÚ`)rfg†H•òö£í∞é·+ÊçÛ1{`qﬂ&(XÄvË€\r•ˇtô \"◊Å∂ê»i⁄8ùÇ˘ gˆ‘ƒùÈHÙYìâ¶DK|è”ƒ„4Òú—Ç°ƒÔ\"ºÇ•dp\n∑â¬m°\0„4ê/‚xâf“¿25cééWà Á◊¨„uº≈\n&§x	òÛ™≥Jª∏^√2lb˘P0öºƒ}H…‡eÎËÁ2∫Mù+Ωid∑≈&õ~ƒhÛ\nÊJ;¨˜≈\'Ç|óZ5íC°)\'—KßÜ›=Ÿ>xáJkJ\nü\Zi∂»‚8€‘	z™JAî∆⁄rëîπoöÇ•Y:÷É ¿™ˆıˆ.;˚˙˛Í¸Î\rî´Ä∆˝è¿i…$6f∞ˇgAÙ¡\rî‰¬k≈”%˘c¶l®kÀõ	Ä¥Ÿl`√(	»≤\n!¬yë≠%»©Ä\\)öÀ¥L/(cui”E\rK“ã˛©“ºù≠¯ƒy>≥Î\rGy£ƒ(*B†/â∏ ÀÇÜk™gíPÅ1_0x€“B\n≤(≤Ñ\\¨ÈÜÒA•G©S‰æ¶N]/∫IÄJnÛ‘ÆRÆRÍ>Ç§%†∆t>K≥©9á¨‚≥úÚêÃ!èVSì´ÿ¶^˚1í‡‚‡Pó4jÀNâ8@Øuløo ô°∆Ã¿µu—ôëoŸrŸ^û$’í.Ø™Pï§ve9\0¸˘Ã˜¢Í=çi\Z02gr√`»R>Ÿ!°iH÷icE€¸®ﬂ\'Ωk∂πΩÖ@K∏ÑúÃ≥BˆŒh¡1…Ê«≤è-€µ€9\'Âa€úè>è†—È}xLi¬îâÔ|ü,h,XÔÏˆã‚A÷tÚâ5∞\\ï “PÙ>3ÃÚˆˆ±[oﬂñ\"òYA∏‡•Y»@ \Zeÿ\'¶m©Oõv…†E•]j«{¶ŒÑ¸˜?ˇ*†]x\Zƒk†¸Wƒ\0ùÂ…±=t»¸Q2—ªgI3˝”:›æCw=\'DQL∫1d9Ù∆ƒÅN∞wæÕ°JÒŒ≈Üú,¿ Ÿ\ZùÖ‡z˝˛¨ßùï3\0L±zf™ÃU:â¸Â«wâxı6Ô§Ü˘◊X÷è>¯`ı±IüÙe&i‹rGÍ_Å\nîg7\\Fd≈	÷|Ï6ø~xÔÁjœÁaDE‰ª}ÎË\'¯;bÈ—Ë\'^àÍTíw‚Em¯°\Z«=Çp¸∞=òEÆh∫\\C\0`—∆Ñ˙ñˇ€ÏŸ∞w:-≥Ç3µa„¯Û 9(õ=2\\@mìä˛2\r·\r$≥¢…»¬Å”zÍÒUz¡”ÂWrÅ=˜≠JNEƒ}wÚT≥—vn≤w\ZÎóacÁ©°Ï◊√0∂Ó1êa«hD7jÿÇ˙jÄ£°µ+ñˆvÜñ√äÖ´∞(\"jóûoXˆÊ$\ZãlX–≠Ò÷^Ö+;r9Ã]\'¿W©áÆ8◊/ﬂ⁄$•<0˘€{•∂¸√_ﬂµMÜ ó\0p_`@—∫++†1ôÉ”Ùô≤=[Ë∫ÎÏoê*¨xl≠^@}æÑÏiGî˝J3*Ä\"¢¡8˙L*ªï‰wA¡sŸDÍ>Ô·¿‹›˙ªÄ˜ÍÇ/°E7† ë˝\"ÀööÉí–\"SuVµ¬juXÖÒù⁄TΩrÂ0î˛\r¬|√÷!£^SìR~´=-ÛD∑Õç3¿G\r¢Õ5\0ÉmJ9∂R\rÕçµ2[,`¸F,#ß‰Ø≠(+ˆã~B»˚UqvUq:™\0s›»uu\0\\0Ì—¬y´é{‹U£!ˆ	qÓ«ÔÓ‚w;¯·D›πu5*\rˆÍ‡æU◊vuhâ~B¥ˇµN¸FÔ∂◊Œ%º7+q‚uïhK-ºﬂK∫}€´ÇªGÖ·[U<{O,Ubü™∑≈9Ù:„Ô≥√¥ü´ÃV•Ò∂»rVHŒ:5Ì˛ÊÏ‚˛”ïrÆ5“∑~ø˜FÁˇW:ˇ{W:®;ù?˙•Nï®–AÍ∑”wç«U˙´ÙÉ4;OÈ<fa++Àµõõ/óUˇ·@˛–º†ˇ€W∂ΩÕb<÷≠-TkáÁ\0á6∫EW7«ÍJáîZºW+FÀﬁ°‹Å™∞¶07.À%®ŒxGvÖj¸¯@%}Æ){`]·˘Yç\'≠™∂ˆ	÷Qÿ+Gó~\0‘∫ÉÖí©∆B|v¨6Ÿ\Z∂6›±≤3ZÆIóÁz>ƒÅØÍ[±ÇÊ·D5=Ø˛*€«ÎëqóÅ„Ì2p›(ÀiRì•˘\\,ÕDçäâ”fRçp’†yèÆ!ÍAQ\rüm=ÙiØ‘¿€9X®’`™Ê“Ω‚m¥Åf—q?å·Ä¸‚wı≠º˘´É}7X>∆¥Ÿ∆‚§“°∏ÀY∞õ\0ÆœÏ·ÍzR\ZÆC¯ânÒQÿπ∫ò0&°y˝Q∑î…óf™\\óëü¸¬\n°€[’Kç^ùÏÍí„~g»™Ü⁄™W-È*ë»ÿU´üıÃã∞π?Oû˛','2017-02-01 21:46:29'),('Sen_wiki_DB:pcache:idhash:6-0!*!*!*!*!*!*','çVÔn⁄HÔg?≈©“ı€íö®%$p\"Å“ﬁ∑j±\'∞≈ÿ÷Óö¿5ïÓÓÔInvm√⁄–”ôôﬂÃŒﬂﬂz‰9ÆWS.ÄèRô§≤Ê5]Ôª.Ω⁄z[YkœqúÜWªI√è7!˚H\"∫a*YY{Y?•/¿»∂b‰’¸usÅjKcf@◊‰÷s‡à1~ò)]\'!ê[ÿ0ôqÍØX¥@|Udçy¸\r|I&êƒÇ…ò3ƒΩñ≈º<fô∆)˜Åt„\04M™\"”¨ˇ˚ﬁr!P¨È–Æ,0å8¯II£àz √◊íƒD“(à◊	ög∞˝O≥Ñ0Q¢Wı†Â7™F˝zùI∑o}4\Z~\Z˝aHÜù«˚ßŒ}ozp`Y7oÎub=¬ÀxLB∂f#Ob.≠.ıóòódkàk;W6~πN„⁄u3Åm¬¯Œ#◊≠¶m[∑ªàÆôO¸8íòßGûi(¿Íéü¥í\nåﬂ#ˆπmªD\0¬aMÄÜˇ°c,<∆Êãòì\r√cDëÍëßÍÁ¬±ıß]@úV¡Õ8Úüø˛∆∞ÿÑE~ò\"L∞?UÆ˝· πt…|\'AX3¿¡D_ÑÚE∫∆Ã~ÇÎ≥≈Ñ$⁄©¿!$r©bl⁄Voõ\0J7@Ωs‰9ç|µIEp∂\nŒ™◊˜-¡qè¶]úÍbe-\"øº;[ã3üÜ°8ìyòÔ-ÙÉE|G£l¢?©ì∫å%\rçC¶t*ˇ\"(_˜ıÖ…%Y¡éL!˙˙Ç´¸ıˆìóhù«Ç%KØU∑ﬂ˛z¯#™å*2!qç+”¢ïT˚0~\\\"ß’¥à\nBSL˘fà;ëbˇá,ZâZõz∂˜˝á¢‘u1©ÖﬁÏäbÃß∏Ù¶¬VÏ≈d{\nªÚj0™8…õ≤\0Êî+EKù[9O[ÁÖ4ÂÆ!ÜÊJ≈°6ﬂD_£éÖ0 ˝Â(Qm6ı*„ﬁVèhXç‡R\'Ü:U˜SÂ¿MùÇûúZ{ÓŸÌ‹¶èâùP©Ñ„{ú‡ªí¥4‡–˛U‹qêÜPç6ìN}ŒiÍ\Zù‹ïÕîÍ7—ç£g∂¯LyµöŸù”èc3¡®¯ByÑ$_ëÊyU´‹òÃU≥xJ?˜úv^*º‡≤49 j6ÍˆgC5XâZ{?6˘¸cY„Z·Õ{ùáîNÀd£—”†®≥ã#ˆ∆ºbﬂ®ôÖÌ8ôø3éoÿG¿éØ®Ç£ÈqØè∞jñ49‹RI»^áä‡\'ö<\nÏµ∫Û¨±&ˇåXÍ>¢±\Z*6.Õ…ÍŸµÀ∞ú´ì∏Vó$9w+6÷π‡õ√\Z1,_˛ü1s;œ∞lΩßÛc˚Ê±}£Q±G≤œò>\'z≈ﬂ%\'E 9°k\'nŸIAØ≈%|TÀ∞\'q}1ú,C3À†ydò]≈•°Ôåì«;™πãJÛÒÜ‹`‰]æ’∑ÏUj?©«£rRs	ŒböÄübM0Æ	l∏\rèÌ¨p‡›vö(`Oø2‘⁄Å7xºkÁ\\dŒπÚ°ñÙ3p°ôLèñsﬁ:oÓ7Uø~ÃÚ¡˚…¶∫Æ8R9vZÖtíﬂG*l¨Z´Ÿ˛Ò/','2017-02-02 21:38:22'),('Sen_wiki_DB:pcache:idhash:7-0!*!0!!*!*!*','•VÎn€6Óo?#†¿6‘±nqRŸ	–%iì!#v€ü#€ltÉH˘≤\"¿aœ∏\'Ÿ!%⁄í¨¥C¶ ∂Ãs˝?û{œ≤=cD3Ÿ}.“\\ûk{ﬂπw‰—÷¬pœrNPk∏∞œÜ<•1ÒC ˘©≠∫†A»b0Nç	–hz—#d∆ŸêíE≥S£A¿Ëä=±ãX¶ã¥WU%Çâ\ns¢Õ+?Ü=z6Ï…»g√hÂ°7¡¡,âIJÁhxï”0ÚC§ù\ZV√I›=\"ûŒœAçiîÜ0ΩÄ%ÛÅO\'ıüX<ˇ¿óÃ4ÿBNJ9Ÿπ}A \"ÿ?p¯ Çå≤‰öL M8I∆Äˇ¨\Z≠6∫•ê‘∂≠æ≤ŒKﬁZ+–tª§s´—àÑ,bÇdhïâŒ9ı`⁄xƒ6≠c?ˇƒtÅu ≤çGN˙Æiv.61çòO¸$èÃh»°s>˙¨|êúc“1M”ñŸ&q¿;@√àGòKñ‡FÚ$#KÜX0£8	\0£‰2Üeˆ,S=u›9ƒê—=Ì˛N;·‚üø˛F4ã˝0G=Œ˛î9ÙlÛ˝±udì«ç\0ﬁô\0r\nùöÕÛ±Ω†w≈Ê‡Ç(ß\\ÓS\0©X`ızÆŸπ\\ßÄ´K¿›ìàÃÚ∏ÿÕ2;•”Ìn7…sLLπ⁄9UÂ*6â¸Úˆ]ƒﬂ˘4˘;Q¶˘k˝`ﬂ|‰ãI‘cë.ÈäD–∞dLó ÒÎ§|µ≥+&‰	6dÒT≤{zÒªó*ô«ÇÂÔ∏k¸v`‡˛YEôx\0tQ¬‰˛a˙, ñÎvàÃAı[õÔ\rçÁ9‡Ü≈O‹PœÙæ?£ÃBŸ9böÁ§.∏éÊS§wU` V.è⁄∂ü£jı§‡R_F‘ë,Ô;ÛL|q‰M`£}Î˘E3ºlSΩ8ﬁãù≤–≥˙:tµ˜ó≤#cºMµ‹¥*ª≤~T$«tÑe™jü‡‚G¬hÊ/ÓSI©™\\ñ˜r- ãiÿ,Ôë™\" ‰∑’˚¬∏Ë∆‡´T⁄\\±\0ZD–]Ú	ŸŸ¶∂zÖMı\Z	ZÒ/ÛæMÇ<Ñf∂≈ÍÿœX*™2g\'õ∫ô˝¡œìx∆Ê_h÷¨fq€_%I‡{|•Yåª÷X-q©UG”„D“ìâ¬Bc¿<k†fáÚ7CÜ»oD°Æê\n»éHø8◊?PlÖuÉT◊0óYñDÍÊ®Sy™©,´+ªO2õq2\'≥à@cëd≠,|ñâø\Z–é¸˚˜y8ªú˝jp∂€D˜√≥àHÌˇÅt◊H≥4a:-0ùW√ÏÔm‚À}ÈY7ÅKº‹KÊNí\'êÙ}T0’IF„2QÎ¢“jr~5πΩë10ÑN[hŸÀuãﬁ∂tÀrLS#ëÊó1}!®E+÷ÓÔ?_Î6`#ú7’Ÿ˚çÏﬂ∞%!Û7ïéπß¯¡ó◊:ïÊ¶∆vôW±rh+Œqô≤Çã¸Q‡ò∆IXfáòÌì=˜≤;™´ıÇ\n∫´NK\"7r@zPWØ÷U‹≤ﬁK÷†¨∏ñª>jcKN®ôFobUmÖù≤UØ_◊K”rˆë√åÜ/O:“X}®ıhàuÛÌ8‘‚†øÔ¿q\ZpX*&•rPíÛOÕãŒ¢àîªÓDè\'zà˙/>öÖÿAj∞™Y€•µ[ p˜ã·K]jÊj\ro…\Zî.\Z€è#Ê3?G∆>}”=¶§˜>Y>Ü¥z±8÷û∆8?«ö`^∞ºFíﬁ\rä¬5oÈ˙C@S©x©Üncx◊wÂ˝ˆπz8§y≤ø@∆’Ì¨»eˆ›ÌÒV¸§§^Ìx´âÕ–éïû)[}Ω˙Pt2m¨öÎûˇ','2017-02-02 02:08:04'),('Sen_wiki_DB:pcache:idhash:7-0!*!0!!en!*!*','’X€n€8Ì≥øÇ—¢¿nQ«í,Â\"ª∫I∫Œ\"7v€GÉëòòç,	\"ïÀˆˆ˜Kvxã%[ZwZâer8<g83ú—E‡∏Å5∆9#˘E¡≥Ç[ÅÁ_X‡÷bJ∏5`ÅªÁ√œ·‚>‡ix0åË¢—~X(å1cÍπ2√)è	Õ›É√4·$·lÿÉ√tÜEˇbZZì;wèå¿˙4È:†\0£yNÆﬂXøL	^ÃŒ»‚ä‰0Ã2úî\'Ö\ZwÜ=1sÄV∏‡r t •C{˛b˙h‹2ö	^d1ôë;\Z6õÊ8º•…M32∑ô“á¥>dÙ}; ~Â8O?√¯Ïíd)£<Õ)aÕ˚Ìµ2TVˆÌ¯º2æ∑Iîß4öM“\"…Ï0çàƒ⁄å—k«®\"•	ÖÔ∑„ÙÀ8GÔgÍ%â	f$öù,\riÍ∑ΩG´—à§∆u§=+:nz:\n;\"≤*™˜›9¡QLb…(¨å·“[êà‚{zK{4â»√v6œzeQ$CW-Gfy%p2¿Ä6ÆmÜ2¿ˇ∆\Z¯ûPÙ	∂∞êûzc9+J™Kdr¯\nRÕq◊J∞iô!€~-qπë‹Ö\Z§!ƒ[≠Qª∆ò¢.ÃõÇ##Ùõ¥mhÅñ$“jÖ∆u∆M…§-ÕldØM„ÜViKY≠fi^hÏ“òªZ”⁄FñÒ[U÷ö¶3‹ÍvQÁú‹è«(¶ QÜÃyÁásXÃÈÇ»µù]˛πNﬂ∑5á»CFÛ«\0ÌÌx∂›9zLÇÜ(TLÄÆqÃHÁp¸AÍ@≤∑m€ê”$bùKÇ„ñÈ1`…Sà|ñÊËéÇÛ¢DúvòbgØÁÿÚSïΩ!	…Ò™¥Î-•S∆ˇ˝˚†Äì—$åêcÙ/Å°Á⁄˚ªéÔ¢´GNXgJ 	Å2ÑÛõb‹\Z‰FÙfNGR)áëåœaﬂûgwé2£wéPTêË∫H‘ëjt∂\0◊Èvü≤]¬\0òTµT*Õ•	˝˙ÚıÇΩq≥◊\\√¸≠z¿å/|ƒÉç‰«A]‘Â)«qiì	æ#Çø ìΩß|én…#öêd&<~vÙ{ê…πÄFsÃÊ¡n◊ﬁzµeomëæ_!aFÅåqHŸ+˛\"\'s\"Ék:˛n	¢`v<®ûOqrSÄú“‰ñYÿ¡ó\'òs`ÓH›®ÃZù8I\"\ZbHàÂ	[‘‚\"ÙLA.DÀÒC;bG≥ì|°Å\ræ(Â]@”òÎDyXÆ#† oé~-È ÄT{âh![>ÙÉ∆ÎZ…9;ÜMπ\0—sæ5xzfØ°l∑4~ïfvÖ‰≤Ùæ£1ôúáÛãL∏iy^úÿÒ\'yÇ„’ÛÂ¡¿úõ∫„Ñ\\3Q9»\Z\\Å·ıöçHÕî tû˛NÚ« Ë2¯	8}Iø¿}ñFEL \'Ú`‹ÁÏΩ-⁄ØÅ°°ƒ\'aN3^F⁄_ŒÒ«ò¨N˝…†Qª¶7qæjf’\Zé“¥Ã|&>·<Å„\\’ÑÂ®o\\qO∏\"∞1’∂5†Å3êç¶˛\rõÅÎào`!/≤ís†•sÄ´Î\"[-ëæj‰V,◊y∫P≠h%lf&lÑŸE™KØØ·ì≠v¿I8OÛZ˜|¿7&¥åäıj≥Üú[CŒ›òúÎ≠≤k\rR`Í~”eí@´IbïføÜfcö;káÿú∞Äcˇ;8.sÎzôX√”´·ÈmÃsøø∆≥5◊WÔ;∏ Î°©Ù´!Î◊êı7&Î∏˚kl€/¨\'ì¯è°H‘IiöﬁëôÆ$côΩ¡/2íÛ e,VM/G”≥S±—ﬁ>¸//æ~ƒ7_?…´Ø˛›◊OÛÚÎg}˚eT√∫,7’ˆsun{æ™>ehC\'¯*&Q%‚’ÿ≈≈áS~πêW^îﬂÉø•8yß1\rÖ>ÿV|ıÌ5¡∑°h—HT**˚\"√\n\\ ¢3Weí…§\01ó¨∆˜0„≈õ≥y\Zk¿O‚Ì˚⁄é¢Pïù”Êxô¥j∞ùä˛˜RvVFVfg_‰uòS]W7i∞©Nÿ≤e5◊fYÏä÷Zπù™\\ñÈ÷VÙ™“\"Æ™!çÔ…€˛Tﬂj(Vó?wªÎ\n†ÜYS–ÔØ(Ä^X5¬∫ÌmEã≠ïË~W*q´JL˜iz‰Ø—±jàÁWˆÕUzµßxkUomzjŸR◊nÔh+«?ÜêÇﬂ~6Uùˆ¯ugy„r)ﬂw÷$&	∞	‡∫$w\'‡§Áe∏¡3¸6¬ô<ñÔT¨AúúøËé‚C9^ŒUH,>íú…FI:ó≥Ω≥Ì=Gº|?3’ÆWâxŸè[F±î3[\n≈ŒéΩ‘Ì∫Ä\rVÛwOˇ','2017-02-02 21:35:01'),('Sen_wiki_DB:pcache:idhash:9-0!*!0!*!*!*!*','}V€n„6›g}#`Å∂àcQæ%t6¿6q\ZIlƒŒˆq¡Hcãµn Èƒn∞@?°ﬂÿ/ÈêíY6*CÄ¿û93<√ÒÑQüπS.»…ZÁkÌ≤ÆœﬁÎ17ô√FªC≈Ωs/Û´y$	∏Üe&∑d≠@Yd2!óúD_‹v°‡ob%⁄\"\rasñGy˚]ÿ(…„l†\\¢Öé·ã€Xæ⁄}^∂˘’ôsŸŒØúÀìVã8è6ùíX$B	y&µsÕÉBÑJÄﬂ£èv®Oª}Í6õ\\»-#Á˝ÆÁ97€î\'\" AñjH5#+pÆßœÛ·KDÚŒ<ØC†[®ú\'‡Òˇòß»Ef(ïIÚ*î–»(ÕB¿(k√oSœ>˚ÆKHAÚ¶3≠ygJˇ˚˜?òOC\"“ ^£ü!Öﬁ†Ì{⁄Û…ÀVÉrÊÄuC4¬Ârù`n•£◊ªÀî&Uâ,%!‰:2,ªû3⁄‰Ä´Ø@r´≤XßÅ6^%=œ∞sZ≠+ß<îπDdf°>@mπäC\"?}>M‘i¿„XùÍíÊœ‚`?|ÃáGÏCIã¥t¶y\\2„Ø`\nPë\nÏ…æ	ël…“ÔFkﬂo~eπµ1F\\EÏ¢Âù¸rb^˚#¶éÜô“<…z±F	Ê\0ëøIè:ƒp0Íß]lÖ{û.◊(Ä{ëÆî;‰ÃcÔ?–F—v]tÑÄ¶aúÜ€%ìuÉg\ZÀ»øÍ.zŒ‹b[k¥ÙM‡* eÔw˜ãO≈.òªÁå}L;Ó«.FYÌzlø∂>kñÅaõ`~uo‰ï‹äf¿eMr£Ö∫›‘e¥— S7Î“≥È£ÕŒ±¢aCœ¿ Àæ0oXÓπ!1ôÑ≥ﬂPF ∑{´w¿√1*´Üox?d·:Ü&€buHëÎ∫≠Ûa”€˝m∆Ùª∫Œ“ÖX~„≤YÕ‚“ºÀ≤zÇx4…\\¶\"]6VÀºöUÖBó¶y∂catXñj*≥§.ıeﬂ–öﬁﬁ¿ÇØcmnQ£Ä}EîÖòOÆÔÊ˜∆éÂrá;ñùP)ºhøO/∫~ßÔV±q˚(Â/1Ñ{îäµ…‰y\\Üèb˝T$üå¸a3Õblk·;ﬁÅ„◊¿\\ã÷$∂ÀRÈıã∆…¢¢,.9`f˛˘àQ¢Ωn∏Êı=ÓﬁLë\'{?UæÁ6–Nò‚ÓjËçe2§Qöˆ‚∑çÊÌªΩ°*è˙ı˜˝ÚºÊ ∑I˙¶•Ω°`>æ‘º≈Ì_e∏ø{73˜”#\0ùN\0\'J1N ibfƒJoP¢îS√¢¯˚(’^MöÔ£Yà›§∞”Áh!∫E\n›Éç≈Ñ™&ìLG√SSÑ¢q¸8à_ë˘5Írı\'Vÿ•;äÂ6Êı&Ó–èY¡\ZkÇºû‡uå\"}Ök8>Õ◊êÁ∆qdˇô∏√êçoáÂ]Ú\\oÉa˙˜HeoB+.z÷?ÎÓöÿ˛Àôó“˚h‚j™π∞ı´B\Z`⁄ØVü °gh£∞π˛','2017-02-01 21:46:10'),('Sen_wiki_DB:pcache:idoptions:15','Eç¡\n¬0Dˇe?†Ï¶1çì£xTı^l¿™•+¢î˛ªâPº,√{√lã-h◊]oÒîÜHÿ`Và\rgç};>”„Æ:0ÊE·≥∏ƒI3•†πMRπ ñ,ú›©2,\rÁc§n¨ˇQ≥ˆˆÔ1M\n	ﬁYÊ‚‹ÍéÒï óC_º‘>,_','2017-02-02 21:37:48'),('Sen_wiki_DB:pcache:idoptions:16','Eç¡\n¬0Dˇe?†Ï¶il\'GÈ¡SA‘{±s®ñÆàR˙Ô&BÒ≤Ô\r≥\Z–æøﬁ¬)éÅPaQàçg\rC7=„„Æ‰{0ñUQ\'q	≥&J^Sõ§pÖÕY8πˇR&dXvúãîeÛ£fÎµÔ)ŒÚµ≥ÃŸπÕ√+Ê/á!{±ï_ø','2017-02-02 01:13:39'),('Sen_wiki_DB:pcache:idoptions:17','Eç¡\n¬0Dˇe?†ÏÆ1÷…Q<x*àz/6`’“QJˇ›D(ﬁÜ˜Üô[–ÆΩﬁ‚)ıë∞∆dıgã]3<”„nZ0¶ŸPgqâ£eJ¡rõ§Úï+Y8ªˇR!§,ñï®≤∫˙GuÈÌﬂC\Z?jÔòãÛã;∆W*/áÆxQÛ','2017-02-01 22:02:48'),('Sen_wiki_DB:pcache:idoptions:18','Eç¡\n¬@Dˇ%Pí∏Æ€ÏQzTı^ÏÇ9TK#¢î˛ªªHÒ6Ã{Ã¥RÏªÎ-ùtH [ôMàÜ≥•æü˙∏ƒNPÊ≈$dpIìÂ¢e®Úï+ô0≥ˇRiú\0#Ìê6ƒåµ˚yºzÕ{‘ÈQ%xáXò_Ÿ1Ω¥º˙¬âC\\æ','2017-02-01 22:09:44'),('Sen_wiki_DB:pcache:idoptions:19','Eç¡\n¬0Dˇe?†Ï¶Il6GÈ¡SA‘{±˜P-]•ÙﬂMÑ‚mxoòÈ80Ï˚Î-ùdL¿ée2„Y”–MOy‹bœ»À™‹dqI≥f\nQs®Úï-ô0ªˇR!ñ¡ Ìêj2‰Ç?j∂^˚ûd˛@nºE,ŒoÓò^R^CÒDu\\ø','2017-02-01 21:59:59'),('Sen_wiki_DB:pcache:idoptions:20','Eç¡\n¬0Dˇe?†Ï∆4∆…QzTı^l¿™•+¢î˛ªâPº,√{√lãhﬂ]oÒîÜH®1+ƒÄÜ≥∆æüÈqW\nÛ¢Y\\‚§ôR–‹&©\\eKŒÓøTàñ-Á#~√ñ‘¨ΩÊ=¶ÈC!¡;À\\ú[›1æR˘rËãóö√Ú','2017-02-02 18:30:40'),('Sen_wiki_DB:pcache:idoptions:21','Eç¡\n¬0Dˇe?†ÏÜ$∂ì£xË© ÍΩÿÄ9TKWD)˝w°xYÜ˜ÜŸ\rhﬂ_oÒî∆HpXb@„Y„–MœÙ∏+ÖåeU‘Y\\‚¨ôR–‹&©|eKŒÓøTàñÁcƒ4N~‘lΩ√{JÛáBBÌ-sq~s«¯JÂK;/Œáı','2017-02-02 21:29:51'),('Sen_wiki_DB:pcache:idoptions:22','Eç¡\n¬0Dˇe?†Ï¶i⁄Né‚¡SA‘{±s®ñÆàR˙Ô&BÒ≤Ô\r≥Z–Æøﬁ¬)éÅPaQàçg\rC7=„„Æ‰{0ñU—$q	≥&J^Sõ§pÖÕY8πˇR&dXjN«HŸñıèö≠∑Oq˛êèhúeŒŒmÓ^19Ÿã´¸˙','2017-02-02 21:39:37'),('Sen_wiki_DB:pcache:idoptions:3','Eé¡Ç0Dˇe?ÄtTÿçO$FΩWŸHãÑÇQ	ˇnK$ﬁvÁMf¶¢í`kÆ\r≠c†ú&O(	‹…s]uÉ}¥¥°î&KB˚Ëö—]º˝0hK4Ã⁄†qﬂ∞©m{Ûë»@\nÇ—s7Ì\rÙº¸ÓÃΩ±pNÄâJ≤x£Ï?Â+n¶(1S≤\\Tπ˙vØŒˆÔXU®Lƒq®Vv‡ßç-˚:Úº–Û','2017-02-01 21:46:29'),('Sen_wiki_DB:pcache:idoptions:6','Eç¡\n¬@Dˇ%Pí∏Æuˆ(<DΩª‡™•QJˇ›]°x	√{√§¡¥kØ∑xJ}$¨1DA˝Ÿb◊œÙ∏Öåi6‘Y\\‚hôR∞‹&©|ÂJŒÓøTà)ÀÜÛQY’™?™Koˇ“¯°êP{«\\ú_‹1æR˘rËäÔ¬¸','2017-02-02 21:38:22'),('Sen_wiki_DB:pcache:idoptions:7','EéÀ\nÉ0Eˇe>@íh‘Nñ•ãÆÑ“võAıA¢•E¸˜&RÈfÊÊﬁ\nG˝hÈj;î∏x‰°ªy2’8Ÿ°˜†4¶∏Xd*¿°üªö\\K⁄ÿæ	ÿ\"§Dò=πßÓõxQN¸4◊SÎ»∑√”ÄZ7±ªìÛ·7I\"$O≤∏sÿøœ/O0^∞0O%„€UÏﬁÈ=Z˜âÅeû±≠aæ≥ΩlL9õ≠£,‘˙','2017-02-02 21:35:01'),('Sen_wiki_DB:pcache:idoptions:9','EçA\n¬0EÔ2(ô4çıg).\\D›Wh¿⁄“©¢îﬁ›D(ÓÜˇﬁ*lAª˙÷˙SË<°¿,`\rÍŒ‚õjòBˇr5sÄrÊ ôû◊©Ω¥˝Ω!∑ ¯qÒ£Dù¢TÄ8≥ôI7´»˛â¥êVºQú≥fcY˝VΩz˚˜∆πÄ“\Zıã⁄ï˝+§ °Iº`∑|','2017-02-01 21:46:10');
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
