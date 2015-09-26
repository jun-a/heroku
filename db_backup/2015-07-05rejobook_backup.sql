-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: rejobook_develop
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'rejob.aramaki@gmail.com','jun910','2015-07-03 06:42:46','2015-07-03 06:42:46');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `communities_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `communities_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `communities_file_size` int(11) DEFAULT NULL,
  `communities_updated_at` datetime DEFAULT NULL,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'日本酒の会','日本酒おいしいですよ！','2015-07-03 06:42:50','2015-07-03 06:42:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'フットサル部','フットサル無しでは、生きていけませんよ！','2015-07-03 06:42:50','2015-07-03 06:42:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'きっかけ委員','部署を超えて、世代を超えて、仕事の話や趣味の話などが個々にできる場のきっかけ作りを企画しております。','2015-07-03 06:42:50','2015-07-03 06:42:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'ヘルスケア部','ジムだけに特に事務の方、積極的にご参加ください！','2015-07-03 06:42:50','2015-07-03 06:42:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'さくらBar','部署を超えて、世代を超えて、仕事の話や趣味の話などが個々にできる場のきっかけ作りを企画しております。 ','2015-07-03 06:42:50','2015-07-03 06:42:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'咲くラボ','みなさんで楽しくご一緒にお勉強しましょう','2015-07-03 06:42:50','2015-07-03 06:42:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_comments`
--

DROP TABLE IF EXISTS `community_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_comments`
--

LOCK TABLES `community_comments` WRITE;
/*!40000 ALTER TABLE `community_comments` DISABLE KEYS */;
INSERT INTO `community_comments` VALUES (1,'say hello! for 0 times',NULL,1,1,'2015-07-03 06:42:44','2015-07-03 06:42:44'),(2,'say hello! for 1 times',NULL,2,2,'2015-07-03 06:42:44','2015-07-03 06:42:44'),(3,'say hello! for 2 times',NULL,3,3,'2015-07-03 06:42:44','2015-07-03 06:42:44'),(4,'say hello! for 3 times',NULL,1,4,'2015-07-03 06:42:44','2015-07-03 06:42:44'),(5,'say hello! for 4 times',NULL,2,1,'2015-07-03 06:42:44','2015-07-03 06:42:44'),(6,'say hello! for 5 times',NULL,3,2,'2015-07-03 06:42:44','2015-07-03 06:42:44'),(7,'say hello! for 6 times',NULL,1,3,'2015-07-03 06:42:44','2015-07-03 06:42:44'),(8,'say hello! for 7 times',NULL,2,4,'2015-07-03 06:42:44','2015-07-03 06:42:44'),(9,'say hello! for 8 times',NULL,3,1,'2015-07-03 06:42:44','2015-07-03 06:42:44'),(10,'say hello! for 9 times',NULL,1,2,'2015-07-03 06:42:44','2015-07-03 06:42:44'),(11,'say hello! for 10 times',NULL,2,3,'2015-07-03 06:42:44','2015-07-03 06:42:44'),(12,'say hello! for 11 times',NULL,3,4,'2015-07-03 06:42:44','2015-07-03 06:42:44'),(13,'say hello! for 12 times',NULL,1,1,'2015-07-03 06:42:44','2015-07-03 06:42:44'),(14,'say hello! for 13 times',NULL,2,2,'2015-07-03 06:42:44','2015-07-03 06:42:44'),(15,'say hello! for 14 times',NULL,3,3,'2015-07-03 06:42:44','2015-07-03 06:42:44'),(16,'say hello! for 15 times',NULL,1,4,'2015-07-03 06:42:45','2015-07-03 06:42:45'),(17,'say hello! for 16 times',NULL,2,1,'2015-07-03 06:42:45','2015-07-03 06:42:45'),(18,'say hello! for 17 times',NULL,3,2,'2015-07-03 06:42:45','2015-07-03 06:42:45'),(19,'say hello! for 18 times',NULL,1,3,'2015-07-03 06:42:45','2015-07-03 06:42:45'),(20,'say hello! for 19 times',NULL,2,4,'2015-07-03 06:42:45','2015-07-03 06:42:45'),(21,'fjspj',NULL,1,1,'2015-07-03 13:06:05','2015-07-03 13:06:05');
/*!40000 ALTER TABLE `community_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'役員','2015-07-03 06:42:48','2015-07-03 06:42:48'),(2,'社長室','2015-07-03 06:42:48','2015-07-03 06:42:48'),(3,'CSV推進室','2015-07-03 06:42:48','2015-07-03 06:42:48'),(4,'コーポレート推進室','2015-07-03 06:42:48','2015-07-03 06:42:48'),(5,'総務人事部','2015-07-03 06:42:48','2015-07-03 06:42:48'),(6,'債務管理部','2015-07-03 06:42:48','2015-07-03 06:42:48'),(7,'財務管理部','2015-07-03 06:42:48','2015-07-03 06:42:48'),(8,'売上管理部','2015-07-03 06:42:48','2015-07-03 06:42:48'),(9,'法人営業Div','2015-07-03 06:42:49','2015-07-03 06:42:49'),(10,'リテール営業Div','2015-07-03 06:42:49','2015-07-03 06:42:49'),(11,'クライアント支援Div','2015-07-03 06:42:49','2015-07-03 06:42:49'),(12,'WebマーケティングDiv','2015-07-03 06:42:49','2015-07-03 06:42:49'),(13,'リアルマーケティングDiv','2015-07-03 06:42:49','2015-07-03 06:42:49'),(14,'FAURA編集部','2015-07-03 06:42:49','2015-07-03 06:42:49'),(15,'エンジニアUNIT','2015-07-03 06:42:49','2015-07-03 06:42:49'),(16,'デザインUNIT','2015-07-03 06:42:49','2015-07-03 06:42:49'),(17,'カイゼンPJT','2015-07-03 06:42:49','2015-07-03 06:42:49'),(18,'リニューアルPJT','2015-07-03 06:42:49','2015-07-03 06:42:49');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_departments`
--

DROP TABLE IF EXISTS `main_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_departments`
--

LOCK TABLES `main_departments` WRITE;
/*!40000 ALTER TABLE `main_departments` DISABLE KEYS */;
INSERT INTO `main_departments` VALUES (1,'リクルーティングDiv','2015-07-03 06:42:49','2015-07-03 06:42:49'),(2,'役員','2015-07-03 06:42:49','2015-07-03 06:42:49'),(3,'社長室','2015-07-03 06:42:49','2015-07-03 06:42:49'),(4,'CSV推進室','2015-07-03 06:42:49','2015-07-03 06:42:49'),(5,'コーポレイト推進室','2015-07-03 06:42:49','2015-07-03 06:42:49'),(6,'総務人事部','2015-07-03 06:42:49','2015-07-03 06:42:49'),(7,'債務管理部','2015-07-03 06:42:49','2015-07-03 06:42:49'),(8,'財務管理部','2015-07-03 06:42:49','2015-07-03 06:42:49'),(9,'売上管理部','2015-07-03 06:42:49','2015-07-03 06:42:49'),(10,'法人営業Div','2015-07-03 06:42:49','2015-07-03 06:42:49'),(11,'リテール営業Div','2015-07-03 06:42:50','2015-07-03 06:42:50'),(12,'クライアント支援Div','2015-07-03 06:42:50','2015-07-03 06:42:50'),(13,'リクルーティングDiv','2015-07-03 06:42:50','2015-07-03 06:42:50'),(14,'WebマーケティングDiv','2015-07-03 06:42:50','2015-07-03 06:42:50'),(15,'リアルマーケティングDiv','2015-07-03 06:42:50','2015-07-03 06:42:50'),(16,'FAURA編集部','2015-07-03 06:42:50','2015-07-03 06:42:50'),(17,'エンジニアUNIT','2015-07-03 06:42:50','2015-07-03 06:42:50'),(18,'デザインUNIT','2015-07-03 06:42:50','2015-07-03 06:42:50'),(19,'カイゼンPJT','2015-07-03 06:42:50','2015-07-03 06:42:50'),(20,'リニューアルPJT','2015-07-03 06:42:50','2015-07-03 06:42:50');
/*!40000 ALTER TABLE `main_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` blob,
  `kana` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chatwork_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `birthday` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `indoor_call` int(11) DEFAULT NULL,
  `profile_message` text COLLATE utf8_unicode_ci,
  `hobby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job` text COLLATE utf8_unicode_ci,
  `main_department_id` int(11) DEFAULT NULL,
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_members_on_email` (`email`),
  UNIQUE KEY `index_members_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'sample0@rejob.co.jp','$2a$10$72AT2PclQK0Mm3Yt9wLIZ.fcMm71pAe7yn4l6Rot7pqy0HiSiqzFS','0-member',NULL,'0-kana',NULL,'2015-09-00','1','1992-09-00',90,'you are 0 rejob member!','0-like!','0-working',1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-07-03 06:42:47','2015-07-03 06:42:47',NULL,NULL,NULL),(2,'sample1@rejob.co.jp','$2a$10$5fZXQpaVcZCO8EPp9XTSAeOuh4iSMIaF5VKZJyC6sjVzczHyYpD72','1-member',NULL,'1-kana',NULL,'2015-09-01','2','1992-09-01',90,'you are 1 rejob member!','1-like!','1-working',2,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-07-03 06:42:47','2015-07-03 06:42:47',NULL,NULL,NULL),(3,'sample2@rejob.co.jp','$2a$10$rfG64jEionU5aWJCnWKVzejgWRiMkrC9WTQ7n7WPlS/0GVOzv6sMC','2-member',NULL,'2-kana',NULL,'2015-09-02','3','1992-09-02',90,'you are 2 rejob member!','2-like!','2-working',3,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-07-03 06:42:47','2015-07-03 06:42:47',NULL,NULL,NULL),(4,'sample3@rejob.co.jp','$2a$10$zTt.VoT09uGnU9im1ITB2.U5dmj3Mr5mnWV0NT9BfG4hwzIGuffyi','3-member',NULL,'3-kana',NULL,'2015-09-03','4','1992-09-03',90,'you are 3 rejob member!','3-like!','3-working',1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-07-03 06:42:47','2015-07-03 06:42:47',NULL,NULL,NULL),(5,'sample4@rejob.co.jp','$2a$10$2b0XT6N.8hwDvLKdl5E5NOZD0SUy3jZTqu1Eot2Hfm8zfR/BLICtu','4-member',NULL,'4-kana',NULL,'2015-09-04','5','1992-09-04',90,'you are 4 rejob member!','4-like!','4-working',2,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-07-03 06:42:47','2015-07-03 06:42:47',NULL,NULL,NULL),(6,'sample5@rejob.co.jp','$2a$10$armAyGngz2yWRIBb3fgSqO7aX6Q3MRQdHNCpMrI9AXsAkAoOEM/6C','5-member',NULL,'5-kana',NULL,'2015-09-05','6','1992-09-05',90,'you are 5 rejob member!','5-like!','5-working',3,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-07-03 06:42:47','2015-07-03 06:42:47',NULL,NULL,NULL),(7,'sample6@rejob.co.jp','$2a$10$42alaW9W8Enikk5AOp2ZCuVKMHUkf7VWaBitnKkyN0Mvo324i/Z6.','6-member',NULL,'6-kana',NULL,'2015-09-06','7','1992-09-06',90,'you are 6 rejob member!','6-like!','6-working',1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-07-03 06:42:48','2015-07-03 06:42:48',NULL,NULL,NULL),(8,'sample7@rejob.co.jp','$2a$10$RY6HRMQ6YqnDJrzSThJuMu2ashZYjULYjcmg.1/A.eHvONAcWay3S','7-member',NULL,'7-kana',NULL,'2015-09-07','8','1992-09-07',90,'you are 7 rejob member!','7-like!','7-working',2,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-07-03 06:42:48','2015-07-03 06:42:48',NULL,NULL,NULL),(9,'sample8@rejob.co.jp','$2a$10$TZ2RdWii5K3OhlJDIel/Z.1BnWue.RcpdTMPvJCNC5AaXrlL9IBe.','8-member',NULL,'8-kana',NULL,'2015-09-08','9','1992-09-08',90,'you are 8 rejob member!','8-like!','8-working',3,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-07-03 06:42:48','2015-07-03 06:42:48',NULL,NULL,NULL),(10,'sample9@rejob.co.jp','$2a$10$k8rTj6Pe0pPByRJF6h6dueYOf0g3nhWJN7Hy0/YeUgbZemRXRRNK6','9-member',NULL,'9-kana',NULL,'2015-09-09','10','1992-09-09',90,'you are 9 rejob member!','9-like!','9-working',1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-07-03 06:42:48','2015-07-03 06:42:48',NULL,NULL,NULL),(11,'junradio910@gmail.com','$2a$10$Eq4erFAnCTe9v8.Vxymt4.IPukptRgIjIojpEhshIvpufM50VDpO2',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-07-03 12:23:19','2015-07-03 12:23:19','127.0.0.1','127.0.0.1','2015-07-03 12:23:19','2015-07-03 12:23:19',NULL,NULL,NULL),(12,'rejob.aramaki@gmail.com','$2a$10$xojysCfqA6nt4XNHtXxXe.RQJubr2LsdeOx5qAg2ghOXK.SPEi/Nu',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-07-04 03:45:39','2015-07-04 03:45:39','127.0.0.1','127.0.0.1','2015-07-04 03:45:39','2015-07-04 03:45:39',NULL,NULL,NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members_communities`
