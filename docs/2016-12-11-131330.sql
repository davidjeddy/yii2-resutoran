-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 192.168.33.11    Database: zeroforksgiven
-- ------------------------------------------------------
-- Server version	5.6.29

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `view` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `thumbnail_base_url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_path` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `updater_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `published_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_author` (`author_id`),
  KEY `fk_article_updater` (`updater_id`),
  KEY `fk_article_category` (`category_id`),
  CONSTRAINT `fk_article_author` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_article_category` FOREIGN KEY (`category_id`) REFERENCES `article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_article_updater` FOREIGN KEY (`updater_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_attachment`
--

DROP TABLE IF EXISTS `article_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `base_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_attachment_article` (`article_id`),
  CONSTRAINT `fk_article_attachment_article` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_attachment`
--

LOCK TABLES `article_attachment` WRITE;
/*!40000 ALTER TABLE `article_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_category`
--

DROP TABLE IF EXISTS `article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_category_section` (`parent_id`),
  CONSTRAINT `fk_article_category_section` FOREIGN KEY (`parent_id`) REFERENCES `article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_category`
--

LOCK TABLES `article_category` WRITE;
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
INSERT INTO `article_category` (`id`, `slug`, `title`, `body`, `parent_id`, `status`, `created_at`, `updated_at`) VALUES (1,'news','News',NULL,NULL,1,1473112458,NULL);
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_storage_item`
--

DROP TABLE IF EXISTS `file_storage_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_storage_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) NOT NULL,
  `base_url` varchar(1024) NOT NULL,
  `path` varchar(1024) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `upload_ip` varchar(15) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_storage_item`
--

LOCK TABLES `file_storage_item` WRITE;
/*!40000 ALTER TABLE `file_storage_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_storage_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i18n_message`
--

DROP TABLE IF EXISTS `i18n_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i18n_message` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `translation` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`,`language`),
  CONSTRAINT `fk_i18n_message_source_message` FOREIGN KEY (`id`) REFERENCES `i18n_source_message` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i18n_message`
--

LOCK TABLES `i18n_message` WRITE;
/*!40000 ALTER TABLE `i18n_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `i18n_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i18n_source_message`
--

DROP TABLE IF EXISTS `i18n_source_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i18n_source_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i18n_source_message`
--

LOCK TABLES `i18n_source_message` WRITE;
/*!40000 ALTER TABLE `i18n_source_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `i18n_source_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `key_storage_item`
--

DROP TABLE IF EXISTS `key_storage_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `key_storage_item` (
  `key` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `idx_key_storage_item_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `key_storage_item`
--

LOCK TABLES `key_storage_item` WRITE;
/*!40000 ALTER TABLE `key_storage_item` DISABLE KEYS */;
INSERT INTO `key_storage_item` (`key`, `value`, `comment`, `updated_at`, `created_at`) VALUES ('backend.layout-boxed','0',NULL,NULL,NULL),('backend.layout-collapsed-sidebar','0',NULL,NULL,NULL),('backend.layout-fixed','0',NULL,NULL,NULL),('backend.theme-skin','skin-blue','skin-blue, skin-black, skin-purple, skin-green, skin-red, skin-yellow',NULL,NULL),('frontend.maintenance','disabled','Set it to \"true\" to turn on maintenance mode',NULL,NULL);
/*!40000 ALTER TABLE `key_storage_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `view` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` (`id`, `slug`, `title`, `body`, `view`, `status`, `created_at`, `updated_at`) VALUES (1,'about','About','Lorem ipsum dolor sit amet, consectetur adipiscing elit.',NULL,1,1473112458,1473112458);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_auth_assignment`
--

DROP TABLE IF EXISTS `rbac_auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `rbac_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_auth_assignment`
--

LOCK TABLES `rbac_auth_assignment` WRITE;
/*!40000 ALTER TABLE `rbac_auth_assignment` DISABLE KEYS */;
INSERT INTO `rbac_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES ('administrator','1',1473112459),('manager','2',1473112459),('user','3',1473112459);
/*!40000 ALTER TABLE `rbac_auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_auth_item`
--

DROP TABLE IF EXISTS `rbac_auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `rbac_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `rbac_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_auth_item`
--

LOCK TABLES `rbac_auth_item` WRITE;
/*!40000 ALTER TABLE `rbac_auth_item` DISABLE KEYS */;
INSERT INTO `rbac_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES ('administrator',1,NULL,NULL,NULL,1473112459,1473112459),('editOwnModel',2,NULL,'ownModelRule',NULL,1473112460,1473112460),('loginToBackend',2,NULL,NULL,NULL,1473112460,1473112460),('manager',1,NULL,NULL,NULL,1473112459,1473112459),('user',1,NULL,NULL,NULL,1473112459,1473112459);
/*!40000 ALTER TABLE `rbac_auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_auth_item_child`
--

DROP TABLE IF EXISTS `rbac_auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `rbac_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rbac_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_auth_item_child`
--

LOCK TABLES `rbac_auth_item_child` WRITE;
/*!40000 ALTER TABLE `rbac_auth_item_child` DISABLE KEYS */;
INSERT INTO `rbac_auth_item_child` (`parent`, `child`) VALUES ('user','editOwnModel'),('manager','loginToBackend'),('administrator','manager'),('manager','user');
/*!40000 ALTER TABLE `rbac_auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_auth_rule`
--

DROP TABLE IF EXISTS `rbac_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_auth_rule`
--

LOCK TABLES `rbac_auth_rule` WRITE;
/*!40000 ALTER TABLE `rbac_auth_rule` DISABLE KEYS */;
INSERT INTO `rbac_auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES ('ownModelRule','O:29:\"common\\rbac\\rule\\OwnModelRule\":3:{s:4:\"name\";s:12:\"ownModelRule\";s:9:\"createdAt\";i:1473112460;s:9:\"updatedAt\";i:1473112460;}',1473112460,1473112460);
/*!40000 ALTER TABLE `rbac_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_ambiance_option`
--

DROP TABLE IF EXISTS `resu_ambiance_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_ambiance_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_ambiance_option`
--

LOCK TABLES `resu_ambiance_option` WRITE;
/*!40000 ALTER TABLE `resu_ambiance_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `resu_ambiance_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_boolean_option`
--

DROP TABLE IF EXISTS `resu_boolean_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_boolean_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_boolean_option`
--

LOCK TABLES `resu_boolean_option` WRITE;
/*!40000 ALTER TABLE `resu_boolean_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `resu_boolean_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_contact`
--

DROP TABLE IF EXISTS `resu_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL,
  `country_code` int(2) NOT NULL,
  `phone1` int(11) NOT NULL,
  `phone2` int(11) DEFAULT NULL,
  `phone3` int(11) DEFAULT NULL,
  `address1` text,
  `address2` text,
  `address3` text,
  `country` text,
  `city` text,
  `prov` varchar(2) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_contact`
--

LOCK TABLES `resu_contact` WRITE;
/*!40000 ALTER TABLE `resu_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `resu_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_cuisine_option`
--

DROP TABLE IF EXISTS `resu_cuisine_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_cuisine_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_cuisine_option`
--

LOCK TABLES `resu_cuisine_option` WRITE;
/*!40000 ALTER TABLE `resu_cuisine_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `resu_cuisine_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_day_option`
--

DROP TABLE IF EXISTS `resu_day_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_day_option` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL,
  `abbr` varchar(3) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_day_option`
--

LOCK TABLES `resu_day_option` WRITE;
/*!40000 ALTER TABLE `resu_day_option` DISABLE KEYS */;
INSERT INTO `resu_day_option` (`id`, `value`, `abbr`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`) VALUES (1,'Monday','Mon',1480876029,1,NULL,NULL,NULL),(2,'Tuesday','Tue',1480876029,1,NULL,NULL,NULL),(3,'Wednesday','Wed',1480876029,1,NULL,NULL,NULL),(4,'Thursday','Thu',1480876029,1,NULL,NULL,NULL),(5,'Friday','Fri',1480876029,1,NULL,NULL,NULL),(6,'Saturday','Sat',1480876029,1,NULL,NULL,NULL),(7,'Sunday','Sun',1480876029,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `resu_day_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_decor_option`
--

DROP TABLE IF EXISTS `resu_decor_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_decor_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_decor_option`
--

LOCK TABLES `resu_decor_option` WRITE;
/*!40000 ALTER TABLE `resu_decor_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `resu_decor_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_dress_code_option`
--

DROP TABLE IF EXISTS `resu_dress_code_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_dress_code_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_dress_code_option`
--

LOCK TABLES `resu_dress_code_option` WRITE;
/*!40000 ALTER TABLE `resu_dress_code_option` DISABLE KEYS */;
INSERT INTO `resu_dress_code_option` (`id`, `value`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`) VALUES (1,'qwer',1481476887,1,NULL,NULL,1481476890);
/*!40000 ALTER TABLE `resu_dress_code_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_franchise`
--

DROP TABLE IF EXISTS `resu_franchise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_franchise` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idresu_franchise_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_franchise`
--

LOCK TABLES `resu_franchise` WRITE;
/*!40000 ALTER TABLE `resu_franchise` DISABLE KEYS */;
/*!40000 ALTER TABLE `resu_franchise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_hour_value`
--

DROP TABLE IF EXISTS `resu_hour_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_hour_value` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_hour_value`
--

LOCK TABLES `resu_hour_value` WRITE;
/*!40000 ALTER TABLE `resu_hour_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `resu_hour_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_location`
--

DROP TABLE IF EXISTS `resu_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL,
  `resu_franchise_id` int(10) unsigned DEFAULT NULL,
  `resu_decor_option_id` int(10) unsigned DEFAULT NULL,
  `resu_ambiance_option_id` int(10) unsigned DEFAULT NULL,
  `resu_map_id` int(11) unsigned DEFAULT NULL,
  `address_1` text,
  `address_2` text,
  `resu_state_id` int(11) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_resu_location_resu_franchise_idx` (`resu_franchise_id`),
  KEY `fk_resu_location_resu_decor_option1_idx` (`resu_decor_option_id`),
  KEY `fk_resu_location_resu_ambiance_option1_idx` (`resu_ambiance_option_id`),
  KEY `fk_resu_location_resu_map1_idx` (`resu_map_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_location`
--

LOCK TABLES `resu_location` WRITE;
/*!40000 ALTER TABLE `resu_location` DISABLE KEYS */;
INSERT INTO `resu_location` (`id`, `value`, `resu_franchise_id`, `resu_decor_option_id`, `resu_ambiance_option_id`, `resu_map_id`, `address_1`, `address_2`, `resu_state_id`, `phone`, `email`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`) VALUES (1,'qwerasdf',NULL,NULL,NULL,NULL,NULL,NULL,10,'1234567890','user@email.com',1480876157,1,NULL,NULL,NULL),(2,'asdfzxcv',NULL,NULL,NULL,NULL,NULL,NULL,10,'','',1480876267,1,NULL,NULL,NULL),(3,'asdfzxcv',NULL,NULL,NULL,NULL,NULL,NULL,10,'1234567890','user@email.com',1480880591,1,NULL,NULL,NULL),(4,'qwerzxcv',NULL,NULL,NULL,NULL,NULL,NULL,10,'1234567890','',1480880813,1,NULL,NULL,NULL),(5,'qwertyuiop',NULL,NULL,NULL,NULL,NULL,NULL,10,'727-515-985','',1481473354,1,NULL,NULL,NULL),(6,'test1',NULL,NULL,NULL,NULL,NULL,NULL,10,'1234567890','',1481476195,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `resu_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_location_boolean`
--

DROP TABLE IF EXISTS `resu_location_boolean`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_location_boolean` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `resu_location_id` int(10) unsigned NOT NULL,
  `resu_boolean_option_id` int(10) unsigned NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_resu_location_boolean_resu_location1_idx` (`resu_location_id`),
  KEY `fk_resu_location_boolean_resu_boolean_option1_idx` (`resu_boolean_option_id`),
  CONSTRAINT `fk_resu_location_boolean_resu_boolean_option1` FOREIGN KEY (`resu_boolean_option_id`) REFERENCES `resu_boolean_option` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_boolean_resu_location1` FOREIGN KEY (`resu_location_id`) REFERENCES `resu_location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_location_boolean`
--

LOCK TABLES `resu_location_boolean` WRITE;
/*!40000 ALTER TABLE `resu_location_boolean` DISABLE KEYS */;
/*!40000 ALTER TABLE `resu_location_boolean` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_location_cuisine`
--

DROP TABLE IF EXISTS `resu_location_cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_location_cuisine` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `resu_location_id` int(10) unsigned NOT NULL,
  `resu_cuisine_option_id` int(10) unsigned NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_resu_location_cuisine_resu_location1_idx` (`resu_location_id`),
  KEY `fk_resu_location_cuisine_resu_cuisine_option1_idx` (`resu_cuisine_option_id`),
  CONSTRAINT `fk_resu_location_cuisine_resu_cuisine_option1` FOREIGN KEY (`resu_cuisine_option_id`) REFERENCES `resu_cuisine_option` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_cuisine_resu_location1` FOREIGN KEY (`resu_location_id`) REFERENCES `resu_location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_location_cuisine`
--

LOCK TABLES `resu_location_cuisine` WRITE;
/*!40000 ALTER TABLE `resu_location_cuisine` DISABLE KEYS */;
/*!40000 ALTER TABLE `resu_location_cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_location_day`
--

DROP TABLE IF EXISTS `resu_location_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_location_day` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `resu_day_option_id` int(11) unsigned NOT NULL,
  `resu_location_id` int(10) unsigned NOT NULL,
  `resu_hour_value_id` int(11) unsigned NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_resu_location_day_resu_location1_idx` (`resu_location_id`),
  KEY `fk_resu_location_day_resu_day_option1_idx` (`resu_day_option_id`),
  KEY `fk_resu_location_day_resu_hour_value1_idx` (`resu_hour_value_id`),
  CONSTRAINT `fk_resu_location_day_resu_day_option1` FOREIGN KEY (`resu_day_option_id`) REFERENCES `resu_day_option` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_day_resu_hour_value1` FOREIGN KEY (`resu_hour_value_id`) REFERENCES `resu_hour_value` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_day_resu_location1` FOREIGN KEY (`resu_location_id`) REFERENCES `resu_location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_location_day`
--

LOCK TABLES `resu_location_day` WRITE;
/*!40000 ALTER TABLE `resu_location_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `resu_location_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_location_dress_code`
--

DROP TABLE IF EXISTS `resu_location_dress_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_location_dress_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `resu_location_id` int(10) unsigned NOT NULL,
  `resu_dress_code_option_id` int(10) unsigned NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_resu_location_dress_code_resu_location1_idx` (`resu_location_id`),
  KEY `fk_resu_location_dress_code_resu_dress_code_option1_idx` (`resu_dress_code_option_id`),
  CONSTRAINT `fk_resu_location_dress_code_resu_dress_code_option1` FOREIGN KEY (`resu_dress_code_option_id`) REFERENCES `resu_dress_code_option` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_dress_code_resu_location1` FOREIGN KEY (`resu_location_id`) REFERENCES `resu_location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_location_dress_code`
--

LOCK TABLES `resu_location_dress_code` WRITE;
/*!40000 ALTER TABLE `resu_location_dress_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `resu_location_dress_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_location_media`
--

DROP TABLE IF EXISTS `resu_location_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_location_media` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `resu_media_option_id` int(10) unsigned NOT NULL,
  `resu_location_id` int(10) unsigned NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_resu_location_media_resu_media_option1_idx` (`resu_media_option_id`),
  KEY `fk_resu_location_media_resu_location1_idx` (`resu_location_id`),
  CONSTRAINT `fk_resu_location_media_resu_location1` FOREIGN KEY (`resu_location_id`) REFERENCES `resu_location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_media_resu_media_option1` FOREIGN KEY (`resu_media_option_id`) REFERENCES `resu_media_option` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_location_media`
--

LOCK TABLES `resu_location_media` WRITE;
/*!40000 ALTER TABLE `resu_location_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `resu_location_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_location_menu`
--

DROP TABLE IF EXISTS `resu_location_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_location_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `resu_location_id` int(10) unsigned NOT NULL,
  `resu_menu_option_id` int(10) unsigned NOT NULL,
  `high_price` varchar(6) DEFAULT NULL,
  `low_price` varchar(6) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_resu_location_menu_resu_location1_idx` (`resu_location_id`),
  KEY `fk_resu_location_menu_resu_menu_option1_idx` (`resu_menu_option_id`),
  CONSTRAINT `fk_resu_location_menu_resu_location1` FOREIGN KEY (`resu_location_id`) REFERENCES `resu_location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_menu_resu_menu_option1` FOREIGN KEY (`resu_menu_option_id`) REFERENCES `resu_menu_option` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_location_menu`
--

LOCK TABLES `resu_location_menu` WRITE;
/*!40000 ALTER TABLE `resu_location_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `resu_location_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_location_payment`
--

DROP TABLE IF EXISTS `resu_location_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_location_payment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `resu_payment_option_id` int(10) unsigned NOT NULL,
  `resu_location_id` int(10) unsigned NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_resu_location_payment_resu_payment_option1_idx` (`resu_payment_option_id`),
  KEY `fk_resu_location_payment_resu_location1_idx` (`resu_location_id`),
  CONSTRAINT `fk_resu_location_payment_resu_location1` FOREIGN KEY (`resu_location_id`) REFERENCES `resu_location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_payment_resu_payment_option1` FOREIGN KEY (`resu_payment_option_id`) REFERENCES `resu_payment_option` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_location_payment`
--

LOCK TABLES `resu_location_payment` WRITE;
/*!40000 ALTER TABLE `resu_location_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `resu_location_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_location_seating`
--

DROP TABLE IF EXISTS `resu_location_seating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_location_seating` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `resu_location_id` int(10) unsigned NOT NULL,
  `resu_seating_option_id` int(10) unsigned NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_resu_location_seating_resu_location1_idx` (`resu_location_id`),
  KEY `fk_resu_location_seating_resu_seating_option1_idx` (`resu_seating_option_id`),
  CONSTRAINT `fk_resu_location_seating_resu_location1` FOREIGN KEY (`resu_location_id`) REFERENCES `resu_location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resu_location_seating_resu_seating_option1` FOREIGN KEY (`resu_seating_option_id`) REFERENCES `resu_seating_option` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_location_seating`
--

LOCK TABLES `resu_location_seating` WRITE;
/*!40000 ALTER TABLE `resu_location_seating` DISABLE KEYS */;
/*!40000 ALTER TABLE `resu_location_seating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_map`
--

DROP TABLE IF EXISTS `resu_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_map` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL,
  `provider` text NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_map`
--

LOCK TABLES `resu_map` WRITE;
/*!40000 ALTER TABLE `resu_map` DISABLE KEYS */;
INSERT INTO `resu_map` (`id`, `value`, `provider`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`) VALUES (1,'qwer','google',0,0,NULL,NULL,NULL),(2,'asdf','bing',0,0,NULL,NULL,NULL),(3,'zxcv','other',0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `resu_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_media_option`
--

DROP TABLE IF EXISTS `resu_media_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_media_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_media_option`
--

LOCK TABLES `resu_media_option` WRITE;
/*!40000 ALTER TABLE `resu_media_option` DISABLE KEYS */;
INSERT INTO `resu_media_option` (`id`, `value`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`) VALUES (1,'audio',0,0,NULL,NULL,NULL),(2,'image',0,0,NULL,NULL,NULL),(3,'video',0,0,NULL,NULL,NULL),(4,'panoramic',0,0,NULL,NULL,NULL),(5,'vr',0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `resu_media_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_menu_option`
--

DROP TABLE IF EXISTS `resu_menu_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_menu_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_menu_option`
--

LOCK TABLES `resu_menu_option` WRITE;
/*!40000 ALTER TABLE `resu_menu_option` DISABLE KEYS */;
INSERT INTO `resu_menu_option` (`id`, `value`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`) VALUES (1,'child',0,0,NULL,NULL,1480878392),(2,'vegan',0,0,NULL,NULL,1480878830),(3,'gluten free',0,0,NULL,NULL,1480878832),(4,'daily special',0,0,NULL,NULL,1480878834),(5,'peanut free',0,0,NULL,NULL,1480878835),(6,'Menu Price',1480879755,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `resu_menu_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_payment_option`
--

DROP TABLE IF EXISTS `resu_payment_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_payment_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_payment_option`
--

LOCK TABLES `resu_payment_option` WRITE;
/*!40000 ALTER TABLE `resu_payment_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `resu_payment_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_review`
--

DROP TABLE IF EXISTS `resu_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_review` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `resu_location_id` int(10) unsigned NOT NULL,
  `value` text NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_resu_review_resu_location1` (`resu_location_id`),
  CONSTRAINT `fk_resu_review_resu_location1` FOREIGN KEY (`resu_location_id`) REFERENCES `resu_location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_review`
--

LOCK TABLES `resu_review` WRITE;
/*!40000 ALTER TABLE `resu_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `resu_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_seating_option`
--

DROP TABLE IF EXISTS `resu_seating_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_seating_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_seating_option`
--

LOCK TABLES `resu_seating_option` WRITE;
/*!40000 ALTER TABLE `resu_seating_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `resu_seating_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resu_state`
--

DROP TABLE IF EXISTS `resu_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resu_state` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK: State ID',
  `name` varchar(32) NOT NULL COMMENT 'State name with first letter capital',
  `abbr` varchar(8) DEFAULT NULL COMMENT 'Optional state abbreviation (US 2 cap letters)',
  `created_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resu_state`
--

LOCK TABLES `resu_state` WRITE;
/*!40000 ALTER TABLE `resu_state` DISABLE KEYS */;
INSERT INTO `resu_state` (`id`, `name`, `abbr`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`) VALUES (1,'Alabama','AL',1481474715,1,NULL,NULL,NULL),(2,'Alaska','AK',1481474715,1,NULL,NULL,NULL),(3,'Arizona','AZ',1481474715,1,NULL,NULL,NULL),(4,'Arkansas','AR',1481474715,1,NULL,NULL,NULL),(5,'California','CA',1481474715,1,NULL,NULL,NULL),(6,'Colorado','CO',1481474715,1,NULL,NULL,NULL),(7,'Connecticut','CT',1481474715,1,NULL,NULL,NULL),(8,'Delaware','DE',1481474715,1,NULL,NULL,NULL),(9,'District of Columbia','DC',1481474715,1,NULL,NULL,NULL),(10,'Florida','FL',1481474715,1,NULL,NULL,NULL),(11,'Georgia','GA',1481474715,1,NULL,NULL,NULL),(12,'Hawaii','HI',1481474715,1,NULL,NULL,NULL),(13,'Idaho','ID',1481474715,1,NULL,NULL,NULL),(14,'Illinois','IL',1481474715,1,NULL,NULL,NULL),(15,'Indiana','IN',1481474715,1,NULL,NULL,NULL),(16,'Iowa','IA',1481474715,1,NULL,NULL,NULL),(17,'Kansas','KS',1481474715,1,NULL,NULL,NULL),(18,'Kentucky','KY',1481474715,1,NULL,NULL,NULL),(19,'Louisiana','LA',1481474715,1,NULL,NULL,NULL),(20,'Maine','ME',1481474715,1,NULL,NULL,NULL),(21,'Maryland','MD',1481474715,1,NULL,NULL,NULL),(22,'Massachusetts','MA',1481474715,1,NULL,NULL,NULL),(23,'Michigan','MI',1481474715,1,NULL,NULL,NULL),(24,'Minnesota','MN',1481474715,1,NULL,NULL,NULL),(25,'Mississippi','MS',1481474715,1,NULL,NULL,NULL),(26,'Missouri','MO',1481474715,1,NULL,NULL,NULL),(27,'Montana','MT',1481474715,1,NULL,NULL,NULL),(28,'Nebraska','NE',1481474715,1,NULL,NULL,NULL),(29,'Nevada','NV',1481474715,1,NULL,NULL,NULL),(30,'New Hampshire','NH',1481474715,1,NULL,NULL,NULL),(31,'New Jersey','NJ',1481474715,1,NULL,NULL,NULL),(32,'New Mexico','NM',1481474715,1,NULL,NULL,NULL),(33,'New York','NY',1481474715,1,NULL,NULL,NULL),(34,'North Carolina','NC',1481474715,1,NULL,NULL,NULL),(35,'North Dakota','ND',1481474715,1,NULL,NULL,NULL),(36,'Ohio','OH',1481474715,1,NULL,NULL,NULL),(37,'Oklahoma','OK',1481474715,1,NULL,NULL,NULL),(38,'Oregon','OR',1481474715,1,NULL,NULL,NULL),(39,'Pennsylvania','PA',1481474715,1,NULL,NULL,NULL),(40,'Rhode Island','RI',1481474715,1,NULL,NULL,NULL),(41,'South Carolina','SC',1481474715,1,NULL,NULL,NULL),(42,'South Dakota','SD',1481474715,1,NULL,NULL,NULL),(43,'Tennessee','TN',1481474715,1,NULL,NULL,NULL),(44,'Texas','TX',1481474715,1,NULL,NULL,NULL),(45,'Utah','UT',1481474715,1,NULL,NULL,NULL),(46,'Vermont','VT',1481474715,1,NULL,NULL,NULL),(47,'Virginia','VA',1481474715,1,NULL,NULL,NULL),(48,'Washington','WA',1481474715,1,NULL,NULL,NULL),(49,'West Virginia','WV',1481474715,1,NULL,NULL,NULL),(50,'Wisconsin','WI',1481474715,1,NULL,NULL,NULL),(51,'Wyoming','WY',1481474715,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `resu_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_db_migration`
--

DROP TABLE IF EXISTS `system_db_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_db_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_db_migration`
--

LOCK TABLES `system_db_migration` WRITE;
/*!40000 ALTER TABLE `system_db_migration` DISABLE KEYS */;
INSERT INTO `system_db_migration` (`version`, `apply_time`) VALUES ('m000000_000000_base',1473112453),('m140703_123000_user',1473112456),('m140703_123055_log',1473112456),('m140703_123104_page',1473112456),('m140703_123803_article',1473112456),('m140703_123813_rbac',1473112456),('m140709_173306_widget_menu',1473112456),('m140709_173333_widget_text',1473112456),('m140712_123329_widget_carousel',1473112456),('m140805_084745_key_storage_item',1473112456),('m141012_101932_i18n_tables',1473112456),('m150318_213934_file_storage_item',1473112456),('m150414_195800_timeline_event',1473112456),('m150725_192740_seed_data',1473112458),('m150929_074021_article_attachment_order',1473112458),('m160203_095604_user_token',1473112458),('m160611_062020_init_resutoran',1480876028),('m160611_064310_update_maps_add_provider_column',1480876029),('m160611_064319_add_blameable_columns',1480876029),('m160611_074706_init_data',1480876029),('m160813_141130_add_primary_key_to_intermediary_tables',1480876029),('m160813_173030_update_franchise_table_rename_name_to_value_and_change_data_type',1480876029),('m160813_173030_update_location_add_value_field',1480876029),('m160814_234138_rename_services_table_to_service',1480876029),('m160814_235830_update_tables_add_value_field_where_missing',1480876029),('m160828_235830_update_media_table_move_value_column',1480876029),('m160918_210347_update_resu_location_service_table_resu_services_option_id_field',1480876029),('m161016_153923_add_alcohol_and_speciality_menu_option_tables',1480876029),('m161016_220949_update_menu_option_adding_high_low_price_fields',1480876029),('m161023_133828_remove_hours_table',1480876029),('m161023_154136_add_days_hours_location_tables',1480876029),('m161023_155312_insert_day_default_data',1480876029),('m161106_135101_change_how_menu_and_pricing_work',1480876029),('m161120_004000_change_loc_menu_price_data_type',1480876029),('m161120_004500_remove_specialty_alcohol_service_reservations_price_tables',1480876029),('m161127_051333_create_review_crud',1481474715),('m161127_193330_modified_resu_location_table_add_location_fields',1481474715),('m161127_194700_remove_contact_table_and_related',1481474715),('m161204_120345_edit_resu_location_remove_country_field',1481474715),('m161204_120615_add_us_province_table_and_data',1481474715),('m161204_131721_edit_resu_location_1st_level_relations',1481474715),('m161204_141530_add_blameable_columns_to_state_table',1481474715);
/*!40000 ALTER TABLE `system_db_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_log`
--

DROP TABLE IF EXISTS `system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_log_level` (`level`),
  KEY `idx_log_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

LOCK TABLES `system_log` WRITE;
/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_rbac_migration`
--

DROP TABLE IF EXISTS `system_rbac_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_rbac_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_rbac_migration`
--

LOCK TABLES `system_rbac_migration` WRITE;
/*!40000 ALTER TABLE `system_rbac_migration` DISABLE KEYS */;
INSERT INTO `system_rbac_migration` (`version`, `apply_time`) VALUES ('m000000_000000_base',1473112458),('m150625_214101_roles',1473112459),('m150625_215624_init_permissions',1473112460),('m151223_074604_edit_own_model',1473112460);
/*!40000 ALTER TABLE `system_rbac_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeline_event`
--

DROP TABLE IF EXISTS `timeline_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeline_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `event` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeline_event`
--

LOCK TABLES `timeline_event` WRITE;
/*!40000 ALTER TABLE `timeline_event` DISABLE KEYS */;
INSERT INTO `timeline_event` (`id`, `application`, `category`, `event`, `data`, `created_at`) VALUES (1,'frontend','user','signup','{\"public_identity\":\"webmaster\",\"user_id\":1,\"created_at\":1473112456}',1473112456),(2,'frontend','user','signup','{\"public_identity\":\"manager\",\"user_id\":2,\"created_at\":1473112456}',1473112456),(3,'frontend','user','signup','{\"public_identity\":\"user\",\"user_id\":3,\"created_at\":1473112456}',1473112456);
/*!40000 ALTER TABLE `timeline_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `access_token` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `oauth_client` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oauth_client_user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '2',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `logged_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `auth_key`, `access_token`, `password_hash`, `oauth_client`, `oauth_client_user_id`, `email`, `status`, `created_at`, `updated_at`, `logged_at`) VALUES (1,'webmaster','qWwHf7FbGZyvFzEgKo9RDYIsEGLsonZM','HKDPRpcEy4Vk_mvYZ7JvIelPZN_LvJhM1ExC3dM_','$2y$13$sWUwp4AEmTcOzAe8zOlAAeTrH8/xhgfI.rISoN8LKNbGTfmVSG9WW',NULL,NULL,'webmaster@example.com',2,1473112457,1473112457,1481472876),(2,'manager','y8vi8Re3Wn4aH4BZK6GvNNY6Js_iltQa','ZxvY7JArXDSn4gRAhb9BKnj_Dr7H2kDW_8ZF2GIG','$2y$13$/bvKO.RqO58vGPvq2nYVFubWKv0LdwDStNWcZ7LIPt79rXxODfxJq',NULL,NULL,'manager@example.com',2,1473112457,1473112457,NULL),(3,'user','0bQ0XBqVdSCpFN6lXsxgV-mabVZvR1B-','gOvPurxIoD6tXnsMkhHX2dXoaN0cXkbC3nsSQwt0','$2y$13$8BNqsnVm4UgRvgb1riWWi.vy/eEZxU4X/9HZSXfahQVvr6to4FdqS',NULL,NULL,'user@example.com',2,1473112458,1473112458,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middlename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_base_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `gender` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` (`user_id`, `firstname`, `middlename`, `lastname`, `avatar_path`, `avatar_base_url`, `locale`, `gender`) VALUES (1,'John',NULL,'Doe',NULL,NULL,'en-US',NULL),(2,NULL,NULL,NULL,NULL,NULL,'en-US',NULL),(3,NULL,NULL,NULL,NULL,NULL,'en-US',NULL);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_token`
--

DROP TABLE IF EXISTS `user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `token` varchar(40) NOT NULL,
  `expire_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_token`
--

LOCK TABLES `user_token` WRITE;
/*!40000 ALTER TABLE `user_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_carousel`
--

DROP TABLE IF EXISTS `widget_carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_carousel`
--

LOCK TABLES `widget_carousel` WRITE;
/*!40000 ALTER TABLE `widget_carousel` DISABLE KEYS */;
INSERT INTO `widget_carousel` (`id`, `key`, `status`) VALUES (1,'index',1);
/*!40000 ALTER TABLE `widget_carousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_carousel_item`
--

DROP TABLE IF EXISTS `widget_carousel_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_carousel_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carousel_id` int(11) NOT NULL,
  `base_url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caption` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_carousel` (`carousel_id`),
  CONSTRAINT `fk_item_carousel` FOREIGN KEY (`carousel_id`) REFERENCES `widget_carousel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_carousel_item`
--

LOCK TABLES `widget_carousel_item` WRITE;
/*!40000 ALTER TABLE `widget_carousel_item` DISABLE KEYS */;
INSERT INTO `widget_carousel_item` (`id`, `carousel_id`, `base_url`, `path`, `type`, `url`, `caption`, `status`, `order`, `created_at`, `updated_at`) VALUES (1,1,'http://fe.zeroforksgiven.dev','img/yii2-starter-kit.gif','image/gif','/',NULL,1,0,NULL,NULL);
/*!40000 ALTER TABLE `widget_carousel_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_menu`
--

DROP TABLE IF EXISTS `widget_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `items` text COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_menu`
--

LOCK TABLES `widget_menu` WRITE;
/*!40000 ALTER TABLE `widget_menu` DISABLE KEYS */;
INSERT INTO `widget_menu` (`id`, `key`, `title`, `items`, `status`) VALUES (1,'frontend-index','Frontend index menu','[\n    {\n        \"label\": \"Get started with Yii2\",\n        \"url\": \"http://www.yiiframework.com\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-success\\\">{label}</a>\"\n    },\n    {\n        \"label\": \"Yii2 Starter Kit on GitHub\",\n        \"url\": \"https://github.com/trntv/yii2-starter-kit\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-primary\\\">{label}</a>\"\n    },\n    {\n        \"label\": \"Find a bug?\",\n        \"url\": \"https://github.com/trntv/yii2-starter-kit/issues\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-danger\\\">{label}</a>\"\n    }\n]',1);
/*!40000 ALTER TABLE `widget_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_text`
--

DROP TABLE IF EXISTS `widget_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_widget_text_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_text`
--

LOCK TABLES `widget_text` WRITE;
/*!40000 ALTER TABLE `widget_text` DISABLE KEYS */;
INSERT INTO `widget_text` (`id`, `key`, `title`, `body`, `status`, `created_at`, `updated_at`) VALUES (1,'backend_welcome','Welcome to backend','<p>Welcome to Yii2 Starter Kit Dashboard</p>',1,1473112458,1473112458),(2,'ads-example','Google Ads Example Block','<div class=\"lead\">\n                <script async src=\"//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js\"></script>\n                <ins class=\"adsbygoogle\"\n                     style=\"display:block\"\n                     data-ad-client=\"ca-pub-9505937224921657\"\n                     data-ad-slot=\"2264361777\"\n                     data-ad-format=\"auto\"></ins>\n                <script>\n                (adsbygoogle = window.adsbygoogle || []).push({});\n                </script>\n            </div>',0,1473112458,1473112458);
/*!40000 ALTER TABLE `widget_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'zeroforksgiven'
--

--
-- Dumping routines for database 'zeroforksgiven'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-11 13:13:28