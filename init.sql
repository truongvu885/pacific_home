-- MySQL dump 10.13  Distrib 9.1.0, for Linux (x86_64)
--
-- Host: localhost    Database: espocrm
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(249) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `industry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sic_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address_street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address_country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address_postal_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address_street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address_country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address_postal_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `stream_updated_at` datetime DEFAULT NULL,
  `campaign_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_number` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CREATED_AT_ID` (`created_at`,`id`),
  KEY `IDX_CREATED_AT` (`created_at`,`deleted`),
  KEY `IDX_NAME` (`name`,`deleted`),
  KEY `IDX_ASSIGNED_USER` (`assigned_user_id`,`deleted`),
  KEY `IDX_CAMPAIGN_ID` (`campaign_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_ASSIGNED_USER_ID` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_contact`
--

DROP TABLE IF EXISTS `account_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_contact` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_inactive` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_ACCOUNT_ID_CONTACT_ID` (`account_id`,`contact_id`),
  KEY `IDX_ACCOUNT_ID` (`account_id`),
  KEY `IDX_CONTACT_ID` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_contact`
--

LOCK TABLES `account_contact` WRITE;
/*!40000 ALTER TABLE `account_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_document`
--

DROP TABLE IF EXISTS `account_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_document` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_ACCOUNT_ID_DOCUMENT_ID` (`account_id`,`document_id`),
  KEY `IDX_ACCOUNT_ID` (`account_id`),
  KEY `IDX_DOCUMENT_ID` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_document`
--

LOCK TABLES `account_document` WRITE;
/*!40000 ALTER TABLE `account_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_portal_user`
--

DROP TABLE IF EXISTS `account_portal_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_portal_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_USER_ID_ACCOUNT_ID` (`user_id`,`account_id`),
  KEY `IDX_USER_ID` (`user_id`),
  KEY `IDX_ACCOUNT_ID` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_portal_user`
--

LOCK TABLES `account_portal_user` WRITE;
/*!40000 ALTER TABLE `account_portal_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_portal_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_target_list`
--

DROP TABLE IF EXISTS `account_target_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_target_list` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_list_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opted_out` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_ACCOUNT_ID_TARGET_LIST_ID` (`account_id`,`target_list_id`),
  KEY `IDX_ACCOUNT_ID` (`account_id`),
  KEY `IDX_TARGET_LIST_ID` (`target_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_target_list`
--

LOCK TABLES `account_target_list` WRITE;
/*!40000 ALTER TABLE `account_target_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_target_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `action_history_record`
--

DROP TABLE IF EXISTS `action_history_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action_history_record` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `number` bigint unsigned NOT NULL AUTO_INCREMENT,
  `target_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `ip_address` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_log_record_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_NUMBER` (`number`),
  KEY `IDX_TARGET` (`target_type`,`target_id`),
  KEY `IDX_USER_ID` (`user_id`),
  KEY `IDX_AUTH_TOKEN_ID` (`auth_token_id`),
  KEY `IDX_AUTH_LOG_RECORD_ID` (`auth_log_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_history_record`
--

LOCK TABLES `action_history_record` WRITE;
/*!40000 ALTER TABLE `action_history_record` DISABLE KEYS */;
INSERT INTO `action_history_record` VALUES ('6939a9f54cb4969a1',0,1,'User',NULL,'read','2025-12-10 17:12:21','172.18.0.1','6939a9d3396c90d2b','6939a9d3396c90d2b','6939a9f41d319132d','6939a9f41f631b778'),('6939ab168a306e1fc',0,2,'User',NULL,'read','2025-12-10 17:17:10','172.18.0.1','6939a9d3396c90d2b','6939a9d3396c90d2b','6939ab148ba166990','6939ab148bfbb51e8'),('6939ac984321f8301',0,3,'Role',NULL,'create','2025-12-10 17:23:36','172.18.0.1','6939ac984059e22e8','6939a9d3396c90d2b','6939ab148ba166990','6939ab148bfbb51e8'),('6939ac984fc1f95ce',0,4,'Role',NULL,'read','2025-12-10 17:23:36','172.18.0.1','6939ac984059e22e8','6939a9d3396c90d2b','6939ab148ba166990','6939ab148bfbb51e8'),('6939acd5abff8a8ae',0,5,'Role',NULL,'create','2025-12-10 17:24:37','172.18.0.1','6939acd5ab1c95b41','6939a9d3396c90d2b','6939ab148ba166990','6939ab148bfbb51e8'),('6939acd5b7c6017b2',0,6,'Role',NULL,'read','2025-12-10 17:24:37','172.18.0.1','6939acd5ab1c95b41','6939a9d3396c90d2b','6939ab148ba166990','6939ab148bfbb51e8'),('6939acf54b8b978b2',0,7,'Role',NULL,'create','2025-12-10 17:25:09','172.18.0.1','6939acf54abba3d39','6939a9d3396c90d2b','6939ab148ba166990','6939ab148bfbb51e8'),('6939acf5553c864e3',0,8,'Role',NULL,'read','2025-12-10 17:25:09','172.18.0.1','6939acf54abba3d39','6939a9d3396c90d2b','6939ab148ba166990','6939ab148bfbb51e8'),('6939ad01d4073701e',0,9,'User',NULL,'read','2025-12-10 17:25:21','172.18.0.1','6939a9d3396c90d2b','6939a9d3396c90d2b','6939ab148ba166990','6939ab148bfbb51e8'),('6939ad4bebbb837ee',0,10,'User',NULL,'create','2025-12-10 17:26:35','172.18.0.1','6939ad4be9fe21431','6939a9d3396c90d2b','6939ab148ba166990','6939ab148bfbb51e8'),('6939ad4c02ca4e1e0',0,11,'User',NULL,'read','2025-12-10 17:26:36','172.18.0.1','6939ad4be9fe21431','6939a9d3396c90d2b','6939ab148ba166990','6939ab148bfbb51e8'),('6939ad6c60af62f81',0,12,'User',NULL,'create','2025-12-10 17:27:08','172.18.0.1','6939ad6c5ed8d27f9','6939a9d3396c90d2b','6939ab148ba166990','6939ab148bfbb51e8'),('6939ad6c6a3765b68',0,13,'User',NULL,'read','2025-12-10 17:27:08','172.18.0.1','6939ad6c5ed8d27f9','6939a9d3396c90d2b','6939ab148ba166990','6939ab148bfbb51e8'),('6939ad896346cfac8',0,14,'User',NULL,'create','2025-12-10 17:27:37','172.18.0.1','6939ad8961a73e970','6939a9d3396c90d2b','6939ab148ba166990','6939ab148bfbb51e8'),('6939ad896c29344ff',0,15,'User',NULL,'read','2025-12-10 17:27:37','172.18.0.1','6939ad8961a73e970','6939a9d3396c90d2b','6939ab148ba166990','6939ab148bfbb51e8'),('6939adb62d9a19601',0,16,'User',NULL,'read','2025-12-10 17:28:22','172.18.0.1','6939ad4be9fe21431','6939ad4be9fe21431','6939adb311074d0fb','6939adb31334c0a63'),('6939adbd5d255fed4',0,17,'User',NULL,'read','2025-12-10 17:28:29','172.18.0.1','6939ad4be9fe21431','6939ad4be9fe21431','6939adb311074d0fb','6939adb31334c0a63'),('6939add6d7cd1aaae',0,18,'User',NULL,'read','2025-12-10 17:28:54','172.18.0.1','6939a9d3396c90d2b','6939ad4be9fe21431','6939adb311074d0fb','6939adb31334c0a63'),('6939ade1af1bf91a6',0,19,'User',NULL,'read','2025-12-10 17:29:05','172.18.0.1','6939ad4be9fe21431','6939ad4be9fe21431','6939adb311074d0fb','6939adb31334c0a63'),('6939ade3322b2798e',0,20,'User',NULL,'read','2025-12-10 17:29:07','172.18.0.1','6939ad4be9fe21431','6939ad4be9fe21431','6939adb311074d0fb','6939adb31334c0a63'),('6939ade3324bc4288',0,21,'CProduct',NULL,'read','2025-12-10 17:29:07','172.18.0.1','402','6939ad4be9fe21431','6939adb311074d0fb','6939adb31334c0a63'),('6939ae02c645f8225',0,22,'User',NULL,'read','2025-12-10 17:29:38','172.18.0.1','6939ad6c5ed8d27f9','6939a9d3396c90d2b','6939adfd1811486da','6939adfd1a4bed8c1'),('6939ae0573dc852f1',0,23,'User',NULL,'read','2025-12-10 17:29:41','172.18.0.1','6939ad6c5ed8d27f9','6939a9d3396c90d2b','6939adfd1811486da','6939adfd1a4bed8c1'),('6939ae10a8689584b',0,24,'User',NULL,'update','2025-12-10 17:29:52','172.18.0.1','6939ad6c5ed8d27f9','6939a9d3396c90d2b','6939adfd1811486da','6939adfd1a4bed8c1'),('6939ae10b18d2fec4',0,25,'User',NULL,'read','2025-12-10 17:29:52','172.18.0.1','6939ad6c5ed8d27f9','6939a9d3396c90d2b','6939adfd1811486da','6939adfd1a4bed8c1'),('6939ae1491d50ac3a',0,26,'User',NULL,'read','2025-12-10 17:29:56','172.18.0.1','6939ad8961a73e970','6939a9d3396c90d2b','6939adfd1811486da','6939adfd1a4bed8c1'),('6939ae16be71e118a',0,27,'User',NULL,'read','2025-12-10 17:29:58','172.18.0.1','6939ad8961a73e970','6939a9d3396c90d2b','6939adfd1811486da','6939adfd1a4bed8c1'),('6939ae1e331b006e4',0,28,'User',NULL,'update','2025-12-10 17:30:06','172.18.0.1','6939ad8961a73e970','6939a9d3396c90d2b','6939adfd1811486da','6939adfd1a4bed8c1'),('6939ae1e39ad27d68',0,29,'User',NULL,'read','2025-12-10 17:30:06','172.18.0.1','6939ad8961a73e970','6939a9d3396c90d2b','6939adfd1811486da','6939adfd1a4bed8c1'),('6939ae2e2f647bb31',0,30,'User',NULL,'read','2025-12-10 17:30:22','172.18.0.1','6939ad6c5ed8d27f9','6939ad6c5ed8d27f9','6939ae2d045086109','6939ae2d067efb043'),('6939ae3bf1bc4d3ac',0,31,'CProduct',NULL,'read','2025-12-10 17:30:35','172.18.0.1','402','6939ad6c5ed8d27f9','6939ae2d045086109','6939ae2d067efb043'),('6939ae3bf1fbbf376',0,32,'User',NULL,'read','2025-12-10 17:30:35','172.18.0.1','6939ad6c5ed8d27f9','6939ad6c5ed8d27f9','6939ae2d045086109','6939ae2d067efb043'),('6939ae520f4b3ae4f',0,33,'User',NULL,'read','2025-12-10 17:30:58','172.18.0.1','6939ad8961a73e970','6939ad8961a73e970','6939ae5102c82ae9e','6939ae510516ca1d4'),('6939ae5d31f1bec14',0,34,'CProduct',NULL,'read','2025-12-10 17:31:09','172.18.0.1','402','6939ad8961a73e970','6939ae5102c82ae9e','6939ae510516ca1d4'),('6939ae5d31f762939',0,35,'User',NULL,'read','2025-12-10 17:31:09','172.18.0.1','6939ad8961a73e970','6939ad8961a73e970','6939ae5102c82ae9e','6939ae510516ca1d4');
/*!40000 ALTER TABLE `action_history_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_country`
--

DROP TABLE IF EXISTS `address_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_country` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_preferred` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_NAME` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_country`
--

LOCK TABLES `address_country` WRITE;
/*!40000 ALTER TABLE `address_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_log_record`
--

DROP TABLE IF EXISTS `app_log_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_log_record` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `number` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `level` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` int DEFAULT NULL,
  `exception_class` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` int DEFAULT NULL,
  `request_method` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_resource_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_NUMBER` (`number`),
  KEY `IDX_LEVEL` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_log_record`
--

LOCK TABLES `app_log_record` WRITE;
/*!40000 ALTER TABLE `app_log_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_log_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_secret`
--

DROP TABLE IF EXISTS `app_secret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_secret` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `delete_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_NAME_DELETE_ID` (`name`,`delete_id`),
  KEY `IDX_NAME` (`name`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_secret`
--

LOCK TABLES `app_secret` WRITE;
/*!40000 ALTER TABLE `app_secret` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_secret` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `array_value`
--

DROP TABLE IF EXISTS `array_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `array_value` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ENTITY_TYPE_VALUE` (`entity_type`,`value`),
  KEY `IDX_ENTITY_VALUE` (`entity_type`,`entity_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`,`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `array_value`
--

LOCK TABLES `array_value` WRITE;
/*!40000 ALTER TABLE `array_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `array_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachment` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint DEFAULT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_being_uploaded` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `role` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_file_path` varchar(260) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `global` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_PARENT` (`parent_type`,`parent_id`),
  KEY `IDX_RELATED` (`related_id`,`related_type`),
  KEY `IDX_SOURCE` (`source_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
INSERT INTO `attachment` VALUES ('693129384a2156b3c','logopacific final.png',0,'image/png',73339,'companyLogo',0,'2025-12-11 00:12:11','2025-12-11 00:12:11','Attachment','EspoUploadDir',NULL,0,NULL,NULL,NULL,'Settings',NULL,'693128ca918233887');
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_log_record`
--

DROP TABLE IF EXISTS `auth_log_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_log_record` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_denied` tinyint(1) NOT NULL DEFAULT '0',
  `denial_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_time` double DEFAULT NULL,
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_method` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authentication_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `portal_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_IP_ADDRESS` (`ip_address`),
  KEY `IDX_IP_ADDRESS_REQUEST_TIME` (`ip_address`,`request_time`),
  KEY `IDX_REQUEST_TIME` (`request_time`),
  KEY `IDX_PORTAL_ID` (`portal_id`),
  KEY `IDX_USER_ID` (`user_id`),
  KEY `IDX_AUTH_TOKEN_ID` (`auth_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_log_record`
--

LOCK TABLES `auth_log_record` WRITE;
/*!40000 ALTER TABLE `auth_log_record` DISABLE KEYS */;
INSERT INTO `auth_log_record` VALUES ('6939a9dfeee9cdc55',0,'admin','172.18.0.1','2025-12-10 17:11:59',0,NULL,1765386719.9021,'http://localhost/api/v1/App/user','GET','Espo',NULL,'6939a9d3396c90d2b','6939a9dfec73d64b0'),('6939a9f41f631b778',0,'admin','172.18.0.1','2025-12-10 17:12:20',0,NULL,1765386740.0576,'http://localhost/api/v1/App/user','GET','Espo',NULL,'6939a9d3396c90d2b','6939a9f41d319132d'),('6939ab148bfbb51e8',0,'admin','172.18.0.1','2025-12-10 17:17:08',0,NULL,1765387028.5196,'http://localhost/api/v1/App/user','GET','Espo',NULL,'6939a9d3396c90d2b','6939ab148ba166990'),('6939adb31334c0a63',0,'pacific_admin','172.18.0.1','2025-12-10 17:28:19',0,NULL,1765387699.0203,'http://localhost/api/v1/App/user','GET','Espo',NULL,'6939ad4be9fe21431','6939adb311074d0fb'),('6939adf3103cea1eb',0,'pacific_telesale','172.18.0.1','2025-12-10 17:29:23',1,'CREDENTIALS',1765387763.0586,'http://localhost/api/v1/App/user','GET','Espo',NULL,NULL,NULL),('6939adf868500e7d2',0,'pacific_telesale','172.18.0.1','2025-12-10 17:29:28',1,'CREDENTIALS',1765387768.377,'http://localhost/api/v1/App/user','GET','Espo',NULL,NULL,NULL),('6939adfd1a4bed8c1',0,'admin','172.18.0.1','2025-12-10 17:29:33',0,NULL,1765387773.0476,'http://localhost/api/v1/App/user','GET','Espo',NULL,'6939a9d3396c90d2b','6939adfd1811486da'),('6939ae2d067efb043',0,'pacific_sale','172.18.0.1','2025-12-10 17:30:21',0,NULL,1765387820.9684,'http://localhost/api/v1/App/user','GET','Espo',NULL,'6939ad6c5ed8d27f9','6939ae2d045086109'),('6939ae510516ca1d4',0,'pacific_telesale','172.18.0.1','2025-12-10 17:30:57',0,NULL,1765387856.9626,'http://localhost/api/v1/App/user','GET','Espo',NULL,'6939ad8961a73e970','6939ae5102c82ae9e');
/*!40000 ALTER TABLE `auth_log_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_token`
--

DROP TABLE IF EXISTS `auth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_token` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `token` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hash` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `last_access` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `portal_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_TOKEN` (`token`,`deleted`),
  KEY `IDX_HASH` (`hash`),
  KEY `IDX_USER_ID` (`user_id`),
  KEY `IDX_PORTAL_ID` (`portal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_token`
--

LOCK TABLES `auth_token` WRITE;
/*!40000 ALTER TABLE `auth_token` DISABLE KEYS */;
INSERT INTO `auth_token` VALUES ('6939a9dfec73d64b0',0,'8e925e4d0608a952dbea7060dd91a3f5','$2y$10$sYSikz5aiGoJrKfULxFgeer2y6OkV2CZPkaCb8EZwXJa.BMvTv4oW','9c947be61791d6f1067e7f3910f8309f','172.18.0.1',1,'2025-12-10 17:12:00','2025-12-10 17:11:59','2025-12-10 17:12:00','6939a9d3396c90d2b',NULL),('6939a9f41d319132d',0,'051ba9ea16edb6aff9dd61a5c60af74b','$2y$10$sYSikz5aiGoJrKfULxFgeer2y6OkV2CZPkaCb8EZwXJa.BMvTv4oW','3b327a48724de605fa01db621bb1a878','172.18.0.1',1,'2025-12-10 17:12:21','2025-12-10 17:12:20','2025-12-10 17:12:21','6939a9d3396c90d2b',NULL),('6939ab148ba166990',0,'6a35937747fa9240b4d60970b390c5d8','$2y$10$sYSikz5aiGoJrKfULxFgeer2y6OkV2CZPkaCb8EZwXJa.BMvTv4oW','82f1328b0f94f534846f4487c04db66f','172.18.0.1',0,'2025-12-10 17:28:11','2025-12-10 17:17:08','2025-12-10 17:28:11','6939a9d3396c90d2b',NULL),('6939adb311074d0fb',0,'1a695e599c39517db772dd6a4f0f322b','$2y$10$0cNRxd8W7HO3VZ.WjcVHm.ruExw0vIMPMvqsluHReBCIMOsAENuAG','087ae07d1922693cac2fd860913d5f47','172.18.0.1',0,'2025-12-10 17:29:13','2025-12-10 17:28:19','2025-12-10 17:29:13','6939ad4be9fe21431',NULL),('6939adfd1811486da',0,'9e2fe5c1ee8acca6e9dfa31197967eae','$2y$10$sYSikz5aiGoJrKfULxFgeer2y6OkV2CZPkaCb8EZwXJa.BMvTv4oW','2c76d496e02735808c4b55222f6949da','172.18.0.1',0,'2025-12-10 17:30:12','2025-12-10 17:29:33','2025-12-10 17:30:12','6939a9d3396c90d2b',NULL),('6939ae2d045086109',0,'b0fd286d64be67d5787098936a93d686','$2y$10$UdZ8F8d0X6DZldub/cuL1O3yPonjNVvJwwJhy8Q0dcnQc6jKm.f8C','a890b0a13669a90a669c6cdbc23f865d','172.18.0.1',0,'2025-12-10 17:30:46','2025-12-10 17:30:21','2025-12-10 17:30:46','6939ad6c5ed8d27f9',NULL),('6939ae5102c82ae9e',0,'72aa657349a8cc3d4624a83c203514ef','$2y$10$9wL9Wn3N9/0SMJyyBGGjKeKNVRPXXjkFo0cKHChJxsX9yrt9Borrq','2f3596eae43bf3ea6a1a6ad5a6d6a793','172.18.0.1',0,'2025-12-10 17:31:19','2025-12-10 17:30:57','2025-12-10 17:31:19','6939ad8961a73e970',NULL);
/*!40000 ALTER TABLE `auth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_provider`
--

DROP TABLE IF EXISTS `authentication_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentication_provider` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oidc_client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oidc_client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oidc_authorization_endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oidc_user_info_endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oidc_token_endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oidc_jwks_endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oidc_jwt_signature_algorithm_list` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `oidc_scopes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `oidc_create_user` tinyint(1) NOT NULL DEFAULT '0',
  `oidc_username_claim` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'sub',
  `oidc_sync` tinyint(1) NOT NULL DEFAULT '0',
  `oidc_logout_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oidc_authorization_prompt` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_provider`
--

LOCK TABLES `authentication_provider` WRITE;
/*!40000 ALTER TABLE `authentication_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentication_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autofollow`
--

DROP TABLE IF EXISTS `autofollow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autofollow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) DEFAULT '0',
  `entity_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ENTITY_TYPE` (`entity_type`),
  KEY `IDX_USER` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autofollow`
--

LOCK TABLES `autofollow` WRITE;
/*!40000 ALTER TABLE `autofollow` DISABLE KEYS */;
/*!40000 ALTER TABLE `autofollow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_product`
--

DROP TABLE IF EXISTS `c_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_product` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `price` decimal(18,2) DEFAULT NULL,
  `area_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `handover` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `land_area` decimal(18,2) DEFAULT NULL,
  `construction_area` decimal(18,2) DEFAULT NULL,
  `borrow` decimal(18,2) DEFAULT NULL,
  `gifts` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bonus` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contract_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f1` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `land_fund` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_price` datetime DEFAULT NULL,
  `note` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_link` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tts` decimal(18,2) DEFAULT NULL,
  `tttd` decimal(18,2) DEFAULT NULL,
  `csbh` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ptg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refresh_time` datetime DEFAULT NULL,
  `price_currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `borrow_currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tts_currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tttd_currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stream_updated_at` datetime DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CREATED_AT_ID` (`created_at`,`id`),
  KEY `IDX_NAME` (`name`,`deleted`),
  KEY `IDX_ASSIGNED_USER` (`assigned_user_id`,`deleted`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_ASSIGNED_USER_ID` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_product`
--

LOCK TABLES `c_product` WRITE;
/*!40000 ALTER TABLE `c_product` DISABLE KEYS */;
INSERT INTO `c_product` VALUES ('1','CL15-04',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',23107442931.00,'Chà Là','Shophouse','Thô có thang','',112.50,415.90,21177.00,'Vinpearl + Vinmec \nVOS + Tân Gia','','','VBCN','TCB','','','2025-10-15 00:00:00','','Check admin','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',18613.00,20008.00,'18/11','https://bom.so/oiFBVs','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('10','KĐ8-141',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',24207699158.00,'KĐAS','Shophouse','Hoàn thiện\nchưa có khách thuê','',84.00,324.00,18558.00,'Vinpearl + Vinmec \nVOS + Tân Gia','','','VBCN','TCB','','','2025-10-15 00:00:00','','Quỹ ĐQ','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',16317.00,17536.00,'18/11','https://bom.so/XoJmhy','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('100','SH22-27',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',10570631094.00,'','Liền kề','Thô loại 1','',48.00,192.00,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('101','ĐD3-65',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',14743794552.00,'276 căn Leasing','Liền kề','Hoàn thiện','',56.00,231.30,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('102','SH22-21',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',10570631094.00,'','Liền kề','Thô loại 1','',48.00,192.00,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('103','ĐD1-49',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',14346693916.00,'276 căn Leasing','Hoàn thiện','276 căn Leasing','',0.00,56.00,0.00,'','','','','','Liền kề','Liền kề',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('104','SH22-89',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',12811901636.00,'276 căn Leasing','Liền kề','Hoàn thiện','',48.00,183.80,0.00,'','','','','','VBCN_PHÚ THỌ LAND_VPB','VBCN_PHÚ THỌ LAND_VPB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('105','AD6-12',0,NULL,'2025-12-04 11:06:10','2025-12-04 11:06:10',26294125450.00,'','Shophouse','Thô','',140.00,378.40,0.00,'','','','','','','',NULL,'','','DatViet','Đất Việt quỹ chung 3','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=822541017#gid=822541017',0.00,0.00,'','','2025-12-04 11:06:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('106','AD6-14',0,NULL,'2025-12-04 11:06:10','2025-12-04 11:06:10',26012071992.00,'','Shophouse','Thô','',140.00,378.40,0.00,'','','','','','','',NULL,'','','DatViet','Đất Việt quỹ chung 3','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=822541017#gid=822541017',0.00,0.00,'','','2025-12-04 11:06:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('107','PB-12',0,NULL,'2025-12-04 11:06:10','2025-12-04 11:06:10',32724702078.00,'','Shophouse','Thô','',140.00,378.40,0.00,'','','','','','','',NULL,'','','DatViet','Đất Việt quỹ chung 3','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=822541017#gid=822541017',0.00,0.00,'','','2025-12-04 11:06:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('108','PB-14',0,NULL,'2025-12-04 11:06:10','2025-12-04 11:06:10',32442607068.00,'','Shophouse','Thô','',140.00,378.40,0.00,'','','','','','','',NULL,'','','DatViet','Đất Việt quỹ chung 3','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=822541017#gid=822541017',0.00,0.00,'','','2025-12-04 11:06:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('109','PB2-149',0,NULL,'2025-12-04 11:06:10','2025-12-04 11:06:10',22997486337.00,'','Shophouse','Thô','',140.00,378.40,0.00,'','','','','','','',NULL,'','','DatViet','Đất Việt quỹ chung 3','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=822541017#gid=822541017',0.00,0.00,'','','2025-12-04 11:06:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('11','NT1-93',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',40724513732.00,'Ngọc Trai','SL','Thô không thang','',140.00,338.40,37329.00,'Vinpearl + Vinmec \nVOS + Tân Gia','','','VBCN','VTB','','','2025-10-15 00:00:00','','Đã Bán','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',32819.00,35274.00,'18/11','https://bom.so/1xXTkw','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('110','PB11-14',0,NULL,'2025-12-04 11:06:10','2025-12-04 11:06:10',24320133661.00,'','Liền kề','Hoàn thiện','',119.00,336.20,0.00,'','','','','','','',NULL,'','','DatViet','Đất Việt quỹ chung 3','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=822541017#gid=822541017',0.00,0.00,'','','2025-12-04 11:06:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('111','PB11-26',0,NULL,'2025-12-04 11:06:10','2025-12-04 11:06:10',26357458659.00,'','Liền kề','Hoàn thiện','',119.00,336.20,0.00,'','','','','','','',NULL,'','','DatViet','Đất Việt quỹ chung 3','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=822541017#gid=822541017',0.00,0.00,'','','2025-12-04 11:06:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('112','PB12-14',0,NULL,'2025-12-04 11:06:10','2025-12-04 11:06:10',24320133661.00,'','Liền kề','Hoàn thiện','',119.00,336.20,0.00,'','','','','','','',NULL,'','','DatViet','Đất Việt quỹ chung 3','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=822541017#gid=822541017',0.00,0.00,'','','2025-12-04 11:06:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('113','PB12-24',0,NULL,'2025-12-04 11:06:10','2025-12-04 11:06:10',24579499141.00,'','Liền kề','Hoàn thiện','',119.00,336.20,0.00,'','','','','','','',NULL,'','','DatViet','Đất Việt quỹ chung 3','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=822541017#gid=822541017',0.00,0.00,'','','2025-12-04 11:06:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('114','TĐ7-09',0,NULL,'2025-12-04 11:06:10','2025-12-04 11:06:10',16455868745.00,'','Liền kề','Hoàn thiện','',60.00,235.50,0.00,'','','','','','','',NULL,'','','DatViet','Đất Việt quỹ chung 3','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=822541017#gid=822541017',0.00,0.00,'','','2025-12-04 11:06:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('115','PĐ2.KT-24',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',15141703510.00,'Ktown','VBCN','','',90.00,276.40,0.00,'','','','','','ĐOX','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('116','PĐ.KT-51',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',28963017295.00,'Ktown','VBCN','','',129.00,435.60,0.00,'','','','','','ĐOX','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('117','PĐ5.KT-05',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',23938114154.00,'Ktown','VBCN','','',118.30,396.20,0.00,'','','','','','ĐOX','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('118','PĐ6.KT-02',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',48628484424.00,'Ktown','VBCN','','',209.40,520.90,0.00,'','','','','','ĐOX','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('119','SH1.KT-22',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',26215954718.00,'Ktown','VBCN','','',129.00,363.60,0.00,'','','','','','ĐOX','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('12','SH22-51',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',11479676916.00,'San Hô','Liền kề','Thô loại 1','',48.00,192.00,9734.00,'Vinpearl + Vinmec\nVOS + ACBB + Quà tặng Vinfast','','','HĐMB','TCB','','','2025-11-11 00:00:00','','Đã Bán','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',8528.00,9195.00,'18/11','https://bom.so/yKQjPc','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('120','PĐ.KT-37',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',29512060264.00,'Ktown','VBCN','','',123.00,471.60,0.00,'','','','','','ĐOX','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('121','PB19.TV-07',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',14827999312.00,'Venice','HĐMB','','',78.00,234.80,0.00,'','','','','','Phát Đạt','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('122','PT1.TV-54',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',20944428377.00,'Venice','VBCN','','',102.00,236.60,0.00,'','','','','','Điền Thịnh-TCB','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('123','PT2.TV-18',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',36403856594.00,'Venice','VBCN','','',157.30,472.70,0.00,'','','','','','Điền Thịnh-VPB','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('124','PT2.TV-181',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',28706108651.00,'Venice','VBCN','','',132.00,491.50,0.00,'','','','','','Điền Thịnh-TCB','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('125','PB19.TV-135',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',18342097462.00,'Venice','VBCN','','',96.00,236.60,0.00,'','','','','','Điền Thịnh-VPB','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('126','PB19.TV-83',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',28955773220.00,'Venice','VBCN','','',151.80,325.60,0.00,'','','','','','Điền Thịnh-VPB','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('127','ĐD1.SP21-02',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',13849074970.00,'Center Point','HĐMB','','',85.00,280.40,0.00,'','','','','','VHM','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('128','ĐLNT.SP21-11',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',17664669225.00,'Center Point','HĐMB','','',95.00,258.60,0.00,'','','','','','VHM','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('129','ĐĐD.SP14-13',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',18890361043.00,'Center Point','VBCN','','',102.50,259.40,0.00,'','','','','','SSM','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('13','HA6-38',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',26138071918.00,'Hải Âu','Biệt thự song lập','Thô có thang','',150.00,314.90,0.00,'','','','VBCN','','','','2024-05-23 00:00:00','','Đã Bán','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',0.00,0.00,'22/05/2024','','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('130','ĐLNT.SP14-03',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',17224358192.00,'Center Point','VBCN','','',95.00,255.40,0.00,'','','','','','SSM','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('131','NT1B.SP14-05',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',12364121033.00,'Center Point','VBCN','','',80.00,255.40,0.00,'','','','','','SSM','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('132','NT1B.SP14-07',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',12355376739.00,'Center Point','VBCN','','',80.00,259.40,0.00,'','','','','','SSM','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('133','NT1B.SP14-11',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',12364121033.00,'Center Point','VBCN','','',80.00,255.40,0.00,'','','','','','SSM','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('134','NT1B.SP14-13',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',12270823562.00,'Center Point','VBCN','','',80.00,259.40,0.00,'','','','','','SSM','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('135','NT1B.SP14-10',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',12294052458.00,'Center Point','VBCN','','',85.00,259.40,0.00,'','','','','','SSM','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('136','NT1B.SP14-12',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',12171087214.00,'Center Point','VBCN','','',85.00,255.40,0.00,'','','','','','SSM','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('137','NT1B.SP14-14',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',12034536009.00,'Center Point','VBCN','','',85.00,255.40,0.00,'','','','','','SSM','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('138','NT1B.SP14-16',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',12168945144.00,'Center Point','VBCN','','',85.00,259.40,0.00,'','','','','','SSM','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('139','NT1B.SP14-52',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',13517194362.00,'Center Point','VBCN','','',85.00,255.40,0.00,'','','','','','SSM','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('14','ĐD2-168',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',27126605633.00,'Đảo Dừa','Liền kề','Thô không thang','',136.75,501.70,0.00,'','','','VBCN','','','','2024-04-14 00:00:00','','Đã Bán','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',0.00,0.00,'03/04/2024','','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('140','SH8A.SP9-26',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',20641787382.00,'Little HongKong','VBCN','','',102.50,315.30,0.00,'','','','','','ĐOX','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('141','SH8A.SP9-50',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',21777588475.00,'Little HongKong','VBCN','','',102.50,315.30,0.00,'','','','','','Cá nhân','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('142','SH8B.SP9-56',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',20968143348.00,'Little HongKong','VBCN','','',102.50,317.90,0.00,'','','','','','ĐOX','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('143','SH12.SP9-05',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',23457902283.00,'Little HongKong','VBCN','','',117.50,317.90,0.00,'','','','','','ĐOX','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('144','SH12.SP9-28',0,NULL,'2025-12-04 11:06:14','2025-12-04 11:06:14',24434414150.00,'Little HongKong','VBCN','','',117.50,317.90,0.00,'','','','','','ĐOX','',NULL,'','','DatViet','Đất Việt - TMDV','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=1216979207#gid=1216979207',0.00,0.00,'','','2025-12-04 11:06:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('145','ĐLSH-29',0,NULL,'2025-12-04 11:06:22','2025-12-04 11:06:22',35511000000.00,'SAN HÔ','Shophouse','Thô','',120.00,0.00,29476.00,'Quà tặng đồng hành + CK 20,5%','','','','','MTR','',NULL,'','','HomePlug','HomePlus MTR','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=1743784186#gid=1743784186',26626.00,0.00,'15/09/2025','https://drive.google.com/drive/folders/1xNkbSjjDAzgCrBLPvLXN5cO6oEn5VaGH?usp=drive_link','2025-12-04 11:06:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('146','ĐLSH-31',0,NULL,'2025-12-04 11:06:22','2025-12-04 11:06:22',35511000000.00,'SAN HÔ','Shophouse','Thô','',120.00,0.00,29476.00,'Quà tặng đồng hành + CK 20,5%','','','','','MTR','',NULL,'','','HomePlug','HomePlus MTR','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=1743784186#gid=1743784186',26626.00,0.00,'15/09/2025','https://drive.google.com/drive/folders/10oG6M3FOoQMvBJSZ94XLuuYyc1wt9TV-?usp=drive_link','2025-12-04 11:06:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('147','NT2-74',0,NULL,'2025-12-04 11:06:22','2025-12-04 11:06:22',38927000000.00,'NGỌC TRAI','Song lập','Tự xây','',140.71,0.00,32574.00,'Quà tặng đồng hành + CK 20,5%','','','','','MTR','',NULL,'','','HomePlug','HomePlus MTR','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=1743784186#gid=1743784186',29074.00,0.00,'21/11/2025','https://drive.google.com/drive/folders/12YhCw8lDsz82JUDQHeDpZ6vHrcch8Z4t?usp=drive_link','2025-12-04 11:06:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('148','NT2-75',0,NULL,'2025-12-04 11:06:22','2025-12-04 11:06:22',39123000000.00,'NGỌC TRAI','Song lập','Tự xây','',140.23,0.00,32751.00,'Quà tặng đồng hành + CK 20,5%','','','','','MTR','',NULL,'','','HomePlug','HomePlus MTR','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=1743784186#gid=1743784186',29231.00,0.00,'21/11/2025','https://drive.google.com/drive/folders/141C-KEAQ-TqeYOHSyLNzdDUtl7VpAONR?usp=drive_link','2025-12-04 11:06:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('149','KĐ-89',0,NULL,'2025-12-04 11:06:22','2025-12-04 11:06:22',33141000000.00,'KĐAS','Song lập','Thô','',150.00,0.00,27334.00,'Quà tặng đồng hành + CK 20,5%','','','','','MTR','',NULL,'','','HomePlug','HomePlus MTR','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=1743784186#gid=1743784186',24708.00,0.00,'15/09/2025','https://drive.google.com/drive/folders/1cpbjIvvgSvja8lNWIjGqrN2nrCEm4xdu?usp=drive_link','2025-12-04 11:06:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('15','SH20-63',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',27885847595.00,'San Hô','Liền kề','Thô có thang','',118.00,439.10,0.00,'','','','HĐMB','','','','2024-09-03 00:00:00','','Đã Bán','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',0.00,0.00,'','','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('150','KĐ-73',0,NULL,'2025-12-04 11:06:22','2025-12-04 11:06:22',35405000000.00,'KĐAS','Song lập','Thô','',150.00,0.00,29381.00,'Quà tặng đồng hành + CK 20,5%','','','','','MTR','',NULL,'','','HomePlug','HomePlus MTR','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=1743784186#gid=1743784186',26541.00,0.00,'15/09/2025','https://drive.google.com/drive/folders/1AY4iSw8apNr3r8GqpdH9mGyc7iLc9LBs?usp=drive_link','2025-12-04 11:06:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('151','ĐĐD-44',0,NULL,'2025-12-04 11:06:22','2025-12-04 11:06:22',21815000000.00,'SAN HÔ','Liền kề','Thô','',80.00,0.00,18145.00,'Quà tặng đồng hành + CK 20,5%','','','','','MTR','',NULL,'','','HomePlug','HomePlus MTR','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=1743784186#gid=1743784186',16387.00,0.00,'15/09/2025','https://drive.google.com/drive/folders/1xKVyvAW38qFDgAd664DwtxaoJALJ53LS?usp=drive_link','2025-12-04 11:06:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('152','ĐĐD-74',0,NULL,'2025-12-04 11:06:22','2025-12-04 11:06:22',21993000000.00,'SAN HÔ','Liền kề','Thô','',80.00,0.00,18305.00,'Quà tặng đồng hành + CK 20,5%','','','','','MTR','',NULL,'','','HomePlug','HomePlus MTR','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=1743784186#gid=1743784186',16530.00,0.00,'15/09/2025','https://drive.google.com/drive/folders/1tnjafEBfMhgj5ibwp_nfZeLADhEbidoJ?usp=drive_link','2025-12-04 11:06:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('153','NT1-04',0,NULL,'2025-12-04 11:06:22','2025-12-04 11:06:22',47180000000.00,'NGỌC TRAI','Song lập','Tự xây','',160.00,0.00,39299.00,'Quà tặng đồng hành + CK 20,5%','','','','','MTR','',NULL,'','','HomePlug','HomePlus MTR','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=1743784186#gid=1743784186',35539.00,0.00,'15/09/2025','https://drive.google.com/drive/folders/1S6GZweYXmokcY9oN7X0171fG-lQy9RiZ?usp=drive_link','2025-12-04 11:06:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('154','NT1-05',0,NULL,'2025-12-04 11:06:22','2025-12-04 11:06:22',47180000000.00,'NGỌC TRAI','Song lập','Tự xây','',160.00,0.00,39299.00,'Quà tặng đồng hành + CK 20,5%','','','','','MTR','',NULL,'','','HomePlug','HomePlus MTR','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=1743784186#gid=1743784186',35539.00,0.00,'15/09/2025','https://drive.google.com/drive/folders/1zM5X7wXgAv64Z0aaoR0mku_VSDLgbWjz?usp=drive_link','2025-12-04 11:06:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('155','KĐ5-90',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',19045900348.00,'KĐAS','Shophouse','Thô có thang','',84.00,316.60,17455.00,'','','','NGỌC QUÝ_VPB','','','',NULL,'VC vinpearl 205tr','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',15343.00,16492.00,'18/11','https://drive.google.com/drive/folders/1F2hSLtph0TVe2KqDozHo0e-CyNidIeOX?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('156','KĐ6-07',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',31529593972.00,'KĐAS','Biệt thự song lập - Shop','Thô không thang','',150.00,355.90,28897.00,'','','','ĐÔ THỊ XANH_BIDV','','','',NULL,'VC vinpearl 205tr','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',25401.00,27302.00,'18/11','https://drive.google.com/drive/folders/1xR26XSosES5U9TnnOV0EiepVsK6ox-KJ?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('157','KĐ7-44',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',28621706425.00,'KĐAS','Biệt thự song lập - Shop','Thô không thang','',150.00,355.90,26230.00,'','','','NGỌC QUÝ_VPB','','','',NULL,'VC vinpearl 205tr','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',23054.00,24781.00,'18/11','https://drive.google.com/drive/folders/1raAXxVzDdgfy6ZqLjDdXUceV-ovxGmrk?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('158','KĐ-53',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',30387258596.00,'KĐAS','Biệt thự song lập - Shop','Thô không thang','',150.00,355.90,27850.00,'','','','VBCN_ĐÔ THỊ XANH_TCB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',24482.00,26314.00,'18/11','https://drive.google.com/drive/folders/13hzWRwueAF_ewoi0q0UgjLZGpQgSHshj?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('159','SB-03',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',25397508851.00,'SAO BIỂN','Shophouse','Thô có thang','',109.00,410.00,23278.00,'','','','VBCN_NEWLAND_VCB','','','',NULL,'VC vinpearl 205tr','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',20463.00,21994.00,'18/11','https://drive.google.com/drive/folders/16lkFLq2E2vzPHg2oPHc_aKvyBEXCdTdV?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('16','SH6-65',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',29380077147.00,'San Hô','Liền kề','Thô có thang','',131.50,486.50,0.00,'','','','HĐMB','','','','2024-05-27 00:00:00','','Đã Bán','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',0.00,0.00,'22/05/2024','','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('160','SB-05',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',24726639932.00,'SAO BIỂN','Shophouse','Thô có thang','',109.00,398.70,22664.00,'','','','VBCN_NEWLAND_VCB','','','',NULL,'VC vinpearl 205tr','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',19924.00,21415.00,'18/11','https://drive.google.com/drive/folders/1G3yA9kilvf24fCWUvJfP4T7w7RHqzmqd','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('161','SB-15',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',23496761588.00,'SAO BIỂN','Shophouse','Thô có thang','',109.00,410.00,21536.00,'','','','VBCN_NGỌC QUÝ_VPB','','','',NULL,'VC vinpearl 205tr','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',18932.00,20348.00,'18/11','https://drive.google.com/drive/folders/1FiSgLGz47x8aualwaGrMSySuW0O39wqS?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('162','SB-297',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',21009056505.00,'SAO BIỂN','Shophouse','Thô có thang','',91.00,363.00,19256.00,'','','','VBCN_NGỌC QUÝ_VPB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',16929.00,18195.00,'18/11','https://drive.google.com/drive/folders/1OeS7MIlqvOaJo_TbIrSnqE0gM1SNX7Ub?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('163','SB-299',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',21319997574.00,'SAO BIỂN','Shophouse','Thô có thang','',91.00,361.00,19542.00,'','','','VBCN_NGỌC QUÝ_VPB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',17180.00,18465.00,'18/11','https://drive.google.com/drive/folders/1q2zujbPZovd0hlJbKA3jnz1teoCTL5-R?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('164','SB-301',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',21472377910.00,'SAO BIỂN','Shophouse','Thô có thang','',91.00,358.00,19681.00,'','','','VBCN_NGỌC QUÝ_VPB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',17303.00,18597.00,'18/11','https://drive.google.com/drive/folders/1ogyZV-CR8cgnBHMC4GyThmEGng3SrSAa?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('165','SB-267',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',20916182762.00,'SAO BIỂN','Shophouse','Thô có thang','',91.00,361.00,19171.00,'','','','VBCN_NGỌC QUÝ_VPB','','','',NULL,'VC vinpearl 205tr','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',16854.00,18115.00,'18/11','https://drive.google.com/drive/folders/1Dn4kHJ7w840NSF6cu-3ybtsEBUGqWvAn?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('166','SH7-50',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',21481588836.00,'SAN HÔ','Liền kề','Thô có thang','',96.00,391.60,18757.00,'','','','HĐMB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',16482.00,17717.00,'18/11','https://drive.google.com/drive/folders/1-C-JsTHE7KhrzszPwyiXCR8AFNmrrCxZ?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('167','SH7-52',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',21822866909.00,'SAN HÔ','Liền kề','Thô có thang','',96.00,391.60,0.00,'','','','HĐMB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'18/11','https://drive.google.com/drive/folders/1N2PzdgceidmIZyxXjyRiV8THHWtSNZf2?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('168','SH9-39',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',26013544877.00,'SAN HÔ','Beach Villas','Thô có thang','',144.00,398.00,22724.00,'','','','VBCN_AN HƯNG_TCB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',19971.00,21469.00,'18/11','https://drive.google.com/drive/folders/1qsWMFJPSvmavdCEtGRzfq_SIYB-3N6Ub?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('169','CL15-05',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',22695500432.00,'CHÀ LÀ','Shophouse','Thô có thang','',113.00,416.00,20799.00,'','','','VBCN_ĐÔ THỊ XANH_TCB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',18281.00,19651.00,'18/11','https://drive.google.com/drive/folders/1giFvoP1au-TiZSYbcSwG79ngOStfUZyl?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('17','SH4-79',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',31795565101.00,'San Hô','Shophouse','Thô có thang','',144.00,382.30,0.00,'','','','VBCN','','','','2024-08-29 00:00:00','','Đã Bán','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',0.00,0.00,'','','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('170','KĐ5-131',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',23706919821.00,'KINH ĐÔ','Shophouse','Hoàn thiện','',84.00,317.00,19160.00,'','','','VBCN_AN HƯNG_TCB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',16839.00,18105.00,'18/11','https://drive.google.com/drive/folders/1yclLYSkHfd2FqFmVhocUXcIzpnBvQykV?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('171','KĐ5-71',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',24544418952.00,'KINH ĐÔ','Shophouse','Hoàn thiện','',84.00,317.00,19838.00,'','','','VBCN_AN HƯNG_TCB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',17435.00,18746.00,'18/11','https://drive.google.com/drive/folders/1dUs1YRgtNXoUfA8Kt0spu5odFfbqEyLL?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('172','SH12-23',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',26404853623.00,'SAN HÔ','Beach Villas','Thô có thang','',144.00,398.00,0.00,'','','','VBCN_AN HƯNG_TCB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'','https://drive.google.com/drive/folders/16rQJ_Xq-2D07kpefsur7Db-3J7Uv-91v?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('173','KĐ6-8X',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',44655164080.00,'KĐAS','BT Song lập','Thô','',153.00,351.10,0.00,'','','','CUỘC SỐNG MỚI_TCB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('174','NT3-42',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',50146660676.00,'NGỌC TRAI','BT Song lập','Hoàn thiện 2 tầng ','',140.00,338.40,0.00,'','','','CUỘC SỐNG MỚI_TCB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'','https://drive.google.com/drive/folders/1DE-dnwf4gbNeedbKyqBzv4TMr1QRTVaG?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('175','SH20-18',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',13588727435.00,'San Hô','Liền kề','Hoàn thiện','',48.00,183.80,0.00,'','','','VBCN_AN HƯNG_TCB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('176','SH22-27',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11610511504.00,'San Hô','Liền kề','Thô loại 1','',48.00,192.00,0.00,'','','','HĐMB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('177','ĐD3-65',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',16210184483.00,'Đảo Dừa','Liền kề','Hoàn thiện','',56.00,231.30,0.00,'','','','HĐMB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('178','SH22-21',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11610511504.00,'San Hô','Liền kề','Thô loại 1','',48.00,192.00,0.00,'','','','HĐMB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('179','ĐD1-49',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',14346693916.00,'Đảo Dừa','Liền kề','Hoàn thiện','',56.00,238.30,0.00,'','','','VBCN_AN HƯNG_TCB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('18','ĐD5-02',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',34003826234.00,'Đảo Dừa','Biệt thự đơn lập','Thô có thang','',221.80,294.50,0.00,'','','','HĐMB','','','','2024-04-09 00:00:00','','Đã Bán','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',0.00,0.00,'03/04/2024','','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('180','SH22-89',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',14071801761.00,'San Hô','Liền kề','Hoàn thiện','',48.00,183.80,0.00,'','','','VBCN_PHÚ THỌ LAND_VPB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('181','KĐ-210',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',22181292167.00,'KĐAS','Shophouse','Thô','',105.00,312.40,21230.00,'','','','ĐÔ THỊ XANH_BIDV','','','',NULL,'VC vinpearl 205tr + Miễn PDV 10 năm','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',18661.00,20059.00,'18/09','https://drive.google.com/drive/folders/1_sHj4ufVx-Iy4-C-2Ay4F-klnc68crhX?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('182','KĐ7-12',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',29183359798.00,'KĐAS','Biệt thự song lập - Shop','Thô không thang','',150.00,355.90,27931.00,'','','','UTĐT','','','',NULL,'VC vinpearl 205tr + Miễn PDV 10 năm','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',24548.00,26389.00,'18/09','https://drive.google.com/drive/folders/1aQc362Z42XnH7U3GNjZ808xUdlbdOH1f?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('183','KĐ7-30',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',29301124371.00,'KĐAS','Biệt thự song lập - Shop','Thô không thang','',150.00,355.90,28044.00,'','','','UTĐT','','','',NULL,'VC vinpearl 205tr + VC Vinmec 100tr+ Miễn PDV 10 năm','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',24646.00,26495.00,'18/09','https://drive.google.com/drive/folders/1UFssOkC9nlkvb76wz6FAg8ubRYEEO8jO?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('184','SH10-41',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',22145345533.00,'SAN HÔ','Beach Villas','Thô có thang','',128.00,342.00,20358.00,'','','','HĐMB','','','',NULL,'VC vinpearl 205tr + Miễn PDV 10 năm','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',17697.00,19228.00,'18/09','https://drive.google.com/drive/folders/1Q5qGQCb1PUxo9yeLEkT7hfnMn8KYKUqk?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('185','KĐ-35',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',31988435130.00,'KĐAS','Biệt thự song lập - Shop','Thô không thang','',150.00,355.90,30618.00,'','','','ĐÔ THỊ XANH_TCB','','','',NULL,'VC vinpearl 205tr + VC Vinmec 100tr+ Miễn PDV 10 năm+ HV Ngựa 50tr','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',26912.00,28929.00,'18/09','https://drive.google.com/drive/folders/1S5sGzhq6omaiksLlAhbaVd7l8vuc_T5k?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('186','SH10-49',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',18556980099.00,'San Hô','Liền kề','Thô có thang','',96.00,342.20,16924.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',14832.00,15985.00,'20/08','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('187','SH20-27',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',18537581089.00,'SAN HÔ','Liền kề','Thô có thang','',98.00,286.00,16905.00,'','','','HĐMB','','','',NULL,'VC vinpearl 205tr + VC Vinmec 100tr+ Miễn PDV 10 năm+ HV Ngựa 50tr','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',14816.00,15967.00,'18/09','https://drive.google.com/drive/folders/1RMe0BKN-BoUrljO5wg7qonBoDwMmrCUx?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('188','SH7-32',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',20861082119.00,'SAN HÔ','Liền kề','Thô có thang','',96.00,391.60,19180.00,'','','','HĐMB','','','',NULL,'VC vinpearl 205tr + VC Vinmec 100tr+ Miễn PDV 10 năm+ HV Ngựa 50tr','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',16813.00,18118.00,'18/09','https://drive.google.com/drive/folders/1s613n1VoE3h1OEodJBFCNZlAAquHl0S6?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('189','SH7-26',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',30406454754.00,'SAN HÔ','Beach Villas','Thô có thang','',144.00,437.00,27742.00,'','','','VBCN_ĐÔ THỊ XANH_BIDV','','','',NULL,'VC vinpearl 205tr + Miễn PDV 10 năm','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',24384.00,26211.00,'18/09','https://drive.google.com/drive/folders/1_3PlJIh2eGO0hQu-nE82gDef6xg2njpT?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('19','HA6-36',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',37217706455.00,'Hải Âu','Biệt thự song lập','Thô có thang','',197.50,380.90,0.00,'','','','VBCN','','','','2024-05-23 00:00:00','','Đã Bán','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',0.00,0.00,'22/05/2024','','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('190','SH14-27',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',18537581089.00,'SAN HÔ','Beach Villas','Thô có thang','',98.00,285.80,16905.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',14834.00,15967.00,'20/08','https://drive.google.com/drive/folders/1NlkZ2zMZ32UNd8fKCzZFH-9DR-dNDQqG?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('191','SH20-76',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11245155618.00,'SAN HÔ','Liền kề','Thô loại 1','',48.00,183.80,9954.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',8747.00,9402.00,'20/08','https://drive.google.com/drive/folders/15R0BdUsCY-JhYy1-txP39t5sIdW1CGLY?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('192','SB-295',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',20994704327.00,'SAO BIỂN','Shophouse','Thô có thang','',91.00,361.00,20258.00,'','','','VBCN_NGỌC QUÝ_VPB','','','',NULL,'VC vinpearl 205tr ','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',17809.00,19142.00,'11/10','https://drive.google.com/drive/folders/1_11oM5hGeI1d87_W3moWj2nRcxHLj0Qf?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('193','SB-219',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',23456257117.00,'SAO BIỂN','Shophouse','Thô có thang','',109.00,410.00,24733.00,'','','','VBCN_ĐOX _TCB (THỨ CẤP)','','','',NULL,'VC vinpearl 205tr + Miễn PDV 10 năm','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',21741.00,23369.00,'11/10','https://drive.google.com/drive/folders/1OfMcvKcA9-tRXgCN_kNsDZKUiIyZEU-B?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('194','SH19-30',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',22882111193.00,'SAN HÔ','Beach Villas','Thô có thang','',112.00,331.00,20868.00,'','','','HĐMB','','','',NULL,'VC vinpearl 205tr + VC Vinmec 100tr+ Miễn PDV 10 năm+ HV Ngựa 50tr','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',18337.00,19712.00,'20/08','https://drive.google.com/drive/folders/1k371GDEwzBBhp7asFjPWfED_janrowm_?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('195','SH22-27',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11609515503.00,'SAN HÔ','Liền kề','Thô loại 1','',48.00,192.00,10286.00,'','','','HĐMB','','','',NULL,'VC vinpearl 205tr + VC Vinmec 100tr+ Miễn PDV 10 năm+ HV Ngựa 50tr','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',9040.00,9717.00,'18/09','https://drive.google.com/drive/folders/1LbLVKN-j79wQgvdO7gy4KFbscSZO6Grd?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('196','SH22-07',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11726273465.00,'SAN HÔ','Liền kề','Thô loại 1','',48.00,184.00,10399.00,'','','','AN HƯNG-TCB','','','',NULL,'VC vinpearl 205tr + VC Vinmec 100tr+ Miễn PDV 10 năm+ HV Ngựa 50tr','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',9142.00,9826.00,'18/09','https://drive.google.com/drive/folders/15VR6y_X7cq0eF0HF0EeFOKobvWSqpqPj?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('197','SH22-77',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11803500239.00,'SAN HÔ','Liền kề','Thô loại 1','',48.00,184.00,19463.00,'','','','HĐMB','','','',NULL,'VC vinpearl 205tr + VC Vinmec 100tr+ Miễn PDV 10 năm+ HV Ngựa 50tr','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',9195.00,9884.00,'18/09','https://drive.google.com/drive/folders/1ZSDnCSEvz3cxxvuQycdkEFZmvxMaiOxB?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('198','SH7-41',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',25577356771.00,'SAN HÔ','Shophouse','Thô có thang','',120.00,363.00,23327.00,'','','','HĐMB','','','',NULL,'VC vinpearl 205tr + VC Vinmec 100tr+ Miễn PDV 10 năm+ HV Ngựa 50tr','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',20498.00,22034.00,'20/08','https://drive.google.com/drive/folders/1QFHVPYTIWyERYqIvBjcK1LnSdfJd9Rif?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('199','SH20-29',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',18537581089.00,'SAN HÔ','Liền kề','Thô có thang','',98.00,286.00,16905.00,'','','','HĐMB','','','',NULL,'VC vinpearl 205tr + VC Vinmec 100tr+ Miễn PDV 10 năm+ HV Ngựa 50tr','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',14853.00,15967.00,'20/08','https://drive.google.com/drive/folders/1T_vpsPX7ZtePOeXGRhZqWyTfzKyG0gk6?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2','CL15-16',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',22471363440.00,'Chà Là','Shophouse','Thô có thang','',112.50,415.90,20593.00,'Vinpearl + Vinmec \nVOS + Tân Gia','','','VBCN','TCB','','','2025-10-15 00:00:00','','Check admin','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',18098.00,19456.00,'18/11','https://bom.so/KrcnYr','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('20','ĐD3-02',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',37658404342.00,'Đảo Dừa','Biệt thự đơn lập','Thô không thang','',240.40,363.90,0.00,'','','','HĐMB','','','','2024-04-09 00:00:00','','Đã Bán','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',0.00,0.00,'03/04/2024','','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('200','SH4-10',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',29323925171.00,'San Hô','Shophouse','Thô có thang','',136.00,357.60,26745.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',23443.00,25263.00,'20/08','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('201','SH9-03',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',19876476856.00,'San Hô','Liền kề','Thô có thang','',96.00,342.20,18128.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',15889.00,17123.00,'20/08','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('202','SH11-03',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',19876476856.00,'San Hô','Liền kề','Thô có thang','',96.00,342.20,18128.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',15889.00,17123.00,'20/08','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('203','SH12-03',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',20177969628.00,'San Hô','Liền kề','Thô có thang','',96.00,342.20,18403.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',16130.00,17383.00,'20/08','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('204','SH20-49',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',18470079686.00,'San Hô','Liền kề','Thô có thang','',98.00,285.70,16844.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',14762.00,15910.00,'20/08','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('205','SH22-59',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',15390407516.00,'San Hô','Liền kề','Thô loại 1','',72.00,192.20,14042.00,'','','','VBCN_AN HƯNG_VCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',12342.00,13267.00,'20/08','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('206','SH22-11',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',15411160168.00,'San Hô','Liền kề','Thô loại 1','',72.00,192.70,14062.00,'','','','VBCN_AN HƯNG_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',12361.00,13286.00,'20/08','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('207','SH20-10',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11330207459.00,'San Hô','Liền kề','Thô loại 1','',48.00,192.00,10032.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',8793.00,9476.00,'20/08','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('208','SH20-22',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11341192356.00,'San Hô','Liền kề','Thô loại 1','',48.00,192.00,10042.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',8802.00,9486.00,'20/08','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('209','SH20-08',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11362018850.00,'San Hô','Liền kề','Thô loại 1','',48.00,184.00,10061.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',8819.00,9504.00,'20/08','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('21','ĐD6-02',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',37838271144.00,'Đảo Dừa','Biệt thự đơn lập','Thô không thang','',248.60,363.90,0.00,'','','','HĐMB','','','','2024-04-09 00:00:00','','Đã Bán','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',0.00,0.00,'03/04/2024','','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('210','SH22-39',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11364637104.00,'San Hô','Liền kề','Thô loại 1','',48.00,184.00,10063.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',8821.00,9506.00,'20/08','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('211','SH22-41',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11364637104.00,'San Hô','Liền kề','Thô loại 1','',48.00,184.00,10063.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',8821.00,9506.00,'20/08','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('212','SH7-18',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',0.00,'San Hô','Shophouse','Thô có thang','',96.00,391.60,19181.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',16804.00,18118.00,'24/07/25','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('213','SH9-05',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',18826.00,'San Hô','Liền kề','Thô có thang','',96.00,342.20,17309.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',15163.00,16349.00,'24/07/25','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('214','SH20-03',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',15838611793.00,'San Hô','Liền kề','Thô có thang','',70.00,275.80,14563.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',12759.00,13757.00,'24/07/25','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('215','SH15-49',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',16730.00,'San Hô','Liền kề','Thô có thang','',91.00,263.20,15381.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',13473.00,14527.00,'24/07/25','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('216','SH7-12',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',20861082119.00,'SAN HÔ','Shophouse','Thô có thang','',96.00,391.60,19180.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',16813.00,18118.00,'03/07','https://drive.google.com/drive/folders/1mxSXwDAiFYBq9C_IeF7sWrAd6gBGkUxK?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('217','SH7-14',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',20652391777.00,'SAN HÔ','Shophouse','Thô có thang','',96.00,391.60,18988.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',16645.00,17936.00,'03/07','https://drive.google.com/drive/folders/1W3lma0ykeM5IXoWkxNmssek9sHIuCT6X?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('218','SH22-52',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',12328716097.00,'SAN HÔ','Liền kề','Thô có thang','',63.00,258.70,11335.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',9935.00,10706.00,'03/07','https://drive.google.com/drive/folders/1EOqHzh79kbf-3Oon9UwDoB0OYKSUVkpN?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('219','SH16-55',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',14459139993.00,'SAN HÔ','Liền kề','Thô có thang','',70.00,285.00,13298.00,'','','','ĐÔ THỊ XANH_BIDV','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',11688.00,12564.00,'03/07','https://drive.google.com/drive/folders/1SojX3L-LW7_E6RzYmwZF1tF8s6QREf0c?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('22','ĐD1-01',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',38025837710.00,'Đảo Dừa','Biệt thự đơn lập','Thô không thang','',259.70,363.90,0.00,'','','','HĐMB','','','','2024-04-14 00:00:00','','Đã Bán','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',0.00,0.00,'03/04/2024','','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('220','SH7-06',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',21869497931.00,'San Hô','Shophouse','Thô có thang','',96.00,391.60,20108.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',17627.00,18995.00,'03/07','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('221','SH16-49',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',18270228594.00,'San Hô','Liền kề','Thô có thang','',98.00,285.70,16797.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',14721.00,15865.00,'03/07','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('222','SH21-41',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11351943526.00,'San Hô','Liền kề','Thô có thang','',56.00,220.40,10437.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',9148.00,9858.00,'03/07','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('223','SH21-39',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11351943526.00,'San Hô','Liền kề','Thô có thang','',56.00,220.40,10437.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',9148.00,9858.00,'03/07','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('224','SH11-04',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',14999475304.00,'San Hô','Liền kề','Thô có thang','',70.00,275.80,13791.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',12088.00,13027.00,'03/07','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('225','SH21-10',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11218832940.00,'San Hô','Liền kề','','',56.00,228.50,0.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'03/07','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('226','SH22-04',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',12924994074.00,'San Hô','Liền kề','Thô có thang','',63.00,249.00,0.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'3/7','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('227','SH20-62',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',14872407503.00,'San Hô','Liền kề','Thô loại 1','',72.00,192.70,0.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'3/7','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('228','CL15-21',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',22494582842.00,'CHÀ LÀ','Shophouse','Thô có thang','',112.50,415.90,21701.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',19044.00,20498.00,'03/07','https://drive.google.com/drive/folders/1MHxoepB89y4eAVtTEFD3pzF9abYtEy6L?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('229','SH12-05',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',19394123284.00,'San Hô','Liền kề','Thô có thang','',96.00,342.20,17831.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',15621.00,16843.00,'24/07/25','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('23','ĐD8-51',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',39393741987.00,'Đảo Dừa','Biệt thự song lập','Thô không thang','',180.00,404.60,0.00,'','','','HĐMB','','','','2024-04-14 00:00:00','','Đã Bán','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',0.00,0.00,'03/04/2024','','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('230','CL15-16',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',22469550965.00,'CHÀ LÀ','Shophouse','Thô có thang','',112.50,415.90,21680.00,'','','','UTĐT','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',19053.00,20482.00,'03/07','https://drive.google.com/drive/folders/1piZPjzIYn78ktXYju8iB8oEhyn7QCoL6?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('231','SH11-24',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',13336691340.00,'SAN HÔ','Liền kề','Thô','',70.00,275.80,12261.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',10759.00,11581.00,'11/04','https://drive.google.com/drive/folders/1OEWmaIHlxRNhiP_FmjNOmP8HTKg1dT3V?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('232','SH14-30',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',17586262527.00,'SAN HÔ','Garden Villas','Thô có thang','',98.00,285.80,16167.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',14186.00,15270.00,'11/04','https://drive.google.com/drive/folders/1jmwZbVOS1S9FO-RCMyBdpsO6-EsHIMQt?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('233','SH22-12',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',16236037742.00,'SAN HÔ','Garden Villas','Thô có thang','',91.00,259.40,14926.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',13097.00,14098.00,'11/04','https://drive.google.com/drive/folders/1rTkUIgd5sD3LD4BIt-MqZBRAjiNrm1Di?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('234','SH21-93',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11941185910.00,'San Hô','Liền kề','Thô có thang','',56.00,228.80,10979.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',9624.00,10371.00,'19/06','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('235','SH16-53',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',14105728486.00,'San Hô','Liền kề','Thô có thang','',70.00,275.80,12969.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',11367.00,12250.00,'19/06','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('236','SH9-04',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',14999475304.00,'San Hô','Liền kề','Thô có thang','',70.00,275.80,13791.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',12088.00,13027.00,'19/06','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('237','SH9-06',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',14244313152.00,'San Hô','Liền kề','Thô có thang','',70.00,275.80,13096.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',11479.00,12370.00,'19/06','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('238','SH10-04',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',14889117007.00,'San Hô','Liền kề','Thô có thang','',70.00,275.80,13689.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',11999.00,12931.00,'19/06','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('239','SH10-06',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',14142670238.00,'San Hô','Liền kề','Thô có thang','',70.00,275.80,13003.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',11397.00,12282.00,'19/06','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('24','ĐD8-61',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',39393742122.00,'Đảo Dừa','Biệt thự song lập','Thô không thang','',180.00,404.60,0.00,'','','','HĐMB','','','','2024-04-14 00:00:00','','Đã Bán','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',0.00,0.00,'03/04/2024','','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('240','SH11-06',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',14244097778.00,'San Hô','Liền kề','Thô có thang','',70.00,275.80,13096.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',11479.00,12370.00,'19/06','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('241','SH12-04',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',15219311927.00,'San Hô','Liền kề','Thô có thang','',70.00,275.80,13993.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',12266.00,13218.00,'19/06','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('242','SH20-41',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',14106182885.00,'San Hô','Liền kề','Thô có thang','',70.00,275.80,12969.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',11367.00,12250.00,'19/06','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('243','SH20-35',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',14105728486.00,'San Hô','Liền kề','Thô có thang','',70.00,275.80,12969.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',11367.00,12250.00,'19/06','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('244','ĐD3-55',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',14354702438.00,'Đảo Dừa','Liền kề','Hoàn thiện','',56.00,231.30,0.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'11/04','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('245','SH11-04',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',14849584312.00,'San Hô','Liền kề','Thô có thang','',70.00,275.80,0.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'11/04','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('246','BX-194',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',37280785003.00,'Hải Âu','Shophouse','Thô không thang','',170.00,479.70,0.00,'','','','HƯNG THỊNH_VPB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'11/04','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('247','NT2-58',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',43918490870.00,'NGỌC TRAI','BT Song lập','Thô ','',140.00,338.40,40909.00,'','','','Newland-VCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',34552.00,38043.00,'17/01','https://drive.google.com/drive/folders/1SeZ4B8K_9Hg1QozIrgXrJwo91CDgROmA?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('248','NT2-59',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',44983780566.00,'NGỌC TRAI','BT Song lập','Thô ','',140.00,338.40,41901.00,'','','','Newland-VCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',35391.00,38996.00,'17/01','https://drive.google.com/drive/folders/1DNYgzapC7G3i3YqKo0qrfRVFKSp-7Kwl?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('249','SH20-68',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11016448525.00,'San Hô','Liền kề','Thô loại 1','',48.00,184.00,0.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'11/4','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('25','ĐD8-63',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',39393742122.00,'Đảo Dừa','Biệt thự song lập','Thô không thang','',180.00,404.60,0.00,'','','','HĐMB','','','','2024-04-14 00:00:00','','Đã Bán','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',0.00,0.00,'03/04/2024','','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('250','SH20-70',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11031152291.00,'San Hô','Liền kề','Thô loại 1','',48.00,192.00,0.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'11/4','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('251','ĐD1-100',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',12126890639.00,'Đảo Dừa','Liền kề','Thô không thang','',63.00,263.00,0.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'11/4','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('252','ĐD1-136',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',12110609354.00,'Đảo Dừa','Liền kề','Thô không thang','',63.00,263.00,0.00,'','','','CUỘC SỐNG MỚI_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'11/4','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('253','ĐD2-39',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11763725009.00,'Đảo Dừa','Liền kề','Thô có thang','',64.00,271.00,0.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'11/4','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('254','CL-70',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',23784323720.00,'CHÀ LÀ','LK-góc','Thô','',126.70,336.40,22141.00,'','','','Đô Thị Xanh-TCB','','','',NULL,'12/02/2025','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',18689.00,20584.00,'17/01','https://drive.google.com/drive/folders/11nuKf6h_6u_ussd3Knx08D13JDz6sDlC?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('255','HA9-135',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11339911859.00,'HẢI ÂU','Liền kề','Thô','',65.00,251.30,9773.00,'','','','Qũy thế chấp','','','',NULL,'15/1/2025','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',8666.00,9427.00,'25/12','https://drive.google.com/drive/folders/1QQKMTk_-88pZtzX-h2nd_-45HdUqnKHB?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('256','ĐD6-38',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',12678876318.00,'Đảo Dừa','Liền kề','Thô không thang','',64.00,271.00,0.00,'','','','QUỸ CHỦ ĐẦU TƯ_VTB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'17/1','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('257','SH20-20',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11930424036.00,'San Hô','Liền kề','Thô loại 1','',48.00,192.00,0.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'17/1','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('258','SH20-24',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11809586182.00,'San Hô','Liền kề','Thô loại 1','',48.00,184.00,0.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'17/1','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('259','SH21-18',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11744177739.00,'San Hô','Liền kề','Thô có thang','',56.00,220.00,0.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'17/1','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('26','ĐD8-67',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',40153503308.00,'Đảo Dừa','Biệt thự song lập','Thô không thang','',180.00,404.60,0.00,'','','','HĐMB','','','','2024-04-09 00:00:00','','Đã Bán','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',0.00,0.00,'03/04/2024','','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('260','ĐD6-46',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',12854212951.00,'Đảo Dừa','Liền kề','Thô không thang','',64.00,271.30,0.00,'','','','HUY HOÀNG_BVB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'17/1','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('261','ĐD1-06',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',12887765695.00,'Đảo Dừa','Liền kề','Thô có thang','',63.00,263.00,0.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'17/1','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('262','ĐD1-14',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',12787787260.00,'Đảo Dừa','Liền kề','Thô có thang','',63.00,271.00,0.00,'','','','UTĐT','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'17/1','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('263','ĐD1-18',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',12844818337.00,'Đảo Dừa','Liền kề','Thô có thang','',63.00,263.00,0.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'17/1','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('264','ĐD1-22',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',12844818337.00,'Đảo Dừa','Liền kề','Thô có thang','',63.00,263.00,0.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'17/1','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('265','ĐD1-28',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',12844818337.00,'Đảo Dừa','Liền kề','Thô có thang','',63.00,263.00,0.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'17/1','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('266','ĐD1-34',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',12645127890.00,'Đảo Dừa','Liền kề','Thô không thang','',63.00,263.00,0.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'17/1','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('267','ĐD6-32',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',12674336954.00,'Đảo Dừa','Liền kề','Thô không thang','',64.00,271.00,0.00,'','','','HUY HOÀNG_BVB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'17/1','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('268','CX3-04',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',13012528108.00,'Cọ Xanh','Liền kề','Thô có thang','',64.00,253.00,0.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'17/1','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('269','CX15-161',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',13882072502.00,'Cọ Xanh','Liền kề','Thô không thang','',80.00,320.00,0.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'17/1','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('27','ĐĐD-142',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',44714894491.00,'Sao Biển','Shophouse','Thô có thang','',166.10,430.30,0.00,'','','','HĐMB','','','','2024-09-03 00:00:00','','Đã Bán','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',0.00,0.00,'','','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('270','CX17-154',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',13850710278.00,'Cọ Xanh','Liền kề','Thô có thang','',80.00,319.00,0.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'17/1','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('271','CX11-150',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',11784265364.00,'Cọ Xanh','Liền kề','Thô loại 3','',63.00,253.00,0.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',0.00,0.00,'17/1','','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('272','SH11-50',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',17319921217.00,'SAN HÔ','Garden Villas','Thô có thang','',98.00,285.70,15922.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',13971.00,15039.00,'11/04','https://drive.google.com/drive/folders/1FQ3VCxCAtzqopr8doLKZOCSO9bT3miqf?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('273','SH22-32',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',17586379701.00,'SAN HÔ','Garden Villas','Thô có thang','',98.00,287.20,16168.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',14186.00,15270.00,'11/04','https://drive.google.com/drive/folders/1q1Ef7ANMNXWi1-MGVAhIiKxwNZd4QuJG?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('274','SH11-16',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',13336691340.00,'SAN HÔ','Liền kề','Thô','',70.00,275.80,12261.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',10759.00,11581.00,'11/04','https://drive.google.com/drive/folders/1l58ROPIq64o9Lxx0dDXjLUHmYoDvo0Tp?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('275','SH12-28',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',17586816332.00,'SAN HÔ','Garden Villas','Thô có thang','',98.00,285.80,16168.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',14186.00,15271.00,'11/04','https://drive.google.com/drive/folders/1-H49i0j9tR1dGv4o1u5B_oauuLQ5tWhn?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('276','SH14-28',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',17586262527.00,'SAN HÔ','Garden Villas','Thô có thang','',98.00,285.80,16167.00,'','','','HĐMB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',14186.00,15270.00,'11/04','https://drive.google.com/drive/folders/1GpuA7rLBz_atrT5GJMS1orTsEB384722?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('277','SH18-40',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',17441756372.00,'SAN HÔ','Garden Villas','Thô có thang','',98.00,285.80,16040.00,'','','','NGỌC QUÝ_VPB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',14102.00,15153.00,'11/04','https://drive.google.com/drive/folders/1SxKyYGdxI8aZG_BRw-7zvm_mOUFI9MeM?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('278','SH12-48',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',17586262527.00,'SAN HÔ','Liền kề','Thô có thang','',98.00,285.80,17586.00,'','','','QUỸ THẾ CHẤP_TCB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',14814.00,16345.00,'11/04','https://drive.google.com/drive/folders/1uwzEN37RfSNI-mn4N1NnxAwLF_2aiEbn?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('279','SH14-83',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',18431622675.00,'SAN HÔ','Liền kề','Thô có thang','',98.00,285.80,16951.00,'','','','NGỌC QUÝ_VPB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',14904.00,16014.00,'11/04','https://drive.google.com/drive/folders/1GALsijNnrDNt0MLXQMNzPW4-m1-D23C-?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('28','PĐ.KT-51',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',28963017295.00,'Ktown','TMDV','','',129.00,435.60,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('280','SH7-69',0,NULL,'2025-12-04 11:06:36','2025-12-04 11:06:36',24779665553.00,'SAN HÔ','Shophouse','Thô có thang','',120.00,347.90,24779.00,'','','','NGỌC QUÝ_VPB','','','',NULL,'','','HomePlug','HomePlus OCP2','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=2080190649#gid=2080190649',20920.00,23039.00,'11/04','https://drive.google.com/drive/folders/1tiSgCPwqzGqVPFWbOs2R0TqYTkaKr8NF?usp=drive_link','2025-12-04 11:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('281','VTĐ1-162',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',20807388627.00,'','Beach Villas','HT','',98.00,268.00,16803.00,'VC vinpearl 205tr ','','','VBCN-Đô Thị Xanh-TCB','','','',NULL,'','','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/11','https://drive.google.com/drive/folders/1ppw5toThAZ3qLje3Z-rcdeTzmx_EV_HH?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('282','AD-06',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',18271601489.00,'','Beach Villas','Thô','',112.00,314.40,16742.00,'VC vinpearl 205tr ','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/11','https://drive.google.com/drive/folders/1GHqL9NBRtsV8z9HDp3EXTGycuIamfUpX?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('283','AD-07',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',18130249164.00,'','Beach Villas','Thô','',112.00,314.40,16612.00,'VC vinpearl 205tr ','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/11','https://drive.google.com/drive/folders/1HG_iG-mT382pkxP-DUiinGcb5LYhcKt4?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('284','AD12-32',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',22291599371.00,'','TLAD','Thô','',120.00,284.50,20428.00,'VC vinpearl 205tr ','','','VBCN-HOÀNG HIỆP-TCB','','','',NULL,'','','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/11','https://drive.google.com/drive/folders/1tSXNLgQh6xSGkOWn5wnacyFV1s86JZPz?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('285','AD12-34',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',22291599371.00,'','TLAD','Thô','',120.00,284.50,20428.00,'VC vinpearl 205tr ','','','VBCN-HOÀNG HIỆP-TCB','','','',NULL,'','','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/11','https://drive.google.com/drive/folders/1cb-8NgWk6FCoEkhOB0FFaHSMbKyiJmyu?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('286','AD10-31',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',21991454157.00,'','TLAD','Thô','',120.00,285.00,20152.00,'VC vinpearl 205tr ','','','VBCN-HOÀNG HIỆP-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/11','https://drive.google.com/drive/folders/1jjddsHNXo1V3VJccCKSfur8DKeRsKlFe?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('287','AD2-13',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',21251900954.00,'','Shophouse','Thô','',140.00,382.00,19472.00,'VC vinpearl 205tr ','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/11','https://drive.google.com/drive/folders/12zTeRJ58CUoX7p2EshCba3WeC1Okhe32?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('288','PB12-14',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',24320133661.00,'','Liền kề','Hoàn thiện','',119.00,336.20,0.00,'VC vinpearl 205tr ','','','VBCN-UTĐT-TCB','','','',NULL,'','','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/11','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('289','PB12-24',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',24579499141.00,'','Liền kề','Hoàn thiện','',119.00,336.20,0.00,'VC vinpearl 205tr ','','','VBCN-UTĐT-TCB','','','',NULL,'','','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/11','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('29','PĐ5.KT-05',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',23938114154.00,'Ktown','TMDV','','',118.30,396.20,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('290','PB11-26',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',26357458659.00,'','Liền kề','Hoàn thiện','',119.00,336.20,0.00,'VC vinpearl 205tr ','','','VBCN-UTĐT-TCB','','','',NULL,'','','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/11','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('291','PB-12',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',32724702078.00,'','Shophouse','Thô','',140.00,378.40,0.00,'VC vinpearl 205tr ','','','Newland-VPB','','','',NULL,'','','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/11','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('292','PB-14',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',32442607068.00,'','Shophouse','Thô','',140.00,378.40,0.00,'VC vinpearl 205tr ','','','Newland-VPB','','','',NULL,'','','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/11','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('293','PB2-149',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',22997486337.00,'','Shophouse','Thô','',140.00,378.40,0.00,'VC vinpearl 205tr ','','','VBCN-HƯNG LONG-BIDV','','','',NULL,'','','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/11','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('294','PB11-14',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',24320133661.00,'','Liền kề','Hoàn thiện','',119.00,336.20,0.00,'VC vinpearl 205tr ','','','VBCN-Cá nhân-TCB','','','',NULL,'','','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/11','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('295','TĐ7-09',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',16455868745.00,'','Liền kề','Hoàn thiện','',60.00,235.50,0.00,'VC vinpearl 205tr ','','','VMI (New)','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('296','AD6-12',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',26294125450.00,'','Shophouse','Thô','',140.00,378.40,0.00,'VC vinpearl 205tr ','','','HH-HCM','','','',NULL,'','','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/11','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('297','AD6-14',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',26012071992.00,'','Shophouse','Thô','',140.00,378.40,0.00,'VC vinpearl 205tr ','','','HH-HCM','','','',NULL,'','','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/11','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('298','VTĐ3-178',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',16370940586.00,'','Beach Villas','Hoàn thiện','',78.00,198.20,13875.00,'VC vinpearl 205tr + VC Vinmec 100tr+ Miễn PDV 10 năm','','','Đô Thị Xanh - TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/9','https://drive.google.com/drive/folders/1CXOxZK8-yzrjlh-PZq_emJpgCqzkznkf?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('299','VTĐ2-179',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',16004372465.00,'','Beach Villas','Hoàn thiện','',78.00,198.20,13563.00,'VC vinpearl 205tr + Miễn PDV 10 năm','','','Đô Thị Xanh - TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/9','https://drive.google.com/drive/folders/1-gkrf_nhMMocqWnc30_gogjkQuGM4xWu?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('3','SH11-23',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',26013544877.00,'San Hô','Liền kề','Thô có thang','',144.00,398.10,22724.00,'Vinpearl + Vinmec + MPDV','','','VBCN','TCB','','','2025-10-15 00:00:00','','Quỹ ĐQ','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',19972.00,21469.00,'11/10/2025\nor 18/11/2025','https://bom.so/dBekVA','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('30','SH1.KT-22',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',26215954718.00,'Ktown','TMDV','','',129.00,363.60,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('300','VTĐ3-160',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',16127766946.00,'','Beach Villas','Hoàn thiện','',78.00,198.30,13668.00,'VC vinpearl 205tr + Miễn PDV 10 năm','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/9','https://drive.google.com/drive/folders/1XelejdzE81xNZkR4swuyAgpV1cvrtxoE?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('301','PB10-21',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',22658885052.00,'','Liền kề','Hoàn thiện','',104.00,294.00,18127.00,'','','','VBCN-UTĐT-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/9','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('302','AD11-21',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',21839367089.00,'','TLAD','Thô','',120.00,284.50,21071.00,'VC vinpearl 205tr + Miễn PDV 10 năm','','','VBCN-NEWLAND-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/9','https://drive.google.com/drive/folders/1jcl4U36MPwOHPXmCByH9CDV1haCRXZD3?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('303','AD11-27',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',21838720740.00,'','TLAD','Thô','',120.00,284.50,21071.00,'VC vinpearl 205tr + Miễn PDV 10 năm','','','VBCN-HOÀNG HIỆP-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'11/10','https://drive.google.com/drive/folders/1vZ4-Y7AgfI-skXIf1LLXTRLqFm9kDC5K?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('304','PB12-12',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',24575963187.00,'','Liền kề','Hoàn thiện','',119.00,336.20,19658.00,'','','','VBCN-UTĐT-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/9','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('305','TĐ7-11',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',16347387320.00,'','Liền kề','Hoàn thiện','',60.00,235.10,12815.00,'','','','VBCN-VMI','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/9','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('306','VTĐ2-182',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',13196755795.00,'','Liền kề','Hoàn thiện','',54.00,203.00,10906.00,'VC vinpearl 135tr + VC Vinmec 100tr+ Miễn PDV 10 năm','','','Đô Thị Xanh - TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/9','https://drive.google.com/drive/folders/1VRxFZxsvRJWOjBriP1yUJpZzS-dbqDmt?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('307','VTĐ3-158',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',16127766946.00,'','Beach Villas','Hoàn thiện','',78.00,198.30,13668.00,'VC vinpearl 205tr + VC Vinmec 100tr+ Miễn PDV 10 năm','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/9','https://drive.google.com/drive/folders/1abzDFZi9LUuESRol4J9oVB0LZ7YL5yjN?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('308','AD11-80',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',18097215805.00,'','Beach Villas','Thô','',112.00,314.00,17320.00,'VC vinpearl 205tr + VC Vinmec 100tr+ Miễn PDV 10 năm','','','VBCN-Trường Lộc-VPB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/9','https://drive.google.com/drive/folders/10Vhbz7xRIivCqoiCrKC9ALxQL--Yd25j?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('309','AD18-14',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',16619387190.00,'','Beach Villas','Thô','',112.00,311.20,16034.00,'VC vinpearl 205tr + VC Vinmec 100tr+ Miễn PDV 10 năm','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'19/8','https://drive.google.com/drive/folders/1qEAFH5RyHSw3P4Yk-V94uYrdfSj4egyQ?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('31','PĐ.KT-37',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',29512060264.00,'Ktown','TMDV','','',123.00,471.60,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('310','VTĐ3-168',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',13222679169.00,'','Liền kề','Hoàn thiện','',54.00,201.30,10928.00,'VC vinpearl 135tr + VC Vinmec 100tr+ Miễn PDV 10 năm','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'20/8','https://drive.google.com/drive/folders/1mt6QOg2mX7GEo2C-bpxP_msejIOEwyW5?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('311','VTĐ3-170',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',13222679169.00,'','Liền kề','Hoàn thiện','',54.00,201.30,10928.00,'VC vinpearl 135tr + VC Vinmec 100tr+ Miễn PDV 10 năm','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'18/9','https://drive.google.com/drive/folders/1TFrb3fShkzHfK4B9EpqYw7a2KYgBH1yl?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('312','AD6-26',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',20413455234.00,'','Shophouse','Thô','',100.00,378.20,19538.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'20/8','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('313','AD16-22',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',15747911612.00,'','Liền kề','Thô','',91.00,243.00,15071.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'20/8','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('314','AD5-07',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',14252063564.00,'','Liền kề','Thô','',85.00,336.30,13750.00,'VC vinpearl 205tr + VC Vinmec 100tr+ Miễn PDV 10 năm','','','VBCN-Hoàng Hiệp-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','https://drive.google.com/drive/folders/1YkjXTP46GucCJhS2-RPK_rDM0LBuJ_G6?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('315','AD12-80',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',18097215805.00,'','Beach Villas','Thô','',112.00,311.10,17460.00,'VC vinpearl 205tr + VC Vinmec 100tr+ Miễn PDV 10 năm','','','VBCN-Phú Thọ Land- VPB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','https://drive.google.com/drive/folders/1n_3Zdn5HNtcLwTAVtpKcToQkeIxAOMK5?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('316','AD6-2X',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',22588994066.00,'','Tứ lập','Thô','',120.00,287.00,21620.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'20/8','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('317','VTĐ3-146',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',13043354547.00,'','Liền kề','Hoàn thiện','',54.00,201.30,10776.00,'VC vinpearl 205tr + VC Vinmec 100tr+ Miễn PDV 10 năm','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'20/8','https://drive.google.com/drive/folders/14K_Y3JfRwcADflq3U8Xoziqe0Y_lerl1?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('318','VTĐ2-130',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',13035905879.00,'','Liền kề','Hoàn thiện','',54.00,200.90,10769.00,'','','','Đô Thị Xanh - TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'20/8','https://drive.google.com/drive/folders/1k8TWKU4wmip_XjhPjmhcLQy6Sb7aNEjT?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('319','VTĐ2-153',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',12752726484.00,'','Liền kề','Hoàn thiện','',54.00,202.70,10529.00,'','','','Đô Thị Xanh - TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'20/8','https://drive.google.com/drive/folders/1blUpCHSk-67qo-XVS7b98EVDa7tcNKbB?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('32','PB19.TV-07',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',14827999312.00,'Venice','TMDV','','',78.00,234.80,0.00,'','Ký mới','','HĐMB','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('320','VTĐ3-126',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',13222679169.00,'','Liền kề','Hoàn thiện','',54.00,200.30,10928.00,'VC vinpearl 205tr + VC Vinmec 100tr+ Miễn PDV 10 năm','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'20/8','https://drive.google.com/drive/folders/1kG4k6Xw-P-xrBHo5jJMpzuetjOTszXZB?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('321','AD5-15',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',14311245681.00,'','Liền kề','Thô','',85.00,336.80,13807.00,'','','','VBCN-Hoàng Hiệp-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','https://drive.google.com/drive/folders/1rONVwGmfwy3L3ednQPP3sDtO5ZYTD9vt?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('322','AD8-68',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',17329249030.00,'','Beach Villas','Thô','',112.00,314.00,16719.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','https://drive.google.com/drive/folders/1Mq3nFozSAYSgFCSYVV-DCPyDA1Fpc2mv?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('323','VTĐ2-137',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',15673502565.00,'','Liền kề','Hoàn thiện','',78.00,198.30,13846.00,'','','','VBCN-Đô Thị Xanh-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'20/8','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('324','AD2-49',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',17163682956.00,'','Shophouse','Thô','',100.00,378.20,16426.00,'','','','VBCN-Hoàng Hiệp-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'20/8','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('325','AD6-22',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',20473918337.00,'','Shophouse','Thô','',100.00,384.00,19569.00,'','','','VBCN-Hoàng Hiệp-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'20/8','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('326','VTĐ3-108',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',13490494353.00,'','Liền kề','Hoàn thiện','',54.00,200.90,11920.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('327','AD6-60',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',20365109423.00,'','Shophouse','Thô','',100.00,378.00,0.00,'','','','VBCN-Hoàng Hiệp-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('328','AD6-74',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',19741980641.00,'','Shophouse','Thô','',100.00,378.20,0.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('329','AD6-32',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',20413455234.00,'','Shophouse','Thô','',100.00,378.00,19696.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('33','PT1.TV-54',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',20944428377.00,'Venice','TMDV','','',102.00,236.60,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('330','AD16-05',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',15626181182.00,'','Liền kề','Thô','',91.00,243.20,15077.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('331','VTĐ1-187',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',11445465085.00,'','Liền kề','Thô','',54.00,201.30,11043.00,'','','','VBCN-Đô Thị Xanh-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('332','AD2-47',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',17038133197.00,'','Shophouse','Thô','',100.00,378.20,16438.00,'','','','VBCN-Hoàng Hiệp-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('333','ĐLHĐ-335',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',18902122472.00,'','Shophouse','Thô','',105.00,292.00,18237.00,'','','','VBCN-Hưng Nghĩa-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('334','VTĐ2-157',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',15673502565.00,'','Beach Villas','Hoàn thiện','',78.00,201.50,13390.00,'','','','Đô Thị Xanh - TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','https://drive.google.com/drive/folders/1l0FJrRC1CnP4dggNJq1a0ltkG5lKf_zq?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('335','AD18-26',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',13354675527.00,'','Liền kề','Thô','',80.00,314.00,12884.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('336','AD5-20',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',14739460903.00,'','Liền kề','Thô','',85.00,336.30,14221.00,'','','','VBCN-Hoàng Hiệp-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('337','VTĐ1-185',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',11352506190.00,'','Liền kề','Thô','',54.00,200.90,10953.00,'','','','VBCN-Đô Thị Xanh-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('338','AD18-12',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',16920034709.00,'','Beach Villas','Thô','',112.00,311.20,16324.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','https://drive.google.com/drive/folders/1rOHEtMqP6Xcz2JNeXI0lGj4BDUB6JHRK?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('339','AD7-70',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',16994819646.00,'','Beach Villas','Thô','',112.00,314.00,16396.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'03/07','https://drive.google.com/drive/folders/1PnJEYpH5W2evDm4KPTUmO5-J6NCL_NQ7?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('34','PT2.TV-18',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',36403856594.00,'Venice','TMDV','','',157.30,472.70,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('340','AD12-52',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',16909832315.00,'','Beach Villas','Thô','',112.00,314.00,16909.00,'','','','VBCN-Trường Lộc-VPB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'11/4','https://drive.google.com/drive/folders/1RRH0RWn53VSHsSyRN1n2OdE3zzq1XVKS?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('341','AD8-54',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',17128591576.00,'','Beach Villas','Thô','',112.00,311.20,16525.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','https://drive.google.com/drive/folders/15YFDdnzexyWoWXvKBueP-tTautJIytTQ?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('342','VTĐ3-110',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',13376080328.00,'','Liền kề','Hoàn thiện','',54.00,200.00,11430.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('343','VTĐ1-170',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',16594216828.00,'','Liền kề','Hoàn thiện','',70.00,271.00,14180.00,'','','','VBCN-Đô Thị Xanh-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'3/7','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('344','VTĐ3-38',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',13727991045.00,'','Garden Villas','Thô','',78.00,202.00,13727.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'11/4','https://drive.google.com/drive/folders/1NjG_u9zRSqVrXUTK2-Lp6GAyuzzYsYJP?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('345','AD7-54',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',16909776891.00,'','Garden Villas','Thô','',112.00,314.00,16909.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'11/04','https://drive.google.com/drive/folders/1djbi7nlgAxrYCACYgxhPHfgquTEOfltH?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('346','AD11-52',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',16909832315.00,'','Garden Villas','Thô','',112.00,314.00,16909.00,'','','','VBCN-Phú Thọ Land-VPB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'11/04','https://drive.google.com/drive/folders/1F228Zccbxr7Dayen7fHvMqray9zH4fRM?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('347','AD12-70',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',16909832315.00,'','Garden Villas','Thô','',112.00,314.00,16909.00,'','','','VBCN-Phú Thọ Land-VPB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'11/04','https://drive.google.com/drive/folders/1pRKfHNfmGuCGkG47UzJI-eGKnFUhR-uv?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('348','AD2-14',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',21736828970.00,'','SH','Thô','',140.00,381.60,21736.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'11/4','https://drive.google.com/drive/folders/18AMq7YVEymuCmS283VuS3LFew5BHl-Az?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('349','VTĐ2-132',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',12390364672.00,'','Liền kề','Hoàn thiện','',54.00,203.00,10917.00,'','','','VBCN-Long Hải-VTB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/01','https://drive.google.com/drive/folders/13OcBsEbtPNRN3wka4Odvg8L9YKmneIEa?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('35','PT2.TV-181',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',28706108651.00,'Venice','TMDV','','',132.00,491.50,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('350','VTĐ2-134',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',12390364672.00,'','Liền kề','Hoàn thiện','',54.00,202.70,10917.00,'','','','VBCN-Long Hải-VTB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/01','https://drive.google.com/drive/folders/1JQakIiYcYfstZMgek_VBaa0ivs-s_Plj?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('351','AD17-04',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',12189976032.00,'','Liền kề','Thô','',70.00,272.80,12189.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'11/4','https://drive.google.com/drive/folders/1SdBWDdjEUK-bDZVkgjEYUVAJFfgaFwVR?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('352','VTĐ2-175',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',12309069328.00,'','Liền kề','Hoàn thiện','',54.00,202.70,10846.00,'','','','VBCN-Long Hải-VTB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/01','https://drive.google.com/drive/folders/1HAu-fYMk3_BWQ0XMg1GqlhqH8vdTjnFu?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('353','AD9-54',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',17282799999.00,'','Beach Villas','Thô','',112.00,314.00,16761.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/1uSTFYmWUaWrYJz8-4uWgszcCMweSRetm?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('354','AD7-80',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',18259940436.00,'','Beach Villas','Thô','',112.00,314.00,17709.00,'','','','VBCN-Hoàng Hiệp-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/01','https://drive.google.com/drive/folders/12Hwl3HSKDHb8nJiM76NtwMmbJ0CH9TQs?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('355','AD6-0X',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',25431111007.00,'','Tứ lập','Thô','',120.00,287.00,24170.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/01','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('356','VTĐ2-165',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',12326661109.00,'','Liền kề','Hoàn thiện','',54.00,204.00,10861.00,'','','','VBCN-Long Hải-VTB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/01','https://drive.google.com/drive/folders/1wnxfB75WeNIyM_6Uiz07KpS9lwj6gMwi?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('357','AD6-44',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',25749621693.00,'','Shophouse','Thô','',140.00,381.60,0.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'11/4','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('358','AD6-68',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',25935775774.00,'','Shophouse','Thô','',140.00,381.60,0.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'11/4','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('359','AD4-13',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',14448962425.00,'','Liền kề','Thô','',78.00,297.70,0.00,'','','','VBCN-Newland-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'11/4','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('36','PB19.TV-135',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',18342097462.00,'Venice','TMDV','','',96.00,236.60,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('360','AD2-43',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',21299523035.00,'','Shophouse','Thô','',140.00,381.60,0.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'11/4','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('361','AD2-44',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',21736828970.00,'','Shophouse','Thô','',140.00,381.60,0.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'11/4','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('362','VTĐ1-16',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',20626582839.00,'','Liền kề','Hoàn thiện','',98.00,271.20,0.00,'','','','HĐMB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'11/4','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('363','VTĐ3-114',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',16208967698.00,'','Liền kề','Hoàn thiện','',78.00,201.50,0.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'11/4','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('364','VTĐ3-116',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',16208967698.00,'','Liền kề','Hoàn thiện','',78.00,201.50,0.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'11/4','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('365','VTĐ1-142',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',16496632820.00,'','Beach Villas','Thô','',98.00,271.00,15999.00,'','','','VBCN-Long Hải-VTB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/01','https://drive.google.com/drive/folders/1tTUGYNz0jYxT-rgKWhcbio_oIEwF5DbU?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('366','AD16-08',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',12040233546.00,'','Liền kề','Thô','',65.00,248.20,11677.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/1PDatXc5oHuCjY5wwbDYSbsiQ576P34D9?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('367','VTĐ3-40',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',13259496365.00,'','Beach Villas','Thô','',78.00,202.00,13259.00,'','','','VBCN-Long Hải-VTB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/1Q6P50lYHCs9f-BblOJ1CmGPR9ErcvVYf?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('368','VT4-52',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',10841292548.00,'','Liền kề','Thô','',68.00,270.90,10514.00,'','','','NEWLAND-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/1KoIbCZQjsaFxfk2wrZA5VbEcarXvlhyd?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('369','AD13-90',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',15564865473.00,'','Beach Villas','Thô','',98.00,271.20,15095.00,'','','','VBCN-Phát Đạt-VPB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/1PH6AKplpBDsOUPflpHctUKWGbkfRInHd?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('37','PB19.TV-83',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',28955773220.00,'Venice','TMDV','','',151.80,325.60,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('370','AD12-52',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',17147878037.00,'','Beach Villas','Thô','',112.00,314.00,16630.00,'','','','VBCN-Trường Lộc-VPB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/1-Nm0zE8yUzDccdU9J0Xu2Ufsd9Cx-YLq?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('371','VTĐ2-132',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',12390364672.00,'','Liền kề','Hoàn thiện','',54.00,202.70,10917.00,'','','','VBCN-Long Hải-VTB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/01','https://drive.google.com/drive/folders/13OcBsEbtPNRN3wka4Odvg8L9YKmneIEa?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('372','VTĐ6-83',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',15174201896.00,'','Beach Villas','Thô','',90.00,234.00,14713.00,'','','','VBCN-Cá nhân-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/01','https://drive.google.com/drive/folders/198QOCQ1pLhw7SI5SrxE8K6ZGCePmrTg-?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('373','VTĐ7-128',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',15746058092.00,'','Beach Villas','Thô','',90.00,234.00,15268.00,'','','','VBCN-Cá nhân-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/1TeecfbBpEhl-xgdJMD6Y7J24TVVs5YQ4?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('374','VTĐ7-26',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',15742946582.00,'','Beach Villas','Thô','',90.00,234.00,15265.00,'','','','VBCN-Hưng Nghĩa-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/1r8HI_9UcVMXxiCbDwU2lO9dG_yCdDViC?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('375','AD13-18',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',15822512694.00,'','Beach Villas','Thô','',98.00,271.00,15343.00,'','','','HĐMB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/1aKt_dtYCxwefv-uTpMoKbdOjdNvFstHB?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('376','AD11-46',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',13288522111.00,'','Liền kề','Thô','',80.00,317.50,12887.00,'','','','VBCN-Phú Thọ Land-VPB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/1SZ5poXNHrtcCau3JIx17BhMtMx4l-iOm?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('377','AD10-44',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',13229458948.00,'','Liền kề','Thô','',80.00,318.10,12828.00,'','','','HĐMB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/1DYmxEkyfgCTD227lDWAxcch1hQdCwL5T?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('378','AD2-45',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',21299523035.00,'','Shophouse','Thô','',140.00,381.60,0.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'11/4','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('379','AD6-28',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',26028852604.00,'','Shophouse','Thô','',140.00,381.60,0.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'11/4','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('38','ĐD1.SP21-02',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',13849074970.00,'Center Point','TMDV','','',85.00,280.40,0.00,'','Ký mới','','HĐMB','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('380','VTĐ2-38',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',12787412127.00,'','LK-XK','Thô','',78.00,201.50,12401.00,'','','','VBCN-Long Hải-VTB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/1jXQdnnH-MozoVghkiYx3fq2l9dPvsM_H?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('381','VTĐ6-23',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',15181088525.00,'','Beach Villas','Thô','',90.00,234.00,14718.00,'','','','HĐMB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/1oAK6VWNg51GDsHOdhkWtFtABRmL7n8Ds?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('382','VTĐ2-40',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',12787412127.00,'','Beach Villas','Thô','',78.00,201.50,12401.00,'','','','VBCN-Long Hải-VTB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/1OVSEZ5UA4r6gKa_UNk0iglpmnqD6v4gd?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('383','VTĐ3-46',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',10490776799.00,'','Liền kề','Thô','',54.00,204.10,10490.00,'','','','VBCN-Long Hải-VTB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/01','https://drive.google.com/drive/folders/18CtNpMUhGbG2kU9-mu-Xd0g1m3wd1HcX?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('384','TĐ9-40',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',15619303450.00,'','Liền kề','Hoàn thiện','',60.00,235.50,0.00,'','','','VBCN-Thái Dương Land-VPB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('385','VTĐ1-60',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',15500827781.00,'','Liền kề','Hoàn thiện','',70.00,274.20,0.00,'','','','HĐMB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('386','VTĐ1-68',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',15659123203.00,'','Liền kề','Hoàn thiện','',70.00,274.20,0.00,'','','','HĐMB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('387','VTĐ1-98',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',15801194250.00,'','Liền kề','Hoàn thiện','',70.00,274.30,0.00,'','','','VBCN-Hưng Nghĩa-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('388','AD13-20',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',15822512694.00,'','Beach Villas','Thô','',98.00,271.00,15343.00,'','','','HĐMB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/10o3bauQ6KdJeaQqCU1vYVSoACjytnTgi?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('389','VTĐ-20',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',21676681819.00,'','Liền kề','Thô','',75.00,281.00,0.00,'','','','HĐMB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/01/2025','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('39','ĐLNT.SP21-11',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',17664669225.00,'Center Point','TMDV','','',95.00,258.60,0.00,'','Ký mới','','HĐMB','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('390','VTĐ2-114',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',13259496365.00,'','Liền kề','Thô','',78.00,201.50,0.00,'','','','VBCN-Long Hải-VTB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/01/2025','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('391','AD16-02',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',12017893135.00,'','Liền kề','Thô','',65.00,250.30,0.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/01/2025','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('392','AD16-03',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',11996362439.00,'','Liền kề','Thô','',65.00,248.20,0.00,'','','','VBCN-Ngôi sao Phương Nam-BIDV','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/01/2025','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('393','PB4-20',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',20634678424.00,'','LK-XK','Thô','',136.00,404.00,20009.00,'','','','HĐMB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/1R6YS8tfKALy1Mo-ET1BJzfoUU7gVhAJz?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('394','VTĐ1-137',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',12996681083.00,'','Beach Villas','Thô','',78.00,201.50,12604.00,'','','','VBCN-Long Hải-VTB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/1mu1WYUbjcftVAtocthV_iCNLQKbrQTep?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('395','VT4-14',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',10880274639.00,'','Liền kề','Thô','',68.00,270.60,10551.00,'','','','VBCN-Hưng Nghĩa-VTB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/1y6UV_gqMjwB5sfkIoENIOQDpAG8FB3P4?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('396','VT5-40',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',10577962801.00,'','Liền kề','Thô','',68.00,271.00,10258.00,'','','','VBCN-Hưng Nghĩa-VTB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','https://drive.google.com/drive/folders/1ZMWjH0WnTyclzIXgfuM7VXXH7BYGhkvF?usp=drive_link','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('397','AD4-13',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',14582071637.00,'','Liền kề','Thô','',78.00,297.70,0.00,'','','','VBCN-An Hưng-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('398','AD19-24',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',10775549584.00,'','Liền kề','Thô','',64.00,254.30,0.00,'','','','VBCN-An Hưng-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('399','AD19-28',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',10779580936.00,'','Liền kề','Thô','',64.00,254.70,0.00,'','','','VBCN-An Hưng-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('4','ĐĐD-14',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',38440282684.00,'San Hô','SL','Thô có thang','',160.00,335.40,33586.00,'Vinpearl + Vinmec\nVOS + ACBB','','','VBCN','VCB','','','2025-10-15 00:00:00','','Quỹ ĐQ','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',29523.00,31734.00,'18/11','https://bom.so/EjymXL','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('40','ĐĐD.SP14-13',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',18890361043.00,'Center Point','TMDV','','',102.50,259.40,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('400','AD19-30',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',10775549584.00,'','Liền kề','Thô','',64.00,254.30,0.00,'','','','VBCN-An Hưng-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('401','AD19-32',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',10764244749.00,'','Liền kề','Thô','',64.00,253.20,0.00,'','','','VBCN-An Hưng-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('402','AD19-34',0,NULL,'2025-12-04 11:06:53','2025-12-04 11:06:53',10764244749.00,'','Liền kề','Thô','',64.00,253.20,0.00,'','','','VBCN-An Hưng-TCB','','','',NULL,'','Đã bán','HomePlug','HomePlus OCP3','https://docs.google.com/spreadsheets/d/1IyMdn8Qb5q4GVxFnFiWS5ZuiEw3U5DM2-S-6WhKOhpQ/edit?gid=0#gid=0',0.00,0.00,'17/1','','2025-12-04 11:06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('41','ĐLNT.SP14-03',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',17224358192.00,'Center Point','TMDV','','',95.00,255.40,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('42','NT1B.SP14-05',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',12364121033.00,'Center Point','TMDV','','',80.00,255.40,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('43','NT1B.SP14-07',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',12355376739.00,'Center Point','TMDV','','',80.00,259.40,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('44','NT1B.SP14-11',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',12364121033.00,'Center Point','TMDV','','',80.00,255.40,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('45','NT1B.SP14-13',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',12270823562.00,'Center Point','TMDV','','',80.00,259.40,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('46','NT1B.SP14-10',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',12294052458.00,'Center Point','TMDV','','',85.00,259.40,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('47','NT1B.SP14-12',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',12171087214.00,'Center Point','TMDV','','',85.00,255.40,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('48','NT1B.SP14-14',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',12034536009.00,'Center Point','TMDV','','',85.00,255.40,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('49','NT1B.SP14-16',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',12168945144.00,'Center Point','TMDV','','',85.00,259.40,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('5','SH22-141',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',14290572624.00,'San Hô','Liền kề','Hoàn thiện 5T','',48.00,192.00,10229.00,'Vinpearl + Vinmec \nVOS + ACBB + Quà tặng Vinfast','','','VBCN','VPB','','','2025-11-11 00:00:00','','Quỹ ĐQ','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',8994.00,9666.00,'18/11','https://bom.so/HtbSBB','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('50','NT1B.SP14-52',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',13517194362.00,'Center Point','TMDV','','',85.00,255.40,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('51','SH8A.SP9-26',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',20641787382.00,'Little HongKong','TMDV','','',102.50,315.30,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('52','SH8A.SP9-50',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',21777588475.00,'Little HongKong','TMDV','','',102.50,315.30,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('53','SH8B.SP9-56',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',20968143348.00,'Little HongKong','TMDV','','',102.50,317.90,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('54','SH12.SP9-05',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',23457902283.00,'Little HongKong','TMDV','','',117.50,317.90,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('55','SH12.SP9-28',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',24434414150.00,'Little HongKong','TMDV','','',117.50,317.90,0.00,'','Ký mới','','VBCN','','','','2025-05-09 00:00:00','','Lock chung','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'10/5','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('56','PĐ2.KT-24',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',15141703510.00,'Ktown','TMDV','','',90.00,276.40,0.00,'','','','VBCN','','','',NULL,'','Đã Bán','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('57','PĐ6.KT-02',0,NULL,'2025-12-04 11:05:44','2025-12-04 11:05:44',48628484424.00,'Ktown','TMDV','','',520.90,209.40,0.00,'','','','VBCN','','','',NULL,'','Đã Bán','MDL','MDL TMDV','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=669149310#gid=669149310',0.00,0.00,'','','2025-12-04 11:05:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('58','ĐD1-49',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',14346693916.00,'ĐẢO DỪA','Liền kề','Hoàn Thiện ','',56.00,238.30,11710.00,'','','','','','','',NULL,'VOS                         Chưa cho thuê','Độc quyền','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',10326.00,11065.00,'18/11/2025','https://drive.google.com/drive/folders/1MPGKZKmttlwomMA4xGQk6v9oZMZlrSng','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('59','SH10-03',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',19724053019.00,'SAN HÔ','Liền kề','Thô có thang','',96.00,342.20,17230.00,'','','','','','','',NULL,'CK ACBB giới hạn','Check admin','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',15181.00,16279.00,'18/11/2025','https://drive.google.com/drive/folders/1rYSgEXgNwVjv2BQUJufvUY2hQ8O8Gplw','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('6','SH20-32',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',13588727435.00,'San Hô','Liền kề','Hoàn thiện 5T','',48.00,184.00,9714.00,'Vinpearl + Vinmec\nVOS + ACBB + Quà tặng Vinfast','','','VBCN','TCB','','','2025-11-11 00:00:00','','Quỹ ĐQ','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',8540.00,9179.00,'18/11','https://bom.so/Lagxoa','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('60','SH17-1x',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',37617000000.00,'SAN HÔ','Song lập','Thô','',150.00,313.00,31359.00,'','','','','','','',NULL,'Tặng 20 cây vàng \nCK vào giá','Độc quyền','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',28310.00,0.00,'15/9/2025','https://drive.google.com/drive/folders/1HhrKmP0BLHTAMp8pVLdeKg6EMk_hoUic','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('61','SH21-01',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',21684176509.00,'SAN HÔ','Liền kề','Thô có thang','',90.00,336.00,18945.00,'','','','','','','',NULL,'CK ACBB giới hạn','Độc quyền','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',16694.00,17899.00,'18/11/2025','https://drive.google.com/drive/folders/1Yq1K209diqmoJobrjo7nWHB3-XsgPLzA','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('62','SH22-15',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',11496527857.00,'SAN HÔ','Liền kề','Thô loại 1','',48.00,183.80,9749.00,'','','','','','','',NULL,'CK ACBB giới hạn','Độc quyền','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',8539.00,9209.00,'18/11/2025','https://drive.google.com/drive/folders/1Hd8Iuk0F1JaRSVqyR58Ifbw4LDtDj-2x','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('63','KĐ8-63',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',21487858454.00,'KINH ĐÔ','Shophouse','Thô có thang','',108.00,317.50,20733.00,'','','','','','','',NULL,'','Độc quyền','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',18258.00,19590.00,'11/10/2025','https://drive.google.com/drive/folders/1Hgt58XAO01e4BRkM5JMS1cngiGeG198y','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('64','KĐ8-109',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',28040690213.00,'KINH ĐÔ','Shophouse','Hoàn Thiện\n2-3-4-5 ','',84.00,316.60,23427.00,'','','','','','','',NULL,'VOS','Độc quyền','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',20654.00,22137.00,'18/11/2025','https://drive.google.com/drive/folders/1-km3BOqE7n1h6xKEq96QWvalQaNlMCOA?usp=drive_link','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('65','KĐ8-139',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',24051535051.00,'KINH ĐÔ','Shophouse','Hoàn Thiện\n2-3-4-5 ','',84.00,316.60,20097.00,'','','','','','','',NULL,'VOS','Độc quyền','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',17719.00,18991.00,'18/11/2025','https://drive.google.com/drive/folders/1_NxNLhJ9HCjqCQmTKbPBvviN23nwq4nd?usp=drive_link','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('66','ĐĐD-42',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',22135000000.00,'ĐƯỜNG ĐẠI DƯƠNG','','','',80.00,330.10,18694.00,'','','','','','','',NULL,'Tặng 10 cây vàng \nCK vào giá','Độc quyền','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',16646.00,0.00,'15/9/2025','https://drive.google.com/drive/folders/1RWkxqgZ7_KheQK9x-3zyQA4zGfceMOFY','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('67','VTĐ8-53',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',38356469425.00,'VỊNH THIÊN ĐƯỜNG','Shophouse','Thô','',144.00,443.00,35140.00,'','','','','','','',NULL,'Đã có CTCN','Độc quyền','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',30924.00,33192.00,'18/11/2025','https://drive.google.com/drive/folders/1ApRtYZSUb29H4pHbHmFxv95eeX4sZ0m6','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('68','AD10-29',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',21991454157.00,'ÁNH DƯƠNG','Biệt thự tứ lập','Thô','',120.00,284.50,21218.00,'','','','','','','',NULL,'Đã có CTCN','Độc quyền','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',18681.00,20046.00,'11/10/2025','https://drive.google.com/drive/folders/18-eo0GL9enaWFLn_1ULrwKo3JH-pq0Cc','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('69','AD19-16',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',14371601490.00,'ÁNH DƯƠNG','Liền kề','Thô','',96.00,248.30,13167.00,'','','','','','','',NULL,'Đã có CTCN','Độc quyền','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',11589.00,12438.00,'18/11/2025','https://drive.google.com/drive/folders/1yj8pZ8w7EeGSxG3S2ndG5zTBMDzLHHGR','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('7','KĐ6-15',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',31529593978.00,'KĐAS','SL','Thô không thang','',150.00,355.90,28897.00,'Vinpearl + Vinmec + MPDV','','','VBCN','VTB','','','2025-10-15 00:00:00','','Quỹ ĐQ','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',25400.00,27302.00,'18/11','https://bom.so/KRKEAH','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('70','AD6-82',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',19804854409.00,'ÁNH DƯƠNG','Shophouse','Thô','',100.00,383.90,19108.00,'','','','','','','',NULL,'Đã giải chấp','Độc quyền','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',16825.00,18053.00,'11/10/2025','https://drive.google.com/drive/folders/1XTgxSv1QPhfB3W5h8zTiRhYr6nUFmrCl','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('71','TĐ7-09',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',16455868745.00,'THỜI ĐẠI','Liền kề','Hoàn Thiện 5T','',60.00,235.50,13469.00,'','','','','','','',NULL,'Đã có CTCN          Chưa cho thuê','Độc quyền','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',11860.00,12726.00,'18/11/2025','https://drive.google.com/drive/folders/155TT-0jQBzRxawOc23IvzHb0D8QbpMqI','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('72','SH24-20',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',36177355899.00,'SAN HÔ','Shophouse','Thô không thang','',120.00,448.00,31614.00,'','','','','','','',NULL,'CK ACBB giới hạn','Check admin','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',27865.00,29874.00,'18/11/2025','https://drive.google.com/drive/folders/1e89XMDDqwwtfl2gXyxzC8VTE7fCW2BoM','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('73','SH7-23',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',29792440257.00,'SAN HÔ','Shophouse','Thô có thang','',135.00,405.10,26030.00,'','','','','','','',NULL,'CK ACBB giới hạn','Check admin','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',22939.00,24595.00,'18/11/2025','https://drive.google.com/drive/folders/1drqfpzNO3Tzps10z41PgOxzMCxhhOZm_','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('74','SH7-24',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',30409055330.00,'SAN HÔ','Shophouse','Thô có thang','',144.00,436.80,26566.00,'','','','','','','',NULL,'CK ACBB giới hạn','Check admin','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',23408.00,25100.00,'18/11/2025','https://drive.google.com/drive/folders/1mml0dqF6qv4o9TidnNwn6WIQz-UQui83','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('75','AD6-46',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',25726883403.00,'ÁNH DƯƠNG','Shophouse','Thô','',140.00,378.00,23575.00,'','','','','','','',NULL,'Đã giải chấp','Check admin','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',20755.00,22272.00,'18/11/2025','https://drive.google.com/drive/folders/1hT6QUmehMLXRy0e5eOeh0_CW0QCcXbGT','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('76','AD6-70',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',25914896687.00,'ÁNH DƯƠNG','Shophouse','Thô','',140.00,378.00,23747.00,'','','','','','','',NULL,'Đã giải chấp','Check admin','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',20907.00,22435.00,'18/11/2025','https://drive.google.com/drive/folders/1GbVU4IXjZ4u9L914IrUwE22kNGoeL844','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('77','ĐLBM-165',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',27585380749.00,'ĐẠI LỘ BỐN MÙA','Shophouse','Thô','',110.00,401.30,25284.00,'','','','','','','',NULL,'Đã giải chấp','Check admin','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',22267.00,23890.00,'18/11/2025','https://drive.google.com/drive/folders/1OYbY5I-1Cvwv5I7GLMVKa7y2dxiy9joa','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('78','ĐLBM-167',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',27585380749.00,'ĐẠI LỘ BỐN MÙA','Shophouse','Thô','',110.00,401.30,25284.00,'','','','','','','',NULL,'Đã giải chấp','Check admin','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',22267.00,23890.00,'18/11/2025','https://drive.google.com/drive/folders/1rKAn-aA0xjUeVEMZaizXoZhGNiXkX1sF','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('79','ĐĐD-44',0,NULL,'2025-12-04 11:05:52','2025-12-04 11:05:52',21815000000.00,'ĐƯỜNG ĐẠI DƯƠNG','','','',80.00,324.00,18405.00,'','','','','','','',NULL,'Tặng 10 cây vàng \nCK vào giá','Check admin','DatViet','Đất Việt OCP23','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=637306002#gid=637306002',16387.00,0.00,'15/9/2025','https://drive.google.com/drive/folders/1hX0RxQqjwZHnLfGDgBXl7A1_UQIRM770','2025-12-04 11:05:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8','KĐ6-86',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',36104664944.00,'KĐAS','SL','Thô có thang','',153.00,351.10,33090.00,'Vinpearl + Vinmec \nVOS + Tân Gia','','','VBCN','TCB','','','2025-10-15 00:00:00','','Quỹ ĐQ','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',29085.00,31264.00,'18/11','https://bom.so/qylYds','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('80','SH4-10',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',26717067956.00,'San Hô','Shophouse','Thô có thang','',136.00,357.60,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('81','SH9-03',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',18114523588.00,'San Hô','Liền kề','Thô có thang','',96.00,342.20,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('82','SH10-49',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',16920408876.00,'San Hô','Liền kề','Thô có thang','',96.00,342.20,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('83','SH11-03',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',18114523588.00,'San Hô','Liền kề','Thô có thang','',96.00,342.20,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('84','SH12-03',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',18387367725.00,'San Hô','Liền kề','Thô có thang','',96.00,342.20,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('85','SH20-49',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',16844406838.00,'San Hô','Liền kề','Thô có thang','',98.00,285.70,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('86','SH22-59',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',14033465028.00,'San Hô','Liền kề','Thô loại 1','',72.00,192.20,0.00,'','','','','','VBCN_AN HƯNG_VCB','VBCN_AN HƯNG_VCB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('87','SH22-11',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',14041822579.00,'San Hô','Liền kề','Thô loại 1','',72.00,192.70,0.00,'','','','','','VBCN_AN HƯNG_TCB','VBCN_AN HƯNG_TCB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('88','SH20-10',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',10316962275.00,'San Hô','Liền kề','Thô loại 1','',48.00,192.00,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('89','SH20-74',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',10316962275.00,'San Hô','Liền kề','Thô loại 1','',48.00,192.00,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('9','KĐ8-107',0,NULL,'2025-12-04 10:56:26','2025-12-04 11:05:36',28035672165.00,'KĐAS','Shophouse','Hoàn thiện\nchưa có khách thuê','',84.00,317.00,21487.00,'Vinpearl + Vinmec \nVOS + Tân Gia','','','VBCN','TCB','','','2025-10-15 00:00:00','','Quỹ ĐQ','MDL','MDL OCP2','https://docs.google.com/spreadsheets/d/1Ug7YKmct2VdKEmP5y4osGpZKJkcsfzZux_KyUrmHBCQ/edit?gid=644276200#gid=644276200',18890.00,20304.00,'18/11','https://bom.so/27or3S','2025-12-04 11:05:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('90','SH22-49',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',10318503973.00,'San Hô','Liền kề','Thô loại 1','',48.00,183.80,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('91','SH20-22',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',10326903358.00,'San Hô','Liền kề','Thô loại 1','',48.00,192.00,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('92','SH20-08',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',10345750864.00,'San Hô','Liền kề','Thô loại 1','',48.00,183.80,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('93','SH22-39',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',10348120324.00,'San Hô','Liền kề','Thô loại 1','',48.00,183.80,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('94','SH22-41',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',10348120324.00,'San Hô','Liền kề','Thô loại 1','',48.00,183.80,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('95','SH20-18',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',12360877456.00,'276 căn Leasing','Liền kề','Hoàn thiện','',48.00,183.80,0.00,'','','','','','VBCN_AN HƯNG_TCB','VBCN_AN HƯNG_TCB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('96','SH22-65',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',10467478472.00,'','Shophouse','Thô loại 1','',48.00,183.80,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('97','SH22-57',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',10349002785.00,'','Liền kề','Thô loại 1','',48.00,183.80,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('98','SH22-33',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',10467478472.00,'','Liền kề','Thô loại 1','',48.00,183.80,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('99','SH22-31',0,NULL,'2025-12-04 11:06:03','2025-12-04 11:06:03',10467478472.00,'','Liền kề','Thô loại 1','',48.00,183.80,0.00,'','','','','','HĐMB','HĐMB',NULL,'','','DatViet','Đất Việt quỹ chung 2','https://docs.google.com/spreadsheets/d/18myJM1bcuRYM0f3s8siAysu5CGOCJREHqpGgGhTOdqQ/edit?gid=798202026#gid=798202026',0.00,0.00,'','','2025-12-04 11:06:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `c_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `call`
--

DROP TABLE IF EXISTS `call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `call` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Planned',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `direction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Outbound',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `parent_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DATE_START_STATUS` (`date_start`,`status`),
  KEY `IDX_DATE_START` (`date_start`,`deleted`),
  KEY `IDX_STATUS` (`status`,`deleted`),
  KEY `IDX_ASSIGNED_USER` (`assigned_user_id`,`deleted`),
  KEY `IDX_ASSIGNED_USER_STATUS` (`assigned_user_id`,`status`),
  KEY `IDX_UID` (`uid`),
  KEY `IDX_PARENT` (`parent_id`,`parent_type`),
  KEY `IDX_ACCOUNT_ID` (`account_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_ASSIGNED_USER_ID` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call`
--

LOCK TABLES `call` WRITE;
/*!40000 ALTER TABLE `call` DISABLE KEYS */;
/*!40000 ALTER TABLE `call` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `call_contact`
--

DROP TABLE IF EXISTS `call_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `call_contact` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `call_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'None',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CALL_ID_CONTACT_ID` (`call_id`,`contact_id`),
  KEY `IDX_CALL_ID` (`call_id`),
  KEY `IDX_CONTACT_ID` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call_contact`
--

LOCK TABLES `call_contact` WRITE;
/*!40000 ALTER TABLE `call_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `call_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `call_lead`
--

DROP TABLE IF EXISTS `call_lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `call_lead` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `call_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lead_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'None',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CALL_ID_LEAD_ID` (`call_id`,`lead_id`),
  KEY `IDX_CALL_ID` (`call_id`),
  KEY `IDX_LEAD_ID` (`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call_lead`
--

LOCK TABLES `call_lead` WRITE;
/*!40000 ALTER TABLE `call_lead` DISABLE KEYS */;
/*!40000 ALTER TABLE `call_lead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `call_user`
--

DROP TABLE IF EXISTS `call_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `call_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `call_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'None',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_USER_ID_CALL_ID` (`user_id`,`call_id`),
  KEY `IDX_USER_ID` (`user_id`),
  KEY `IDX_CALL_ID` (`call_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call_user`
--

LOCK TABLES `call_user` WRITE;
/*!40000 ALTER TABLE `call_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `call_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Planning',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Email',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `mail_merge_only_with_address` tinyint(1) NOT NULL DEFAULT '1',
  `budget_currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contacts_template_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leads_template_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accounts_template_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_template_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_AT` (`created_at`,`deleted`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_ASSIGNED_USER_ID` (`assigned_user_id`),
  KEY `IDX_CONTACTS_TEMPLATE_ID` (`contacts_template_id`),
  KEY `IDX_LEADS_TEMPLATE_ID` (`leads_template_id`),
  KEY `IDX_ACCOUNTS_TEMPLATE_ID` (`accounts_template_id`),
  KEY `IDX_USERS_TEMPLATE_ID` (`users_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_log_record`
--

DROP TABLE IF EXISTS `campaign_log_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_log_record` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_date` datetime DEFAULT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `string_data` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `string_additional_data` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `application` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Espo',
  `created_at` datetime DEFAULT NULL,
  `is_test` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `queue_item_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ACTION_DATE` (`action_date`,`deleted`),
  KEY `IDX_ACTION` (`action`,`deleted`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_CAMPAIGN_ID` (`campaign_id`),
  KEY `IDX_PARENT` (`parent_id`,`parent_type`),
  KEY `IDX_OBJECT` (`object_id`,`object_type`),
  KEY `IDX_QUEUE_ITEM_ID` (`queue_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_log_record`
--

LOCK TABLES `campaign_log_record` WRITE;
/*!40000 ALTER TABLE `campaign_log_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_log_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_target_list`
--

DROP TABLE IF EXISTS `campaign_target_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_target_list` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `campaign_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_list_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CAMPAIGN_ID_TARGET_LIST_ID` (`campaign_id`,`target_list_id`),
  KEY `IDX_CAMPAIGN_ID` (`campaign_id`),
  KEY `IDX_TARGET_LIST_ID` (`target_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_target_list`
--

LOCK TABLES `campaign_target_list` WRITE;
/*!40000 ALTER TABLE `campaign_target_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_target_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_target_list_excluding`
--

DROP TABLE IF EXISTS `campaign_target_list_excluding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_target_list_excluding` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `campaign_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_list_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CAMPAIGN_ID_TARGET_LIST_ID` (`campaign_id`,`target_list_id`),
  KEY `IDX_CAMPAIGN_ID` (`campaign_id`),
  KEY `IDX_TARGET_LIST_ID` (`target_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_target_list_excluding`
--

LOCK TABLES `campaign_target_list_excluding` WRITE;
/*!40000 ALTER TABLE `campaign_target_list_excluding` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_target_list_excluding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_tracking_url`
--

DROP TABLE IF EXISTS `campaign_tracking_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_tracking_url` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Redirect',
  `message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `modified_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `campaign_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CAMPAIGN_ID` (`campaign_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_tracking_url`
--

LOCK TABLES `campaign_tracking_url` WRITE;
/*!40000 ALTER TABLE `campaign_tracking_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_tracking_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case`
--

DROP TABLE IF EXISTS `case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `number` int unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'New',
  `priority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Normal',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_internal` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `stream_updated_at` datetime DEFAULT NULL,
  `account_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lead_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inbound_email_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_number` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_NUMBER` (`number`),
  KEY `IDX_STATUS` (`status`,`deleted`),
  KEY `IDX_ASSIGNED_USER` (`assigned_user_id`,`deleted`),
  KEY `IDX_ASSIGNED_USER_STATUS` (`assigned_user_id`,`status`),
  KEY `IDX_ACCOUNT_ID` (`account_id`),
  KEY `IDX_LEAD_ID` (`lead_id`),
  KEY `IDX_CONTACT_ID` (`contact_id`),
  KEY `IDX_INBOUND_EMAIL_ID` (`inbound_email_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_ASSIGNED_USER_ID` (`assigned_user_id`),
  FULLTEXT KEY `IDX_SYSTEM_FULL_TEXT_SEARCH` (`name`,`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case`
--

LOCK TABLES `case` WRITE;
/*!40000 ALTER TABLE `case` DISABLE KEYS */;
/*!40000 ALTER TABLE `case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_contact`
--

DROP TABLE IF EXISTS `case_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_contact` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `case_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CASE_ID_CONTACT_ID` (`case_id`,`contact_id`),
  KEY `IDX_CASE_ID` (`case_id`),
  KEY `IDX_CONTACT_ID` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_contact`
--

LOCK TABLES `case_contact` WRITE;
/*!40000 ALTER TABLE `case_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `case_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_knowledge_base_article`
--

DROP TABLE IF EXISTS `case_knowledge_base_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_knowledge_base_article` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `case_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `knowledge_base_article_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CASE_ID_KNOWLEDGE_BASE_ARTICLE_ID` (`case_id`,`knowledge_base_article_id`),
  KEY `IDX_CASE_ID` (`case_id`),
  KEY `IDX_KNOWLEDGE_BASE_ARTICLE_ID` (`knowledge_base_article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_knowledge_base_article`
--

LOCK TABLES `case_knowledge_base_article` WRITE;
/*!40000 ALTER TABLE `case_knowledge_base_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `case_knowledge_base_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `salutation_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `do_not_call` tinyint(1) NOT NULL DEFAULT '0',
  `address_street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_postal_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `middle_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stream_updated_at` datetime DEFAULT NULL,
  `account_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CREATED_AT_ID` (`created_at`,`id`),
  KEY `IDX_CREATED_AT` (`created_at`,`deleted`),
  KEY `IDX_FIRST_NAME` (`first_name`,`deleted`),
  KEY `IDX_NAME` (`first_name`,`last_name`),
  KEY `IDX_ASSIGNED_USER` (`assigned_user_id`,`deleted`),
  KEY `IDX_ACCOUNT_ID` (`account_id`),
  KEY `IDX_CAMPAIGN_ID` (`campaign_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_ASSIGNED_USER_ID` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_document`
--

DROP TABLE IF EXISTS `contact_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_document` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contact_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CONTACT_ID_DOCUMENT_ID` (`contact_id`,`document_id`),
  KEY `IDX_CONTACT_ID` (`contact_id`),
  KEY `IDX_DOCUMENT_ID` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_document`
--

LOCK TABLES `contact_document` WRITE;
/*!40000 ALTER TABLE `contact_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_meeting`
--

DROP TABLE IF EXISTS `contact_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_meeting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contact_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meeting_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'None',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CONTACT_ID_MEETING_ID` (`contact_id`,`meeting_id`),
  KEY `IDX_CONTACT_ID` (`contact_id`),
  KEY `IDX_MEETING_ID` (`meeting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_meeting`
--

LOCK TABLES `contact_meeting` WRITE;
/*!40000 ALTER TABLE `contact_meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_opportunity`
--

DROP TABLE IF EXISTS `contact_opportunity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_opportunity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contact_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opportunity_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CONTACT_ID_OPPORTUNITY_ID` (`contact_id`,`opportunity_id`),
  KEY `IDX_CONTACT_ID` (`contact_id`),
  KEY `IDX_OPPORTUNITY_ID` (`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_opportunity`
--

LOCK TABLES `contact_opportunity` WRITE;
/*!40000 ALTER TABLE `contact_opportunity` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_opportunity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_target_list`
--

DROP TABLE IF EXISTS `contact_target_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_target_list` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contact_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_list_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opted_out` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CONTACT_ID_TARGET_LIST_ID` (`contact_id`,`target_list_id`),
  KEY `IDX_CONTACT_ID` (`contact_id`),
  KEY `IDX_TARGET_LIST_ID` (`target_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_target_list`
--

LOCK TABLES `contact_target_list` WRITE;
/*!40000 ALTER TABLE `contact_target_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_target_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `id` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES ('VND',1);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_template`
--

DROP TABLE IF EXISTS `dashboard_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_template` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `layout` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dashlets_options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_template`
--

LOCK TABLES `dashboard_template` WRITE;
/*!40000 ALTER TABLE `dashboard_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `file_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_ASSIGNED_USER_ID` (`assigned_user_id`),
  KEY `IDX_FOLDER_ID` (`folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_folder`
--

DROP TABLE IF EXISTS `document_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_folder` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_folder`
--

LOCK TABLES `document_folder` WRITE;
/*!40000 ALTER TABLE `document_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_folder_path`
--

DROP TABLE IF EXISTS `document_folder_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_folder_path` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ascendor_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descendor_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ASCENDOR_ID` (`ascendor_id`),
  KEY `IDX_DESCENDOR_ID` (`descendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_folder_path`
--

LOCK TABLES `document_folder_path` WRITE;
/*!40000 ALTER TABLE `document_folder_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_folder_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_lead`
--

DROP TABLE IF EXISTS `document_lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_lead` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `document_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lead_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_DOCUMENT_ID_LEAD_ID` (`document_id`,`lead_id`),
  KEY `IDX_DOCUMENT_ID` (`document_id`),
  KEY `IDX_LEAD_ID` (`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_lead`
--

LOCK TABLES `document_lead` WRITE;
/*!40000 ALTER TABLE `document_lead` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_lead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_opportunity`
--

DROP TABLE IF EXISTS `document_opportunity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_opportunity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `document_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opportunity_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_DOCUMENT_ID_OPPORTUNITY_ID` (`document_id`,`opportunity_id`),
  KEY `IDX_DOCUMENT_ID` (`document_id`),
  KEY `IDX_OPPORTUNITY_ID` (`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_opportunity`
--

LOCK TABLES `document_opportunity` WRITE;
/*!40000 ALTER TABLE `document_opportunity` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_opportunity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `from_string` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply_to_string` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_name_map` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_replied` tinyint(1) NOT NULL DEFAULT '0',
  `message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message_id_internal` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body_plain` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_html` tinyint(1) NOT NULL DEFAULT '1',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Archived',
  `has_attachment` tinyint(1) NOT NULL DEFAULT '0',
  `date_sent` datetime DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `send_at` datetime DEFAULT NULL,
  `is_auto_reply` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `ics_contents` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ics_event_uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_status_folder` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email_address_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `replied_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_event_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_event_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_folder_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_DATE_SENT` (`date_sent`,`deleted`),
  KEY `IDX_DATE_SENT_STATUS` (`date_sent`,`status`,`deleted`),
  KEY `IDX_MESSAGE_ID` (`message_id`),
  KEY `IDX_ICS_EVENT_UID` (`ics_event_uid`),
  KEY `IDX_GROUP_STATUS_FOLDER` (`group_status_folder`),
  KEY `IDX_FROM_EMAIL_ADDRESS_ID` (`from_email_address_id`),
  KEY `IDX_PARENT` (`parent_id`,`parent_type`),
  KEY `IDX_SENT_BY_ID` (`sent_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_ASSIGNED_USER_ID` (`assigned_user_id`),
  KEY `IDX_REPLIED_ID` (`replied_id`),
  KEY `IDX_CREATED_EVENT` (`created_event_id`,`created_event_type`),
  KEY `IDX_GROUP_FOLDER_ID` (`group_folder_id`),
  KEY `IDX_ACCOUNT_ID` (`account_id`),
  FULLTEXT KEY `IDX_SYSTEM_FULL_TEXT_SEARCH` (`name`,`body_plain`,`body`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_account`
--

DROP TABLE IF EXISTS `email_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_account` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `email_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` int DEFAULT '993',
  `security` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SSL',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monitored_folders` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sent_folder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_sent_emails` tinyint(1) NOT NULL DEFAULT '0',
  `keep_fetched_emails_unread` tinyint(1) NOT NULL DEFAULT '0',
  `fetch_since` date DEFAULT NULL,
  `fetch_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `connected_at` datetime DEFAULT NULL,
  `use_imap` tinyint(1) NOT NULL DEFAULT '1',
  `use_smtp` tinyint(1) NOT NULL DEFAULT '0',
  `smtp_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_port` int DEFAULT '587',
  `smtp_auth` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_security` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'TLS',
  `smtp_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_auth_mechanism` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'login',
  `imap_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_folder_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EMAIL_FOLDER_ID` (`email_folder_id`),
  KEY `IDX_ASSIGNED_USER_ID` (`assigned_user_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_account`
--

LOCK TABLES `email_account` WRITE;
/*!40000 ALTER TABLE `email_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_address`
--

DROP TABLE IF EXISTS `email_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_address` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `lower` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invalid` tinyint(1) NOT NULL DEFAULT '0',
  `opt_out` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_LOWER` (`lower`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_address`
--

LOCK TABLES `email_address` WRITE;
/*!40000 ALTER TABLE `email_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_email_account`
--

DROP TABLE IF EXISTS `email_email_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_email_account` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_account_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_EMAIL_ID_EMAIL_ACCOUNT_ID` (`email_id`,`email_account_id`),
  KEY `IDX_EMAIL_ID` (`email_id`),
  KEY `IDX_EMAIL_ACCOUNT_ID` (`email_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_email_account`
--

LOCK TABLES `email_email_account` WRITE;
/*!40000 ALTER TABLE `email_email_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_email_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_email_address`
--

DROP TABLE IF EXISTS `email_email_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_email_address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_address_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_EMAIL_ID_EMAIL_ADDRESS_ID_ADDRESS_TYPE` (`email_id`,`email_address_id`,`address_type`),
  KEY `IDX_EMAIL_ID` (`email_id`),
  KEY `IDX_EMAIL_ADDRESS_ID` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_email_address`
--

LOCK TABLES `email_email_address` WRITE;
/*!40000 ALTER TABLE `email_email_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_email_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_filter`
--

DROP TABLE IF EXISTS `email_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_filter` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body_contains` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body_contains_all` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Skip',
  `mark_as_read` tinyint(1) NOT NULL DEFAULT '0',
  `skip_notification` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `parent_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_folder_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_email_folder_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_PARENT` (`parent_id`,`parent_type`),
  KEY `IDX_EMAIL_FOLDER_ID` (`email_folder_id`),
  KEY `IDX_GROUP_EMAIL_FOLDER_ID` (`group_email_folder_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_filter`
--

LOCK TABLES `email_filter` WRITE;
/*!40000 ALTER TABLE `email_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_folder`
--

DROP TABLE IF EXISTS `email_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_folder` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `order` int DEFAULT NULL,
  `skip_notifications` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `assigned_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ASSIGNED_USER_ID` (`assigned_user_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_folder`
--

LOCK TABLES `email_folder` WRITE;
/*!40000 ALTER TABLE `email_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_inbound_email`
--

DROP TABLE IF EXISTS `email_inbound_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_inbound_email` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inbound_email_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_EMAIL_ID_INBOUND_EMAIL_ID` (`email_id`,`inbound_email_id`),
  KEY `IDX_EMAIL_ID` (`email_id`),
  KEY `IDX_INBOUND_EMAIL_ID` (`inbound_email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_inbound_email`
--

LOCK TABLES `email_inbound_email` WRITE;
/*!40000 ALTER TABLE `email_inbound_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_inbound_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_queue_item`
--

DROP TABLE IF EXISTS `email_queue_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_queue_item` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempt_count` int DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `email_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_test` tinyint(1) NOT NULL DEFAULT '0',
  `mass_email_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_SENT_AT` (`sent_at`),
  KEY `IDX_MASS_EMAIL_ID` (`mass_email_id`),
  KEY `IDX_TARGET` (`target_id`,`target_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_queue_item`
--

LOCK TABLES `email_queue_item` WRITE;
/*!40000 ALTER TABLE `email_queue_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_queue_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_template` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_html` tinyint(1) NOT NULL DEFAULT '1',
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `one_off` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `category_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_number` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CATEGORY_ID` (`category_id`),
  KEY `IDX_ASSIGNED_USER_ID` (`assigned_user_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_template`
--

LOCK TABLES `email_template` WRITE;
/*!40000 ALTER TABLE `email_template` DISABLE KEYS */;
INSERT INTO `email_template` VALUES ('6939a9d357799a54f','Case-to-Email auto-reply',0,'Case has been created','<p>{Person.name},</p><p>Case \'{Case.name}\' has been created with number {Case.number} and assigned to {User.name}.</p>',1,'Active',0,'2025-12-10 17:11:47','2025-12-10 17:11:47',NULL,NULL,'system',NULL,1);
/*!40000 ALTER TABLE `email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_template_category`
--

DROP TABLE IF EXISTS `email_template_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_template_category` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `order` int DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_template_category`
--

LOCK TABLES `email_template_category` WRITE;
/*!40000 ALTER TABLE `email_template_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_template_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_template_category_path`
--

DROP TABLE IF EXISTS `email_template_category_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_template_category_path` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ascendor_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descendor_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ASCENDOR_ID` (`ascendor_id`),
  KEY `IDX_DESCENDOR_ID` (`descendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_template_category_path`
--

LOCK TABLES `email_template_category_path` WRITE;
/*!40000 ALTER TABLE `email_template_category_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_template_category_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_user`
--

DROP TABLE IF EXISTS `email_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `is_important` tinyint(1) DEFAULT '0',
  `in_trash` tinyint(1) DEFAULT '0',
  `in_archive` tinyint(1) DEFAULT '0',
  `folder_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_EMAIL_ID_USER_ID` (`email_id`,`user_id`),
  KEY `IDX_EMAIL_ID` (`email_id`),
  KEY `IDX_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_user`
--

LOCK TABLES `email_user` WRITE;
/*!40000 ALTER TABLE `email_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_email_address`
--

DROP TABLE IF EXISTS `entity_email_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_email_address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `entity_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_address_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_ENTITY_ID_EMAIL_ADDRESS_ID_ENTITY_TYPE` (`entity_id`,`email_address_id`,`entity_type`),
  KEY `IDX_ENTITY_ID` (`entity_id`),
  KEY `IDX_EMAIL_ADDRESS_ID` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_email_address`
--

LOCK TABLES `entity_email_address` WRITE;
/*!40000 ALTER TABLE `entity_email_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_email_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_phone_number`
--

DROP TABLE IF EXISTS `entity_phone_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_phone_number` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `entity_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_ENTITY_ID_PHONE_NUMBER_ID_ENTITY_TYPE` (`entity_id`,`phone_number_id`,`entity_type`),
  KEY `IDX_ENTITY_ID` (`entity_id`),
  KEY `IDX_PHONE_NUMBER_ID` (`phone_number_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_phone_number`
--

LOCK TABLES `entity_phone_number` WRITE;
/*!40000 ALTER TABLE `entity_phone_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_phone_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_team`
--

DROP TABLE IF EXISTS `entity_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_team` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `entity_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_ENTITY_ID_TEAM_ID_ENTITY_TYPE` (`entity_id`,`team_id`,`entity_type`),
  KEY `IDX_ENTITY_ID` (`entity_id`),
  KEY `IDX_TEAM_ID` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_team`
--

LOCK TABLES `entity_team` WRITE;
/*!40000 ALTER TABLE `entity_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_user`
--

DROP TABLE IF EXISTS `entity_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `entity_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_ENTITY_ID_USER_ID_ENTITY_TYPE` (`entity_id`,`user_id`,`entity_type`),
  KEY `IDX_ENTITY_ID` (`entity_id`),
  KEY `IDX_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_user`
--

LOCK TABLES `entity_user` WRITE;
/*!40000 ALTER TABLE `entity_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export`
--

DROP TABLE IF EXISTS `export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `export` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `notify_on_finish` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_ATTACHMENT` (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export`
--

LOCK TABLES `export` WRITE;
/*!40000 ALTER TABLE `export` DISABLE KEYS */;
/*!40000 ALTER TABLE `export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extension`
--

DROP TABLE IF EXISTS `extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_list` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `license_status` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_status_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_installed` tinyint(1) NOT NULL DEFAULT '0',
  `check_version_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_LICENSE_STATUS` (`license_status`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extension`
--

LOCK TABLES `extension` WRITE;
/*!40000 ALTER TABLE `extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_account`
--

DROP TABLE IF EXISTS `external_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_account` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_account`
--

LOCK TABLES `external_account` WRITE;
/*!40000 ALTER TABLE `external_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_email_folder`
--

DROP TABLE IF EXISTS `group_email_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_email_folder` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `order` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_email_folder`
--

LOCK TABLES `group_email_folder` WRITE;
/*!40000 ALTER TABLE `group_email_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_email_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_email_folder_team`
--

DROP TABLE IF EXISTS `group_email_folder_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_email_folder_team` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_email_folder_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_GROUP_EMAIL_FOLDER_ID_TEAM_ID` (`group_email_folder_id`,`team_id`),
  KEY `IDX_GROUP_EMAIL_FOLDER_ID` (`group_email_folder_id`),
  KEY `IDX_TEAM_ID` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_email_folder_team`
--

LOCK TABLES `group_email_folder_team` WRITE;
/*!40000 ALTER TABLE `group_email_folder_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_email_folder_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import`
--

DROP TABLE IF EXISTS `import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `entity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_index` int DEFAULT NULL,
  `params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attribute_list` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `file_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import`
--

LOCK TABLES `import` WRITE;
/*!40000 ALTER TABLE `import` DISABLE KEYS */;
/*!40000 ALTER TABLE `import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_entity`
--

DROP TABLE IF EXISTS `import_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_entity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) DEFAULT '0',
  `is_imported` tinyint(1) NOT NULL DEFAULT '0',
  `is_updated` tinyint(1) NOT NULL DEFAULT '0',
  `is_duplicate` tinyint(1) NOT NULL DEFAULT '0',
  `entity_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ENTITY_IMPORT` (`import_id`,`entity_type`),
  KEY `IDX_ENTITY` (`entity_id`,`entity_type`),
  KEY `IDX_IMPORT` (`import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_entity`
--

LOCK TABLES `import_entity` WRITE;
/*!40000 ALTER TABLE `import_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_error`
--

DROP TABLE IF EXISTS `import_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_error` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `row_index` int DEFAULT NULL,
  `export_row_index` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validation_failures` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `row` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `import_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ROW_INDEX` (`row_index`),
  KEY `IDX_IMPORT_ROW_INDEX` (`import_id`,`row_index`),
  KEY `IDX_IMPORT_ID` (`import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_error`
--

LOCK TABLES `import_error` WRITE;
/*!40000 ALTER TABLE `import_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email`
--

DROP TABLE IF EXISTS `inbound_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inbound_email` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `email_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` int DEFAULT '993',
  `security` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SSL',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monitored_folders` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fetch_since` date DEFAULT NULL,
  `fetch_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `add_all_team_users` tinyint(1) NOT NULL DEFAULT '1',
  `sent_folder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_sent_emails` tinyint(1) NOT NULL DEFAULT '0',
  `keep_fetched_emails_unread` tinyint(1) NOT NULL DEFAULT '0',
  `connected_at` datetime DEFAULT NULL,
  `exclude_from_reply` tinyint(1) NOT NULL DEFAULT '0',
  `use_imap` tinyint(1) NOT NULL DEFAULT '1',
  `use_smtp` tinyint(1) NOT NULL DEFAULT '0',
  `smtp_is_shared` tinyint(1) NOT NULL DEFAULT '0',
  `smtp_is_for_mass_email` tinyint(1) NOT NULL DEFAULT '0',
  `smtp_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_port` int DEFAULT '587',
  `smtp_auth` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_security` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'TLS',
  `smtp_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_auth_mechanism` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'login',
  `create_case` tinyint(1) NOT NULL DEFAULT '0',
  `case_distribution` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Direct-Assignment',
  `target_user_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` tinyint(1) NOT NULL DEFAULT '0',
  `reply_from_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply_to_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply_from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imap_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `assign_to_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply_email_template_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_email_folder_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ASSIGN_TO_USER_ID` (`assign_to_user_id`),
  KEY `IDX_TEAM_ID` (`team_id`),
  KEY `IDX_REPLY_EMAIL_TEMPLATE_ID` (`reply_email_template_id`),
  KEY `IDX_GROUP_EMAIL_FOLDER_ID` (`group_email_folder_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email`
--

LOCK TABLES `inbound_email` WRITE;
/*!40000 ALTER TABLE `inbound_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email_team`
--

DROP TABLE IF EXISTS `inbound_email_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inbound_email_team` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `inbound_email_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_INBOUND_EMAIL_ID_TEAM_ID` (`inbound_email_id`,`team_id`),
  KEY `IDX_INBOUND_EMAIL_ID` (`inbound_email_id`),
  KEY `IDX_TEAM_ID` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email_team`
--

LOCK TABLES `inbound_email_team` WRITE;
/*!40000 ALTER TABLE `inbound_email_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integration`
--

DROP TABLE IF EXISTS `integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integration` (
  `id` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integration`
--

LOCK TABLES `integration` WRITE;
/*!40000 ALTER TABLE `integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `execute_time` datetime DEFAULT NULL,
  `number` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `queue` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_group` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `executed_at` datetime DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `attempts` int DEFAULT NULL,
  `target_id` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failed_attempts` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `scheduled_job_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_NUMBER` (`number`),
  KEY `IDX_EXECUTE_TIME` (`status`,`execute_time`),
  KEY `IDX_STATUS` (`status`,`deleted`),
  KEY `IDX_STATUS_SCHEDULED_JOB_ID` (`status`,`scheduled_job_id`),
  KEY `IDX_SCHEDULED_JOB_ID` (`scheduled_job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=439 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES ('6939a9d36313ab06b','Dummy',0,'Success','2025-12-10 17:11:47',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:11:48',15,1,NULL,NULL,NULL,'2025-12-10 17:11:47','2025-12-10 17:11:48','6939a9d31f7270513'),('6939a9d45995231a3','Submit Popup Reminders',0,'Success','2025-12-10 17:11:48',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:11:48',16,1,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:11:48','6939a9d31c969e5dc'),('6939a9d45a3cc4cff','Process Job Queue q0',0,'Success','2025-12-10 17:11:48',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:11:48',17,1,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:11:48','6939a9d31dd8daa8d'),('6939a9d45b27cb7b0','Process Job Queue q1',0,'Success','2025-12-10 17:12:00',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:08','2025-12-10 17:12:08',24,1,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:12:08','6939a9d31e7ebae65'),('6939a9d45b976f460','Process Job Queue e0',0,'Success','2025-12-10 17:11:48',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:11:48',18,1,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:11:48','6939a9d31f0214517'),('6939a9d45c097357b','Dummy',0,'Pending','2025-12-11 00:01:00',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:11:48','6939a9d31f7270513'),('6939a9d45c6c74045','Check for New Version',0,'Pending','2025-12-11 05:15:00',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:11:48','6939a9d31fd911bc1'),('6939a9d45ce9b2f63','Check for New Versions of Installed Extensions',0,'Pending','2025-12-11 05:25:00',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:11:48','6939a9d320545e318'),('6939a9d45e7a68a0a','Send Email Reminders',0,'Success','2025-12-10 17:12:00',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:08','2025-12-10 17:12:08',25,1,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:12:08','6939a9d35cdbef251'),('6939a9d45ee2c8bc5','Send Email Notifications',0,'Success','2025-12-10 17:12:00',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:08','2025-12-10 17:12:08',26,1,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:12:08','6939a9d35d85d836c'),('6939a9d45f456f9fd','Clean-up',0,'Pending','2025-12-14 01:01:00',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:11:48','6939a9d35e2933618'),('6939a9d45f95b4cd3','Send Mass Emails',0,'Success','2025-12-10 17:30:00',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08',505,1,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:30:08','6939a9d35ed0d18cb'),('6939a9d45fea6bad5','Auth Token Control',0,'Success','2025-12-10 17:12:00',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:08','2025-12-10 17:12:08',27,1,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:12:08','6939a9d35feff1ad8'),('6939a9d460483b5a4','Control Knowledge Base Article Status',0,'Pending','2025-12-11 01:10:00',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:11:48','6939a9d360decd61a'),('6939a9d460a42ad9d','Process Webhook Queue',0,'Success','2025-12-10 17:12:00',15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:08','2025-12-10 17:12:08',28,1,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:12:08','6939a9d361838de09'),('6939a9d460f393596','Send Scheduled Emails',0,'Success','2025-12-10 17:20:00',16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:08','2025-12-10 17:20:08',238,1,NULL,NULL,NULL,'2025-12-10 17:11:48','2025-12-10 17:20:08','6939a9d3623830b3b'),('6939a9de5987b12d0','Submit Popup Reminders',0,'Success','2025-12-10 17:11:58',17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:11:58','2025-12-10 17:11:58',20,1,NULL,NULL,NULL,'2025-12-10 17:11:58','2025-12-10 17:11:58','6939a9d31c969e5dc'),('6939a9de5af83e341','Process Job Queue q0',0,'Success','2025-12-10 17:11:58',18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:11:58','2025-12-10 17:11:58',21,1,NULL,NULL,NULL,'2025-12-10 17:11:58','2025-12-10 17:11:58','6939a9d31dd8daa8d'),('6939a9de5ba1e2a0e','Process Job Queue e0',0,'Success','2025-12-10 17:11:58',19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:11:58','2025-12-10 17:11:58',22,1,NULL,NULL,NULL,'2025-12-10 17:11:58','2025-12-10 17:11:58','6939a9d31f0214517'),('6939a9e858ad6c61f','Submit Popup Reminders',0,'Success','2025-12-10 17:12:08',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:08','2025-12-10 17:12:08',29,1,NULL,NULL,NULL,'2025-12-10 17:12:08','2025-12-10 17:12:08','6939a9d31c969e5dc'),('6939a9e85a7f904d9','Process Job Queue q0',0,'Success','2025-12-10 17:12:08',21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:08','2025-12-10 17:12:08',30,1,NULL,NULL,NULL,'2025-12-10 17:12:08','2025-12-10 17:12:08','6939a9d31dd8daa8d'),('6939a9e85b50cfa9f','Process Job Queue q1',0,'Success','2025-12-10 17:13:00',22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:08','2025-12-10 17:13:08',53,1,NULL,NULL,NULL,'2025-12-10 17:12:08','2025-12-10 17:13:08','6939a9d31e7ebae65'),('6939a9e85bad7a642','Process Job Queue e0',0,'Success','2025-12-10 17:12:08',23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:08','2025-12-10 17:12:08',31,1,NULL,NULL,NULL,'2025-12-10 17:12:08','2025-12-10 17:12:08','6939a9d31f0214517'),('6939a9e85d7d33eaf','Send Email Reminders',0,'Success','2025-12-10 17:14:00',24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:08','2025-12-10 17:14:08',78,1,NULL,NULL,NULL,'2025-12-10 17:12:08','2025-12-10 17:14:08','6939a9d35cdbef251'),('6939a9e85e01b78a9','Send Email Notifications',0,'Success','2025-12-10 17:14:00',25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:08','2025-12-10 17:14:08',79,1,NULL,NULL,NULL,'2025-12-10 17:12:08','2025-12-10 17:14:08','6939a9d35d85d836c'),('6939a9e85e9ddfd51','Auth Token Control',0,'Success','2025-12-10 17:18:00',26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:08','2025-12-10 17:18:08',184,1,NULL,NULL,NULL,'2025-12-10 17:12:08','2025-12-10 17:18:08','6939a9d35feff1ad8'),('6939a9e85f1d83d46','Process Webhook Queue',0,'Success','2025-12-10 17:14:00',27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:08','2025-12-10 17:14:08',80,1,NULL,NULL,NULL,'2025-12-10 17:12:08','2025-12-10 17:14:08','6939a9d361838de09'),('6939a9f257cbe2cdc','Submit Popup Reminders',0,'Success','2025-12-10 17:12:18',28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:18','2025-12-10 17:12:18',33,1,NULL,NULL,NULL,'2025-12-10 17:12:18','2025-12-10 17:12:18','6939a9d31c969e5dc'),('6939a9f25960dd02f','Process Job Queue q0',0,'Success','2025-12-10 17:12:18',29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:18','2025-12-10 17:12:18',34,1,NULL,NULL,NULL,'2025-12-10 17:12:18','2025-12-10 17:12:18','6939a9d31dd8daa8d'),('6939a9f25a071c27d','Process Job Queue e0',0,'Success','2025-12-10 17:12:18',30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:18','2025-12-10 17:12:18',35,1,NULL,NULL,NULL,'2025-12-10 17:12:18','2025-12-10 17:12:18','6939a9d31f0214517'),('6939a9f25a6271c4d','Dummy',0,'Pending','2025-12-11 05:01:00',31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2025-12-10 17:12:18','2025-12-10 17:12:18','6939a9d31f7270513'),('6939a9f25ac21572b','Check for New Version',0,'Pending','2025-12-10 22:15:00',32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2025-12-10 17:12:18','2025-12-10 17:12:18','6939a9d31fd911bc1'),('6939a9f25b3c1aa8c','Check for New Versions of Installed Extensions',0,'Pending','2025-12-10 22:25:00',33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2025-12-10 17:12:18','2025-12-10 17:12:18','6939a9d320545e318'),('6939a9f25ca457d01','Clean-up',0,'Pending','2025-12-13 18:01:00',34,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2025-12-10 17:12:18','2025-12-10 17:12:18','6939a9d35e2933618'),('6939a9f25d567b883','Control Knowledge Base Article Status',0,'Pending','2025-12-10 18:10:00',35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2025-12-10 17:12:18','2025-12-10 17:12:18','6939a9d360decd61a'),('6939a9fc58030324c','Submit Popup Reminders',0,'Success','2025-12-10 17:12:28',36,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:28','2025-12-10 17:12:28',37,1,NULL,NULL,NULL,'2025-12-10 17:12:28','2025-12-10 17:12:28','6939a9d31c969e5dc'),('6939a9fc597990777','Process Job Queue q0',0,'Success','2025-12-10 17:12:28',37,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:28','2025-12-10 17:12:28',38,1,NULL,NULL,NULL,'2025-12-10 17:12:28','2025-12-10 17:12:28','6939a9d31dd8daa8d'),('6939a9fc5a16068ca','Process Job Queue e0',0,'Success','2025-12-10 17:12:28',38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:28','2025-12-10 17:12:28',39,1,NULL,NULL,NULL,'2025-12-10 17:12:28','2025-12-10 17:12:28','6939a9d31f0214517'),('6939aa0658aca9e7e','Submit Popup Reminders',0,'Success','2025-12-10 17:12:38',39,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:38','2025-12-10 17:12:38',41,1,NULL,NULL,NULL,'2025-12-10 17:12:38','2025-12-10 17:12:38','6939a9d31c969e5dc'),('6939aa065a32936bc','Process Job Queue q0',0,'Success','2025-12-10 17:12:38',40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:38','2025-12-10 17:12:38',42,1,NULL,NULL,NULL,'2025-12-10 17:12:38','2025-12-10 17:12:38','6939a9d31dd8daa8d'),('6939aa065ae8dd741','Process Job Queue e0',0,'Success','2025-12-10 17:12:38',41,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:38','2025-12-10 17:12:38',43,1,NULL,NULL,NULL,'2025-12-10 17:12:38','2025-12-10 17:12:38','6939a9d31f0214517'),('6939aa1059c1da788','Submit Popup Reminders',0,'Success','2025-12-10 17:12:48',42,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:48','2025-12-10 17:12:48',45,1,NULL,NULL,NULL,'2025-12-10 17:12:48','2025-12-10 17:12:48','6939a9d31c969e5dc'),('6939aa105a5486734','Process Job Queue q0',0,'Success','2025-12-10 17:12:48',43,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:48','2025-12-10 17:12:48',46,1,NULL,NULL,NULL,'2025-12-10 17:12:48','2025-12-10 17:12:48','6939a9d31dd8daa8d'),('6939aa105af649a17','Process Job Queue e0',0,'Success','2025-12-10 17:12:48',44,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:48','2025-12-10 17:12:48',47,1,NULL,NULL,NULL,'2025-12-10 17:12:48','2025-12-10 17:12:48','6939a9d31f0214517'),('6939aa1a59243b1f7','Submit Popup Reminders',0,'Success','2025-12-10 17:12:58',45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:58','2025-12-10 17:12:58',49,1,NULL,NULL,NULL,'2025-12-10 17:12:58','2025-12-10 17:12:58','6939a9d31c969e5dc'),('6939aa1a5a2fc93a3','Process Job Queue q0',0,'Success','2025-12-10 17:12:58',46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:58','2025-12-10 17:12:58',50,1,NULL,NULL,NULL,'2025-12-10 17:12:58','2025-12-10 17:12:58','6939a9d31dd8daa8d'),('6939aa1a5acb084d4','Process Job Queue e0',0,'Success','2025-12-10 17:12:58',47,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:12:58','2025-12-10 17:12:58',51,1,NULL,NULL,NULL,'2025-12-10 17:12:58','2025-12-10 17:12:58','6939a9d31f0214517'),('6939aa245895fa1cd','Submit Popup Reminders',0,'Success','2025-12-10 17:13:08',48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:08','2025-12-10 17:13:08',54,1,NULL,NULL,NULL,'2025-12-10 17:13:08','2025-12-10 17:13:08','6939a9d31c969e5dc'),('6939aa245a4a5f464','Process Job Queue q0',0,'Success','2025-12-10 17:13:08',49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:08','2025-12-10 17:13:08',55,1,NULL,NULL,NULL,'2025-12-10 17:13:08','2025-12-10 17:13:08','6939a9d31dd8daa8d'),('6939aa245b363e891','Process Job Queue q1',0,'Success','2025-12-10 17:14:00',50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:08','2025-12-10 17:14:08',81,1,NULL,NULL,NULL,'2025-12-10 17:13:08','2025-12-10 17:14:08','6939a9d31e7ebae65'),('6939aa245baa8ed83','Process Job Queue e0',0,'Success','2025-12-10 17:13:08',51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:08','2025-12-10 17:13:08',56,1,NULL,NULL,NULL,'2025-12-10 17:13:08','2025-12-10 17:13:08','6939a9d31f0214517'),('6939aa2e59fbff361','Submit Popup Reminders',0,'Success','2025-12-10 17:13:18',52,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:18','2025-12-10 17:13:18',58,1,NULL,NULL,NULL,'2025-12-10 17:13:18','2025-12-10 17:13:18','6939a9d31c969e5dc'),('6939aa2e5b6222027','Process Job Queue q0',0,'Success','2025-12-10 17:13:18',53,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:18','2025-12-10 17:13:18',59,1,NULL,NULL,NULL,'2025-12-10 17:13:18','2025-12-10 17:13:18','6939a9d31dd8daa8d'),('6939aa2e5c0561d1b','Process Job Queue e0',0,'Success','2025-12-10 17:13:18',54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:18','2025-12-10 17:13:18',60,1,NULL,NULL,NULL,'2025-12-10 17:13:18','2025-12-10 17:13:18','6939a9d31f0214517'),('6939aa385a3db023b','Submit Popup Reminders',0,'Success','2025-12-10 17:13:28',55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:28','2025-12-10 17:13:28',62,1,NULL,NULL,NULL,'2025-12-10 17:13:28','2025-12-10 17:13:28','6939a9d31c969e5dc'),('6939aa385aeb9ecae','Process Job Queue q0',0,'Success','2025-12-10 17:13:28',56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:28','2025-12-10 17:13:28',63,1,NULL,NULL,NULL,'2025-12-10 17:13:28','2025-12-10 17:13:28','6939a9d31dd8daa8d'),('6939aa385bb3ffa16','Process Job Queue e0',0,'Success','2025-12-10 17:13:28',57,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:28','2025-12-10 17:13:28',64,1,NULL,NULL,NULL,'2025-12-10 17:13:28','2025-12-10 17:13:28','6939a9d31f0214517'),('6939aa4259b4452ba','Submit Popup Reminders',0,'Success','2025-12-10 17:13:38',58,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:38','2025-12-10 17:13:38',66,1,NULL,NULL,NULL,'2025-12-10 17:13:38','2025-12-10 17:13:38','6939a9d31c969e5dc'),('6939aa425b11a1159','Process Job Queue q0',0,'Success','2025-12-10 17:13:38',59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:38','2025-12-10 17:13:38',67,1,NULL,NULL,NULL,'2025-12-10 17:13:38','2025-12-10 17:13:38','6939a9d31dd8daa8d'),('6939aa425bb9d8188','Process Job Queue e0',0,'Success','2025-12-10 17:13:38',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:38','2025-12-10 17:13:38',68,1,NULL,NULL,NULL,'2025-12-10 17:13:38','2025-12-10 17:13:38','6939a9d31f0214517'),('6939aa4c5aa7ad6dc','Submit Popup Reminders',0,'Success','2025-12-10 17:13:48',61,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:48','2025-12-10 17:13:48',70,1,NULL,NULL,NULL,'2025-12-10 17:13:48','2025-12-10 17:13:48','6939a9d31c969e5dc'),('6939aa4c5be5e19a6','Process Job Queue q0',0,'Success','2025-12-10 17:13:48',62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:48','2025-12-10 17:13:48',71,1,NULL,NULL,NULL,'2025-12-10 17:13:48','2025-12-10 17:13:48','6939a9d31dd8daa8d'),('6939aa4c5ca791b19','Process Job Queue e0',0,'Success','2025-12-10 17:13:48',63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:48','2025-12-10 17:13:48',72,1,NULL,NULL,NULL,'2025-12-10 17:13:48','2025-12-10 17:13:48','6939a9d31f0214517'),('6939aa56596c93f3b','Submit Popup Reminders',0,'Success','2025-12-10 17:13:58',64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:58','2025-12-10 17:13:58',74,1,NULL,NULL,NULL,'2025-12-10 17:13:58','2025-12-10 17:13:58','6939a9d31c969e5dc'),('6939aa565b032d78a','Process Job Queue q0',0,'Success','2025-12-10 17:13:58',65,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:58','2025-12-10 17:13:58',75,1,NULL,NULL,NULL,'2025-12-10 17:13:58','2025-12-10 17:13:58','6939a9d31dd8daa8d'),('6939aa565b9c1160c','Process Job Queue e0',0,'Success','2025-12-10 17:13:58',66,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:13:58','2025-12-10 17:13:58',76,1,NULL,NULL,NULL,'2025-12-10 17:13:58','2025-12-10 17:13:58','6939a9d31f0214517'),('6939aa605920bb420','Submit Popup Reminders',0,'Success','2025-12-10 17:14:08',67,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:08','2025-12-10 17:14:08',82,1,NULL,NULL,NULL,'2025-12-10 17:14:08','2025-12-10 17:14:08','6939a9d31c969e5dc'),('6939aa605a97e9375','Process Job Queue q0',0,'Success','2025-12-10 17:14:08',68,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:08','2025-12-10 17:14:08',83,1,NULL,NULL,NULL,'2025-12-10 17:14:08','2025-12-10 17:14:08','6939a9d31dd8daa8d'),('6939aa605b41ed598','Process Job Queue q1',0,'Success','2025-12-10 17:15:00',69,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:08','2025-12-10 17:15:08',106,1,NULL,NULL,NULL,'2025-12-10 17:14:08','2025-12-10 17:15:08','6939a9d31e7ebae65'),('6939aa605b88652bb','Process Job Queue e0',0,'Success','2025-12-10 17:14:08',70,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:08','2025-12-10 17:14:08',84,1,NULL,NULL,NULL,'2025-12-10 17:14:08','2025-12-10 17:14:08','6939a9d31f0214517'),('6939aa605ca260cce','Send Email Reminders',0,'Success','2025-12-10 17:16:00',71,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:08','2025-12-10 17:16:08',131,1,NULL,NULL,NULL,'2025-12-10 17:14:08','2025-12-10 17:16:08','6939a9d35cdbef251'),('6939aa605cff90d3b','Send Email Notifications',0,'Success','2025-12-10 17:16:00',72,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:08','2025-12-10 17:16:08',132,1,NULL,NULL,NULL,'2025-12-10 17:14:08','2025-12-10 17:16:08','6939a9d35d85d836c'),('6939aa605d9d030f1','Process Webhook Queue',0,'Success','2025-12-10 17:16:00',73,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:08','2025-12-10 17:16:08',133,1,NULL,NULL,NULL,'2025-12-10 17:14:08','2025-12-10 17:16:08','6939a9d361838de09'),('6939aa6a599e60cd8','Submit Popup Reminders',0,'Success','2025-12-10 17:14:18',74,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:18','2025-12-10 17:14:18',86,1,NULL,NULL,NULL,'2025-12-10 17:14:18','2025-12-10 17:14:18','6939a9d31c969e5dc'),('6939aa6a5b14f695d','Process Job Queue q0',0,'Success','2025-12-10 17:14:18',75,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:18','2025-12-10 17:14:18',87,1,NULL,NULL,NULL,'2025-12-10 17:14:18','2025-12-10 17:14:18','6939a9d31dd8daa8d'),('6939aa6a5bb906d37','Process Job Queue e0',0,'Success','2025-12-10 17:14:18',76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:18','2025-12-10 17:14:18',88,1,NULL,NULL,NULL,'2025-12-10 17:14:18','2025-12-10 17:14:18','6939a9d31f0214517'),('6939aa745a31273e7','Submit Popup Reminders',0,'Success','2025-12-10 17:14:28',77,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:28','2025-12-10 17:14:28',90,1,NULL,NULL,NULL,'2025-12-10 17:14:28','2025-12-10 17:14:28','6939a9d31c969e5dc'),('6939aa745bfb9b03a','Process Job Queue q0',0,'Success','2025-12-10 17:14:28',78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:28','2025-12-10 17:14:28',91,1,NULL,NULL,NULL,'2025-12-10 17:14:28','2025-12-10 17:14:28','6939a9d31dd8daa8d'),('6939aa745cbe1076f','Process Job Queue e0',0,'Success','2025-12-10 17:14:28',79,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:28','2025-12-10 17:14:28',92,1,NULL,NULL,NULL,'2025-12-10 17:14:28','2025-12-10 17:14:28','6939a9d31f0214517'),('6939aa7e5b083f28c','Submit Popup Reminders',0,'Success','2025-12-10 17:14:38',80,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:38','2025-12-10 17:14:38',94,1,NULL,NULL,NULL,'2025-12-10 17:14:38','2025-12-10 17:14:38','6939a9d31c969e5dc'),('6939aa7e5c6b2b33d','Process Job Queue q0',0,'Success','2025-12-10 17:14:38',81,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:38','2025-12-10 17:14:38',95,1,NULL,NULL,NULL,'2025-12-10 17:14:38','2025-12-10 17:14:38','6939a9d31dd8daa8d'),('6939aa7e5d5a26489','Process Job Queue e0',0,'Success','2025-12-10 17:14:38',82,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:38','2025-12-10 17:14:38',96,1,NULL,NULL,NULL,'2025-12-10 17:14:38','2025-12-10 17:14:38','6939a9d31f0214517'),('6939aa885b7aa5928','Submit Popup Reminders',0,'Success','2025-12-10 17:14:48',83,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:48','2025-12-10 17:14:48',98,1,NULL,NULL,NULL,'2025-12-10 17:14:48','2025-12-10 17:14:48','6939a9d31c969e5dc'),('6939aa885c80cbc05','Process Job Queue q0',0,'Success','2025-12-10 17:14:48',84,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:48','2025-12-10 17:14:48',99,1,NULL,NULL,NULL,'2025-12-10 17:14:48','2025-12-10 17:14:48','6939a9d31dd8daa8d'),('6939aa885d67d6a5d','Process Job Queue e0',0,'Success','2025-12-10 17:14:48',85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:48','2025-12-10 17:14:48',100,1,NULL,NULL,NULL,'2025-12-10 17:14:48','2025-12-10 17:14:48','6939a9d31f0214517'),('6939aa925a3617268','Submit Popup Reminders',0,'Success','2025-12-10 17:14:58',86,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:58','2025-12-10 17:14:58',102,1,NULL,NULL,NULL,'2025-12-10 17:14:58','2025-12-10 17:14:58','6939a9d31c969e5dc'),('6939aa925bcac0106','Process Job Queue q0',0,'Success','2025-12-10 17:14:58',87,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:58','2025-12-10 17:14:58',103,1,NULL,NULL,NULL,'2025-12-10 17:14:58','2025-12-10 17:14:58','6939a9d31dd8daa8d'),('6939aa925c7affd26','Process Job Queue e0',0,'Success','2025-12-10 17:14:58',88,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:14:58','2025-12-10 17:14:58',104,1,NULL,NULL,NULL,'2025-12-10 17:14:58','2025-12-10 17:14:58','6939a9d31f0214517'),('6939aa9c5ada9325c','Submit Popup Reminders',0,'Success','2025-12-10 17:15:08',89,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:08','2025-12-10 17:15:08',107,1,NULL,NULL,NULL,'2025-12-10 17:15:08','2025-12-10 17:15:08','6939a9d31c969e5dc'),('6939aa9c5c3271694','Process Job Queue q0',0,'Success','2025-12-10 17:15:08',90,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:08','2025-12-10 17:15:08',108,1,NULL,NULL,NULL,'2025-12-10 17:15:08','2025-12-10 17:15:08','6939a9d31dd8daa8d'),('6939aa9c5cf5f4308','Process Job Queue q1',0,'Success','2025-12-10 17:16:00',91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:08','2025-12-10 17:16:08',134,1,NULL,NULL,NULL,'2025-12-10 17:15:08','2025-12-10 17:16:08','6939a9d31e7ebae65'),('6939aa9c5d4fad791','Process Job Queue e0',0,'Success','2025-12-10 17:15:08',92,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:08','2025-12-10 17:15:08',109,1,NULL,NULL,NULL,'2025-12-10 17:15:08','2025-12-10 17:15:08','6939a9d31f0214517'),('6939aaa65aabfc8d4','Submit Popup Reminders',0,'Success','2025-12-10 17:15:18',93,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:18','2025-12-10 17:15:18',111,1,NULL,NULL,NULL,'2025-12-10 17:15:18','2025-12-10 17:15:18','6939a9d31c969e5dc'),('6939aaa65c1e806b8','Process Job Queue q0',0,'Success','2025-12-10 17:15:18',94,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:18','2025-12-10 17:15:18',112,1,NULL,NULL,NULL,'2025-12-10 17:15:18','2025-12-10 17:15:18','6939a9d31dd8daa8d'),('6939aaa65cbc0ee20','Process Job Queue e0',0,'Success','2025-12-10 17:15:18',95,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:18','2025-12-10 17:15:18',113,1,NULL,NULL,NULL,'2025-12-10 17:15:18','2025-12-10 17:15:18','6939a9d31f0214517'),('6939aab05b356d332','Submit Popup Reminders',0,'Success','2025-12-10 17:15:28',96,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:28','2025-12-10 17:15:28',115,1,NULL,NULL,NULL,'2025-12-10 17:15:28','2025-12-10 17:15:28','6939a9d31c969e5dc'),('6939aab05bd3a8127','Process Job Queue q0',0,'Success','2025-12-10 17:15:28',97,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:28','2025-12-10 17:15:28',116,1,NULL,NULL,NULL,'2025-12-10 17:15:28','2025-12-10 17:15:28','6939a9d31dd8daa8d'),('6939aab05c79c6fab','Process Job Queue e0',0,'Success','2025-12-10 17:15:28',98,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:28','2025-12-10 17:15:28',117,1,NULL,NULL,NULL,'2025-12-10 17:15:28','2025-12-10 17:15:28','6939a9d31f0214517'),('6939aaba5b9328b71','Submit Popup Reminders',0,'Success','2025-12-10 17:15:38',99,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:38','2025-12-10 17:15:38',119,1,NULL,NULL,NULL,'2025-12-10 17:15:38','2025-12-10 17:15:38','6939a9d31c969e5dc'),('6939aaba5cd9e12ca','Process Job Queue q0',0,'Success','2025-12-10 17:15:38',100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:38','2025-12-10 17:15:38',120,1,NULL,NULL,NULL,'2025-12-10 17:15:38','2025-12-10 17:15:38','6939a9d31dd8daa8d'),('6939aaba5dca9390f','Process Job Queue e0',0,'Success','2025-12-10 17:15:38',101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:38','2025-12-10 17:15:38',121,1,NULL,NULL,NULL,'2025-12-10 17:15:38','2025-12-10 17:15:38','6939a9d31f0214517'),('6939aac45b469b7c5','Submit Popup Reminders',0,'Success','2025-12-10 17:15:48',102,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:48','2025-12-10 17:15:48',123,1,NULL,NULL,NULL,'2025-12-10 17:15:48','2025-12-10 17:15:48','6939a9d31c969e5dc'),('6939aac45cf1a2865','Process Job Queue q0',0,'Success','2025-12-10 17:15:48',103,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:48','2025-12-10 17:15:48',124,1,NULL,NULL,NULL,'2025-12-10 17:15:48','2025-12-10 17:15:48','6939a9d31dd8daa8d'),('6939aac45dc2bcf1f','Process Job Queue e0',0,'Success','2025-12-10 17:15:48',104,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:48','2025-12-10 17:15:48',125,1,NULL,NULL,NULL,'2025-12-10 17:15:48','2025-12-10 17:15:48','6939a9d31f0214517'),('6939aace5b26e1a84','Submit Popup Reminders',0,'Success','2025-12-10 17:15:58',105,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:58','2025-12-10 17:15:58',127,1,NULL,NULL,NULL,'2025-12-10 17:15:58','2025-12-10 17:15:58','6939a9d31c969e5dc'),('6939aace5ca12455d','Process Job Queue q0',0,'Success','2025-12-10 17:15:58',106,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:58','2025-12-10 17:15:58',128,1,NULL,NULL,NULL,'2025-12-10 17:15:58','2025-12-10 17:15:58','6939a9d31dd8daa8d'),('6939aace5d3e54176','Process Job Queue e0',0,'Success','2025-12-10 17:15:58',107,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:15:58','2025-12-10 17:15:58',129,1,NULL,NULL,NULL,'2025-12-10 17:15:58','2025-12-10 17:15:58','6939a9d31f0214517'),('6939aad85aa8c29df','Submit Popup Reminders',0,'Success','2025-12-10 17:16:08',108,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:08','2025-12-10 17:16:08',135,1,NULL,NULL,NULL,'2025-12-10 17:16:08','2025-12-10 17:16:08','6939a9d31c969e5dc'),('6939aad85c54aae62','Process Job Queue q0',0,'Success','2025-12-10 17:16:08',109,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:08','2025-12-10 17:16:08',136,1,NULL,NULL,NULL,'2025-12-10 17:16:08','2025-12-10 17:16:08','6939a9d31dd8daa8d'),('6939aad85ce8d0888','Process Job Queue q1',0,'Success','2025-12-10 17:17:00',110,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:08','2025-12-10 17:17:08',159,1,NULL,NULL,NULL,'2025-12-10 17:16:08','2025-12-10 17:17:08','6939a9d31e7ebae65'),('6939aad85d3d0a636','Process Job Queue e0',0,'Success','2025-12-10 17:16:08',111,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:08','2025-12-10 17:16:08',137,1,NULL,NULL,NULL,'2025-12-10 17:16:08','2025-12-10 17:16:08','6939a9d31f0214517'),('6939aad85e416514e','Send Email Reminders',0,'Success','2025-12-10 17:18:00',112,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:08','2025-12-10 17:18:08',185,1,NULL,NULL,NULL,'2025-12-10 17:16:08','2025-12-10 17:18:08','6939a9d35cdbef251'),('6939aad85e99843ab','Send Email Notifications',0,'Success','2025-12-10 17:18:00',113,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:08','2025-12-10 17:18:08',186,1,NULL,NULL,NULL,'2025-12-10 17:16:08','2025-12-10 17:18:08','6939a9d35d85d836c'),('6939aad85f30e8f8b','Process Webhook Queue',0,'Success','2025-12-10 17:18:00',114,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:08','2025-12-10 17:18:08',187,1,NULL,NULL,NULL,'2025-12-10 17:16:08','2025-12-10 17:18:08','6939a9d361838de09'),('6939aae25b63f5b1e','Submit Popup Reminders',0,'Success','2025-12-10 17:16:18',115,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:18','2025-12-10 17:16:18',139,1,NULL,NULL,NULL,'2025-12-10 17:16:18','2025-12-10 17:16:18','6939a9d31c969e5dc'),('6939aae25cd11fa40','Process Job Queue q0',0,'Success','2025-12-10 17:16:18',116,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:18','2025-12-10 17:16:18',140,1,NULL,NULL,NULL,'2025-12-10 17:16:18','2025-12-10 17:16:18','6939a9d31dd8daa8d'),('6939aae25d7b985ae','Process Job Queue e0',0,'Success','2025-12-10 17:16:18',117,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:18','2025-12-10 17:16:18',141,1,NULL,NULL,NULL,'2025-12-10 17:16:18','2025-12-10 17:16:18','6939a9d31f0214517'),('6939aaec5b6aeba1e','Submit Popup Reminders',0,'Success','2025-12-10 17:16:28',118,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:28','2025-12-10 17:16:28',143,1,NULL,NULL,NULL,'2025-12-10 17:16:28','2025-12-10 17:16:28','6939a9d31c969e5dc'),('6939aaec5cefc577b','Process Job Queue q0',0,'Success','2025-12-10 17:16:28',119,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:28','2025-12-10 17:16:28',144,1,NULL,NULL,NULL,'2025-12-10 17:16:28','2025-12-10 17:16:28','6939a9d31dd8daa8d'),('6939aaec5dc450c28','Process Job Queue e0',0,'Success','2025-12-10 17:16:28',120,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:28','2025-12-10 17:16:28',145,1,NULL,NULL,NULL,'2025-12-10 17:16:28','2025-12-10 17:16:28','6939a9d31f0214517'),('6939aaf65d2bb973f','Submit Popup Reminders',0,'Success','2025-12-10 17:16:38',121,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:38','2025-12-10 17:16:38',147,1,NULL,NULL,NULL,'2025-12-10 17:16:38','2025-12-10 17:16:38','6939a9d31c969e5dc'),('6939aaf65e93b5855','Process Job Queue q0',0,'Success','2025-12-10 17:16:38',122,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:38','2025-12-10 17:16:38',148,1,NULL,NULL,NULL,'2025-12-10 17:16:38','2025-12-10 17:16:38','6939a9d31dd8daa8d'),('6939aaf65f5bc6536','Process Job Queue e0',0,'Success','2025-12-10 17:16:38',123,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:38','2025-12-10 17:16:38',149,1,NULL,NULL,NULL,'2025-12-10 17:16:38','2025-12-10 17:16:38','6939a9d31f0214517'),('6939ab005d3ab821f','Submit Popup Reminders',0,'Success','2025-12-10 17:16:48',124,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:48','2025-12-10 17:16:48',151,1,NULL,NULL,NULL,'2025-12-10 17:16:48','2025-12-10 17:16:48','6939a9d31c969e5dc'),('6939ab005e9c7bd6d','Process Job Queue q0',0,'Success','2025-12-10 17:16:48',125,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:48','2025-12-10 17:16:48',152,1,NULL,NULL,NULL,'2025-12-10 17:16:48','2025-12-10 17:16:48','6939a9d31dd8daa8d'),('6939ab005f58d3494','Process Job Queue e0',0,'Success','2025-12-10 17:16:48',126,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:48','2025-12-10 17:16:48',153,1,NULL,NULL,NULL,'2025-12-10 17:16:48','2025-12-10 17:16:48','6939a9d31f0214517'),('6939ab0a5c17d0ba9','Submit Popup Reminders',0,'Success','2025-12-10 17:16:58',127,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:58','2025-12-10 17:16:58',155,1,NULL,NULL,NULL,'2025-12-10 17:16:58','2025-12-10 17:16:58','6939a9d31c969e5dc'),('6939ab0a5dc949f20','Process Job Queue q0',0,'Success','2025-12-10 17:16:58',128,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:58','2025-12-10 17:16:58',156,1,NULL,NULL,NULL,'2025-12-10 17:16:58','2025-12-10 17:16:58','6939a9d31dd8daa8d'),('6939ab0a5e6243adf','Process Job Queue e0',0,'Success','2025-12-10 17:16:58',129,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:16:58','2025-12-10 17:16:58',157,1,NULL,NULL,NULL,'2025-12-10 17:16:58','2025-12-10 17:16:58','6939a9d31f0214517'),('6939ab145bbde21cb','Submit Popup Reminders',0,'Success','2025-12-10 17:17:08',130,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:08','2025-12-10 17:17:08',160,1,NULL,NULL,NULL,'2025-12-10 17:17:08','2025-12-10 17:17:08','6939a9d31c969e5dc'),('6939ab145d4d78bc7','Process Job Queue q0',0,'Success','2025-12-10 17:17:08',131,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:08','2025-12-10 17:17:08',161,1,NULL,NULL,NULL,'2025-12-10 17:17:08','2025-12-10 17:17:08','6939a9d31dd8daa8d'),('6939ab145de106a5f','Process Job Queue q1',0,'Success','2025-12-10 17:18:00',132,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:08','2025-12-10 17:18:08',188,1,NULL,NULL,NULL,'2025-12-10 17:17:08','2025-12-10 17:18:08','6939a9d31e7ebae65'),('6939ab145e450c604','Process Job Queue e0',0,'Success','2025-12-10 17:17:08',133,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:08','2025-12-10 17:17:08',162,1,NULL,NULL,NULL,'2025-12-10 17:17:08','2025-12-10 17:17:08','6939a9d31f0214517'),('6939ab1e5c58c7f72','Submit Popup Reminders',0,'Success','2025-12-10 17:17:18',134,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:18','2025-12-10 17:17:18',164,1,NULL,NULL,NULL,'2025-12-10 17:17:18','2025-12-10 17:17:18','6939a9d31c969e5dc'),('6939ab1e5decb1c58','Process Job Queue q0',0,'Success','2025-12-10 17:17:18',135,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:18','2025-12-10 17:17:18',165,1,NULL,NULL,NULL,'2025-12-10 17:17:18','2025-12-10 17:17:18','6939a9d31dd8daa8d'),('6939ab1e5ea0db5b6','Process Job Queue e0',0,'Success','2025-12-10 17:17:18',136,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:18','2025-12-10 17:17:18',166,1,NULL,NULL,NULL,'2025-12-10 17:17:18','2025-12-10 17:17:18','6939a9d31f0214517'),('6939ab285c59c6b8e','Submit Popup Reminders',0,'Success','2025-12-10 17:17:28',137,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:28','2025-12-10 17:17:28',168,1,NULL,NULL,NULL,'2025-12-10 17:17:28','2025-12-10 17:17:28','6939a9d31c969e5dc'),('6939ab285df47a9fb','Process Job Queue q0',0,'Success','2025-12-10 17:17:28',138,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:28','2025-12-10 17:17:28',169,1,NULL,NULL,NULL,'2025-12-10 17:17:28','2025-12-10 17:17:28','6939a9d31dd8daa8d'),('6939ab285ea7f5b53','Process Job Queue e0',0,'Success','2025-12-10 17:17:28',139,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:28','2025-12-10 17:17:28',170,1,NULL,NULL,NULL,'2025-12-10 17:17:28','2025-12-10 17:17:28','6939a9d31f0214517'),('6939ab325bed0a6e6','Submit Popup Reminders',0,'Success','2025-12-10 17:17:38',140,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:38','2025-12-10 17:17:38',172,1,NULL,NULL,NULL,'2025-12-10 17:17:38','2025-12-10 17:17:38','6939a9d31c969e5dc'),('6939ab325d8ef24dc','Process Job Queue q0',0,'Success','2025-12-10 17:17:38',141,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:38','2025-12-10 17:17:38',173,1,NULL,NULL,NULL,'2025-12-10 17:17:38','2025-12-10 17:17:38','6939a9d31dd8daa8d'),('6939ab325e300a88c','Process Job Queue e0',0,'Success','2025-12-10 17:17:38',142,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:38','2025-12-10 17:17:38',174,1,NULL,NULL,NULL,'2025-12-10 17:17:38','2025-12-10 17:17:38','6939a9d31f0214517'),('6939ab3c5c2226c6d','Submit Popup Reminders',0,'Success','2025-12-10 17:17:48',143,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:48','2025-12-10 17:17:48',176,1,NULL,NULL,NULL,'2025-12-10 17:17:48','2025-12-10 17:17:48','6939a9d31c969e5dc'),('6939ab3c5dbe3d8c8','Process Job Queue q0',0,'Success','2025-12-10 17:17:48',144,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:48','2025-12-10 17:17:48',177,1,NULL,NULL,NULL,'2025-12-10 17:17:48','2025-12-10 17:17:48','6939a9d31dd8daa8d'),('6939ab3c5e65d363f','Process Job Queue e0',0,'Success','2025-12-10 17:17:48',145,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:48','2025-12-10 17:17:48',178,1,NULL,NULL,NULL,'2025-12-10 17:17:48','2025-12-10 17:17:48','6939a9d31f0214517'),('6939ab465d6ca25a0','Submit Popup Reminders',0,'Success','2025-12-10 17:17:58',146,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:58','2025-12-10 17:17:58',180,1,NULL,NULL,NULL,'2025-12-10 17:17:58','2025-12-10 17:17:58','6939a9d31c969e5dc'),('6939ab465e5f5a018','Process Job Queue q0',0,'Success','2025-12-10 17:17:58',147,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:58','2025-12-10 17:17:58',181,1,NULL,NULL,NULL,'2025-12-10 17:17:58','2025-12-10 17:17:58','6939a9d31dd8daa8d'),('6939ab465f41ed392','Process Job Queue e0',0,'Success','2025-12-10 17:17:58',148,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:17:58','2025-12-10 17:17:58',182,1,NULL,NULL,NULL,'2025-12-10 17:17:58','2025-12-10 17:17:58','6939a9d31f0214517'),('6939ab505d17af50b','Submit Popup Reminders',0,'Success','2025-12-10 17:18:08',149,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:08','2025-12-10 17:18:08',189,1,NULL,NULL,NULL,'2025-12-10 17:18:08','2025-12-10 17:18:08','6939a9d31c969e5dc'),('6939ab505e9228e0c','Process Job Queue q0',0,'Success','2025-12-10 17:18:08',150,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:08','2025-12-10 17:18:08',190,1,NULL,NULL,NULL,'2025-12-10 17:18:08','2025-12-10 17:18:08','6939a9d31dd8daa8d'),('6939ab505f30ea8b4','Process Job Queue q1',0,'Success','2025-12-10 17:19:00',151,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:08','2025-12-10 17:19:08',213,1,NULL,NULL,NULL,'2025-12-10 17:18:08','2025-12-10 17:19:08','6939a9d31e7ebae65'),('6939ab505f86f7e24','Process Job Queue e0',0,'Success','2025-12-10 17:18:08',152,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:08','2025-12-10 17:18:08',191,1,NULL,NULL,NULL,'2025-12-10 17:18:08','2025-12-10 17:18:08','6939a9d31f0214517'),('6939ab5060a6e911f','Send Email Reminders',0,'Success','2025-12-10 17:20:00',153,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:08','2025-12-10 17:20:08',239,1,NULL,NULL,NULL,'2025-12-10 17:18:08','2025-12-10 17:20:08','6939a9d35cdbef251'),('6939ab50610d5324e','Send Email Notifications',0,'Success','2025-12-10 17:20:00',154,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:08','2025-12-10 17:20:08',240,1,NULL,NULL,NULL,'2025-12-10 17:18:08','2025-12-10 17:20:08','6939a9d35d85d836c'),('6939ab50617dd4e3c','Auth Token Control',0,'Success','2025-12-10 17:24:00',155,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:08','2025-12-10 17:24:08',345,1,NULL,NULL,NULL,'2025-12-10 17:18:08','2025-12-10 17:24:08','6939a9d35feff1ad8'),('6939ab5061dc3e278','Process Webhook Queue',0,'Success','2025-12-10 17:20:00',156,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:08','2025-12-10 17:20:08',241,1,NULL,NULL,NULL,'2025-12-10 17:18:08','2025-12-10 17:20:08','6939a9d361838de09'),('6939ab5a5d43f887a','Submit Popup Reminders',0,'Success','2025-12-10 17:18:18',157,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:18','2025-12-10 17:18:18',193,1,NULL,NULL,NULL,'2025-12-10 17:18:18','2025-12-10 17:18:18','6939a9d31c969e5dc'),('6939ab5a5e9c412fb','Process Job Queue q0',0,'Success','2025-12-10 17:18:18',158,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:18','2025-12-10 17:18:18',194,1,NULL,NULL,NULL,'2025-12-10 17:18:18','2025-12-10 17:18:18','6939a9d31dd8daa8d'),('6939ab5a5f41ec13d','Process Job Queue e0',0,'Success','2025-12-10 17:18:18',159,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:18','2025-12-10 17:18:18',195,1,NULL,NULL,NULL,'2025-12-10 17:18:18','2025-12-10 17:18:18','6939a9d31f0214517'),('6939ab645dbf49dc8','Submit Popup Reminders',0,'Success','2025-12-10 17:18:28',160,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:28','2025-12-10 17:18:28',197,1,NULL,NULL,NULL,'2025-12-10 17:18:28','2025-12-10 17:18:28','6939a9d31c969e5dc'),('6939ab645ebc33e6c','Process Job Queue q0',0,'Success','2025-12-10 17:18:28',161,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:28','2025-12-10 17:18:28',198,1,NULL,NULL,NULL,'2025-12-10 17:18:28','2025-12-10 17:18:28','6939a9d31dd8daa8d'),('6939ab645f5596032','Process Job Queue e0',0,'Success','2025-12-10 17:18:28',162,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:28','2025-12-10 17:18:28',199,1,NULL,NULL,NULL,'2025-12-10 17:18:28','2025-12-10 17:18:28','6939a9d31f0214517'),('6939ab6e5dd3a5238','Submit Popup Reminders',0,'Success','2025-12-10 17:18:38',163,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:38','2025-12-10 17:18:38',201,1,NULL,NULL,NULL,'2025-12-10 17:18:38','2025-12-10 17:18:38','6939a9d31c969e5dc'),('6939ab6e5f5624f54','Process Job Queue q0',0,'Success','2025-12-10 17:18:38',164,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:38','2025-12-10 17:18:38',202,1,NULL,NULL,NULL,'2025-12-10 17:18:38','2025-12-10 17:18:38','6939a9d31dd8daa8d'),('6939ab6e5fedf8ff8','Process Job Queue e0',0,'Success','2025-12-10 17:18:38',165,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:38','2025-12-10 17:18:38',203,1,NULL,NULL,NULL,'2025-12-10 17:18:38','2025-12-10 17:18:38','6939a9d31f0214517'),('6939ab785ce8567e3','Submit Popup Reminders',0,'Success','2025-12-10 17:18:48',166,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:48','2025-12-10 17:18:48',205,1,NULL,NULL,NULL,'2025-12-10 17:18:48','2025-12-10 17:18:48','6939a9d31c969e5dc'),('6939ab785e7d7e025','Process Job Queue q0',0,'Success','2025-12-10 17:18:48',167,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:48','2025-12-10 17:18:48',206,1,NULL,NULL,NULL,'2025-12-10 17:18:48','2025-12-10 17:18:48','6939a9d31dd8daa8d'),('6939ab785f306f522','Process Job Queue e0',0,'Success','2025-12-10 17:18:48',168,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:48','2025-12-10 17:18:48',207,1,NULL,NULL,NULL,'2025-12-10 17:18:48','2025-12-10 17:18:48','6939a9d31f0214517'),('6939ab825db8a6951','Submit Popup Reminders',0,'Success','2025-12-10 17:18:58',169,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:58','2025-12-10 17:18:58',209,1,NULL,NULL,NULL,'2025-12-10 17:18:58','2025-12-10 17:18:58','6939a9d31c969e5dc'),('6939ab825f25fc5c3','Process Job Queue q0',0,'Success','2025-12-10 17:18:58',170,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:58','2025-12-10 17:18:58',210,1,NULL,NULL,NULL,'2025-12-10 17:18:58','2025-12-10 17:18:58','6939a9d31dd8daa8d'),('6939ab825fc093413','Process Job Queue e0',0,'Success','2025-12-10 17:18:58',171,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:18:58','2025-12-10 17:18:58',211,1,NULL,NULL,NULL,'2025-12-10 17:18:58','2025-12-10 17:18:58','6939a9d31f0214517'),('6939ab8c5dab6c4a4','Submit Popup Reminders',0,'Success','2025-12-10 17:19:08',172,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:08','2025-12-10 17:19:08',214,1,NULL,NULL,NULL,'2025-12-10 17:19:08','2025-12-10 17:19:08','6939a9d31c969e5dc'),('6939ab8c5f3f63d40','Process Job Queue q0',0,'Success','2025-12-10 17:19:08',173,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:08','2025-12-10 17:19:08',215,1,NULL,NULL,NULL,'2025-12-10 17:19:08','2025-12-10 17:19:08','6939a9d31dd8daa8d'),('6939ab8c5fe5d215e','Process Job Queue q1',0,'Success','2025-12-10 17:20:00',174,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:08','2025-12-10 17:20:08',242,1,NULL,NULL,NULL,'2025-12-10 17:19:08','2025-12-10 17:20:08','6939a9d31e7ebae65'),('6939ab8c60455c92f','Process Job Queue e0',0,'Success','2025-12-10 17:19:08',175,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:08','2025-12-10 17:19:08',216,1,NULL,NULL,NULL,'2025-12-10 17:19:08','2025-12-10 17:19:08','6939a9d31f0214517'),('6939ab965d9b514ba','Submit Popup Reminders',0,'Success','2025-12-10 17:19:18',176,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:18','2025-12-10 17:19:18',218,1,NULL,NULL,NULL,'2025-12-10 17:19:18','2025-12-10 17:19:18','6939a9d31c969e5dc'),('6939ab965f35a522e','Process Job Queue q0',0,'Success','2025-12-10 17:19:18',177,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:18','2025-12-10 17:19:18',219,1,NULL,NULL,NULL,'2025-12-10 17:19:18','2025-12-10 17:19:18','6939a9d31dd8daa8d'),('6939ab965fecda9d1','Process Job Queue e0',0,'Success','2025-12-10 17:19:18',178,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:18','2025-12-10 17:19:18',220,1,NULL,NULL,NULL,'2025-12-10 17:19:18','2025-12-10 17:19:18','6939a9d31f0214517'),('6939aba05d9217547','Submit Popup Reminders',0,'Success','2025-12-10 17:19:28',179,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:28','2025-12-10 17:19:28',222,1,NULL,NULL,NULL,'2025-12-10 17:19:28','2025-12-10 17:19:28','6939a9d31c969e5dc'),('6939aba05f2bd2b9f','Process Job Queue q0',0,'Success','2025-12-10 17:19:28',180,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:28','2025-12-10 17:19:28',223,1,NULL,NULL,NULL,'2025-12-10 17:19:28','2025-12-10 17:19:28','6939a9d31dd8daa8d'),('6939aba05fcc49d0a','Process Job Queue e0',0,'Success','2025-12-10 17:19:28',181,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:28','2025-12-10 17:19:28',224,1,NULL,NULL,NULL,'2025-12-10 17:19:28','2025-12-10 17:19:28','6939a9d31f0214517'),('6939abaa5e5e568a4','Submit Popup Reminders',0,'Success','2025-12-10 17:19:38',182,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:38','2025-12-10 17:19:38',226,1,NULL,NULL,NULL,'2025-12-10 17:19:38','2025-12-10 17:19:38','6939a9d31c969e5dc'),('6939abaa5ffae1576','Process Job Queue q0',0,'Success','2025-12-10 17:19:38',183,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:38','2025-12-10 17:19:38',227,1,NULL,NULL,NULL,'2025-12-10 17:19:38','2025-12-10 17:19:38','6939a9d31dd8daa8d'),('6939abaa6095be082','Process Job Queue e0',0,'Success','2025-12-10 17:19:38',184,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:38','2025-12-10 17:19:38',228,1,NULL,NULL,NULL,'2025-12-10 17:19:38','2025-12-10 17:19:38','6939a9d31f0214517'),('6939abb45e6e53f5b','Submit Popup Reminders',0,'Success','2025-12-10 17:19:48',185,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:48','2025-12-10 17:19:48',230,1,NULL,NULL,NULL,'2025-12-10 17:19:48','2025-12-10 17:19:48','6939a9d31c969e5dc'),('6939abb45ffeec8b6','Process Job Queue q0',0,'Success','2025-12-10 17:19:48',186,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:48','2025-12-10 17:19:48',231,1,NULL,NULL,NULL,'2025-12-10 17:19:48','2025-12-10 17:19:48','6939a9d31dd8daa8d'),('6939abb46099cf56a','Process Job Queue e0',0,'Success','2025-12-10 17:19:48',187,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:48','2025-12-10 17:19:48',232,1,NULL,NULL,NULL,'2025-12-10 17:19:48','2025-12-10 17:19:48','6939a9d31f0214517'),('6939abbe5e5b1754e','Submit Popup Reminders',0,'Success','2025-12-10 17:19:58',188,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:58','2025-12-10 17:19:58',234,1,NULL,NULL,NULL,'2025-12-10 17:19:58','2025-12-10 17:19:58','6939a9d31c969e5dc'),('6939abbe5efbd752d','Process Job Queue q0',0,'Success','2025-12-10 17:19:58',189,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:58','2025-12-10 17:19:58',235,1,NULL,NULL,NULL,'2025-12-10 17:19:58','2025-12-10 17:19:58','6939a9d31dd8daa8d'),('6939abbe5fa55777d','Process Job Queue e0',0,'Success','2025-12-10 17:19:58',190,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:19:58','2025-12-10 17:19:58',236,1,NULL,NULL,NULL,'2025-12-10 17:19:58','2025-12-10 17:19:58','6939a9d31f0214517'),('6939abc85e9bdfeb8','Submit Popup Reminders',0,'Success','2025-12-10 17:20:08',191,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:08','2025-12-10 17:20:08',243,1,NULL,NULL,NULL,'2025-12-10 17:20:08','2025-12-10 17:20:08','6939a9d31c969e5dc'),('6939abc86006ee405','Process Job Queue q0',0,'Success','2025-12-10 17:20:08',192,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:08','2025-12-10 17:20:08',244,1,NULL,NULL,NULL,'2025-12-10 17:20:08','2025-12-10 17:20:08','6939a9d31dd8daa8d'),('6939abc860a73fc06','Process Job Queue q1',0,'Success','2025-12-10 17:21:00',193,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:08','2025-12-10 17:21:08',267,1,NULL,NULL,NULL,'2025-12-10 17:20:08','2025-12-10 17:21:08','6939a9d31e7ebae65'),('6939abc860f38eb0e','Process Job Queue e0',0,'Success','2025-12-10 17:20:08',194,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:08','2025-12-10 17:20:08',245,1,NULL,NULL,NULL,'2025-12-10 17:20:08','2025-12-10 17:20:08','6939a9d31f0214517'),('6939abc862048ae51','Send Email Reminders',0,'Success','2025-12-10 17:22:00',195,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:08','2025-12-10 17:22:08',292,1,NULL,NULL,NULL,'2025-12-10 17:20:08','2025-12-10 17:22:08','6939a9d35cdbef251'),('6939abc8625f98321','Send Email Notifications',0,'Success','2025-12-10 17:22:00',196,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:08','2025-12-10 17:22:08',293,1,NULL,NULL,NULL,'2025-12-10 17:20:08','2025-12-10 17:22:08','6939a9d35d85d836c'),('6939abc862e107892','Process Webhook Queue',0,'Success','2025-12-10 17:22:00',197,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:08','2025-12-10 17:22:08',294,1,NULL,NULL,NULL,'2025-12-10 17:20:08','2025-12-10 17:22:08','6939a9d361838de09'),('6939abc863497c86a','Send Scheduled Emails',0,'Success','2025-12-10 17:30:00',198,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08',506,1,NULL,NULL,NULL,'2025-12-10 17:20:08','2025-12-10 17:30:08','6939a9d3623830b3b'),('6939abd25f0c7190a','Submit Popup Reminders',0,'Success','2025-12-10 17:20:18',199,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:18','2025-12-10 17:20:18',247,1,NULL,NULL,NULL,'2025-12-10 17:20:18','2025-12-10 17:20:18','6939a9d31c969e5dc'),('6939abd260129d2be','Process Job Queue q0',0,'Success','2025-12-10 17:20:18',200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:18','2025-12-10 17:20:18',248,1,NULL,NULL,NULL,'2025-12-10 17:20:18','2025-12-10 17:20:18','6939a9d31dd8daa8d'),('6939abd260fa7f8d4','Process Job Queue e0',0,'Success','2025-12-10 17:20:18',201,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:18','2025-12-10 17:20:18',249,1,NULL,NULL,NULL,'2025-12-10 17:20:18','2025-12-10 17:20:18','6939a9d31f0214517'),('6939abdc5ea22b22c','Submit Popup Reminders',0,'Success','2025-12-10 17:20:28',202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:28','2025-12-10 17:20:28',251,1,NULL,NULL,NULL,'2025-12-10 17:20:28','2025-12-10 17:20:28','6939a9d31c969e5dc'),('6939abdc602b7464b','Process Job Queue q0',0,'Success','2025-12-10 17:20:28',203,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:28','2025-12-10 17:20:28',252,1,NULL,NULL,NULL,'2025-12-10 17:20:28','2025-12-10 17:20:28','6939a9d31dd8daa8d'),('6939abdc60dbb2487','Process Job Queue e0',0,'Success','2025-12-10 17:20:28',204,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:28','2025-12-10 17:20:28',253,1,NULL,NULL,NULL,'2025-12-10 17:20:28','2025-12-10 17:20:28','6939a9d31f0214517'),('6939abe65fd771d2b','Submit Popup Reminders',0,'Success','2025-12-10 17:20:38',205,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:38','2025-12-10 17:20:38',255,1,NULL,NULL,NULL,'2025-12-10 17:20:38','2025-12-10 17:20:38','6939a9d31c969e5dc'),('6939abe661372a63f','Process Job Queue q0',0,'Success','2025-12-10 17:20:38',206,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:38','2025-12-10 17:20:38',256,1,NULL,NULL,NULL,'2025-12-10 17:20:38','2025-12-10 17:20:38','6939a9d31dd8daa8d'),('6939abe661e22e243','Process Job Queue e0',0,'Success','2025-12-10 17:20:38',207,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:38','2025-12-10 17:20:38',257,1,NULL,NULL,NULL,'2025-12-10 17:20:38','2025-12-10 17:20:38','6939a9d31f0214517'),('6939abf05e78e1e2a','Submit Popup Reminders',0,'Success','2025-12-10 17:20:48',208,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:48','2025-12-10 17:20:48',259,1,NULL,NULL,NULL,'2025-12-10 17:20:48','2025-12-10 17:20:48','6939a9d31c969e5dc'),('6939abf05fec1acfa','Process Job Queue q0',0,'Success','2025-12-10 17:20:48',209,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:48','2025-12-10 17:20:48',260,1,NULL,NULL,NULL,'2025-12-10 17:20:48','2025-12-10 17:20:48','6939a9d31dd8daa8d'),('6939abf060948b849','Process Job Queue e0',0,'Success','2025-12-10 17:20:48',210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:48','2025-12-10 17:20:48',261,1,NULL,NULL,NULL,'2025-12-10 17:20:48','2025-12-10 17:20:48','6939a9d31f0214517'),('6939abfa5ed01c56b','Submit Popup Reminders',0,'Success','2025-12-10 17:20:58',211,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:58','2025-12-10 17:20:58',263,1,NULL,NULL,NULL,'2025-12-10 17:20:58','2025-12-10 17:20:58','6939a9d31c969e5dc'),('6939abfa60525663c','Process Job Queue q0',0,'Success','2025-12-10 17:20:58',212,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:58','2025-12-10 17:20:58',264,1,NULL,NULL,NULL,'2025-12-10 17:20:58','2025-12-10 17:20:58','6939a9d31dd8daa8d'),('6939abfa60f4f99d2','Process Job Queue e0',0,'Success','2025-12-10 17:20:58',213,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:20:58','2025-12-10 17:20:58',265,1,NULL,NULL,NULL,'2025-12-10 17:20:58','2025-12-10 17:20:58','6939a9d31f0214517'),('6939ac045f13598fb','Submit Popup Reminders',0,'Success','2025-12-10 17:21:08',214,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:08','2025-12-10 17:21:08',268,1,NULL,NULL,NULL,'2025-12-10 17:21:08','2025-12-10 17:21:08','6939a9d31c969e5dc'),('6939ac04608d5f717','Process Job Queue q0',0,'Success','2025-12-10 17:21:08',215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:08','2025-12-10 17:21:08',269,1,NULL,NULL,NULL,'2025-12-10 17:21:08','2025-12-10 17:21:08','6939a9d31dd8daa8d'),('6939ac046134b2739','Process Job Queue q1',0,'Success','2025-12-10 17:22:00',216,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:08','2025-12-10 17:22:08',295,1,NULL,NULL,NULL,'2025-12-10 17:21:08','2025-12-10 17:22:08','6939a9d31e7ebae65'),('6939ac046183a4b6a','Process Job Queue e0',0,'Success','2025-12-10 17:21:08',217,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:08','2025-12-10 17:21:08',270,1,NULL,NULL,NULL,'2025-12-10 17:21:08','2025-12-10 17:21:08','6939a9d31f0214517'),('6939ac0e5f03158d1','Submit Popup Reminders',0,'Success','2025-12-10 17:21:18',218,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:18','2025-12-10 17:21:18',272,1,NULL,NULL,NULL,'2025-12-10 17:21:18','2025-12-10 17:21:18','6939a9d31c969e5dc'),('6939ac0e60805b161','Process Job Queue q0',0,'Success','2025-12-10 17:21:18',219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:18','2025-12-10 17:21:18',273,1,NULL,NULL,NULL,'2025-12-10 17:21:18','2025-12-10 17:21:18','6939a9d31dd8daa8d'),('6939ac0e6139ef2bd','Process Job Queue e0',0,'Success','2025-12-10 17:21:18',220,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:18','2025-12-10 17:21:18',274,1,NULL,NULL,NULL,'2025-12-10 17:21:18','2025-12-10 17:21:18','6939a9d31f0214517'),('6939ac185f4aa6d54','Submit Popup Reminders',0,'Success','2025-12-10 17:21:28',221,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:28','2025-12-10 17:21:28',276,1,NULL,NULL,NULL,'2025-12-10 17:21:28','2025-12-10 17:21:28','6939a9d31c969e5dc'),('6939ac1860db00df2','Process Job Queue q0',0,'Success','2025-12-10 17:21:28',222,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:28','2025-12-10 17:21:28',277,1,NULL,NULL,NULL,'2025-12-10 17:21:28','2025-12-10 17:21:28','6939a9d31dd8daa8d'),('6939ac186195a2bc0','Process Job Queue e0',0,'Success','2025-12-10 17:21:28',223,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:28','2025-12-10 17:21:28',278,1,NULL,NULL,NULL,'2025-12-10 17:21:28','2025-12-10 17:21:28','6939a9d31f0214517'),('6939ac225f71d2de5','Submit Popup Reminders',0,'Success','2025-12-10 17:21:38',224,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:38','2025-12-10 17:21:38',280,1,NULL,NULL,NULL,'2025-12-10 17:21:38','2025-12-10 17:21:38','6939a9d31c969e5dc'),('6939ac226133513d4','Process Job Queue q0',0,'Success','2025-12-10 17:21:38',225,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:38','2025-12-10 17:21:38',281,1,NULL,NULL,NULL,'2025-12-10 17:21:38','2025-12-10 17:21:38','6939a9d31dd8daa8d'),('6939ac226213db095','Process Job Queue e0',0,'Success','2025-12-10 17:21:38',226,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:38','2025-12-10 17:21:38',282,1,NULL,NULL,NULL,'2025-12-10 17:21:38','2025-12-10 17:21:38','6939a9d31f0214517'),('6939ac2c612004cb7','Submit Popup Reminders',0,'Success','2025-12-10 17:21:48',227,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:48','2025-12-10 17:21:48',284,1,NULL,NULL,NULL,'2025-12-10 17:21:48','2025-12-10 17:21:48','6939a9d31c969e5dc'),('6939ac2c62840dc13','Process Job Queue q0',0,'Success','2025-12-10 17:21:48',228,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:48','2025-12-10 17:21:48',285,1,NULL,NULL,NULL,'2025-12-10 17:21:48','2025-12-10 17:21:48','6939a9d31dd8daa8d'),('6939ac2c6327d3282','Process Job Queue e0',0,'Success','2025-12-10 17:21:48',229,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:48','2025-12-10 17:21:48',286,1,NULL,NULL,NULL,'2025-12-10 17:21:48','2025-12-10 17:21:48','6939a9d31f0214517'),('6939ac365f755bfe6','Submit Popup Reminders',0,'Success','2025-12-10 17:21:58',230,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:58','2025-12-10 17:21:58',288,1,NULL,NULL,NULL,'2025-12-10 17:21:58','2025-12-10 17:21:58','6939a9d31c969e5dc'),('6939ac36611eb6684','Process Job Queue q0',0,'Success','2025-12-10 17:21:58',231,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:58','2025-12-10 17:21:58',289,1,NULL,NULL,NULL,'2025-12-10 17:21:58','2025-12-10 17:21:58','6939a9d31dd8daa8d'),('6939ac3661b506cc0','Process Job Queue e0',0,'Success','2025-12-10 17:21:58',232,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:21:58','2025-12-10 17:21:58',290,1,NULL,NULL,NULL,'2025-12-10 17:21:58','2025-12-10 17:21:58','6939a9d31f0214517'),('6939ac405f65d27a3','Submit Popup Reminders',0,'Success','2025-12-10 17:22:08',233,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:08','2025-12-10 17:22:08',296,1,NULL,NULL,NULL,'2025-12-10 17:22:08','2025-12-10 17:22:08','6939a9d31c969e5dc'),('6939ac4061061c5a6','Process Job Queue q0',0,'Success','2025-12-10 17:22:08',234,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:08','2025-12-10 17:22:08',297,1,NULL,NULL,NULL,'2025-12-10 17:22:08','2025-12-10 17:22:08','6939a9d31dd8daa8d'),('6939ac4061aeb6050','Process Job Queue q1',0,'Success','2025-12-10 17:23:00',235,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:08','2025-12-10 17:23:08',320,1,NULL,NULL,NULL,'2025-12-10 17:22:08','2025-12-10 17:23:08','6939a9d31e7ebae65'),('6939ac4062084bbcc','Process Job Queue e0',0,'Success','2025-12-10 17:22:08',236,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:08','2025-12-10 17:22:08',298,1,NULL,NULL,NULL,'2025-12-10 17:22:08','2025-12-10 17:22:08','6939a9d31f0214517'),('6939ac4063df189d8','Send Email Reminders',0,'Success','2025-12-10 17:24:00',237,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:08','2025-12-10 17:24:08',346,1,NULL,NULL,NULL,'2025-12-10 17:22:08','2025-12-10 17:24:08','6939a9d35cdbef251'),('6939ac40644980abb','Send Email Notifications',0,'Success','2025-12-10 17:24:00',238,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:08','2025-12-10 17:24:08',347,1,NULL,NULL,NULL,'2025-12-10 17:22:08','2025-12-10 17:24:08','6939a9d35d85d836c'),('6939ac4064d233193','Process Webhook Queue',0,'Success','2025-12-10 17:24:00',239,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:08','2025-12-10 17:24:08',348,1,NULL,NULL,NULL,'2025-12-10 17:22:08','2025-12-10 17:24:08','6939a9d361838de09'),('6939ac4a5fac44553','Submit Popup Reminders',0,'Success','2025-12-10 17:22:18',240,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:18','2025-12-10 17:22:18',300,1,NULL,NULL,NULL,'2025-12-10 17:22:18','2025-12-10 17:22:18','6939a9d31c969e5dc'),('6939ac4a612d1d226','Process Job Queue q0',0,'Success','2025-12-10 17:22:18',241,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:18','2025-12-10 17:22:18',301,1,NULL,NULL,NULL,'2025-12-10 17:22:18','2025-12-10 17:22:18','6939a9d31dd8daa8d'),('6939ac4a61d41de87','Process Job Queue e0',0,'Success','2025-12-10 17:22:18',242,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:18','2025-12-10 17:22:18',302,1,NULL,NULL,NULL,'2025-12-10 17:22:18','2025-12-10 17:22:18','6939a9d31f0214517'),('6939ac54609f7b644','Submit Popup Reminders',0,'Success','2025-12-10 17:22:28',243,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:28','2025-12-10 17:22:28',304,1,NULL,NULL,NULL,'2025-12-10 17:22:28','2025-12-10 17:22:28','6939a9d31c969e5dc'),('6939ac546209f34c2','Process Job Queue q0',0,'Success','2025-12-10 17:22:28',244,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:28','2025-12-10 17:22:28',305,1,NULL,NULL,NULL,'2025-12-10 17:22:28','2025-12-10 17:22:28','6939a9d31dd8daa8d'),('6939ac5462d2cbddf','Process Job Queue e0',0,'Success','2025-12-10 17:22:28',245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:28','2025-12-10 17:22:28',306,1,NULL,NULL,NULL,'2025-12-10 17:22:28','2025-12-10 17:22:28','6939a9d31f0214517'),('6939ac5e6081b3424','Submit Popup Reminders',0,'Success','2025-12-10 17:22:38',246,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:38','2025-12-10 17:22:38',308,1,NULL,NULL,NULL,'2025-12-10 17:22:38','2025-12-10 17:22:38','6939a9d31c969e5dc'),('6939ac5e620304d4f','Process Job Queue q0',0,'Success','2025-12-10 17:22:38',247,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:38','2025-12-10 17:22:38',309,1,NULL,NULL,NULL,'2025-12-10 17:22:38','2025-12-10 17:22:38','6939a9d31dd8daa8d'),('6939ac5e62ab5955b','Process Job Queue e0',0,'Success','2025-12-10 17:22:38',248,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:38','2025-12-10 17:22:38',310,1,NULL,NULL,NULL,'2025-12-10 17:22:38','2025-12-10 17:22:38','6939a9d31f0214517'),('6939ac6860c0558f1','Submit Popup Reminders',0,'Success','2025-12-10 17:22:48',249,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:48','2025-12-10 17:22:48',312,1,NULL,NULL,NULL,'2025-12-10 17:22:48','2025-12-10 17:22:48','6939a9d31c969e5dc'),('6939ac6861d1c8aab','Process Job Queue q0',0,'Success','2025-12-10 17:22:48',250,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:48','2025-12-10 17:22:48',313,1,NULL,NULL,NULL,'2025-12-10 17:22:48','2025-12-10 17:22:48','6939a9d31dd8daa8d'),('6939ac68629e2ec32','Process Job Queue e0',0,'Success','2025-12-10 17:22:48',251,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:48','2025-12-10 17:22:48',314,1,NULL,NULL,NULL,'2025-12-10 17:22:48','2025-12-10 17:22:48','6939a9d31f0214517'),('6939ac726047bc6a0','Submit Popup Reminders',0,'Success','2025-12-10 17:22:58',252,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:58','2025-12-10 17:22:58',316,1,NULL,NULL,NULL,'2025-12-10 17:22:58','2025-12-10 17:22:58','6939a9d31c969e5dc'),('6939ac7261d30ad73','Process Job Queue q0',0,'Success','2025-12-10 17:22:58',253,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:58','2025-12-10 17:22:58',317,1,NULL,NULL,NULL,'2025-12-10 17:22:58','2025-12-10 17:22:58','6939a9d31dd8daa8d'),('6939ac72626f15cf1','Process Job Queue e0',0,'Success','2025-12-10 17:22:58',254,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:22:58','2025-12-10 17:22:58',318,1,NULL,NULL,NULL,'2025-12-10 17:22:58','2025-12-10 17:22:58','6939a9d31f0214517'),('6939ac7c618306bda','Submit Popup Reminders',0,'Success','2025-12-10 17:23:08',255,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:08','2025-12-10 17:23:08',321,1,NULL,NULL,NULL,'2025-12-10 17:23:08','2025-12-10 17:23:08','6939a9d31c969e5dc'),('6939ac7c62b9cf0d1','Process Job Queue q0',0,'Success','2025-12-10 17:23:08',256,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:08','2025-12-10 17:23:08',322,1,NULL,NULL,NULL,'2025-12-10 17:23:08','2025-12-10 17:23:08','6939a9d31dd8daa8d'),('6939ac7c636251f8e','Process Job Queue q1',0,'Success','2025-12-10 17:24:00',257,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:08','2025-12-10 17:24:08',349,1,NULL,NULL,NULL,'2025-12-10 17:23:08','2025-12-10 17:24:08','6939a9d31e7ebae65'),('6939ac7c63b91f0b2','Process Job Queue e0',0,'Success','2025-12-10 17:23:08',258,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:08','2025-12-10 17:23:08',323,1,NULL,NULL,NULL,'2025-12-10 17:23:08','2025-12-10 17:23:08','6939a9d31f0214517'),('6939ac8660fd6e203','Submit Popup Reminders',0,'Success','2025-12-10 17:23:18',259,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:18','2025-12-10 17:23:18',325,1,NULL,NULL,NULL,'2025-12-10 17:23:18','2025-12-10 17:23:18','6939a9d31c969e5dc'),('6939ac86626d8cee1','Process Job Queue q0',0,'Success','2025-12-10 17:23:18',260,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:18','2025-12-10 17:23:18',326,1,NULL,NULL,NULL,'2025-12-10 17:23:18','2025-12-10 17:23:18','6939a9d31dd8daa8d'),('6939ac86632931088','Process Job Queue e0',0,'Success','2025-12-10 17:23:18',261,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:18','2025-12-10 17:23:18',327,1,NULL,NULL,NULL,'2025-12-10 17:23:18','2025-12-10 17:23:18','6939a9d31f0214517'),('6939ac90614535cba','Submit Popup Reminders',0,'Success','2025-12-10 17:23:28',262,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:28','2025-12-10 17:23:28',329,1,NULL,NULL,NULL,'2025-12-10 17:23:28','2025-12-10 17:23:28','6939a9d31c969e5dc'),('6939ac9062c6dfd21','Process Job Queue q0',0,'Success','2025-12-10 17:23:28',263,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:28','2025-12-10 17:23:28',330,1,NULL,NULL,NULL,'2025-12-10 17:23:28','2025-12-10 17:23:28','6939a9d31dd8daa8d'),('6939ac9063a4ca254','Process Job Queue e0',0,'Success','2025-12-10 17:23:28',264,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:28','2025-12-10 17:23:28',331,1,NULL,NULL,NULL,'2025-12-10 17:23:28','2025-12-10 17:23:28','6939a9d31f0214517'),('6939ac9a60c359ab7','Submit Popup Reminders',0,'Success','2025-12-10 17:23:38',265,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:38','2025-12-10 17:23:38',333,1,NULL,NULL,NULL,'2025-12-10 17:23:38','2025-12-10 17:23:38','6939a9d31c969e5dc'),('6939ac9a62351cf82','Process Job Queue q0',0,'Success','2025-12-10 17:23:38',266,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:38','2025-12-10 17:23:38',334,1,NULL,NULL,NULL,'2025-12-10 17:23:38','2025-12-10 17:23:38','6939a9d31dd8daa8d'),('6939ac9a62d2dc458','Process Job Queue e0',0,'Success','2025-12-10 17:23:38',267,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:38','2025-12-10 17:23:38',335,1,NULL,NULL,NULL,'2025-12-10 17:23:38','2025-12-10 17:23:38','6939a9d31f0214517'),('6939aca460c4738a7','Submit Popup Reminders',0,'Success','2025-12-10 17:23:48',268,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:48','2025-12-10 17:23:48',337,1,NULL,NULL,NULL,'2025-12-10 17:23:48','2025-12-10 17:23:48','6939a9d31c969e5dc'),('6939aca4625a63971','Process Job Queue q0',0,'Success','2025-12-10 17:23:48',269,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:48','2025-12-10 17:23:48',338,1,NULL,NULL,NULL,'2025-12-10 17:23:48','2025-12-10 17:23:48','6939a9d31dd8daa8d'),('6939aca4631319af2','Process Job Queue e0',0,'Success','2025-12-10 17:23:48',270,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:48','2025-12-10 17:23:48',339,1,NULL,NULL,NULL,'2025-12-10 17:23:48','2025-12-10 17:23:48','6939a9d31f0214517'),('6939acae62018a670','Submit Popup Reminders',0,'Success','2025-12-10 17:23:58',271,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:58','2025-12-10 17:23:58',341,1,NULL,NULL,NULL,'2025-12-10 17:23:58','2025-12-10 17:23:58','6939a9d31c969e5dc'),('6939acae636a532a8','Process Job Queue q0',0,'Success','2025-12-10 17:23:58',272,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:58','2025-12-10 17:23:58',342,1,NULL,NULL,NULL,'2025-12-10 17:23:58','2025-12-10 17:23:58','6939a9d31dd8daa8d'),('6939acae640dffeb2','Process Job Queue e0',0,'Success','2025-12-10 17:23:58',273,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:23:58','2025-12-10 17:23:58',343,1,NULL,NULL,NULL,'2025-12-10 17:23:58','2025-12-10 17:23:58','6939a9d31f0214517'),('6939acb8619726ed1','Submit Popup Reminders',0,'Success','2025-12-10 17:24:08',274,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:08','2025-12-10 17:24:08',350,1,NULL,NULL,NULL,'2025-12-10 17:24:08','2025-12-10 17:24:08','6939a9d31c969e5dc'),('6939acb8631ca8142','Process Job Queue q0',0,'Success','2025-12-10 17:24:08',275,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:08','2025-12-10 17:24:08',351,1,NULL,NULL,NULL,'2025-12-10 17:24:08','2025-12-10 17:24:08','6939a9d31dd8daa8d'),('6939acb863d9691b0','Process Job Queue q1',0,'Success','2025-12-10 17:25:00',276,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:08','2025-12-10 17:25:08',374,1,NULL,NULL,NULL,'2025-12-10 17:24:08','2025-12-10 17:25:08','6939a9d31e7ebae65'),('6939acb8642cf2e44','Process Job Queue e0',0,'Success','2025-12-10 17:24:08',277,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:08','2025-12-10 17:24:08',352,1,NULL,NULL,NULL,'2025-12-10 17:24:08','2025-12-10 17:24:08','6939a9d31f0214517'),('6939acb865702ce0f','Send Email Reminders',0,'Success','2025-12-10 17:26:00',278,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:08','2025-12-10 17:26:08',399,1,NULL,NULL,NULL,'2025-12-10 17:24:08','2025-12-10 17:26:08','6939a9d35cdbef251'),('6939acb865e5516f0','Send Email Notifications',0,'Success','2025-12-10 17:26:00',279,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:08','2025-12-10 17:26:08',400,1,NULL,NULL,NULL,'2025-12-10 17:24:08','2025-12-10 17:26:08','6939a9d35d85d836c'),('6939acb8668b922e1','Auth Token Control',0,'Success','2025-12-10 17:30:00',280,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08',507,1,NULL,NULL,NULL,'2025-12-10 17:24:08','2025-12-10 17:30:08','6939a9d35feff1ad8'),('6939acb867192ca97','Process Webhook Queue',0,'Success','2025-12-10 17:26:00',281,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:08','2025-12-10 17:26:08',401,1,NULL,NULL,NULL,'2025-12-10 17:24:08','2025-12-10 17:26:08','6939a9d361838de09'),('6939acc261fb8bb64','Submit Popup Reminders',0,'Success','2025-12-10 17:24:18',282,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:18','2025-12-10 17:24:18',354,1,NULL,NULL,NULL,'2025-12-10 17:24:18','2025-12-10 17:24:18','6939a9d31c969e5dc'),('6939acc2635f57918','Process Job Queue q0',0,'Success','2025-12-10 17:24:18',283,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:18','2025-12-10 17:24:18',355,1,NULL,NULL,NULL,'2025-12-10 17:24:18','2025-12-10 17:24:18','6939a9d31dd8daa8d'),('6939acc263ff38190','Process Job Queue e0',0,'Success','2025-12-10 17:24:18',284,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:18','2025-12-10 17:24:18',356,1,NULL,NULL,NULL,'2025-12-10 17:24:18','2025-12-10 17:24:18','6939a9d31f0214517'),('6939accc61a2bc277','Submit Popup Reminders',0,'Success','2025-12-10 17:24:28',285,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:28','2025-12-10 17:24:28',358,1,NULL,NULL,NULL,'2025-12-10 17:24:28','2025-12-10 17:24:28','6939a9d31c969e5dc'),('6939accc633b00ea1','Process Job Queue q0',0,'Success','2025-12-10 17:24:28',286,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:28','2025-12-10 17:24:28',359,1,NULL,NULL,NULL,'2025-12-10 17:24:28','2025-12-10 17:24:28','6939a9d31dd8daa8d'),('6939accc63d987b4d','Process Job Queue e0',0,'Success','2025-12-10 17:24:28',287,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:28','2025-12-10 17:24:28',360,1,NULL,NULL,NULL,'2025-12-10 17:24:28','2025-12-10 17:24:28','6939a9d31f0214517'),('6939acd661956d013','Submit Popup Reminders',0,'Success','2025-12-10 17:24:38',288,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:38','2025-12-10 17:24:38',362,1,NULL,NULL,NULL,'2025-12-10 17:24:38','2025-12-10 17:24:38','6939a9d31c969e5dc'),('6939acd66315abcd6','Process Job Queue q0',0,'Success','2025-12-10 17:24:38',289,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:38','2025-12-10 17:24:38',363,1,NULL,NULL,NULL,'2025-12-10 17:24:38','2025-12-10 17:24:38','6939a9d31dd8daa8d'),('6939acd663e6f589d','Process Job Queue e0',0,'Success','2025-12-10 17:24:38',290,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:38','2025-12-10 17:24:38',364,1,NULL,NULL,NULL,'2025-12-10 17:24:38','2025-12-10 17:24:38','6939a9d31f0214517'),('6939ace061a350569','Submit Popup Reminders',0,'Success','2025-12-10 17:24:48',291,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:48','2025-12-10 17:24:48',366,1,NULL,NULL,NULL,'2025-12-10 17:24:48','2025-12-10 17:24:48','6939a9d31c969e5dc'),('6939ace0633329239','Process Job Queue q0',0,'Success','2025-12-10 17:24:48',292,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:48','2025-12-10 17:24:48',367,1,NULL,NULL,NULL,'2025-12-10 17:24:48','2025-12-10 17:24:48','6939a9d31dd8daa8d'),('6939ace063d2a013e','Process Job Queue e0',0,'Success','2025-12-10 17:24:48',293,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:48','2025-12-10 17:24:48',368,1,NULL,NULL,NULL,'2025-12-10 17:24:48','2025-12-10 17:24:48','6939a9d31f0214517'),('6939acea6237d8131','Submit Popup Reminders',0,'Success','2025-12-10 17:24:58',294,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:58','2025-12-10 17:24:58',370,1,NULL,NULL,NULL,'2025-12-10 17:24:58','2025-12-10 17:24:58','6939a9d31c969e5dc'),('6939acea63cebe468','Process Job Queue q0',0,'Success','2025-12-10 17:24:58',295,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:58','2025-12-10 17:24:58',371,1,NULL,NULL,NULL,'2025-12-10 17:24:58','2025-12-10 17:24:58','6939a9d31dd8daa8d'),('6939acea65022b14b','Process Job Queue e0',0,'Success','2025-12-10 17:24:58',296,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:24:58','2025-12-10 17:24:58',372,1,NULL,NULL,NULL,'2025-12-10 17:24:58','2025-12-10 17:24:58','6939a9d31f0214517'),('6939acf462b59fc77','Submit Popup Reminders',0,'Success','2025-12-10 17:25:08',297,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:08','2025-12-10 17:25:08',375,1,NULL,NULL,NULL,'2025-12-10 17:25:08','2025-12-10 17:25:08','6939a9d31c969e5dc'),('6939acf4644d6c910','Process Job Queue q0',0,'Success','2025-12-10 17:25:08',298,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:08','2025-12-10 17:25:08',376,1,NULL,NULL,NULL,'2025-12-10 17:25:08','2025-12-10 17:25:08','6939a9d31dd8daa8d'),('6939acf464eb55e94','Process Job Queue q1',0,'Success','2025-12-10 17:26:00',299,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:08','2025-12-10 17:26:08',402,1,NULL,NULL,NULL,'2025-12-10 17:25:08','2025-12-10 17:26:08','6939a9d31e7ebae65'),('6939acf46537f7ff2','Process Job Queue e0',0,'Success','2025-12-10 17:25:08',300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:08','2025-12-10 17:25:08',377,1,NULL,NULL,NULL,'2025-12-10 17:25:08','2025-12-10 17:25:08','6939a9d31f0214517'),('6939acfe64a7d85fd','Submit Popup Reminders',0,'Success','2025-12-10 17:25:18',301,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:18','2025-12-10 17:25:18',379,1,NULL,NULL,NULL,'2025-12-10 17:25:18','2025-12-10 17:25:18','6939a9d31c969e5dc'),('6939acfe6544f5bef','Process Job Queue q0',0,'Success','2025-12-10 17:25:18',302,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:18','2025-12-10 17:25:18',380,1,NULL,NULL,NULL,'2025-12-10 17:25:18','2025-12-10 17:25:18','6939a9d31dd8daa8d'),('6939acfe660aca8e4','Process Job Queue e0',0,'Success','2025-12-10 17:25:18',303,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:18','2025-12-10 17:25:18',381,1,NULL,NULL,NULL,'2025-12-10 17:25:18','2025-12-10 17:25:18','6939a9d31f0214517'),('6939ad0862a1f80b5','Submit Popup Reminders',0,'Success','2025-12-10 17:25:28',304,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:28','2025-12-10 17:25:28',383,1,NULL,NULL,NULL,'2025-12-10 17:25:28','2025-12-10 17:25:28','6939a9d31c969e5dc'),('6939ad08643166ffb','Process Job Queue q0',0,'Success','2025-12-10 17:25:28',305,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:28','2025-12-10 17:25:28',384,1,NULL,NULL,NULL,'2025-12-10 17:25:28','2025-12-10 17:25:28','6939a9d31dd8daa8d'),('6939ad08650adf2a4','Process Job Queue e0',0,'Success','2025-12-10 17:25:28',306,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:28','2025-12-10 17:25:28',385,1,NULL,NULL,NULL,'2025-12-10 17:25:28','2025-12-10 17:25:28','6939a9d31f0214517'),('6939ad1262254fa3b','Submit Popup Reminders',0,'Success','2025-12-10 17:25:38',307,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:38','2025-12-10 17:25:38',387,1,NULL,NULL,NULL,'2025-12-10 17:25:38','2025-12-10 17:25:38','6939a9d31c969e5dc'),('6939ad12639c6d718','Process Job Queue q0',0,'Success','2025-12-10 17:25:38',308,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:38','2025-12-10 17:25:38',388,1,NULL,NULL,NULL,'2025-12-10 17:25:38','2025-12-10 17:25:38','6939a9d31dd8daa8d'),('6939ad12643dfa199','Process Job Queue e0',0,'Success','2025-12-10 17:25:38',309,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:38','2025-12-10 17:25:38',389,1,NULL,NULL,NULL,'2025-12-10 17:25:38','2025-12-10 17:25:38','6939a9d31f0214517'),('6939ad1c63ab8767a','Submit Popup Reminders',0,'Success','2025-12-10 17:25:48',310,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:48','2025-12-10 17:25:48',391,1,NULL,NULL,NULL,'2025-12-10 17:25:48','2025-12-10 17:25:48','6939a9d31c969e5dc'),('6939ad1c64f28f407','Process Job Queue q0',0,'Success','2025-12-10 17:25:48',311,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:48','2025-12-10 17:25:48',392,1,NULL,NULL,NULL,'2025-12-10 17:25:48','2025-12-10 17:25:48','6939a9d31dd8daa8d'),('6939ad1c65960827c','Process Job Queue e0',0,'Success','2025-12-10 17:25:48',312,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:48','2025-12-10 17:25:48',393,1,NULL,NULL,NULL,'2025-12-10 17:25:48','2025-12-10 17:25:48','6939a9d31f0214517'),('6939ad266398aa09e','Submit Popup Reminders',0,'Success','2025-12-10 17:25:58',313,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:58','2025-12-10 17:25:58',395,1,NULL,NULL,NULL,'2025-12-10 17:25:58','2025-12-10 17:25:58','6939a9d31c969e5dc'),('6939ad2665219dcf4','Process Job Queue q0',0,'Success','2025-12-10 17:25:58',314,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:58','2025-12-10 17:25:58',396,1,NULL,NULL,NULL,'2025-12-10 17:25:58','2025-12-10 17:25:58','6939a9d31dd8daa8d'),('6939ad26661642cb0','Process Job Queue e0',0,'Success','2025-12-10 17:25:58',315,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:25:58','2025-12-10 17:25:58',397,1,NULL,NULL,NULL,'2025-12-10 17:25:58','2025-12-10 17:25:58','6939a9d31f0214517'),('6939ad30631e67824','Submit Popup Reminders',0,'Success','2025-12-10 17:26:08',316,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:08','2025-12-10 17:26:08',403,1,NULL,NULL,NULL,'2025-12-10 17:26:08','2025-12-10 17:26:08','6939a9d31c969e5dc'),('6939ad3064a65d05d','Process Job Queue q0',0,'Success','2025-12-10 17:26:08',317,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:08','2025-12-10 17:26:08',404,1,NULL,NULL,NULL,'2025-12-10 17:26:08','2025-12-10 17:26:08','6939a9d31dd8daa8d'),('6939ad3065432421b','Process Job Queue q1',0,'Success','2025-12-10 17:27:00',318,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:08','2025-12-10 17:27:08',427,1,NULL,NULL,NULL,'2025-12-10 17:26:08','2025-12-10 17:27:08','6939a9d31e7ebae65'),('6939ad3065ad382c4','Process Job Queue e0',0,'Success','2025-12-10 17:26:08',319,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:08','2025-12-10 17:26:08',405,1,NULL,NULL,NULL,'2025-12-10 17:26:08','2025-12-10 17:26:08','6939a9d31f0214517'),('6939ad3066bd77714','Send Email Reminders',0,'Success','2025-12-10 17:28:00',320,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:08','2025-12-10 17:28:08',452,1,NULL,NULL,NULL,'2025-12-10 17:26:08','2025-12-10 17:28:08','6939a9d35cdbef251'),('6939ad306711dcf68','Send Email Notifications',0,'Success','2025-12-10 17:28:00',321,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:08','2025-12-10 17:28:08',453,1,NULL,NULL,NULL,'2025-12-10 17:26:08','2025-12-10 17:28:08','6939a9d35d85d836c'),('6939ad306799271e7','Process Webhook Queue',0,'Success','2025-12-10 17:28:00',322,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:08','2025-12-10 17:28:08',454,1,NULL,NULL,NULL,'2025-12-10 17:26:08','2025-12-10 17:28:08','6939a9d361838de09'),('6939ad3a62a8a0836','Submit Popup Reminders',0,'Success','2025-12-10 17:26:18',323,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:18','2025-12-10 17:26:18',407,1,NULL,NULL,NULL,'2025-12-10 17:26:18','2025-12-10 17:26:18','6939a9d31c969e5dc'),('6939ad3a64273c2a2','Process Job Queue q0',0,'Success','2025-12-10 17:26:18',324,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:18','2025-12-10 17:26:18',408,1,NULL,NULL,NULL,'2025-12-10 17:26:18','2025-12-10 17:26:18','6939a9d31dd8daa8d'),('6939ad3a64c875df8','Process Job Queue e0',0,'Success','2025-12-10 17:26:18',325,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:18','2025-12-10 17:26:18',409,1,NULL,NULL,NULL,'2025-12-10 17:26:18','2025-12-10 17:26:18','6939a9d31f0214517'),('6939ad4463bbe926f','Submit Popup Reminders',0,'Success','2025-12-10 17:26:28',326,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:28','2025-12-10 17:26:28',411,1,NULL,NULL,NULL,'2025-12-10 17:26:28','2025-12-10 17:26:28','6939a9d31c969e5dc'),('6939ad4465071ab95','Process Job Queue q0',0,'Success','2025-12-10 17:26:28',327,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:28','2025-12-10 17:26:28',412,1,NULL,NULL,NULL,'2025-12-10 17:26:28','2025-12-10 17:26:28','6939a9d31dd8daa8d'),('6939ad4465c610dca','Process Job Queue e0',0,'Success','2025-12-10 17:26:28',328,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:28','2025-12-10 17:26:28',413,1,NULL,NULL,NULL,'2025-12-10 17:26:28','2025-12-10 17:26:28','6939a9d31f0214517'),('6939ad4e63201221a','Submit Popup Reminders',0,'Success','2025-12-10 17:26:38',329,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:38','2025-12-10 17:26:38',415,1,NULL,NULL,NULL,'2025-12-10 17:26:38','2025-12-10 17:26:38','6939a9d31c969e5dc'),('6939ad4e6497394fb','Process Job Queue q0',0,'Success','2025-12-10 17:26:38',330,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:38','2025-12-10 17:26:38',416,1,NULL,NULL,NULL,'2025-12-10 17:26:38','2025-12-10 17:26:38','6939a9d31dd8daa8d'),('6939ad4e652f43a1f','Process Job Queue e0',0,'Success','2025-12-10 17:26:38',331,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:38','2025-12-10 17:26:38',417,1,NULL,NULL,NULL,'2025-12-10 17:26:38','2025-12-10 17:26:38','6939a9d31f0214517'),('6939ad5862dd57424','Submit Popup Reminders',0,'Success','2025-12-10 17:26:48',332,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:48','2025-12-10 17:26:48',419,1,NULL,NULL,NULL,'2025-12-10 17:26:48','2025-12-10 17:26:48','6939a9d31c969e5dc'),('6939ad58646295685','Process Job Queue q0',0,'Success','2025-12-10 17:26:48',333,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:48','2025-12-10 17:26:48',420,1,NULL,NULL,NULL,'2025-12-10 17:26:48','2025-12-10 17:26:48','6939a9d31dd8daa8d'),('6939ad5864fe36ae1','Process Job Queue e0',0,'Success','2025-12-10 17:26:48',334,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:48','2025-12-10 17:26:48',421,1,NULL,NULL,NULL,'2025-12-10 17:26:48','2025-12-10 17:26:48','6939a9d31f0214517'),('6939ad626353b58d6','Submit Popup Reminders',0,'Success','2025-12-10 17:26:58',335,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:58','2025-12-10 17:26:58',423,1,NULL,NULL,NULL,'2025-12-10 17:26:58','2025-12-10 17:26:58','6939a9d31c969e5dc'),('6939ad6264cda4b7e','Process Job Queue q0',0,'Success','2025-12-10 17:26:58',336,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:58','2025-12-10 17:26:58',424,1,NULL,NULL,NULL,'2025-12-10 17:26:58','2025-12-10 17:26:58','6939a9d31dd8daa8d'),('6939ad6265738224b','Process Job Queue e0',0,'Success','2025-12-10 17:26:58',337,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:26:58','2025-12-10 17:26:58',425,1,NULL,NULL,NULL,'2025-12-10 17:26:58','2025-12-10 17:26:58','6939a9d31f0214517'),('6939ad6c640e7fcad','Submit Popup Reminders',0,'Success','2025-12-10 17:27:08',338,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:08','2025-12-10 17:27:08',428,1,NULL,NULL,NULL,'2025-12-10 17:27:08','2025-12-10 17:27:08','6939a9d31c969e5dc'),('6939ad6c64f4eff37','Process Job Queue q0',0,'Success','2025-12-10 17:27:08',339,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:08','2025-12-10 17:27:08',429,1,NULL,NULL,NULL,'2025-12-10 17:27:08','2025-12-10 17:27:08','6939a9d31dd8daa8d'),('6939ad6c66077e94d','Process Job Queue q1',0,'Success','2025-12-10 17:28:00',340,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:08','2025-12-10 17:28:08',455,1,NULL,NULL,NULL,'2025-12-10 17:27:08','2025-12-10 17:28:08','6939a9d31e7ebae65'),('6939ad6c66863f993','Process Job Queue e0',0,'Success','2025-12-10 17:27:08',341,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:08','2025-12-10 17:27:08',430,1,NULL,NULL,NULL,'2025-12-10 17:27:08','2025-12-10 17:27:08','6939a9d31f0214517'),('6939ad76634b3138b','Submit Popup Reminders',0,'Success','2025-12-10 17:27:18',342,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:18','2025-12-10 17:27:18',432,1,NULL,NULL,NULL,'2025-12-10 17:27:18','2025-12-10 17:27:18','6939a9d31c969e5dc'),('6939ad7664af3f001','Process Job Queue q0',0,'Success','2025-12-10 17:27:18',343,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:18','2025-12-10 17:27:18',433,1,NULL,NULL,NULL,'2025-12-10 17:27:18','2025-12-10 17:27:18','6939a9d31dd8daa8d'),('6939ad76654c1e493','Process Job Queue e0',0,'Success','2025-12-10 17:27:18',344,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:18','2025-12-10 17:27:18',434,1,NULL,NULL,NULL,'2025-12-10 17:27:18','2025-12-10 17:27:18','6939a9d31f0214517'),('6939ad80644ba2dd1','Submit Popup Reminders',0,'Success','2025-12-10 17:27:28',345,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:28','2025-12-10 17:27:28',436,1,NULL,NULL,NULL,'2025-12-10 17:27:28','2025-12-10 17:27:28','6939a9d31c969e5dc'),('6939ad8064dc07a31','Process Job Queue q0',0,'Success','2025-12-10 17:27:28',346,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:28','2025-12-10 17:27:28',437,1,NULL,NULL,NULL,'2025-12-10 17:27:28','2025-12-10 17:27:28','6939a9d31dd8daa8d'),('6939ad80658183358','Process Job Queue e0',0,'Success','2025-12-10 17:27:28',347,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:28','2025-12-10 17:27:28',438,1,NULL,NULL,NULL,'2025-12-10 17:27:28','2025-12-10 17:27:28','6939a9d31f0214517'),('6939ad8a645aeb2a0','Submit Popup Reminders',0,'Success','2025-12-10 17:27:38',348,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:38','2025-12-10 17:27:38',440,1,NULL,NULL,NULL,'2025-12-10 17:27:38','2025-12-10 17:27:38','6939a9d31c969e5dc'),('6939ad8a65da1afa0','Process Job Queue q0',0,'Success','2025-12-10 17:27:38',349,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:38','2025-12-10 17:27:38',441,1,NULL,NULL,NULL,'2025-12-10 17:27:38','2025-12-10 17:27:38','6939a9d31dd8daa8d'),('6939ad8a6689b3514','Process Job Queue e0',0,'Success','2025-12-10 17:27:38',350,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:38','2025-12-10 17:27:38',442,1,NULL,NULL,NULL,'2025-12-10 17:27:38','2025-12-10 17:27:38','6939a9d31f0214517'),('6939ad94650953890','Submit Popup Reminders',0,'Success','2025-12-10 17:27:48',351,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:48','2025-12-10 17:27:48',444,1,NULL,NULL,NULL,'2025-12-10 17:27:48','2025-12-10 17:27:48','6939a9d31c969e5dc'),('6939ad946650e7ec9','Process Job Queue q0',0,'Success','2025-12-10 17:27:48',352,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:48','2025-12-10 17:27:48',445,1,NULL,NULL,NULL,'2025-12-10 17:27:48','2025-12-10 17:27:48','6939a9d31dd8daa8d'),('6939ad94670314c43','Process Job Queue e0',0,'Success','2025-12-10 17:27:48',353,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:48','2025-12-10 17:27:48',446,1,NULL,NULL,NULL,'2025-12-10 17:27:48','2025-12-10 17:27:48','6939a9d31f0214517'),('6939ad9e64958aa92','Submit Popup Reminders',0,'Success','2025-12-10 17:27:58',354,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:58','2025-12-10 17:27:58',448,1,NULL,NULL,NULL,'2025-12-10 17:27:58','2025-12-10 17:27:58','6939a9d31c969e5dc'),('6939ad9e662621f76','Process Job Queue q0',0,'Success','2025-12-10 17:27:58',355,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:58','2025-12-10 17:27:58',449,1,NULL,NULL,NULL,'2025-12-10 17:27:58','2025-12-10 17:27:58','6939a9d31dd8daa8d'),('6939ad9e66c1cb11e','Process Job Queue e0',0,'Success','2025-12-10 17:27:58',356,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:27:58','2025-12-10 17:27:58',450,1,NULL,NULL,NULL,'2025-12-10 17:27:58','2025-12-10 17:27:58','6939a9d31f0214517'),('6939ada8646b863a3','Submit Popup Reminders',0,'Success','2025-12-10 17:28:08',357,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:08','2025-12-10 17:28:08',456,1,NULL,NULL,NULL,'2025-12-10 17:28:08','2025-12-10 17:28:08','6939a9d31c969e5dc'),('6939ada865e3c0fd8','Process Job Queue q0',0,'Success','2025-12-10 17:28:08',358,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:08','2025-12-10 17:28:08',457,1,NULL,NULL,NULL,'2025-12-10 17:28:08','2025-12-10 17:28:08','6939a9d31dd8daa8d'),('6939ada86685a14a5','Process Job Queue q1',0,'Success','2025-12-10 17:29:00',359,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:08','2025-12-10 17:29:08',480,1,NULL,NULL,NULL,'2025-12-10 17:28:08','2025-12-10 17:29:08','6939a9d31e7ebae65'),('6939ada866df66124','Process Job Queue e0',0,'Success','2025-12-10 17:28:08',360,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:08','2025-12-10 17:28:08',458,1,NULL,NULL,NULL,'2025-12-10 17:28:08','2025-12-10 17:28:08','6939a9d31f0214517'),('6939ada867ed8b791','Send Email Reminders',0,'Success','2025-12-10 17:30:00',361,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08',508,1,NULL,NULL,NULL,'2025-12-10 17:28:08','2025-12-10 17:30:08','6939a9d35cdbef251'),('6939ada8685078d25','Send Email Notifications',0,'Success','2025-12-10 17:30:00',362,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08',509,1,NULL,NULL,NULL,'2025-12-10 17:28:08','2025-12-10 17:30:08','6939a9d35d85d836c'),('6939ada868daab674','Process Webhook Queue',0,'Success','2025-12-10 17:30:00',363,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08',510,1,NULL,NULL,NULL,'2025-12-10 17:28:08','2025-12-10 17:30:08','6939a9d361838de09'),('6939adb264b019e55','Submit Popup Reminders',0,'Success','2025-12-10 17:28:18',364,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:18','2025-12-10 17:28:18',460,1,NULL,NULL,NULL,'2025-12-10 17:28:18','2025-12-10 17:28:18','6939a9d31c969e5dc'),('6939adb2661f47e33','Process Job Queue q0',0,'Success','2025-12-10 17:28:18',365,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:18','2025-12-10 17:28:18',461,1,NULL,NULL,NULL,'2025-12-10 17:28:18','2025-12-10 17:28:18','6939a9d31dd8daa8d'),('6939adb266c4eead0','Process Job Queue e0',0,'Success','2025-12-10 17:28:18',366,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:18','2025-12-10 17:28:18',462,1,NULL,NULL,NULL,'2025-12-10 17:28:18','2025-12-10 17:28:18','6939a9d31f0214517'),('6939adbc655a2e449','Submit Popup Reminders',0,'Success','2025-12-10 17:28:28',367,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:28','2025-12-10 17:28:28',464,1,NULL,NULL,NULL,'2025-12-10 17:28:28','2025-12-10 17:28:28','6939a9d31c969e5dc'),('6939adbc66c750e73','Process Job Queue q0',0,'Success','2025-12-10 17:28:28',368,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:28','2025-12-10 17:28:28',465,1,NULL,NULL,NULL,'2025-12-10 17:28:28','2025-12-10 17:28:28','6939a9d31dd8daa8d'),('6939adbc677284d84','Process Job Queue e0',0,'Success','2025-12-10 17:28:28',369,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:28','2025-12-10 17:28:28',466,1,NULL,NULL,NULL,'2025-12-10 17:28:28','2025-12-10 17:28:28','6939a9d31f0214517'),('6939adc6649bd0839','Submit Popup Reminders',0,'Success','2025-12-10 17:28:38',370,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:38','2025-12-10 17:28:38',468,1,NULL,NULL,NULL,'2025-12-10 17:28:38','2025-12-10 17:28:38','6939a9d31c969e5dc'),('6939adc66627963ed','Process Job Queue q0',0,'Success','2025-12-10 17:28:38',371,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:38','2025-12-10 17:28:38',469,1,NULL,NULL,NULL,'2025-12-10 17:28:38','2025-12-10 17:28:38','6939a9d31dd8daa8d'),('6939adc666c79bdd7','Process Job Queue e0',0,'Success','2025-12-10 17:28:38',372,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:38','2025-12-10 17:28:38',470,1,NULL,NULL,NULL,'2025-12-10 17:28:38','2025-12-10 17:28:38','6939a9d31f0214517'),('6939add064a84edf2','Submit Popup Reminders',0,'Success','2025-12-10 17:28:48',373,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:48','2025-12-10 17:28:48',472,1,NULL,NULL,NULL,'2025-12-10 17:28:48','2025-12-10 17:28:48','6939a9d31c969e5dc'),('6939add0663f59c67','Process Job Queue q0',0,'Success','2025-12-10 17:28:48',374,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:48','2025-12-10 17:28:48',473,1,NULL,NULL,NULL,'2025-12-10 17:28:48','2025-12-10 17:28:48','6939a9d31dd8daa8d'),('6939add066d438be8','Process Job Queue e0',0,'Success','2025-12-10 17:28:48',375,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:48','2025-12-10 17:28:48',474,1,NULL,NULL,NULL,'2025-12-10 17:28:48','2025-12-10 17:28:48','6939a9d31f0214517'),('6939adda652da5b28','Submit Popup Reminders',0,'Success','2025-12-10 17:28:58',376,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:58','2025-12-10 17:28:58',476,1,NULL,NULL,NULL,'2025-12-10 17:28:58','2025-12-10 17:28:58','6939a9d31c969e5dc'),('6939adda669c3f266','Process Job Queue q0',0,'Success','2025-12-10 17:28:58',377,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:58','2025-12-10 17:28:58',477,1,NULL,NULL,NULL,'2025-12-10 17:28:58','2025-12-10 17:28:58','6939a9d31dd8daa8d'),('6939adda674c852f0','Process Job Queue e0',0,'Success','2025-12-10 17:28:58',378,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:28:58','2025-12-10 17:28:58',478,1,NULL,NULL,NULL,'2025-12-10 17:28:58','2025-12-10 17:28:58','6939a9d31f0214517'),('6939ade4648fc0f11','Submit Popup Reminders',0,'Success','2025-12-10 17:29:08',379,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:08','2025-12-10 17:29:08',481,1,NULL,NULL,NULL,'2025-12-10 17:29:08','2025-12-10 17:29:08','6939a9d31c969e5dc'),('6939ade4662657383','Process Job Queue q0',0,'Success','2025-12-10 17:29:08',380,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:08','2025-12-10 17:29:08',482,1,NULL,NULL,NULL,'2025-12-10 17:29:08','2025-12-10 17:29:08','6939a9d31dd8daa8d'),('6939ade466cc9de8d','Process Job Queue q1',0,'Success','2025-12-10 17:30:00',381,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08',511,1,NULL,NULL,NULL,'2025-12-10 17:29:08','2025-12-10 17:30:08','6939a9d31e7ebae65'),('6939ade4672d1991c','Process Job Queue e0',0,'Success','2025-12-10 17:29:08',382,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:08','2025-12-10 17:29:08',483,1,NULL,NULL,NULL,'2025-12-10 17:29:08','2025-12-10 17:29:08','6939a9d31f0214517'),('6939adee65821e93c','Submit Popup Reminders',0,'Success','2025-12-10 17:29:18',383,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:18','2025-12-10 17:29:18',485,1,NULL,NULL,NULL,'2025-12-10 17:29:18','2025-12-10 17:29:18','6939a9d31c969e5dc'),('6939adee6752b3aaa','Process Job Queue q0',0,'Success','2025-12-10 17:29:18',384,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:18','2025-12-10 17:29:18',486,1,NULL,NULL,NULL,'2025-12-10 17:29:18','2025-12-10 17:29:18','6939a9d31dd8daa8d'),('6939adee67eea3d49','Process Job Queue e0',0,'Success','2025-12-10 17:29:18',385,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:18','2025-12-10 17:29:18',487,1,NULL,NULL,NULL,'2025-12-10 17:29:18','2025-12-10 17:29:18','6939a9d31f0214517'),('6939adf868f1b214f','Submit Popup Reminders',0,'Success','2025-12-10 17:29:28',386,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:28','2025-12-10 17:29:28',489,1,NULL,NULL,NULL,'2025-12-10 17:29:28','2025-12-10 17:29:28','6939a9d31c969e5dc'),('6939adf8697d2585d','Process Job Queue q0',0,'Success','2025-12-10 17:29:28',387,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:28','2025-12-10 17:29:28',490,1,NULL,NULL,NULL,'2025-12-10 17:29:28','2025-12-10 17:29:28','6939a9d31dd8daa8d'),('6939adf86a3b7d00f','Process Job Queue e0',0,'Success','2025-12-10 17:29:28',388,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:28','2025-12-10 17:29:28',491,1,NULL,NULL,NULL,'2025-12-10 17:29:28','2025-12-10 17:29:28','6939a9d31f0214517'),('6939ae026507c417a','Submit Popup Reminders',0,'Success','2025-12-10 17:29:38',389,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:38','2025-12-10 17:29:38',493,1,NULL,NULL,NULL,'2025-12-10 17:29:38','2025-12-10 17:29:38','6939a9d31c969e5dc'),('6939ae0266a825c56','Process Job Queue q0',0,'Success','2025-12-10 17:29:38',390,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:38','2025-12-10 17:29:38',494,1,NULL,NULL,NULL,'2025-12-10 17:29:38','2025-12-10 17:29:38','6939a9d31dd8daa8d'),('6939ae02679e59606','Process Job Queue e0',0,'Success','2025-12-10 17:29:38',391,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:38','2025-12-10 17:29:38',495,1,NULL,NULL,NULL,'2025-12-10 17:29:38','2025-12-10 17:29:38','6939a9d31f0214517'),('6939ae0c6606571db','Submit Popup Reminders',0,'Success','2025-12-10 17:29:48',392,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:48','2025-12-10 17:29:48',497,1,NULL,NULL,NULL,'2025-12-10 17:29:48','2025-12-10 17:29:48','6939a9d31c969e5dc'),('6939ae0c678678aa0','Process Job Queue q0',0,'Success','2025-12-10 17:29:48',393,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:48','2025-12-10 17:29:48',498,1,NULL,NULL,NULL,'2025-12-10 17:29:48','2025-12-10 17:29:48','6939a9d31dd8daa8d'),('6939ae0c684235407','Process Job Queue e0',0,'Success','2025-12-10 17:29:48',394,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:48','2025-12-10 17:29:48',499,1,NULL,NULL,NULL,'2025-12-10 17:29:48','2025-12-10 17:29:48','6939a9d31f0214517'),('6939ae1665a9a4cee','Submit Popup Reminders',0,'Success','2025-12-10 17:29:58',395,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:58','2025-12-10 17:29:58',501,1,NULL,NULL,NULL,'2025-12-10 17:29:58','2025-12-10 17:29:58','6939a9d31c969e5dc'),('6939ae16673bbd589','Process Job Queue q0',0,'Success','2025-12-10 17:29:58',396,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:58','2025-12-10 17:29:58',502,1,NULL,NULL,NULL,'2025-12-10 17:29:58','2025-12-10 17:29:58','6939a9d31dd8daa8d'),('6939ae1667eb062be','Process Job Queue e0',0,'Success','2025-12-10 17:29:58',397,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:29:58','2025-12-10 17:29:58',503,1,NULL,NULL,NULL,'2025-12-10 17:29:58','2025-12-10 17:29:58','6939a9d31f0214517'),('6939ae2066b773c5e','Submit Popup Reminders',0,'Success','2025-12-10 17:30:08',398,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08',512,1,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d31c969e5dc'),('6939ae20675d79271','Process Job Queue q0',0,'Success','2025-12-10 17:30:08',399,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08',513,1,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d31dd8daa8d'),('6939ae206851f971f','Process Job Queue q1',0,'Success','2025-12-10 17:31:00',400,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:31:08','2025-12-10 17:31:08',536,1,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:31:08','6939a9d31e7ebae65'),('6939ae2068b10d09c','Process Job Queue e0',0,'Success','2025-12-10 17:30:08',401,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08',514,1,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d31f0214517'),('6939ae206a2726529','Send Email Reminders',0,'Pending','2025-12-10 17:32:00',402,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d35cdbef251'),('6939ae206a98d0ba0','Send Email Notifications',0,'Pending','2025-12-10 17:32:00',403,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d35d85d836c'),('6939ae206b168a288','Send Mass Emails',0,'Pending','2025-12-10 17:50:00',404,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d35ed0d18cb'),('6939ae206b7ef713b','Auth Token Control',0,'Pending','2025-12-10 17:36:00',405,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d35feff1ad8'),('6939ae206bdff68d4','Process Webhook Queue',0,'Pending','2025-12-10 17:32:00',406,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d361838de09'),('6939ae206c365bbda','Send Scheduled Emails',0,'Pending','2025-12-10 17:40:00',407,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d3623830b3b'),('6939ae2a66375f62f','Submit Popup Reminders',0,'Success','2025-12-10 17:30:18',408,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:18','2025-12-10 17:30:18',516,1,NULL,NULL,NULL,'2025-12-10 17:30:18','2025-12-10 17:30:18','6939a9d31c969e5dc'),('6939ae2a67bf21bf6','Process Job Queue q0',0,'Success','2025-12-10 17:30:18',409,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:18','2025-12-10 17:30:18',517,1,NULL,NULL,NULL,'2025-12-10 17:30:18','2025-12-10 17:30:18','6939a9d31dd8daa8d'),('6939ae2a686e8cc37','Process Job Queue e0',0,'Success','2025-12-10 17:30:18',410,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:18','2025-12-10 17:30:18',518,1,NULL,NULL,NULL,'2025-12-10 17:30:18','2025-12-10 17:30:18','6939a9d31f0214517'),('6939ae34669a676cf','Submit Popup Reminders',0,'Success','2025-12-10 17:30:28',411,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:28','2025-12-10 17:30:28',520,1,NULL,NULL,NULL,'2025-12-10 17:30:28','2025-12-10 17:30:28','6939a9d31c969e5dc'),('6939ae34681bdd1ab','Process Job Queue q0',0,'Success','2025-12-10 17:30:28',412,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:28','2025-12-10 17:30:28',521,1,NULL,NULL,NULL,'2025-12-10 17:30:28','2025-12-10 17:30:28','6939a9d31dd8daa8d'),('6939ae3468c20591a','Process Job Queue e0',0,'Success','2025-12-10 17:30:28',413,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:28','2025-12-10 17:30:28',522,1,NULL,NULL,NULL,'2025-12-10 17:30:28','2025-12-10 17:30:28','6939a9d31f0214517'),('6939ae3e65bff6170','Submit Popup Reminders',0,'Success','2025-12-10 17:30:38',414,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:38','2025-12-10 17:30:38',524,1,NULL,NULL,NULL,'2025-12-10 17:30:38','2025-12-10 17:30:38','6939a9d31c969e5dc'),('6939ae3e674433933','Process Job Queue q0',0,'Success','2025-12-10 17:30:38',415,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:38','2025-12-10 17:30:38',525,1,NULL,NULL,NULL,'2025-12-10 17:30:38','2025-12-10 17:30:38','6939a9d31dd8daa8d'),('6939ae3e67f043fd4','Process Job Queue e0',0,'Success','2025-12-10 17:30:38',416,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:38','2025-12-10 17:30:38',526,1,NULL,NULL,NULL,'2025-12-10 17:30:38','2025-12-10 17:30:38','6939a9d31f0214517'),('6939ae4866c68f2a9','Submit Popup Reminders',0,'Success','2025-12-10 17:30:48',417,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:48','2025-12-10 17:30:48',528,1,NULL,NULL,NULL,'2025-12-10 17:30:48','2025-12-10 17:30:48','6939a9d31c969e5dc'),('6939ae48685758bdd','Process Job Queue q0',0,'Success','2025-12-10 17:30:48',418,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:48','2025-12-10 17:30:48',529,1,NULL,NULL,NULL,'2025-12-10 17:30:48','2025-12-10 17:30:48','6939a9d31dd8daa8d'),('6939ae486902fe031','Process Job Queue e0',0,'Success','2025-12-10 17:30:48',419,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:48','2025-12-10 17:30:48',530,1,NULL,NULL,NULL,'2025-12-10 17:30:48','2025-12-10 17:30:48','6939a9d31f0214517'),('6939ae5267efb123e','Submit Popup Reminders',0,'Success','2025-12-10 17:30:58',420,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:58','2025-12-10 17:30:58',532,1,NULL,NULL,NULL,'2025-12-10 17:30:58','2025-12-10 17:30:58','6939a9d31c969e5dc'),('6939ae5269364a030','Process Job Queue q0',0,'Success','2025-12-10 17:30:58',421,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:58','2025-12-10 17:30:58',533,1,NULL,NULL,NULL,'2025-12-10 17:30:58','2025-12-10 17:30:58','6939a9d31dd8daa8d'),('6939ae526a5e5993b','Process Job Queue e0',0,'Success','2025-12-10 17:30:58',422,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:30:58','2025-12-10 17:30:58',534,1,NULL,NULL,NULL,'2025-12-10 17:30:58','2025-12-10 17:30:58','6939a9d31f0214517'),('6939ae5c66ccbbd43','Submit Popup Reminders',0,'Success','2025-12-10 17:31:08',423,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:31:08','2025-12-10 17:31:08',537,1,NULL,NULL,NULL,'2025-12-10 17:31:08','2025-12-10 17:31:08','6939a9d31c969e5dc'),('6939ae5c67a4e7555','Process Job Queue q0',0,'Success','2025-12-10 17:31:08',424,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:31:08','2025-12-10 17:31:08',538,1,NULL,NULL,NULL,'2025-12-10 17:31:08','2025-12-10 17:31:08','6939a9d31dd8daa8d'),('6939ae5c689df6312','Process Job Queue q1',0,'Pending','2025-12-10 17:32:00',425,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2025-12-10 17:31:08','2025-12-10 17:31:08','6939a9d31e7ebae65'),('6939ae5c6aaa4a98a','Process Job Queue e0',0,'Success','2025-12-10 17:31:08',426,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:31:08','2025-12-10 17:31:08',539,1,NULL,NULL,NULL,'2025-12-10 17:31:08','2025-12-10 17:31:08','6939a9d31f0214517'),('6939ae66680378e39','Submit Popup Reminders',0,'Success','2025-12-10 17:31:18',427,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:31:18','2025-12-10 17:31:18',541,1,NULL,NULL,NULL,'2025-12-10 17:31:18','2025-12-10 17:31:18','6939a9d31c969e5dc'),('6939ae66693809fe0','Process Job Queue q0',0,'Success','2025-12-10 17:31:18',428,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:31:18','2025-12-10 17:31:18',542,1,NULL,NULL,NULL,'2025-12-10 17:31:18','2025-12-10 17:31:18','6939a9d31dd8daa8d'),('6939ae666a371ab53','Process Job Queue e0',0,'Success','2025-12-10 17:31:18',429,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:31:18','2025-12-10 17:31:18',543,1,NULL,NULL,NULL,'2025-12-10 17:31:18','2025-12-10 17:31:18','6939a9d31f0214517'),('6939ae70687ae8f10','Submit Popup Reminders',0,'Success','2025-12-10 17:31:28',430,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:31:28','2025-12-10 17:31:28',545,1,NULL,NULL,NULL,'2025-12-10 17:31:28','2025-12-10 17:31:28','6939a9d31c969e5dc'),('6939ae7069bf34c97','Process Job Queue q0',0,'Success','2025-12-10 17:31:28',431,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:31:28','2025-12-10 17:31:28',546,1,NULL,NULL,NULL,'2025-12-10 17:31:28','2025-12-10 17:31:28','6939a9d31dd8daa8d'),('6939ae706a88073c5','Process Job Queue e0',0,'Success','2025-12-10 17:31:28',432,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:31:28','2025-12-10 17:31:28',547,1,NULL,NULL,NULL,'2025-12-10 17:31:28','2025-12-10 17:31:28','6939a9d31f0214517'),('6939ae7a66a01def7','Submit Popup Reminders',0,'Success','2025-12-10 17:31:38',433,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:31:38','2025-12-10 17:31:38',549,1,NULL,NULL,NULL,'2025-12-10 17:31:38','2025-12-10 17:31:38','6939a9d31c969e5dc'),('6939ae7a68132aff4','Process Job Queue q0',0,'Success','2025-12-10 17:31:38',434,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:31:38','2025-12-10 17:31:38',550,1,NULL,NULL,NULL,'2025-12-10 17:31:38','2025-12-10 17:31:38','6939a9d31dd8daa8d'),('6939ae7a68d199fdd','Process Job Queue e0',0,'Success','2025-12-10 17:31:38',435,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:31:38','2025-12-10 17:31:38',551,1,NULL,NULL,NULL,'2025-12-10 17:31:38','2025-12-10 17:31:38','6939a9d31f0214517'),('6939ae8466c83ebfa','Submit Popup Reminders',0,'Success','2025-12-10 17:31:48',436,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:31:48','2025-12-10 17:31:48',553,1,NULL,NULL,NULL,'2025-12-10 17:31:48','2025-12-10 17:31:48','6939a9d31c969e5dc'),('6939ae846826e7ed7','Process Job Queue q0',0,'Success','2025-12-10 17:31:48',437,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:31:48','2025-12-10 17:31:48',554,1,NULL,NULL,NULL,'2025-12-10 17:31:48','2025-12-10 17:31:48','6939a9d31dd8daa8d'),('6939ae8468d17b493','Process Job Queue e0',0,'Success','2025-12-10 17:31:48',438,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-10 17:31:48','2025-12-10 17:31:48',555,1,NULL,NULL,NULL,'2025-12-10 17:31:48','2025-12-10 17:31:48','6939a9d31f0214517');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kanban_order`
--

DROP TABLE IF EXISTS `kanban_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kanban_order` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `order` smallint DEFAULT NULL,
  `group` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ENTITY_USER_ID` (`entity_type`,`entity_id`,`user_id`),
  KEY `IDX_ENTITY_TYPE` (`entity_type`),
  KEY `IDX_ENTITY_TYPE_USER_ID` (`entity_type`,`user_id`),
  KEY `IDX_ENTITY` (`entity_id`,`entity_type`),
  KEY `IDX_USER` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kanban_order`
--

LOCK TABLES `kanban_order` WRITE;
/*!40000 ALTER TABLE `kanban_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `kanban_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledge_base_article`
--

DROP TABLE IF EXISTS `knowledge_base_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledge_base_article` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Draft',
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Article',
  `publish_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `order` int DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `body` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body_plain` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_number` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_ASSIGNED_USER_ID` (`assigned_user_id`),
  FULLTEXT KEY `IDX_SYSTEM_FULL_TEXT_SEARCH` (`name`,`body_plain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledge_base_article`
--

LOCK TABLES `knowledge_base_article` WRITE;
/*!40000 ALTER TABLE `knowledge_base_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `knowledge_base_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledge_base_article_knowledge_base_category`
--

DROP TABLE IF EXISTS `knowledge_base_article_knowledge_base_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledge_base_article_knowledge_base_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `knowledge_base_article_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `knowledge_base_category_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_KNOWLEDGE_BASE_ARTICLE_ID_KNOWLEDGE_BASE_CATEGORY_ID` (`knowledge_base_article_id`,`knowledge_base_category_id`),
  KEY `IDX_KNOWLEDGE_BASE_ARTICLE_ID` (`knowledge_base_article_id`),
  KEY `IDX_KNOWLEDGE_BASE_CATEGORY_ID` (`knowledge_base_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledge_base_article_knowledge_base_category`
--

LOCK TABLES `knowledge_base_article_knowledge_base_category` WRITE;
/*!40000 ALTER TABLE `knowledge_base_article_knowledge_base_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `knowledge_base_article_knowledge_base_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledge_base_article_portal`
--

DROP TABLE IF EXISTS `knowledge_base_article_portal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledge_base_article_portal` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `knowledge_base_article_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_PORTAL_ID_KNOWLEDGE_BASE_ARTICLE_ID` (`portal_id`,`knowledge_base_article_id`),
  KEY `IDX_PORTAL_ID` (`portal_id`),
  KEY `IDX_KNOWLEDGE_BASE_ARTICLE_ID` (`knowledge_base_article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledge_base_article_portal`
--

LOCK TABLES `knowledge_base_article_portal` WRITE;
/*!40000 ALTER TABLE `knowledge_base_article_portal` DISABLE KEYS */;
/*!40000 ALTER TABLE `knowledge_base_article_portal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledge_base_category`
--

DROP TABLE IF EXISTS `knowledge_base_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledge_base_category` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `order` int DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledge_base_category`
--

LOCK TABLES `knowledge_base_category` WRITE;
/*!40000 ALTER TABLE `knowledge_base_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `knowledge_base_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledge_base_category_path`
--

DROP TABLE IF EXISTS `knowledge_base_category_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledge_base_category_path` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ascendor_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descendor_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ASCENDOR_ID` (`ascendor_id`),
  KEY `IDX_DESCENDOR_ID` (`descendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledge_base_category_path`
--

LOCK TABLES `knowledge_base_category_path` WRITE;
/*!40000 ALTER TABLE `knowledge_base_category_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `knowledge_base_category_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout_record`
--

DROP TABLE IF EXISTS `layout_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `layout_record` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `layout_set_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_NAME_LAYOUT_SET_ID` (`name`,`layout_set_id`),
  KEY `IDX_LAYOUT_SET_ID` (`layout_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout_record`
--

LOCK TABLES `layout_record` WRITE;
/*!40000 ALTER TABLE `layout_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `layout_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout_set`
--

DROP TABLE IF EXISTS `layout_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `layout_set` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `layout_list` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout_set`
--

LOCK TABLES `layout_set` WRITE;
/*!40000 ALTER TABLE `layout_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `layout_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead`
--

DROP TABLE IF EXISTS `lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `salutation_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'New',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `industry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opportunity_amount` double DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_postal_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `do_not_call` tinyint(1) NOT NULL DEFAULT '0',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `converted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opportunity_amount_currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stream_updated_at` datetime DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_account_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_contact_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_opportunity_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CREATED_AT_ID` (`created_at`,`id`),
  KEY `IDX_FIRST_NAME` (`first_name`,`deleted`),
  KEY `IDX_NAME` (`first_name`,`last_name`),
  KEY `IDX_STATUS` (`status`,`deleted`),
  KEY `IDX_CREATED_AT` (`created_at`,`deleted`),
  KEY `IDX_CREATED_AT_STATUS` (`created_at`,`status`),
  KEY `IDX_ASSIGNED_USER` (`assigned_user_id`,`deleted`),
  KEY `IDX_ASSIGNED_USER_STATUS` (`assigned_user_id`,`status`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_ASSIGNED_USER_ID` (`assigned_user_id`),
  KEY `IDX_CAMPAIGN_ID` (`campaign_id`),
  KEY `IDX_CREATED_ACCOUNT_ID` (`created_account_id`),
  KEY `IDX_CREATED_CONTACT_ID` (`created_contact_id`),
  KEY `IDX_CREATED_OPPORTUNITY_ID` (`created_opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead`
--

LOCK TABLES `lead` WRITE;
/*!40000 ALTER TABLE `lead` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_capture`
--

DROP TABLE IF EXISTS `lead_capture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_capture` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `subscribe_to_target_list` tinyint(1) NOT NULL DEFAULT '1',
  `subscribe_contact_to_target_list` tinyint(1) NOT NULL DEFAULT '1',
  `field_list` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `field_params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `duplicate_check` tinyint(1) NOT NULL DEFAULT '1',
  `opt_in_confirmation` tinyint(1) NOT NULL DEFAULT '0',
  `opt_in_confirmation_lifetime` int DEFAULT '48',
  `opt_in_confirmation_success_message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_lead_before_opt_in_confirmation` tinyint(1) NOT NULL DEFAULT '0',
  `skip_opt_in_confirmation_if_subscribed` tinyint(1) NOT NULL DEFAULT '0',
  `lead_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Web Site',
  `api_key` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `form_title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_theme` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `form_success_text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `form_success_redirect_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_language` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_frame_ancestors` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `form_captcha` tinyint(1) NOT NULL DEFAULT '0',
  `phone_number_country` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `campaign_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_list_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opt_in_confirmation_email_template_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_team_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inbound_email_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CAMPAIGN_ID` (`campaign_id`),
  KEY `IDX_TARGET_LIST_ID` (`target_list_id`),
  KEY `IDX_OPT_IN_CONFIRMATION_EMAIL_TEMPLATE_ID` (`opt_in_confirmation_email_template_id`),
  KEY `IDX_TARGET_TEAM_ID` (`target_team_id`),
  KEY `IDX_INBOUND_EMAIL_ID` (`inbound_email_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_capture`
--

LOCK TABLES `lead_capture` WRITE;
/*!40000 ALTER TABLE `lead_capture` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_capture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_capture_log_record`
--

DROP TABLE IF EXISTS `lead_capture_log_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_capture_log_record` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `number` int unsigned NOT NULL AUTO_INCREMENT,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_created` tinyint(1) NOT NULL DEFAULT '0',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `lead_capture_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_NUMBER` (`number`),
  KEY `IDX_LEAD_CAPTURE_ID` (`lead_capture_id`),
  KEY `IDX_TARGET` (`target_id`,`target_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_capture_log_record`
--

LOCK TABLES `lead_capture_log_record` WRITE;
/*!40000 ALTER TABLE `lead_capture_log_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_capture_log_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_meeting`
--

DROP TABLE IF EXISTS `lead_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_meeting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lead_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meeting_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'None',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_LEAD_ID_MEETING_ID` (`lead_id`,`meeting_id`),
  KEY `IDX_LEAD_ID` (`lead_id`),
  KEY `IDX_MEETING_ID` (`meeting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_meeting`
--

LOCK TABLES `lead_meeting` WRITE;
/*!40000 ALTER TABLE `lead_meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_target_list`
--

DROP TABLE IF EXISTS `lead_target_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_target_list` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lead_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_list_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opted_out` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_LEAD_ID_TARGET_LIST_ID` (`lead_id`,`target_list_id`),
  KEY `IDX_LEAD_ID` (`lead_id`),
  KEY `IDX_TARGET_LIST_ID` (`target_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_target_list`
--

LOCK TABLES `lead_target_list` WRITE;
/*!40000 ALTER TABLE `lead_target_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_target_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mass_action`
--

DROP TABLE IF EXISTS `mass_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mass_action` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `entity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `processed_count` int DEFAULT NULL,
  `notify_on_finish` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mass_action`
--

LOCK TABLES `mass_action` WRITE;
/*!40000 ALTER TABLE `mass_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `mass_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mass_email`
--

DROP TABLE IF EXISTS `mass_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mass_email` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `store_sent_emails` tinyint(1) NOT NULL DEFAULT '0',
  `opt_out_entirely` tinyint(1) NOT NULL DEFAULT '0',
  `from_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply_to_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply_to_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `email_template_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inbound_email_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EMAIL_TEMPLATE_ID` (`email_template_id`),
  KEY `IDX_CAMPAIGN_ID` (`campaign_id`),
  KEY `IDX_INBOUND_EMAIL_ID` (`inbound_email_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mass_email`
--

LOCK TABLES `mass_email` WRITE;
/*!40000 ALTER TABLE `mass_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `mass_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mass_email_target_list`
--

DROP TABLE IF EXISTS `mass_email_target_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mass_email_target_list` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mass_email_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_list_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_MASS_EMAIL_ID_TARGET_LIST_ID` (`mass_email_id`,`target_list_id`),
  KEY `IDX_MASS_EMAIL_ID` (`mass_email_id`),
  KEY `IDX_TARGET_LIST_ID` (`target_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mass_email_target_list`
--

LOCK TABLES `mass_email_target_list` WRITE;
/*!40000 ALTER TABLE `mass_email_target_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `mass_email_target_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mass_email_target_list_excluding`
--

DROP TABLE IF EXISTS `mass_email_target_list_excluding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mass_email_target_list_excluding` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mass_email_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_list_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_MASS_EMAIL_ID_TARGET_LIST_ID` (`mass_email_id`,`target_list_id`),
  KEY `IDX_MASS_EMAIL_ID` (`mass_email_id`),
  KEY `IDX_TARGET_LIST_ID` (`target_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mass_email_target_list_excluding`
--

LOCK TABLES `mass_email_target_list_excluding` WRITE;
/*!40000 ALTER TABLE `mass_email_target_list_excluding` DISABLE KEYS */;
/*!40000 ALTER TABLE `mass_email_target_list_excluding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting`
--

DROP TABLE IF EXISTS `meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Planned',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `is_all_day` tinyint(1) NOT NULL DEFAULT '0',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `join_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `date_start_date` date DEFAULT NULL,
  `date_end_date` date DEFAULT NULL,
  `stream_updated_at` datetime DEFAULT NULL,
  `parent_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DATE_START_STATUS` (`date_start`,`status`),
  KEY `IDX_DATE_START` (`date_start`,`deleted`),
  KEY `IDX_STATUS` (`status`,`deleted`),
  KEY `IDX_ASSIGNED_USER` (`assigned_user_id`,`deleted`),
  KEY `IDX_ASSIGNED_USER_STATUS` (`assigned_user_id`,`status`),
  KEY `IDX_UID` (`uid`),
  KEY `IDX_PARENT` (`parent_id`,`parent_type`),
  KEY `IDX_ACCOUNT_ID` (`account_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_ASSIGNED_USER_ID` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting`
--

LOCK TABLES `meeting` WRITE;
/*!40000 ALTER TABLE `meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_user`
--

DROP TABLE IF EXISTS `meeting_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meeting_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'None',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_USER_ID_MEETING_ID` (`user_id`,`meeting_id`),
  KEY `IDX_USER_ID` (`user_id`),
  KEY `IDX_MEETING_ID` (`meeting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_user`
--

LOCK TABLES `meeting_user` WRITE;
/*!40000 ALTER TABLE `meeting_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `next_number`
--

DROP TABLE IF EXISTS `next_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `next_number` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `entity_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `IDX_ENTITY_TYPE_FIELD_NAME` (`entity_type`,`field_name`),
  KEY `IDX_ENTITY_TYPE` (`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `next_number`
--

LOCK TABLES `next_number` WRITE;
/*!40000 ALTER TABLE `next_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `next_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `note` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `post` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Post',
  `target_type` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` bigint unsigned NOT NULL AUTO_INCREMENT,
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `is_internal` tinyint(1) NOT NULL DEFAULT '0',
  `is_pinned` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `parent_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `super_parent_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `super_parent_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_NUMBER` (`number`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_CREATED_BY_NUMBER` (`created_by_id`,`number`),
  KEY `IDX_TYPE` (`type`),
  KEY `IDX_TARGET_TYPE` (`target_type`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  KEY `IDX_PARENT_TYPE` (`parent_type`),
  KEY `IDX_RELATED_ID` (`related_id`),
  KEY `IDX_RELATED_TYPE` (`related_type`),
  KEY `IDX_SUPER_PARENT_TYPE` (`super_parent_type`),
  KEY `IDX_SUPER_PARENT_ID` (`super_parent_id`),
  KEY `IDX_PARENT` (`parent_id`,`parent_type`),
  KEY `IDX_RELATED` (`related_id`,`related_type`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_SUPER_PARENT` (`super_parent_id`,`super_parent_type`),
  FULLTEXT KEY `IDX_SYSTEM_FULL_TEXT_SEARCH` (`post`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note_portal`
--

DROP TABLE IF EXISTS `note_portal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `note_portal` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `note_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `portal_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_NOTE_ID_PORTAL_ID` (`note_id`,`portal_id`),
  KEY `IDX_NOTE_ID` (`note_id`),
  KEY `IDX_PORTAL_ID` (`portal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note_portal`
--

LOCK TABLES `note_portal` WRITE;
/*!40000 ALTER TABLE `note_portal` DISABLE KEYS */;
/*!40000 ALTER TABLE `note_portal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note_team`
--

DROP TABLE IF EXISTS `note_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `note_team` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `note_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_NOTE_ID_TEAM_ID` (`note_id`,`team_id`),
  KEY `IDX_NOTE_ID` (`note_id`),
  KEY `IDX_TEAM_ID` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note_team`
--

LOCK TABLES `note_team` WRITE;
/*!40000 ALTER TABLE `note_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `note_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note_user`
--

DROP TABLE IF EXISTS `note_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `note_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `note_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_NOTE_ID_USER_ID` (`note_id`,`user_id`),
  KEY `IDX_NOTE_ID` (`note_id`),
  KEY `IDX_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note_user`
--

LOCK TABLES `note_user` WRITE;
/*!40000 ALTER TABLE `note_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `note_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `number` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `email_is_processed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `action_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_parent_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_parent_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_NUMBER` (`number`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_USER` (`user_id`,`number`),
  KEY `IDX_USER_ID_READ_RELATED_PARENT_TYPE` (`user_id`,`deleted`,`read`,`related_parent_type`),
  KEY `IDX_ACTION_ID` (`action_id`),
  KEY `IDX_USER_ID` (`user_id`),
  KEY `IDX_RELATED` (`related_id`,`related_type`),
  KEY `IDX_RELATED_PARENT` (`related_parent_id`,`related_parent_type`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_auth_account`
--

DROP TABLE IF EXISTS `o_auth_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `o_auth_account` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `access_token` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `refresh_token` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `provider_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_PROVIDER_ID` (`provider_id`),
  KEY `IDX_USER_ID` (`user_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_auth_account`
--

LOCK TABLES `o_auth_account` WRITE;
/*!40000 ALTER TABLE `o_auth_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_auth_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_auth_provider`
--

DROP TABLE IF EXISTS `o_auth_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `o_auth_provider` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `client_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `authorization_endpoint` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `token_endpoint` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `authorization_prompt` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'none',
  `scopes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `authorization_params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `scope_separator` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_auth_provider`
--

LOCK TABLES `o_auth_provider` WRITE;
/*!40000 ALTER TABLE `o_auth_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_auth_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunity`
--

DROP TABLE IF EXISTS `opportunity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opportunity` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `amount` double DEFAULT NULL,
  `stage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Prospecting',
  `last_stage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `probability` int DEFAULT NULL,
  `lead_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `amount_currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stream_updated_at` datetime DEFAULT NULL,
  `account_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_number` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CREATED_AT_ID` (`created_at`,`id`),
  KEY `IDX_STAGE` (`stage`,`deleted`),
  KEY `IDX_LAST_STAGE` (`last_stage`),
  KEY `IDX_ASSIGNED_USER` (`assigned_user_id`,`deleted`),
  KEY `IDX_CREATED_AT` (`created_at`,`deleted`),
  KEY `IDX_CREATED_AT_STAGE` (`created_at`,`stage`),
  KEY `IDX_ASSIGNED_USER_STAGE` (`assigned_user_id`,`stage`),
  KEY `IDX_ACCOUNT_ID` (`account_id`),
  KEY `IDX_CONTACT_ID` (`contact_id`),
  KEY `IDX_CAMPAIGN_ID` (`campaign_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_ASSIGNED_USER_ID` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunity`
--

LOCK TABLES `opportunity` WRITE;
/*!40000 ALTER TABLE `opportunity` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_change_request`
--

DROP TABLE IF EXISTS `password_change_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_change_request` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `request_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_REQUEST_ID` (`request_id`),
  KEY `IDX_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_change_request`
--

LOCK TABLES `password_change_request` WRITE;
/*!40000 ALTER TABLE `password_change_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_change_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_number`
--

DROP TABLE IF EXISTS `phone_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_number` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numeric` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invalid` tinyint(1) NOT NULL DEFAULT '0',
  `opt_out` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_NAME` (`name`),
  KEY `IDX_NUMERIC` (`numeric`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_number`
--

LOCK TABLES `phone_number` WRITE;
/*!40000 ALTER TABLE `phone_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal`
--

DROP TABLE IF EXISTS `portal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portal` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `custom_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `tab_list` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quick_create_list` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `application_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `week_start` int DEFAULT '-1',
  `default_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_layout` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dashlets_options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `custom_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token_lifetime` double DEFAULT NULL,
  `auth_token_max_idle_time` double DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `logo_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout_set_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authentication_provider_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CUSTOM_ID` (`custom_id`),
  KEY `IDX_LAYOUT_SET_ID` (`layout_set_id`),
  KEY `IDX_AUTHENTICATION_PROVIDER_ID` (`authentication_provider_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal`
--

LOCK TABLES `portal` WRITE;
/*!40000 ALTER TABLE `portal` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_portal_role`
--

DROP TABLE IF EXISTS `portal_portal_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portal_portal_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `portal_role_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_PORTAL_ID_PORTAL_ROLE_ID` (`portal_id`,`portal_role_id`),
  KEY `IDX_PORTAL_ID` (`portal_id`),
  KEY `IDX_PORTAL_ROLE_ID` (`portal_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_portal_role`
--

LOCK TABLES `portal_portal_role` WRITE;
/*!40000 ALTER TABLE `portal_portal_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal_portal_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_role`
--

DROP TABLE IF EXISTS `portal_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portal_role` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `field_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `export_permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'not-set',
  `mass_update_permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'not-set',
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_role`
--

LOCK TABLES `portal_role` WRITE;
/*!40000 ALTER TABLE `portal_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_role_user`
--

DROP TABLE IF EXISTS `portal_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portal_role_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `portal_role_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_PORTAL_ROLE_ID_USER_ID` (`portal_role_id`,`user_id`),
  KEY `IDX_PORTAL_ROLE_ID` (`portal_role_id`),
  KEY `IDX_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_role_user`
--

LOCK TABLES `portal_role_user` WRITE;
/*!40000 ALTER TABLE `portal_role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_user`
--

DROP TABLE IF EXISTS `portal_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portal_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `portal_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_PORTAL_ID_USER_ID` (`portal_id`,`user_id`),
  KEY `IDX_PORTAL_ID` (`portal_id`),
  KEY `IDX_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_user`
--

LOCK TABLES `portal_user` WRITE;
/*!40000 ALTER TABLE `portal_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferences` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminder`
--

DROP TABLE IF EXISTS `reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reminder` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `remind_at` datetime DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `type` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Popup',
  `seconds` int DEFAULT '0',
  `is_submitted` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_REMIND_AT` (`remind_at`),
  KEY `IDX_START_AT` (`start_at`),
  KEY `IDX_TYPE` (`type`),
  KEY `IDX_USER_ID` (`user_id`),
  KEY `IDX_ENTITY` (`entity_id`,`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminder`
--

LOCK TABLES `reminder` WRITE;
/*!40000 ALTER TABLE `reminder` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assignment_permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'not-set',
  `user_permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'not-set',
  `message_permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'not-set',
  `portal_permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'not-set',
  `group_email_account_permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'not-set',
  `export_permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'not-set',
  `mass_update_permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'not-set',
  `data_privacy_permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'not-set',
  `follower_management_permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'not-set',
  `audit_permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'not-set',
  `mention_permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'not-set',
  `user_calendar_permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'not-set',
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `field_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('6939ac984059e22e8','Admin',0,'all','all','all','yes','all','yes','yes','yes','all','yes','all','all','{\"Email\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"no\"},\"EmailAccountScope\":true,\"EmailTemplateCategory\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"no\"},\"GlobalStream\":true,\"Template\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"no\"},\"EmailTemplate\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"no\"},\"User\":{\"create\":\"no\",\"read\":\"all\",\"edit\":\"own\",\"delete\":\"no\",\"stream\":\"no\"},\"Import\":true,\"Team\":{\"create\":\"no\",\"read\":\"all\",\"edit\":\"no\",\"delete\":\"no\",\"stream\":\"no\"},\"ExternalAccount\":true,\"Currency\":{\"create\":\"no\",\"read\":\"yes\",\"edit\":\"yes\",\"delete\":\"no\",\"stream\":\"no\"},\"Webhook\":true,\"WorkingTimeCalendar\":true,\"Campaign\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"no\"},\"Opportunity\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"all\"},\"Call\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"no\"},\"TargetList\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"no\"},\"DocumentFolder\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"no\"},\"Meeting\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"all\"},\"Activities\":true,\"KnowledgeBaseArticle\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"no\"},\"KnowledgeBaseCategory\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"no\"},\"Calendar\":true,\"Task\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"all\"},\"Contact\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"all\"},\"Account\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"all\"},\"Document\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"no\"},\"TargetListCategory\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"no\"},\"Case\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"all\"},\"Lead\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"all\"},\"CProduct\":{\"create\":\"yes\",\"read\":\"all\",\"edit\":\"all\",\"delete\":\"all\",\"stream\":\"all\"}}','{\"Email\":{},\"User\":{},\"Team\":{},\"Campaign\":{},\"Opportunity\":{},\"Call\":{},\"TargetList\":{},\"DocumentFolder\":{},\"Meeting\":{},\"KnowledgeBaseArticle\":{},\"KnowledgeBaseCategory\":{},\"Task\":{},\"Contact\":{},\"Account\":{},\"Document\":{},\"TargetListCategory\":{},\"Case\":{},\"Lead\":{},\"CProduct\":{}}','2025-12-10 17:23:36','2025-12-10 17:23:36'),('6939acd5ab1c95b41','Telesale',0,'not-set','not-set','not-set','not-set','not-set','not-set','not-set','not-set','not-set','not-set','not-set','not-set','{\"User\":{\"create\":\"no\",\"read\":\"own\",\"edit\":\"own\",\"delete\":\"no\",\"stream\":\"no\"},\"CProduct\":{\"create\":\"no\",\"read\":\"all\",\"edit\":\"no\",\"delete\":\"no\",\"stream\":\"all\"}}','{\"Email\":{},\"User\":{},\"Team\":{},\"Campaign\":{},\"Opportunity\":{},\"Call\":{},\"TargetList\":{},\"DocumentFolder\":{},\"Meeting\":{},\"KnowledgeBaseArticle\":{},\"KnowledgeBaseCategory\":{},\"Task\":{},\"Contact\":{},\"Account\":{},\"Document\":{},\"TargetListCategory\":{},\"Case\":{},\"Lead\":{},\"CProduct\":{}}','2025-12-10 17:24:37','2025-12-10 17:24:37'),('6939acf54abba3d39','Sale',0,'not-set','not-set','not-set','not-set','not-set','not-set','not-set','not-set','not-set','not-set','not-set','not-set','{\"User\":{\"create\":\"no\",\"read\":\"own\",\"edit\":\"own\",\"delete\":\"no\",\"stream\":\"no\"},\"CProduct\":{\"create\":\"no\",\"read\":\"all\",\"edit\":\"no\",\"delete\":\"no\",\"stream\":\"no\"}}','{\"Email\":{},\"User\":{},\"Team\":{},\"Campaign\":{},\"Opportunity\":{},\"Call\":{},\"TargetList\":{},\"DocumentFolder\":{},\"Meeting\":{},\"KnowledgeBaseArticle\":{},\"KnowledgeBaseCategory\":{},\"Task\":{},\"Contact\":{},\"Account\":{},\"Document\":{},\"TargetListCategory\":{},\"Case\":{},\"Lead\":{},\"CProduct\":{}}','2025-12-10 17:25:09','2025-12-10 17:25:09');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_team`
--

DROP TABLE IF EXISTS `role_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_team` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_ROLE_ID_TEAM_ID` (`role_id`,`team_id`),
  KEY `IDX_ROLE_ID` (`role_id`),
  KEY `IDX_TEAM_ID` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_team`
--

LOCK TABLES `role_team` WRITE;
/*!40000 ALTER TABLE `role_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_ROLE_ID_USER_ID` (`role_id`,`user_id`),
  KEY `IDX_ROLE_ID` (`role_id`),
  KEY `IDX_USER_ID` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,'6939ac984059e22e8','6939ad4be9fe21431',0),(2,'6939acf54abba3d39','6939ad6c5ed8d27f9',0),(3,'6939acd5ab1c95b41','6939ad8961a73e970',0);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_job`
--

DROP TABLE IF EXISTS `scheduled_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduled_job` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `scheduling` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `is_internal` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_job`
--

LOCK TABLES `scheduled_job` WRITE;
/*!40000 ALTER TABLE `scheduled_job` DISABLE KEYS */;
INSERT INTO `scheduled_job` VALUES ('6939a9d31c969e5dc','Submit Popup Reminders',0,'SubmitPopupReminders','Active','* * * * *','2025-12-10 17:31:48','2025-12-10 17:11:47','2025-12-10 17:11:47',1,NULL,NULL),('6939a9d31d512dd4e','Process Job Group',0,'ProcessJobGroup','Active','* * * * *',NULL,'2025-12-10 17:11:47','2025-12-10 17:11:47',1,NULL,NULL),('6939a9d31dd8daa8d','Process Job Queue q0',0,'ProcessJobQueueQ0','Active','* * * * *','2025-12-10 17:31:48','2025-12-10 17:11:47','2025-12-10 17:11:47',1,NULL,NULL),('6939a9d31e7ebae65','Process Job Queue q1',0,'ProcessJobQueueQ1','Active','*/1 * * * *','2025-12-10 17:31:08','2025-12-10 17:11:47','2025-12-10 17:11:47',1,NULL,NULL),('6939a9d31f0214517','Process Job Queue e0',0,'ProcessJobQueueE0','Active','* * * * *','2025-12-10 17:31:48','2025-12-10 17:11:47','2025-12-10 17:11:47',1,NULL,NULL),('6939a9d31f7270513','Dummy',0,'Dummy','Active','1 */12 * * *','2025-12-10 17:11:48','2025-12-10 17:11:47','2025-12-10 17:11:47',1,NULL,NULL),('6939a9d31fd911bc1','Check for New Version',0,'CheckNewVersion','Active','15 5 * * *',NULL,'2025-12-10 17:11:47','2025-12-10 17:11:47',1,NULL,NULL),('6939a9d320545e318','Check for New Versions of Installed Extensions',0,'CheckNewExtensionVersion','Active','25 5 * * *',NULL,'2025-12-10 17:11:47','2025-12-10 17:11:47',1,NULL,NULL),('6939a9d35aa04391f','Check Group Email Accounts',0,'CheckInboundEmails','Active','*/2 * * * *',NULL,'2025-12-10 17:11:47','2025-12-10 17:11:47',0,'system',NULL),('6939a9d35c0895374','Check Personal Email Accounts',0,'CheckEmailAccounts','Active','*/1 * * * *',NULL,'2025-12-10 17:11:47','2025-12-10 17:11:47',0,'system',NULL),('6939a9d35cdbef251','Send Email Reminders',0,'SendEmailReminders','Active','*/2 * * * *','2025-12-10 17:30:08','2025-12-10 17:11:47','2025-12-10 17:11:47',0,'system',NULL),('6939a9d35d85d836c','Send Email Notifications',0,'SendEmailNotifications','Active','*/2 * * * *','2025-12-10 17:30:08','2025-12-10 17:11:47','2025-12-10 17:11:47',0,'system',NULL),('6939a9d35e2933618','Clean-up',0,'Cleanup','Active','1 1 * * 0',NULL,'2025-12-10 17:11:47','2025-12-10 17:11:47',0,'system',NULL),('6939a9d35ed0d18cb','Send Mass Emails',0,'ProcessMassEmail','Active','10,30,50 * * * *','2025-12-10 17:30:08','2025-12-10 17:11:47','2025-12-10 17:11:47',0,'system',NULL),('6939a9d35feff1ad8','Auth Token Control',0,'AuthTokenControl','Active','*/6 * * * *','2025-12-10 17:30:08','2025-12-10 17:11:47','2025-12-10 17:11:47',0,'system',NULL),('6939a9d360decd61a','Control Knowledge Base Article Status',0,'ControlKnowledgeBaseArticleStatus','Active','10 1 * * *',NULL,'2025-12-10 17:11:47','2025-12-10 17:11:47',0,'system',NULL),('6939a9d361838de09','Process Webhook Queue',0,'ProcessWebhookQueue','Active','*/2 * * * *','2025-12-10 17:30:08','2025-12-10 17:11:47','2025-12-10 17:11:47',0,'system',NULL),('6939a9d3623830b3b','Send Scheduled Emails',0,'SendScheduledEmails','Active','*/10 * * * *','2025-12-10 17:30:08','2025-12-10 17:11:47','2025-12-10 17:11:47',0,'system',NULL);
/*!40000 ALTER TABLE `scheduled_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_job_log_record`
--

DROP TABLE IF EXISTS `scheduled_job_log_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduled_job_log_record` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `execution_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `scheduled_job_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_SCHEDULED_JOB_ID_EXECUTION_TIME` (`scheduled_job_id`,`execution_time`),
  KEY `IDX_SCHEDULED_JOB_ID` (`scheduled_job_id`),
  KEY `IDX_TARGET` (`target_id`,`target_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_job_log_record`
--

LOCK TABLES `scheduled_job_log_record` WRITE;
/*!40000 ALTER TABLE `scheduled_job_log_record` DISABLE KEYS */;
INSERT INTO `scheduled_job_log_record` VALUES ('6939a9d47111b0063','Dummy',0,'Success','2025-12-10 17:11:48','2025-12-10 17:11:48','6939a9d31f7270513',NULL,NULL),('6939a9d473e67feaf','Submit Popup Reminders',0,'Success','2025-12-10 17:11:48','2025-12-10 17:11:48','6939a9d31c969e5dc',NULL,NULL),('6939a9d474dcc7bf3','Process Job Queue q0',0,'Success','2025-12-10 17:11:48','2025-12-10 17:11:48','6939a9d31dd8daa8d',NULL,NULL),('6939a9d47649c46ea','Process Job Queue e0',0,'Success','2025-12-10 17:11:48','2025-12-10 17:11:48','6939a9d31f0214517',NULL,NULL),('6939a9de7150df142','Process Job Queue e0',0,'Success','2025-12-10 17:11:58','2025-12-10 17:11:58','6939a9d31f0214517',NULL,NULL),('6939a9de71c9faddd','Submit Popup Reminders',0,'Success','2025-12-10 17:11:58','2025-12-10 17:11:58','6939a9d31c969e5dc',NULL,NULL),('6939a9de72658783f','Process Job Queue q0',0,'Success','2025-12-10 17:11:58','2025-12-10 17:11:58','6939a9d31dd8daa8d',NULL,NULL),('6939a9e870042e7fb','Process Job Queue q1',0,'Success','2025-12-10 17:12:08','2025-12-10 17:12:08','6939a9d31e7ebae65',NULL,NULL),('6939a9e870f936f26','Send Email Reminders',0,'Success','2025-12-10 17:12:08','2025-12-10 17:12:08','6939a9d35cdbef251',NULL,NULL),('6939a9e873fb3c1ee','Auth Token Control',0,'Success','2025-12-10 17:12:08','2025-12-10 17:12:08','6939a9d35feff1ad8',NULL,NULL),('6939a9e8753bcea22','Process Job Queue e0',0,'Success','2025-12-10 17:12:08','2025-12-10 17:12:08','6939a9d31f0214517',NULL,NULL),('6939a9e876d1fa9f3','Send Email Notifications',0,'Success','2025-12-10 17:12:08','2025-12-10 17:12:08','6939a9d35d85d836c',NULL,NULL),('6939a9e877135e9af','Process Job Queue q0',0,'Success','2025-12-10 17:12:08','2025-12-10 17:12:08','6939a9d31dd8daa8d',NULL,NULL),('6939a9e877f0b093f','Process Webhook Queue',0,'Success','2025-12-10 17:12:08','2025-12-10 17:12:08','6939a9d361838de09',NULL,NULL),('6939a9e879621e8fc','Submit Popup Reminders',0,'Success','2025-12-10 17:12:08','2025-12-10 17:12:08','6939a9d31c969e5dc',NULL,NULL),('6939a9f26ef324178','Process Job Queue q0',0,'Success','2025-12-10 17:12:18','2025-12-10 17:12:18','6939a9d31dd8daa8d',NULL,NULL),('6939a9f26f0ba230c','Submit Popup Reminders',0,'Success','2025-12-10 17:12:18','2025-12-10 17:12:18','6939a9d31c969e5dc',NULL,NULL),('6939a9f26f2602d6e','Process Job Queue e0',0,'Success','2025-12-10 17:12:18','2025-12-10 17:12:18','6939a9d31f0214517',NULL,NULL),('6939a9fc6b64498bd','Submit Popup Reminders',0,'Success','2025-12-10 17:12:28','2025-12-10 17:12:28','6939a9d31c969e5dc',NULL,NULL),('6939a9fc6c005d05e','Process Job Queue q0',0,'Success','2025-12-10 17:12:28','2025-12-10 17:12:28','6939a9d31dd8daa8d',NULL,NULL),('6939a9fc6ce503968','Process Job Queue e0',0,'Success','2025-12-10 17:12:28','2025-12-10 17:12:28','6939a9d31f0214517',NULL,NULL),('6939aa066c8017ed6','Process Job Queue q0',0,'Success','2025-12-10 17:12:38','2025-12-10 17:12:38','6939a9d31dd8daa8d',NULL,NULL),('6939aa066ddade94c','Submit Popup Reminders',0,'Success','2025-12-10 17:12:38','2025-12-10 17:12:38','6939a9d31c969e5dc',NULL,NULL),('6939aa066eb95ea29','Process Job Queue e0',0,'Success','2025-12-10 17:12:38','2025-12-10 17:12:38','6939a9d31f0214517',NULL,NULL),('6939aa106cbce85f2','Submit Popup Reminders',0,'Success','2025-12-10 17:12:48','2025-12-10 17:12:48','6939a9d31c969e5dc',NULL,NULL),('6939aa106cc5fb9aa','Process Job Queue q0',0,'Success','2025-12-10 17:12:48','2025-12-10 17:12:48','6939a9d31dd8daa8d',NULL,NULL),('6939aa106d3b8c618','Process Job Queue e0',0,'Success','2025-12-10 17:12:48','2025-12-10 17:12:48','6939a9d31f0214517',NULL,NULL),('6939aa1a6c6429201','Submit Popup Reminders',0,'Success','2025-12-10 17:12:58','2025-12-10 17:12:58','6939a9d31c969e5dc',NULL,NULL),('6939aa1a6cca75646','Process Job Queue q0',0,'Success','2025-12-10 17:12:58','2025-12-10 17:12:58','6939a9d31dd8daa8d',NULL,NULL),('6939aa1a6f7ac7575','Process Job Queue e0',0,'Success','2025-12-10 17:12:58','2025-12-10 17:12:58','6939a9d31f0214517',NULL,NULL),('6939aa246e2ac60fb','Process Job Queue q1',0,'Success','2025-12-10 17:13:08','2025-12-10 17:13:08','6939a9d31e7ebae65',NULL,NULL),('6939aa246f047dbef','Process Job Queue q0',0,'Success','2025-12-10 17:13:08','2025-12-10 17:13:08','6939a9d31dd8daa8d',NULL,NULL),('6939aa246f2e3f11c','Submit Popup Reminders',0,'Success','2025-12-10 17:13:08','2025-12-10 17:13:08','6939a9d31c969e5dc',NULL,NULL),('6939aa246ff36276e','Process Job Queue e0',0,'Success','2025-12-10 17:13:08','2025-12-10 17:13:08','6939a9d31f0214517',NULL,NULL),('6939aa2e6f0001feb','Process Job Queue q0',0,'Success','2025-12-10 17:13:18','2025-12-10 17:13:18','6939a9d31dd8daa8d',NULL,NULL),('6939aa2e6f9bbcb16','Submit Popup Reminders',0,'Success','2025-12-10 17:13:18','2025-12-10 17:13:18','6939a9d31c969e5dc',NULL,NULL),('6939aa2e71edde694','Process Job Queue e0',0,'Success','2025-12-10 17:13:18','2025-12-10 17:13:18','6939a9d31f0214517',NULL,NULL),('6939aa3871f2dd925','Process Job Queue q0',0,'Success','2025-12-10 17:13:28','2025-12-10 17:13:28','6939a9d31dd8daa8d',NULL,NULL),('6939aa3872c8654b8','Process Job Queue e0',0,'Success','2025-12-10 17:13:28','2025-12-10 17:13:28','6939a9d31f0214517',NULL,NULL),('6939aa3873f69af41','Submit Popup Reminders',0,'Success','2025-12-10 17:13:28','2025-12-10 17:13:28','6939a9d31c969e5dc',NULL,NULL),('6939aa426d2e03228','Process Job Queue q0',0,'Success','2025-12-10 17:13:38','2025-12-10 17:13:38','6939a9d31dd8daa8d',NULL,NULL),('6939aa426d53f42b1','Submit Popup Reminders',0,'Success','2025-12-10 17:13:38','2025-12-10 17:13:38','6939a9d31c969e5dc',NULL,NULL),('6939aa426e4c9183e','Process Job Queue e0',0,'Success','2025-12-10 17:13:38','2025-12-10 17:13:38','6939a9d31f0214517',NULL,NULL),('6939aa4c6f04f9cbc','Submit Popup Reminders',0,'Success','2025-12-10 17:13:48','2025-12-10 17:13:48','6939a9d31c969e5dc',NULL,NULL),('6939aa4c70268f739','Process Job Queue q0',0,'Success','2025-12-10 17:13:48','2025-12-10 17:13:48','6939a9d31dd8daa8d',NULL,NULL),('6939aa4c70afa4a0e','Process Job Queue e0',0,'Success','2025-12-10 17:13:48','2025-12-10 17:13:48','6939a9d31f0214517',NULL,NULL),('6939aa566e72646a2','Process Job Queue q0',0,'Success','2025-12-10 17:13:58','2025-12-10 17:13:58','6939a9d31dd8daa8d',NULL,NULL),('6939aa566e95b090c','Submit Popup Reminders',0,'Success','2025-12-10 17:13:58','2025-12-10 17:13:58','6939a9d31c969e5dc',NULL,NULL),('6939aa566edd260f2','Process Job Queue e0',0,'Success','2025-12-10 17:13:58','2025-12-10 17:13:58','6939a9d31f0214517',NULL,NULL),('6939aa606e56507ac','Send Email Reminders',0,'Success','2025-12-10 17:14:08','2025-12-10 17:14:08','6939a9d35cdbef251',NULL,NULL),('6939aa60700895614','Process Webhook Queue',0,'Success','2025-12-10 17:14:08','2025-12-10 17:14:08','6939a9d361838de09',NULL,NULL),('6939aa6070bee9c71','Send Email Notifications',0,'Success','2025-12-10 17:14:08','2025-12-10 17:14:08','6939a9d35d85d836c',NULL,NULL),('6939aa60723b33cfb','Process Job Queue q0',0,'Success','2025-12-10 17:14:08','2025-12-10 17:14:08','6939a9d31dd8daa8d',NULL,NULL),('6939aa6072f4643b8','Submit Popup Reminders',0,'Success','2025-12-10 17:14:08','2025-12-10 17:14:08','6939a9d31c969e5dc',NULL,NULL),('6939aa60742958350','Process Job Queue q1',0,'Success','2025-12-10 17:14:08','2025-12-10 17:14:08','6939a9d31e7ebae65',NULL,NULL),('6939aa6076295c238','Process Job Queue e0',0,'Success','2025-12-10 17:14:08','2025-12-10 17:14:08','6939a9d31f0214517',NULL,NULL),('6939aa6a6cede8754','Submit Popup Reminders',0,'Success','2025-12-10 17:14:18','2025-12-10 17:14:18','6939a9d31c969e5dc',NULL,NULL),('6939aa6a6e4ea4f31','Process Job Queue q0',0,'Success','2025-12-10 17:14:18','2025-12-10 17:14:18','6939a9d31dd8daa8d',NULL,NULL),('6939aa6a6e77f96ce','Process Job Queue e0',0,'Success','2025-12-10 17:14:18','2025-12-10 17:14:18','6939a9d31f0214517',NULL,NULL),('6939aa746d6467f55','Submit Popup Reminders',0,'Success','2025-12-10 17:14:28','2025-12-10 17:14:28','6939a9d31c969e5dc',NULL,NULL),('6939aa746e468430b','Process Job Queue e0',0,'Success','2025-12-10 17:14:28','2025-12-10 17:14:28','6939a9d31f0214517',NULL,NULL),('6939aa746eb5c5869','Process Job Queue q0',0,'Success','2025-12-10 17:14:28','2025-12-10 17:14:28','6939a9d31dd8daa8d',NULL,NULL),('6939aa7e6fb109ea0','Process Job Queue q0',0,'Success','2025-12-10 17:14:38','2025-12-10 17:14:38','6939a9d31dd8daa8d',NULL,NULL),('6939aa7e6fe3298c2','Submit Popup Reminders',0,'Success','2025-12-10 17:14:38','2025-12-10 17:14:38','6939a9d31c969e5dc',NULL,NULL),('6939aa7e71438b51c','Process Job Queue e0',0,'Success','2025-12-10 17:14:38','2025-12-10 17:14:38','6939a9d31f0214517',NULL,NULL),('6939aa8870a3d60e8','Submit Popup Reminders',0,'Success','2025-12-10 17:14:48','2025-12-10 17:14:48','6939a9d31c969e5dc',NULL,NULL),('6939aa887145bdb79','Process Job Queue q0',0,'Success','2025-12-10 17:14:48','2025-12-10 17:14:48','6939a9d31dd8daa8d',NULL,NULL),('6939aa88723c74558','Process Job Queue e0',0,'Success','2025-12-10 17:14:48','2025-12-10 17:14:48','6939a9d31f0214517',NULL,NULL),('6939aa926d0518346','Process Job Queue q0',0,'Success','2025-12-10 17:14:58','2025-12-10 17:14:58','6939a9d31dd8daa8d',NULL,NULL),('6939aa926d3395046','Submit Popup Reminders',0,'Success','2025-12-10 17:14:58','2025-12-10 17:14:58','6939a9d31c969e5dc',NULL,NULL),('6939aa926e9e95f5b','Process Job Queue e0',0,'Success','2025-12-10 17:14:58','2025-12-10 17:14:58','6939a9d31f0214517',NULL,NULL),('6939aa9c708dce693','Process Job Queue q1',0,'Success','2025-12-10 17:15:08','2025-12-10 17:15:08','6939a9d31e7ebae65',NULL,NULL),('6939aa9c71b3ded3c','Submit Popup Reminders',0,'Success','2025-12-10 17:15:08','2025-12-10 17:15:08','6939a9d31c969e5dc',NULL,NULL),('6939aa9c722243f5f','Process Job Queue q0',0,'Success','2025-12-10 17:15:08','2025-12-10 17:15:08','6939a9d31dd8daa8d',NULL,NULL),('6939aa9c72f1b75b9','Process Job Queue e0',0,'Success','2025-12-10 17:15:08','2025-12-10 17:15:08','6939a9d31f0214517',NULL,NULL),('6939aaa66d4b3c174','Submit Popup Reminders',0,'Success','2025-12-10 17:15:18','2025-12-10 17:15:18','6939a9d31c969e5dc',NULL,NULL),('6939aaa66dd970443','Process Job Queue q0',0,'Success','2025-12-10 17:15:18','2025-12-10 17:15:18','6939a9d31dd8daa8d',NULL,NULL),('6939aaa66eea844a2','Process Job Queue e0',0,'Success','2025-12-10 17:15:18','2025-12-10 17:15:18','6939a9d31f0214517',NULL,NULL),('6939aab06ecedc417','Process Job Queue q0',0,'Success','2025-12-10 17:15:28','2025-12-10 17:15:28','6939a9d31dd8daa8d',NULL,NULL),('6939aab06ef54fab6','Process Job Queue e0',0,'Success','2025-12-10 17:15:28','2025-12-10 17:15:28','6939a9d31f0214517',NULL,NULL),('6939aab06f661476b','Submit Popup Reminders',0,'Success','2025-12-10 17:15:28','2025-12-10 17:15:28','6939a9d31c969e5dc',NULL,NULL),('6939aaba7098dadce','Submit Popup Reminders',0,'Success','2025-12-10 17:15:38','2025-12-10 17:15:38','6939a9d31c969e5dc',NULL,NULL),('6939aaba72f51b3f6','Process Job Queue q0',0,'Success','2025-12-10 17:15:38','2025-12-10 17:15:38','6939a9d31dd8daa8d',NULL,NULL),('6939aaba7395151d4','Process Job Queue e0',0,'Success','2025-12-10 17:15:38','2025-12-10 17:15:38','6939a9d31f0214517',NULL,NULL),('6939aac46f62b77bb','Submit Popup Reminders',0,'Success','2025-12-10 17:15:48','2025-12-10 17:15:48','6939a9d31c969e5dc',NULL,NULL),('6939aac46fb782a39','Process Job Queue q0',0,'Success','2025-12-10 17:15:48','2025-12-10 17:15:48','6939a9d31dd8daa8d',NULL,NULL),('6939aac47146fdb06','Process Job Queue e0',0,'Success','2025-12-10 17:15:48','2025-12-10 17:15:48','6939a9d31f0214517',NULL,NULL),('6939aace6d92804b2','Submit Popup Reminders',0,'Success','2025-12-10 17:15:58','2025-12-10 17:15:58','6939a9d31c969e5dc',NULL,NULL),('6939aace6e9114331','Process Job Queue q0',0,'Success','2025-12-10 17:15:58','2025-12-10 17:15:58','6939a9d31dd8daa8d',NULL,NULL),('6939aace6eec87c94','Process Job Queue e0',0,'Success','2025-12-10 17:15:58','2025-12-10 17:15:58','6939a9d31f0214517',NULL,NULL),('6939aad872186cdfb','Submit Popup Reminders',0,'Success','2025-12-10 17:16:08','2025-12-10 17:16:08','6939a9d31c969e5dc',NULL,NULL),('6939aad872516ead0','Process Webhook Queue',0,'Success','2025-12-10 17:16:08','2025-12-10 17:16:08','6939a9d361838de09',NULL,NULL),('6939aad872f098fd5','Send Email Reminders',0,'Success','2025-12-10 17:16:08','2025-12-10 17:16:08','6939a9d35cdbef251',NULL,NULL),('6939aad8736831296','Process Job Queue e0',0,'Success','2025-12-10 17:16:08','2025-12-10 17:16:08','6939a9d31f0214517',NULL,NULL),('6939aad8744f595d8','Process Job Queue q0',0,'Success','2025-12-10 17:16:08','2025-12-10 17:16:08','6939a9d31dd8daa8d',NULL,NULL),('6939aad8768f48038','Send Email Notifications',0,'Success','2025-12-10 17:16:08','2025-12-10 17:16:08','6939a9d35d85d836c',NULL,NULL),('6939aad876bd6dbf3','Process Job Queue q1',0,'Success','2025-12-10 17:16:08','2025-12-10 17:16:08','6939a9d31e7ebae65',NULL,NULL),('6939aae26e4d7e594','Process Job Queue q0',0,'Success','2025-12-10 17:16:18','2025-12-10 17:16:18','6939a9d31dd8daa8d',NULL,NULL),('6939aae26ec4dd876','Submit Popup Reminders',0,'Success','2025-12-10 17:16:18','2025-12-10 17:16:18','6939a9d31c969e5dc',NULL,NULL),('6939aae26f6736fdf','Process Job Queue e0',0,'Success','2025-12-10 17:16:18','2025-12-10 17:16:18','6939a9d31f0214517',NULL,NULL),('6939aaec6f8a2e62e','Submit Popup Reminders',0,'Success','2025-12-10 17:16:28','2025-12-10 17:16:28','6939a9d31c969e5dc',NULL,NULL),('6939aaec7174ccde7','Process Job Queue q0',0,'Success','2025-12-10 17:16:28','2025-12-10 17:16:28','6939a9d31dd8daa8d',NULL,NULL),('6939aaec71d49f13e','Process Job Queue e0',0,'Success','2025-12-10 17:16:28','2025-12-10 17:16:28','6939a9d31f0214517',NULL,NULL),('6939aaf67313b9879','Process Job Queue q0',0,'Success','2025-12-10 17:16:38','2025-12-10 17:16:38','6939a9d31dd8daa8d',NULL,NULL),('6939aaf6742e06dfd','Submit Popup Reminders',0,'Success','2025-12-10 17:16:38','2025-12-10 17:16:38','6939a9d31c969e5dc',NULL,NULL),('6939aaf6752595c1e','Process Job Queue e0',0,'Success','2025-12-10 17:16:38','2025-12-10 17:16:38','6939a9d31f0214517',NULL,NULL),('6939ab007440a0162','Submit Popup Reminders',0,'Success','2025-12-10 17:16:48','2025-12-10 17:16:48','6939a9d31c969e5dc',NULL,NULL),('6939ab00745e0789c','Process Job Queue e0',0,'Success','2025-12-10 17:16:48','2025-12-10 17:16:48','6939a9d31f0214517',NULL,NULL),('6939ab0074e75bd35','Process Job Queue q0',0,'Success','2025-12-10 17:16:48','2025-12-10 17:16:48','6939a9d31dd8daa8d',NULL,NULL),('6939ab0a6e9bd504b','Submit Popup Reminders',0,'Success','2025-12-10 17:16:58','2025-12-10 17:16:58','6939a9d31c969e5dc',NULL,NULL),('6939ab0a702406c18','Process Job Queue q0',0,'Success','2025-12-10 17:16:58','2025-12-10 17:16:58','6939a9d31dd8daa8d',NULL,NULL),('6939ab0a710a23015','Process Job Queue e0',0,'Success','2025-12-10 17:16:58','2025-12-10 17:16:58','6939a9d31f0214517',NULL,NULL),('6939ab14713d360be','Process Job Queue q0',0,'Success','2025-12-10 17:17:08','2025-12-10 17:17:08','6939a9d31dd8daa8d',NULL,NULL),('6939ab14716534ae6','Process Job Queue q1',0,'Success','2025-12-10 17:17:08','2025-12-10 17:17:08','6939a9d31e7ebae65',NULL,NULL),('6939ab147195ac7b5','Submit Popup Reminders',0,'Success','2025-12-10 17:17:08','2025-12-10 17:17:08','6939a9d31c969e5dc',NULL,NULL),('6939ab1472247a90d','Process Job Queue e0',0,'Success','2025-12-10 17:17:08','2025-12-10 17:17:08','6939a9d31f0214517',NULL,NULL),('6939ab1e6f4b75ad9','Process Job Queue q0',0,'Success','2025-12-10 17:17:18','2025-12-10 17:17:18','6939a9d31dd8daa8d',NULL,NULL),('6939ab1e6fc96cd0b','Submit Popup Reminders',0,'Success','2025-12-10 17:17:18','2025-12-10 17:17:18','6939a9d31c969e5dc',NULL,NULL),('6939ab1e710d0ee56','Process Job Queue e0',0,'Success','2025-12-10 17:17:18','2025-12-10 17:17:18','6939a9d31f0214517',NULL,NULL),('6939ab2870a53a8d0','Submit Popup Reminders',0,'Success','2025-12-10 17:17:28','2025-12-10 17:17:28','6939a9d31c969e5dc',NULL,NULL),('6939ab2870dad6d4c','Process Job Queue e0',0,'Success','2025-12-10 17:17:28','2025-12-10 17:17:28','6939a9d31f0214517',NULL,NULL),('6939ab2871074b757','Process Job Queue q0',0,'Success','2025-12-10 17:17:28','2025-12-10 17:17:28','6939a9d31dd8daa8d',NULL,NULL),('6939ab326e8147d46','Submit Popup Reminders',0,'Success','2025-12-10 17:17:38','2025-12-10 17:17:38','6939a9d31c969e5dc',NULL,NULL),('6939ab326eea5aba4','Process Job Queue q0',0,'Success','2025-12-10 17:17:38','2025-12-10 17:17:38','6939a9d31dd8daa8d',NULL,NULL),('6939ab326fe108589','Process Job Queue e0',0,'Success','2025-12-10 17:17:38','2025-12-10 17:17:38','6939a9d31f0214517',NULL,NULL),('6939ab3c6f0d44375','Process Job Queue q0',0,'Success','2025-12-10 17:17:48','2025-12-10 17:17:48','6939a9d31dd8daa8d',NULL,NULL),('6939ab3c6f8ecdd90','Submit Popup Reminders',0,'Success','2025-12-10 17:17:48','2025-12-10 17:17:48','6939a9d31c969e5dc',NULL,NULL),('6939ab3c6ffd60743','Process Job Queue e0',0,'Success','2025-12-10 17:17:48','2025-12-10 17:17:48','6939a9d31f0214517',NULL,NULL),('6939ab46706f44711','Process Job Queue q0',0,'Success','2025-12-10 17:17:58','2025-12-10 17:17:58','6939a9d31dd8daa8d',NULL,NULL),('6939ab467095f2abb','Submit Popup Reminders',0,'Success','2025-12-10 17:17:58','2025-12-10 17:17:58','6939a9d31c969e5dc',NULL,NULL),('6939ab4670bc7e366','Process Job Queue e0',0,'Success','2025-12-10 17:17:58','2025-12-10 17:17:58','6939a9d31f0214517',NULL,NULL),('6939ab50733e7876d','Auth Token Control',0,'Success','2025-12-10 17:18:08','2025-12-10 17:18:08','6939a9d35feff1ad8',NULL,NULL),('6939ab50751b6a296','Send Email Reminders',0,'Success','2025-12-10 17:18:08','2025-12-10 17:18:08','6939a9d35cdbef251',NULL,NULL),('6939ab507599e9e5a','Process Job Queue q1',0,'Success','2025-12-10 17:18:08','2025-12-10 17:18:08','6939a9d31e7ebae65',NULL,NULL),('6939ab5075ad3790a','Send Email Notifications',0,'Success','2025-12-10 17:18:08','2025-12-10 17:18:08','6939a9d35d85d836c',NULL,NULL),('6939ab50797c4ba43','Process Job Queue e0',0,'Success','2025-12-10 17:18:08','2025-12-10 17:18:08','6939a9d31f0214517',NULL,NULL),('6939ab507b2881ff9','Process Webhook Queue',0,'Success','2025-12-10 17:18:08','2025-12-10 17:18:08','6939a9d361838de09',NULL,NULL),('6939ab507bc37ea96','Submit Popup Reminders',0,'Success','2025-12-10 17:18:08','2025-12-10 17:18:08','6939a9d31c969e5dc',NULL,NULL),('6939ab507d1496d2d','Process Job Queue q0',0,'Success','2025-12-10 17:18:08','2025-12-10 17:18:08','6939a9d31dd8daa8d',NULL,NULL),('6939ab5a70e82581e','Process Job Queue q0',0,'Success','2025-12-10 17:18:18','2025-12-10 17:18:18','6939a9d31dd8daa8d',NULL,NULL),('6939ab5a7109c4b48','Process Job Queue e0',0,'Success','2025-12-10 17:18:18','2025-12-10 17:18:18','6939a9d31f0214517',NULL,NULL),('6939ab5a71cbaf0ea','Submit Popup Reminders',0,'Success','2025-12-10 17:18:18','2025-12-10 17:18:18','6939a9d31c969e5dc',NULL,NULL),('6939ab646ff9649e9','Submit Popup Reminders',0,'Success','2025-12-10 17:18:28','2025-12-10 17:18:28','6939a9d31c969e5dc',NULL,NULL),('6939ab647151c25b1','Process Job Queue e0',0,'Success','2025-12-10 17:18:28','2025-12-10 17:18:28','6939a9d31f0214517',NULL,NULL),('6939ab6471ba0e889','Process Job Queue q0',0,'Success','2025-12-10 17:18:28','2025-12-10 17:18:28','6939a9d31dd8daa8d',NULL,NULL),('6939ab6e70a532c31','Process Job Queue q0',0,'Success','2025-12-10 17:18:38','2025-12-10 17:18:38','6939a9d31dd8daa8d',NULL,NULL),('6939ab6e70cc38ab0','Submit Popup Reminders',0,'Success','2025-12-10 17:18:38','2025-12-10 17:18:38','6939a9d31c969e5dc',NULL,NULL),('6939ab6e728b52d60','Process Job Queue e0',0,'Success','2025-12-10 17:18:38','2025-12-10 17:18:38','6939a9d31f0214517',NULL,NULL),('6939ab787017888ec','Process Job Queue q0',0,'Success','2025-12-10 17:18:48','2025-12-10 17:18:48','6939a9d31dd8daa8d',NULL,NULL),('6939ab7870390c96d','Submit Popup Reminders',0,'Success','2025-12-10 17:18:48','2025-12-10 17:18:48','6939a9d31c969e5dc',NULL,NULL),('6939ab7870d8aa3eb','Process Job Queue e0',0,'Success','2025-12-10 17:18:48','2025-12-10 17:18:48','6939a9d31f0214517',NULL,NULL),('6939ab82707661bf7','Submit Popup Reminders',0,'Success','2025-12-10 17:18:58','2025-12-10 17:18:58','6939a9d31c969e5dc',NULL,NULL),('6939ab827124b4648','Process Job Queue q0',0,'Success','2025-12-10 17:18:58','2025-12-10 17:18:58','6939a9d31dd8daa8d',NULL,NULL),('6939ab8271cfaf982','Process Job Queue e0',0,'Success','2025-12-10 17:18:58','2025-12-10 17:18:58','6939a9d31f0214517',NULL,NULL),('6939ab8c72333ca4d','Process Job Queue q0',0,'Success','2025-12-10 17:19:08','2025-12-10 17:19:08','6939a9d31dd8daa8d',NULL,NULL),('6939ab8c729af221e','Process Job Queue q1',0,'Success','2025-12-10 17:19:08','2025-12-10 17:19:08','6939a9d31e7ebae65',NULL,NULL),('6939ab8c739ca49e0','Submit Popup Reminders',0,'Success','2025-12-10 17:19:08','2025-12-10 17:19:08','6939a9d31c969e5dc',NULL,NULL),('6939ab8c73e0dc7d0','Process Job Queue e0',0,'Success','2025-12-10 17:19:08','2025-12-10 17:19:08','6939a9d31f0214517',NULL,NULL),('6939ab967101a4990','Submit Popup Reminders',0,'Success','2025-12-10 17:19:18','2025-12-10 17:19:18','6939a9d31c969e5dc',NULL,NULL),('6939ab967187a29ac','Process Job Queue q0',0,'Success','2025-12-10 17:19:18','2025-12-10 17:19:18','6939a9d31dd8daa8d',NULL,NULL),('6939ab96720e76915','Process Job Queue e0',0,'Success','2025-12-10 17:19:18','2025-12-10 17:19:18','6939a9d31f0214517',NULL,NULL),('6939aba07063c4f6c','Submit Popup Reminders',0,'Success','2025-12-10 17:19:28','2025-12-10 17:19:28','6939a9d31c969e5dc',NULL,NULL),('6939aba07122ba366','Process Job Queue q0',0,'Success','2025-12-10 17:19:28','2025-12-10 17:19:28','6939a9d31dd8daa8d',NULL,NULL),('6939aba072bc84212','Process Job Queue e0',0,'Success','2025-12-10 17:19:28','2025-12-10 17:19:28','6939a9d31f0214517',NULL,NULL),('6939abaa722293209','Submit Popup Reminders',0,'Success','2025-12-10 17:19:38','2025-12-10 17:19:38','6939a9d31c969e5dc',NULL,NULL),('6939abaa72d727e32','Process Job Queue q0',0,'Success','2025-12-10 17:19:38','2025-12-10 17:19:38','6939a9d31dd8daa8d',NULL,NULL),('6939abaa7369741c4','Process Job Queue e0',0,'Success','2025-12-10 17:19:38','2025-12-10 17:19:38','6939a9d31f0214517',NULL,NULL),('6939abb471bfb41e1','Submit Popup Reminders',0,'Success','2025-12-10 17:19:48','2025-12-10 17:19:48','6939a9d31c969e5dc',NULL,NULL),('6939abb47211a4e91','Process Job Queue q0',0,'Success','2025-12-10 17:19:48','2025-12-10 17:19:48','6939a9d31dd8daa8d',NULL,NULL),('6939abb472694b58b','Process Job Queue e0',0,'Success','2025-12-10 17:19:48','2025-12-10 17:19:48','6939a9d31f0214517',NULL,NULL),('6939abbe711ecbd25','Process Job Queue q0',0,'Success','2025-12-10 17:19:58','2025-12-10 17:19:58','6939a9d31dd8daa8d',NULL,NULL),('6939abbe717b41738','Submit Popup Reminders',0,'Success','2025-12-10 17:19:58','2025-12-10 17:19:58','6939a9d31c969e5dc',NULL,NULL),('6939abbe72d47d4a2','Process Job Queue e0',0,'Success','2025-12-10 17:19:58','2025-12-10 17:19:58','6939a9d31f0214517',NULL,NULL),('6939abc876c124849','Process Webhook Queue',0,'Success','2025-12-10 17:20:08','2025-12-10 17:20:08','6939a9d361838de09',NULL,NULL),('6939abc8781fa38c3','Send Email Notifications',0,'Success','2025-12-10 17:20:08','2025-12-10 17:20:08','6939a9d35d85d836c',NULL,NULL),('6939abc87ad0b4024','Send Scheduled Emails',0,'Success','2025-12-10 17:20:08','2025-12-10 17:20:08','6939a9d3623830b3b',NULL,NULL),('6939abc87b34d0094','Submit Popup Reminders',0,'Success','2025-12-10 17:20:08','2025-12-10 17:20:08','6939a9d31c969e5dc',NULL,NULL),('6939abc87b68ffed3','Send Email Reminders',0,'Success','2025-12-10 17:20:08','2025-12-10 17:20:08','6939a9d35cdbef251',NULL,NULL),('6939abc87b6e8300f','Process Job Queue q0',0,'Success','2025-12-10 17:20:08','2025-12-10 17:20:08','6939a9d31dd8daa8d',NULL,NULL),('6939abc87c1a882f4','Process Job Queue q1',0,'Success','2025-12-10 17:20:08','2025-12-10 17:20:08','6939a9d31e7ebae65',NULL,NULL),('6939abc87d2f2e48e','Process Job Queue e0',0,'Success','2025-12-10 17:20:08','2025-12-10 17:20:08','6939a9d31f0214517',NULL,NULL),('6939abd2737d00c83','Submit Popup Reminders',0,'Success','2025-12-10 17:20:18','2025-12-10 17:20:18','6939a9d31c969e5dc',NULL,NULL),('6939abd274302ea87','Process Job Queue e0',0,'Success','2025-12-10 17:20:18','2025-12-10 17:20:18','6939a9d31f0214517',NULL,NULL),('6939abd274662bbfc','Process Job Queue q0',0,'Success','2025-12-10 17:20:18','2025-12-10 17:20:18','6939a9d31dd8daa8d',NULL,NULL),('6939abdc71ac3ac2d','Submit Popup Reminders',0,'Success','2025-12-10 17:20:28','2025-12-10 17:20:28','6939a9d31c969e5dc',NULL,NULL),('6939abdc724dec064','Process Job Queue q0',0,'Success','2025-12-10 17:20:28','2025-12-10 17:20:28','6939a9d31dd8daa8d',NULL,NULL),('6939abdc73089f967','Process Job Queue e0',0,'Success','2025-12-10 17:20:28','2025-12-10 17:20:28','6939a9d31f0214517',NULL,NULL),('6939abe6749093364','Submit Popup Reminders',0,'Success','2025-12-10 17:20:38','2025-12-10 17:20:38','6939a9d31c969e5dc',NULL,NULL),('6939abe67553ce87b','Process Job Queue q0',0,'Success','2025-12-10 17:20:38','2025-12-10 17:20:38','6939a9d31dd8daa8d',NULL,NULL),('6939abe675b5879cf','Process Job Queue e0',0,'Success','2025-12-10 17:20:38','2025-12-10 17:20:38','6939a9d31f0214517',NULL,NULL),('6939abf071dcbad1e','Process Job Queue q0',0,'Success','2025-12-10 17:20:48','2025-12-10 17:20:48','6939a9d31dd8daa8d',NULL,NULL),('6939abf071eb7f2fe','Submit Popup Reminders',0,'Success','2025-12-10 17:20:48','2025-12-10 17:20:48','6939a9d31c969e5dc',NULL,NULL),('6939abf07203b4cd1','Process Job Queue e0',0,'Success','2025-12-10 17:20:48','2025-12-10 17:20:48','6939a9d31f0214517',NULL,NULL),('6939abfa73fdc9c17','Process Job Queue e0',0,'Success','2025-12-10 17:20:58','2025-12-10 17:20:58','6939a9d31f0214517',NULL,NULL),('6939abfa75519ae7d','Submit Popup Reminders',0,'Success','2025-12-10 17:20:58','2025-12-10 17:20:58','6939a9d31c969e5dc',NULL,NULL),('6939abfa75af8f0eb','Process Job Queue q0',0,'Success','2025-12-10 17:20:58','2025-12-10 17:20:58','6939a9d31dd8daa8d',NULL,NULL),('6939ac0473c505535','Process Job Queue q0',0,'Success','2025-12-10 17:21:08','2025-12-10 17:21:08','6939a9d31dd8daa8d',NULL,NULL),('6939ac0474567df4c','Process Job Queue q1',0,'Success','2025-12-10 17:21:08','2025-12-10 17:21:08','6939a9d31e7ebae65',NULL,NULL),('6939ac0475e788eea','Submit Popup Reminders',0,'Success','2025-12-10 17:21:08','2025-12-10 17:21:08','6939a9d31c969e5dc',NULL,NULL),('6939ac0475f48ddbd','Process Job Queue e0',0,'Success','2025-12-10 17:21:08','2025-12-10 17:21:08','6939a9d31f0214517',NULL,NULL),('6939ac0e7207aeb3c','Process Job Queue q0',0,'Success','2025-12-10 17:21:18','2025-12-10 17:21:18','6939a9d31dd8daa8d',NULL,NULL),('6939ac0e7242d1afd','Submit Popup Reminders',0,'Success','2025-12-10 17:21:18','2025-12-10 17:21:18','6939a9d31c969e5dc',NULL,NULL),('6939ac0e72abf6f44','Process Job Queue e0',0,'Success','2025-12-10 17:21:18','2025-12-10 17:21:18','6939a9d31f0214517',NULL,NULL),('6939ac1872063aa40','Submit Popup Reminders',0,'Success','2025-12-10 17:21:28','2025-12-10 17:21:28','6939a9d31c969e5dc',NULL,NULL),('6939ac1873a2ea667','Process Job Queue q0',0,'Success','2025-12-10 17:21:28','2025-12-10 17:21:28','6939a9d31dd8daa8d',NULL,NULL),('6939ac18743c2d305','Process Job Queue e0',0,'Success','2025-12-10 17:21:28','2025-12-10 17:21:28','6939a9d31f0214517',NULL,NULL),('6939ac2273357d022','Process Job Queue q0',0,'Success','2025-12-10 17:21:38','2025-12-10 17:21:38','6939a9d31dd8daa8d',NULL,NULL),('6939ac227358ab8f8','Submit Popup Reminders',0,'Success','2025-12-10 17:21:38','2025-12-10 17:21:38','6939a9d31c969e5dc',NULL,NULL),('6939ac227488327f2','Process Job Queue e0',0,'Success','2025-12-10 17:21:38','2025-12-10 17:21:38','6939a9d31f0214517',NULL,NULL),('6939ac2c74347d027','Submit Popup Reminders',0,'Success','2025-12-10 17:21:48','2025-12-10 17:21:48','6939a9d31c969e5dc',NULL,NULL),('6939ac2c751100703','Process Job Queue q0',0,'Success','2025-12-10 17:21:48','2025-12-10 17:21:48','6939a9d31dd8daa8d',NULL,NULL),('6939ac2c76c0d1bb1','Process Job Queue e0',0,'Success','2025-12-10 17:21:48','2025-12-10 17:21:48','6939a9d31f0214517',NULL,NULL),('6939ac36727bdbc2c','Submit Popup Reminders',0,'Success','2025-12-10 17:21:58','2025-12-10 17:21:58','6939a9d31c969e5dc',NULL,NULL),('6939ac36734cb9746','Process Job Queue q0',0,'Success','2025-12-10 17:21:58','2025-12-10 17:21:58','6939a9d31dd8daa8d',NULL,NULL),('6939ac3673c2c9547','Process Job Queue e0',0,'Success','2025-12-10 17:21:58','2025-12-10 17:21:58','6939a9d31f0214517',NULL,NULL),('6939ac407832f5d7a','Send Email Reminders',0,'Success','2025-12-10 17:22:08','2025-12-10 17:22:08','6939a9d35cdbef251',NULL,NULL),('6939ac40783be3e8d','Process Job Queue q1',0,'Success','2025-12-10 17:22:08','2025-12-10 17:22:08','6939a9d31e7ebae65',NULL,NULL),('6939ac4078babcb58','Submit Popup Reminders',0,'Success','2025-12-10 17:22:08','2025-12-10 17:22:08','6939a9d31c969e5dc',NULL,NULL),('6939ac4079ca18b83','Process Job Queue q0',0,'Success','2025-12-10 17:22:08','2025-12-10 17:22:08','6939a9d31dd8daa8d',NULL,NULL),('6939ac407bf3039bb','Process Job Queue e0',0,'Success','2025-12-10 17:22:08','2025-12-10 17:22:08','6939a9d31f0214517',NULL,NULL),('6939ac407c3581cf5','Send Email Notifications',0,'Success','2025-12-10 17:22:08','2025-12-10 17:22:08','6939a9d35d85d836c',NULL,NULL),('6939ac407dc5fbdf8','Process Webhook Queue',0,'Success','2025-12-10 17:22:08','2025-12-10 17:22:08','6939a9d361838de09',NULL,NULL),('6939ac4a728e12f30','Submit Popup Reminders',0,'Success','2025-12-10 17:22:18','2025-12-10 17:22:18','6939a9d31c969e5dc',NULL,NULL),('6939ac4a73382500f','Process Job Queue q0',0,'Success','2025-12-10 17:22:18','2025-12-10 17:22:18','6939a9d31dd8daa8d',NULL,NULL),('6939ac4a73e79cea8','Process Job Queue e0',0,'Success','2025-12-10 17:22:18','2025-12-10 17:22:18','6939a9d31f0214517',NULL,NULL),('6939ac5474d6f3c77','Process Job Queue q0',0,'Success','2025-12-10 17:22:28','2025-12-10 17:22:28','6939a9d31dd8daa8d',NULL,NULL),('6939ac54760007e23','Process Job Queue e0',0,'Success','2025-12-10 17:22:28','2025-12-10 17:22:28','6939a9d31f0214517',NULL,NULL),('6939ac54764aa736e','Submit Popup Reminders',0,'Success','2025-12-10 17:22:28','2025-12-10 17:22:28','6939a9d31c969e5dc',NULL,NULL),('6939ac5e736920fab','Submit Popup Reminders',0,'Success','2025-12-10 17:22:38','2025-12-10 17:22:38','6939a9d31c969e5dc',NULL,NULL),('6939ac5e7418b2064','Process Job Queue q0',0,'Success','2025-12-10 17:22:38','2025-12-10 17:22:38','6939a9d31dd8daa8d',NULL,NULL),('6939ac5e75e7f3512','Process Job Queue e0',0,'Success','2025-12-10 17:22:38','2025-12-10 17:22:38','6939a9d31f0214517',NULL,NULL),('6939ac68742e7f634','Submit Popup Reminders',0,'Success','2025-12-10 17:22:48','2025-12-10 17:22:48','6939a9d31c969e5dc',NULL,NULL),('6939ac68745219e79','Process Job Queue q0',0,'Success','2025-12-10 17:22:48','2025-12-10 17:22:48','6939a9d31dd8daa8d',NULL,NULL),('6939ac6874e231d07','Process Job Queue e0',0,'Success','2025-12-10 17:22:48','2025-12-10 17:22:48','6939a9d31f0214517',NULL,NULL),('6939ac727478a5b86','Submit Popup Reminders',0,'Success','2025-12-10 17:22:58','2025-12-10 17:22:58','6939a9d31c969e5dc',NULL,NULL),('6939ac7274ce30762','Process Job Queue q0',0,'Success','2025-12-10 17:22:58','2025-12-10 17:22:58','6939a9d31dd8daa8d',NULL,NULL),('6939ac727637990e0','Process Job Queue e0',0,'Success','2025-12-10 17:22:58','2025-12-10 17:22:58','6939a9d31f0214517',NULL,NULL),('6939ac7c75e7533a0','Process Job Queue q1',0,'Success','2025-12-10 17:23:08','2025-12-10 17:23:08','6939a9d31e7ebae65',NULL,NULL),('6939ac7c76810f897','Submit Popup Reminders',0,'Success','2025-12-10 17:23:08','2025-12-10 17:23:08','6939a9d31c969e5dc',NULL,NULL),('6939ac7c772122320','Process Job Queue q0',0,'Success','2025-12-10 17:23:08','2025-12-10 17:23:08','6939a9d31dd8daa8d',NULL,NULL),('6939ac7c787c5fd48','Process Job Queue e0',0,'Success','2025-12-10 17:23:08','2025-12-10 17:23:08','6939a9d31f0214517',NULL,NULL),('6939ac86743d8fab2','Submit Popup Reminders',0,'Success','2025-12-10 17:23:18','2025-12-10 17:23:18','6939a9d31c969e5dc',NULL,NULL),('6939ac86745748710','Process Job Queue q0',0,'Success','2025-12-10 17:23:18','2025-12-10 17:23:18','6939a9d31dd8daa8d',NULL,NULL),('6939ac8675ded8a88','Process Job Queue e0',0,'Success','2025-12-10 17:23:18','2025-12-10 17:23:18','6939a9d31f0214517',NULL,NULL),('6939ac907542ccfe9','Process Job Queue q0',0,'Success','2025-12-10 17:23:28','2025-12-10 17:23:28','6939a9d31dd8daa8d',NULL,NULL),('6939ac9075d929e0f','Submit Popup Reminders',0,'Success','2025-12-10 17:23:28','2025-12-10 17:23:28','6939a9d31c969e5dc',NULL,NULL),('6939ac90768a4be83','Process Job Queue e0',0,'Success','2025-12-10 17:23:28','2025-12-10 17:23:28','6939a9d31f0214517',NULL,NULL),('6939ac9a7412a5ab5','Submit Popup Reminders',0,'Success','2025-12-10 17:23:38','2025-12-10 17:23:38','6939a9d31c969e5dc',NULL,NULL),('6939ac9a744412b8f','Process Job Queue q0',0,'Success','2025-12-10 17:23:38','2025-12-10 17:23:38','6939a9d31dd8daa8d',NULL,NULL),('6939ac9a7677056e4','Process Job Queue e0',0,'Success','2025-12-10 17:23:38','2025-12-10 17:23:38','6939a9d31f0214517',NULL,NULL),('6939aca47387c2d5e','Submit Popup Reminders',0,'Success','2025-12-10 17:23:48','2025-12-10 17:23:48','6939a9d31c969e5dc',NULL,NULL),('6939aca47444b67e4','Process Job Queue q0',0,'Success','2025-12-10 17:23:48','2025-12-10 17:23:48','6939a9d31dd8daa8d',NULL,NULL),('6939aca474e1d5610','Process Job Queue e0',0,'Success','2025-12-10 17:23:48','2025-12-10 17:23:48','6939a9d31f0214517',NULL,NULL),('6939acae745e95d76','Submit Popup Reminders',0,'Success','2025-12-10 17:23:58','2025-12-10 17:23:58','6939a9d31c969e5dc',NULL,NULL),('6939acae748838924','Process Job Queue q0',0,'Success','2025-12-10 17:23:58','2025-12-10 17:23:58','6939a9d31dd8daa8d',NULL,NULL),('6939acae74b15e3ca','Process Job Queue e0',0,'Success','2025-12-10 17:23:58','2025-12-10 17:23:58','6939a9d31f0214517',NULL,NULL),('6939acb87bcac3a1f','Send Email Reminders',0,'Success','2025-12-10 17:24:08','2025-12-10 17:24:08','6939a9d35cdbef251',NULL,NULL),('6939acb87bd278104','Auth Token Control',0,'Success','2025-12-10 17:24:08','2025-12-10 17:24:08','6939a9d35feff1ad8',NULL,NULL),('6939acb87c0a8ef65','Send Email Notifications',0,'Success','2025-12-10 17:24:08','2025-12-10 17:24:08','6939a9d35d85d836c',NULL,NULL),('6939acb87e91aaa6c','Process Job Queue q0',0,'Success','2025-12-10 17:24:08','2025-12-10 17:24:08','6939a9d31dd8daa8d',NULL,NULL),('6939acb87f5643a7b','Process Job Queue e0',0,'Success','2025-12-10 17:24:08','2025-12-10 17:24:08','6939a9d31f0214517',NULL,NULL),('6939acb881a837c7b','Process Job Queue q1',0,'Success','2025-12-10 17:24:08','2025-12-10 17:24:08','6939a9d31e7ebae65',NULL,NULL),('6939acb881b72386d','Process Webhook Queue',0,'Success','2025-12-10 17:24:08','2025-12-10 17:24:08','6939a9d361838de09',NULL,NULL),('6939acb8823686464','Submit Popup Reminders',0,'Success','2025-12-10 17:24:08','2025-12-10 17:24:08','6939a9d31c969e5dc',NULL,NULL),('6939acc275b7ca6cf','Process Job Queue q0',0,'Success','2025-12-10 17:24:18','2025-12-10 17:24:18','6939a9d31dd8daa8d',NULL,NULL),('6939acc275dd11fab','Submit Popup Reminders',0,'Success','2025-12-10 17:24:18','2025-12-10 17:24:18','6939a9d31c969e5dc',NULL,NULL),('6939acc277085a4f2','Process Job Queue e0',0,'Success','2025-12-10 17:24:18','2025-12-10 17:24:18','6939a9d31f0214517',NULL,NULL),('6939accc74b754b62','Submit Popup Reminders',0,'Success','2025-12-10 17:24:28','2025-12-10 17:24:28','6939a9d31c969e5dc',NULL,NULL),('6939accc75202a985','Process Job Queue q0',0,'Success','2025-12-10 17:24:28','2025-12-10 17:24:28','6939a9d31dd8daa8d',NULL,NULL),('6939accc7557d8bf2','Process Job Queue e0',0,'Success','2025-12-10 17:24:28','2025-12-10 17:24:28','6939a9d31f0214517',NULL,NULL),('6939acd675d79cfb2','Submit Popup Reminders',0,'Success','2025-12-10 17:24:38','2025-12-10 17:24:38','6939a9d31c969e5dc',NULL,NULL),('6939acd6766c5384f','Process Job Queue q0',0,'Success','2025-12-10 17:24:38','2025-12-10 17:24:38','6939a9d31dd8daa8d',NULL,NULL),('6939acd676b975976','Process Job Queue e0',0,'Success','2025-12-10 17:24:38','2025-12-10 17:24:38','6939a9d31f0214517',NULL,NULL),('6939ace07479575c0','Submit Popup Reminders',0,'Success','2025-12-10 17:24:48','2025-12-10 17:24:48','6939a9d31c969e5dc',NULL,NULL),('6939ace0752b26918','Process Job Queue q0',0,'Success','2025-12-10 17:24:48','2025-12-10 17:24:48','6939a9d31dd8daa8d',NULL,NULL),('6939ace075ed4b5df','Process Job Queue e0',0,'Success','2025-12-10 17:24:48','2025-12-10 17:24:48','6939a9d31f0214517',NULL,NULL),('6939acea792cef72a','Process Job Queue e0',0,'Success','2025-12-10 17:24:58','2025-12-10 17:24:58','6939a9d31f0214517',NULL,NULL),('6939acea79f03b969','Process Job Queue q0',0,'Success','2025-12-10 17:24:58','2025-12-10 17:24:58','6939a9d31dd8daa8d',NULL,NULL),('6939acea7a9cb733e','Submit Popup Reminders',0,'Success','2025-12-10 17:24:58','2025-12-10 17:24:58','6939a9d31c969e5dc',NULL,NULL),('6939acf475ec02576','Submit Popup Reminders',0,'Success','2025-12-10 17:25:08','2025-12-10 17:25:08','6939a9d31c969e5dc',NULL,NULL),('6939acf4777e4fbff','Process Job Queue q1',0,'Success','2025-12-10 17:25:08','2025-12-10 17:25:08','6939a9d31e7ebae65',NULL,NULL),('6939acf47804446e0','Process Job Queue q0',0,'Success','2025-12-10 17:25:08','2025-12-10 17:25:08','6939a9d31dd8daa8d',NULL,NULL),('6939acf478276c1bc','Process Job Queue e0',0,'Success','2025-12-10 17:25:08','2025-12-10 17:25:08','6939a9d31f0214517',NULL,NULL),('6939acfe7b16e97a5','Submit Popup Reminders',0,'Success','2025-12-10 17:25:18','2025-12-10 17:25:18','6939a9d31c969e5dc',NULL,NULL),('6939acfe7be51dbee','Process Job Queue q0',0,'Success','2025-12-10 17:25:18','2025-12-10 17:25:18','6939a9d31dd8daa8d',NULL,NULL),('6939acfe7de192406','Process Job Queue e0',0,'Success','2025-12-10 17:25:18','2025-12-10 17:25:18','6939a9d31f0214517',NULL,NULL),('6939ad08789dc8816','Process Job Queue e0',0,'Success','2025-12-10 17:25:28','2025-12-10 17:25:28','6939a9d31f0214517',NULL,NULL),('6939ad0878de749b9','Submit Popup Reminders',0,'Success','2025-12-10 17:25:28','2025-12-10 17:25:28','6939a9d31c969e5dc',NULL,NULL),('6939ad0878f8740e0','Process Job Queue q0',0,'Success','2025-12-10 17:25:28','2025-12-10 17:25:28','6939a9d31dd8daa8d',NULL,NULL),('6939ad1274cb9936c','Submit Popup Reminders',0,'Success','2025-12-10 17:25:38','2025-12-10 17:25:38','6939a9d31c969e5dc',NULL,NULL),('6939ad1275e71059e','Process Job Queue q0',0,'Success','2025-12-10 17:25:38','2025-12-10 17:25:38','6939a9d31dd8daa8d',NULL,NULL),('6939ad127861835a0','Process Job Queue e0',0,'Success','2025-12-10 17:25:38','2025-12-10 17:25:38','6939a9d31f0214517',NULL,NULL),('6939ad1c76a534715','Process Job Queue q0',0,'Success','2025-12-10 17:25:48','2025-12-10 17:25:48','6939a9d31dd8daa8d',NULL,NULL),('6939ad1c7708430b4','Submit Popup Reminders',0,'Success','2025-12-10 17:25:48','2025-12-10 17:25:48','6939a9d31c969e5dc',NULL,NULL),('6939ad1c7854b5015','Process Job Queue e0',0,'Success','2025-12-10 17:25:48','2025-12-10 17:25:48','6939a9d31f0214517',NULL,NULL),('6939ad2678cc9d77f','Process Job Queue q0',0,'Success','2025-12-10 17:25:58','2025-12-10 17:25:58','6939a9d31dd8daa8d',NULL,NULL),('6939ad2678d157b08','Submit Popup Reminders',0,'Success','2025-12-10 17:25:58','2025-12-10 17:25:58','6939a9d31c969e5dc',NULL,NULL),('6939ad267a4bd1023','Process Job Queue e0',0,'Success','2025-12-10 17:25:58','2025-12-10 17:25:58','6939a9d31f0214517',NULL,NULL),('6939ad3079737acf3','Send Email Reminders',0,'Success','2025-12-10 17:26:08','2025-12-10 17:26:08','6939a9d35cdbef251',NULL,NULL),('6939ad3079907b856','Send Email Notifications',0,'Success','2025-12-10 17:26:08','2025-12-10 17:26:08','6939a9d35d85d836c',NULL,NULL),('6939ad307a759fe04','Process Job Queue q1',0,'Success','2025-12-10 17:26:08','2025-12-10 17:26:08','6939a9d31e7ebae65',NULL,NULL),('6939ad307afdcd910','Submit Popup Reminders',0,'Success','2025-12-10 17:26:08','2025-12-10 17:26:08','6939a9d31c969e5dc',NULL,NULL),('6939ad307f04e2637','Process Webhook Queue',0,'Success','2025-12-10 17:26:08','2025-12-10 17:26:08','6939a9d361838de09',NULL,NULL),('6939ad307f3ec7b58','Process Job Queue e0',0,'Success','2025-12-10 17:26:08','2025-12-10 17:26:08','6939a9d31f0214517',NULL,NULL),('6939ad307fb1d9a84','Process Job Queue q0',0,'Success','2025-12-10 17:26:08','2025-12-10 17:26:08','6939a9d31dd8daa8d',NULL,NULL),('6939ad3a767b47a66','Process Job Queue q0',0,'Success','2025-12-10 17:26:18','2025-12-10 17:26:18','6939a9d31dd8daa8d',NULL,NULL),('6939ad3a76b6fd1b9','Submit Popup Reminders',0,'Success','2025-12-10 17:26:18','2025-12-10 17:26:18','6939a9d31c969e5dc',NULL,NULL),('6939ad3a782313ce2','Process Job Queue e0',0,'Success','2025-12-10 17:26:18','2025-12-10 17:26:18','6939a9d31f0214517',NULL,NULL),('6939ad44786a54d77','Submit Popup Reminders',0,'Success','2025-12-10 17:26:28','2025-12-10 17:26:28','6939a9d31c969e5dc',NULL,NULL),('6939ad4478dadb2c7','Process Job Queue e0',0,'Success','2025-12-10 17:26:28','2025-12-10 17:26:28','6939a9d31f0214517',NULL,NULL),('6939ad4479ab7ee5a','Process Job Queue q0',0,'Success','2025-12-10 17:26:28','2025-12-10 17:26:28','6939a9d31dd8daa8d',NULL,NULL),('6939ad4e75eaea427','Process Job Queue q0',0,'Success','2025-12-10 17:26:38','2025-12-10 17:26:38','6939a9d31dd8daa8d',NULL,NULL),('6939ad4e76213f3f6','Submit Popup Reminders',0,'Success','2025-12-10 17:26:38','2025-12-10 17:26:38','6939a9d31c969e5dc',NULL,NULL),('6939ad4e76ac52ab1','Process Job Queue e0',0,'Success','2025-12-10 17:26:38','2025-12-10 17:26:38','6939a9d31f0214517',NULL,NULL),('6939ad5875eb05930','Process Job Queue q0',0,'Success','2025-12-10 17:26:48','2025-12-10 17:26:48','6939a9d31dd8daa8d',NULL,NULL),('6939ad58765c2a44b','Submit Popup Reminders',0,'Success','2025-12-10 17:26:48','2025-12-10 17:26:48','6939a9d31c969e5dc',NULL,NULL),('6939ad5877730d4a8','Process Job Queue e0',0,'Success','2025-12-10 17:26:48','2025-12-10 17:26:48','6939a9d31f0214517',NULL,NULL),('6939ad6276d0f28a0','Submit Popup Reminders',0,'Success','2025-12-10 17:26:58','2025-12-10 17:26:58','6939a9d31c969e5dc',NULL,NULL),('6939ad6277474854f','Process Job Queue q0',0,'Success','2025-12-10 17:26:58','2025-12-10 17:26:58','6939a9d31dd8daa8d',NULL,NULL),('6939ad627867e685d','Process Job Queue e0',0,'Success','2025-12-10 17:26:58','2025-12-10 17:26:58','6939a9d31f0214517',NULL,NULL),('6939ad6c7c73694fc','Process Job Queue q1',0,'Success','2025-12-10 17:27:08','2025-12-10 17:27:08','6939a9d31e7ebae65',NULL,NULL),('6939ad6c7e420d3a8','Process Job Queue q0',0,'Success','2025-12-10 17:27:08','2025-12-10 17:27:08','6939a9d31dd8daa8d',NULL,NULL),('6939ad6c80f3b0981','Submit Popup Reminders',0,'Success','2025-12-10 17:27:08','2025-12-10 17:27:08','6939a9d31c969e5dc',NULL,NULL),('6939ad6c82130ebed','Process Job Queue e0',0,'Success','2025-12-10 17:27:08','2025-12-10 17:27:08','6939a9d31f0214517',NULL,NULL),('6939ad76768ee6c73','Submit Popup Reminders',0,'Success','2025-12-10 17:27:18','2025-12-10 17:27:18','6939a9d31c969e5dc',NULL,NULL),('6939ad767760b7684','Process Job Queue q0',0,'Success','2025-12-10 17:27:18','2025-12-10 17:27:18','6939a9d31dd8daa8d',NULL,NULL),('6939ad7679bd045c6','Process Job Queue e0',0,'Success','2025-12-10 17:27:18','2025-12-10 17:27:18','6939a9d31f0214517',NULL,NULL),('6939ad80775921284','Process Job Queue q0',0,'Success','2025-12-10 17:27:28','2025-12-10 17:27:28','6939a9d31dd8daa8d',NULL,NULL),('6939ad807799c99cd','Submit Popup Reminders',0,'Success','2025-12-10 17:27:28','2025-12-10 17:27:28','6939a9d31c969e5dc',NULL,NULL),('6939ad8078fba4e6d','Process Job Queue e0',0,'Success','2025-12-10 17:27:28','2025-12-10 17:27:28','6939a9d31f0214517',NULL,NULL),('6939ad8a77e63e973','Process Job Queue q0',0,'Success','2025-12-10 17:27:38','2025-12-10 17:27:38','6939a9d31dd8daa8d',NULL,NULL),('6939ad8a77fc007ee','Submit Popup Reminders',0,'Success','2025-12-10 17:27:38','2025-12-10 17:27:38','6939a9d31c969e5dc',NULL,NULL),('6939ad8a7a72f4a78','Process Job Queue e0',0,'Success','2025-12-10 17:27:38','2025-12-10 17:27:38','6939a9d31f0214517',NULL,NULL),('6939ad94773b3d81c','Submit Popup Reminders',0,'Success','2025-12-10 17:27:48','2025-12-10 17:27:48','6939a9d31c969e5dc',NULL,NULL),('6939ad9478e4e7597','Process Job Queue q0',0,'Success','2025-12-10 17:27:48','2025-12-10 17:27:48','6939a9d31dd8daa8d',NULL,NULL),('6939ad9479da8a960','Process Job Queue e0',0,'Success','2025-12-10 17:27:48','2025-12-10 17:27:48','6939a9d31f0214517',NULL,NULL),('6939ad9e7706fb299','Submit Popup Reminders',0,'Success','2025-12-10 17:27:58','2025-12-10 17:27:58','6939a9d31c969e5dc',NULL,NULL),('6939ad9e77c261b97','Process Job Queue e0',0,'Success','2025-12-10 17:27:58','2025-12-10 17:27:58','6939a9d31f0214517',NULL,NULL),('6939ad9e781b725a2','Process Job Queue q0',0,'Success','2025-12-10 17:27:58','2025-12-10 17:27:58','6939a9d31dd8daa8d',NULL,NULL),('6939ada87becb2597','Process Job Queue q1',0,'Success','2025-12-10 17:28:08','2025-12-10 17:28:08','6939a9d31e7ebae65',NULL,NULL),('6939ada87db071c5a','Process Job Queue q0',0,'Success','2025-12-10 17:28:08','2025-12-10 17:28:08','6939a9d31dd8daa8d',NULL,NULL),('6939ada87dd9c255f','Send Email Reminders',0,'Success','2025-12-10 17:28:08','2025-12-10 17:28:08','6939a9d35cdbef251',NULL,NULL),('6939ada87e10340ed','Process Webhook Queue',0,'Success','2025-12-10 17:28:08','2025-12-10 17:28:08','6939a9d361838de09',NULL,NULL),('6939ada87ebb4213a','Submit Popup Reminders',0,'Success','2025-12-10 17:28:08','2025-12-10 17:28:08','6939a9d31c969e5dc',NULL,NULL),('6939ada88169dc3bf','Process Job Queue e0',0,'Success','2025-12-10 17:28:08','2025-12-10 17:28:08','6939a9d31f0214517',NULL,NULL),('6939ada88193cb8d8','Send Email Notifications',0,'Success','2025-12-10 17:28:08','2025-12-10 17:28:08','6939a9d35d85d836c',NULL,NULL),('6939adb2774d8026f','Submit Popup Reminders',0,'Success','2025-12-10 17:28:18','2025-12-10 17:28:18','6939a9d31c969e5dc',NULL,NULL),('6939adb2776ad4c17','Process Job Queue q0',0,'Success','2025-12-10 17:28:18','2025-12-10 17:28:18','6939a9d31dd8daa8d',NULL,NULL),('6939adb278ce72ec7','Process Job Queue e0',0,'Success','2025-12-10 17:28:18','2025-12-10 17:28:18','6939a9d31f0214517',NULL,NULL),('6939adbc78b9da3d2','Submit Popup Reminders',0,'Success','2025-12-10 17:28:28','2025-12-10 17:28:28','6939a9d31c969e5dc',NULL,NULL),('6939adbc78ec2f86c','Process Job Queue q0',0,'Success','2025-12-10 17:28:28','2025-12-10 17:28:28','6939a9d31dd8daa8d',NULL,NULL),('6939adbc7968e355e','Process Job Queue e0',0,'Success','2025-12-10 17:28:28','2025-12-10 17:28:28','6939a9d31f0214517',NULL,NULL),('6939adc676ff6f402','Submit Popup Reminders',0,'Success','2025-12-10 17:28:38','2025-12-10 17:28:38','6939a9d31c969e5dc',NULL,NULL),('6939adc67733a44a7','Process Job Queue q0',0,'Success','2025-12-10 17:28:38','2025-12-10 17:28:38','6939a9d31dd8daa8d',NULL,NULL),('6939adc67826bc09f','Process Job Queue e0',0,'Success','2025-12-10 17:28:38','2025-12-10 17:28:38','6939a9d31f0214517',NULL,NULL),('6939add0778a42ba6','Process Job Queue q0',0,'Success','2025-12-10 17:28:48','2025-12-10 17:28:48','6939a9d31dd8daa8d',NULL,NULL),('6939add077f4911f1','Submit Popup Reminders',0,'Success','2025-12-10 17:28:48','2025-12-10 17:28:48','6939a9d31c969e5dc',NULL,NULL),('6939add078d495691','Process Job Queue e0',0,'Success','2025-12-10 17:28:48','2025-12-10 17:28:48','6939a9d31f0214517',NULL,NULL),('6939adda784e2af74','Submit Popup Reminders',0,'Success','2025-12-10 17:28:58','2025-12-10 17:28:58','6939a9d31c969e5dc',NULL,NULL),('6939adda7939df6fa','Process Job Queue q0',0,'Success','2025-12-10 17:28:58','2025-12-10 17:28:58','6939a9d31dd8daa8d',NULL,NULL),('6939adda79b95fd65','Process Job Queue e0',0,'Success','2025-12-10 17:28:58','2025-12-10 17:28:58','6939a9d31f0214517',NULL,NULL),('6939ade478839dd1b','Submit Popup Reminders',0,'Success','2025-12-10 17:29:08','2025-12-10 17:29:08','6939a9d31c969e5dc',NULL,NULL),('6939ade4791940478','Process Job Queue q1',0,'Success','2025-12-10 17:29:08','2025-12-10 17:29:08','6939a9d31e7ebae65',NULL,NULL),('6939ade479fc7bc03','Process Job Queue e0',0,'Success','2025-12-10 17:29:08','2025-12-10 17:29:08','6939a9d31f0214517',NULL,NULL),('6939ade47a5170a70','Process Job Queue q0',0,'Success','2025-12-10 17:29:08','2025-12-10 17:29:08','6939a9d31dd8daa8d',NULL,NULL),('6939adee78e483c3e','Process Job Queue q0',0,'Success','2025-12-10 17:29:18','2025-12-10 17:29:18','6939a9d31dd8daa8d',NULL,NULL),('6939adee7973a3818','Process Job Queue e0',0,'Success','2025-12-10 17:29:18','2025-12-10 17:29:18','6939a9d31f0214517',NULL,NULL),('6939adee79c04b47c','Submit Popup Reminders',0,'Success','2025-12-10 17:29:18','2025-12-10 17:29:18','6939a9d31c969e5dc',NULL,NULL),('6939adf87dcf99a1d','Submit Popup Reminders',0,'Success','2025-12-10 17:29:28','2025-12-10 17:29:28','6939a9d31c969e5dc',NULL,NULL),('6939adf87ec51589e','Process Job Queue q0',0,'Success','2025-12-10 17:29:28','2025-12-10 17:29:28','6939a9d31dd8daa8d',NULL,NULL),('6939adf87fddef786','Process Job Queue e0',0,'Success','2025-12-10 17:29:28','2025-12-10 17:29:28','6939a9d31f0214517',NULL,NULL),('6939ae0279025f492','Process Job Queue q0',0,'Success','2025-12-10 17:29:38','2025-12-10 17:29:38','6939a9d31dd8daa8d',NULL,NULL),('6939ae027a46b1866','Process Job Queue e0',0,'Success','2025-12-10 17:29:38','2025-12-10 17:29:38','6939a9d31f0214517',NULL,NULL),('6939ae027a9152338','Submit Popup Reminders',0,'Success','2025-12-10 17:29:38','2025-12-10 17:29:38','6939a9d31c969e5dc',NULL,NULL),('6939ae0c7a3113416','Submit Popup Reminders',0,'Success','2025-12-10 17:29:48','2025-12-10 17:29:48','6939a9d31c969e5dc',NULL,NULL),('6939ae0c7abed4df6','Process Job Queue q0',0,'Success','2025-12-10 17:29:48','2025-12-10 17:29:48','6939a9d31dd8daa8d',NULL,NULL),('6939ae0c7ba29ed65','Process Job Queue e0',0,'Success','2025-12-10 17:29:48','2025-12-10 17:29:48','6939a9d31f0214517',NULL,NULL),('6939ae1679555120a','Submit Popup Reminders',0,'Success','2025-12-10 17:29:58','2025-12-10 17:29:58','6939a9d31c969e5dc',NULL,NULL),('6939ae1679869fbf0','Process Job Queue e0',0,'Success','2025-12-10 17:29:58','2025-12-10 17:29:58','6939a9d31f0214517',NULL,NULL),('6939ae167aa0d734b','Process Job Queue q0',0,'Success','2025-12-10 17:29:58','2025-12-10 17:29:58','6939a9d31dd8daa8d',NULL,NULL),('6939ae208488fa8be','Auth Token Control',0,'Success','2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d35feff1ad8',NULL,NULL),('6939ae2084904cc9c','Send Email Reminders',0,'Success','2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d35cdbef251',NULL,NULL),('6939ae20858716a36','Send Email Notifications',0,'Success','2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d35d85d836c',NULL,NULL),('6939ae2086b3a1a29','Send Scheduled Emails',0,'Success','2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d3623830b3b',NULL,NULL),('6939ae20880cc858a','Send Mass Emails',0,'Success','2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d35ed0d18cb',NULL,NULL),('6939ae208bd779b4b','Process Job Queue q1',0,'Success','2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d31e7ebae65',NULL,NULL),('6939ae208bdc17a5d','Process Webhook Queue',0,'Success','2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d361838de09',NULL,NULL),('6939ae208df095ce9','Submit Popup Reminders',0,'Success','2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d31c969e5dc',NULL,NULL),('6939ae2096e082cfe','Process Job Queue q0',0,'Success','2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d31dd8daa8d',NULL,NULL),('6939ae2097fa5b4bb','Process Job Queue e0',0,'Success','2025-12-10 17:30:08','2025-12-10 17:30:08','6939a9d31f0214517',NULL,NULL),('6939ae2a7a1c38af1','Process Job Queue q0',0,'Success','2025-12-10 17:30:18','2025-12-10 17:30:18','6939a9d31dd8daa8d',NULL,NULL),('6939ae2a7ab09a99b','Submit Popup Reminders',0,'Success','2025-12-10 17:30:18','2025-12-10 17:30:18','6939a9d31c969e5dc',NULL,NULL),('6939ae2a7b1f9ea37','Process Job Queue e0',0,'Success','2025-12-10 17:30:18','2025-12-10 17:30:18','6939a9d31f0214517',NULL,NULL),('6939ae347a4427709','Submit Popup Reminders',0,'Success','2025-12-10 17:30:28','2025-12-10 17:30:28','6939a9d31c969e5dc',NULL,NULL),('6939ae347a88d8a63','Process Job Queue q0',0,'Success','2025-12-10 17:30:28','2025-12-10 17:30:28','6939a9d31dd8daa8d',NULL,NULL),('6939ae347c165f087','Process Job Queue e0',0,'Success','2025-12-10 17:30:28','2025-12-10 17:30:28','6939a9d31f0214517',NULL,NULL),('6939ae3e78470664e','Submit Popup Reminders',0,'Success','2025-12-10 17:30:38','2025-12-10 17:30:38','6939a9d31c969e5dc',NULL,NULL),('6939ae3e79656a4ea','Process Job Queue e0',0,'Success','2025-12-10 17:30:38','2025-12-10 17:30:38','6939a9d31f0214517',NULL,NULL),('6939ae3e79ecdb223','Process Job Queue q0',0,'Success','2025-12-10 17:30:38','2025-12-10 17:30:38','6939a9d31dd8daa8d',NULL,NULL),('6939ae4879f76bb9e','Submit Popup Reminders',0,'Success','2025-12-10 17:30:48','2025-12-10 17:30:48','6939a9d31c969e5dc',NULL,NULL),('6939ae487a41230a6','Process Job Queue q0',0,'Success','2025-12-10 17:30:48','2025-12-10 17:30:48','6939a9d31dd8daa8d',NULL,NULL),('6939ae487b6ddcd0b','Process Job Queue e0',0,'Success','2025-12-10 17:30:48','2025-12-10 17:30:48','6939a9d31f0214517',NULL,NULL),('6939ae52817812076','Process Job Queue e0',0,'Success','2025-12-10 17:30:58','2025-12-10 17:30:58','6939a9d31f0214517',NULL,NULL),('6939ae52820a791f9','Process Job Queue q0',0,'Success','2025-12-10 17:30:58','2025-12-10 17:30:58','6939a9d31dd8daa8d',NULL,NULL),('6939ae5283929ae02','Submit Popup Reminders',0,'Success','2025-12-10 17:30:58','2025-12-10 17:30:58','6939a9d31c969e5dc',NULL,NULL),('6939ae5c835bc1ce4','Process Job Queue e0',0,'Success','2025-12-10 17:31:08','2025-12-10 17:31:08','6939a9d31f0214517',NULL,NULL),('6939ae5c8365de3a6','Submit Popup Reminders',0,'Success','2025-12-10 17:31:08','2025-12-10 17:31:08','6939a9d31c969e5dc',NULL,NULL),('6939ae5c83708ddbe','Process Job Queue q1',0,'Success','2025-12-10 17:31:08','2025-12-10 17:31:08','6939a9d31e7ebae65',NULL,NULL),('6939ae5c83e73ed92','Process Job Queue q0',0,'Success','2025-12-10 17:31:08','2025-12-10 17:31:08','6939a9d31dd8daa8d',NULL,NULL),('6939ae667d2dcd4fe','Submit Popup Reminders',0,'Success','2025-12-10 17:31:18','2025-12-10 17:31:18','6939a9d31c969e5dc',NULL,NULL),('6939ae667d8819600','Process Job Queue q0',0,'Success','2025-12-10 17:31:18','2025-12-10 17:31:18','6939a9d31dd8daa8d',NULL,NULL),('6939ae667e783687d','Process Job Queue e0',0,'Success','2025-12-10 17:31:18','2025-12-10 17:31:18','6939a9d31f0214517',NULL,NULL),('6939ae707dce8606d','Submit Popup Reminders',0,'Success','2025-12-10 17:31:28','2025-12-10 17:31:28','6939a9d31c969e5dc',NULL,NULL),('6939ae707de68312d','Process Job Queue q0',0,'Success','2025-12-10 17:31:28','2025-12-10 17:31:28','6939a9d31dd8daa8d',NULL,NULL),('6939ae707e5bec3ea','Process Job Queue e0',0,'Success','2025-12-10 17:31:28','2025-12-10 17:31:28','6939a9d31f0214517',NULL,NULL),('6939ae7a796757be5','Process Job Queue q0',0,'Success','2025-12-10 17:31:38','2025-12-10 17:31:38','6939a9d31dd8daa8d',NULL,NULL),('6939ae7a798df59b4','Submit Popup Reminders',0,'Success','2025-12-10 17:31:38','2025-12-10 17:31:38','6939a9d31c969e5dc',NULL,NULL),('6939ae7a7ba936a0f','Process Job Queue e0',0,'Success','2025-12-10 17:31:38','2025-12-10 17:31:38','6939a9d31f0214517',NULL,NULL),('6939ae847a2f0b42e','Process Job Queue q0',0,'Success','2025-12-10 17:31:48','2025-12-10 17:31:48','6939a9d31dd8daa8d',NULL,NULL),('6939ae847ab54f8e9','Submit Popup Reminders',0,'Success','2025-12-10 17:31:48','2025-12-10 17:31:48','6939a9d31c969e5dc',NULL,NULL),('6939ae847be86c564','Process Job Queue e0',0,'Success','2025-12-10 17:31:48','2025-12-10 17:31:48','6939a9d31f0214517',NULL,NULL);
/*!40000 ALTER TABLE `scheduled_job_log_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms`
--

DROP TABLE IF EXISTS `sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Archived',
  `date_sent` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `from_phone_number_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `replied_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DATE_SENT` (`date_sent`,`deleted`),
  KEY `IDX_DATE_SENT_STATUS` (`date_sent`,`status`,`deleted`),
  KEY `IDX_FROM_PHONE_NUMBER_ID` (`from_phone_number_id`),
  KEY `IDX_PARENT` (`parent_id`,`parent_type`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_REPLIED_ID` (`replied_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms`
--

LOCK TABLES `sms` WRITE;
/*!40000 ALTER TABLE `sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_phone_number`
--

DROP TABLE IF EXISTS `sms_phone_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_phone_number` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sms_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_SMS_ID_PHONE_NUMBER_ID_ADDRESS_TYPE` (`sms_id`,`phone_number_id`,`address_type`),
  KEY `IDX_SMS_ID` (`sms_id`),
  KEY `IDX_PHONE_NUMBER_ID` (`phone_number_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_phone_number`
--

LOCK TABLES `sms_phone_number` WRITE;
/*!40000 ALTER TABLE `sms_phone_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_phone_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star_subscription`
--

DROP TABLE IF EXISTS `star_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `star_subscription` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `entity_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_USER_ENTITY` (`user_id`,`entity_id`,`entity_type`),
  KEY `IDX_USER_ENTITY_TYPE` (`user_id`,`entity_type`),
  KEY `IDX_ENTITY` (`entity_id`,`entity_type`),
  KEY `IDX_USER` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star_subscription`
--

LOCK TABLES `star_subscription` WRITE;
/*!40000 ALTER TABLE `star_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `star_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stream_subscription`
--

DROP TABLE IF EXISTS `stream_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stream_subscription` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) DEFAULT '0',
  `entity_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_USER_ENTITY` (`user_id`,`entity_id`,`entity_type`),
  KEY `IDX_ENTITY` (`entity_id`,`entity_type`),
  KEY `IDX_USER` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stream_subscription`
--

LOCK TABLES `stream_subscription` WRITE;
/*!40000 ALTER TABLE `stream_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `stream_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_data`
--

DROP TABLE IF EXISTS `system_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_data` (
  `id` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `last_password_recovery_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_data`
--

LOCK TABLES `system_data` WRITE;
/*!40000 ALTER TABLE `system_data` DISABLE KEYS */;
INSERT INTO `system_data` VALUES ('1',0,NULL);
/*!40000 ALTER TABLE `system_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target`
--

DROP TABLE IF EXISTS `target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `target` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `salutation_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_postal_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `do_not_call` tinyint(1) NOT NULL DEFAULT '0',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `middle_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FIRST_NAME` (`first_name`,`deleted`),
  KEY `IDX_NAME` (`first_name`,`last_name`),
  KEY `IDX_ASSIGNED_USER` (`assigned_user_id`,`deleted`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_ASSIGNED_USER_ID` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target`
--

LOCK TABLES `target` WRITE;
/*!40000 ALTER TABLE `target` DISABLE KEYS */;
/*!40000 ALTER TABLE `target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target_list`
--

DROP TABLE IF EXISTS `target_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `target_list` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `category_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_AT` (`created_at`,`deleted`),
  KEY `IDX_CATEGORY_ID` (`category_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_ASSIGNED_USER_ID` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_list`
--

LOCK TABLES `target_list` WRITE;
/*!40000 ALTER TABLE `target_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `target_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target_list_category`
--

DROP TABLE IF EXISTS `target_list_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `target_list_category` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `order` int DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_list_category`
--

LOCK TABLES `target_list_category` WRITE;
/*!40000 ALTER TABLE `target_list_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `target_list_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target_list_category_path`
--

DROP TABLE IF EXISTS `target_list_category_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `target_list_category_path` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ascendor_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descendor_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ASCENDOR_ID` (`ascendor_id`),
  KEY `IDX_DESCENDOR_ID` (`descendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_list_category_path`
--

LOCK TABLES `target_list_category_path` WRITE;
/*!40000 ALTER TABLE `target_list_category_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `target_list_category_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target_list_user`
--

DROP TABLE IF EXISTS `target_list_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `target_list_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_list_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opted_out` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_USER_ID_TARGET_LIST_ID` (`user_id`,`target_list_id`),
  KEY `IDX_USER_ID` (`user_id`),
  KEY `IDX_TARGET_LIST_ID` (`target_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_list_user`
--

LOCK TABLES `target_list_user` WRITE;
/*!40000 ALTER TABLE `target_list_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `target_list_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Not Started',
  `priority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Normal',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `date_start_date` date DEFAULT NULL,
  `date_end_date` date DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `stream_updated_at` datetime DEFAULT NULL,
  `parent_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_number` bigint DEFAULT NULL,
  `email_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DATE_START_STATUS` (`date_start`,`status`),
  KEY `IDX_DATE_END_STATUS` (`date_end`,`status`),
  KEY `IDX_DATE_START` (`date_start`,`deleted`),
  KEY `IDX_STATUS` (`status`,`deleted`),
  KEY `IDX_ASSIGNED_USER` (`assigned_user_id`,`deleted`),
  KEY `IDX_ASSIGNED_USER_STATUS` (`assigned_user_id`,`status`),
  KEY `IDX_PARENT` (`parent_id`,`parent_type`),
  KEY `IDX_ACCOUNT_ID` (`account_id`),
  KEY `IDX_CONTACT_ID` (`contact_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`),
  KEY `IDX_ASSIGNED_USER_ID` (`assigned_user_id`),
  KEY `IDX_EMAIL_ID` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `position_list` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `layout_set_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_time_calendar_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_LAYOUT_SET_ID` (`layout_set_id`),
  KEY `IDX_WORKING_TIME_CALENDAR_ID` (`working_time_calendar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_user`
--

DROP TABLE IF EXISTS `team_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `team_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_TEAM_ID_USER_ID` (`team_id`,`user_id`),
  KEY `IDX_TEAM_ID` (`team_id`),
  KEY `IDX_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_user`
--

LOCK TABLES `team_user` WRITE;
/*!40000 ALTER TABLE `team_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `body` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `header` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `footer` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `entity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `left_margin` double DEFAULT '10',
  `right_margin` double DEFAULT '10',
  `top_margin` double DEFAULT '10',
  `bottom_margin` double DEFAULT '20',
  `print_footer` tinyint(1) NOT NULL DEFAULT '0',
  `print_header` tinyint(1) NOT NULL DEFAULT '0',
  `footer_position` double DEFAULT '10',
  `header_position` double DEFAULT '0',
  `style` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `page_orientation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Portrait',
  `page_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'A4',
  `page_width` double DEFAULT NULL,
  `page_height` double DEFAULT NULL,
  `font_face` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_number` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `two_factor_code`
--

DROP TABLE IF EXISTS `two_factor_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `two_factor_code` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts_left` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_USER_ID_METHOD` (`user_id`,`method`),
  KEY `IDX_USER_ID_METHOD_IS_ACTIVE` (`user_id`,`method`,`is_active`),
  KEY `IDX_USER_ID_METHOD_CREATED_AT` (`user_id`,`method`,`created_at`),
  KEY `IDX_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `two_factor_code`
--

LOCK TABLES `two_factor_code` WRITE;
/*!40000 ALTER TABLE `two_factor_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `two_factor_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unique_id`
--

DROP TABLE IF EXISTS `unique_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unique_id` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `terminate_at` datetime DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_NAME` (`name`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_TARGET` (`target_id`,`target_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unique_id`
--

LOCK TABLES `unique_id` WRITE;
/*!40000 ALTER TABLE `unique_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `unique_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'regular',
  `password` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_method` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salutation_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `middle_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `default_team_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_template_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_time_calendar_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout_set_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_USER_NAME_DELETE_ID` (`user_name`,`delete_id`),
  KEY `IDX_USER_NAME` (`user_name`),
  KEY `IDX_TYPE` (`type`),
  KEY `IDX_DEFAULT_TEAM_ID` (`default_team_id`),
  KEY `IDX_CONTACT_ID` (`contact_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_DASHBOARD_TEMPLATE_ID` (`dashboard_template_id`),
  KEY `IDX_WORKING_TIME_CALENDAR_ID` (`working_time_calendar_id`),
  KEY `IDX_LAYOUT_SET_ID` (`layout_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('6939a9d3396c90d2b',0,'admin','admin','$2y$10$sYSikz5aiGoJrKfULxFgeer2y6OkV2CZPkaCb8EZwXJa.BMvTv4oW',NULL,NULL,NULL,NULL,'Admin',1,NULL,NULL,NULL,'2025-12-10 17:11:47','2025-12-10 17:11:47',NULL,'0',NULL,NULL,NULL,'system',NULL,NULL,NULL),('6939ad4be9fe21431',0,'pacific_admin','regular','$2y$10$0cNRxd8W7HO3VZ.WjcVHm.ruExw0vIMPMvqsluHReBCIMOsAENuAG',NULL,NULL,'Mr.','Pacific','Admin',1,NULL,NULL,NULL,'2025-12-10 17:26:35','2025-12-10 17:26:35',NULL,'0',NULL,NULL,NULL,'6939a9d3396c90d2b',NULL,NULL,NULL),('6939ad6c5ed8d27f9',0,'pacific_sale','regular','$2y$10$UdZ8F8d0X6DZldub/cuL1O3yPonjNVvJwwJhy8Q0dcnQc6jKm.f8C',NULL,NULL,'Mr.','Pacific','Sale',1,NULL,NULL,NULL,'2025-12-10 17:27:08','2025-12-10 17:29:52',NULL,'0',NULL,NULL,NULL,'6939a9d3396c90d2b',NULL,NULL,NULL),('6939ad8961a73e970',0,'pacific_telesale','regular','$2y$10$9wL9Wn3N9/0SMJyyBGGjKeKNVRPXXjkFo0cKHChJxsX9yrt9Borrq',NULL,NULL,NULL,'Pacific','Telesale',1,NULL,NULL,NULL,'2025-12-10 17:27:37','2025-12-10 17:30:06',NULL,'0',NULL,NULL,NULL,'6939a9d3396c90d2b',NULL,NULL,NULL),('system',0,'system','system',NULL,NULL,NULL,NULL,NULL,'System',1,NULL,NULL,NULL,'2025-12-10 17:11:47','2025-12-10 17:11:47',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_data`
--

DROP TABLE IF EXISTS `user_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_data` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `auth2_f_a` tinyint(1) NOT NULL DEFAULT '0',
  `auth2_f_a_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth2_f_a_totp_secret` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth2_f_a_email_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_data`
--

LOCK TABLES `user_data` WRITE;
/*!40000 ALTER TABLE `user_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_reaction`
--

DROP TABLE IF EXISTS `user_reaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_reaction` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_PARENT_USER_TYPE` (`parent_id`,`parent_type`,`user_id`,`type`),
  KEY `IDX_USER_ID` (`user_id`),
  KEY `IDX_PARENT` (`parent_id`,`parent_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_reaction`
--

LOCK TABLES `user_reaction` WRITE;
/*!40000 ALTER TABLE `user_reaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_reaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_working_time_range`
--

DROP TABLE IF EXISTS `user_working_time_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_working_time_range` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_time_range_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_USER_ID_WORKING_TIME_RANGE_ID` (`user_id`,`working_time_range_id`),
  KEY `IDX_USER_ID` (`user_id`),
  KEY `IDX_WORKING_TIME_RANGE_ID` (`working_time_range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_working_time_range`
--

LOCK TABLES `user_working_time_range` WRITE;
/*!40000 ALTER TABLE `user_working_time_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_working_time_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhook`
--

DROP TABLE IF EXISTS `webhook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhook` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `event` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `entity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skip_own` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EVENT` (`event`),
  KEY `IDX_ENTITY_TYPE_TYPE` (`entity_type`,`type`),
  KEY `IDX_ENTITY_TYPE_FIELD` (`entity_type`,`field`),
  KEY `IDX_USER_ID` (`user_id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook`
--

LOCK TABLES `webhook` WRITE;
/*!40000 ALTER TABLE `webhook` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhook_event_queue_item`
--

DROP TABLE IF EXISTS `webhook_event_queue_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhook_event_queue_item` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `number` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `is_processed` tinyint(1) NOT NULL DEFAULT '0',
  `target_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_NUMBER` (`number`),
  KEY `IDX_TARGET` (`target_id`,`target_type`),
  KEY `IDX_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook_event_queue_item`
--

LOCK TABLES `webhook_event_queue_item` WRITE;
/*!40000 ALTER TABLE `webhook_event_queue_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook_event_queue_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhook_queue_item`
--

DROP TABLE IF EXISTS `webhook_queue_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhook_queue_item` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `number` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `status` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `processed_at` datetime DEFAULT NULL,
  `attempts` int DEFAULT '0',
  `process_at` datetime DEFAULT NULL,
  `webhook_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_NUMBER` (`number`),
  KEY `IDX_WEBHOOK_ID` (`webhook_id`),
  KEY `IDX_TARGET` (`target_id`,`target_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook_queue_item`
--

LOCK TABLES `webhook_queue_item` WRITE;
/*!40000 ALTER TABLE `webhook_queue_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook_queue_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `working_time_calendar`
--

DROP TABLE IF EXISTS `working_time_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `working_time_calendar` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `time_zone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_ranges` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `weekday0` tinyint(1) NOT NULL DEFAULT '0',
  `weekday1` tinyint(1) NOT NULL DEFAULT '1',
  `weekday2` tinyint(1) NOT NULL DEFAULT '1',
  `weekday3` tinyint(1) NOT NULL DEFAULT '1',
  `weekday4` tinyint(1) NOT NULL DEFAULT '1',
  `weekday5` tinyint(1) NOT NULL DEFAULT '1',
  `weekday6` tinyint(1) NOT NULL DEFAULT '0',
  `weekday0_time_ranges` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `weekday1_time_ranges` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `weekday2_time_ranges` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `weekday3_time_ranges` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `weekday4_time_ranges` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `weekday5_time_ranges` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `weekday6_time_ranges` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `working_time_calendar`
--

LOCK TABLES `working_time_calendar` WRITE;
/*!40000 ALTER TABLE `working_time_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `working_time_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `working_time_calendar_working_time_range`
--

DROP TABLE IF EXISTS `working_time_calendar_working_time_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `working_time_calendar_working_time_range` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `working_time_calendar_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_time_range_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_WORKING_TIME_CALENDAR_ID_WORKING_TIME_RANGE_ID` (`working_time_calendar_id`,`working_time_range_id`),
  KEY `IDX_WORKING_TIME_CALENDAR_ID` (`working_time_calendar_id`),
  KEY `IDX_WORKING_TIME_RANGE_ID` (`working_time_range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `working_time_calendar_working_time_range`
--

LOCK TABLES `working_time_calendar_working_time_range` WRITE;
/*!40000 ALTER TABLE `working_time_calendar_working_time_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `working_time_calendar_working_time_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `working_time_range`
--

DROP TABLE IF EXISTS `working_time_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `working_time_range` (
  `id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `time_ranges` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `type` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Non-working',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `created_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_TYPE_RANGE` (`type`,`date_start`,`date_end`),
  KEY `IDX_TYPE` (`type`),
  KEY `IDX_CREATED_BY_ID` (`created_by_id`),
  KEY `IDX_MODIFIED_BY_ID` (`modified_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `working_time_range`
--

LOCK TABLES `working_time_range` WRITE;
/*!40000 ALTER TABLE `working_time_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `working_time_range` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-10 17:31:51
