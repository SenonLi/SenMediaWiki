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
  KEY `ar_revid` (`ar_rev_id`),
  KEY `usertext_timestamp` (`ar_user_text`,`ar_timestamp`)
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huawei_devices`
--

LOCK TABLES `huawei_devices` WRITE;
/*!40000 ALTER TABLE `huawei_devices` DISABLE KEYS */;
INSERT INTO `huawei_devices` VALUES (10,'MEID-A00000654C61BE','v00725852','Vijay','MHA'),(11,'MEID-A0000557E25FA','v00725852','Vijay','Mate8'),(12,'A00000654C61AB','s00371537','Shouwen','MHA'),(13,'861957030068695','755791','Hai Nam Cho','MHA');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huawei_employees`
--

LOCK TABLES `huawei_employees` WRITE;
/*!40000 ALTER TABLE `huawei_employees` DISABLE KEYS */;
INSERT INTO `huawei_employees` VALUES (7,'wx445227','Sen','Li',''),(8,'s00371537','Shouwen','Lai',''),(10,'v00725852','Vijayakumar','Krishnamurthy','Vijay'),(11,'759948','Jeff','Moguillansky',''),(12,'755791','Hai Nam','Cho','');
/*!40000 ALTER TABLE `huawei_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huawei_projectPatches`
--

DROP TABLE IF EXISTS `huawei_projectPatches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `huawei_projectPatches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `releaseName` varchar(60) NOT NULL,
  `projectName` varchar(60) NOT NULL,
  `patchName` varchar(45) NOT NULL,
  `description` varchar(6380) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huawei_projectPatches`
--

LOCK TABLES `huawei_projectPatches` WRITE;
/*!40000 ALTER TABLE `huawei_projectPatches` DISABLE KEYS */;
/*!40000 ALTER TABLE `huawei_projectPatches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huawei_projectRepo`
--

DROP TABLE IF EXISTS `huawei_projectRepo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `huawei_projectRepo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `releaseName` varchar(60) NOT NULL,
  `projectName` varchar(40) NOT NULL,
  `path` varchar(120) DEFAULT NULL,
  `description` varchar(6380) DEFAULT NULL,
  `patches` varchar(6380) DEFAULT NULL,
  `cloneCommand` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huawei_projectRepo`
--

LOCK TABLES `huawei_projectRepo` WRITE;
/*!40000 ALTER TABLE `huawei_projectRepo` DISABLE KEYS */;
INSERT INTO `huawei_projectRepo` VALUES (17,'B133','Vulkan Gallery','10.1..238.52: projects/HWGallery2','later',NULL,'bla');
/*!40000 ALTER TABLE `huawei_projectRepo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huawei_releaseView`
--

DROP TABLE IF EXISTS `huawei_releaseView`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `huawei_releaseView` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(50) NOT NULL,
  `releaseName` varchar(60) NOT NULL,
  `sourceName` varchar(60) NOT NULL,
  `imageName` varchar(100) NOT NULL,
  `patch` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huawei_releaseView`
--

LOCK TABLES `huawei_releaseView` WRITE;
/*!40000 ALTER TABLE `huawei_releaseView` DISABLE KEYS */;
INSERT INTO `huawei_releaseView` VALUES (9,'MHA','MHA_B133','MHA_B133','MHA_B133','later'),(10,'Mate8','Mate8_N_B028','Mate8_N_B028','Mate8_N_B028','TBC'),(11,'Crr','Crr','Crr','Crr',NULL);
/*!40000 ALTER TABLE `huawei_releaseView` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huawei_releasedImages`
--

DROP TABLE IF EXISTS `huawei_releasedImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `huawei_releasedImages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` varchar(6380) NOT NULL,
  `instruction` varchar(6380) NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huawei_releasedImages`
--

LOCK TABLES `huawei_releasedImages` WRITE;
/*!40000 ALTER TABLE `huawei_releasedImages` DISABLE KEYS */;
INSERT INTO `huawei_releasedImages` VALUES (4,'MHA_B133','MHA B133 Image','1. Copy \"B133_dex.tgz\" and \"B133_root.tgz\" to local directory;\r\n2. Unzip both zip files;\r\n3. Inside dex folder, run \"updateinadb_hi3660.bat\";\r\n4. Boot up, and finish the navigation;\r\n5. Settings -> About Phone -> tap \"Build Number\" till you see\r\n\"no need, you are now a developer\";\r\n6. Settings -> Developer options -> Debugging -> enable USB debugging;\r\n7. Go to Device Manager -> Check \"ADB Interface\", and make sure there is \"Android Adapter ADB interface\" under it; otherwise, you need to install the USB driver;\r\n8. Try \"adb remount\" in cmd.exe, you should fail now;\r\n9. go to the folder \"fastboot\", run \"get_root.bat\";\r\n10. Try \"adb remount\" in cmd.exe again, you should finally succeed.','10.122.38.51: \\Update-Image\\MHA\\MHA_B133\\image'),(5,'Mate8_N_B028','Mate8 N B028 image','1. Copy \"3_fastboot.rar\" and \"2_ROOT.rar\" to local directory;\r\n2. Unzip both zip files;\r\n3. Inside \"3_fastboot\" -> \"dex\" folder, run \"updateinadb_hi3650.bat\";\r\n4. Boot up, and finish the navigation;\r\n5. Settings -> About Phone -> keep tapping \"Build Number\" till you see\r\n\"no need, you are now a developer\";\r\n6. Settings -> Developer options -> Debugging -> enable USB debugging;\r\n7. Go to Device Manager -> Check \"ADB Interface\", and make sure there is \"Android Adapter ADB interface\" under it; otherwise, you need to install the USB driver;\r\n8. Try \"adb remount\" in cmd.exe, you should fail now;\r\n9. go to the folder \"2_ROOT\" -> \"fastboot\", run \"get_root.bat\";\r\n10. Try \"adb remount\" in cmd.exe again, you should finally succeed.','10.122.38.51: \\Update-Image\\Mate8\\Mate8_android_n\\B028'),(6,'Crr','Crr image','TBC','10.122.38.51: \\Update-Image\\Crr');
/*!40000 ALTER TABLE `huawei_releasedImages` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huawei_sourceCodeRepo`
--

LOCK TABLES `huawei_sourceCodeRepo` WRITE;
/*!40000 ALTER TABLE `huawei_sourceCodeRepo` DISABLE KEYS */;
INSERT INTO `huawei_sourceCodeRepo` VALUES (7,'MHA_B133','MHA Source of B133','1. Copy the whole location folder to your linux: ~/mha/src ;\r\n\r\n2. If you want to use git, unzip the *repo* files (files that with names containing \"repo\");\r\nCommands: \r\ncat mha/src/B133_repo.tgz.a* | tar xvz \r\ncat mha/src/B133_a_m.tgz.a* | tar xvz\r\ncat mha/src/B133_o_z.tgz.a* | tar xvz\r\ntar xvz mha/src/B133_others.tgz\r\n\r\n3.cd ~/mha/src/BL22170262_MHA-AL00BC00B133, run the below commands\r\n rm Android.bp bootstrap.bash\r\n ln -s build/soong/root.bp Android.bp\r\n ln -s build/soong/bootstrap.bash bootstrap.bash\r\n\r\n\r\n4. run the build command \"./build_system.sh generic_a15 export_para=FILE_SYSTEM_TYPE:ext4 buildtype=release variant=user update_api=yes export_para=SET_ROMUPGRADE:true -j4\"\r\n\r\nIf the build fails for communication error for jack-server, change the port settings in the ~/.jack-server/config.properties and ~/.jack-settings.\r\nEx.:\r\njack.server.service.port=8096\r\njack.server.admin.port=8097\r\n\r\nor \r\n\r\njack.server.service.port=8106\r\njack.server.admin.port=8107\r\n\r\n...\r\n\r\n\r\nTo build apk or libs\r\n1. source build/envsetup.sh\r\n2. choosecombo 1 generic_a15 user 1 1 1\r\n3. make Gallery2 -j4 or make libEGL_32 -j4\r\n\r\n\r\n5.  go to the folder \"mha\\src\\BL22170262_MHA-AL00BC00B133\\out\\target\\product\\generic_a15\"\r\ncopy file \"system.img\" to local\r\n\r\n6. run the commands below in cmd.exe:\r\na. adb reboot bootloader\r\nb. fastboot flash system system.img\r\nc. fastboot reboot','10.122.38.46: \\v00725852\\Projects\\src_code\\Mha\\B133_N_src_code'),(8,'Mate8_N_B028','Mate8 also NXT','1. Copy the whole location folder to your linux: ~/mate8/src ;\r\n\r\n2. If you want to use git, unzip the *repo* files (files that with names containing \"repo\");\r\nCommands: \r\ntar xvzf mate8/src/android_n_rel_repo.tgz\r\ntar xvzf mate8/src/andriod_n_rel_a_s.tgz\r\ntar xvzf mate8/src/andriod_n_rel_t_x.tgz \r\n\r\n3.cd ~/mate8/src/android_n_rel, run the below commands\r\n \"build_kirin.sh NEXT variant=eng\"\r\n\r\n4. To build apk or libs\r\na. source build/envsetup.sh\r\nb. choosecombo 1 NEXT user 1 1 1\r\nc. make Gallery2 -j4 or make libEGL_32 -j4\r\n\r\nTo build apk or libs\r\n1. source build/envsetup.sh\r\n2. choosecombo 1 generic_a15 user 1 1 1\r\n3. make Gallery2 -j4 or make libEGL_32 -j4\r\n\r\nIf the build fails for communication error for jack-server, change the port settings in the ~/.jack-server/config.properties and ~/.jack-settings.\r\nEx.:\r\njack.server.service.port=8096\r\njack.server.admin.port=8097\r\n\r\nor \r\n\r\njack.server.service.port=8106\r\njack.server.admin.port=8107\r\n\r\nIf git error, remove the files or even folders that should not exist.\r\n\r\n5.  go to the folder \\mate8\\src\\android_n_rel\\out\\target\\product\\NEXT\r\ncopy file \"system.img\" to local\r\n\r\n6. run the commands below in cmd.exe:\r\na. adb reboot bootloader\r\nb. fastboot flash system system.img\r\nc. fastboot reboot','10.122.38.46: ~v00725852/Projects/src_code/Mate8/B028_N_src_code'),(9,'Crr','Crr','TBC','10.122.38.46: \\v00725852\\Projects\\src_code\\CRR\\crr_src_code');
/*!40000 ALTER TABLE `huawei_sourceCodeRepo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huawei_tools`
--

DROP TABLE IF EXISTS `huawei_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `huawei_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `toolName` varchar(60) NOT NULL,
  `toolGroup` varchar(50) DEFAULT NULL,
  `description` varchar(6380) DEFAULT NULL,
  `communityLicense` varchar(255) DEFAULT NULL,
  `installationBinary` varchar(255) DEFAULT NULL,
  `installInstruction` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huawei_tools`
--

LOCK TABLES `huawei_tools` WRITE;
/*!40000 ALTER TABLE `huawei_tools` DISABLE KEYS */;
INSERT INTO `huawei_tools` VALUES (8,'Unlock-Phone','Unlock','Check: run \"adb remount\" in cmd.exe, if the phone is locked, you should fail.\r\n\r\nTo Unlock:\r\n1. \"Settings\" -> \"About Phone\" -> find \"model number\" and \"build number\";\r\n2. Download from cloud the file \"update.app\" for root;\r\n3. On a different phone, put a SD-card and push the update.app to folder \"adcard1/dload\";\r\n4. Put the SD-card on the locked phone;\r\n5. Go to the \"projectMenu\" of the locked phone, selete \"4. software update\" on the menu;\r\n6. After reboot, open cmd.exe and go to the folder 10.122.38.51/Update-Image/unlock_phone/unlock_scripts/unlock_exe ;\r\n7. Run \"ATUnLock_exe.bat\" and \"FBUnLock_exe.bat\";\r\n8. Now your phone should be unlocked,  try \"adb remount\" in cmd.exe and you should succeed.','N/A','N/A','N/A'),(9,'Phone_Recovery','Recovery','Recovery Procedures:\r\n1. Download from cloud the appropriate factory image;\r\n2. Launch \r\n3. connect your problem-phone to the recovery tool board, to PC;\r\n4. go to the folder \"10.122.38.51/share: Update-Image/recovery/driverAndTool\"\r\n5. launch \"IDT/IDT.exe\" (on Windows system);\r\n6. In IDT.exe, go to \"Operation\" -> \"Setting...\" and open the \"Download Setting\" dialog;\r\n7. Use \"Browse...\" to select the appropriate XML file;\r\n8. Press \"OK\" button, press the play button (start download), and reboot the phone.\r\n\r\n(9). If there are serial-ports that need drivers-update, point to driverAndTool/CP210x_VCP_Windows or driverAndTool/Vcom_X64','N/A','N/A','N/A'),(10,'DS5 Streamline','DS5','1. Go to 10.122.38.51/share: Tools/ds_5/DS500-BN-00003-r5p0-25rel0 ;\r\n2. run and install \"setup.exe\";\r\n3. Launch \"ARM DS-5 v5.25.0\" -> \"Eclipse for DS-5 v5.25.0\";\r\n4. In \"Add License\" dialog, \r\nchoose \"Use license file,...\";\r\nchoose \"Use an existing license file...\";\r\nselect \"Tools/ds_5/DS-5 Altera Community Edition.lic\" and add it.\r\n\r\n5. Connect a MHA phone to PC, Open cmd.exe, and run :\r\nadb reboot bootloader\r\n6. Copy \"Tools/ds_5/sec_boot_B133.img\" to local, and flash it using command (in cmd.exe):\r\nfastboot flash boot sec_boot_B133.img\r\nfastboot reboot\r\nadb shell\r\nmkdir /data/tmp\r\nexit\r\nadb push \"Tools/ds_5/gatord\" /data/tmp\r\nadb shell\r\ncd /data/tmp\r\nchmod 777 gatord\r\n./gatord&\r\n\r\n7. Lauch \"ARM DS-5 v5.25.0\" -> \"Streamline (DS-5 5.25.0)\";\r\n8. find the \"eye button\" whose hint is \"Browse a target\", select gator v5.25;\r\n9. find the colorful \"Counter Configuration\" dialog button, find the \"import..\" button and click;\r\n10. select \"Tools\\ds_5\\first_set_conf.xml\", click \"Open\";\r\n11. close the \"Counter Configuration\" dialog;\r\n12. find the red \"Start capture\" button, click save to start','N/A','N/A','N/A'),(11,'Mali Debugger','DS 5','Mali Debugger Procedures\r\n\r\nExample MHA \r\n\r\n0. Modify the file \"Android.mk\" in the folder \"/mha/src/BL22170262_MHA-AL00BC00B133/frameworks/base/libs/hwui\"\r\ndelete line \"hwui_cflags += -DDEBUG_OPENGL=3\" (might be line 168)\r\n\r\n1. Build libhwui.so for 32 bit and 64 bit on the linux machine, at folder \"mha/src/BL22170262_MHA-AL00BC00B133\":\r\nsource build/envsetup.sh\r\nchoosecombo 1 generic_a15 user 1 1 1\r\nmake -j16 libhwui\r\nmake -j16 libhwui_32\r\n\r\nOn command window, go to folder \"mha\\src\\BL22170262_MHA-AL00BC00B133\\out\\target\\product\\generic_a15\\system\" and run command:\r\nadb push lib/libhwui.so /system/lib/.\r\nadb push lib64/libhwui.so /system/lib64/.\r\n\r\n2. Modify the file \"Loader.cpp\" in the folder \"/mha/src/BL22170262_MHA-AL00BC00B133/frameworks/native/opengl/libs/EGL\"\r\nchange the line \"loadV2 = true;\" to \"loadV2 = false;\"\r\n\r\n3. Recompile libEGL.so : on machine 46, go to folder \"/mha/src/BL22170262_MHA-AL00BC00B133\" and run :\r\nmake -j16 libEGL\r\nmake -j16 libEGL_32\r\n4. Replace the libEGL.so: on command window, go to folder \"mha\\src\\BL22170262_MHA-AL00BC00B133\\out\\target\\product\\generic_a15\\system\" and run command\r\nadb push lib/libEGL.so /system/lib/\r\nadb push lib64/libEGL.so /system/lib64/\r\n\r\n5. In cmd.exe, go to the folder where you installed CS-5, and find \"Mali Graphics Debugger\" (Ex. \"C:\\Program Files\\DS-5 v5.25.0\\sw\\mgd\\\") and then go to \"target\\android\"\r\n\r\n6. Install MGDDaemon:\r\nadb push arm/mgddaemon system/bin/mgddaemon\r\nadb shell chmod 777 /system/bin/mgddaemon\r\n\r\nDo either step 7 for openGL or do step 8 for Vulkan\r\nDo either step 7 for openGL or do step 8 for Vulkan\r\nDo either step 7 for openGL or do step 8 for Vulkan\r\n\r\n7. Install OpenGLES:\r\nadb push arm/arm64-v8a/libGLES_mgd.so /system/vendor/lib64/egl/\r\nadb push arm/armeabi-v7a/libGLES_mgd.so /system/vendor/lib/egl/\r\nadb shell chmod 777 /system/vendor/lib64/egl/libGLES_mgd.so\r\nadb shell chmod 777 /system/vendor/lib/egl/libGLES_mgd.so\r\nadb shell ln -s /system/vendor/lib64/egl/libGLES_mgd.so /system/vendor/lib64/egl/libGLES.so\r\nadb shell ln -s /system/vendor/lib/egl/libGLES_mgd.so /system/vendor/lib/egl/libGLES.so\r\n\r\nDo either step 7 for openGL or do step 8 for Vulkan\r\nDo either step 7 for openGL or do step 8 for Vulkan\r\nDo either step 7 for openGL or do step 8 for Vulkan\r\n\r\n8. Install Vulkan:\r\nadb shell mkdir -p /data/local/debug/vulkan\r\nadb push arm/armeabi-v7a/libGLES_mgd.so /data/local/debug/vulkan/libVkLayerMGD.so\r\nadb push arm/arm64-v8a/libGLES_mgd.so /data/local/debug/vulkan/libVkLayerMGD64.so\r\nadb shell chmod 777 /data/local/debug\r\nadb shell chmod 777 /data/local/debug/vulkan\r\nadb shell chmod 777 /data/local/debug/vulkan/libVkLayerMGD.so\r\nadb shell chmod 777 /data/local/debug/vulkan/libVkLayerMGD64.so\r\nadb shell setprop debug.vulkan.layers VK_LAYER_ARM_MGD\r\n\r\n\r\n9. Run MGDDaemon:\r\nadb forward tcp:5002 tcp:5002\r\nadb shell mgddaemon\r\n\r\n10. Lauch \"Mali Graphics Debugger (DS-5 v5.25.0)\" on PC, click \"Connect to the target...\" (or Press Ctrl+6), run apk on your phone and use MGD.','N/A','N/A','N/A');
/*!40000 ALTER TABLE `huawei_tools` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logging`
--

LOCK TABLES `logging` WRITE;
/*!40000 ALTER TABLE `logging` DISABLE KEYS */;
INSERT INTO `logging` VALUES (1,'patrol','autopatrol','20170124225424',1,'SenLi',2,'SenLi',5,'','a:3:{s:8:\"4::curid\";i:15;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(2,'newusers','create','20170124231254',2,'Liziyuanhaha',2,'Liziyuanhaha',0,'','a:1:{s:9:\"4::userid\";i:2;}',0),(3,'newusers','create','20170124233751',3,'Liziyuanhaha',2,'Liziyuanhaha',0,'','a:1:{s:9:\"4::userid\";i:3;}',0),(4,'patrol','autopatrol','20170125003550',1,'SenLi',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:16;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(5,'patrol','autopatrol','20170125003613',1,'SenLi',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:17;s:9:\"5::previd\";i:16;s:7:\"6::auto\";i:1;}',0),(6,'patrol','autopatrol','20170125003630',1,'SenLi',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:18;s:9:\"5::previd\";i:17;s:7:\"6::auto\";i:1;}',0),(7,'patrol','autopatrol','20170125005325',1,'SenLi',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:19;s:9:\"5::previd\";i:18;s:7:\"6::auto\";i:1;}',0),(8,'patrol','autopatrol','20170125005437',1,'SenLi',0,'Huawei_Wiki',7,'','a:3:{s:8:\"4::curid\";i:20;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(9,'patrol','autopatrol','20170125005459',1,'SenLi',0,'Huawei_Wiki',7,'','a:3:{s:8:\"4::curid\";i:21;s:9:\"5::previd\";i:20;s:7:\"6::auto\";i:1;}',0),(10,'patrol','autopatrol','20170125005737',1,'SenLi',8,'Mainpage',8,'','a:3:{s:8:\"4::curid\";i:22;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(11,'patrol','autopatrol','20170125005814',1,'SenLi',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:23;s:9:\"5::previd\";i:19;s:7:\"6::auto\";i:1;}',0),(12,'patrol','autopatrol','20170125013333',1,'SenLi',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:24;s:9:\"5::previd\";i:13;s:7:\"6::auto\";i:1;}',0),(13,'patrol','autopatrol','20170125013555',1,'SenLi',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:25;s:9:\"5::previd\";i:24;s:7:\"6::auto\";i:1;}',0),(14,'patrol','autopatrol','20170125013612',1,'SenLi',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:26;s:9:\"5::previd\";i:25;s:7:\"6::auto\";i:1;}',0),(15,'patrol','autopatrol','20170125013634',1,'SenLi',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:27;s:9:\"5::previd\";i:26;s:7:\"6::auto\";i:1;}',0),(16,'patrol','autopatrol','20170125013935',1,'SenLi',14,'Employees',9,'','a:3:{s:8:\"4::curid\";i:28;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(17,'patrol','autopatrol','20170125014252',1,'SenLi',1,'Huawei_Wiki',10,'','a:3:{s:8:\"4::curid\";i:29;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(18,'patrol','autopatrol','20170125014355',1,'SenLi',1,'Huawei_Wiki',10,'','a:3:{s:8:\"4::curid\";i:30;s:9:\"5::previd\";i:29;s:7:\"6::auto\";i:1;}',0),(19,'newusers','create','20170125025355',4,'Admin',2,'Admin',0,'','a:1:{s:9:\"4::userid\";i:4;}',0),(20,'rights','rights','20170125025457',1,'SenLi',2,'Admin',0,'','a:2:{s:12:\"4::oldgroups\";a:0:{}s:12:\"5::newgroups\";a:2:{i:0;s:5:\"sysop\";i:1;s:10:\"bureaucrat\";}}',0),(21,'patrol','autopatrol','20170125031740',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:31;s:9:\"5::previd\";i:27;s:7:\"6::auto\";i:1;}',0),(22,'upload','upload','20170125033000',4,'Admin',6,'Sen.jpg',11,'Sen Portrait','a:3:{s:8:\"img_sha1\";s:31:\"01w9h8so5raxtslx1kdk1cstg5pzumg\";s:13:\"img_timestamp\";s:14:\"20170125033000\";s:17:\"associated_rev_id\";i:32;}',0),(23,'patrol','autopatrol','20170125033001',4,'Admin',6,'Sen.jpg',11,'','a:3:{s:8:\"4::curid\";i:32;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(24,'patrol','autopatrol','20170125033145',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:33;s:9:\"5::previd\";i:31;s:7:\"6::auto\";i:1;}',0),(25,'patrol','autopatrol','20170125033305',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:34;s:9:\"5::previd\";i:33;s:7:\"6::auto\";i:1;}',0),(26,'patrol','autopatrol','20170125033327',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:35;s:9:\"5::previd\";i:34;s:7:\"6::auto\";i:1;}',0),(27,'patrol','autopatrol','20170125033535',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:36;s:9:\"5::previd\";i:35;s:7:\"6::auto\";i:1;}',0),(28,'patrol','autopatrol','20170125033641',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:37;s:9:\"5::previd\";i:36;s:7:\"6::auto\";i:1;}',0),(29,'patrol','autopatrol','20170125033655',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:38;s:9:\"5::previd\";i:37;s:7:\"6::auto\";i:1;}',0),(30,'patrol','autopatrol','20170125033850',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:39;s:9:\"5::previd\";i:38;s:7:\"6::auto\";i:1;}',0),(31,'patrol','autopatrol','20170125034143',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:40;s:9:\"5::previd\";i:39;s:7:\"6::auto\";i:1;}',0),(32,'patrol','autopatrol','20170125035327',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:41;s:9:\"5::previd\";i:40;s:7:\"6::auto\";i:1;}',0),(33,'patrol','autopatrol','20170125035412',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:42;s:9:\"5::previd\";i:41;s:7:\"6::auto\";i:1;}',0),(34,'patrol','autopatrol','20170125035434',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:43;s:9:\"5::previd\";i:42;s:7:\"6::auto\";i:1;}',0),(35,'patrol','autopatrol','20170125035624',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:44;s:9:\"5::previd\";i:43;s:7:\"6::auto\";i:1;}',0),(36,'patrol','autopatrol','20170125035642',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:45;s:9:\"5::previd\";i:44;s:7:\"6::auto\";i:1;}',0),(37,'patrol','autopatrol','20170125035654',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:46;s:9:\"5::previd\";i:45;s:7:\"6::auto\";i:1;}',0),(38,'patrol','autopatrol','20170126181036',4,'Admin',10,'TableTestTemplate',12,'','a:3:{s:8:\"4::curid\";i:49;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(39,'patrol','autopatrol','20170126181037',4,'Admin',106,'Employees',13,'','a:3:{s:8:\"4::curid\";i:50;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(40,'patrol','autopatrol','20170126194236',4,'Admin',14,'Employees',9,'','a:3:{s:8:\"4::curid\";i:51;s:9:\"5::previd\";i:28;s:7:\"6::auto\";i:1;}',0),(41,'patrol','autopatrol','20170126210502',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:52;s:9:\"5::previd\";i:48;s:7:\"6::auto\";i:1;}',0),(42,'patrol','autopatrol','20170126215629',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:53;s:9:\"5::previd\";i:52;s:7:\"6::auto\";i:1;}',0),(43,'patrol','autopatrol','20170126215649',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:54;s:9:\"5::previd\";i:53;s:7:\"6::auto\";i:1;}',0),(44,'patrol','autopatrol','20170126215843',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:55;s:9:\"5::previd\";i:54;s:7:\"6::auto\";i:1;}',0),(45,'patrol','autopatrol','20170126215858',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:56;s:9:\"5::previd\";i:55;s:7:\"6::auto\";i:1;}',0),(46,'patrol','autopatrol','20170126221832',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:57;s:9:\"5::previd\";i:46;s:7:\"6::auto\";i:1;}',0),(47,'patrol','autopatrol','20170126221853',4,'Admin',0,'Sen',3,'','a:3:{s:8:\"4::curid\";i:58;s:9:\"5::previd\";i:57;s:7:\"6::auto\";i:1;}',0),(48,'patrol','autopatrol','20170126222106',4,'Admin',10,'TableTestTemplate',12,'','a:3:{s:8:\"4::curid\";i:59;s:9:\"5::previd\";i:49;s:7:\"6::auto\";i:1;}',0),(49,'patrol','autopatrol','20170126222122',4,'Admin',10,'TableTestTemplate',12,'','a:3:{s:8:\"4::curid\";i:60;s:9:\"5::previd\";i:59;s:7:\"6::auto\";i:1;}',0),(50,'patrol','autopatrol','20170126222140',4,'Admin',10,'TableTestTemplate',12,'','a:3:{s:8:\"4::curid\";i:61;s:9:\"5::previd\";i:60;s:7:\"6::auto\";i:1;}',0),(51,'patrol','autopatrol','20170126222625',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:62;s:9:\"5::previd\";i:56;s:7:\"6::auto\";i:1;}',0),(52,'patrol','autopatrol','20170126222902',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:63;s:9:\"5::previd\";i:62;s:7:\"6::auto\";i:1;}',0),(53,'patrol','autopatrol','20170126232844',4,'Admin',274,'Iframe',14,'','a:3:{s:8:\"4::curid\";i:64;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(54,'patrol','autopatrol','20170126233045',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:65;s:9:\"5::previd\";i:63;s:7:\"6::auto\";i:1;}',0),(55,'patrol','autopatrol','20170126233701',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:66;s:9:\"5::previd\";i:65;s:7:\"6::auto\";i:1;}',0),(56,'patrol','autopatrol','20170126235115',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:67;s:9:\"5::previd\";i:66;s:7:\"6::auto\";i:1;}',0),(57,'patrol','autopatrol','20170126235248',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:68;s:9:\"5::previd\";i:67;s:7:\"6::auto\";i:1;}',0),(58,'patrol','autopatrol','20170126235257',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:69;s:9:\"5::previd\";i:68;s:7:\"6::auto\";i:1;}',0),(59,'patrol','autopatrol','20170126235634',4,'Admin',274,'Iframe',14,'','a:3:{s:8:\"4::curid\";i:70;s:9:\"5::previd\";i:64;s:7:\"6::auto\";i:1;}',0),(60,'patrol','autopatrol','20170127001141',4,'Admin',274,'Iframe',14,'','a:3:{s:8:\"4::curid\";i:71;s:9:\"5::previd\";i:70;s:7:\"6::auto\";i:1;}',0),(61,'patrol','autopatrol','20170127001205',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:72;s:9:\"5::previd\";i:69;s:7:\"6::auto\";i:1;}',0),(62,'patrol','autopatrol','20170127001215',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:73;s:9:\"5::previd\";i:72;s:7:\"6::auto\";i:1;}',0),(63,'patrol','autopatrol','20170127002301',4,'Admin',274,'Iframe',14,'','a:3:{s:8:\"4::curid\";i:74;s:9:\"5::previd\";i:71;s:7:\"6::auto\";i:1;}',0),(64,'patrol','autopatrol','20170127002317',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:75;s:9:\"5::previd\";i:73;s:7:\"6::auto\";i:1;}',0),(65,'patrol','autopatrol','20170127002423',4,'Admin',274,'Iframe',14,'','a:3:{s:8:\"4::curid\";i:76;s:9:\"5::previd\";i:74;s:7:\"6::auto\";i:1;}',0),(66,'patrol','autopatrol','20170127002502',4,'Admin',274,'Iframe',14,'','a:3:{s:8:\"4::curid\";i:77;s:9:\"5::previd\";i:76;s:7:\"6::auto\";i:1;}',0),(67,'patrol','autopatrol','20170127002656',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:78;s:9:\"5::previd\";i:75;s:7:\"6::auto\";i:1;}',0),(68,'patrol','autopatrol','20170127003049',4,'Admin',274,'Iframe',14,'','a:3:{s:8:\"4::curid\";i:79;s:9:\"5::previd\";i:77;s:7:\"6::auto\";i:1;}',0),(69,'patrol','autopatrol','20170130165228',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:80;s:9:\"5::previd\";i:78;s:7:\"6::auto\";i:1;}',0),(70,'patrol','autopatrol','20170130165712',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:81;s:9:\"5::previd\";i:80;s:7:\"6::auto\";i:1;}',0),(71,'patrol','autopatrol','20170130171224',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:82;s:9:\"5::previd\";i:81;s:7:\"6::auto\";i:1;}',0),(72,'patrol','autopatrol','20170130190021',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:83;s:9:\"5::previd\";i:82;s:7:\"6::auto\";i:1;}',0),(73,'patrol','autopatrol','20170130190056',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:84;s:9:\"5::previd\";i:83;s:7:\"6::auto\";i:1;}',0),(74,'patrol','autopatrol','20170130191155',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:85;s:9:\"5::previd\";i:84;s:7:\"6::auto\";i:1;}',0),(75,'patrol','autopatrol','20170130193939',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:86;s:9:\"5::previd\";i:85;s:7:\"6::auto\";i:1;}',0),(76,'patrol','autopatrol','20170130193956',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:87;s:9:\"5::previd\";i:86;s:7:\"6::auto\";i:1;}',0),(77,'patrol','autopatrol','20170130194004',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:88;s:9:\"5::previd\";i:87;s:7:\"6::auto\";i:1;}',0),(78,'patrol','autopatrol','20170130194020',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:89;s:9:\"5::previd\";i:88;s:7:\"6::auto\";i:1;}',0),(79,'patrol','autopatrol','20170130194029',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:90;s:9:\"5::previd\";i:89;s:7:\"6::auto\";i:1;}',0),(80,'patrol','autopatrol','20170130194042',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:91;s:9:\"5::previd\";i:90;s:7:\"6::auto\";i:1;}',0),(81,'patrol','autopatrol','20170130194050',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:92;s:9:\"5::previd\";i:91;s:7:\"6::auto\";i:1;}',0),(82,'patrol','autopatrol','20170130194712',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:93;s:9:\"5::previd\";i:92;s:7:\"6::auto\";i:1;}',0),(83,'patrol','autopatrol','20170130195003',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:94;s:9:\"5::previd\";i:93;s:7:\"6::auto\";i:1;}',0),(84,'patrol','autopatrol','20170130195230',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:95;s:9:\"5::previd\";i:94;s:7:\"6::auto\";i:1;}',0),(85,'patrol','autopatrol','20170130200046',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:96;s:9:\"5::previd\";i:95;s:7:\"6::auto\";i:1;}',0),(86,'patrol','autopatrol','20170131032317',4,'Admin',0,'Huawei_Wiki',7,'','a:3:{s:8:\"4::curid\";i:97;s:9:\"5::previd\";i:21;s:7:\"6::auto\";i:1;}',0),(87,'patrol','autopatrol','20170131032344',4,'Admin',0,'Huawei_Wiki',7,'','a:3:{s:8:\"4::curid\";i:98;s:9:\"5::previd\";i:97;s:7:\"6::auto\";i:1;}',0),(88,'patrol','autopatrol','20170131183559',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:99;s:9:\"5::previd\";i:96;s:7:\"6::auto\";i:1;}',0),(89,'patrol','autopatrol','20170131183615',4,'Admin',0,'Employees',4,'','a:3:{s:8:\"4::curid\";i:100;s:9:\"5::previd\";i:99;s:7:\"6::auto\";i:1;}',0),(90,'patrol','autopatrol','20170131222055',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:131;s:9:\"5::previd\";i:23;s:7:\"6::auto\";i:1;}',0),(91,'patrol','autopatrol','20170131222135',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:132;s:9:\"5::previd\";i:131;s:7:\"6::auto\";i:1;}',0),(92,'patrol','autopatrol','20170131222208',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:133;s:9:\"5::previd\";i:132;s:7:\"6::auto\";i:1;}',0),(93,'patrol','autopatrol','20170131222222',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:134;s:9:\"5::previd\";i:133;s:7:\"6::auto\";i:1;}',0),(94,'patrol','autopatrol','20170131224959',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:135;s:9:\"5::previd\";i:130;s:7:\"6::auto\";i:1;}',0),(95,'patrol','autopatrol','20170131225357',4,'Admin',0,'Team_Member',15,'','a:3:{s:8:\"4::curid\";i:136;s:9:\"5::previd\";i:103;s:7:\"6::auto\";i:1;}',0),(96,'patrol','autopatrol','20170131225504',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:137;s:9:\"5::previd\";i:135;s:7:\"6::auto\";i:1;}',0),(97,'patrol','autopatrol','20170131230225',4,'Admin',0,'Team_Member',15,'','a:3:{s:8:\"4::curid\";i:138;s:9:\"5::previd\";i:136;s:7:\"6::auto\";i:1;}',0),(98,'patrol','autopatrol','20170131230413',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:139;s:9:\"5::previd\";i:137;s:7:\"6::auto\";i:1;}',0),(99,'patrol','autopatrol','20170131230441',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:140;s:9:\"5::previd\";i:139;s:7:\"6::auto\";i:1;}',0),(100,'patrol','autopatrol','20170131230634',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:141;s:9:\"5::previd\";i:140;s:7:\"6::auto\";i:1;}',0),(101,'patrol','autopatrol','20170131230659',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:142;s:9:\"5::previd\";i:141;s:7:\"6::auto\";i:1;}',0),(102,'patrol','autopatrol','20170131230726',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:143;s:9:\"5::previd\";i:142;s:7:\"6::auto\";i:1;}',0),(103,'patrol','autopatrol','20170201011300',4,'Admin',0,'Huawei_Wiki',7,'','a:3:{s:8:\"4::curid\";i:144;s:9:\"5::previd\";i:126;s:7:\"6::auto\";i:1;}',0),(104,'patrol','autopatrol','20170201011339',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:145;s:9:\"5::previd\";i:143;s:7:\"6::auto\";i:1;}',0),(105,'patrol','autopatrol','20170201011425',4,'Admin',0,'Project_Repositories',20,'','a:3:{s:8:\"4::curid\";i:146;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(106,'patrol','autopatrol','20170201021140',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:147;s:9:\"5::previd\";i:134;s:7:\"6::auto\";i:1;}',0),(107,'patrol','autopatrol','20170201182451',4,'Admin',0,'Project_Repositories',20,'','a:3:{s:8:\"4::curid\";i:148;s:9:\"5::previd\";i:146;s:7:\"6::auto\";i:1;}',0),(108,'patrol','autopatrol','20170201182509',4,'Admin',0,'Project_Repositories',20,'','a:3:{s:8:\"4::curid\";i:149;s:9:\"5::previd\";i:148;s:7:\"6::auto\";i:1;}',0),(109,'patrol','autopatrol','20170201182906',4,'Admin',0,'Project_Repositories',20,'','a:3:{s:8:\"4::curid\";i:150;s:9:\"5::previd\";i:149;s:7:\"6::auto\";i:1;}',0),(110,'patrol','autopatrol','20170201192422',4,'Admin',0,'Huawei_Wiki',7,'','a:3:{s:8:\"4::curid\";i:151;s:9:\"5::previd\";i:144;s:7:\"6::auto\";i:1;}',0),(111,'patrol','autopatrol','20170201192457',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:152;s:9:\"5::previd\";i:147;s:7:\"6::auto\";i:1;}',0),(112,'patrol','autopatrol','20170201192508',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:153;s:9:\"5::previd\";i:152;s:7:\"6::auto\";i:1;}',0),(113,'patrol','autopatrol','20170201200113',4,'Admin',0,'Android_Source_Code_Repo',21,'','a:3:{s:8:\"4::curid\";i:154;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(114,'patrol','autopatrol','20170201201603',4,'Admin',0,'Android_Source_Code_Repo',21,'','a:3:{s:8:\"4::curid\";i:155;s:9:\"5::previd\";i:154;s:7:\"6::auto\";i:1;}',0),(115,'patrol','autopatrol','20170201201622',4,'Admin',0,'Android_Source_Code_Repo',21,'','a:3:{s:8:\"4::curid\";i:156;s:9:\"5::previd\";i:155;s:7:\"6::auto\";i:1;}',0),(116,'patrol','autopatrol','20170201204520',4,'Admin',0,'Huawei_Wiki',7,'','a:3:{s:8:\"4::curid\";i:157;s:9:\"5::previd\";i:151;s:7:\"6::auto\";i:1;}',0),(117,'patrol','autopatrol','20170201204646',4,'Admin',0,'HQ_Android_Released_Image',22,'','a:3:{s:8:\"4::curid\";i:158;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(118,'patrol','autopatrol','20170201204714',4,'Admin',0,'HQ_Android_Released_Image',22,'','a:3:{s:8:\"4::curid\";i:159;s:9:\"5::previd\";i:158;s:7:\"6::auto\";i:1;}',0),(119,'patrol','autopatrol','20170201211654',4,'Admin',0,'HQ_Android_Released_Image',22,'','a:3:{s:8:\"4::curid\";i:160;s:9:\"5::previd\";i:159;s:7:\"6::auto\";i:1;}',0),(120,'patrol','autopatrol','20170201211710',4,'Admin',0,'HQ_Android_Released_Image',22,'','a:3:{s:8:\"4::curid\";i:161;s:9:\"5::previd\";i:160;s:7:\"6::auto\";i:1;}',0),(121,'patrol','autopatrol','20170201212744',4,'Admin',0,'HQ_Android_Released_Image',22,'','a:3:{s:8:\"4::curid\";i:162;s:9:\"5::previd\";i:161;s:7:\"6::auto\";i:1;}',0),(122,'patrol','autopatrol','20170201212929',4,'Admin',0,'HQ_Android_Released_Image',22,'','a:3:{s:8:\"4::curid\";i:163;s:9:\"5::previd\";i:162;s:7:\"6::auto\";i:1;}',0),(123,'patrol','autopatrol','20170201213822',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:164;s:9:\"5::previd\";i:153;s:7:\"6::auto\";i:1;}',0),(124,'patrol','autopatrol','20170201213937',4,'Admin',0,'HQ_Android_Released_Image',22,'','a:3:{s:8:\"4::curid\";i:165;s:9:\"5::previd\";i:163;s:7:\"6::auto\";i:1;}',0),(125,'patrol','autopatrol','20170206233210',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:167;s:9:\"5::previd\";i:164;s:7:\"6::auto\";i:1;}',0),(126,'patrol','autopatrol','20170206233227',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:168;s:9:\"5::previd\";i:167;s:7:\"6::auto\";i:1;}',0),(127,'patrol','autopatrol','20170206233255',4,'Admin',0,'Model_&_Release',23,'','a:3:{s:8:\"4::curid\";i:169;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(128,'patrol','autopatrol','20170206235829',4,'Admin',0,'Model_&_Release',23,'','a:3:{s:8:\"4::curid\";i:170;s:9:\"5::previd\";i:169;s:7:\"6::auto\";i:1;}',0),(129,'patrol','autopatrol','20170207013641',4,'Admin',0,'Huawei_Wiki',7,'','a:3:{s:8:\"4::curid\";i:171;s:9:\"5::previd\";i:157;s:7:\"6::auto\";i:1;}',0),(130,'patrol','autopatrol','20170207013659',4,'Admin',0,'Huawei_Wiki',7,'','a:3:{s:8:\"4::curid\";i:172;s:9:\"5::previd\";i:171;s:7:\"6::auto\";i:1;}',0),(131,'patrol','autopatrol','20170207180505',4,'Admin',0,'HQ_Android_Released_Image',22,'','a:3:{s:8:\"4::curid\";i:173;s:9:\"5::previd\";i:165;s:7:\"6::auto\";i:1;}',0),(132,'patrol','autopatrol','20170207180521',4,'Admin',0,'HQ_Android_Released_Image',22,'','a:3:{s:8:\"4::curid\";i:174;s:9:\"5::previd\";i:173;s:7:\"6::auto\";i:1;}',0),(133,'patrol','autopatrol','20170207180536',4,'Admin',0,'SenForm',24,'','a:3:{s:8:\"4::curid\";i:175;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(134,'patrol','autopatrol','20170209183618',4,'Admin',8,'Sidebar',6,'','a:3:{s:8:\"4::curid\";i:176;s:9:\"5::previd\";i:168;s:7:\"6::auto\";i:1;}',0),(135,'patrol','autopatrol','20170209191229',4,'Admin',0,'Tools',25,'','a:3:{s:8:\"4::curid\";i:177;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(136,'newusers','create','20170210194325',5,'V00725852',2,'V00725852',0,'','a:1:{s:9:\"4::userid\";i:5;}',0),(137,'patrol','autopatrol','20170210202856',4,'Admin',0,'Team_Member',15,'','a:3:{s:8:\"4::curid\";i:178;s:9:\"5::previd\";i:166;s:7:\"6::auto\";i:1;}',0),(138,'patrol','autopatrol','20170210225242',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:179;s:9:\"5::previd\";i:145;s:7:\"6::auto\";i:1;}',0),(139,'patrol','autopatrol','20170210231254',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:180;s:9:\"5::previd\";i:179;s:7:\"6::auto\";i:1;}',0),(140,'patrol','autopatrol','20170210231416',4,'Admin',0,'Sample_Devices_Tracking',16,'','a:3:{s:8:\"4::curid\";i:181;s:9:\"5::previd\";i:180;s:7:\"6::auto\";i:1;}',0),(141,'patrol','autopatrol','20170210231444',4,'Admin',0,'Model_&_Release',23,'','a:3:{s:8:\"4::curid\";i:182;s:9:\"5::previd\";i:170;s:7:\"6::auto\";i:1;}',0),(142,'patrol','autopatrol','20170210231610',4,'Admin',0,'Project_Repositories',20,'','a:3:{s:8:\"4::curid\";i:183;s:9:\"5::previd\";i:150;s:7:\"6::auto\";i:1;}',0),(143,'patrol','autopatrol','20170210231630',4,'Admin',0,'Android_Source_Code_Repo',21,'','a:3:{s:8:\"4::curid\";i:184;s:9:\"5::previd\";i:156;s:7:\"6::auto\";i:1;}',0),(144,'patrol','autopatrol','20170210231707',4,'Admin',0,'HQ_Android_Released_Image',22,'','a:3:{s:8:\"4::curid\";i:185;s:9:\"5::previd\";i:174;s:7:\"6::auto\";i:1;}',0),(145,'patrol','autopatrol','20170210231725',4,'Admin',0,'Tools',25,'','a:3:{s:8:\"4::curid\";i:186;s:9:\"5::previd\";i:177;s:7:\"6::auto\";i:1;}',0),(146,'patrol','autopatrol','20170210231950',4,'Admin',0,'Team_Member',15,'','a:3:{s:8:\"4::curid\";i:187;s:9:\"5::previd\";i:178;s:7:\"6::auto\";i:1;}',0),(147,'patrol','autopatrol','20170210232018',4,'Admin',0,'Team_Member',15,'','a:3:{s:8:\"4::curid\";i:188;s:9:\"5::previd\";i:187;s:7:\"6::auto\";i:1;}',0),(148,'patrol','autopatrol','20170210232106',4,'Admin',0,'Team_Member',15,'','a:3:{s:8:\"4::curid\";i:189;s:9:\"5::previd\";i:188;s:7:\"6::auto\";i:1;}',0),(149,'patrol','autopatrol','20170210232150',4,'Admin',0,'Team_Member',15,'','a:3:{s:8:\"4::curid\";i:190;s:9:\"5::previd\";i:189;s:7:\"6::auto\";i:1;}',0),(150,'patrol','autopatrol','20170210232226',4,'Admin',0,'Team_Member',15,'','a:3:{s:8:\"4::curid\";i:191;s:9:\"5::previd\";i:190;s:7:\"6::auto\";i:1;}',0),(151,'patrol','autopatrol','20170210232333',4,'Admin',0,'Team_Member',15,'','a:3:{s:8:\"4::curid\";i:192;s:9:\"5::previd\";i:191;s:7:\"6::auto\";i:1;}',0),(152,'patrol','autopatrol','20170210232347',4,'Admin',0,'Team_Member',15,'','a:3:{s:8:\"4::curid\";i:193;s:9:\"5::previd\";i:192;s:7:\"6::auto\";i:1;}',0),(153,'patrol','autopatrol','20170210232600',4,'Admin',0,'Team_Member',15,'','a:3:{s:8:\"4::curid\";i:194;s:9:\"5::previd\";i:193;s:7:\"6::auto\";i:1;}',0),(154,'patrol','autopatrol','20170211014823',4,'Admin',0,'Model_&_Release',23,'','a:3:{s:8:\"4::curid\";i:195;s:9:\"5::previd\";i:182;s:7:\"6::auto\";i:1;}',0),(155,'patrol','autopatrol','20170211014844',4,'Admin',0,'Model_&_Release',23,'','a:3:{s:8:\"4::curid\";i:196;s:9:\"5::previd\";i:195;s:7:\"6::auto\";i:1;}',0);
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
INSERT INTO `module_deps` VALUES ('jquery.spinner','vector|en','[\"resources/src/jquery/images/spinner-large.gif\",\"resources/src/jquery/images/spinner.gif\"]'),('jquery.tablesorter','vector|en','[\"resources/src/jquery/images/sort_both.png\",\"resources/src/jquery/images/sort_both.svg\",\"resources/src/jquery/images/sort_down.png\",\"resources/src/jquery/images/sort_down.svg\",\"resources/src/jquery/images/sort_up.png\",\"resources/src/jquery/images/sort_up.svg\",\"resources/src/jquery/jquery.tablesorter.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),('mediawiki.action.view.postEdit','vector|en','[\"resources/src/mediawiki.action/images/green-checkmark.png\"]'),('mediawiki.feedlink','vector|en','[\"resources/src/mediawiki/images/feed-icon.png\",\"resources/src/mediawiki/images/feed-icon.svg\"]'),('mediawiki.helplink','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki/images/help.png\",\"resources/src/mediawiki/images/help.svg\",\"resources/src/mediawiki/mediawiki.helplink.less\"]'),('mediawiki.htmlform.styles','vector|en','[\"resources/src/mediawiki/htmlform/images/question.png\",\"resources/src/mediawiki/htmlform/images/question.svg\"]'),('mediawiki.icon','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki/images/arrow-collapsed-ltr.png\",\"resources/src/mediawiki/images/arrow-collapsed-ltr.svg\",\"resources/src/mediawiki/images/arrow-expanded.png\",\"resources/src/mediawiki/images/arrow-expanded.svg\",\"resources/src/mediawiki/mediawiki.icon.less\"]'),('mediawiki.legacy.shared','vector|en','[\"resources/src/mediawiki.legacy/images/ajax-loader.gif\",\"resources/src/mediawiki.legacy/images/spinner.gif\"]'),('mediawiki.skinning.interface','vector|en','[\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.svg\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.svg\"]'),('mediawiki.special','vector|en','[\"skins/Vector/skinStyles/mediawiki.special.less\"]'),('mediawiki.special.userlogin.common.styles','vector|en','[\"resources/src/mediawiki.special/images/icon-lock.png\"]'),('mediawiki.special.userlogin.login.styles','vector|en','[\"resources/src/mediawiki.special/images/glyph-people-large.png\"]'),('mediawiki.special.userlogin.signup.styles','vector|en','[\"resources/src/mediawiki.special/images/icon-contributors.png\",\"resources/src/mediawiki.special/images/icon-edits.png\",\"resources/src/mediawiki.special/images/icon-pages.png\"]'),('mediawiki.toolbar','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.toolbar/images/en/button_bold.png\",\"resources/src/mediawiki.toolbar/images/en/button_extlink.png\",\"resources/src/mediawiki.toolbar/images/en/button_headline.png\",\"resources/src/mediawiki.toolbar/images/en/button_hr.png\",\"resources/src/mediawiki.toolbar/images/en/button_image.png\",\"resources/src/mediawiki.toolbar/images/en/button_italic.png\",\"resources/src/mediawiki.toolbar/images/en/button_link.png\",\"resources/src/mediawiki.toolbar/images/en/button_media.png\",\"resources/src/mediawiki.toolbar/images/en/button_nowiki.png\",\"resources/src/mediawiki.toolbar/images/en/button_sig.png\",\"resources/src/mediawiki.toolbar/toolbar.less\"]'),('mediawiki.ui','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/forms.less\",\"resources/src/mediawiki.ui/components/utilities.less\",\"resources/src/mediawiki.ui/default.less\"]'),('mediawiki.ui.button','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/buttons.less\"]'),('mediawiki.ui.checkbox','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/checkbox.less\",\"resources/src/mediawiki.ui/components/images/checked.png\",\"resources/src/mediawiki.ui/components/images/checked.svg\",\"resources/src/mediawiki.ui/components/images/checked_disabled.png\",\"resources/src/mediawiki.ui/components/images/checked_disabled.svg\"]'),('mediawiki.ui.input','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/inputs.less\"]'),('mediawiki.ui.radio','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/images/radio_checked.png\",\"resources/src/mediawiki.ui/components/images/radio_checked.svg\",\"resources/src/mediawiki.ui/components/images/radio_disabled.png\",\"resources/src/mediawiki.ui/components/images/radio_disabled.svg\",\"resources/src/mediawiki.ui/components/radio.less\"]'),('skins.vector.styles','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.animation.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.mixins.rotation.less\",\"skins/Vector/components/common.less\",\"skins/Vector/components/externalLinks.less\",\"skins/Vector/components/footer.less\",\"skins/Vector/components/navigation.less\",\"skins/Vector/components/personalMenu.less\",\"skins/Vector/components/search.less\",\"skins/Vector/components/tabs.less\",\"skins/Vector/components/watchstar.less\",\"skins/Vector/images/arrow-down-focus-icon.png\",\"skins/Vector/images/arrow-down-focus-icon.svg\",\"skins/Vector/images/arrow-down-icon.png\",\"skins/Vector/images/arrow-down-icon.svg\",\"skins/Vector/images/bullet-icon.png\",\"skins/Vector/images/bullet-icon.svg\",\"skins/Vector/images/external-link-ltr-icon.png\",\"skins/Vector/images/external-link-ltr-icon.svg\",\"skins/Vector/images/page-fade.png\",\"skins/Vector/images/portal-break.png\",\"skins/Vector/images/search-fade.png\",\"skins/Vector/images/search-ltr.png\",\"skins/Vector/images/search-ltr.svg\",\"skins/Vector/images/tab-break.png\",\"skins/Vector/images/tab-current-fade.png\",\"skins/Vector/images/tab-normal-fade.png\",\"skins/Vector/images/unwatch-icon-hl.png\",\"skins/Vector/images/unwatch-icon-hl.svg\",\"skins/Vector/images/unwatch-icon.png\",\"skins/Vector/images/unwatch-icon.svg\",\"skins/Vector/images/user-icon.png\",\"skins/Vector/images/user-icon.svg\",\"skins/Vector/images/watch-icon-hl.png\",\"skins/Vector/images/watch-icon-hl.svg\",\"skins/Vector/images/watch-icon-loading.png\",\"skins/Vector/images/watch-icon-loading.svg\",\"skins/Vector/images/watch-icon.png\",\"skins/Vector/images/watch-icon.svg\",\"skins/Vector/screen-hd.less\",\"skins/Vector/screen.less\",\"skins/Vector/variables.less\"]');
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
INSERT INTO `objectcache` VALUES ('Sen_wiki_DB:MWSession:h31pgq4guft49d6e6njtcculr4423ipr','Mé¡Ç0ÜﬂeO\0à†›—ã@IºxôÆíadcbxw7ıÿØˇˇµ\n\"x2ƒ ¥Íïê\nxé+\rˆjÜa‡Sv÷‹I£ía±ë°&u§öNd&”û6∆‘Ñü©¯ãá…Øû}›π€∏≈¿hwZHÇ@æyê´ßƒz•©±ùàãXl∞9{˘˘›rOä´±‹ñeqòi\nYdo„U\ZÈ2YL÷õ©*‘˚°üO;÷°e‚µWÑr_','2017-02-16 01:12:43'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:0bab166e74f0d50a476fcc6b59bf4c52f3fb057b','+∂24±R22047020326625U≤\0','2017-03-06 23:32:55'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:1179a9d962abaf9c9a7dbe1c6ca54a281e7e49e1','+∂24±R2204702∞4¥063¥P≤\0','2017-03-09 18:36:18'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:135b03b804d2919f63ee3d1f020a45e2f62d7141','+∂24±R2204702402“ÊJ÷\0','2017-03-10 23:17:07'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:186d0622eab3409bb281106e24a82b47546c8773','+∂24±R2204702∞4¥442≤T≤\0','2017-03-09 19:12:29'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:199e4acb9bd27a84af295a7f147e9f4a72c53783','+∂24±R22047024404±01Q≤\0','2017-03-11 01:48:44'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:1d935850d6ebcdae2a2c3a7f24076a50fe47f238','+∂24±R22047024026472U≤\0','2017-03-10 23:17:25'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:234abbb8d1743c7865b2db92f8c1fe3ead206b7a','+∂24±R22047024026414W≤\0','2017-03-10 23:14:17'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:35480bb6ad31d82788b982e364a6fdecbcc24f91','+∂24±R22047024026434T≤\0','2017-03-10 23:16:11'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:36d4a14e17acaf6a123382efb0e788ed10421b78','+∂24±R22047024026230P≤\0','2017-03-10 23:26:00'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:4acca7fc35ad3b47ecc3011fa4e89b502b6793cf','+∂24±R22047024026436T≤\0','2017-03-10 23:16:31'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:5ac5e01b4980e5621025a49edc2cf8900fb65830','+∂24±R22047024526044P≤\0','2017-03-15 23:01:10'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:5bd9738726eaebf4dbd5f688b0a47b5aa77efc34','+∂24±R220470207¥0056S≤\0','2017-03-07 18:05:36'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:83966aa3b758deedd5717d5688537e7dc1b2102d','+∂24±R22047024026472U≤\0','2017-03-10 23:17:25'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:88f7313a58c80cd522a7e31b506b886ae984e226','+∂24±R22047024026434T≤\0','2017-03-10 23:16:11'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:906140d54ed4d9061d5769dd24a78a86ce08c1f2','+∂24±R22047024026436T≤\0','2017-03-10 23:16:31'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:a91337fe1053757fa7ee9298f9b721a7776e5966','+∂24±R22047024526044P≤\0','2017-03-15 23:01:10'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:b83f18bb7cc8c50fd322d1dd0c1f29e3c83d8b88','+∂24±R2204702402“ÊJ÷\0','2017-03-10 23:17:07'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:bad40e7f1868e43a506f86621f31a5251af264d7','+∂24±R22047024026414W≤\0','2017-03-10 23:14:17'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:c2ed8b92f9d3c97a9a3cc9e30005d5232659844e','+∂24±R2204702∞4¥063¥P≤\0','2017-03-09 18:36:18'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:d3037086ca38af3608fc8dbbe6bd128245cd1203','+∂24±R22047024026230P≤\0','2017-03-10 23:26:00'),('Sen_wiki_DB:jobqueue:htmlCacheUpdate:rootjob:eda8455284cdfd2ef043590df0dba5d8e5f72897','+∂24±R22047024404±01Q≤\0','2017-03-11 01:48:44'),('Sen_wiki_DB:messages:en',']íMoÇ@@Ô˝=ò4ëo\\O‘1Q±`[{\\`ƒ≠¿íÌ°ÙøwñòF=fﬁºô\r;0j”üñzT[1^7¨\0m⁄R›†\Z	OÏ8˘‡GÆòKµÑÁê2©2”õ†Ú0\"5;ÛÇu\\‘£—uÈØ3U‹´»\n™$Ø2ULX’î@^‡Ã3h…V≤Ï»Î≈{§Ïï»°$è$ÜXh›%m§¯Ç¨C‘àñwBrú“ﬂbÂ˘u.œI\"N22√IC›{4¯·ÎÀÂ¥ú,*º:l∏√WQ™cá∑2®ªÏ¿Í⁄ßì,˚¢îîç⁄EØº‰$„Yà¡6äñœ—£•øûø˘Û πÏÊ=àìE¥÷¶ú\ZH,™Ö~´¬eöv\nñ„03›;∂´CÍô.Ltñµ˜<Cy’Ç›f\00∆∫;6∂ai”ﬂ?','2038-01-19 03:14:07'),('Sen_wiki_DB:pcache:idhash:20-0!*!*!*!*!*!*','mVˇn‚8ﬁøÛﬁHïÓNú@)\rm•nl9µ›˚seí)Òí»6nµ“=¬=„=…çáÜ\0f∆üg>3fx~‡éòê Ü+ïØît¸‡ßŒw9Öçr˚2∏Ëv˜R±Y$LòîWÓö/xaêô∞û,IX.9>ª◊Œ•˙+æ&ØàM^ÿúÀ˛.å#DYg\"™⁄∆êg‰&äHYÿÒKÏ†¢kÅí†1*~c∑´¶iFæ\0πb…S0D%PÀdä˘ıÂLê>Ò7Å©)¬+7V*Z-è6=ﬂo∂{ÕsØ55ŸïNO6Û8wâY3√ÙA\\π‘%k©¯ ı(=qI|´+∑{N]‹∏ÿ@oû„◊ÁFÉ8/∞çH¬ó\\ôÑrnYCD_B@|ÍùSﬂÎRÍ˚g›¬G`ìs±\rHØ€°‘π€¶l…C$=Uê™Äº±DÇs;z5d%Ÿëhì“ëÄaët∆¿í˜≈Œ=¬\\D\"˚ô Ô\\rÖ•Y§èv•˜Ë\"5Êµ:á;¶—ôTˇ˝Û/V¿“à4LV\'˘ﬂòBá∂|zqÓù˘d∂U ù),Û—Û’k≥Åı∏Gd§\"UÚ,%‰*FˆZÍ‹or@Î;ê‹àõº≠“PÈ(õû…Œi4Æ{(SÅ0òôÅ˙\05táD~;9] ”ê%â<U6ÕﬂƒA\ZOæÙ%ÊÂëi®L±§≤…ÑΩÉ&†L*4\'ªÊ*&ÿí	§ﬂuc}ø˚‰∆(f2|⁄†üˇ¯xM§NM*∂ÃkÇ1N˙±\0Ø◊vàŒB7≥áΩº|bÈ|Öx‚ÈB∫}–‡Á/ÙyËª≈™Êô‡Pw“àáLe¢Í†zNpï@9,|¥ÿé1ç2≤`2ËÍ≠k[\Z\0Kf’ÓWÏÉ®‚9◊©,1˘jtç<Å	0∆√\\u’Øãæﬂ‡PHYRœ‡Ã‘Ü>Õ˝1F∞_\'`‘„ˆgÌ€5è<Ç#.]–KˆUbªg}\rP8|ù˜s≠®g[X\'°‡π™˙⁄>µ›_¶] €,}„ÛoL‘Ÿ,¸cñUº@«_L§<ù◊¨∂Æ:À˜W÷5Õ†˝≥¿Î[™‰sjO<z’tx˚8}~“\"@&‹˛N9V¬•2≠í©ﬂˆ∫uKX\\~üÍŸÌÌVÿÜ√◊A…≥è˚TΩœ>iŸ¬fî%<‹V∂o”É¿õP4à‘„˜bµñÃÄ∏cä}DA}“c~lH€”¨áõ+†.ç£ë\rùäÀÓ≤ù™ak‘U-Ó¬µÖW„Ú‹Np=ìM-x≠s‰à]¸x˙SåÁæ≠pın®YO⁄Ì\Z\0é¸bﬁ€qØá¯JßD±c›†¯˚(Âê-ØÇê#u\"v£‹\\{´}ª∫Sî–9XX\\!Â’ané£€{öQ;~º)ﬂ1Û[îﬂ‚ÿg;≠äÂ!a’6l{ì¬rÇyç·}Ä˝“/à´>≥ÕMƒrxo˛:∏˝(º<ÙÌ4x≠*]cË6˝BöYfƒÂ5ªÕŒÆWÕﬂê©ï^•WÌ≠„ñ¿&Æ‹R{›“:∂óíNYÎµ˚ø˛','2017-02-17 00:22:56'),('Sen_wiki_DB:pcache:idhash:21-0!*!*!*!*!*!*','mV·n‚8ﬁﬂy\no§JwßN†@C[©G€-´∂†B˜~Æ‹d >BbŸ¶Ö[≠¥èpœxOrc\'°!@ÖTy∆ﬂÃ|˛fÜq‡˘Å;aRÅØµXk7Ë¯¡úÓjÌT–;?‹q5„Bdí\0S@$Ã%®ò∞πIXJn#ÆõŒEK\\°ÎüK∂¢dxÈ∆Zã†’Úh”Û˝fªﬂÏy≠Ëi∂ñ!≥ûAd™)b·{Ì5ì»Kó∫‰ùG:æt=JO\\_ƒ˙“Ìˆ®{u— c\\ŸòŒ≈ÁFÉ8O>ôêÑØ∏∆E&µ3da—|Ò©◊£æwÊSÍµin#∞\\n“Ôv(un∂)[ÒêÑY™!’ô≥DÅ3úºX≤VlÅH¥Iiü(@∑H9œ¿íÛ˘Œ<¡\\dÇRô$o\\qç•X9FYõ]d«~ˆ]êÇdŒÙ√;S˙ø_ˇb,çO√dç~äˇÉ)thÀßÁ=,ñºn5(g+ë \Zar±^amÖc›ÔY•âEU<KIB«»^´Cù€ç\0<}\"¨n»|ùÜ⁄xÈŸÏúF„ )e&3≥P†ñÆ¸ë»o\'ß+u\Z≤$Qß∫HÛwqê∆ÇÛ%ˆ„ëiËL≥§d ﬁ¿P&⁄ó}Á:&Kÿí)§ﬂﬂ˘íø˘3÷(f*|ØA?ˇÒÒGë&5•ŸJ‘cçÃb<\"^ø„ìÖÈØÉMÛ¿“≈\Z%¿”•r,†¡èühÛ–6ƒ™ô‰P7å“àáLg≤j†¶πN†ÏCÒØ”Hf8ob∫áòˆ1ˆÆ	_kA\nB´Á~Â|U,=ìŒ\n®z˜Òé\'0&√x,ÃsWÌ¶€\rÇî%ıŒl}h3¸c{v\nVAÓ‡5†É‚Œ=è‡à…Ùî}A•Ä‹ÓùﬁãF(û\næ…˚1ã÷	‘≥ÕOß°‰BWmÌõﬁÓ_3¶Øjò•sæ¯∆dùÕ|~ﬁgYµ@ú´øòLy∫®ùu’Y6S¥0Õ≤%˚k‡\r\n™&2 ıûÄÃ≠Ÿxx?{|0\"@&‹¡N=ÖåKuj¶~€Î∂©[¬‚ı€îΩ&ÌEÀœ∆„óQ…≥è˚T]üåta3…n+·€Ù¿Ò:4C\r¢ı¯˝_£%;$nòfûGPÃ®∂C§ÙÌõ˝Â!«v\r‰¶¢7≤arCqŸ·m[äÓªΩ£Æj~ÁnQx’Oàbäõπlk¡≠…ë#tÒÎôo>¢EÖ˚∑wÉ˝»}z–n◊\0pÏÁ3ø˘fêÔ°tJîb¥[•¥Â:8\09ÇQ\'b7ŒÌäÿªÌ∑;y	ùÉã˘\Z)◊á›G√{ÜÑ¢ˆ¸∏-ﬂ0Û! o˘7óÿg;≠äÂ.a’6l{S·\Z9¡ºû·mÑ˝4»â´9>≤ÕuƒÑqºµ?‹AåûÓ≈4x©*›`ò6˝RŸYf≈Â5ªÕŒÆWÌOëY!ΩJØõ«-Å≠_“\0{›ÚÙπXL&md≠ﬂ¸¸','2017-02-16 20:01:30'),('Sen_wiki_DB:pcache:idhash:23-0!*!*!*!*!*!*','mVmn„6›ﬂ:#`ãm€§¨(éúÿ:I„\"ÜÌ§ËØ#çm6≤$êTw±@è–3ˆ$Rí#Àëa¿Êá3èoﬁË>d^ËN∏T Ôù⁄\r}/¸Æ¬£–]œ·MªCÇ tOÛÛπ»Cr˙$IÔ‹a]ÚgVê &:#ëÆÅl≤BxÀ!“∏>√û∆dºÊK !ïÆ#x]2ÖÖµ\"|°˜ΩÄ‹àÖ>pN{˘9ûx*íØÅ(ùπ+≠Û∞◊c¥À<Ø€tèYo	z\n	pè^ª˘*wâ›Úî…‰ôK]Ú*bΩ:s•ü]≤±\\È378¶Ó˘iØånœsN:‚‹¡ÎdB±öH»3©ùèV¶N±ÜêxîSèî2œÔó6S≥êõêüRÁbìÚµàHî•\ZRíO8£…ÉçA\nÖhÑÑv)=!\n–-VŒx“63∫5O0ôE†T&…ãP¬ úf1‡)Ö9#@dÏ≥Î∫Ñ$ﬂs¶Ôﬁô“ˇ˝Û/V`.J§QR†üc\n>ÌyÙ‰òy‰i£A9sXÁâπi.ó≈\Zk´€~◊à2‡]€®Jd)â!◊+DØÁSÁÇ´/@rK=≤(“HØ*=õù”Èú;’•Ã%Ü¡Ãl®˜†ÆÚí»óœákuÒ$Qá∫JÛg„  ü	>Ê%ˆa§C::”<i2„/`\0®ìäÏÕæ\nΩ\"œ∞!3HøΩägÒÌ‚◊0∑∂Pƒ+ÆV°◊Ô–É_ﬁ?ñÒ&5•˘:o∆\Z%òƒDLÿI‡ìÖi5Êcﬂ›tY nD˙¨‹!i¯˝⁄⁄FX’2ì⁄Üq\ZãàÎL6\r‘t±–	‘≠Ã∞Øoë	˘âTçcñsjÎ4ª∑¬±πÓ5÷«q√rl≤0}ﬁÙ‡‚ïH`\\F´˚‹‹r”nÍΩ|√ˆOy“Œ‡»ñÖ6˚G``´Œ¿«>Ö¥™o}-b¯¿d\n∫À~CÇ†ŒÏ¨^è«»ôF|ì7U$–Œ∂\\ùER‰∫iÎø€Ùfwõ1˝ÆFY∫ÀG.€hñ {ùeÕO–ó©Hó≠’™Æ6 ó(úïiû=É±?ÖlXA5ëYRÔ∆ÏöﬂèÆÁ∑7ÜàÑ;‹í¶boM äƒå2‡˚n∑_¶¸)ÅxÁ¥rÌ˛˛a\\„Ï!≈>5Õ\'√Xxõdâà6ç„˚tœÒkd¥‚=ˆxÉ=_√%´\r\\Ûwœ¢ﬁÖüZÌ®}fÚ1ƒÿ™©+ùΩ\rìíÀj∂˘Ì—]∑W‰’Æ£nUx”/œ+Ò6rlk¡y+#¯eÊ[*Û∞™pw˜Vœ?ÿO˜Ù˚≠\0®ˆ•‘WJoÙ{\'ä_G©›FÒv£‘˙ZOÅΩ ƒh±Uq;vv{’nø,¡ﬂ€XNèzjÿ°Ò·ÒÃÄPÖh]?…Ã|ÑÙ{˛ãGœÿg[ÆÓìÂ*·Õ6Ï≥=èæÙà	Ê5Öó1ˆ√›∞ÆÂxÀﬂæ∆<7éóˆ≠¡∆·¯ÓjX©¡CìÈ&Üi”Gê jô%Î]€´ˆ\rd^QØ—´’¿qÎ¿÷Ø>“fAΩ:≠ÊëIQ;	Ü?˛','2017-02-17 00:12:43'),('Sen_wiki_DB:pcache:idhash:25-0!*!*!*!*!*!*','}V·n‚8ﬁﬂy\n7R•ªS\'P†I[iè∂WNmAÖÓ˝\\π…@|Ñ$≤\rÖ[≠¥è∞œxOrc\'iìÄÑy∆ügæ|ÛôâÁ∏û=eBÇòlT∂Q∂◊sΩo“;˜Ïıv ˆ•7=˚2ªûÛÃ#œ∞ #¬\nÅ-à=Åê´Î≤ì]c÷%_∂\"EpeGJe^ß„–∂„∫ÌÓ∞=p:KPÛ4çÂ8Y§Ì, lb6º¶\"qeSõºÒPEW∂CÈ©M\"‡ÀH]Ÿ˝µØ/;9˙µ9Õ∫<iµàıo”)â˘ö+\" KÖ≤F,à $äØ¡#.u‘uŒ›.u\'èÿe\\Ï=2Ï˜(µnˆ	[ÛÄi¢ QY∞XÇ5öæ≤ëlâH¥MÈëÄi°¥ûÅ≈ˇûb-\"\r@ Tê-ó\\aEI\Zû≤—gÙëÛ©ß.!¡íÈGv*’ø?~b,		OÇxÉyíˇÉ%Ùh«•lñºÓHkÎ,F4¬ƒr≥∆ﬁäƒfﬁ=≤RÉ*yöê2!{ùµnw‡ÍHfƒBõ$P:´(œTgµZ◊VÒRÊa∞2ıjË _˘ÂÙl-œ«ÚLe˛j!“xJ£(1á¥HK•ä≈ïCflöÄ≤®¿ºŸ7Æ\"≤Ç=ôAÚıçØ¯◊õﬂΩÃƒ<FLFû{ﬁ¢\'ø}|â&Ró&[g\r¡ò†\0˝±gÿ∑àÆBá”√Iy`…rÉx‡…J⁄>Û®˜Ì;∆åç∞´e*84„$‰S©®®û;Æb(á—Lã~ÓÎ£\ZGò\ry’u∑≤>+ëÅ>zç≈V≥q¿◊w<Ü0DìLø⁄j\\7yª√âOX‹¨‡‹ÙÇ1Õı1p>g`‘b˚Øıã=˜<Ñ#!›–S˙™≠•∂z,£P*¯∫Ó«4‹ƒ–¨6_ùÇg™\ZÎ~ƒ‘ææMá˛î£4YÂ&ölÊyü¶’/0	Oñç’¢Ø&À∑ËïEhûÆ@«_=«/®öä4°jb—ªÊì—˝¸ÒAã\0ô∞˝w•í-ïX(ó∫]g‡û€%,nøMÿkaÌ¥|m2yó<ª(±O’˚‡ìñ)Ï¶iÃÉ}Â¯.=H¸hÉ@=Ó Wk…¬\rSÏ#ÛÍÉ∂ıgceÓP_Prl,?7ìVÄŸ»F12∆âı≥KÎio®´£y˝z^ñé≠=ÿÙÇ◊\"Gé∏◊«ü£π˚Eáı›Ô&~d?=Ëv\0hÒπøˆÆMªÜ“+Q\n7(n•4’“˙@é`4âx∑ns‘vª≈Ó^ﬁBÔ`c~eîWÖπ)éÔh\nà∆Î«õqãïèP~´øY∞¬9{◊Í°XÓbV√Æsê1À ÿ \'X◊3l«8O~N\\#ÒëÌ>á,”â∑ÊØÇÌáﬁ¯ÈŒ/‹‡•™tç°«ÙiºÃàÀi˜€Ω˜Y5;ÊÖÙ*≥Z‹2v	lÚ #5∞”/WüãKHóç¨\r˚˛˜ˇ\0','2017-02-16 23:01:11'),('Sen_wiki_DB:pcache:idhash:7-0!*!0!!en!*!*','’YÈn€FŒo=≈ZEÇ6à,:l 1ê⁄NÌ¬áb9…OaMÆ≠ç)í‡Æ|40–GË3ˆI:{I$E≤1]†â\0€‘ÓÏ˚fvgv∆gûÌxÌ1NIœ<Y∂◊sºØÃÎ{Ì˘πÁÌÛ‹˛–ı⁄;Û;è«˛ÓN@o\rﬁ∂·K˘!fL=Áf8Â!Å°ô≥ªGúDúÌt·ÀNÑv[;ã~Ö4≥>$∑$ÏÿÅıq‘±AF≥î\\ΩmˇtA|zBÊó$Öañ‡(≥8Z®q{ß+fvQQÄ.ªBR:¥‡N√OHøçìE3¡Û$$”}rK}¬¶)ˆoht]çÃ©G¶Ù!≠}OGÈfQûƒ	ßõŒ`zNBÇ©∆Á÷„ìö–+@9BZ◊”±ı≤ÿ∆i¸∆Y3 „îV\rØWO+CYeO«◊œ‚{iLÉÈ$^§>ôÓÅ$÷jå˝zåZ!R\nëP(Ò>Á ãÛ√‘@’é	¶Gs|]„ÎA=–√»`5\Zë‘¯t§√‹	é„∞∆≈√9ªbı:ÇÆå$:™tuåjâ∏ìS3øÎÃB\Zë∂åQ˘pb0vÁ$†¯éﬁ–.çrøôÃínV…¿¶ñ#≥<V2¿Ä6ÆmÅ∞‡€ˆ·ﬂä>√+⁄HOΩm€%˘•ª2t~©Í®TK∞jô![új¢V##85\n\Z§,\0÷öB-xôY`åP+¬b#ÚnÖ≤Üƒ+¢k-˜“5Ü~YÑ≠äªç–´“÷–5Òª÷\nïÎå%™‚x]Ñodë~ù∆ÜV©Àµf©^hÏRô6j3J#ÀjU64çIOıπ@\n-≥ÄZ¢SS#*√ÂÚRÿ≠ùçNµN…›xåB:ß•‡ˇî∑ˆ∞?ŒúŒâáÀZé›w\\À∂∂’\"˜	M<¥5ËYVkˇ!¬sÍ#_]«=tÖCFZ{„èRZ0@È!k”≤˙^¨uNpX3=,iëö≈)∫•pfQ$6©/ƒ;úA◊∂‰\'/{M\"í‚¢¥Î¨§c∆ˇ˛Û/†Ä£\0—» «ËC◊±∂á@]>p¬Zí(C8Ω^ÃÅ[Ö‹!Ωû∆ëT Ñcí†Ïˆ¨÷¡}B`ÙñÄªD=ÑÆërüFg	p≠NgÈ»N`R’J©4ór˙˘Âõ9{„„0do∏Ü˘KÙÄ_\"¯à…èç:®√cé√ÃK&¯ñ˛î/={G˘›ê4!—TÏ–È˛Ø^\"Á<\ZÃ0õy√éµÒz√⁄ÿ ¸}çÑ2∆!øˆãúLâp ‡áeo[HÄÂü›ÉZG◊ÿ«4∫aÌˆ,ÔÎ#ÃŸ0∑§ÆUB»OEı1ƒÒÏÑ%*Kq|Ly)D≥gÜ‚çÊM∂˜ïz<EaÍ\0ö \rK°ûul˘\0%lu–“íé\0í*ÔøZf}=Ô Ä\\öµê%†DÆ∫G)9{`ÿf/îzÆ/\0áä(Z1>.M¶wO÷îNf¸(»ÃÖÒœ¨Ùæß!ôú˙≥≥DÏÌÏºpÛ¡=\'iÑ√¢õ˚“õ0\'6[ŸÄ\05QÅ´=∫oÈ5á4 %SÇ–i¸í>‰F!$¡I…Ë∏¡=ãêd∑»É≈ó!zSt FÜÜü¯)Mx©ªö„!)N˝Œˆ‚Ëä^¬i—Ã™;r«YÊ€0Òß¯∏0™	À—°Ÿø[bˇS*µG‘≥ï€ıwx∏]¸23evZÌ8∫jRKlΩ{dû éñ´4û´nLÓ¨MÕYfÒ1æ∫bÑLñzé¸YúñÓŸGº1°’QY/)J»9%‰ú∆‰ú^ë]Ì…¶Œ3\\g\"zÖ2ë•»–-aË6f8X˜ﬂ–+©Ñ7˜^\\EETåäEÇΩÇΩ∆∑Ük.¨å–¿±˜é´d≥~›/·Ÿ/·ŸoÃ”∂∑◊à÷f? €Yô0´Ó%l%lÕŸˆ˚klÎS8–4ßõM∂Ef√f√ÊÃ∂ù\"≥’ÀMj>ÄªøNÒ\rπ„RÚê˘vwBRûªcâUg{á\'«\nÀd™ˇ§=ˇ=ˆÁê˝ˇ›°ØÏŒ˜Ì˘¶?ˇ5Ëø∑Ω	êPÍR‘Tò˘ä‘ƒVﬂ\"|í ’ÿŸŸ«#S=8__dˇì˘Bîü‰~á‘˙‡µÚøô÷ö‡;_¥%Hê©â\\ëT.≈]tä‘-_ÅÄ–ª\0!wDçÆëå/.9ÿíÕ‚PÜ8Ìl≠ΩQ‘Y≤[∞è9^EÙl«¢Ás.ª	FV&<{[§2òSùÜé“`Sù\\dõ∆‹å≤bwPsï \rÚrI¢€9¢?#-‚®2Ó√ô`·Gıj≈¸Úeág]ÅÎ¨+p›ÇÇòq’¸—Ω—“…i±¥›„ëJúº”q1}°o—Q4ƒ≤Ø#{EyCË’=≈†∑∂PıìLI∂ëJ_oh˜èS8≤ﬂÉM|Û≈%z«Øoñ˜!ŒV¢ÆΩ&1Iàø\0õ\0Æsr{õÙt§W<¡˜Ôú¡ŸGlèÔËÙ˝Hƒ≥ÁÂTâ˘\'í2YÁÀÕeo6{À/{ízÎUúx«»ôW\n≈ˆ¿åûÎïÄ-ÆU√—„?','2017-02-16 23:01:09'),('Sen_wiki_DB:pcache:idoptions:20','Eç¡\n¬@Dˇ%Pí∏çkˆ(=x*àz/v¡=TK#¢î˛ªªBÒ6º7Ã¥∫Sÿw◊[<•!Ç÷:õ+gã};>”„n:EùSü≈%Nñ)Àm†J*W2avˇ•Bú#mëIôk˘Q^{Õ{L”BR/±8Y›1æRy9Ù≈ìﬂÑÂ','2017-02-17 00:22:57'),('Sen_wiki_DB:pcache:idoptions:21','Eç¡\n¬0Dˇe?†Ï∆4∆…QzTı^l¿™•+¢î˛ªâPº\rÔ\r3-v†}wΩ≈S\Z\"°∆¨\ZŒ\Z˚v|¶«])t`Ãã¬gqâìfJAsõ§rï-Y8ªˇR!dX∂l§6Ã≤·5kØyèi˙PHŒ2ÁVwåØT^}Ò‚mXæ','2017-02-16 20:01:30'),('Sen_wiki_DB:pcache:idoptions:23','Eç¡\n¬0Dˇe?†Ï∆4∂ì£Ù‡© ÍΩÿÄ9TKWäR˙Ô&BÒ6º7Ã¥®AáÓvÁ8BâE!4\\4ÙÌ¯äœáíÔ¿XVEïƒ5Lö(yMmí¬6g·‰˛KôXêaŸ≥«,∆Ó~‘lΩÊ=∆ÈC>¢rñ9;∑πSòc~9ˆŸKÌ¸˙','2017-02-17 00:12:43'),('Sen_wiki_DB:pcache:idoptions:25','Eç¡\n¬0Dˇe?†Ï∆4∆…QzTı^l¿™•+¢î˛ªâPº\rÔ\r3-v†}wΩ≈S\Z\"°∆¨\ZŒ\Z˚v|¶«])t`Ãã¬gqâìfJAsõ§rï-Y8ªˇR!dX∂l§6ë5kØyèi˙PHŒ2ÁVwåØT^}Ò‚]Xæ','2017-02-16 23:01:12'),('Sen_wiki_DB:pcache:idoptions:7','EéÀ\nÉ0Eˇe>@í¯ó•ãÆÑ“võAF%—“\"˛{©t7‹sò{k,NÚŸ—MLqu»Çπ;Rı4ÎqpPIåq’»*Ña1\rŸé§“CÎ±FÓIÅ∞8≤Ω⁄â «n^öπ≥‰∫±WPmªhdùˇ\r^JxîEI∏9ÛÏøÁ◊\'œô‡©àgÂûä√;ø\'m?°∞»∂/Ãv•ó-µo,Ûj˚','2017-02-16 23:01:09');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,0,'Main_Page','',0,1,0.768590149262,'20170122203959',NULL,1,717,'wikitext',NULL),(2,0,'Cats','',0,1,0.927722290135,'20170124191325','20170124191325',2,10,'wikitext',NULL),(3,0,'Sen','',0,0,0.070129717936,'20170130195151','20170130195152',58,524,'wikitext',NULL),(4,0,'Employees','',0,0,0.207509113291,'20170131183615','20170131185803',100,321,'wikitext',NULL),(5,2,'SenLi','',0,1,0.053177466931,'20170124225627','20170124225425',15,40,'wikitext',NULL),(6,8,'Sidebar','',0,0,0.793534719493,'20170209183618','20170209183618',176,388,'wikitext',NULL),(7,0,'Huawei_Wiki','',0,0,0.844647299031,'20170215230109','20170216001243',197,207,'wikitext',NULL),(8,8,'Mainpage','',0,1,0.020899195092,'20170125005736','20170125005743',22,11,'wikitext',NULL),(9,14,'Employees','',0,0,0.33334457273,'20170126233702','20170126194236',51,27,'wikitext',NULL),(10,1,'Huawei_Wiki','',0,0,0.203351937294,'20170125014355','20170125014407',30,82,'wikitext',NULL),(11,6,'Sen.jpg','',0,1,0.497397511109,'20170126221854','20170125033021',32,12,'wikitext',NULL),(12,10,'TableTestTemplate','',0,0,0.84527597703,'20170126222140','20170126222419',61,598,'wikitext',NULL),(13,106,'Employees','',0,1,0.926135402377,'20170126181036','20170126181036',50,812,'wikitext',NULL),(14,274,'Iframe','',0,0,0.201065282118,'20170127003049','20170127003050',79,1373,'wikitext',NULL),(15,0,'Team_Member','',0,0,0.457119883939,'20170210232600','20170210232600',194,160,'wikitext',NULL),(16,0,'Sample_Devices_Tracking','',0,0,0.019313476063,'20170210231416','20170210231417',181,373,'wikitext',NULL),(17,0,'SortDevicesByDeviceID','',0,0,0.734759189006,'20170131220248','20170131220249',120,122,'wikitext',NULL),(18,0,'SortDevicesByDeviceModel','',0,0,0.332940798637,'20170131220944','20170131220945',128,97,'wikitext',NULL),(19,14,'SortDevices','',0,1,0.540130064352,'20170131220945','20170131220017',113,25,'wikitext',NULL),(20,0,'Project_Repositories','',0,0,0.479966961183,'20170214234932','20170214234932',183,227,'wikitext',NULL),(21,0,'Android_Source_Code_Repo','',0,0,0.289711036697,'20170210231630','20170210231631',184,138,'wikitext',NULL),(22,0,'HQ_Android_Released_Image','',0,0,0.967661044333,'20170210231707','20170210231729',185,133,'wikitext',NULL),(23,0,'Model_&_Release','',0,0,0.747871576902,'20170211014844','20170211014845',196,203,'wikitext',NULL),(24,0,'SenForm','',0,1,0.682369706044,'20170207180536','20170207180539',175,424,'wikitext',NULL),(25,0,'Tools','',0,0,0.854365372537,'20170210231725','20170210231730',186,127,'wikitext',NULL);
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
INSERT INTO `pagelinks` VALUES (7,0,0,'Android_Source_Code_Repo'),(7,0,0,'HQ_Android_Released_Image'),(7,0,0,'Model_&_Release'),(7,0,0,'Project_Repositories'),(7,0,0,'Sample_Devices_Tracking'),(3,0,0,'Sen'),(4,0,0,'Sen'),(7,0,0,'Team_Member'),(7,0,0,'Tools'),(5,2,0,'Sen'),(9,14,106,'Employees');
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
INSERT INTO `querycache_info` VALUES ('activeusers','20170211014844');
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
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recentchanges`
--

LOCK TABLES `recentchanges` WRITE;
/*!40000 ALTER TABLE `recentchanges` DISABLE KEYS */;
INSERT INTO `recentchanges` VALUES (1,'20170124191325',0,'0:0:0:0:0:0:0:1',0,'Cats','Created page with \"Hello cat!\"',0,0,1,2,2,0,1,'mw.new',0,'::1',0,10,0,0,NULL,'',''),(2,'20170124220520',0,'0:0:0:0:0:0:0:1',0,'Sen','Headers Added',0,0,1,3,3,0,1,'mw.new',0,'::1',0,66,0,0,NULL,'',''),(3,'20170124220754',0,'0:0:0:0:0:0:0:1',0,'Sen','/* Career */',0,0,0,3,4,3,0,'mw.edit',0,'::1',66,133,0,0,NULL,'',''),(4,'20170124221007',0,'0:0:0:0:0:0:0:1',0,'Sen','/* Contract */',0,0,0,3,5,4,0,'mw.edit',0,'::1',133,184,0,0,NULL,'',''),(5,'20170124221128',0,'0:0:0:0:0:0:0:1',0,'Sen','',0,0,0,3,6,5,0,'mw.edit',0,'::1',184,244,0,0,NULL,'',''),(6,'20170124221242',0,'0:0:0:0:0:0:0:1',0,'Sen','/* Introduction */',0,0,0,3,7,6,0,'mw.edit',0,'::1',244,283,0,0,NULL,'',''),(7,'20170124221257',0,'0:0:0:0:0:0:0:1',0,'Sen','/* Career */',0,0,0,3,8,7,0,'mw.edit',0,'::1',283,278,0,0,NULL,'',''),(8,'20170124221318',0,'0:0:0:0:0:0:0:1',0,'Sen','/* Career */',0,0,0,3,9,8,0,'mw.edit',0,'::1',278,282,0,0,NULL,'',''),(9,'20170124221429',0,'0:0:0:0:0:0:0:1',0,'Sen','/* Introduction */',0,0,0,3,10,9,0,'mw.edit',0,'::1',282,340,0,0,NULL,'',''),(10,'20170124221446',0,'0:0:0:0:0:0:0:1',0,'Sen','/* Introduction */',0,0,0,3,11,10,0,'mw.edit',0,'::1',340,343,0,0,NULL,'',''),(11,'20170124221507',0,'0:0:0:0:0:0:0:1',0,'Sen','/* Introduction */',0,0,0,3,12,11,0,'mw.edit',0,'::1',343,345,0,0,NULL,'',''),(12,'20170124221800',0,'0:0:0:0:0:0:0:1',0,'Sen','/* Introduction */',0,0,0,3,13,12,0,'mw.edit',0,'::1',345,345,0,0,NULL,'',''),(13,'20170124222016',0,'0:0:0:0:0:0:0:1',0,'Employees','Created page with \"== Software Group ==  === Contract === [[Sen]]<br>    == Hardware Group ==\"',0,0,1,4,14,0,1,'mw.new',0,'::1',0,74,0,0,NULL,'',''),(14,'20170124225424',1,'SenLi',2,'SenLi','Created page with \"= VIP of Huawei Software Group = [[Sen]]\"',0,0,1,5,15,0,1,'mw.new',1,'::1',0,40,0,0,NULL,'',''),(15,'20170124231254',2,'Liziyuanhaha',2,'Liziyuanhaha','',0,0,0,0,0,0,3,'mw.log',1,'::1',NULL,NULL,0,2,'newusers','create','a:1:{s:9:\"4::userid\";i:2;}'),(16,'20170124233751',3,'Liziyuanhaha',2,'Liziyuanhaha','',0,0,0,0,0,0,3,'mw.log',1,'::1',NULL,NULL,0,3,'newusers','create','a:1:{s:9:\"4::userid\";i:3;}'),(17,'20170125003550',1,'SenLi',8,'Sidebar','Created page with \" * navigation ** HuaweiWiki|huaweiwikipage-description ** mainpage|mainpage-description ** recentchanges-url|recentchanges ** randompage-url|randompage ** helppage|help * SEAR...\"',0,0,1,6,16,0,1,'mw.new',1,'::1',0,199,0,0,NULL,'',''),(18,'20170125003613',1,'SenLi',8,'Sidebar','',0,0,0,6,17,16,0,'mw.edit',1,'::1',199,172,0,0,NULL,'',''),(19,'20170125003630',1,'SenLi',8,'Sidebar','',0,0,0,6,18,17,0,'mw.edit',1,'::1',172,186,0,0,NULL,'',''),(20,'20170125005325',1,'SenLi',8,'Sidebar','',0,0,0,6,19,18,0,'mw.edit',1,'::1',186,187,0,0,NULL,'',''),(21,'20170125005437',1,'SenLi',0,'Huawei_Wiki','Created page with \"= Introduction =  == [[Employees]] ==  === [[[Software Group]]] ===  === [[[Hardware Group]]] ===\"',0,0,1,7,20,0,1,'mw.new',1,'::1',0,97,0,0,NULL,'',''),(22,'20170125005459',1,'SenLi',0,'Huawei_Wiki','/* Employees */',0,0,0,7,21,20,0,'mw.edit',1,'::1',97,93,0,0,NULL,'',''),(23,'20170125005736',1,'SenLi',8,'Mainpage','Created page with \"Huawei Wiki\"',0,0,1,8,22,0,1,'mw.new',1,'::1',0,11,0,0,NULL,'',''),(24,'20170125005814',1,'SenLi',8,'Sidebar','',0,0,0,6,23,19,0,'mw.edit',1,'::1',187,154,0,0,NULL,'',''),(25,'20170125013332',1,'SenLi',0,'Sen','',0,0,0,3,24,13,0,'mw.edit',1,'::1',345,370,0,0,NULL,'',''),(26,'20170125013555',1,'SenLi',0,'Sen','',0,0,0,3,25,24,0,'mw.edit',1,'::1',370,374,0,0,NULL,'',''),(27,'20170125013612',1,'SenLi',0,'Sen','',0,0,0,3,26,25,0,'mw.edit',1,'::1',374,370,0,0,NULL,'',''),(28,'20170125013634',1,'SenLi',0,'Sen','',0,0,0,3,27,26,0,'mw.edit',1,'::1',370,370,0,0,NULL,'',''),(29,'20170125013935',1,'SenLi',14,'Employees','Created page with \"This page contains all the employees of Huawei.\"',0,0,1,9,28,0,1,'mw.new',1,'::1',0,47,0,0,NULL,'',''),(30,'20170125014251',1,'SenLi',1,'Huawei_Wiki','/* Employees */ new section',0,0,1,10,29,0,1,'mw.new',1,'::1',0,53,0,0,NULL,'',''),(31,'20170125014355',1,'SenLi',1,'Huawei_Wiki','',0,0,0,10,30,29,0,'mw.edit',1,'::1',53,82,0,0,NULL,'',''),(32,'20170125025355',4,'Admin',2,'Admin','',0,0,0,0,0,0,3,'mw.log',1,'::1',NULL,NULL,0,19,'newusers','create','a:1:{s:9:\"4::userid\";i:4;}'),(33,'20170125025457',1,'SenLi',2,'Admin','',0,0,0,0,0,0,3,'mw.log',1,'::1',NULL,NULL,0,20,'rights','rights','a:2:{s:12:\"4::oldgroups\";a:0:{}s:12:\"5::newgroups\";a:2:{i:0;s:5:\"sysop\";i:1;s:10:\"bureaucrat\";}}'),(34,'20170125031740',4,'Admin',0,'Sen','',0,0,0,3,31,27,0,'mw.edit',1,'::1',370,399,0,0,NULL,'',''),(35,'20170125033000',4,'Admin',6,'Sen.jpg','Sen Portrait',0,0,0,11,32,0,3,'mw.log',1,'::1',NULL,NULL,0,22,'upload','upload','a:2:{s:8:\"img_sha1\";s:31:\"01w9h8so5raxtslx1kdk1cstg5pzumg\";s:13:\"img_timestamp\";s:14:\"20170125033000\";}'),(36,'20170125033145',4,'Admin',0,'Sen','',0,0,0,3,33,31,0,'mw.edit',1,'::1',399,419,0,0,NULL,'',''),(37,'20170125033305',4,'Admin',0,'Sen','',0,0,0,3,34,33,0,'mw.edit',1,'::1',419,424,0,0,NULL,'',''),(38,'20170125033327',4,'Admin',0,'Sen','',0,0,0,3,35,34,0,'mw.edit',1,'::1',424,422,0,0,NULL,'',''),(39,'20170125033535',4,'Admin',0,'Sen','',0,0,0,3,36,35,0,'mw.edit',1,'::1',422,432,0,0,NULL,'',''),(40,'20170125033641',4,'Admin',0,'Sen','',0,0,0,3,37,36,0,'mw.edit',1,'::1',432,433,0,0,NULL,'',''),(41,'20170125033655',4,'Admin',0,'Sen','',0,0,0,3,38,37,0,'mw.edit',1,'::1',433,427,0,0,NULL,'',''),(42,'20170125033850',4,'Admin',0,'Sen','',0,0,0,3,39,38,0,'mw.edit',1,'::1',427,435,0,0,NULL,'',''),(43,'20170125034143',4,'Admin',0,'Sen','',0,0,0,3,40,39,0,'mw.edit',1,'::1',435,435,0,0,NULL,'',''),(44,'20170125035327',4,'Admin',0,'Sen','',0,0,0,3,41,40,0,'mw.edit',1,'::1',435,443,0,0,NULL,'',''),(45,'20170125035412',4,'Admin',0,'Sen','',0,0,0,3,42,41,0,'mw.edit',1,'::1',443,452,0,0,NULL,'',''),(46,'20170125035434',4,'Admin',0,'Sen','',0,0,0,3,43,42,0,'mw.edit',1,'::1',452,454,0,0,NULL,'',''),(47,'20170125035624',4,'Admin',0,'Sen','',0,0,0,3,44,43,0,'mw.edit',1,'::1',454,515,0,0,NULL,'',''),(48,'20170125035642',4,'Admin',0,'Sen','',0,0,0,3,45,44,0,'mw.edit',1,'::1',515,520,0,0,NULL,'',''),(49,'20170125035654',4,'Admin',0,'Sen','',0,0,0,3,46,45,0,'mw.edit',1,'::1',520,524,0,0,NULL,'',''),(50,'20170126000719',0,'0:0:0:0:0:0:0:1',0,'Employees','/* Contract */',0,0,0,4,47,14,0,'mw.edit',0,'::1',74,123,0,0,NULL,'',''),(51,'20170126000833',0,'0:0:0:0:0:0:0:1',0,'Employees','/* Contract */',0,0,0,4,48,47,0,'mw.edit',0,'::1',123,72,0,0,NULL,'',''),(52,'20170126181036',4,'Admin',10,'TableTestTemplate','',0,0,1,12,49,0,1,'mw.new',1,'::1',0,351,0,0,NULL,'',''),(53,'20170126181036',4,'Admin',106,'Employees','',0,0,1,13,50,0,1,'mw.new',1,'127.0.0.1',0,812,0,0,NULL,'',''),(54,'20170126194236',4,'Admin',14,'Employees','',0,0,0,9,51,28,0,'mw.edit',1,'127.0.0.1',47,27,0,0,NULL,'',''),(55,'20170126210501',4,'Admin',0,'Employees','',0,0,0,4,52,48,0,'mw.edit',1,'::1',72,94,0,0,NULL,'',''),(56,'20170126215629',4,'Admin',0,'Employees','',0,0,0,4,53,52,0,'mw.edit',1,'::1',94,134,0,0,NULL,'',''),(57,'20170126215648',4,'Admin',0,'Employees','',0,0,0,4,54,53,0,'mw.edit',1,'::1',134,145,0,0,NULL,'',''),(58,'20170126215843',4,'Admin',0,'Employees','',0,0,0,4,55,54,0,'mw.edit',1,'::1',145,169,0,0,NULL,'',''),(59,'20170126215857',4,'Admin',0,'Employees','',0,0,0,4,56,55,0,'mw.edit',1,'::1',169,170,0,0,NULL,'',''),(60,'20170126221832',4,'Admin',0,'Sen','',0,0,0,3,57,46,0,'mw.edit',1,'::1',524,532,0,0,NULL,'',''),(61,'20170126221853',4,'Admin',0,'Sen','',0,0,0,3,58,57,0,'mw.edit',1,'::1',532,524,0,0,NULL,'',''),(62,'20170126222106',4,'Admin',10,'TableTestTemplate','',0,0,0,12,59,49,0,'mw.edit',1,'::1',351,474,0,0,NULL,'',''),(63,'20170126222122',4,'Admin',10,'TableTestTemplate','',0,0,0,12,60,59,0,'mw.edit',1,'::1',474,596,0,0,NULL,'',''),(64,'20170126222140',4,'Admin',10,'TableTestTemplate','',0,0,0,12,61,60,0,'mw.edit',1,'::1',596,598,0,0,NULL,'',''),(65,'20170126222624',4,'Admin',0,'Employees','',0,0,0,4,62,56,0,'mw.edit',1,'::1',170,170,0,0,NULL,'',''),(66,'20170126222902',4,'Admin',0,'Employees','',0,0,0,4,63,62,0,'mw.edit',1,'::1',170,166,0,0,NULL,'',''),(67,'20170126232844',4,'Admin',274,'Iframe','Created page with \"<noinclude>__NOTOC__ This widget allows you to embed any web page on your wiki page using an iframe tag.  Created by [https://www.mediawikiwidgets.org/User:Sergey_Chernyshev S...\"',0,0,1,14,64,0,1,'mw.new',1,'::1',0,1373,0,0,NULL,'',''),(68,'20170126233045',4,'Admin',0,'Employees','',0,0,0,4,65,63,0,'mw.edit',1,'::1',166,134,0,0,NULL,'',''),(69,'20170126233701',4,'Admin',0,'Employees','',0,0,0,4,66,65,0,'mw.edit',1,'::1',134,75,0,0,NULL,'',''),(70,'20170126235115',4,'Admin',0,'Employees','',0,0,0,4,67,66,0,'mw.edit',1,'::1',75,198,0,0,NULL,'',''),(71,'20170126235248',4,'Admin',0,'Employees','',0,0,0,4,68,67,0,'mw.edit',1,'::1',198,94,0,0,NULL,'',''),(72,'20170126235257',4,'Admin',0,'Employees','',0,0,0,4,69,68,0,'mw.edit',1,'::1',94,93,0,0,NULL,'',''),(73,'20170126235634',4,'Admin',274,'Iframe','',0,0,0,14,70,64,0,'mw.edit',1,'::1',1373,1352,0,0,NULL,'',''),(74,'20170127001141',4,'Admin',274,'Iframe','',0,0,0,14,71,70,0,'mw.edit',1,'::1',1352,1373,0,0,NULL,'',''),(75,'20170127001205',4,'Admin',0,'Employees','',0,0,0,4,72,69,0,'mw.edit',1,'::1',93,87,0,0,NULL,'',''),(76,'20170127001215',4,'Admin',0,'Employees','/* Hardware Group */',0,0,0,4,73,72,0,'mw.edit',1,'::1',87,87,0,0,NULL,'',''),(77,'20170127002301',4,'Admin',274,'Iframe','Blanked the page',0,0,0,14,74,71,0,'mw.edit',1,'::1',1373,0,0,0,NULL,'',''),(78,'20170127002317',4,'Admin',0,'Employees','',0,0,0,4,75,73,0,'mw.edit',1,'::1',87,94,0,0,NULL,'',''),(79,'20170127002423',4,'Admin',274,'Iframe','',0,0,0,14,76,74,0,'mw.edit',1,'::1',0,1180,0,0,NULL,'',''),(80,'20170127002501',4,'Admin',274,'Iframe','',0,0,0,14,77,76,0,'mw.edit',1,'::1',1180,657,0,0,NULL,'',''),(81,'20170127002655',4,'Admin',0,'Employees','/* Hardware Group */',0,0,0,4,78,75,0,'mw.edit',1,'::1',94,193,0,0,NULL,'',''),(82,'20170127003049',4,'Admin',274,'Iframe','',0,0,0,14,79,77,0,'mw.edit',1,'::1',657,1373,0,0,NULL,'',''),(83,'20170130165228',4,'Admin',0,'Employees','',0,0,0,4,80,78,0,'mw.edit',1,'::1',193,95,0,0,NULL,'',''),(84,'20170130165712',4,'Admin',0,'Employees','',0,0,0,4,81,80,0,'mw.edit',1,'::1',95,1424,0,0,NULL,'',''),(85,'20170130171224',4,'Admin',0,'Employees','Replaced content with \"   == Software Group ==  === Contract === [[Sen]]<br>   == Hardware Group ==\"',0,0,0,4,82,81,0,'mw.edit',1,'::1',1424,76,0,0,NULL,'',''),(86,'20170130190021',4,'Admin',0,'Employees','',0,0,0,4,83,82,0,'mw.edit',1,'::1',76,125,0,0,NULL,'',''),(87,'20170130190056',4,'Admin',0,'Employees','',0,0,0,4,84,83,0,'mw.edit',1,'::1',125,195,0,0,NULL,'',''),(88,'20170130191155',4,'Admin',0,'Employees','',0,0,0,4,85,84,0,'mw.edit',1,'::1',195,173,0,0,NULL,'',''),(89,'20170130193938',4,'Admin',0,'Employees','',0,0,0,4,86,85,0,'mw.edit',1,'::1',173,179,0,0,NULL,'',''),(90,'20170130193956',4,'Admin',0,'Employees','',0,0,0,4,87,86,0,'mw.edit',1,'::1',179,179,0,0,NULL,'',''),(91,'20170130194004',4,'Admin',0,'Employees','',0,0,0,4,88,87,0,'mw.edit',1,'::1',179,177,0,0,NULL,'',''),(92,'20170130194019',4,'Admin',0,'Employees','',0,0,0,4,89,88,0,'mw.edit',1,'::1',177,175,0,0,NULL,'',''),(93,'20170130194029',4,'Admin',0,'Employees','',0,0,0,4,90,89,0,'mw.edit',1,'::1',175,175,0,0,NULL,'',''),(94,'20170130194042',4,'Admin',0,'Employees','',0,0,0,4,91,90,0,'mw.edit',1,'::1',175,174,0,0,NULL,'',''),(95,'20170130194050',4,'Admin',0,'Employees','',0,0,0,4,92,91,0,'mw.edit',1,'::1',174,174,0,0,NULL,'',''),(96,'20170130194712',4,'Admin',0,'Employees','/* Hardware Group */',0,0,0,4,93,92,0,'mw.edit',1,'::1',174,175,0,0,NULL,'',''),(97,'20170130195003',4,'Admin',0,'Employees','/* Hardware Group */',0,0,0,4,94,93,0,'mw.edit',1,'::1',175,176,0,0,NULL,'',''),(98,'20170130195230',4,'Admin',0,'Employees','/* Hardware Group */',0,0,0,4,95,94,0,'mw.edit',1,'::1',176,236,0,0,NULL,'',''),(99,'20170130200045',4,'Admin',0,'Employees','/* Hardware Group */',0,0,0,4,96,95,0,'mw.edit',1,'::1',236,239,0,0,NULL,'',''),(100,'20170131032316',4,'Admin',0,'Huawei_Wiki','',0,0,0,7,97,21,0,'mw.edit',1,'::1',93,107,0,0,NULL,'',''),(101,'20170131032344',4,'Admin',0,'Huawei_Wiki','',0,0,0,7,98,97,0,'mw.edit',1,'::1',107,81,0,0,NULL,'',''),(102,'20170131183559',4,'Admin',0,'Employees','/* Hardware Group */',0,0,0,4,99,96,0,'mw.edit',1,'::1',239,324,0,0,NULL,'',''),(103,'20170131183615',4,'Admin',0,'Employees','/* Hardware Group */',0,0,0,4,100,99,0,'mw.edit',1,'::1',324,321,0,0,NULL,'',''),(104,'20170131190542',0,'0:0:0:0:0:0:0:1',0,'Huawei_Wiki','',0,0,0,7,101,98,0,'mw.edit',0,'::1',81,326,0,0,NULL,'',''),(105,'20170131190618',0,'0:0:0:0:0:0:0:1',0,'Huawei_Wiki','',0,0,0,7,102,101,0,'mw.edit',0,'::1',326,327,0,0,NULL,'',''),(106,'20170131190721',0,'0:0:0:0:0:0:0:1',0,'Team_Member','Created page with \"[http://192.168.1.61/addNewEmployee.php Add a New Employee] (Tip: You can click the middle button of the mouse to open this link in a New Page.)  {{#widget:Iframe |url=http://...\"',0,0,1,15,103,0,1,'mw.new',0,'::1',0,244,0,0,NULL,'',''),(107,'20170131190827',0,'0:0:0:0:0:0:0:1',0,'Huawei_Wiki','',0,0,0,7,104,102,0,'mw.edit',0,'::1',327,74,0,0,NULL,'',''),(108,'20170131202410',0,'0:0:0:0:0:0:0:1',0,'Sample_Devices_Tracking','Created page with \"{{#widget:Iframe |url=http://localhost/sortByDeviceID.php |width=100% |height=800 |border=0 }}\"',0,0,1,16,105,0,1,'mw.new',0,'::1',0,94,0,0,NULL,'',''),(109,'20170131202459',0,'0:0:0:0:0:0:0:1',0,'Huawei_Wiki','',0,0,0,7,106,104,0,'mw.edit',0,'::1',74,73,0,0,NULL,'',''),(110,'20170131215319',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','Created page with \"[[Categories:SortDevicesByDeviceID]]\"',0,0,1,17,107,0,1,'mw.new',0,'::1',0,36,0,0,NULL,'',''),(111,'20170131215734',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,108,107,0,'mw.edit',0,'::1',36,25,0,0,NULL,'',''),(112,'20170131215750',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,109,108,0,'mw.edit',0,'::1',25,25,0,0,NULL,'',''),(113,'20170131215803',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,110,109,0,'mw.edit',0,'::1',25,25,0,0,NULL,'',''),(114,'20170131215814',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,111,110,0,'mw.edit',0,'::1',25,24,0,0,NULL,'',''),(115,'20170131215910',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceModel','Created page with \"[[category:SortDevices]]\"',0,0,1,18,112,0,1,'mw.new',0,'::1',0,24,0,0,NULL,'',''),(116,'20170131215959',0,'0:0:0:0:0:0:0:1',14,'SortDevices','Show Devices',0,0,1,19,113,0,1,'mw.new',0,'::1',0,25,0,0,NULL,'',''),(117,'20170131220141',0,'0:0:0:0:0:0:0:1',0,'Sample_Devices_Tracking','Blanked the page',0,0,0,16,114,105,0,'mw.edit',0,'::1',94,0,0,0,NULL,'',''),(118,'20170131220159',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,115,111,0,'mw.edit',0,'::1',24,122,0,0,NULL,'',''),(119,'20170131220212',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,116,115,0,'mw.edit',0,'::1',122,122,0,0,NULL,'',''),(120,'20170131220223',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,117,116,0,'mw.edit',0,'::1',122,122,0,0,NULL,'',''),(121,'20170131220233',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,118,117,0,'mw.edit',0,'::1',122,122,0,0,NULL,'',''),(122,'20170131220241',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,119,118,0,'mw.edit',0,'::1',122,122,0,0,NULL,'',''),(123,'20170131220248',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceID','',0,0,0,17,120,119,0,'mw.edit',0,'::1',122,122,0,0,NULL,'',''),(124,'20170131220352',0,'0:0:0:0:0:0:0:1',0,'Huawei_Wiki','/* Sample Devices Tracking */',0,0,0,7,121,106,0,'mw.edit',0,'::1',73,172,0,0,NULL,'',''),(125,'20170131220422',0,'0:0:0:0:0:0:0:1',0,'Huawei_Wiki','',0,0,0,7,122,121,0,'mw.edit',0,'::1',172,73,0,0,NULL,'',''),(126,'20170131220437',0,'0:0:0:0:0:0:0:1',0,'Sample_Devices_Tracking','',0,0,0,16,123,114,0,'mw.edit',0,'::1',0,93,0,0,NULL,'',''),(127,'20170131220448',0,'0:0:0:0:0:0:0:1',0,'Sample_Devices_Tracking','/* SortDevicesByDeviceID */',0,0,0,16,124,123,0,'mw.edit',0,'::1',93,96,0,0,NULL,'',''),(128,'20170131220502',0,'0:0:0:0:0:0:0:1',0,'Sample_Devices_Tracking','',0,0,0,16,125,124,0,'mw.edit',0,'::1',96,106,0,0,NULL,'',''),(129,'20170131220533',0,'0:0:0:0:0:0:0:1',0,'Huawei_Wiki','',0,0,0,7,126,122,0,'mw.edit',0,'::1',73,57,0,0,NULL,'',''),(130,'20170131220745',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceModel','',0,0,0,18,127,112,0,'mw.edit',0,'::1',24,125,0,0,NULL,'',''),(131,'20170131220944',0,'0:0:0:0:0:0:0:1',0,'SortDevicesByDeviceModel','',0,0,0,18,128,127,0,'mw.edit',0,'::1',125,97,0,0,NULL,'',''),(132,'20170131221023',0,'0:0:0:0:0:0:0:1',0,'Sample_Devices_Tracking','',0,0,0,16,129,125,0,'mw.edit',0,'::1',106,94,0,0,NULL,'',''),(133,'20170131221429',0,'0:0:0:0:0:0:0:1',0,'Sample_Devices_Tracking','',0,0,0,16,130,129,0,'mw.edit',0,'::1',94,236,0,0,NULL,'',''),(134,'20170131222055',4,'Admin',8,'Sidebar','',0,0,0,6,131,23,0,'mw.edit',1,'::1',154,158,0,0,NULL,'',''),(135,'20170131222135',4,'Admin',8,'Sidebar','',0,0,0,6,132,131,0,'mw.edit',1,'::1',158,236,0,0,NULL,'',''),(136,'20170131222207',4,'Admin',8,'Sidebar','',0,0,0,6,133,132,0,'mw.edit',1,'::1',236,227,0,0,NULL,'',''),(137,'20170131222222',4,'Admin',8,'Sidebar','',0,0,0,6,134,133,0,'mw.edit',1,'::1',227,229,0,0,NULL,'',''),(138,'20170131224959',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,135,130,0,'mw.edit',1,'::1',236,151,0,0,NULL,'',''),(139,'20170131225357',4,'Admin',0,'Team_Member','',0,0,0,15,136,103,0,'mw.edit',1,'::1',244,98,0,0,NULL,'',''),(140,'20170131225504',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,137,135,0,'mw.edit',1,'::1',151,94,0,0,NULL,'',''),(141,'20170131230225',4,'Admin',0,'Team_Member','',0,0,0,15,138,136,0,'mw.edit',1,'::1',98,160,0,0,NULL,'',''),(142,'20170131230413',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,139,137,0,'mw.edit',1,'::1',94,300,0,0,NULL,'',''),(143,'20170131230441',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,140,139,0,'mw.edit',1,'::1',300,329,0,0,NULL,'',''),(144,'20170131230634',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,141,140,0,'mw.edit',1,'::1',329,307,0,0,NULL,'',''),(145,'20170131230659',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,142,141,0,'mw.edit',1,'::1',307,328,0,0,NULL,'',''),(146,'20170131230726',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,143,142,0,'mw.edit',1,'::1',328,319,0,0,NULL,'',''),(147,'20170201011300',4,'Admin',0,'Huawei_Wiki','',0,0,0,7,144,126,0,'mw.edit',1,'::1',57,90,0,0,NULL,'',''),(148,'20170201011339',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,145,143,0,'mw.edit',1,'::1',319,370,0,0,NULL,'',''),(149,'20170201011425',4,'Admin',0,'Project_Repositories','Created page with \"{{#widget:Iframe |url=http://localhost/getProjectRepos.php |width=100% |height=670 |border=0 }}\"',0,0,1,20,146,0,1,'mw.new',1,'::1',0,95,0,0,NULL,'',''),(150,'20170201021140',4,'Admin',8,'Sidebar','',0,0,0,6,147,134,0,'mw.edit',1,'::1',229,269,0,0,NULL,'',''),(151,'20170201182450',4,'Admin',0,'Project_Repositories','',0,0,0,20,148,146,0,'mw.edit',1,'::1',95,530,0,0,NULL,'',''),(152,'20170201182509',4,'Admin',0,'Project_Repositories','',0,0,0,20,149,148,0,'mw.edit',1,'::1',530,188,0,0,NULL,'',''),(153,'20170201182906',4,'Admin',0,'Project_Repositories','',0,0,0,20,150,149,0,'mw.edit',1,'::1',188,224,0,0,NULL,'',''),(154,'20170201192422',4,'Admin',0,'Huawei_Wiki','',0,0,0,7,151,144,0,'mw.edit',1,'::1',90,127,0,0,NULL,'',''),(155,'20170201192457',4,'Admin',8,'Sidebar','',0,0,0,6,152,147,0,'mw.edit',1,'::1',269,311,0,0,NULL,'',''),(156,'20170201192508',4,'Admin',8,'Sidebar','',0,0,0,6,153,152,0,'mw.edit',1,'::1',311,317,0,0,NULL,'',''),(157,'20170201200113',4,'Admin',0,'Android_Source_Code_Repo','Created page with \"{{#widget:Iframe |url=http://localhost/getSourceCodeRepos.php |width=100% |height=670 |border=0 }}\"',0,0,1,21,154,0,1,'mw.new',1,'::1',0,98,0,0,NULL,'',''),(158,'20170201201603',4,'Admin',0,'Android_Source_Code_Repo','',0,0,0,21,155,154,0,'mw.edit',1,'::1',98,134,0,0,NULL,'',''),(159,'20170201201622',4,'Admin',0,'Android_Source_Code_Repo','',0,0,0,21,156,155,0,'mw.edit',1,'::1',134,135,0,0,NULL,'',''),(160,'20170201204520',4,'Admin',0,'Huawei_Wiki','',0,0,0,7,157,151,0,'mw.edit',1,'::1',127,164,0,0,NULL,'',''),(161,'20170201204646',4,'Admin',0,'HQ_Android_Released_Image','Created page with \"{| class=\"wikitable sortable collapsible\" ! Name ! Description ! Instruction ! Tag |- | MediaWiki Image || reposR3 || To Be Determined |- |}\"',0,0,1,22,158,0,1,'mw.new',1,'::1',0,140,0,0,NULL,'',''),(162,'20170201204714',4,'Admin',0,'HQ_Android_Released_Image','',0,0,0,22,159,158,0,'mw.edit',1,'::1',140,149,0,0,NULL,'',''),(163,'20170201211654',4,'Admin',0,'HQ_Android_Released_Image','',0,0,0,22,160,159,0,'mw.edit',1,'::1',149,163,0,0,NULL,'',''),(164,'20170201211710',4,'Admin',0,'HQ_Android_Released_Image','',0,0,0,22,161,160,0,'mw.edit',1,'::1',163,166,0,0,NULL,'',''),(165,'20170201212744',4,'Admin',0,'HQ_Android_Released_Image','',0,0,0,22,162,161,0,'mw.edit',1,'::1',166,390,0,0,NULL,'',''),(166,'20170201212928',4,'Admin',0,'HQ_Android_Released_Image','',0,0,0,22,163,162,0,'mw.edit',1,'::1',390,440,0,0,NULL,'',''),(167,'20170201213822',4,'Admin',8,'Sidebar','',0,0,0,6,164,153,0,'mw.edit',1,'::1',317,363,0,0,NULL,'',''),(168,'20170201213937',4,'Admin',0,'HQ_Android_Released_Image','',0,0,0,22,165,163,0,'mw.edit',1,'::1',440,424,0,0,NULL,'',''),(169,'20170206043203',0,'0:0:0:0:0:0:0:1',0,'Team_Member','',0,0,0,15,166,138,0,'mw.edit',0,'::1',160,157,0,0,NULL,'',''),(170,'20170206233210',4,'Admin',8,'Sidebar','',0,0,0,6,167,164,0,'mw.edit',1,'::1',363,400,0,0,NULL,'',''),(171,'20170206233226',4,'Admin',8,'Sidebar','',0,0,0,6,168,167,0,'mw.edit',1,'::1',400,400,0,0,NULL,'',''),(172,'20170206233255',4,'Admin',0,'Model_&_Release','Created page with \"{{#widget:Iframe |url=http://localhost/getReleaseView.php |width=100% |height=670 |border=0 }}\"',0,0,1,23,169,0,1,'mw.new',1,'::1',0,94,0,0,NULL,'',''),(173,'20170206235829',4,'Admin',0,'Model_&_Release','',0,0,0,23,170,169,0,'mw.edit',1,'::1',94,126,0,0,NULL,'',''),(174,'20170207013641',4,'Admin',0,'Huawei_Wiki','',0,0,0,7,171,157,0,'mw.edit',1,'::1',164,190,0,0,NULL,'',''),(175,'20170207013658',4,'Admin',0,'Huawei_Wiki','',0,0,0,7,172,171,0,'mw.edit',1,'::1',190,190,0,0,NULL,'',''),(176,'20170207180505',4,'Admin',0,'HQ_Android_Released_Image','',0,0,0,22,173,165,0,'mw.edit',1,'::1',424,556,0,0,NULL,'',''),(177,'20170207180521',4,'Admin',0,'HQ_Android_Released_Image','',0,0,0,22,174,173,0,'mw.edit',1,'::1',556,130,0,0,NULL,'',''),(178,'20170207180536',4,'Admin',0,'SenForm','Created page with \"{| class=\"wikitable sortable collapsible\" ! Name             ! Description    ! Instruction   ! Tag |- | MediaWiki Image || reposR3   <br> Use this way to continue more text...\"',0,0,1,24,175,0,1,'mw.new',1,'::1',0,424,0,0,NULL,'',''),(179,'20170209183618',4,'Admin',8,'Sidebar','',0,0,0,6,176,168,0,'mw.edit',1,'::1',400,388,0,0,NULL,'',''),(180,'20170209191229',4,'Admin',0,'Tools','Created page with \"Tip: Refresh after every edit!  {{#widget:Iframe |url=http://localhost/getToolsInfo.php |width=100% |height=670 |border=0 }}\"',0,0,1,25,177,0,1,'mw.new',1,'::1',0,124,0,0,NULL,'',''),(181,'20170210194325',5,'V00725852',2,'V00725852','',0,0,0,0,0,0,3,'mw.log',1,'10.122.38.69',NULL,NULL,0,136,'newusers','create','a:1:{s:9:\"4::userid\";i:5;}'),(182,'20170210202856',4,'Admin',0,'Team_Member','',0,0,0,15,178,166,0,'mw.edit',1,'10.122.38.62',157,160,0,0,NULL,'',''),(183,'20170210225242',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,179,145,0,'mw.edit',1,'::1',370,373,0,0,NULL,'',''),(184,'20170210231254',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,180,179,0,'mw.edit',1,'::1',373,370,0,0,NULL,'',''),(185,'20170210231416',4,'Admin',0,'Sample_Devices_Tracking','',0,0,0,16,181,180,0,'mw.edit',1,'::1',370,373,0,0,NULL,'',''),(186,'20170210231444',4,'Admin',0,'Model_&_Release','',0,0,0,23,182,170,0,'mw.edit',1,'::1',126,129,0,0,NULL,'',''),(187,'20170210231610',4,'Admin',0,'Project_Repositories','',0,0,0,20,183,150,0,'mw.edit',1,'10.122.38.62',224,227,0,0,NULL,'',''),(188,'20170210231630',4,'Admin',0,'Android_Source_Code_Repo','',0,0,0,21,184,156,0,'mw.edit',1,'10.122.38.62',135,138,0,0,NULL,'',''),(189,'20170210231707',4,'Admin',0,'HQ_Android_Released_Image','',0,0,0,22,185,174,0,'mw.edit',1,'10.122.38.62',130,133,0,0,NULL,'',''),(190,'20170210231725',4,'Admin',0,'Tools','',0,0,0,25,186,177,0,'mw.edit',1,'10.122.38.62',124,127,0,0,NULL,'',''),(191,'20170210231950',4,'Admin',0,'Team_Member','',0,0,0,15,187,178,0,'mw.edit',1,'10.122.38.62',160,140,0,0,NULL,'',''),(192,'20170210232018',4,'Admin',0,'Team_Member','',0,0,0,15,188,187,0,'mw.edit',1,'10.122.38.62',140,142,0,0,NULL,'',''),(193,'20170210232106',4,'Admin',0,'Team_Member','',0,0,0,15,189,188,0,'mw.edit',1,'10.122.38.62',142,150,0,0,NULL,'',''),(194,'20170210232150',4,'Admin',0,'Team_Member','',0,0,0,15,190,189,0,'mw.edit',1,'10.122.38.62',150,143,0,0,NULL,'',''),(195,'20170210232226',4,'Admin',0,'Team_Member','',0,0,0,15,191,190,0,'mw.edit',1,'10.122.38.62',143,145,0,0,NULL,'',''),(196,'20170210232333',4,'Admin',0,'Team_Member','',0,0,0,15,192,191,0,'mw.edit',1,'10.122.38.62',145,133,0,0,NULL,'',''),(197,'20170210232347',4,'Admin',0,'Team_Member','',0,0,0,15,193,192,0,'mw.edit',1,'10.122.38.62',133,140,0,0,NULL,'',''),(198,'20170210232600',4,'Admin',0,'Team_Member','',0,0,0,15,194,193,0,'mw.edit',1,'10.122.38.62',140,160,0,0,NULL,'',''),(199,'20170211014822',4,'Admin',0,'Model_&_Release','',0,0,0,23,195,182,0,'mw.edit',1,'10.122.38.62',129,192,0,0,NULL,'',''),(200,'20170211014844',4,'Admin',0,'Model_&_Release','',0,0,0,23,196,195,0,'mw.edit',1,'10.122.38.62',192,203,0,0,NULL,'',''),(201,'20170215230109',0,'10.122.38.54',0,'Huawei_Wiki','',0,0,0,7,197,172,0,'mw.edit',0,'10.122.38.54',190,207,0,0,NULL,'','');
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
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8 MAX_ROWS=10000000 AVG_ROW_LENGTH=1024;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` VALUES (1,1,1,'',0,'MediaWiki default','20170122203959',0,0,717,0,'6wzmf83s5t2n0ntohe3bmgww4dea1u3',NULL,NULL),(2,2,2,'Created page with \"Hello cat!\"',0,'0:0:0:0:0:0:0:1','20170124191325',0,0,10,0,'7g20z15a6qfuzpdurv7sulx2gts9er9',NULL,NULL),(3,3,3,'Headers Added',0,'0:0:0:0:0:0:0:1','20170124220520',0,0,66,0,'knb8gap9tqr903tr5vcj2cwx36lu31l',NULL,NULL),(4,3,4,'/* Career */',0,'0:0:0:0:0:0:0:1','20170124220754',0,0,133,3,'834ocemc04e4qj27m79jdkh3h5w4798',NULL,NULL),(5,3,5,'/* Contract */',0,'0:0:0:0:0:0:0:1','20170124221007',0,0,184,4,'ss26x9tk45c2ym8y1fl0lky4g40nuvs',NULL,NULL),(6,3,6,'',0,'0:0:0:0:0:0:0:1','20170124221128',0,0,244,5,'thgeokapjy9tpvph4pidv67bjm0nhz8',NULL,NULL),(7,3,7,'/* Introduction */',0,'0:0:0:0:0:0:0:1','20170124221242',0,0,283,6,'f7my96csskspg2b75wiplwpzjd6edek',NULL,NULL),(8,3,8,'/* Career */',0,'0:0:0:0:0:0:0:1','20170124221257',0,0,278,7,'i5zeub04u3urgdalm49uwg8x1czrl45',NULL,NULL),(9,3,9,'/* Career */',0,'0:0:0:0:0:0:0:1','20170124221318',0,0,282,8,'g8o0wz7ccsxwq40pdxx012u1f3hwlyl',NULL,NULL),(10,3,10,'/* Introduction */',0,'0:0:0:0:0:0:0:1','20170124221429',0,0,340,9,'gj98sjnuvxpfz3w0n7ybaex1c1ywzc8',NULL,NULL),(11,3,11,'/* Introduction */',0,'0:0:0:0:0:0:0:1','20170124221446',0,0,343,10,'re7kztc773qazsy899caunuatpw6z09',NULL,NULL),(12,3,12,'/* Introduction */',0,'0:0:0:0:0:0:0:1','20170124221507',0,0,345,11,'kg5r7a39wfz3zmu3f8ua9j3nhdt3qc6',NULL,NULL),(13,3,13,'/* Introduction */',0,'0:0:0:0:0:0:0:1','20170124221800',0,0,345,12,'h2vt52ozcqo6ymu4xzbx00l4hndp2fm',NULL,NULL),(14,4,14,'Created page with \"== Software Group ==  === Contract === [[Sen]]<br>    == Hardware Group ==\"',0,'0:0:0:0:0:0:0:1','20170124222016',0,0,74,0,'208f2es5mf0bxbuqdl0llfee3wd4hup',NULL,NULL),(15,5,15,'Created page with \"= VIP of Huawei Software Group = [[Sen]]\"',1,'SenLi','20170124225424',0,0,40,0,'4h8v1v8kh6qshiwpvc2x4y9z3f1vgvd',NULL,NULL),(16,6,16,'Created page with \" * navigation ** HuaweiWiki|huaweiwikipage-description ** mainpage|mainpage-description ** recentchanges-url|recentchanges ** randompage-url|randompage ** helppage|help * SEAR...\"',1,'SenLi','20170125003550',0,0,199,0,'4ofp8iwm2wy11adm3gwrxix337ewhcm',NULL,NULL),(17,6,17,'',1,'SenLi','20170125003613',0,0,172,16,'bzi1y235vwuxf37tonf5c957660mj0c',NULL,NULL),(18,6,18,'',1,'SenLi','20170125003630',0,0,186,17,'ibzuad7bnwho1estk33r7yuzbyjz0wu',NULL,NULL),(19,6,19,'',1,'SenLi','20170125005325',0,0,187,18,'pgxd6ose7rnwd2jnm2jk662x54srcf1',NULL,NULL),(20,7,20,'Created page with \"= Introduction =  == [[Employees]] ==  === [[[Software Group]]] ===  === [[[Hardware Group]]] ===\"',1,'SenLi','20170125005437',0,0,97,0,'rtn5m79c5hiqpzs90b9xaxqxmxnlrg8',NULL,NULL),(21,7,21,'/* Employees */',1,'SenLi','20170125005459',0,0,93,20,'j3fnfxupmqk63bxw1m81liznr8e4i55',NULL,NULL),(22,8,22,'Created page with \"Huawei Wiki\"',1,'SenLi','20170125005736',0,0,11,0,'hm416t17ijfa87cq1qundx86ivthy45',NULL,NULL),(23,6,23,'',1,'SenLi','20170125005814',0,0,154,19,'ovbse17xut7jsgzeog01qe10qcld0s8',NULL,NULL),(24,3,24,'',1,'SenLi','20170125013332',0,0,370,13,'9fvhr1mp84iizgioytu1o3n4anbnrs1',NULL,NULL),(25,3,25,'',1,'SenLi','20170125013555',0,0,374,24,'1hwowg30fdrrv4nmtsjyoj2w66zml9d',NULL,NULL),(26,3,26,'',1,'SenLi','20170125013612',0,0,370,25,'l45yx8quxt2aywc3d8pd2upobf57rl4',NULL,NULL),(27,3,27,'',1,'SenLi','20170125013634',0,0,370,26,'9fvhr1mp84iizgioytu1o3n4anbnrs1',NULL,NULL),(28,9,28,'Created page with \"This page contains all the employees of Huawei.\"',1,'SenLi','20170125013935',0,0,47,0,'cdr3d736f0jik3c7n7aub7xo5mmubr2',NULL,NULL),(29,10,29,'/* Employees */ new section',1,'SenLi','20170125014251',0,0,53,0,'9kbwmujawmnxvbf03xg5gfh0ajdjm1s',NULL,NULL),(30,10,30,'',1,'SenLi','20170125014355',0,0,82,29,'rhpahnwin5tuzyxcp2d7phi7278xfsd',NULL,NULL),(31,3,31,'',4,'Admin','20170125031740',0,0,399,27,'840x4sa8f868j321byudgox7i5na1wq',NULL,NULL),(32,11,32,'Sen Portrait',4,'Admin','20170125033001',0,0,12,0,'mex0r2pt8qi1ss9l4f4o9ocadziu62t',NULL,NULL),(33,3,33,'',4,'Admin','20170125033145',0,0,419,31,'j7encqoxnmf1tfi5xa2n25eg4o3j7ei',NULL,NULL),(34,3,34,'',4,'Admin','20170125033305',0,0,424,33,'q9mqpa9abgczj18033yyaeq1s9q7un8',NULL,NULL),(35,3,35,'',4,'Admin','20170125033327',0,0,422,34,'1rb3rheb4ez1t1du7t9a35yt291knzx',NULL,NULL),(36,3,36,'',4,'Admin','20170125033535',0,0,432,35,'oibg8wn0xggoub900xyp930el74jkm2',NULL,NULL),(37,3,37,'',4,'Admin','20170125033641',0,0,433,36,'7wp5dfn05tvp9bmcis61tkr778q4ep0',NULL,NULL),(38,3,38,'',4,'Admin','20170125033655',0,0,427,37,'sdn518g6s73plwm8w6dyfpsp1hz2cee',NULL,NULL),(39,3,39,'',4,'Admin','20170125033850',0,0,435,38,'dyae0y2x0lo1q1y85yi29wsigwcj6rt',NULL,NULL),(40,3,40,'',4,'Admin','20170125034143',0,0,435,39,'krmx5wuffery5z2s31vxq9aab6zzrhy',NULL,NULL),(41,3,41,'',4,'Admin','20170125035327',0,0,443,40,'9vkhm9p0ltkciiua734yoifvzkoyvqp',NULL,NULL),(42,3,42,'',4,'Admin','20170125035412',0,0,452,41,'b7l86euc3wxhu80js8jfb5n6mvsak7v',NULL,NULL),(43,3,43,'',4,'Admin','20170125035434',0,0,454,42,'cv6uljd9bvymtr6k6uo6o4ol3mduuis',NULL,NULL),(44,3,44,'',4,'Admin','20170125035624',0,0,515,43,'q566m75cslbnvfm9qlagb3wyabachse',NULL,NULL),(45,3,45,'',4,'Admin','20170125035642',0,0,520,44,'gkvfaupnxrybv5d3nj1ly8voucezqqv',NULL,NULL),(46,3,46,'',4,'Admin','20170125035654',0,0,524,45,'qu6q9tuznbujukep7an08187leg6wzw',NULL,NULL),(47,4,47,'/* Contract */',0,'0:0:0:0:0:0:0:1','20170126000719',0,0,123,14,'a7pg2n7uxhwk7hb4at4r2s83y837t8m',NULL,NULL),(48,4,48,'/* Contract */',0,'0:0:0:0:0:0:0:1','20170126000833',0,0,72,47,'qg2e3j7gb1gvj4dbm9t7if919iv22zc',NULL,NULL),(49,12,49,'',4,'Admin','20170126181036',0,0,351,0,'tkcgmjhbevu8cm329hkbs6rzf8fbugo',NULL,NULL),(50,13,50,'',4,'Admin','20170126181036',0,0,812,0,'1ghvp8xbcln0uouy8jg9ne4aw58256x',NULL,NULL),(51,9,51,'',4,'Admin','20170126194236',0,0,27,28,'0ddeiff5zt9kh7owa9szkmr8mqwzve4',NULL,NULL),(52,4,52,'',4,'Admin','20170126210501',0,0,94,48,'pzj9qvlo4iyubaj5v97zzie9s0z8hr3',NULL,NULL),(53,4,53,'',4,'Admin','20170126215629',0,0,134,52,'j7lqd88yg42dne3jb8h44ccwtgwnwf7',NULL,NULL),(54,4,54,'',4,'Admin','20170126215648',0,0,145,53,'g5k7an0jvqqrjq9cxic5hl9heb4nx9g',NULL,NULL),(55,4,55,'',4,'Admin','20170126215843',0,0,169,54,'sdvyfdlt3byp51saj5mc6ycdf79uihm',NULL,NULL),(56,4,56,'',4,'Admin','20170126215857',0,0,170,55,'690xjlj74drrlvyeakirlcvcuag26dk',NULL,NULL),(57,3,57,'',4,'Admin','20170126221832',0,0,532,46,'4v63xvaxyhnv3axkpgibjja1raszask',NULL,NULL),(58,3,58,'',4,'Admin','20170126221853',0,0,524,57,'qu6q9tuznbujukep7an08187leg6wzw',NULL,NULL),(59,12,59,'',4,'Admin','20170126222106',0,0,474,49,'eq1z5bi5124jiy0hdt9rbbxmfgb95mo',NULL,NULL),(60,12,60,'',4,'Admin','20170126222122',0,0,596,59,'93vm33tzr6i96hdjkzld5unzi83iuq2',NULL,NULL),(61,12,61,'',4,'Admin','20170126222140',0,0,598,60,'n4u6qrt15n6w4ckuwc39g8c7z0rt6o5',NULL,NULL),(62,4,62,'',4,'Admin','20170126222624',0,0,170,56,'m39z89wftizv3x45ngm2apesvtaamkm',NULL,NULL),(63,4,63,'',4,'Admin','20170126222902',0,0,166,62,'duf6wndln6gy8zvgmbq2p9i8pv90u0z',NULL,NULL),(64,14,64,'Created page with \"<noinclude>__NOTOC__ This widget allows you to embed any web page on your wiki page using an iframe tag.  Created by [https://www.mediawikiwidgets.org/User:Sergey_Chernyshev S...\"',4,'Admin','20170126232844',0,0,1373,0,'7hz9u8cn6stv2nzbyw9pkotiu1nn01s',NULL,NULL),(65,4,65,'',4,'Admin','20170126233045',0,0,134,63,'j7lqd88yg42dne3jb8h44ccwtgwnwf7',NULL,NULL),(66,4,66,'',4,'Admin','20170126233701',0,0,75,65,'0bgzckt522e3pyyu9dsw7rlwavzp7qw',NULL,NULL),(67,4,67,'',4,'Admin','20170126235115',0,0,198,66,'4z7zme2va8ehzv8wjhxsl3ecl2yegtb',NULL,NULL),(68,4,68,'',4,'Admin','20170126235248',0,0,94,67,'shrz9ybm3scu2vc84nc4fyd5xbqyd2z',NULL,NULL),(69,4,69,'',4,'Admin','20170126235257',0,0,93,68,'52eveiw44kk0wpholil5mmd6j15v0ib',NULL,NULL),(70,14,70,'',4,'Admin','20170126235634',0,0,1352,64,'iub4wdkkdj1m4m02jeu205g6jt9el9z',NULL,NULL),(71,14,71,'',4,'Admin','20170127001141',0,0,1373,70,'7hz9u8cn6stv2nzbyw9pkotiu1nn01s',NULL,NULL),(72,4,72,'',4,'Admin','20170127001205',0,0,87,69,'dlzty1wx0up7sm8jr3nhk6lukuusanw',NULL,NULL),(73,4,73,'/* Hardware Group */',4,'Admin','20170127001215',0,0,87,72,'4w7lsg3dbm2lxvxj2az8ku1j612cf9h',NULL,NULL),(74,14,74,'Blanked the page',4,'Admin','20170127002301',0,0,0,71,'phoiac9h4m842xq45sp7s6u21eteeq1',NULL,NULL),(75,4,75,'',4,'Admin','20170127002317',0,0,94,73,'ccipusuqqsl6am9kpqwkgjwemnubvsf',NULL,NULL),(76,14,76,'',4,'Admin','20170127002423',0,0,1180,74,'oudzoq8gnqw9hvuj48w2v75fm1yr0xv',NULL,NULL),(77,14,77,'',4,'Admin','20170127002501',0,0,657,76,'bxg1z0116ui3ew8myb027hj9m3v3am6',NULL,NULL),(78,4,78,'/* Hardware Group */',4,'Admin','20170127002655',0,0,193,75,'70hfjtpi5kphtb0pttyxn1pj1ehsz7q',NULL,NULL),(79,14,79,'',4,'Admin','20170127003049',0,0,1373,77,'7hz9u8cn6stv2nzbyw9pkotiu1nn01s',NULL,NULL),(80,4,80,'',4,'Admin','20170130165228',0,0,95,78,'nnvu5750pzxi6pjluguyv6dwdjpc8s1',NULL,NULL),(81,4,81,'',4,'Admin','20170130165712',0,0,1424,80,'63ilfoy0up98jc5ajhjrg6ggrg07ct8',NULL,NULL),(82,4,82,'Replaced content with \"   == Software Group ==  === Contract === [[Sen]]<br>   == Hardware Group ==\"',4,'Admin','20170130171224',0,0,76,81,'as3n9wynakai575ywcfanhy34wkitnd',NULL,NULL),(83,4,83,'',4,'Admin','20170130190021',0,0,125,82,'1fhv4i10yiuc6yjpk2l0cpncusj3pjn',NULL,NULL),(84,4,84,'',4,'Admin','20170130190056',0,0,195,83,'bqbhb52x3mas57dmqvhrt7fmfn22rpd',NULL,NULL),(85,4,85,'',4,'Admin','20170130191155',0,0,173,84,'cfl75arlwv17yfgyqx3ck2sntmjshpw',NULL,NULL),(86,4,86,'',4,'Admin','20170130193938',0,0,179,85,'iehybem6h24oalifws24uteze7imclc',NULL,NULL),(87,4,87,'',4,'Admin','20170130193956',0,0,179,86,'bo22fyo2fk1h9xkzhltznh6jp3umagz',NULL,NULL),(88,4,88,'',4,'Admin','20170130194004',0,0,177,87,'cvougzpru0ji8a7lm8gtgt28om70kmw',NULL,NULL),(89,4,89,'',4,'Admin','20170130194019',0,0,175,88,'sravac20p080gw5xq03pp50pq1pa90x',NULL,NULL),(90,4,90,'',4,'Admin','20170130194029',0,0,175,89,'n4dlq9hs81urfxd9l197q1dqrz110k1',NULL,NULL),(91,4,91,'',4,'Admin','20170130194042',0,0,174,90,'b5n267s9abb7ygkg2mp1h67xxti9vi9',NULL,NULL),(92,4,92,'',4,'Admin','20170130194050',0,0,174,91,'puhzyywj7qvpambtbmxaj0ztx9pll91',NULL,NULL),(93,4,93,'/* Hardware Group */',4,'Admin','20170130194712',0,0,175,92,'s9kuntckdv9gqhy7cf9n3w9h1s4mc1o',NULL,NULL),(94,4,94,'/* Hardware Group */',4,'Admin','20170130195003',0,0,176,93,'brgrl3kx6awka3zpxmw1obqbjlljv3e',NULL,NULL),(95,4,95,'/* Hardware Group */',4,'Admin','20170130195230',0,0,236,94,'3bvy43chw7e729jmjk30aga250bukgj',NULL,NULL),(96,4,96,'/* Hardware Group */',4,'Admin','20170130200045',0,0,239,95,'hht1fkc4o7f8z6o56u82ja5v7a33b2d',NULL,NULL),(97,7,97,'',4,'Admin','20170131032316',0,0,107,21,'9hpj93w1zjmk69jvpu6bsp92hfdsqxk',NULL,NULL),(98,7,98,'',4,'Admin','20170131032344',0,0,81,97,'9kf4ypuxesi5nrc6wzs9ci77apx4cll',NULL,NULL),(99,4,99,'/* Hardware Group */',4,'Admin','20170131183559',0,0,324,96,'h69cqy3b9o2q1fmnpt8w69jzl34kmk1',NULL,NULL),(100,4,100,'/* Hardware Group */',4,'Admin','20170131183615',0,0,321,99,'dz2ug6u8tkowkyokfnb08wxkerj1l7h',NULL,NULL),(101,7,101,'',0,'0:0:0:0:0:0:0:1','20170131190542',0,0,326,98,'24maej7d4exf9mmcjxruhsk5a1xbrpi',NULL,NULL),(102,7,102,'',0,'0:0:0:0:0:0:0:1','20170131190618',0,0,327,101,'qdf1rowf9tg96ffemj9p88x8q6rp4sy',NULL,NULL),(103,15,103,'Created page with \"[http://192.168.1.61/addNewEmployee.php Add a New Employee] (Tip: You can click the middle button of the mouse to open this link in a New Page.)  {{#widget:Iframe |url=http://...\"',0,'0:0:0:0:0:0:0:1','20170131190721',0,0,244,0,'o48ym347n4hi2znlw5k585q44nmv3e0',NULL,NULL),(104,7,104,'',0,'0:0:0:0:0:0:0:1','20170131190827',0,0,74,102,'26vzga28v7dcuxni740fv2d6o0buwhm',NULL,NULL),(105,16,105,'Created page with \"{{#widget:Iframe |url=http://localhost/sortByDeviceID.php |width=100% |height=800 |border=0 }}\"',0,'0:0:0:0:0:0:0:1','20170131202410',0,0,94,0,'muypvxqc4j3pcq8p2vge8g0k9jgptw0',NULL,NULL),(106,7,106,'',0,'0:0:0:0:0:0:0:1','20170131202459',0,0,73,104,'jsbqfvokodpcnotq0e2tbyym7e0rzig',NULL,NULL),(107,17,107,'Created page with \"[[Categories:SortDevicesByDeviceID]]\"',0,'0:0:0:0:0:0:0:1','20170131215319',0,0,36,0,'t6w8m9ipfok8a98fko8khh3oddv8y3m',NULL,NULL),(108,17,108,'',0,'0:0:0:0:0:0:0:1','20170131215734',0,0,25,107,'6nq6jbhsrt0kp5w160br7fwslaq5yb7',NULL,NULL),(109,17,109,'',0,'0:0:0:0:0:0:0:1','20170131215750',0,0,25,108,'fv6z4dpy347sv9n7e6fm5r2l0kfpa18',NULL,NULL),(110,17,110,'',0,'0:0:0:0:0:0:0:1','20170131215803',0,0,25,109,'43hjzsmlm24qc0znfaq9939tq7imvjm',NULL,NULL),(111,17,111,'',0,'0:0:0:0:0:0:0:1','20170131215814',0,0,24,110,'ow7l5gld71y5cr0a2bw7wbj5bhw6t9l',NULL,NULL),(112,18,112,'Created page with \"[[category:SortDevices]]\"',0,'0:0:0:0:0:0:0:1','20170131215910',0,0,24,0,'ow7l5gld71y5cr0a2bw7wbj5bhw6t9l',NULL,NULL),(113,19,113,'Show Devices',0,'0:0:0:0:0:0:0:1','20170131215959',0,0,25,0,'flxg6sc06tvvpukd9jh1m4c649un0ai',NULL,NULL),(114,16,114,'Blanked the page',0,'0:0:0:0:0:0:0:1','20170131220141',0,0,0,105,'phoiac9h4m842xq45sp7s6u21eteeq1',NULL,NULL),(115,17,115,'',0,'0:0:0:0:0:0:0:1','20170131220159',0,0,122,111,'ddo6mdax6syi8c03r6gmyrh0nmy7y7r',NULL,NULL),(116,17,116,'',0,'0:0:0:0:0:0:0:1','20170131220212',0,0,122,115,'ob7swcjl91bcsb8o8itof6tw0un7utr',NULL,NULL),(117,17,117,'',0,'0:0:0:0:0:0:0:1','20170131220223',0,0,122,116,'omwneg87yv3b1f3882tbqi4vdxvb9fj',NULL,NULL),(118,17,118,'',0,'0:0:0:0:0:0:0:1','20170131220233',0,0,122,117,'dmw8ol5oc9y420jkbn5j80txv2u22wf',NULL,NULL),(119,17,119,'',0,'0:0:0:0:0:0:0:1','20170131220241',0,0,122,118,'36fdvmg5j5iwiqeg1pul96c4y85j02f',NULL,NULL),(120,17,120,'',0,'0:0:0:0:0:0:0:1','20170131220248',0,0,122,119,'sxqn214hh0ycp4xve0gwqk6xzvkj6lz',NULL,NULL),(121,7,121,'/* Sample Devices Tracking */',0,'0:0:0:0:0:0:0:1','20170131220352',0,0,172,106,'tgxsc9hd232hcg3vjnwtn09syhu2cea',NULL,NULL),(122,7,122,'',0,'0:0:0:0:0:0:0:1','20170131220422',0,0,73,121,'jsbqfvokodpcnotq0e2tbyym7e0rzig',NULL,NULL),(123,16,123,'',0,'0:0:0:0:0:0:0:1','20170131220437',0,0,93,114,'gzryqjagr38l2fjdee4zzo4dyjwiupj',NULL,NULL),(124,16,124,'/* SortDevicesByDeviceID */',0,'0:0:0:0:0:0:0:1','20170131220448',0,0,96,123,'987bfit6741f1vrfx51fk8aaoo3zqkl',NULL,NULL),(125,16,125,'',0,'0:0:0:0:0:0:0:1','20170131220502',0,0,106,124,'pu1ekvpdz6d23bvvawij6winf7mwjnz',NULL,NULL),(126,7,126,'',0,'0:0:0:0:0:0:0:1','20170131220533',0,0,57,122,'ajam90zsonreg32ek17jxdb34khez6c',NULL,NULL),(127,18,127,'',0,'0:0:0:0:0:0:0:1','20170131220745',0,0,125,112,'dpx94wd2apexq7i453zrvs82pomhr4v',NULL,NULL),(128,18,128,'',0,'0:0:0:0:0:0:0:1','20170131220944',0,0,97,127,'3rv4pyqqy8natl32fv30gp5gznesps6',NULL,NULL),(129,16,129,'',0,'0:0:0:0:0:0:0:1','20170131221023',0,0,94,125,'kfeb9q8dz7pjfn82rt6o2c8newm555p',NULL,NULL),(130,16,130,'',0,'0:0:0:0:0:0:0:1','20170131221429',0,0,236,129,'nu86hoqt0ji38i6p59smocidpv5lj6y',NULL,NULL),(131,6,131,'',4,'Admin','20170131222055',0,0,158,23,'rvhoor2bamkt1gheew5n8akigxllwmn',NULL,NULL),(132,6,132,'',4,'Admin','20170131222135',0,0,236,131,'s2flp0mp8lt2vquuagq8jtotn2uqybg',NULL,NULL),(133,6,133,'',4,'Admin','20170131222207',0,0,227,132,'5l6h8p6hgvvbwj8zg3pmkzuulrqdkjs',NULL,NULL),(134,6,134,'',4,'Admin','20170131222222',0,0,229,133,'9ukj8xf38bugpmhuz2p5nv1xqkt7e99',NULL,NULL),(135,16,135,'',4,'Admin','20170131224959',0,0,151,130,'ez7ygksqlee3q2qco0d9tqy1e96u0y7',NULL,NULL),(136,15,136,'',4,'Admin','20170131225357',0,0,98,103,'bezge1s1ppyuaraoiwnfb66sa5wxz8f',NULL,NULL),(137,16,137,'',4,'Admin','20170131225504',0,0,94,135,'kfeb9q8dz7pjfn82rt6o2c8newm555p',NULL,NULL),(138,15,138,'',4,'Admin','20170131230225',0,0,160,136,'p958fryvap0794flngdizesy55slg6c',NULL,NULL),(139,16,139,'',4,'Admin','20170131230413',0,0,300,137,'o2fu4pxn0pzp6cefy1az5wy4hmdpb8b',NULL,NULL),(140,16,140,'',4,'Admin','20170131230441',0,0,329,139,'igy86oje8xu9kcd1v5euj35samj7u31',NULL,NULL),(141,16,141,'',4,'Admin','20170131230634',0,0,307,140,'ou8817e5tjcnvhqhtm6p6v4tdzkb70o',NULL,NULL),(142,16,142,'',4,'Admin','20170131230659',0,0,328,141,'fno2uhtr6yiqv31p9icp230713gq7tj',NULL,NULL),(143,16,143,'',4,'Admin','20170131230726',0,0,319,142,'n02lsan24urwwa2pg3tp5ddpueruluu',NULL,NULL),(144,7,144,'',4,'Admin','20170201011300',0,0,90,126,'kgxnfkbggr3aww8ojclr3rrgjhszjpi',NULL,NULL),(145,16,145,'',4,'Admin','20170201011339',0,0,370,143,'nx5wh3n4jvajg13o3csjulsrqg93qad',NULL,NULL),(146,20,146,'Created page with \"{{#widget:Iframe |url=http://localhost/getProjectRepos.php |width=100% |height=670 |border=0 }}\"',4,'Admin','20170201011425',0,0,95,0,'0wi19crotf1ymm7vowerjgq2vvkwope',NULL,NULL),(147,6,147,'',4,'Admin','20170201021140',0,0,269,134,'sdz56ouem93ac07bwjc6qhw7gej9um4',NULL,NULL),(148,20,148,'',4,'Admin','20170201182450',0,0,530,146,'lyy8t8lw357w57zwihygb3e1xrwgwgk',NULL,NULL),(149,20,149,'',4,'Admin','20170201182509',0,0,188,148,'0q71lxtdbnsiijwv7rr39c6xyp77lrp',NULL,NULL),(150,20,150,'',4,'Admin','20170201182906',0,0,224,149,'np934ir2eoucv6jrg2lshtmqq4efues',NULL,NULL),(151,7,151,'',4,'Admin','20170201192422',0,0,127,144,'jeb5muzxxblwm3hz3uz0wq9z3dlbeed',NULL,NULL),(152,6,152,'',4,'Admin','20170201192457',0,0,311,147,'bvpn8imw4eyvhybgr1vv702m20xbmfz',NULL,NULL),(153,6,153,'',4,'Admin','20170201192508',0,0,317,152,'8lw12a3icju18e3xbw8m1sfa8xv3618',NULL,NULL),(154,21,154,'Created page with \"{{#widget:Iframe |url=http://localhost/getSourceCodeRepos.php |width=100% |height=670 |border=0 }}\"',4,'Admin','20170201200113',0,0,98,0,'eo3caa9b3yne390ygeig6pv90384kif',NULL,NULL),(155,21,155,'',4,'Admin','20170201201603',0,0,134,154,'nft7lvo0crfae8eilwjgmkeyfprj9e0',NULL,NULL),(156,21,156,'',4,'Admin','20170201201622',0,0,135,155,'dfit0nui921830y2g2xvbzc47f0t7dz',NULL,NULL),(157,7,157,'',4,'Admin','20170201204520',0,0,164,151,'sx58vrljtrh1d905renc4d7tqbd7t6m',NULL,NULL),(158,22,158,'Created page with \"{| class=\"wikitable sortable collapsible\" ! Name ! Description ! Instruction ! Tag |- | MediaWiki Image || reposR3 || To Be Determined |- |}\"',4,'Admin','20170201204646',0,0,140,0,'4cxm27aj8ndcppnv23s2xc1dj4zyc28',NULL,NULL),(159,22,159,'',4,'Admin','20170201204714',0,0,149,158,'gbsn2f236blhgqbqoqz0oebi3839zmn',NULL,NULL),(160,22,160,'',4,'Admin','20170201211654',0,0,163,159,'ljvucsv3qmqsmtojfgmlr89ybwplsh0',NULL,NULL),(161,22,161,'',4,'Admin','20170201211710',0,0,166,160,'fbkgq4ac9g97fpbg1j5agr3csx4hoew',NULL,NULL),(162,22,162,'',4,'Admin','20170201212744',0,0,390,161,'nb0qus2o5kvr3rpkmlv0gzj69jmsk08',NULL,NULL),(163,22,163,'',4,'Admin','20170201212928',0,0,440,162,'28heix98yjvg1ztyteqjxv7pmdwzz59',NULL,NULL),(164,6,164,'',4,'Admin','20170201213822',0,0,363,153,'ixesu19xetyrjeg1515tbswov8kmuu4',NULL,NULL),(165,22,165,'',4,'Admin','20170201213937',0,0,424,163,'f3b2wmdgzwqh5aymv4uklxkhu9suuc4',NULL,NULL),(166,15,166,'',0,'0:0:0:0:0:0:0:1','20170206043203',0,0,157,138,'bb5qqfg0fp4lf809j06yqzjgkr7bk5n',NULL,NULL),(167,6,167,'',4,'Admin','20170206233210',0,0,400,164,'hof8wsicdm3hjhdzglzjg58anym5z49',NULL,NULL),(168,6,168,'',4,'Admin','20170206233226',0,0,400,167,'ifdr2ps5vp08ibcb5vlkojl124qa942',NULL,NULL),(169,23,169,'Created page with \"{{#widget:Iframe |url=http://localhost/getReleaseView.php |width=100% |height=670 |border=0 }}\"',4,'Admin','20170206233255',0,0,94,0,'axterg0k9j991xwjuwpjt6014l8wgo7',NULL,NULL),(170,23,170,'',4,'Admin','20170206235829',0,0,126,169,'fq3jmaiqyx69flng85vgfcn8cfinmdm',NULL,NULL),(171,7,171,'',4,'Admin','20170207013641',0,0,190,157,'jcednwwqp6zfr2n1ofxryq4st90mb2u',NULL,NULL),(172,7,172,'',4,'Admin','20170207013658',0,0,190,171,'snjz8jvxfqrr67cq2umw0osmldrhbhf',NULL,NULL),(173,22,173,'',4,'Admin','20170207180505',0,0,556,165,'4hp2jo3p4h3aeb9dmawaj3fkhots57b',NULL,NULL),(174,22,174,'',4,'Admin','20170207180521',0,0,130,173,'6lnubly2hpfi84bt4oc0uadfo7fkjj4',NULL,NULL),(175,24,175,'Created page with \"{| class=\"wikitable sortable collapsible\" ! Name             ! Description    ! Instruction   ! Tag |- | MediaWiki Image || reposR3   <br> Use this way to continue more text...\"',4,'Admin','20170207180536',0,0,424,0,'f3b2wmdgzwqh5aymv4uklxkhu9suuc4',NULL,NULL),(176,6,176,'',4,'Admin','20170209183618',0,0,388,168,'mj3jpcy6jqzcak5iqesww92tp5pp7ll',NULL,NULL),(177,25,177,'Created page with \"Tip: Refresh after every edit!  {{#widget:Iframe |url=http://localhost/getToolsInfo.php |width=100% |height=670 |border=0 }}\"',4,'Admin','20170209191229',0,0,124,0,'5c5eenyg9y0wbjstoo54wir1x31zim6',NULL,NULL),(178,15,178,'',4,'Admin','20170210202856',0,0,160,166,'1m2t8w3whfmohiitbd4c7rsr4fioeex',NULL,NULL),(179,16,179,'',4,'Admin','20170210225242',0,0,373,145,'o1jcmcilcpqgw4hfguq3jto0n645omt',NULL,NULL),(180,16,180,'',4,'Admin','20170210231254',0,0,370,179,'8zf0150a37goylyt2qpk6r4qrxwbsry',NULL,NULL),(181,16,181,'',4,'Admin','20170210231416',0,0,373,180,'o1jcmcilcpqgw4hfguq3jto0n645omt',NULL,NULL),(182,23,182,'',4,'Admin','20170210231444',0,0,129,170,'f1ct3oyc0jtfmespzl0csi2gwgp9b73',NULL,NULL),(183,20,183,'',4,'Admin','20170210231610',0,0,227,150,'9ni6kygq4qd1tldk61icjvl61ois3x8',NULL,NULL),(184,21,184,'',4,'Admin','20170210231630',0,0,138,156,'5stx2zzbbm79lgn3ekbmtbz7fsjeuzj',NULL,NULL),(185,22,185,'',4,'Admin','20170210231707',0,0,133,174,'kr22oube8zxoyx102h92c5s5whkfpvi',NULL,NULL),(186,25,186,'',4,'Admin','20170210231725',0,0,127,177,'jlkwxc53i5x7rbe8wo1l0aqyajolwi9',NULL,NULL),(187,15,187,'',4,'Admin','20170210231950',0,0,140,178,'6w15qpspx2tkpt6f239h46r5ajeu8zc',NULL,NULL),(188,15,188,'',4,'Admin','20170210232018',0,0,142,187,'dv9t9ixu5smn5ffyq22x7cgnuhpjl8a',NULL,NULL),(189,15,189,'',4,'Admin','20170210232106',0,0,150,188,'j9kiwn9sbuprjgfvamknh3xzzk38i5v',NULL,NULL),(190,15,190,'',4,'Admin','20170210232150',0,0,143,189,'5pgvijrhohpup0q6hyhp3qh34tmz1la',NULL,NULL),(191,15,191,'',4,'Admin','20170210232226',0,0,145,190,'haylbcg8wahcsikj2pmk872q99fzw8q',NULL,NULL),(192,15,192,'',4,'Admin','20170210232333',0,0,133,191,'k1yxm62h3oid1ctauqjn8y7e2udjlzx',NULL,NULL),(193,15,193,'',4,'Admin','20170210232347',0,0,140,192,'poqwg5rqw4lvb3mjmtq49i34oo9opmp',NULL,NULL),(194,15,194,'',4,'Admin','20170210232600',0,0,160,193,'1m2t8w3whfmohiitbd4c7rsr4fioeex',NULL,NULL),(195,23,195,'',4,'Admin','20170211014822',0,0,192,182,'0i6xjra43c1vr0fvdl0zjyd1rcc4kqo',NULL,NULL),(196,23,196,'',4,'Admin','20170211014844',0,0,203,195,'2szzmxf37rapntabf60y09ud20vtuxn',NULL,NULL),(197,7,197,'',0,'10.122.38.54','20170215230109',0,0,207,172,'1eyyeaptjo4mdkklo7os2js7mmhth83',NULL,NULL);
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
INSERT INTO `searchindex` VALUES (2,'cats',' hello catu800 '),(3,'senu800',' file senu800u82ejpgu800 link senu800 thumb 200px right introduction senu800 senu800\'su800 optical flow bleu800 tracking module senu800 senu800\'su800 linkedin career career career senu800 senu800\'su800 career after hisu800 graduation ofu800 master life starts from huawei. ---- contract contract contract there isu800  nou800   paid break   atu800 allu800 . interests interests interests * hiking * jogging * swimming dreams dreams dreams balance between constrained andu800 unconstrained category employees '),(4,'employees',' software group software group software group contract contract contract senu800 hardware group hardware group hardware group addu800 au800 newu800 employee tipu800 youu800 canu800 click theu800 middle button ofu800 theu800 mouse tou800 open this link inu800 au800 newu800 page. #widget iframe urlu800 width 100u800 height 800u800 border 0u800 '),(5,'senli',' vipu800 ofu800 huawei software group senu800 '),(6,'sidebar',' * navigation ** huawei wiki huawei wiki ** team member team member ** sample devices tracking devices tracking ** model & release model & release ** project repositories project repos ** android source code repo source code repos ** hqu800 android released image released image ** tools tools ** recentchanges-urlu800 recentchanges ** helppage help * search * toolbox * languages '),(7,'huawei wiki',' team member sample devices tracking sample devices tracking sample devices tracking model & release project repositories project repositories project repositories android source code repo hqu800 android released image hqu800 android released image hqu800 android released image tools '),(8,'mainpage',' huawei wiki '),(9,'employees',' #default_form employees '),(10,'huawei wiki',' h1bu800 employees theu800 sponsorship ofu800 h1bu800 visa inu800 theu800 uu800u82esu800. foru800 huawei employees. '),(11,'senu800u82ejpgu800',' senu800 portrait '),(12,'tabletesttemplate',' this isu800 theu800 \"tabletesttemplate\" template. itu800 should beu800 called inu800 theu800 following format tabletesttemplate user_name firstname edit theu800 page tou800 seeu800 theu800 template text. class \"wikitable\" user_name user_name - firstname firstname category employees '),(13,'employees',' this isu800 theu800 \"employees\" form. tou800 create au800 page with this form enter theu800 page name below; ifu800 au800 page with that name already exists youu800 will beu800 sent tou800 au800 form tou800 edit that page. #forminput form employees foru800 template tabletesttemplate class \"formtable\" user_name field user_name - firstname field firstname endu800 template  free text   standard input free text rows 10u800 standard input summary standard input minor edit standard input watch standard input save standard input preview standard input changes standard input cancel '),(14,'iframe',' __notoc__ this widget allows youu800 tou800 embed anyu800 webu800 page onu800 your wiki page using anu800 iframe tagu800. created byu800 sergey chernyshev using this widget using this widget using this widget foru800 information onu800 howu800 tou800 useu800 this widget seeu800 widget description page onu800 mediawikiwidgetsu82eorgu800 .   this widget shouldn\'tu800 beu800 used onu800 au800 publicly-editable wiki.   while theu800 urlu800 isu800 validated tou800 beu800 au800 valid urlu800 there isu800 nou800 wayu800 theu800 widget canu800 check theu800 contents ofu800 theu800 page that isu800 included. when enabling this widget youu800 allow anyu800 user that canu800 edit tou800 include anyu800 page including malicious pages containing trojans backdoors viruses etcu800 pages that brake outu800 ofu800 theu800 iframe andu800 pages that look like your site butu800 actually isu800 au800 copy used foru800 phishing. copy tou800 your site copy tou800 your site copy tou800 your site tou800 useu800 this widget onu800 your site just install mediawiki widgets extension andu800 copy theu800 fullurl fullpagename action edit full source code ofu800 this page tou800 your wiki asu800 page   fullpagename  . \" frameborder \" -- border validate intu800 default 0u800 -- \" width \" -- width escape html default 400u800 -- \" height \" -- height escape html default 300u800 -- \" '),(16,'sample devices tracking',' 1u800. click owner idu800 number tou800 edit owner information; 2u800. click device idu800 number tou800 edit device information; 3u800. click owner name tou800 sort devices byu800 \"owner\"; 4u800. click model tou800 sort devices byu800 \"model\"; 5u800. refresh current page whenever youu800 edit. #widget iframe urlu800 width 100u800 height 670u800 border 0u800 '),(17,'sortdevicesbydeviceid',' #widget iframe urlu800 width 100u800 height 670u800 border 0u800 category sortdevices '),(18,'sortdevicesbydevicemodel',' #widget iframe urlu800 width 100u800 height 670u800 border 0u800 '),(15,'team member',' tips click employee idu800 number tou800 edit employee information. #widget iframe urlu800 width 100u800 height 800u800 border 0u800 '),(19,'sortdevices',' sample devices management '),(20,'project repositories',' class \"wikitable sortable collapsible\" user name password repo address - repos reposr3 tou800 beu800 determined - #widget iframe urlu800 width 100u800 height 670u800 border 0u800 '),(21,'android source code repo',' tips please refresh after anu800 edit. #widget iframe urlu800 width 100u800 height 670u800 border 0u800 '),(22,'hqu800 android released image',' tips please refresh after anu800 edit. #widget iframe urlu800 width 100u800 height 670u800 border 0u800 '),(23,'model & release',' tipu800 1u800. youu800 need tou800 create your expected source andu800 image first 2u800. refresh after every edit #widget iframe urlu800 width 100u800 height 670u800 border 0u800 '),(24,'senform',' class \"wikitable sortable collapsible\" name description instruction tagu800 - mediawiki image reposr3 useu800 this wayu800 tou800 continue more text just easy like this tou800 beu800 determined 2017-2u800-01u800 - knock knock hello look atu800 meu800 2017-1u800-16u800 - rock good byeu800 #time yu800-mu800-du800 - '),(25,'tools',' tipu800 refresh after every edit #widget iframe urlu800 width 100u800 height 670u800 border 0u800 ');
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
INSERT INTO `site_stats` VALUES (1,196,3,24,4,2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8 MAX_ROWS=10000000 AVG_ROW_LENGTH=10240;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (1,'<strong>MediaWiki has been installed.</strong>\n\nConsult the [https://meta.wikimedia.org/wiki/Help:Contents User\'s Guide] for information on using the wiki software.\n\n== Getting started ==\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings Configuration settings list]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ MediaWiki FAQ]\n* [https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce MediaWiki release mailing list]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources Localise MediaWiki for your language]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Combating_spam Learn how to combat spam on your wiki]','utf-8'),(2,'Hello cat!','utf-8'),(3,'= Introduction =\n\n== Career ==\n\n=== Contract ===\n\n\n== Interests ==','utf-8'),(4,'= Introduction =\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n=== Contract ===\n\n== Interests ==','utf-8'),(5,'= Introduction =\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==','utf-8'),(6,'= Introduction =\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==','utf-8'),(7,'= Introduction =\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==','utf-8'),(8,'= Introduction =\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==','utf-8'),(9,'= Introduction =\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==','utf-8'),(10,'= Introduction =\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==','utf-8'),(11,'= Introduction =\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module] \\n\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==','utf-8'),(12,'= Introduction =\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module] [\\n]\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==','utf-8'),(13,'= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==','utf-8'),(14,'== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n\n== Hardware Group ==','utf-8'),(15,'= VIP of Huawei Software Group =\n[[Sen]]','utf-8'),(16,'\n* navigation\n** HuaweiWiki|huaweiwikipage-description\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(17,'\n* navigation\n** HuaweiWiki\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(18,'\n* navigation\n** HuaweiWiki | Huawei Wiki\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(19,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(20,'= Introduction =\n\n== [[Employees]] ==\n\n=== [[[Software Group]]] ===\n\n=== [[[Hardware Group]]] ===','utf-8'),(21,'= Introduction =\n\n== [[Employees]] ==\n\n=== [[Software Group]] ===\n\n=== [[Hardware Group]] ===','utf-8'),(22,'Huawei Wiki','utf-8'),(23,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(24,'= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n\n\n[[Category:Employees]]','utf-8'),(25,'= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n\n\n[[Category:[[Employees]]]]','utf-8'),(26,'= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n\n\nCategory:[[Employees]]','utf-8'),(27,'= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n\n\n[[Category:Employees]]','utf-8'),(28,'This page contains all the employees of Huawei.','utf-8'),(29,'== Employees ==\n\nThe information for Huawei Employees','utf-8'),(30,'== H1B Employees ==\n\nThe sponsorship of H1B visa in the U.S. for Huawei Employees.','utf-8'),(31,'= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(32,'Sen Portrait','utf-8'),(33,'= Introduction = [[File:Example.jpg]]\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(34,'= Introduction = \n[[File:Sen.jpg | thumb]]\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(35,'= Introduction = \n[[File:Sen.jpg|thumb]]\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(36,'= Introduction = \n[[File:Sen.jpg | thumb | 300px]]\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(37,'= Introduction = \n[[File:Sen.jpg | link=employees]]\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(38,'= Introduction = \n[[File:Sen.jpg | link=Sen]]\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(39,'= Introduction = \n[[File:Sen.jpg | link=Sen | thumb]]\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(40,'= Introduction = \n[[File:Sen.jpg | link=Sen | 200px]]\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(41,'= Introduction = \n[[File:Sen.jpg | link=Sen | 200px | right]]\n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(42,'[[File:Sen.jpg | link=Sen | thumb | 200px | right]]\n\n= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(43,'[[File:Sen.jpg | link=Sen | thumb | 200px | right]]\n\n= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n[[Category:Employees]]','utf-8'),(44,'[[File:Sen.jpg | link=Sen | thumb | 200px | right]]\n\n= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n== Dreams ==\nBalance between constrained and unconstrained\n\n\n[[Category:Employees]]','utf-8'),(45,'[[File:Sen.jpg | link=Sen | thumb | 200px | right]]\n\n<br>\n= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n== Dreams ==\nBalance between constrained and unconstrained\n\n\n[[Category:Employees]]','utf-8'),(46,'[[File:Sen.jpg | link=Sen | thumb | 200px | right]]\n\n<br><br>\n= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n== Dreams ==\nBalance between constrained and unconstrained\n\n\n[[Category:Employees]]','utf-8'),(47,'== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n<include src=\"http://www.ietf.org/rfc/rfc1945\"  />\n\n== Hardware Group ==','utf-8'),(48,'== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==','utf-8'),(49,'<noinclude>\nThis is the \"TableTestTemplate\" template.\nIt should be called in the following format:\n<pre>\n{{TableTestTemplate\n|user_name=\n|FirstName=\n}}\n</pre>\nEdit the page to see the template text.\n</noinclude><includeonly>{| class=\"wikitable\"\n! user_name\n| {{{user_name|}}}\n|-\n! FirstName\n| {{{FirstName|}}}\n|}\n\n[[Category:Employees]]\n</includeonly>','utf-8'),(50,'<noinclude>\nThis is the \"Employees\" form.\nTo create a page with this form, enter the page name below;\nif a page with that name already exists, you will be sent to a form to edit that page.\n\n\n{{#forminput:form=Employees}}\n\n</noinclude><includeonly>\n<div id=\"wikiPreview\" style=\"display: none; padding-bottom: 25px; margin-bottom: 25px; border-bottom: 1px solid #AAAAAA;\"></div>\n{{{for template|TableTestTemplate}}}\n{| class=\"formtable\"\n! User_name: \n| {{{field|user_name}}}\n|-\n! FirstName: \n| {{{field|FirstName}}}\n|}\n{{{end template}}}\n\n\'\'\'Free text:\'\'\'\n\n{{{standard input|free text|rows=10}}}\n\n\n{{{standard input|summary}}}\n\n{{{standard input|minor edit}}} {{{standard input|watch}}}\n\n{{{standard input|save}}} {{{standard input|preview}}} {{{standard input|changes}}} {{{standard input|cancel}}}\n</includeonly>','utf-8'),(51,'{{#default_form:Employees}}','utf-8'),(52,'{{TableTestTemplate}}\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==','utf-8'),(53,'{{TableTestTemplate\n|user_name=liziyuanhaha\n|FirstName=Sen\n}}\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==','utf-8'),(54,'{{TableTestTemplate\n|user_name=liziyuanhaha\n|FirstName=Sen\n}}\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n\n<?php\n\n?>','utf-8'),(55,'{{TableTestTemplate\n|user_name=liziyuanhaha\n|FirstName=Sen\n}}\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n\n<?xml version=\"1.0\"?>\n<api>\n/api>','utf-8'),(56,'{{TableTestTemplate\n|user_name=liziyuanhaha\n|FirstName=Sen\n}}\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n\n<?xml version=\"1.0\"?>\n<api>\n</api>','utf-8'),(57,'[[include:File:Sen.jpg | link=Sen | thumb | 200px | right]]\n\n<br><br>\n= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n== Dreams ==\nBalance between constrained and unconstrained\n\n\n[[Category:Employees]]','utf-8'),(58,'[[File:Sen.jpg | link=Sen | thumb | 200px | right]]\n\n<br><br>\n= Introduction = \n\n[http://senon.cu.cc/Sen_PSoC_BLE_Optical-Flow.html Sen\'s Optical Flow BLE Tracking Module]<br>\n[https://www.linkedin.com/in/sensprouting Sen\'s LinkedIn]\n\n\n\n== Career ==\nSen\'s career after his graduation of master life starts from Huawei.\n----\n\n=== Contract ===\nThere is \'\'\'no\'\'\' \'\'paid break\'\' \'\'\'\'\'at all\'\'\'\'\'.\n\n== Interests ==\n* hiking\n* jogging\n* swimming\n\n== Dreams ==\nBalance between constrained and unconstrained\n\n\n[[Category:Employees]]','utf-8'),(59,'<noinclude>\nThis is the \"TableTestTemplate\" template.\nIt should be called in the following format:\n<pre>\n{{TableTestTemplate\n|user_name=\n|FirstName=\n}}\n</pre>\nEdit the page to see the template text.\n</noinclude><includeonly>{| class=\"wikitable\"\n! user_name\n| {{{user_name|}}}\n|-\n! FirstName\n| {{{FirstName|}}}\n|}\n\n[[Category:Employees]]\n</includeonly>\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/5pdaB2cejZU\" frameborder=\"0\" allowfullscreen></iframe>','utf-8'),(60,'<noinclude>\nThis is the \"TableTestTemplate\" template.\nIt should be called in the following format:\n<pre>\n{{TableTestTemplate\n|user_name=\n|FirstName=\n}}\n</pre>\nEdit the page to see the template text.\n</noinclude><includeonly>{| class=\"wikitable\"\n! user_name\n| {{{user_name|}}}\n|-\n! FirstName\n| {{{FirstName|}}}\n|}\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/5pdaB2cejZU\" frameborder=\"0\" allowfullscreen></iframe>\n[[Category:Employees]]\n</includeonly>\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/5pdaB2cejZU\" frameborder=\"0\" allowfullscreen></iframe>','utf-8'),(61,'<noinclude>\nThis is the \"TableTestTemplate\" template.\nIt should be called in the following format:\n<pre>\n{{TableTestTemplate\n|user_name=\n|FirstName=\n}}\n</pre>\nEdit the page to see the template text.\n</noinclude><includeonly>{| class=\"wikitable\"\n! user_name\n| {{{user_name|}}}\n|-\n! FirstName\n| {{{FirstName|}}}\n|}\n[[Category:Employees]]\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/5pdaB2cejZU\" frameborder=\"0\" allowfullscreen></iframe>\n\n\n</includeonly>\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/5pdaB2cejZU\" frameborder=\"0\" allowfullscreen></iframe>','utf-8'),(62,'{{TableTestTemplate\n|user_name=liziyuanhaha\n|FirstName=Sen\n}}\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n\n{{#widget:YouTube|id=cBr3uAcGXkQ}}','utf-8'),(63,'{{TableTestTemplate\n|user_name=liziyuanhaha\n|FirstName=Sen\n}}\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n\n{{#ev:YouTube|id=cBr3uAcGXkQ}}','utf-8'),(64,'<noinclude>__NOTOC__\nThis widget allows you to embed any web page on your wiki page using an iframe tag.\n\nCreated by [https://www.mediawikiwidgets.org/User:Sergey_Chernyshev Sergey Chernyshev]\n\n== Using this widget ==\nFor information on how to use this widget, see [https://www.mediawikiwidgets.org/Iframe widget description page on MediaWikiWidgets.org].\n\n<big>\'\'\'<font color=\"red\">This widget shouldn\'t be used on a publicly-editable wiki.</font>\'\'\'</big>\n\nWhile the url is validated to be a valid url, there is no way the widget can check the contents of the page that is included. When enabling this widget, you allow any user that can edit to include any page, including malicious pages (containing trojans, backdoors, viruses etc), pages that brake out of the iframe and pages that look like your site, but actually is a copy used for phishing.\n\n== Copy to your site ==\nTo use this widget on your site, just install [https://www.mediawiki.org/wiki/Extension:Widgets MediaWiki Widgets extension] and copy the [{{fullurl:{{FULLPAGENAME}}|action=edit}} full source code] of this page to your wiki as page \'\'\'{{FULLPAGENAME}}\'\'\'.\n</noinclude><includeonly><iframe src=\"<!--{$url|validate:url}-->\" frameborder=\"<!--{$border|validate:int|default:0}-->\" width=\"<!--{$width|escape:html|default:400}-->\" height=\"<!--{$height|escape:html|default:300}-->\"></iframe></includeonly>','utf-8'),(65,'{{TableTestTemplate\n|user_name=liziyuanhaha\n|FirstName=Sen\n}}\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==','utf-8'),(66,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==','utf-8'),(67,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/uvetMOMpHsw\" frameborder=\"0\" allowfullscreen></iframe>','utf-8'),(68,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n[[#widget:Iframe]]','utf-8'),(69,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n[[widget:Iframe]]','utf-8'),(70,'This widget allows you to embed any web page on your wiki page using an iframe tag.\n\nCreated by [https://www.mediawikiwidgets.org/User:Sergey_Chernyshev Sergey Chernyshev]\n\n== Using this widget ==\nFor information on how to use this widget, see [https://www.mediawikiwidgets.org/Iframe widget description page on MediaWikiWidgets.org].\n\n<big>\'\'\'<font color=\"red\">This widget shouldn\'t be used on a publicly-editable wiki.</font>\'\'\'</big>\n\nWhile the url is validated to be a valid url, there is no way the widget can check the contents of the page that is included. When enabling this widget, you allow any user that can edit to include any page, including malicious pages (containing trojans, backdoors, viruses etc), pages that brake out of the iframe and pages that look like your site, but actually is a copy used for phishing.\n\n== Copy to your site ==\nTo use this widget on your site, just install [https://www.mediawiki.org/wiki/Extension:Widgets MediaWiki Widgets extension] and copy the [{{fullurl:{{FULLPAGENAME}}|action=edit}} full source code] of this page to your wiki as page \'\'\'{{FULLPAGENAME}}\'\'\'.\n</noinclude><includeonly><iframe src=\"<!--{$url|validate:url}-->\" frameborder=\"<!--{$border|validate:int|default:0}-->\" width=\"<!--{$width|escape:html|default:400}-->\" height=\"<!--{$height|escape:html|default:300}-->\"></iframe></includeonly>','utf-8'),(71,'<noinclude>__NOTOC__\nThis widget allows you to embed any web page on your wiki page using an iframe tag.\n\nCreated by [https://www.mediawikiwidgets.org/User:Sergey_Chernyshev Sergey Chernyshev]\n\n== Using this widget ==\nFor information on how to use this widget, see [https://www.mediawikiwidgets.org/Iframe widget description page on MediaWikiWidgets.org].\n\n<big>\'\'\'<font color=\"red\">This widget shouldn\'t be used on a publicly-editable wiki.</font>\'\'\'</big>\n\nWhile the url is validated to be a valid url, there is no way the widget can check the contents of the page that is included. When enabling this widget, you allow any user that can edit to include any page, including malicious pages (containing trojans, backdoors, viruses etc), pages that brake out of the iframe and pages that look like your site, but actually is a copy used for phishing.\n\n== Copy to your site ==\nTo use this widget on your site, just install [https://www.mediawiki.org/wiki/Extension:Widgets MediaWiki Widgets extension] and copy the [{{fullurl:{{FULLPAGENAME}}|action=edit}} full source code] of this page to your wiki as page \'\'\'{{FULLPAGENAME}}\'\'\'.\n</noinclude><includeonly><iframe src=\"<!--{$url|validate:url}-->\" frameborder=\"<!--{$border|validate:int|default:0}-->\" width=\"<!--{$width|escape:html|default:400}-->\" height=\"<!--{$height|escape:html|default:300}-->\"></iframe></includeonly>','utf-8'),(72,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n{{#widget}}','utf-8'),(73,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n{{#Widget}}','utf-8'),(74,'','utf-8'),(75,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n{{#Widget:IFrame}}','utf-8'),(76,'\n== Using this widget ==\nFor information on how to use this widget, see [https://www.mediawikiwidgets.org/Iframe widget description page on MediaWikiWidgets.org].\n\n<big>\'\'\'<font color=\"red\">This widget shouldn\'t be used on a publicly-editable wiki.</font>\'\'\'</big>\n\nWhile the url is validated to be a valid url, there is no way the widget can check the contents of the page that is included. When enabling this widget, you allow any user that can edit to include any page, including malicious pages (containing trojans, backdoors, viruses etc), pages that brake out of the iframe and pages that look like your site, but actually is a copy used for phishing.\n\n== Copy to your site ==\nTo use this widget on your site, just install [https://www.mediawiki.org/wiki/Extension:Widgets MediaWiki Widgets extension] and copy the [{{fullurl:{{FULLPAGENAME}}|action=edit}} full source code] of this page to your wiki as page \'\'\'{{FULLPAGENAME}}\'\'\'.\n</noinclude><includeonly><iframe src=\"<!--{$url|validate:url}-->\" frameborder=\"<!--{$border|validate:int|default:0}-->\" width=\"<!--{$width|escape:html|default:400}-->\" height=\"<!--{$height|escape:html|default:300}-->\"></iframe></includeonly>','utf-8'),(77,'\n== Using this widget ==\nFor information on how to use this widget, see [https://www.mediawikiwidgets.org/Iframe widget description page on MediaWikiWidgets.org].\n\n<big>\'\'\'<font color=\"red\">This widget shouldn\'t be used on a publicly-editable wiki.</font>\'\'\'</big>\n\nWhile the url is validated to be a valid url, there is no way the widget can check the contents of the page that is included. When enabling this widget, you allow any user that can edit to include any page, including malicious pages (containing trojans, backdoors, viruses etc), pages that brake out of the iframe and pages that look like your site, but actually is a copy used for phishing.','utf-8'),(78,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n{{#Widget:IFrame\n|url=http://docs.google.com/present/embed?id=dcn37mcz_22cmnwnwf8\n|width=410\n|height=342\n|border=0\n}}','utf-8'),(79,'<noinclude>__NOTOC__\nThis widget allows you to embed any web page on your wiki page using an iframe tag.\n\nCreated by [https://www.mediawikiwidgets.org/User:Sergey_Chernyshev Sergey Chernyshev]\n\n== Using this widget ==\nFor information on how to use this widget, see [https://www.mediawikiwidgets.org/Iframe widget description page on MediaWikiWidgets.org].\n\n<big>\'\'\'<font color=\"red\">This widget shouldn\'t be used on a publicly-editable wiki.</font>\'\'\'</big>\n\nWhile the url is validated to be a valid url, there is no way the widget can check the contents of the page that is included. When enabling this widget, you allow any user that can edit to include any page, including malicious pages (containing trojans, backdoors, viruses etc), pages that brake out of the iframe and pages that look like your site, but actually is a copy used for phishing.\n\n== Copy to your site ==\nTo use this widget on your site, just install [https://www.mediawiki.org/wiki/Extension:Widgets MediaWiki Widgets extension] and copy the [{{fullurl:{{FULLPAGENAME}}|action=edit}} full source code] of this page to your wiki as page \'\'\'{{FULLPAGENAME}}\'\'\'.\n</noinclude><includeonly><iframe src=\"<!--{$url|validate:url}-->\" frameborder=\"<!--{$border|validate:int|default:0}-->\" width=\"<!--{$width|escape:html|default:400}-->\" height=\"<!--{$height|escape:html|default:300}-->\"></iframe></includeonly>','utf-8'),(80,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n== Hardware Group ==\n{{#Widget:IFrame\n}}','utf-8'),(81,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n<noinclude>__NOTOC__\nThis widget allows you to embed any web page on your wiki page using an iframe tag.\n\nCreated by [http://www.mediawikiwidgets.org/User:Sergey_Chernyshev Sergey Chernyshev]\n\n== Using this widget ==\nFor information on how to use this widget, see [http://www.mediawikiwidgets.org/Iframe widget description page on MediaWikiWidgets.org].\n\n<big>\'\'\'<font color=\"red\">This widget shouldn\'t be used on a publicly-editable wiki.</font>\'\'\'</big>\n\nWhile the url is validated to be a valid url, there is no way the widget can check the contents of the page that is included. When enabling this widget, you allow any user that can edit to include any page, including malicious pages (containing trojans, backdoors, viruses etc), pages that brake out of the iframe and pages that look like your site, but actually is a copy used for phishing.\n\n== Copy to your site ==\nTo use this widget on your site, just install [http://www.mediawiki.org/wiki/Extension:Widgets MediaWiki Widgets extension] and copy [{{fullurl:{{FULLPAGENAME}}|action=edit}} full source code] of this page to your wiki as \'\'\'{{FULLPAGENAME}}\'\'\' article.\n</noinclude><includeonly><iframe src=\"<!--{$url|validate:url}-->\" frameborder=\"<!--{$border|validate:int|default:0}-->\" width=\"<!--{$width|escape:html|default:400}-->\" height=\" <!--{$height|escape:html|default:300}-->\"></iframe></includeonly>','utf-8'),(82,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==','utf-8'),(83,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=https://www.google.com/\n}}','utf-8'),(84,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=https://docs.google.com/present/embed?id=dcn37mcz_22cmnwnwf8\n|width=410\n|height=342\n|border=0\n}}','utf-8'),(85,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=http://192.168.1.61/getstudentinfo.php\n|width=410\n|height=342\n|border=0\n}}','utf-8'),(86,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=http://192.168.1.61/getstudentinfo.php\n|width=\"100%\"\n|height=\"auto\"\n|border=0\n}}','utf-8'),(87,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=http://192.168.1.61/getstudentinfo.php\n|width=\'100%\'\n|height=\"auto\"\n|border=0\n}}','utf-8'),(88,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=http://192.168.1.61/getstudentinfo.php\n|width=100%\n|height=\"auto\"\n|border=0\n}}','utf-8'),(89,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=http://192.168.1.61/getstudentinfo.php\n|width=100%\n|height=auto\n|border=0\n}}','utf-8'),(90,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=http://192.168.1.61/getstudentinfo.php\n|width=100%\n|height=100%\n|border=0\n}}','utf-8'),(91,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=http://192.168.1.61/getstudentinfo.php\n|width=100%\n|height=100\n|border=0\n}}','utf-8'),(92,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n{{#widget:Iframe\n|url=http://192.168.1.61/getstudentinfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(93,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getstudentinfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(94,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(95,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n[http://192.168.1.61/addEmployee.php Add New Employee Info]\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(96,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n[http://192.168.1.61/addNewEmployee.php Add New Employee Info]\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(97,'= Introduction =\n\n== [[Team Member]] ==\n\n=== [[Sample Devices Tracking]] ===\n\n\n\n\n\n\n\n\n\n\n\n== [[Employees]] ==','utf-8'),(98,'= [[Team Member]] =\n\n= [[Sample Devices Tracking]] =\n\n\n\n\n\n\n\n\n\n\n\n= [[Employees]] =','utf-8'),(99,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n[http://192.168.1.61/addNewEmployee.php Add New Employee Info]\n(Tip: You can click the middle button of the mouse to open this link in a New Page.)\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(100,'\n\n\n== Software Group ==\n\n=== Contract ===\n[[Sen]]<br>\n\n\n== Hardware Group ==\n[http://192.168.1.61/addNewEmployee.php Add a New Employee]\n(Tip: You can click the middle button of the mouse to open this link in a New Page.)\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(101,'= [[Team Member]] =\n[http://192.168.1.61/addNewEmployee.php Add a New Employee]\n(Tip: You can click the middle button of the mouse to open this link in a New Page.)\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}\n\n= [[Sample Devices Tracking]] =\n\n\n\n\n\n\n\n\n\n\n\n= [[Employees]] =','utf-8'),(102,'= [[Team Member]] =\n[http://192.168.1.61/addNewEmployee.php Add a New Employee]\n(Tip: You can click the middle button of the mouse to open this link in a New Page.)\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=auto\n|border=0\n}}\n\n= [[Sample Devices Tracking]] =\n\n\n\n\n\n\n\n\n\n\n\n= [[Employees]] =','utf-8'),(103,'[http://192.168.1.61/addNewEmployee.php Add a New Employee]\n(Tip: You can click the middle button of the mouse to open this link in a New Page.)\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(104,'= [[Team Member]] =\n\n\n= [[Sample Devices Tracking]] =\n\n\n\n= [[Employees]] =','utf-8'),(105,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(106,'= [[Team Member]] =\n\n\n= [[Sample Devices Tracking]] =\n\n\n= [[Employees]] =','utf-8'),(107,'[[Categories:SortDevicesByDeviceID]]','utf-8'),(108,'[[Categoriy:SortDevices]]','utf-8'),(109,'[[Categoriy:sortDevices]]','utf-8'),(110,'[[categoriy:SortDevices]]','utf-8'),(111,'[[category:SortDevices]]','utf-8'),(112,'[[category:SortDevices]]','utf-8'),(113,'Sample Devices Management','utf-8'),(114,'','utf-8'),(115,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=800\n|border=0\n}}\n\n\n\n[[category:SortDevices]]','utf-8'),(116,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=600\n|border=0\n}}\n\n\n\n[[category:SortDevices]]','utf-8'),(117,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=700\n|border=0\n}}\n\n\n\n[[category:SortDevices]]','utf-8'),(118,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=680\n|border=0\n}}\n\n\n\n[[category:SortDevices]]','utf-8'),(119,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=660\n|border=0\n}}\n\n\n\n[[category:SortDevices]]','utf-8'),(120,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}\n\n\n\n[[category:SortDevices]]','utf-8'),(121,'= [[Team Member]] =\n\n\n= [[Sample Devices Tracking]] =\n== [[SortDevicesByDeviceID]] ==\n== [[SortDevicesByDeviceModel]] ==\n== [[SortDevicesByOwnerName]] ==\n\n= [[Employees]] =','utf-8'),(122,'= [[Team Member]] =\n\n\n= [[Sample Devices Tracking]] =\n\n\n= [[Employees]] =','utf-8'),(123,'= [[SortDevicesByDeviceID]] =\n= [[SortDevicesByDeviceModel]] =\n= [[SortDevicesByOwnerName]] =','utf-8'),(124,'== [[SortDevicesByDeviceID]] ==\n\n= [[SortDevicesByDeviceModel]] =\n= [[SortDevicesByOwnerName]] =','utf-8'),(125,'=== [[SortDevicesByDeviceID]] ===\n\n=== [[SortDevicesByDeviceModel]] ===\n=== [[SortDevicesByOwnerName]] ===','utf-8'),(126,'== [[Team Member]] ==\n\n\n== [[Sample Devices Tracking]] ==','utf-8'),(127,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceModel.php\n|width=100%\n|height=670\n|border=0\n}}\n\n\n\n[[category:SortDevices]]','utf-8'),(128,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceModel.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(129,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(130,'[http://192.168.1.61/addNewDevice.php Add a New Device]\n(Tip: You can click the middle button of the mouse to open this link in a New Page.)\n\n{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(131,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** \n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(132,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** Team Member | Team Member\n** Sample Devices Tracking | Sample Devices Tracking\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(133,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** Team Member | Team Member\n** Sample Devices | Sample Devices Tracking\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(134,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** Team Member | Team Member\n** Sample Devices Tracking | Devices Tracking\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(135,'[http://192.168.1.61/addNewDevice.php Add a New Device]\n\n{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(136,'{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(137,'{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(138,'Tips: Click Employee ID Number to edit employee information.\n\n{{#widget:Iframe\n|url=http://192.168.1.61/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(139,'Tips: \n1. Click Owner ID Number to edit owner information;\n2. Click Device ID Number to edit device information;\n3. Click Owner Name to sort devices by \"Owner\";\n4. Click Model to sort devices by \"Model\".\n\n\n{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(140,'Tips: \n=== 1. Click Owner ID Number to edit owner information; ===\n=== 2. Click Device ID Number to edit device information;===\n=== 3. Click Owner Name to sort devices by \"Owner\";===\n=== 4. Click Model to sort devices by \"Model\".===\n\n\n{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(141,'Tips: \n<p>1. Click Owner ID Number to edit owner information;</p>\n2. Click Device ID Number to edit device information;\n3. Click Owner Name to sort devices by \"Owner\";\n4. Click Model to sort devices by \"Model\".\n\n\n{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(142,'Tips: \n<p>1. Click Owner ID Number to edit owner information;</p>\n<p>2. Click Device ID Number to edit device information;</p>\n<p>3. Click Owner Name to sort devices by \"Owner\";</p>\n<p>4. Click Model to sort devices by \"Model\".</p>\n\n\n{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(143,'<p>1. Click Owner ID Number to edit owner information;</p>\n<p>2. Click Device ID Number to edit device information;</p>\n<p>3. Click Owner Name to sort devices by \"Owner\";</p>\n<p>4. Click Model to sort devices by \"Model\".</p>\n{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(144,'== [[Team Member]] ==\n\n\n== [[Sample Devices Tracking]] ==\n\n\n== [[Project Repositories]] ==','utf-8'),(145,'<p>1. Click Owner ID Number to edit owner information;</p>\n<p>2. Click Device ID Number to edit device information;</p>\n<p>3. Click Owner Name to sort devices by \"Owner\";</p>\n<p>4. Click Model to sort devices by \"Model\";</p>\n<p>5. Refresh current page whenever you edit.</p>\n\n{{#widget:Iframe\n|url=http://localhost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(146,'{{#widget:Iframe\n|url=http://localhost/getProjectRepos.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(147,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** Team Member | Team Member\n** Sample Devices Tracking | Devices Tracking\n** Project Repositories | Project Repos\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(148,'title=Ew-nay Ample-say\nnamePattern={{{topic}}}\ninstructions=You can use this page to create a new article on a sample topic.\ntopic|Topic|text|Topic of the article.\npurpose|Purpose|select|Purpose of the\narticle|items=Business;Pleasure;Other\nintro|Introduction|textarea|An introductory paragraph about the topic.\ncolor|Color|radio|Color of the article|items=Red;Blue;Green\nconclusion|Conclusion|textarea|The conclusions of the topic.\n\n\n\n{{#widget:Iframe\n|url=http://localhost/getProjectRepos.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(149,'The topic is {{{topic}}}.\n\nThe purpose is {{{purpose}}}.\n\n== Introduction ==\n\n{{{intro}}}\n\n\n\n{{#widget:Iframe\n|url=http://localhost/getProjectRepos.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(150,'{| class=\"wikitable sortable collapsible\"\n! User Name\n! Password\n! Repo Address\n|-\n|repos || reposR3 || To Be Determined\n|-\n|}\n\n\n{{#widget:Iframe\n|url=http://localhost/getProjectRepos.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(151,'== [[Team Member]] ==\n\n\n== [[Sample Devices Tracking]] ==\n\n\n== [[Project Repositories]] ==\n\n\n== [[Android Source Code Repo]] ==','utf-8'),(152,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** Team Member | Team Member\n** Sample Devices Tracking | Devices Tracking\n** Project Repositories | Project Repos\n** Android Source Code Repo | Source Code\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(153,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** Team Member | Team Member\n** Sample Devices Tracking | Devices Tracking\n** Project Repositories | Project Repos\n** Android Source Code Repo | Source Code Repos\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(154,'{{#widget:Iframe\n|url=http://localhost/getSourceCodeRepos.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(155,'Tips: Please refresh after a edit.\n\n{{#widget:Iframe\n|url=http://localhost/getSourceCodeRepos.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(156,'Tips: Please refresh after an Edit.\n\n{{#widget:Iframe\n|url=http://localhost/getSourceCodeRepos.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(157,'== [[Team Member]] ==\n\n\n== [[Sample Devices Tracking]] ==\n\n\n== [[Project Repositories]] ==\n\n\n== [[Android Source Code Repo]] ==\n\n== [[HQ Android Released Image]] ==','utf-8'),(158,'{| class=\"wikitable sortable collapsible\"\n! Name\n! Description\n! Instruction\n! Tag\n|-\n| MediaWiki Image || reposR3 || To Be Determined\n|-\n|}','utf-8'),(159,'{| class=\"wikitable sortable collapsible\"\n! Name\n! Description\n! Instruction\n! Tag\n|-\n| MediaWiki Image || reposR3 || To Be Determined || Now()\n|-\n|}','utf-8'),(160,'{| class=\"wikitable sortable collapsible\"\n! Name            ! Description   ! Instruction  ! Tag\n|-\n| MediaWiki Image || reposR3 || To Be Determined || Now()\n|-\n|}','utf-8'),(161,'{| class=\"wikitable sortable collapsible\"\n! Name            \n! Description   \n! Instruction  \n! Tag\n|-\n| MediaWiki Image || reposR3 || To Be Determined || Now()\n|-\n|}','utf-8'),(162,'{| class=\"wikitable sortable collapsible\"\n! Name            \n! Description   \n! Instruction  \n! Tag\n|-\n| MediaWiki Image || reposR3                                   || To Be Determined || {{#time: Y-m-d }}\n|-\n|                 ||  Use this way to continue more text       ||                  ||\n|-\n|                 || Just easy like this                       ||                  ||\n|-\n|}','utf-8'),(163,'{| class=\"wikitable sortable collapsible\"\n! Name            \n! Description   \n! Instruction  \n! Tag\n|-\n| MediaWiki Image || reposR3   <br> Use this way to continue more text   <br>  Just easy like this                   || To Be Determined || {{#time: Y-m-d }}\n|-\n|  Knock Knock     ||  Hello       ||     Look at me   ||{{#time: Y-m-d }}\n|-\n|  Rock            ||       Good Bye                 ||                  ||{{#time: Y-m-d }}\n|-\n|}','utf-8'),(164,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** Team Member | Team Member\n** Sample Devices Tracking | Devices Tracking\n** Project Repositories | Project Repos\n** Android Source Code Repo | Source Code Repos\n** HQ Android Released Image | Released Image\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(165,'{| class=\"wikitable sortable collapsible\"\n! Name            \n! Description   \n! Instruction  \n! Tag\n|-\n| MediaWiki Image || reposR3   <br> Use this way to continue more text   <br>  Just easy like this                   || To Be Determined || 2017-2-01\n|-\n|  Knock Knock     ||  Hello       ||     Look at me   ||2017-1-16\n|-\n|  Rock            ||       Good Bye                 ||                  ||{{#time: Y-m-d }}\n|-\n|}','utf-8'),(166,'Tips: Click Employee ID Number to edit employee information.\n\n{{#widget:Iframe\n|url=http://localhost/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(167,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** Team Member | Team Member\n** Sample Devices Tracking | Devices Tracking\n** Model & Release \\ Model & Release\n** Project Repositories | Project Repos\n** Android Source Code Repo | Source Code Repos\n** HQ Android Released Image | Released Image\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(168,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** Team Member | Team Member\n** Sample Devices Tracking | Devices Tracking\n** Model & Release | Model & Release\n** Project Repositories | Project Repos\n** Android Source Code Repo | Source Code Repos\n** HQ Android Released Image | Released Image\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(169,'{{#widget:Iframe\n|url=http://localhost/getReleaseView.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(170,'Tip: Refresh after every edit!\n\n{{#widget:Iframe\n|url=http://localhost/getReleaseView.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(171,'== [[Team Member]] ==\n\n\n== [[Sample Devices Tracking]] ==\n\n\n== [[Project Repositories]] ==\n\n== [[Model & Release]] ==\n\n== [[Android Source Code Repo]] ==\n\n== [[HQ Android Released Image]] ==','utf-8'),(172,'== [[Team Member]] ==\n\n\n== [[Sample Devices Tracking]] ==\n\n\n== [[Model & Release]] ==\n\n== [[Project Repositories]] ==\n\n== [[Android Source Code Repo]] ==\n\n== [[HQ Android Released Image]] ==','utf-8'),(173,'{| class=\"wikitable sortable collapsible\"\n! Name            \n! Description   \n! Instruction  \n! Tag\n|-\n| MediaWiki Image || reposR3   <br> Use this way to continue more text   <br>  Just easy like this                   || To Be Determined || 2017-2-01\n|-\n|  Knock Knock     ||  Hello       ||     Look at me   ||2017-1-16\n|-\n|  Rock            ||       Good Bye                 ||                  ||{{#time: Y-m-d }}\n|-\n|}\n\n\nTips: Please refresh after an Edit.\n\n{{#widget:Iframe\n|url=http://localhost/getImageInfo.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(174,'\nTips: Please refresh after an Edit.\n\n{{#widget:Iframe\n|url=http://localhost/getImageInfo.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(175,'{| class=\"wikitable sortable collapsible\"\n! Name            \n! Description   \n! Instruction  \n! Tag\n|-\n| MediaWiki Image || reposR3   <br> Use this way to continue more text   <br>  Just easy like this                   || To Be Determined || 2017-2-01\n|-\n|  Knock Knock     ||  Hello       ||     Look at me   ||2017-1-16\n|-\n|  Rock            ||       Good Bye                 ||                  ||{{#time: Y-m-d }}\n|-\n|}','utf-8'),(176,'\n* navigation\n** Huawei Wiki | Huawei Wiki\n** Team Member | Team Member\n** Sample Devices Tracking | Devices Tracking\n** Model & Release | Model & Release\n** Project Repositories | Project Repos\n** Android Source Code Repo | Source Code Repos\n** HQ Android Released Image | Released Image\n** Tools | Tools\n** recentchanges-url|recentchanges\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8'),(177,'Tip: Refresh after every edit!\n\n{{#widget:Iframe\n|url=http://localhost/getToolsInfo.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(178,'Tips: Click Employee ID Number to edit employee information.\n\n{{#widget:Iframe\n|url=http://10.122.38.71/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(179,'<p>1. Click Owner ID Number to edit owner information;</p>\n<p>2. Click Device ID Number to edit device information;</p>\n<p>3. Click Owner Name to sort devices by \"Owner\";</p>\n<p>4. Click Model to sort devices by \"Model\";</p>\n<p>5. Refresh current page whenever you edit.</p>\n\n{{#widget:Iframe\n|url=http://10.122.38.71/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(180,'<p>1. Click Owner ID Number to edit owner information;</p>\n<p>2. Click Device ID Number to edit device information;</p>\n<p>3. Click Owner Name to sort devices by \"Owner\";</p>\n<p>4. Click Model to sort devices by \"Model\";</p>\n<p>5. Refresh current page whenever you edit.</p>\n\n{{#widget:Iframe\n|url=http://locaohost/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(181,'<p>1. Click Owner ID Number to edit owner information;</p>\n<p>2. Click Device ID Number to edit device information;</p>\n<p>3. Click Owner Name to sort devices by \"Owner\";</p>\n<p>4. Click Model to sort devices by \"Model\";</p>\n<p>5. Refresh current page whenever you edit.</p>\n\n{{#widget:Iframe\n|url=http://10.122.38.71/sortByDeviceID.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(182,'Tip: Refresh after every edit!\n\n{{#widget:Iframe\n|url=http://10.122.38.71/getReleaseView.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(183,'{| class=\"wikitable sortable collapsible\"\n! User Name\n! Password\n! Repo Address\n|-\n|repos || reposR3 || To Be Determined\n|-\n|}\n\n\n{{#widget:Iframe\n|url=http://10.122.38.71/getProjectRepos.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(184,'Tips: Please refresh after an Edit.\n\n{{#widget:Iframe\n|url=http://10.122.38.71/getSourceCodeRepos.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(185,'\nTips: Please refresh after an Edit.\n\n{{#widget:Iframe\n|url=http://10.122.38.71/getImageInfo.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(186,'Tip: Refresh after every edit!\n\n{{#widget:Iframe\n|url=http://10.122.38.71/getToolsInfo.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(187,'Tips: Click Employee ID Number to edit employee information.\n\n{{#widget:Iframe\n|url=getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(188,'Tips: Click Employee ID Number to edit employee information.\n\n{{#widget:Iframe\n|url=./getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(189,'Tips: Click Employee ID Number to edit employee information.\n\n{{#widget:Iframe\n|url=mediawiki/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(190,'Tips: Click Employee ID Number to edit employee information.\n\n{{#widget:Iframe\n|url=\"/getEmployeeInfo.php\"\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(191,'Tips: Click Employee ID Number to edit employee information.\n\n{{#widget:Iframe\n|url=./../getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(192,'Tips: Click Employee ID Number to edit employee information.\n\n{{#widget:Iframe\n|url=10.122.38.71\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(193,'Tips: Click Employee ID Number to edit employee information.\n\n{{#widget:Iframe\n|url=http://10.122.38.71\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(194,'Tips: Click Employee ID Number to edit employee information.\n\n{{#widget:Iframe\n|url=http://10.122.38.71/getEmployeeInfo.php\n|width=100%\n|height=800\n|border=0\n}}','utf-8'),(195,'Tip: \n1. You need to create your expected Source and Image first\n2. Refresh after every edit!\n\n{{#widget:Iframe\n|url=http://10.122.38.71/getReleaseView.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(196,'Tip: <br/>\n1. You need to create your expected Source and Image first <br/>\n2. Refresh after every edit!\n\n{{#widget:Iframe\n|url=http://10.122.38.71/getReleaseView.php\n|width=100%\n|height=670\n|border=0\n}}','utf-8'),(197,'== [[Team Member]] ==\n\n\n== [[Sample Devices Tracking]] ==\n\n\n== [[Model & Release]] ==\n\n== [[Project Repositories]] ==\n\n== [[Android Source Code Repo]] ==\n\n== [[HQ Android Released Image]] ==\n\n== [[Tools]] ==','utf-8');
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
  `tc_time` binary(14) DEFAULT NULL,
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
INSERT INTO `updatelog` VALUES ('cl_fields_update',NULL),('convert transcache field',NULL),('filearchive-fa_major_mime-patch-fa_major_mime-chemical.sql',NULL),('image-img_major_mime-patch-img_major_mime-chemical.sql',NULL),('mime_minor_length',NULL),('oldimage-oi_major_mime-patch-oi_major_mime-chemical.sql',NULL),('PingBack','7bc8d146bcbf75786f31549af7e3daa7'),('Pingback-1.28.0',NULL),('populate category',NULL),('populate log_search',NULL),('populate log_usertext',NULL),('populate rev_parent_id',NULL),('recentchanges-rc_comment-patch-editsummary-length.sql',NULL),('recentchanges-rc_ip-patch-rc_ip_modify.sql',NULL),('updatelist-1.28.0-14863512050','a:197:{i:0;a:1:{i:0;s:26:\"disableContentHandlerUseDB\";}i:1;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:6:\"ipb_id\";i:3;s:18:\"patch-ipblocks.sql\";}i:2;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:10:\"ipb_expiry\";i:3;s:20:\"patch-ipb_expiry.sql\";}i:3;a:1:{i:0;s:17:\"doInterwikiUpdate\";}i:4;a:1:{i:0;s:13:\"doIndexUpdate\";}i:5;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:7:\"rc_type\";i:3;s:17:\"patch-rc_type.sql\";}i:6;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"recentchanges\";i:2;s:18:\"new_name_timestamp\";i:3;s:21:\"patch-rc-newindex.sql\";}i:7;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:14:\"user_real_name\";i:3;s:23:\"patch-user-realname.sql\";}i:8;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"querycache\";i:2;s:20:\"patch-querycache.sql\";}i:9;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"objectcache\";i:2;s:21:\"patch-objectcache.sql\";}i:10;a:3:{i:0;s:8:\"addTable\";i:1;s:13:\"categorylinks\";i:2;s:23:\"patch-categorylinks.sql\";}i:11;a:1:{i:0;s:16:\"doOldLinksUpdate\";}i:12;a:1:{i:0;s:22:\"doFixAncientImagelinks\";}i:13;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:5:\"rc_ip\";i:3;s:15:\"patch-rc_ip.sql\";}i:14;a:4:{i:0;s:8:\"addIndex\";i:1;s:5:\"image\";i:2;s:7:\"PRIMARY\";i:3;s:28:\"patch-image_name_primary.sql\";}i:15;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:5:\"rc_id\";i:3;s:15:\"patch-rc_id.sql\";}i:16;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:12:\"rc_patrolled\";i:3;s:19:\"patch-rc-patrol.sql\";}i:17;a:3:{i:0;s:8:\"addTable\";i:1;s:7:\"logging\";i:2;s:17:\"patch-logging.sql\";}i:18;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:10:\"user_token\";i:3;s:20:\"patch-user_token.sql\";}i:19;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"watchlist\";i:2;s:24:\"wl_notificationtimestamp\";i:3;s:28:\"patch-email-notification.sql\";}i:20;a:1:{i:0;s:17:\"doWatchlistUpdate\";}i:21;a:4:{i:0;s:9:\"dropField\";i:1;s:4:\"user\";i:2;s:33:\"user_emailauthenticationtimestamp\";i:3;s:30:\"patch-email-authentication.sql\";}i:22;a:1:{i:0;s:21:\"doSchemaRestructuring\";}i:23;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:10:\"log_params\";i:3;s:20:\"patch-log_params.sql\";}i:24;a:4:{i:0;s:8:\"checkBin\";i:1;s:7:\"logging\";i:2;s:9:\"log_title\";i:3;s:23:\"patch-logging-title.sql\";}i:25;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:9:\"ar_rev_id\";i:3;s:24:\"patch-archive-rev_id.sql\";}i:26;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:8:\"page_len\";i:3;s:18:\"patch-page_len.sql\";}i:27;a:4:{i:0;s:9:\"dropField\";i:1;s:8:\"revision\";i:2;s:17:\"inverse_timestamp\";i:3;s:27:\"patch-inverse_timestamp.sql\";}i:28;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:11:\"rev_text_id\";i:3;s:21:\"patch-rev_text_id.sql\";}i:29;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:11:\"rev_deleted\";i:3;s:21:\"patch-rev_deleted.sql\";}i:30;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:9:\"img_width\";i:3;s:19:\"patch-img_width.sql\";}i:31;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:12:\"img_metadata\";i:3;s:22:\"patch-img_metadata.sql\";}i:32;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:16:\"user_email_token\";i:3;s:26:\"patch-user_email_token.sql\";}i:33;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:10:\"ar_text_id\";i:3;s:25:\"patch-archive-text_id.sql\";}i:34;a:1:{i:0;s:15:\"doNamespaceSize\";}i:35;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:14:\"img_media_type\";i:3;s:24:\"patch-img_media_type.sql\";}i:36;a:1:{i:0;s:17:\"doPagelinksUpdate\";}i:37;a:4:{i:0;s:9:\"dropField\";i:1;s:5:\"image\";i:2;s:8:\"img_type\";i:3;s:23:\"patch-drop_img_type.sql\";}i:38;a:1:{i:0;s:18:\"doUserUniqueUpdate\";}i:39;a:1:{i:0;s:18:\"doUserGroupsUpdate\";}i:40;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"site_stats\";i:2;s:14:\"ss_total_pages\";i:3;s:27:\"patch-ss_total_articles.sql\";}i:41;a:3:{i:0;s:8:\"addTable\";i:1;s:12:\"user_newtalk\";i:2;s:22:\"patch-usernewtalk2.sql\";}i:42;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"transcache\";i:2;s:20:\"patch-transcache.sql\";}i:43;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"interwiki\";i:2;s:8:\"iw_trans\";i:3;s:25:\"patch-interwiki-trans.sql\";}i:44;a:1:{i:0;s:15:\"doWatchlistNull\";}i:45;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:5:\"times\";i:3;s:29:\"patch-logging-times-index.sql\";}i:46;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:15:\"ipb_range_start\";i:3;s:25:\"patch-ipb_range_start.sql\";}i:47;a:1:{i:0;s:18:\"doPageRandomUpdate\";}i:48;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:17:\"user_registration\";i:3;s:27:\"patch-user_registration.sql\";}i:49;a:1:{i:0;s:21:\"doTemplatelinksUpdate\";}i:50;a:3:{i:0;s:8:\"addTable\";i:1;s:13:\"externallinks\";i:2;s:23:\"patch-externallinks.sql\";}i:51;a:3:{i:0;s:8:\"addTable\";i:1;s:3:\"job\";i:2;s:13:\"patch-job.sql\";}i:52;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"site_stats\";i:2;s:9:\"ss_images\";i:3;s:19:\"patch-ss_images.sql\";}i:53;a:3:{i:0;s:8:\"addTable\";i:1;s:9:\"langlinks\";i:2;s:19:\"patch-langlinks.sql\";}i:54;a:3:{i:0;s:8:\"addTable\";i:1;s:15:\"querycache_info\";i:2;s:24:\"patch-querycacheinfo.sql\";}i:55;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"filearchive\";i:2;s:21:\"patch-filearchive.sql\";}i:56;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:13:\"ipb_anon_only\";i:3;s:23:\"patch-ipb_anon_only.sql\";}i:57;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"recentchanges\";i:2;s:14:\"rc_ns_usertext\";i:3;s:31:\"patch-recentchanges-utindex.sql\";}i:58;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"recentchanges\";i:2;s:12:\"rc_user_text\";i:3;s:28:\"patch-rc_user_text-index.sql\";}i:59;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:17:\"user_newpass_time\";i:3;s:27:\"patch-user_newpass_time.sql\";}i:60;a:3:{i:0;s:8:\"addTable\";i:1;s:8:\"redirect\";i:2;s:18:\"patch-redirect.sql\";}i:61;a:3:{i:0;s:8:\"addTable\";i:1;s:13:\"querycachetwo\";i:2;s:23:\"patch-querycachetwo.sql\";}i:62;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:20:\"ipb_enable_autoblock\";i:3;s:32:\"patch-ipb_optional_autoblock.sql\";}i:63;a:1:{i:0;s:26:\"doBacklinkingIndicesUpdate\";}i:64;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:10:\"rc_old_len\";i:3;s:16:\"patch-rc_len.sql\";}i:65;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:14:\"user_editcount\";i:3;s:24:\"patch-user_editcount.sql\";}i:66;a:1:{i:0;s:20:\"doRestrictionsUpdate\";}i:67;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:6:\"log_id\";i:3;s:16:\"patch-log_id.sql\";}i:68;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:13:\"rev_parent_id\";i:3;s:23:\"patch-rev_parent_id.sql\";}i:69;a:4:{i:0;s:8:\"addField\";i:1;s:17:\"page_restrictions\";i:2;s:5:\"pr_id\";i:3;s:35:\"patch-page_restrictions_sortkey.sql\";}i:70;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:7:\"rev_len\";i:3;s:17:\"patch-rev_len.sql\";}i:71;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:10:\"rc_deleted\";i:3;s:20:\"patch-rc_deleted.sql\";}i:72;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:11:\"log_deleted\";i:3;s:21:\"patch-log_deleted.sql\";}i:73;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:10:\"ar_deleted\";i:3;s:20:\"patch-ar_deleted.sql\";}i:74;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:11:\"ipb_deleted\";i:3;s:21:\"patch-ipb_deleted.sql\";}i:75;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"filearchive\";i:2;s:10:\"fa_deleted\";i:3;s:20:\"patch-fa_deleted.sql\";}i:76;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:6:\"ar_len\";i:3;s:16:\"patch-ar_len.sql\";}i:77;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:15:\"ipb_block_email\";i:3;s:22:\"patch-ipb_emailban.sql\";}i:78;a:1:{i:0;s:28:\"doCategorylinksIndicesUpdate\";}i:79;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"oldimage\";i:2;s:11:\"oi_metadata\";i:3;s:21:\"patch-oi_metadata.sql\";}i:80;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"archive\";i:2;s:18:\"usertext_timestamp\";i:3;s:28:\"patch-archive-user-index.sql\";}i:81;a:4:{i:0;s:8:\"addIndex\";i:1;s:5:\"image\";i:2;s:22:\"img_usertext_timestamp\";i:3;s:26:\"patch-image-user-index.sql\";}i:82;a:4:{i:0;s:8:\"addIndex\";i:1;s:8:\"oldimage\";i:2;s:21:\"oi_usertext_timestamp\";i:3;s:29:\"patch-oldimage-user-index.sql\";}i:83;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:10:\"ar_page_id\";i:3;s:25:\"patch-archive-page_id.sql\";}i:84;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:8:\"img_sha1\";i:3;s:18:\"patch-img_sha1.sql\";}i:85;a:3:{i:0;s:8:\"addTable\";i:1;s:16:\"protected_titles\";i:2;s:26:\"patch-protected_titles.sql\";}i:86;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:11:\"ipb_by_text\";i:3;s:21:\"patch-ipb_by_text.sql\";}i:87;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"page_props\";i:2;s:20:\"patch-page_props.sql\";}i:88;a:3:{i:0;s:8:\"addTable\";i:1;s:9:\"updatelog\";i:2;s:19:\"patch-updatelog.sql\";}i:89;a:3:{i:0;s:8:\"addTable\";i:1;s:8:\"category\";i:2;s:18:\"patch-category.sql\";}i:90;a:1:{i:0;s:20:\"doCategoryPopulation\";}i:91;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:12:\"ar_parent_id\";i:3;s:22:\"patch-ar_parent_id.sql\";}i:92;a:4:{i:0;s:8:\"addField\";i:1;s:12:\"user_newtalk\";i:2;s:19:\"user_last_timestamp\";i:3;s:29:\"patch-user_last_timestamp.sql\";}i:93;a:1:{i:0;s:18:\"doPopulateParentId\";}i:94;a:4:{i:0;s:8:\"checkBin\";i:1;s:16:\"protected_titles\";i:2;s:8:\"pt_title\";i:3;s:27:\"patch-pt_title-encoding.sql\";}i:95;a:1:{i:0;s:28:\"doMaybeProfilingMemoryUpdate\";}i:96;a:1:{i:0;s:26:\"doFilearchiveIndicesUpdate\";}i:97;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"site_stats\";i:2;s:15:\"ss_active_users\";i:3;s:25:\"patch-ss_active_users.sql\";}i:98;a:1:{i:0;s:17:\"doActiveUsersInit\";}i:99;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:18:\"ipb_allow_usertalk\";i:3;s:28:\"patch-ipb_allow_usertalk.sql\";}i:100;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"change_tag\";i:2;s:20:\"patch-change_tag.sql\";}i:101;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"tag_summary\";i:2;s:21:\"patch-tag_summary.sql\";}i:102;a:3:{i:0;s:8:\"addTable\";i:1;s:9:\"valid_tag\";i:2;s:19:\"patch-valid_tag.sql\";}i:103;a:3:{i:0;s:8:\"addTable\";i:1;s:15:\"user_properties\";i:2;s:25:\"patch-user_properties.sql\";}i:104;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"log_search\";i:2;s:20:\"patch-log_search.sql\";}i:105;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:13:\"log_user_text\";i:3;s:23:\"patch-log_user_text.sql\";}i:106;a:1:{i:0;s:23:\"doLogUsertextPopulation\";}i:107;a:1:{i:0;s:21:\"doLogSearchPopulation\";}i:108;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"l10n_cache\";i:2;s:20:\"patch-l10n_cache.sql\";}i:109;a:4:{i:0;s:8:\"addIndex\";i:1;s:10:\"log_search\";i:2;s:12:\"ls_field_val\";i:3;s:33:\"patch-log_search-rename-index.sql\";}i:110;a:4:{i:0;s:8:\"addIndex\";i:1;s:10:\"change_tag\";i:2;s:17:\"change_tag_rc_tag\";i:3;s:28:\"patch-change_tag-indexes.sql\";}i:111;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"redirect\";i:2;s:12:\"rd_interwiki\";i:3;s:22:\"patch-rd_interwiki.sql\";}i:112;a:1:{i:0;s:23:\"doUpdateTranscacheField\";}i:113;a:1:{i:0;s:22:\"doUpdateMimeMinorField\";}i:114;a:3:{i:0;s:8:\"addTable\";i:1;s:7:\"iwlinks\";i:2;s:17:\"patch-iwlinks.sql\";}i:115;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"iwlinks\";i:2;s:21:\"iwl_prefix_title_from\";i:3;s:27:\"patch-rename-iwl_prefix.sql\";}i:116;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"updatelog\";i:2;s:8:\"ul_value\";i:3;s:18:\"patch-ul_value.sql\";}i:117;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"interwiki\";i:2;s:6:\"iw_api\";i:3;s:27:\"patch-iw_api_and_wikiid.sql\";}i:118;a:4:{i:0;s:9:\"dropIndex\";i:1;s:7:\"iwlinks\";i:2;s:10:\"iwl_prefix\";i:3;s:25:\"patch-kill-iwl_prefix.sql\";}i:119;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"categorylinks\";i:2;s:12:\"cl_collation\";i:3;s:40:\"patch-categorylinks-better-collation.sql\";}i:120;a:1:{i:0;s:16:\"doClFieldsUpdate\";}i:121;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"module_deps\";i:2;s:21:\"patch-module_deps.sql\";}i:122;a:4:{i:0;s:9:\"dropIndex\";i:1;s:7:\"archive\";i:2;s:13:\"ar_page_revid\";i:3;s:36:\"patch-archive_kill_ar_page_revid.sql\";}i:123;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"archive\";i:2;s:8:\"ar_revid\";i:3;s:26:\"patch-archive_ar_revid.sql\";}i:124;a:1:{i:0;s:23:\"doLangLinksLengthUpdate\";}i:125;a:1:{i:0;s:29:\"doUserNewTalkTimestampNotNull\";}i:126;a:4:{i:0;s:8:\"addIndex\";i:1;s:4:\"user\";i:2;s:10:\"user_email\";i:3;s:26:\"patch-user_email_index.sql\";}i:127;a:4:{i:0;s:11:\"modifyField\";i:1;s:15:\"user_properties\";i:2;s:11:\"up_property\";i:3;s:21:\"patch-up_property.sql\";}i:128;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"uploadstash\";i:2;s:21:\"patch-uploadstash.sql\";}i:129;a:3:{i:0;s:8:\"addTable\";i:1;s:18:\"user_former_groups\";i:2;s:28:\"patch-user_former_groups.sql\";}i:130;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:11:\"type_action\";i:3;s:35:\"patch-logging-type-action-index.sql\";}i:131;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:8:\"rev_sha1\";i:3;s:18:\"patch-rev_sha1.sql\";}i:132;a:1:{i:0;s:20:\"doMigrateUserOptions\";}i:133;a:4:{i:0;s:9:\"dropField\";i:1;s:4:\"user\";i:2;s:12:\"user_options\";i:3;s:27:\"patch-drop-user_options.sql\";}i:134;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:7:\"ar_sha1\";i:3;s:17:\"patch-ar_sha1.sql\";}i:135;a:4:{i:0;s:8:\"addIndex\";i:1;s:4:\"page\";i:2;s:27:\"page_redirect_namespace_len\";i:3;s:37:\"patch-page_redirect_namespace_len.sql\";}i:136;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"uploadstash\";i:2;s:12:\"us_chunk_inx\";i:3;s:27:\"patch-uploadstash_chunk.sql\";}i:137;a:4:{i:0;s:8:\"addfield\";i:1;s:3:\"job\";i:2;s:13:\"job_timestamp\";i:3;s:28:\"patch-jobs-add-timestamp.sql\";}i:138;a:4:{i:0;s:8:\"addIndex\";i:1;s:8:\"revision\";i:2;s:19:\"page_user_timestamp\";i:3;s:34:\"patch-revision-user-page-index.sql\";}i:139;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:19:\"ipb_parent_block_id\";i:3;s:29:\"patch-ipb-parent-block-id.sql\";}i:140;a:4:{i:0;s:8:\"addIndex\";i:1;s:8:\"ipblocks\";i:2;s:19:\"ipb_parent_block_id\";i:3;s:35:\"patch-ipb-parent-block-id-index.sql\";}i:141;a:4:{i:0;s:9:\"dropField\";i:1;s:8:\"category\";i:2;s:10:\"cat_hidden\";i:3;s:20:\"patch-cat_hidden.sql\";}i:142;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:18:\"rev_content_format\";i:3;s:37:\"patch-revision-rev_content_format.sql\";}i:143;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:17:\"rev_content_model\";i:3;s:36:\"patch-revision-rev_content_model.sql\";}i:144;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:17:\"ar_content_format\";i:3;s:35:\"patch-archive-ar_content_format.sql\";}i:145;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:16:\"ar_content_model\";i:3;s:34:\"patch-archive-ar_content_model.sql\";}i:146;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:18:\"page_content_model\";i:3;s:33:\"patch-page-page_content_model.sql\";}i:147;a:1:{i:0;s:25:\"enableContentHandlerUseDB\";}i:148;a:4:{i:0;s:9:\"dropField\";i:1;s:10:\"site_stats\";i:2;s:9:\"ss_admins\";i:3;s:24:\"patch-drop-ss_admins.sql\";}i:149;a:4:{i:0;s:9:\"dropField\";i:1;s:13:\"recentchanges\";i:2;s:17:\"rc_moved_to_title\";i:3;s:18:\"patch-rc_moved.sql\";}i:150;a:3:{i:0;s:8:\"addTable\";i:1;s:5:\"sites\";i:2;s:15:\"patch-sites.sql\";}i:151;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"filearchive\";i:2;s:7:\"fa_sha1\";i:3;s:17:\"patch-fa_sha1.sql\";}i:152;a:4:{i:0;s:8:\"addField\";i:1;s:3:\"job\";i:2;s:9:\"job_token\";i:3;s:19:\"patch-job_token.sql\";}i:153;a:4:{i:0;s:8:\"addField\";i:1;s:3:\"job\";i:2;s:12:\"job_attempts\";i:3;s:22:\"patch-job_attempts.sql\";}i:154;a:1:{i:0;s:17:\"doEnableProfiling\";}i:155;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"uploadstash\";i:2;s:8:\"us_props\";i:3;s:30:\"patch-uploadstash-us_props.sql\";}i:156;a:4:{i:0;s:11:\"modifyField\";i:1;s:11:\"user_groups\";i:2;s:8:\"ug_group\";i:3;s:38:\"patch-ug_group-length-increase-255.sql\";}i:157;a:4:{i:0;s:11:\"modifyField\";i:1;s:18:\"user_former_groups\";i:2;s:9:\"ufg_group\";i:3;s:39:\"patch-ufg_group-length-increase-255.sql\";}i:158;a:4:{i:0;s:8:\"addIndex\";i:1;s:10:\"page_props\";i:2;s:16:\"pp_propname_page\";i:3;s:40:\"patch-page_props-propname-page-index.sql\";}i:159;a:4:{i:0;s:8:\"addIndex\";i:1;s:5:\"image\";i:2;s:14:\"img_media_mime\";i:3;s:30:\"patch-img_media_mime-index.sql\";}i:160;a:1:{i:0;s:23:\"doIwlinksIndexNonUnique\";}i:161;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"iwlinks\";i:2;s:21:\"iwl_prefix_from_title\";i:3;s:34:\"patch-iwlinks-from-title-index.sql\";}i:162;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:5:\"ar_id\";i:3;s:23:\"patch-archive-ar_id.sql\";}i:163;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"externallinks\";i:2;s:5:\"el_id\";i:3;s:29:\"patch-externallinks-el_id.sql\";}i:164;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:9:\"rc_source\";i:3;s:19:\"patch-rc_source.sql\";}i:165;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:23:\"log_user_text_type_time\";i:3;s:43:\"patch-logging_user_text_type_time_index.sql\";}i:166;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:18:\"log_user_text_time\";i:3;s:38:\"patch-logging_user_text_time_index.sql\";}i:167;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:18:\"page_links_updated\";i:3;s:28:\"patch-page_links_updated.sql\";}i:168;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:21:\"user_password_expires\";i:3;s:30:\"patch-user_password_expire.sql\";}i:169;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"page_props\";i:2;s:10:\"pp_sortkey\";i:3;s:20:\"patch-pp_sortkey.sql\";}i:170;a:4:{i:0;s:9:\"dropField\";i:1;s:13:\"recentchanges\";i:2;s:11:\"rc_cur_time\";i:3;s:26:\"patch-drop-rc_cur_time.sql\";}i:171;a:4:{i:0;s:8:\"addIndex\";i:1;s:9:\"watchlist\";i:2;s:29:\"wl_user_notificationtimestamp\";i:3;s:52:\"patch-watchlist-user-notificationtimestamp-index.sql\";}i:172;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:9:\"page_lang\";i:3;s:19:\"patch-page_lang.sql\";}i:173;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"pagelinks\";i:2;s:17:\"pl_from_namespace\";i:3;s:27:\"patch-pl_from_namespace.sql\";}i:174;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"templatelinks\";i:2;s:17:\"tl_from_namespace\";i:3;s:27:\"patch-tl_from_namespace.sql\";}i:175;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"imagelinks\";i:2;s:17:\"il_from_namespace\";i:3;s:27:\"patch-il_from_namespace.sql\";}i:176;a:4:{i:0;s:11:\"modifyField\";i:1;s:5:\"image\";i:2;s:14:\"img_major_mime\";i:3;s:33:\"patch-img_major_mime-chemical.sql\";}i:177;a:4:{i:0;s:11:\"modifyField\";i:1;s:8:\"oldimage\";i:2;s:13:\"oi_major_mime\";i:3;s:32:\"patch-oi_major_mime-chemical.sql\";}i:178;a:4:{i:0;s:11:\"modifyField\";i:1;s:11:\"filearchive\";i:2;s:13:\"fa_major_mime\";i:3;s:32:\"patch-fa_major_mime-chemical.sql\";}i:179;a:1:{i:0;s:27:\"doUserNewTalkUseridUnsigned\";}i:180;a:4:{i:0;s:11:\"modifyField\";i:1;s:13:\"recentchanges\";i:2;s:10:\"rc_comment\";i:3;s:28:\"patch-editsummary-length.sql\";}i:181;a:2:{i:0;s:9:\"dropTable\";i:1;s:10:\"hitcounter\";}i:182;a:4:{i:0;s:9:\"dropField\";i:1;s:10:\"site_stats\";i:2;s:14:\"ss_total_views\";i:3;s:29:\"patch-drop-ss_total_views.sql\";}i:183;a:4:{i:0;s:9:\"dropField\";i:1;s:4:\"page\";i:2;s:12:\"page_counter\";i:3;s:27:\"patch-drop-page_counter.sql\";}i:184;a:2:{i:0;s:9:\"dropTable\";i:1;s:18:\"msg_resource_links\";}i:185;a:2:{i:0;s:9:\"dropTable\";i:1;s:12:\"msg_resource\";}i:186;a:3:{i:0;s:8:\"addTable\";i:1;s:13:\"bot_passwords\";i:2;s:23:\"patch-bot_passwords.sql\";}i:187;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"watchlist\";i:2;s:5:\"wl_id\";i:3;s:25:\"patch-watchlist-wl_id.sql\";}i:188;a:4:{i:0;s:9:\"dropIndex\";i:1;s:13:\"categorylinks\";i:2;s:12:\"cl_collation\";i:3;s:33:\"patch-kill-cl_collation_index.sql\";}i:189;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"categorylinks\";i:2;s:16:\"cl_collation_ext\";i:3;s:36:\"patch-add-cl_collation_ext_index.sql\";}i:190;a:1:{i:0;s:17:\"doCollationUpdate\";}i:191;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"recentchanges\";i:2;s:32:\"rc_name_type_patrolled_timestamp\";i:3;s:52:\"patch-add-rc_name_type_patrolled_timestamp_index.sql\";}i:192;a:1:{i:0;s:31:\"doRevisionPageRevIndexNonUnique\";}i:193;a:1:{i:0;s:17:\"doNonUniquePlTlIl\";}i:194;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"change_tag\";i:2;s:5:\"ct_id\";i:3;s:26:\"patch-change_tag-ct_id.sql\";}i:195;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"tag_summary\";i:2;s:5:\"ts_id\";i:3;s:27:\"patch-tag_summary-ts_id.sql\";}i:196;a:4:{i:0;s:11:\"modifyField\";i:1;s:13:\"recentchanges\";i:2;s:5:\"rc_ip\";i:3;s:22:\"patch-rc_ip_modify.sql\";}}'),('user_former_groups-ufg_group-patch-ufg_group-length-increase-255.sql',NULL),('user_groups-ug_group-patch-ug_group-length-increase-255.sql',NULL),('user_properties-up_property-patch-up_property.sql',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'SenLi','',':pbkdf2:sha512:30000:64:yIIKgTONyrYpuQ4HiqXNZg==:k07TmqPlLJgLQQIhY/XUvzqEnnN8Hz9s+1LbRDMOIH2W7GA1iOopXsQIN7at0OIuPClDeidfmRaXLQ9GVo98TQ==',':pbkdf2:sha512:30000:64:vmGIdVG9jlw6avFEXqArpA==:xfMVWXYRvGse29lk74gxjWFkVsuIcVcYJ16oNzIC6PLaErJBhLljgAXHLVI4eopz/Q4qi+DJpPKv26UXvzk4pQ==','20170124232831','liziyuanhaha@gmail.com','20170124225632','cc7d5a7d9011dc47adabd0d85d555f7c',NULL,NULL,NULL,'20170122203959',16,'','1990-02-20','Sen','Li','wx445227'),(2,'Liziyuanhaha','',':pbkdf2:sha512:30000:64:IQ203NbxQzZbH69MM26e3A==:7eeZdm+SiEw3umBN+KVIEGevx5kGBGP8kKX1lNpfoaIZfLZinLSFHUyq90OLzWRLj0lJcEPpATtR51gBbz4CHQ==','',NULL,'liziyuanhaha@gmail.com','20170124233759','e991c0afb2355890bcb3f6d9539d7dc7',NULL,'39e0e89e6d3bdacb694322db0686e6d5','20170131233752','20170124233751',0,NULL,'0000-00-00','Jeff','aa','aaa'),(4,'Admin','',':pbkdf2:sha512:30000:64:CTdMOLM+pu7AK2uA0dUY3A==:jZrivMxcNqKDX3wcwl6YVQDi9b09u8NogNifO7F+p9pgI7hbPerOWW4NkOYGTT7z3krD6jkTVtTnyFmCqY12UA==','',NULL,'Sen.Li@huawei.com','20170125025403','3436f82381e8b3a93d7e7c143239509a',NULL,'e44fcf85d7e68012c744fd8f0250ccb0','20170201025356','20170125025355',133,NULL,'0000-00-00','Charles','Zeng',''),(5,'V00725852','Vijayakumar Krishnamurthy',':pbkdf2:sha512:30000:64:S4Z7NPDSE97jgFDfWvYOUw==:Q133m/PW9sBr6/zDs14wi0tX5unSOLVONZSOen8kudnqEJdFUQrvcA5/t+7x9dKloTgC4XqqZNop6be1jw9stQ==','',NULL,'vijayakumar.krishnamurthy@huawei.com','20170210194333','695f119a2473bc1e5df78508bdd41283',NULL,'6c69995a192a015454f1e05a52ebf632','20170217194325','20170210194325',0,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
INSERT INTO `watchlist` VALUES (1,1,2,'SenLi',NULL),(2,1,3,'SenLi',NULL),(3,2,2,'Liziyuanhaha','20170124233751'),(4,2,3,'Liziyuanhaha',NULL),(5,3,2,'Liziyuanhaha',NULL),(6,3,3,'Liziyuanhaha',NULL),(7,1,8,'Sidebar','20170131222055'),(8,1,9,'Sidebar',NULL),(9,1,0,'Huawei_Wiki','20170131032316'),(10,1,1,'Huawei_Wiki',NULL),(11,1,8,'Mainpage',NULL),(12,1,9,'Mainpage',NULL),(13,1,0,'Sen','20170125031740'),(14,1,1,'Sen',NULL),(15,1,14,'Employees','20170126194236'),(16,1,15,'Employees',NULL),(17,4,2,'Admin','20170125025457'),(18,4,3,'Admin',NULL),(19,4,0,'Sen',NULL),(20,4,1,'Sen',NULL),(21,4,6,'Sen.jpg',NULL),(22,4,7,'Sen.jpg',NULL),(23,4,0,'Employees',NULL),(24,4,1,'Employees',NULL),(25,4,10,'TableTestTemplate',NULL),(26,4,11,'TableTestTemplate',NULL),(27,4,274,'Iframe',NULL),(28,4,275,'Iframe',NULL),(29,4,0,'Huawei_Wiki','20170215230109'),(30,4,1,'Huawei_Wiki',NULL),(31,4,8,'Sidebar',NULL),(32,4,9,'Sidebar',NULL),(33,4,0,'Sample_Devices_Tracking',NULL),(34,4,1,'Sample_Devices_Tracking',NULL),(35,4,0,'Team_Member',NULL),(36,4,1,'Team_Member',NULL),(37,4,0,'Project_Repositories',NULL),(38,4,1,'Project_Repositories',NULL),(39,4,0,'Android_Source_Code_Repo',NULL),(40,4,1,'Android_Source_Code_Repo',NULL),(41,4,0,'HQ_Android_Released_Image',NULL),(42,4,1,'HQ_Android_Released_Image',NULL),(43,4,0,'Model_&_Release',NULL),(44,4,1,'Model_&_Release',NULL),(45,4,0,'SenForm',NULL),(46,4,1,'SenForm',NULL),(47,4,0,'Tools',NULL),(48,4,1,'Tools',NULL),(49,5,2,'V00725852',NULL),(50,5,3,'V00725852',NULL);
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

-- Dump completed on 2017-02-15 16:40:42
