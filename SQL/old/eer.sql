CREATE DATABASE  IF NOT EXISTS `sfa_database` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sfa_database`;
-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: sfa_database
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `desc` tinytext,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (10,NULL,NULL,'2016-12-26 07:36:06','2016-12-26 07:37:01',NULL);
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_auth`
--

DROP TABLE IF EXISTS `api_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_auth` (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_key` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_user_agent` tinytext,
  `auth_ip` varchar(45) DEFAULT NULL,
  `is_active` int(11) DEFAULT '1',
  `auth_model` varchar(100) NOT NULL,
  `auth_user_id` int(11) NOT NULL,
  PRIMARY KEY (`auth_id`),
  UNIQUE KEY `auth_user_id_UNIQUE` (`auth_user_id`),
  KEY `fk_api_auth_1_idx` (`auth_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_auth`
--

LOCK TABLES `api_auth` WRITE;
/*!40000 ALTER TABLE `api_auth` DISABLE KEYS */;
INSERT INTO `api_auth` VALUES (53,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6ImdERWVvQmVkbkIifQ.IpIkaSdAsuz3XULoM74mRUA0TYtQYXFF5oe5iLYSY-k','2016-12-26 07:01:28','2016-12-26 07:01:28','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'',0);
/*!40000 ALTER TABLE `api_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `ref_id` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  `location` varchar(45) DEFAULT NULL,
  `from_dt` timestamp NULL DEFAULT NULL,
  `to_dt` timestamp NULL DEFAULT NULL,
  `attent_type` varchar(45) DEFAULT NULL,
  `leave_desc` varchar(45) DEFAULT NULL,
  `leave_st` tinyint(1) DEFAULT NULL,
  `login_lat` varchar(45) DEFAULT NULL,
  `login_lon` varchar(45) DEFAULT NULL,
  `logout_lat` varchar(45) DEFAULT NULL,
  `logout_lon` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ref_id`),
  KEY `fk_attendance_1_idx` (`user_id`),
  CONSTRAINT `fk_attendance_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audits` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `auditable_id` int(10) unsigned NOT NULL,
  `auditable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `old_values` text COLLATE utf8_unicode_ci,
  `new_values` text COLLATE utf8_unicode_ci,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `event` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `audits_auditable_id_auditable_type_index` (`auditable_id`,`auditable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits`
--

LOCK TABLES `audits` WRITE;
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;
INSERT INTO `audits` VALUES ('05be5f8e-a245-41c3-8c74-4bb40dbea5ca',47,'App\\Models\\Customer','{\"id\":47,\"name\":\"1\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"country\":\"f\",\"zipcode\":\"gfg\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"pan\":\"54545\",\"tin\":\"45454\",\"type\":null,\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"district\":\"gfg\",\"uploads\":null,\"location\":\"Chennai\",\"emp_id\":1}','[]','1','http://master.dev/customer/47','127.0.0.1','2016-12-26 09:07:23','deleted'),('10a16f54-237d-499a-9bcf-e3532097bec5',46,'App\\Models\\Customer','{\"id\":46,\"name\":\"1\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"country\":\"f\",\"zipcode\":\"gfg\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"pan\":\"54545\",\"tin\":\"45454\",\"type\":null,\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"district\":\"gfg\",\"uploads\":null,\"location\":\"Chennai\",\"emp_id\":1}','[]','1','http://master.dev/customer/46','127.0.0.1','2016-12-26 09:07:21','deleted'),('2e34caba-f666-4ee5-b66e-e8f308e8c302',45,'App\\Models\\Customer','{\"id\":45,\"name\":\"1\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"country\":\"f\",\"zipcode\":\"gfg\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"pan\":\"54545\",\"tin\":\"45454\",\"type\":null,\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"district\":\"gfg\",\"uploads\":null,\"location\":\"Chennai\",\"emp_id\":1}','[]','1','http://master.dev/customer/45','127.0.0.1','2016-12-26 09:07:21','deleted'),('324206d3-9098-4e40-a578-904923e0f34f',46,'App\\Models\\Customer','[]','{\"name\":\"1\",\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"zipcode\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"country\":\"f\",\"pan\":\"54545\",\"tin\":\"45454\",\"location\":\"Chennai\",\"emp_id\":1,\"district\":\"gfg\",\"type\":null,\"id\":46}','1','http://master.dev/customer','127.0.0.1','2016-12-26 09:00:06','created'),('3360a962-9c12-4bdc-ba73-a7fa790ee120',70,'App\\Models\\EmpSchedule','[]','{\"emp\":\"1\",\"date\":\"2016-12-26\",\"add_by\":1,\"id\":70}','1','http://master.dev/task','127.0.0.1','2016-12-26 09:06:58','created'),('380c3e92-f655-4030-8d8f-305537f2d82a',10,'App\\Models\\Activity','[]','{\"name\":\"Kali Dass\",\"desc\":\"Test\",\"id\":10}','1','http://master.dev/activity','127.0.0.1','2016-12-26 07:36:06','created'),('38c6b408-6ca2-4501-a728-cce0c2a3ef33',71,'App\\Models\\EmpSchedule','{\"id\":71,\"emp\":1,\"add_by\":1,\"date\":\"2016-12-26\"}','[]','1','http://master.dev/task/71','127.0.0.1','2016-12-26 09:07:03','deleted'),('400da4de-bfb7-421c-bb58-bb4958c6d3bd',42,'App\\Models\\Customer','{\"id\":42,\"name\":\"1\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"country\":\"f\",\"zipcode\":\"gfg\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"pan\":\"54545\",\"tin\":\"45454\",\"type\":null,\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"district\":\"gfg\",\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"location\":\"Chennai\",\"emp_id\":1}','[]','1','http://master.dev/customer/42','127.0.0.1','2016-12-26 09:07:19','deleted'),('4102cdae-d3af-455c-8ba8-bef03739d80a',47,'App\\Models\\Customer','[]','{\"name\":\"1\",\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"zipcode\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"country\":\"f\",\"pan\":\"54545\",\"tin\":\"45454\",\"location\":\"Chennai\",\"emp_id\":1,\"district\":\"gfg\",\"type\":null,\"id\":47}','1','http://master.dev/customer','127.0.0.1','2016-12-26 09:00:31','created'),('4213b1c9-7644-4ebe-9252-d38523323052',15,'App\\Models\\Master','[]','{\"company_name\":\"Kali Dass\",\"company_street\":\"dsds\",\"company_city\":\"dsd\",\"company_state\":\"dsds\",\"company_zipcode\":\"`dsf\",\"company_url\":\"http:\\/\\/www.google.com\",\"company_phone\":\"9524609638\",\"company_desc\":\"fdfdfdf\",\"company_country\":\"fdsf\",\"company_pwd\":\"eyJpdiI6ImZ4OHQyZ2pJXC9IeG9xYWJTN1FtQ1lRPT0iLCJ2YWx1ZSI6InVUc1JDWlpBTEJ1bnl2Q2RlUEN6TWptRWFNdGtreWNTSmRYTVd1VTdCck1UUXNIMTJqUjdQejFHeXVXWE9SbnBIWTBpbkN6YWJDSmR3dFNCcDdVMFwvRzNrTk9MWlhCMEROblUzbkVOZEhBMD0iLCJtYWMiOiJkZWRmODNiOTZmZmU0MmE4OWJmYzhkODc0Yjc0NDExNDdhZDdmZWI4NjRiNmJmZGNiMTIyZTY5NmM3NmYwNzZlIn0=\",\"company_email\":\"kalidafdfdfss@gmail.com\",\"company_id\":15}','1','http://master.dev/company','127.0.0.1','2016-12-26 08:55:52','created'),('49f6c87c-f1a1-4bcf-bffa-c801fd2522a7',16,'App\\Models\\Master','[]','{\"company_name\":\"Kali Dass\",\"company_street\":\"gat\",\"company_city\":\"chen\",\"company_state\":\"tamil nadu\",\"company_zipcode\":\"600041\",\"company_url\":\"http:\\/\\/google.com\",\"company_phone\":\"9524609638\",\"company_desc\":\"test\",\"company_country\":\"india\",\"company_pwd\":\"eyJpdiI6InJNRTNkZ1BBMWxxWGd5U2lESGFtdGc9PSIsInZhbHVlIjoieXNIajR3VjRMZ0l5R0cxVWJpdjdFN1FvQjBjcTMzaERHYWtkOE9NZERtZk9Jdk4zV1ZHUkFrM3NHOExCSjY1Y2RuS0hZNU8wcExKNXFXRllOUXR1MjI4UGVmU2RTcHhkM25cL0Z5OCtvVnlvPSIsIm1hYyI6ImIxZTM3MDVjZDE4YjExMDc4NTgzMGZmM2RjMWY0OTkxNWYxZDRiYjdkMmZkN2UxOTc5ZTUwNDk2OTE0ODZlNjkifQ==\",\"company_email\":\"kalidafdfdsdsddfss@gmail.com\",\"company_id\":16}','1','http://master.dev/company','127.0.0.1','2016-12-26 09:03:30','created'),('50685c21-ad08-4300-a363-658e4383b395',48,'App\\Models\\Customer','{\"id\":48,\"name\":\"kalidass\",\"address\":\"djsdj\",\"city\":\"dsdj\",\"state\":\"dsjdj\",\"country\":\"djsjs\",\"zipcode\":\"dsjdjs\",\"contact_person\":\"dshgdj\",\"contact_no\":\"+19524609638\",\"pan\":\"djsfdj\",\"tin\":\"djsdj\",\"type\":null,\"email\":\"kalidass@gmail.com\",\"desc\":\"djsdj\",\"loc_lat\":\"16.426328078619054\",\"loc_lng\":\"-5.22222499999998\",\"district\":\"djshdj\",\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"location\":\"jsdj\",\"emp_id\":1}','[]','1','http://master.dev/customer/48','127.0.0.1','2016-12-26 09:09:06','deleted'),('6836b038-e1c2-45b8-b96e-6f304c1264fb',43,'App\\Models\\Customer','[]','{\"name\":\"1\",\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"zipcode\":\"gfg\",\"loc_lat\":20.303417518489,\"loc_lng\":79.8046855,\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"country\":\"f\",\"pan\":\"54545\",\"tin\":\"45454\",\"location\":\"Chennai\",\"emp_id\":1,\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\",\"district\":\"gfg\",\"type\":null,\"id\":43}','1','http://master.dev/customer','127.0.0.1','2016-12-26 08:58:31','created'),('76cc1382-fc16-4053-88cb-a55dede63cbb',42,'App\\Models\\Customer','{\"loc_lat\":\"14.26438308756265\",\"loc_lng\":\"-3.164064499999995\",\"uploads\":null}','{\"loc_lat\":20.303417518489,\"loc_lng\":79.8046855,\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','1','http://master.dev/customer/42','127.0.0.1','2016-12-26 08:58:11','updated'),('78e3d38a-0b46-423b-a1ae-aa77a558359d',10,'App\\Models\\Activity','{\"name\":\"Kali Dass\",\"desc\":\"Test\"}','{\"name\":null,\"desc\":null}','1','http://master.dev/activity/10','127.0.0.1','2016-12-26 07:37:02','updated'),('7ded5619-2367-489e-ab8c-f367a1c3e6bd',43,'App\\Models\\Customer','{\"id\":43,\"name\":\"1\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"country\":\"f\",\"zipcode\":\"gfg\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"pan\":\"54545\",\"tin\":\"45454\",\"type\":null,\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"district\":\"gfg\",\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\",\"location\":\"Chennai\",\"emp_id\":1}','[]','1','http://master.dev/customer/43','127.0.0.1','2016-12-26 09:07:19','deleted'),('84368de1-7e4f-49e6-b85c-c468bb0bcf05',42,'App\\Models\\Customer','{\"loc_lat\":null,\"loc_lng\":null}','{\"loc_lat\":14.264383087563,\"loc_lng\":-3.1640645}','1','http://master.dev/customer/42','127.0.0.1','2016-12-26 08:57:56','updated'),('a73e603d-50f6-4570-9ca9-852ca3eebc3f',44,'App\\Models\\Customer','[]','{\"name\":\"1\",\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"zipcode\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"country\":\"f\",\"pan\":\"54545\",\"tin\":\"45454\",\"location\":\"Chennai\",\"emp_id\":1,\"district\":\"gfg\",\"type\":null,\"id\":44}','1','http://master.dev/customer','127.0.0.1','2016-12-26 08:59:24','created'),('b2631336-b84c-492a-b2de-6dfeee830a77',49,'App\\Models\\Customer','{\"uploads\":null}','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','1','http://master.dev/customer/49','127.0.0.1','2016-12-26 09:14:17','updated'),('b7ac853d-0c48-46d9-b88c-b6037122d05a',44,'App\\Models\\Customer','{\"id\":44,\"name\":\"1\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"country\":\"f\",\"zipcode\":\"gfg\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"pan\":\"54545\",\"tin\":\"45454\",\"type\":null,\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"district\":\"gfg\",\"uploads\":null,\"location\":\"Chennai\",\"emp_id\":1}','[]','1','http://master.dev/customer/44','127.0.0.1','2016-12-26 09:07:20','deleted'),('c1620b3c-ef9b-4e50-8fb0-b21289c8a61f',45,'App\\Models\\Customer','[]','{\"name\":\"1\",\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"zipcode\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"country\":\"f\",\"pan\":\"54545\",\"tin\":\"45454\",\"location\":\"Chennai\",\"emp_id\":1,\"district\":\"gfg\",\"type\":null,\"id\":45}','1','http://master.dev/customer','127.0.0.1','2016-12-26 08:59:51','created'),('c3634f7f-e1f6-432e-93c9-7dadbf47d351',49,'App\\Models\\Customer','[]','{\"name\":\"kalidass\",\"email\":\"kalidass@gmail.com\",\"desc\":\"djsdj\",\"address\":\"djsdj\",\"city\":\"dsdj\",\"state\":\"dsjdj\",\"zipcode\":\"dsjdjs\",\"loc_lat\":\"16.426328078619054\",\"loc_lng\":\"-5.22222499999998\",\"contact_person\":\"dshgdj\",\"contact_no\":\"+19524609638\",\"country\":\"djsjs\",\"pan\":\"djsfdj\",\"tin\":\"djsdj\",\"location\":\"jsdj\",\"emp_id\":1,\"district\":\"djshdj\",\"type\":null,\"id\":49}','1','http://master.dev/customer','127.0.0.1','2016-12-26 09:09:28','created'),('ca68cd77-7364-4b4f-9d16-8dfd395cbf74',48,'App\\Models\\Customer','[]','{\"name\":\"kalidass\",\"email\":\"kalidass@gmail.com\",\"desc\":\"djsdj\",\"address\":\"djsdj\",\"city\":\"dsdj\",\"state\":\"dsjdj\",\"zipcode\":\"dsjdjs\",\"loc_lat\":16.426328078619,\"loc_lng\":-5.222225,\"contact_person\":\"dshgdj\",\"contact_no\":\"+19524609638\",\"country\":\"djsjs\",\"pan\":\"djsfdj\",\"tin\":\"djsdj\",\"location\":\"jsdj\",\"emp_id\":\"1\",\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"district\":\"djshdj\",\"type\":null,\"id\":48}','1','http://master.dev/customer','127.0.0.1','2016-12-26 09:07:58','created'),('d7214300-30e5-416f-aba2-298708e50457',42,'App\\Models\\Customer','[]','{\"name\":\"1\",\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"zipcode\":\"gfg\",\"loc_lat\":null,\"loc_lng\":null,\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"country\":\"f\",\"pan\":\"54545\",\"tin\":\"45454\",\"location\":\"Chennai\",\"emp_id\":1,\"district\":\"gfg\",\"type\":null,\"id\":42}','1','http://master.dev/customer','127.0.0.1','2016-12-26 08:51:01','created'),('d93d21fb-0846-4bb8-ab3b-d942a40c5fb8',41,'App\\Models\\Customer','{\"id\":41,\"name\":\"1\",\"address\":\"1\",\"city\":\"1\",\"state\":\"1\",\"country\":null,\"zipcode\":null,\"contact_person\":null,\"contact_no\":null,\"pan\":null,\"tin\":null,\"type\":null,\"email\":null,\"desc\":null,\"loc_lat\":null,\"loc_lng\":null,\"district\":null,\"uploads\":null,\"location\":null,\"emp_id\":1}','[]','1','http://master.dev/customer/41','127.0.0.1','2016-12-26 08:51:10','deleted'),('daf31345-63af-41a1-86ce-7d85d9794788',70,'App\\Models\\EmpSchedule','{\"id\":70,\"emp\":1,\"add_by\":1,\"date\":\"2016-12-26\"}','[]','1','http://master.dev/task/70','127.0.0.1','2016-12-26 09:07:02','deleted'),('eb3bcf71-5b0f-42e9-8579-3ca59f0d09d5',71,'App\\Models\\EmpSchedule','[]','{\"emp\":\"1\",\"date\":\"2016-12-26\",\"add_by\":1,\"id\":71}','1','http://master.dev/task','127.0.0.1','2016-12-26 09:07:00','created'),('f7450b73-a9b0-4540-a8da-4f0683474c1f',15,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6ImZ4OHQyZ2pJXC9IeG9xYWJTN1FtQ1lRPT0iLCJ2YWx1ZSI6InVUc1JDWlpBTEJ1bnl2Q2RlUEN6TWptRWFNdGtreWNTSmRYTVd1VTdCck1UUXNIMTJqUjdQejFHeXVXWE9SbnBIWTBpbkN6YWJDSmR3dFNCcDdVMFwvRzNrTk9MWlhCMEROblUzbkVOZEhBMD0iLCJtYWMiOiJkZWRmODNiOTZmZmU0MmE4OWJmYzhkODc0Yjc0NDExNDdhZDdmZWI4NjRiNmJmZGNiMTIyZTY5NmM3NmYwNzZlIn0=\"}','{\"company_pwd\":\"eyJpdiI6InFFSktVMytMZmwzZXZ4bEsxNytmb1E9PSIsInZhbHVlIjoiNkRYeHlkajJvWkU5VDhmS1kzY2tZV3pXemRcL3VjcVBXbk9MTG53RnNqOTlqbUo3RGtpZXNIRlFtUUJnKzFMY1BwTW5RWkZDVEh1Wnhrc1Rwc3BHd1c4cmk1SEJMZ3p5dFVSSnd4QmhBK3M0PSIsIm1hYyI6ImZmOWU4MmE1OTEyOThmNTljZDBjM2FjMzJkODM3YjliZDU3NDQ2ZTViZDkxMWUwNDRkOWIwNjk5ZTliNDBhOGQifQ==\"}','1','http://master.dev/company/15','127.0.0.1','2016-12-26 09:03:42','updated');
/*!40000 ALTER TABLE `audits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_info`
--

DROP TABLE IF EXISTS `cases_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_info` (
  `case_id` int(11) NOT NULL,
  `open_dt` timestamp NULL DEFAULT NULL,
  `close_dt` timestamp NULL DEFAULT NULL,
  `cus_id` int(11) NOT NULL,
  `batch_details` tinytext,
  `pro_id` text,
  `types` varchar(45) DEFAULT NULL,
  `invoice_ref` varchar(45) DEFAULT NULL,
  `invoice_date` varchar(45) DEFAULT NULL,
  `prob_quantiy` varchar(45) DEFAULT NULL,
  `site_info` varchar(45) DEFAULT NULL,
  `del_from` varchar(45) DEFAULT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `files` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `taken_by` int(11) NOT NULL,
  `status` varchar(45) DEFAULT '0',
  PRIMARY KEY (`case_id`),
  KEY `fk_cases_1_idx` (`cus_id`),
  KEY `fk_cases_info_1_idx` (`taken_by`),
  CONSTRAINT `fk_cases_1` FOREIGN KEY (`cus_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cases_info_1` FOREIGN KEY (`taken_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_info`
--

LOCK TABLES `cases_info` WRITE;
/*!40000 ALTER TABLE `cases_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_db_info`
--

DROP TABLE IF EXISTS `company_db_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_db_info` (
  `company_id` int(11) DEFAULT NULL,
  `sub_domain_url` varchar(45) DEFAULT NULL,
  `sub_db_host` varchar(45) DEFAULT NULL,
  `sub_db_port` varchar(45) DEFAULT NULL,
  `sub_db_user` varchar(45) DEFAULT NULL,
  `sub_db_name` varchar(45) DEFAULT NULL,
  `sub_db_pwd` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_id_UNIQUE` (`company_id`),
  KEY `master_db_link_idx` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_db_info`
--

LOCK TABLES `company_db_info` WRITE;
/*!40000 ALTER TABLE `company_db_info` DISABLE KEYS */;
INSERT INTO `company_db_info` VALUES (15,'api.master.dev','localhost','3000','root','w2s','root','0000-00-00 00:00:00',NULL,NULL,1),(16,'auth.master.dev','localhost','300','root',NULL,NULL,NULL,NULL,NULL,5);
/*!40000 ALTER TABLE `company_db_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competitor`
--

DROP TABLE IF EXISTS `competitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` tinytext,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `loc_lat` varchar(45) DEFAULT NULL,
  `loc_lng` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitor`
--

LOCK TABLES `competitor` WRITE;
/*!40000 ALTER TABLE `competitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `competitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_statistics`
--

DROP TABLE IF EXISTS `customer_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `month` int(2) DEFAULT NULL,
  `credit_limit` varchar(45) DEFAULT NULL,
  `credit_terms` varchar(45) DEFAULT NULL,
  `outstandings` varchar(45) DEFAULT NULL,
  `last_visited` timestamp NULL DEFAULT NULL,
  `over_due` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_statistics_1_idx` (`cust_id`),
  CONSTRAINT `fk_customer_statistics_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_statistics`
--

LOCK TABLES `customer_statistics` WRITE;
/*!40000 ALTER TABLE `customer_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) DEFAULT NULL,
  `contact_person` varchar(45) DEFAULT NULL,
  `contact_no` varchar(45) DEFAULT NULL,
  `pan` varchar(45) DEFAULT NULL,
  `tin` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `desc` tinytext,
  `loc_lat` varchar(45) DEFAULT NULL,
  `loc_lng` varchar(45) DEFAULT NULL,
  `district` varchar(45) DEFAULT NULL,
  `uploads` text,
  `location` varchar(45) DEFAULT NULL,
  `emp_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customers_1_idx` (`emp_id`),
  CONSTRAINT `fk_customers_1` FOREIGN KEY (`emp_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (41,'1','1','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-12-26 08:51:10','2016-12-26 08:51:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(42,'1','dsfd','fdg','gfgf','f','gfg','Dass Kali','+19524609638','54545','45454',NULL,'2016-12-26 08:51:01','2016-12-26 09:07:19','2016-12-26 09:07:19','dass.kali14@gmail.com','gfg','20.3034175184893','79.8046855','gfg','[\"uploads\\/3dcbe4762c03437a29feaefb2467014a.jpeg\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]','Chennai',1),(43,'1','dsfd','fdg','gfgf','f','gfg','Dass Kali','+19524609638','54545','45454',NULL,'2016-12-26 08:58:31','2016-12-26 09:07:19','2016-12-26 09:07:19','dass.kali14@gmail.com','gfg','20.3034175184893','79.8046855','gfg','[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/746c2e995f4397713ab140586924430d.png\"]','Chennai',1),(44,'1','dsfd','fdg','gfgf','f','gfg','Dass Kali','+19524609638','54545','45454',NULL,'2016-12-26 08:59:24','2016-12-26 09:07:20','2016-12-26 09:07:20','dass.kali14@gmail.com','gfg','20.3034175184893','79.8046855','gfg',NULL,'Chennai',1),(45,'1','dsfd','fdg','gfgf','f','gfg','Dass Kali','+19524609638','54545','45454',NULL,'2016-12-26 08:59:50','2016-12-26 09:07:21','2016-12-26 09:07:21','dass.kali14@gmail.com','gfg','20.3034175184893','79.8046855','gfg',NULL,'Chennai',1),(46,'1','dsfd','fdg','gfgf','f','gfg','Dass Kali','+19524609638','54545','45454',NULL,'2016-12-26 09:00:06','2016-12-26 09:07:21','2016-12-26 09:07:21','dass.kali14@gmail.com','gfg','20.3034175184893','79.8046855','gfg',NULL,'Chennai',1),(47,'1','dsfd','fdg','gfgf','f','gfg','Dass Kali','+19524609638','54545','45454',NULL,'2016-12-26 09:00:31','2016-12-26 09:07:23','2016-12-26 09:07:23','dass.kali14@gmail.com','gfg','20.3034175184893','79.8046855','gfg',NULL,'Chennai',1),(48,'kalidass','djsdj','dsdj','dsjdj','djsjs','dsjdjs','dshgdj','+19524609638','djsfdj','djsdj',NULL,'2016-12-26 09:07:58','2016-12-26 09:09:06','2016-12-26 09:09:06','kalidass@gmail.com','djsdj','16.426328078619054','-5.22222499999998','djshdj','[\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]','jsdj',1),(49,'kalidass','djsdj','dsdj','dsjdj','djsjs','dsjdjs','dshgdj','+19524609638','djsfdj','djsdj',NULL,'2016-12-26 09:09:28','2016-12-26 09:14:17',NULL,'kalidass@gmail.com','djsdj','16.426328078619054','-5.22222499999998','djshdj','[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/746c2e995f4397713ab140586924430d.png\"]','jsdj',1);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_cust_schedule`
--

DROP TABLE IF EXISTS `emp_cust_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_cust_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `notes` varchar(45) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `emp_cust_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_emp_cust_schedule_1_idx` (`cust_id`),
  KEY `fk_emp_cust_schedule_2_idx` (`emp_id`),
  KEY `fk_emp_cust_schedule_3_idx` (`emp_cust_id`),
  CONSTRAINT `fk_emp_cust_schedule_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_emp_cust_schedule_2` FOREIGN KEY (`emp_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_emp_cust_schedule_3` FOREIGN KEY (`emp_cust_id`) REFERENCES `emp_schedule` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_cust_schedule`
--

LOCK TABLES `emp_cust_schedule` WRITE;
/*!40000 ALTER TABLE `emp_cust_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp_cust_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_schedule`
--

DROP TABLE IF EXISTS `emp_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `add_by` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_emp_schedule_1_idx` (`emp`),
  KEY `fk_emp_schedule_2_idx` (`add_by`),
  CONSTRAINT `fk_emp_schedule_2` FOREIGN KEY (`add_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_emp_schedule_1` FOREIGN KEY (`emp`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_schedule`
--

LOCK TABLES `emp_schedule` WRITE;
/*!40000 ALTER TABLE `emp_schedule` DISABLE KEYS */;
INSERT INTO `emp_schedule` VALUES (70,1,'2016-12-26 09:06:58','2016-12-26 09:07:02','2016-12-26 09:07:02',1,'2016-12-26'),(71,1,'2016-12-26 09:07:00','2016-12-26 09:07:03','2016-12-26 09:07:03',1,'2016-12-26');
/*!40000 ALTER TABLE `emp_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market`
--

DROP TABLE IF EXISTS `market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comp_id` int(11) DEFAULT NULL,
  `comp_activity_id` int(11) DEFAULT NULL,
  `comp_remark` text,
  `market_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_market_1_idx` (`market_id`),
  KEY `fk_market_2_idx` (`comp_id`),
  KEY `fk_market_3_idx` (`comp_activity_id`),
  CONSTRAINT `fk_market_1` FOREIGN KEY (`market_id`) REFERENCES `market_intelligence` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_market_2` FOREIGN KEY (`comp_id`) REFERENCES `competitor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_market_3` FOREIGN KEY (`comp_activity_id`) REFERENCES `activities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market`
--

LOCK TABLES `market` WRITE;
/*!40000 ALTER TABLE `market` DISABLE KEYS */;
/*!40000 ALTER TABLE `market` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_intelligence`
--

DROP TABLE IF EXISTS `market_intelligence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_intelligence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upload` text,
  `desc` tinytext,
  `location` varchar(120) DEFAULT NULL,
  `loc_lat` varchar(45) DEFAULT NULL,
  `loc_lng` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `taken_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_market_intelligence_1_idx` (`taken_by`),
  CONSTRAINT `fk_market_intelligence_1` FOREIGN KEY (`taken_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_intelligence`
--

LOCK TABLES `market_intelligence` WRITE;
/*!40000 ALTER TABLE `market_intelligence` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_intelligence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master`
--

DROP TABLE IF EXISTS `master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master` (
  `company_name` varchar(45) NOT NULL,
  `company_street` varchar(45) DEFAULT NULL,
  `company_city` varchar(45) DEFAULT NULL,
  `company_state` varchar(45) DEFAULT NULL,
  `company_zipcode` varchar(45) DEFAULT NULL,
  `company_url` varchar(45) DEFAULT NULL,
  `company_phone` varchar(45) DEFAULT NULL,
  `company_desc` text,
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_country` varchar(45) DEFAULT NULL,
  `company_pwd` text,
  `company_email` varchar(45) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `company_id_UNIQUE` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master`
--

LOCK TABLES `master` WRITE;
/*!40000 ALTER TABLE `master` DISABLE KEYS */;
INSERT INTO `master` VALUES ('Kali Dass','dsds','dsd','dsds','`dsf','http://www.google.com','9524609638','fdfdfdf',15,'2016-12-26 08:55:52','2016-12-26 09:03:42','fdsf','eyJpdiI6InFFSktVMytMZmwzZXZ4bEsxNytmb1E9PSIsInZhbHVlIjoiNkRYeHlkajJvWkU5VDhmS1kzY2tZV3pXemRcL3VjcVBXbk9MTG53RnNqOTlqbUo3RGtpZXNIRlFtUUJnKzFMY1BwTW5RWkZDVEh1Wnhrc1Rwc3BHd1c4cmk1SEJMZ3p5dFVSSnd4QmhBK3M0PSIsIm1hYyI6ImZmOWU4MmE1OTEyOThmNTljZDBjM2FjMzJkODM3YjliZDU3NDQ2ZTViZDkxMWUwNDRkOWIwNjk5ZTliNDBhOGQifQ==','kalidafdfdfss@gmail.com',NULL),('Kali Dass','gat','chen','tamil nadu','600041','http://google.com','9524609638','test',16,'2016-12-26 09:03:30','2016-12-26 09:03:30','india','eyJpdiI6InJNRTNkZ1BBMWxxWGd5U2lESGFtdGc9PSIsInZhbHVlIjoieXNIajR3VjRMZ0l5R0cxVWJpdjdFN1FvQjBjcTMzaERHYWtkOE9NZERtZk9Jdk4zV1ZHUkFrM3NHOExCSjY1Y2RuS0hZNU8wcExKNXFXRllOUXR1MjI4UGVmU2RTcHhkM25cL0Z5OCtvVnlvPSIsIm1hYyI6ImIxZTM3MDVjZDE4YjExMDc4NTgzMGZmM2RjMWY0OTkxNWYxZDRiYjdkMmZkN2UxOTc5ZTUwNDk2OTE0ODZlNjkifQ==','kalidafdfdsdsddfss@gmail.com',NULL);
/*!40000 ALTER TABLE `master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_project_opp`
--

DROP TABLE IF EXISTS `new_project_opp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_project_opp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `loc_lat` varchar(45) DEFAULT NULL,
  `loc_lng` varchar(45) DEFAULT NULL,
  `site_name` varchar(45) DEFAULT NULL,
  `prospect_id` int(11) NOT NULL,
  `contact_name` varchar(45) DEFAULT NULL,
  `contact_no` varchar(45) DEFAULT NULL,
  `contact_email` varchar(45) DEFAULT NULL,
  `product_req` tinytext,
  `exp_date` timestamp NULL DEFAULT NULL,
  `price_exp` varchar(45) DEFAULT NULL,
  `cement_used` varchar(45) DEFAULT NULL,
  `quantity_req` varchar(45) DEFAULT NULL,
  `uploads` tinytext,
  `taken_by` int(11) DEFAULT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  `deleted_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lead_id_UNIQUE` (`lead_id`),
  KEY `fk_new_project_opp_1_idx` (`taken_by`),
  KEY `fk_new_project_opp_2_idx` (`prospect_id`),
  CONSTRAINT `fk_new_project_opp_1` FOREIGN KEY (`taken_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_new_project_opp_2` FOREIGN KEY (`prospect_id`) REFERENCES `prospect_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_project_opp`
--

LOCK TABLES `new_project_opp` WRITE;
/*!40000 ALTER TABLE `new_project_opp` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_project_opp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_bookings`
--

DROP TABLE IF EXISTS `order_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_bookings` (
  `order_booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) DEFAULT NULL,
  `product_info` text,
  `quote_ref` varchar(45) DEFAULT NULL,
  `po_num` varchar(45) DEFAULT NULL,
  `po_date` timestamp NULL DEFAULT NULL,
  `ship_to` tinytext,
  `bil_to` tinytext,
  `remarks` tinytext,
  `files_info` text,
  `emp_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  PRIMARY KEY (`order_booking_id`),
  KEY `fk_order_bookings_1_idx` (`cust_id`),
  KEY `fk_order_bookings_2_idx` (`emp_id`),
  CONSTRAINT `fk_order_bookings_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_bookings_2` FOREIGN KEY (`emp_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_bookings`
--

LOCK TABLES `order_bookings` WRITE;
/*!40000 ALTER TABLE `order_bookings` DISABLE KEYS */;
INSERT INTO `order_bookings` VALUES (1,41,'1','1',NULL,'0000-00-00 00:00:00','1','1','1','[\\\"uploads/d6c594a8ab2957722421c517ae5304ba.png\\\", \\\"uploads/d6c594a8ab2957722421c517ae5304ba.png\\\"]',1,'0000-00-00');
/*!40000 ALTER TABLE `order_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_orders`
--

DROP TABLE IF EXISTS `product_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `pro_quantity` varchar(45) DEFAULT NULL,
  `pro_req_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_orders_1_idx` (`order_id`),
  KEY `fk_product_orders_2_idx` (`product_id`),
  CONSTRAINT `fk_product_orders_1` FOREIGN KEY (`order_id`) REFERENCES `order_bookings` (`order_booking_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_orders_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_orders`
--

LOCK TABLES `product_orders` WRITE;
/*!40000 ALTER TABLE `product_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `photos` tinytext,
  `doc_info` tinytext,
  `category` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `fk_products_idx` (`category`),
  CONSTRAINT `fk_products_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_types`
--

DROP TABLE IF EXISTS `prospect_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_types`
--

LOCK TABLES `prospect_types` WRITE;
/*!40000 ALTER TABLE `prospect_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_admin`
--

DROP TABLE IF EXISTS `super_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `super_admin` (
  `id` int(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `pwd` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_admin`
--

LOCK TABLES `super_admin` WRITE;
/*!40000 ALTER TABLE `super_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `user_pwd` text,
  `phone` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `activated_on` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `phone_imei` varchar(45) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  CONSTRAINT `fk_user_1` FOREIGN KEY (`user_id`) REFERENCES `user_roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'kali','dass','eyJpdiI6IkRCSEkrd0NzT3Z0NHErMVo5YzZpRmc9PSIsInZhbHVlIjoibWplb09Uak44bHZZWUVoOGJzdVwvMUE9PSIsIm1hYyI6ImI5YmJlZDEwNGMxNDgxYmM2M2EyNmMwY2VmNTE3N2QwZGE2MDBiNTMxYTk0YWFmZmFhMGVkMDQ4MzVjNzQ4Y2IifQ==','dass',NULL,NULL,NULL,NULL,NULL,NULL,'kalidass@gmail.com',1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'user','Sales Person',NULL,NULL,NULL),(2,'manager','Sales Manager',NULL,NULL,NULL),(3,'admin','Office Back end Admin',NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_report`
--

DROP TABLE IF EXISTS `visit_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `remarks` text,
  `cust_id` int(11) DEFAULT NULL,
  `met_with` varchar(45) DEFAULT NULL,
  `issue_discussed` text,
  `issues` text,
  `uploads` tinytext,
  `loc_lat` varchar(45) DEFAULT NULL,
  `loc_lng` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_approved` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `fk_visit_report_1_idx` (`cust_id`),
  CONSTRAINT `fk_visit_report_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_report`
--

LOCK TABLES `visit_report` WRITE;
/*!40000 ALTER TABLE `visit_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_report` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-26 21:34:43