--

DROP TABLE IF EXISTS `members_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members_communities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_communities`
--

LOCK TABLES `members_communities` WRITE;
/*!40000 ALTER TABLE `members_communities` DISABLE KEYS */;
INSERT INTO `members_communities` VALUES (1,1,1,'2015-07-03 06:42:45','2015-07-03 06:42:45'),(2,2,2,'2015-07-03 06:42:45','2015-07-03 06:42:45'),(3,3,3,'2015-07-03 06:42:45','2015-07-03 06:42:45'),(4,4,1,'2015-07-03 06:42:45','2015-07-03 06:42:45'),(5,5,2,'2015-07-03 06:42:45','2015-07-03 06:42:45'),(6,6,3,'2015-07-03 06:42:45','2015-07-03 06:42:45'),(7,7,1,'2015-07-03 06:42:45','2015-07-03 06:42:45'),(8,8,2,'2015-07-03 06:42:45','2015-07-03 06:42:45'),(9,9,3,'2015-07-03 06:42:45','2015-07-03 06:42:45'),(10,10,1,'2015-07-03 06:42:45','2015-07-03 06:42:45'),(11,1,1,'2015-07-03 06:42:46','2015-07-03 06:42:46'),(12,2,2,'2015-07-03 06:42:46','2015-07-03 06:42:46'),(13,3,3,'2015-07-03 06:42:46','2015-07-03 06:42:46'),(14,4,1,'2015-07-03 06:42:46','2015-07-03 06:42:46'),(15,5,2,'2015-07-03 06:42:46','2015-07-03 06:42:46'),(16,6,3,'2015-07-03 06:42:46','2015-07-03 06:42:46'),(17,7,1,'2015-07-03 06:42:46','2015-07-03 06:42:46'),(18,8,2,'2015-07-03 06:42:46','2015-07-03 06:42:46'),(19,9,3,'2015-07-03 06:42:46','2015-07-03 06:42:46'),(20,10,1,'2015-07-03 06:42:46','2015-07-03 06:42:46');
/*!40000 ALTER TABLE `members_communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members_departments`
--

DROP TABLE IF EXISTS `members_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members_departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_departments`
--

LOCK TABLES `members_departments` WRITE;
/*!40000 ALTER TABLE `members_departments` DISABLE KEYS */;
INSERT INTO `members_departments` VALUES (1,1,1,'2015-07-03 06:42:45','2015-07-03 06:42:45'),(2,2,2,'2015-07-03 06:42:45','2015-07-03 06:42:45'),(3,3,3,'2015-07-03 06:42:45','2015-07-03 06:42:45'),(4,4,1,'2015-07-03 06:42:46','2015-07-03 06:42:46'),(5,5,2,'2015-07-03 06:42:46','2015-07-03 06:42:46'),(6,6,3,'2015-07-03 06:42:46','2015-07-03 06:42:46'),(7,7,1,'2015-07-03 06:42:46','2015-07-03 06:42:46'),(8,8,2,'2015-07-03 06:42:46','2015-07-03 06:42:46'),(9,9,3,'2015-07-03 06:42:46','2015-07-03 06:42:46'),(10,10,1,'2015-07-03 06:42:46','2015-07-03 06:42:46');
/*!40000 ALTER TABLE `members_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150622035003'),('20150622044259'),('20150622044550'),('20150622061100'),('20150622062430'),('20150622070849'),('20150622075203'),('20150622094450'),('20150624134542'),('20150629081215'),('20150630051816'),('20150630051904');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thanks`
--

DROP TABLE IF EXISTS `thanks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thanks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_member_id` int(11) NOT NULL,
  `to_member_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thanks`
--

LOCK TABLES `thanks` WRITE;
/*!40000 ALTER TABLE `thanks` DISABLE KEYS */;
INSERT INTO `thanks` VALUES (1,1,10,'2015-07-03 06:42:43','2015-07-03 06:42:43'),(2,2,9,'2015-07-03 06:42:43','2015-07-03 06:42:43'),(3,3,8,'2015-07-03 06:42:43','2015-07-03 06:42:43'),(4,4,7,'2015-07-03 06:42:43','2015-07-03 06:42:43'),(5,5,6,'2015-07-03 06:42:43','2015-07-03 06:42:43'),(6,6,5,'2015-07-03 06:42:43','2015-07-03 06:42:43'),(7,7,4,'2015-07-03 06:42:44','2015-07-03 06:42:44'),(8,8,3,'2015-07-03 06:42:44','2015-07-03 06:42:44'),(9,9,2,'2015-07-03 06:42:44','2015-07-03 06:42:44'),(10,10,1,'2015-07-03 06:42:44','2015-07-03 06:42:44');
/*!40000 ALTER TABLE `thanks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-05 13:17:06
