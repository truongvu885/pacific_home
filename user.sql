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
INSERT INTO `user` (`id`, `deleted`, `user_name`, `type`, `password`, `auth_method`, `api_key`, `salutation_name`, `first_name`, `last_name`, `is_active`, `title`, `avatar_color`, `gender`, `created_at`, `modified_at`, `middle_name`, `delete_id`, `default_team_id`, `contact_id`, `avatar_id`, `created_by_id`, `dashboard_template_id`, `working_time_calendar_id`, `layout_set_id`) VALUES ('69437235892b8c966',0,'admin','admin','$2y$10$izYCVAda7VSEUjh/lktReOhsYzPntKdrZf13cegzeJeiC5XKsqIjy',NULL,NULL,NULL,NULL,'Admin',1,NULL,NULL,NULL,'2025-12-18 03:17:09','2025-12-18 03:17:09',NULL,'0',NULL,NULL,NULL,'system',NULL,NULL,NULL),('69437f114ddd01056',0,'pacific_admin','regular','$2y$10$q8ycMfMqx7fJ/yO2BY1Tw.Z98bhTPMTFPdCNqj2Ns.waIe04f4/4m',NULL,NULL,'Mr.','pacific','admin',1,NULL,NULL,NULL,'2025-12-18 04:12:01','2025-12-29 08:13:55',NULL,'0',NULL,NULL,NULL,'69437235892b8c966',NULL,NULL,NULL),('694385c9507d50552',0,'pacific_telesale','regular','$2y$10$VZAkddhJZ93LmL/KfsuXMe3OocDF/ng44KaiLh9bIdjYJ7DPByo0K',NULL,NULL,'Mr.','pacific','telesale',1,NULL,NULL,NULL,'2025-12-18 04:40:41','2025-12-18 04:40:41',NULL,'0',NULL,NULL,NULL,'69437235892b8c966',NULL,NULL,NULL),('694a505ea3085db25',0,'pacific_ctv','regular','$2y$10$JBIJ00ubtLjFjKVVYygue.WfxyqDTuYpfnAl5ccapHc76oiYnpBOq',NULL,NULL,'Mr.','pacific','ctv',1,NULL,NULL,NULL,'2025-12-23 08:18:38','2025-12-30 04:35:57',NULL,'0',NULL,NULL,NULL,'69437235892b8c966',NULL,NULL,NULL),('694e0174a797c3015',0,'pacific_owner','admin','$2y$10$4uF4AbZA60lleimhuGS1R.zgrMbSTc5OjdXTKx5lr4ATRDlQYitHa',NULL,NULL,NULL,'pacific','owner',1,NULL,NULL,NULL,'2025-12-26 03:31:00','2025-12-26 03:31:00',NULL,'0',NULL,NULL,NULL,'69437235892b8c966',NULL,NULL,NULL),('69535848af730e4f0',0,'pacific_sale','regular','$2y$10$WDaBt6nir48IYMljXm3Pxu4Y/3jacqaW88QA/mAH2R.Od2P3LNMRO',NULL,NULL,'Mr.','pacific','sale',1,NULL,NULL,NULL,'2025-12-30 04:42:48','2025-12-30 04:42:48',NULL,'0',NULL,NULL,NULL,'69437235892b8c966',NULL,NULL,NULL),('system',0,'system','system',NULL,NULL,NULL,NULL,NULL,'System',1,NULL,NULL,NULL,'2025-12-18 03:17:09','2025-12-18 03:17:09',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-05  4:26:35
