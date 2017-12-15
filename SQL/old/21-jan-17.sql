-- MySQL dump 10.16  Distrib 10.1.20-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: 127.0.0.1
-- ------------------------------------------------------
-- Server version	10.1.20-MariaDB-1~trusty

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
  `name` varchar(45) NOT NULL,
  `desc` tinytext,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (11,'dfd','fdf','2017-01-20 07:57:20','2017-01-20 07:57:20',NULL);
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
  `auth_user_agent` tinytext NOT NULL,
  `auth_ip` varchar(45) NOT NULL,
  `is_active` int(11) DEFAULT '1',
  `auth_model` varchar(100) NOT NULL,
  `auth_user_id` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`auth_id`),
  KEY `fk_api_auth_1_idx` (`auth_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_auth`
--

LOCK TABLES `api_auth` WRITE;
/*!40000 ALTER TABLE `api_auth` DISABLE KEYS */;
INSERT INTO `api_auth` VALUES (128,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6ImdERWVvQmVkbkIiLCJpc3MiOiJhcGkubWFzdGVyLmRldiIsInR5cGUiOiJhcGkubWFzdGVyLmRldiJ9.vpj7Va3oslq52TFHXm173hF_7kDqOFb53UrAqKcslhs','2017-01-02 02:02:51','2017-01-02 02:02:51','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\User',1,NULL),(129,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJpc3MiOiJtYXN0ZXIuZGV2IiwidHlwZSI6Im1hc3Rlci5kZXYifQ.DAWRM4dCZJLj8QdZD9MTwSXR8eNNKDgNMaT3C5Ja_D4','2017-01-02 02:04:05','2017-01-02 07:32:11','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\User',2,NULL),(130,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6ImdERWVvQmVkbkIiLCJpc3MiOiJtYXN0ZXIuZGV2IiwidHlwZSI6Im1hc3Rlci5kZXYifQ.IYxbNPkWnerY4mFnmkijgCO5GwuEwzm18cf125Y82GU','2017-01-02 02:40:08','2017-01-17 05:47:00','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',1,NULL),(131,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6ImdERWVvQmVkbkIiLCJpc3MiOiIxOTIuMTY4LjEuMTA0IiwidHlwZSI6IjE5Mi4xNjguMS4xMDQifQ.tzJHhE2MWKWTuGMAyyonH5t06Ow_JpW-BQd3_7uCRG4','2017-01-04 09:24:07','2017-01-04 09:24:07','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','192.168.1.104',1,'App\\Models\\User',1,NULL),(132,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkJBbGVkRW5lREciLCJpc3MiOiJtYXN0ZXIuZGV2IiwidHlwZSI6Im1hc3Rlci5kZXYifQ.Arq8T8gINrnRsAccATFoY2K44Q0hiaWESVFKvlcxRas','2017-01-09 03:56:53','2017-01-09 03:56:53','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\User',24,NULL),(133,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkJBbGVkRW5lREciLCJpc3MiOiJhcGkubWFzdGVyLmRldiIsInR5cGUiOiJhcGkubWFzdGVyLmRldiJ9.ZH8zpXe9EjEs05TC-SgitfmaD3PCte727vIrSayxmyI','2017-01-10 00:16:17','2017-01-10 00:16:17','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\User',24,NULL),(134,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkRBZGVCQkRlQm8iLCJpc3MiOiJtYXN0ZXIuZGV2IiwidHlwZSI6Im1hc3Rlci5kZXYifQ.tmn_yWHLTnDHNFuN_pWqF4OsnKxNLOjBaCPYRzo3URE','2017-01-10 06:51:39','2017-01-19 04:15:03','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\User',25,NULL),(135,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkRBZGVCQkRlQm8iLCJpc3MiOiJ3MnMubWFzdGVyLmRldiIsInR5cGUiOiJ3MnMubWFzdGVyLmRldiJ9.NJvVV1sIm1vsDZNcr4P9G4YcLbRGGXlF7r_MAdwzn4M','2017-01-13 06:01:21','2017-01-13 06:01:21','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\User',25,NULL);
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
INSERT INTO `audits` VALUES ('02a7b5c6-5b3a-43e9-ad90-18430a9cf959',53,'App\\Models\\Customer','{\"type\":null,\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','{\"type\":\"3\",\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"No File Found\\\"]\"}','super_admin','http://master.dev/customer/53','127.0.0.1','2017-01-20 05:38:37','updated'),('04133b09-fce1-4f25-9c0d-ffa2263df1d4',1,'App\\Models\\Product','{\"photos\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\"]\"}','{\"photos\":\"[]\"}','super_admin','http://master.dev/product/1','127.0.0.1','2017-01-20 04:23:31','updated'),('04ae0c17-fc15-45d2-a7ad-2b73c7e132ff',1,'App\\Models\\Product','{\"photos\":\"[]\",\"doc_info\":\"[\\\"uploads\\\\\\/a4d45b69f5473648bfd7d2f134662e52.xlsx\\\",\\\"uploads\\\\\\/a4d45b69f5473648bfd7d2f134662e52.xlsx\\\"]\"}','{\"photos\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"doc_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','super_admin','http://master.dev/product/1','127.0.0.1','2017-01-20 04:23:50','updated'),('059e1c68-de58-43fb-aec4-a445bb29a6e5',4,'App\\Models\\Product','[]','{\"name\":\"kalidasss\",\"price\":\"545\",\"unit\":\"545ffgfg\",\"quantity\":\"434\",\"desc\":\"4343\",\"photos\":\"[]\",\"doc_info\":\"[]\",\"category\":\"9\",\"product_id\":4}','super_admin','http://master.dev/product','127.0.0.1','2017-01-20 04:57:53','created'),('071fdf5c-79b4-4aab-8c53-607a21c03d84',5,'App\\Models\\Product','[]','{\"name\":\"fdf\",\"price\":\"434\",\"unit\":\"rer\",\"quantity\":\"434\",\"desc\":\"434434\",\"photos\":\"[]\",\"doc_info\":\"[]\",\"category\":\"9\",\"product_id\":5}','super_admin','http://master.dev/product','127.0.0.1','2017-01-20 04:58:23','created'),('07e95c09-b88d-4a45-b7ed-cbc89709ee53',3,'App\\Models\\VisitReport','[]','{\"remarks\":\"dsdsd\",\"cust_id\":\"53\",\"met_with\":\"dsd\",\"issue_discussed\":\"dsd\",\"issues\":\"dsds\",\"uploads\":\"[\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\",\"loc_lat\":53.120405283106564,\"loc_lng\":-1.7578125,\"report_id\":3}','super_admin','http://master.dev/visit','127.0.0.1','2017-01-20 08:33:47','created'),('0d610433-4383-4325-b43f-f68166f036fb',5,'App\\Models\\Category','{\"id\":5,\"name\":\"fdf\",\"desc\":\"fdf\"}','[]','super_admin','http://master.dev/category/5','127.0.0.1','2017-01-20 02:22:00','deleted'),('1585eaf9-209c-41f4-8e59-8fe274e31e8e',24,'App\\Models\\Master','[]','{\"company_name\":\"ff\",\"company_street\":\"fdhfk\",\"company_city\":\"dfjshfj\",\"company_state\":\"djhf\",\"company_zipcode\":\"fdhf\",\"company_url\":\"http:\\/\\/dfhdf.com\",\"company_phone\":\"+919524609638\",\"company_desc\":\"djhj\",\"company_country\":\"djhf\",\"company_pwd\":\"eyJpdiI6IjJxOSt5MzZuVW1wb2JiWkxGamRcL3FBPT0iLCJ2YWx1ZSI6IkN6UlJCVU9ZRHl2MEdNSzNtUDl0OCthWGtCNXAzNGVBWU1ZVExwTDRuU3pyVkMzemF0NUlPVEV3SlAwa29xNmtCcTRLZVdSNElwT2ZDTkU0dExkUzBcLzgxZGFvNXdaZSswU1lPa05xQWJmOD0iLCJtYWMiOiJjOGFkNTUyMWEwMzM2YzM0MGFkNGMzMGUxZDIxZWNjY2I0MmU5NDU0MjAxNmJmMDVjYWRlNzRjODdmZjA5MzA4In0=\",\"company_email\":\"john@example.com\",\"company_id\":24}','super_admin','http://master.dev/company','127.0.0.1','2017-01-20 07:11:21','created'),('15cc84a5-ccfc-4fa6-bc63-582f0389b9cd',25,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6IkltT0lITVhKMjB2NlAyQmJwdVJzdEE9PSIsInZhbHVlIjoiMlNOeGJNdldsVFR2ZktFOUFiekk2czZTWnhZb3lQTk9tRTNSemV3TGRLSjZYUXUrMXg5cFc1amtrbE1XWnMzZ05EWTd3YnZxTmVscXV2dVwvOUJGYno5Nm5OTzBBNUFyY0VISjNOVTRTUnVvPSIsIm1hYyI6IjkxZDYyOTMzZTg3NzZiOGUyZjE5ZDRkNGQxMmY3YjJkMDY3ZDNkMTgxMDAzNjM0YzcwMzI4ZTlhMDliN2M2MmQifQ==\"}','{\"company_pwd\":\"eyJpdiI6IlFINTBReVJteHh0QXVBREJ2TzAzdnc9PSIsInZhbHVlIjoiYVVtM2JVS2tDQ3ZpSDdhK0x2TVpcL3FQZEVmQjJTQW8yR2YrWUJIelwvaXlWSlBiVWVrWVlcL2J1UDJJdzZWRTA2b1lhaUtzb2xlekdxMDVXNXhvS3FibTZDQmdTTUVxTzhiUUVyTHZQWEoyZGc9IiwibWFjIjoiMjI0ZTMwZjFiMDMxMDY4YzNlNjk2MWRiMDNkMjVkOTczYjBiMGM1ODI4Nzg3OTI2OGVjZGM3ZmI5OTI0Njg0YSJ9\"}','super_admin','http://master.dev/company/25','127.0.0.1','2017-01-21 00:45:37','updated'),('19e0f667-7dd9-4d88-8173-c012a91a49bc',4,'App\\Models\\Competitor','{\"uploads\":\"null\"}','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",null]\"}','super_admin','http://master.dev/competitor/4','127.0.0.1','2017-01-20 07:17:25','updated'),('1a245b99-82e7-46d3-ac7a-45f3079ea0b6',4,'App\\Models\\Competitor','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/1c6cae8ed4f793fa029554ee088dbc08.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','super_admin','http://master.dev/competitor/4','127.0.0.1','2017-01-20 07:18:53','updated'),('29d82fba-1588-45ac-8544-bbbf0b6b01dd',1,'App\\Models\\Product','{\"price\":10,\"unit\":\"515\"}','{\"price\":10.49,\"unit\":4343.656}','super_admin','http://master.dev/product/1','127.0.0.1','2017-01-20 04:52:35','updated'),('2be84eb5-da7a-40d9-8de5-b9f639dd4d7e',4,'App\\Models\\Competitor','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/1c6cae8ed4f793fa029554ee088dbc08.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','super_admin','http://master.dev/competitor/4','127.0.0.1','2017-01-20 07:19:08','updated'),('2c1b9799-5686-41c7-8f62-0db921bb876c',5,'App\\Models\\Product','{\"doc_info\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\"]\"}','{\"doc_info\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\"]\"}','super_admin','http://master.dev/product/5','127.0.0.1','2017-01-20 05:03:32','updated'),('33fd6a6a-1183-494c-8c5a-65f217f66158',4,'App\\Models\\Competitor','{\"loc_lat\":\"13.0826802\",\"loc_lng\":\"80.27071840000008\"}','{\"loc_lat\":13.065290182853248,\"loc_lng\":80.06644136142586}','super_admin','http://master.dev/competitor/4','127.0.0.1','2017-01-20 07:04:26','updated'),('35a07249-7877-4e9c-b0f5-9394d0f9293f',3,'App\\Models\\VisitReport','{\"uploads\":\"[\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\",\"user_id\":null}','{\"uploads\":\"[\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\",\"user_id\":\"29\"}','super_admin','http://master.dev/visit/3','127.0.0.1','2017-01-20 08:38:34','updated'),('372dc812-4e78-4bb6-97a0-f0dcb314d0bf',7,'App\\Models\\Competitor','[]','{\"name\":\"fdf\",\"address\":\"fdf\",\"loc_lat\":34.03939,\"loc_lng\":-118.2500114,\"remark\":\"fdfd\",\"desc\":\"fdf\",\"uploads\":\"[]\",\"id\":7}','super_admin','http://master.dev/competitor','127.0.0.1','2017-01-20 07:24:40','created'),('39e8f65b-02e5-4739-a125-069bf06d14e3',7,'App\\Models\\Category','[]','{\"name\":\"fdfd\",\"desc\":\"fdf\",\"id\":7}','super_admin','http://master.dev/category','127.0.0.1','2017-01-20 02:22:16','created'),('3bb53b6e-e0f6-473e-ad67-f1493f49e46e',25,'App\\Models\\User','{\"role_id\":2,\"user_pwd\":\"eyJpdiI6Ijc0Zk44Qm5DNFkyTkd0TGVWcTVySnc9PSIsInZhbHVlIjoieXRRdUpWOThPaU9rY0hoUWI5VWkrUT09IiwibWFjIjoiMGM5YmQ3N2EzZTA4Zjk1Mjc2ZGJkYzljNWYwMzFkNDk3NGFhM2I1YjRmN2MwMDJhZTlkY2NiMTEyNDE2ZDMwYSJ9\"}','{\"role_id\":\"3\",\"user_pwd\":\"eyJpdiI6InlGUDEzSHk2N3dXWE80Y1hiNHRXS0E9PSIsInZhbHVlIjoiN0pvNUJxUkhESXJPbkxLQUVQZm1aQT09IiwibWFjIjoiMzBkMmFmMTM2MjQxOTI0NmEyYWNkNjcxZjg5OTQ1ZjRkODYxZjY3ZTZmZjg4ZjJjY2E2MmViNjIzNzk3ZDJkZCJ9\"}','super_admin','http://master.dev/user/25','127.0.0.1','2017-01-20 08:00:38','updated'),('41f8d0e6-4b3a-4c3f-a354-dc59f51a1d48',53,'App\\Models\\Customer','{\"uploads\":\"[]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','super_admin','http://master.dev/customer/53','127.0.0.1','2017-01-20 07:43:03','updated'),('452becaa-7844-4337-8737-58af3b76d135',4,'App\\Models\\Competitor','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",null]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','super_admin','http://master.dev/competitor/4','127.0.0.1','2017-01-20 07:18:35','updated'),('47632a72-78e0-464d-9422-942a0cd96127',1,'App\\Models\\Product','{\"unit\":\"545\"}','{\"unit\":\"gfgf\"}','super_admin','http://master.dev/product/1','127.0.0.1','2017-01-20 04:55:25','updated'),('49f996f3-2bd7-4681-bafd-5a600b6d2241',1,'App\\Models\\Product','{\"photos\":\"[]\",\"doc_info\":\"[]\"}','{\"photos\":\"[\\\"uploads\\\\\\/1c6cae8ed4f793fa029554ee088dbc08.png\\\"]\",\"doc_info\":\"[\\\"uploads\\\\\\/a4d45b69f5473648bfd7d2f134662e52.xlsx\\\"]\"}','super_admin','http://master.dev/product/1','127.0.0.1','2017-01-20 03:42:22','updated'),('4a19ae2b-4a08-45d1-a104-ca3077041b66',51,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"No File Found\\\"]\"}','super_admin','http://master.dev/customer/51','127.0.0.1','2017-01-20 05:26:52','updated'),('4d8a5280-4639-4df5-ad9c-dbaccc998a4f',1,'App\\Models\\Product','{\"photos\":\"[\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\",\"doc_info\":\"[\\\"uploads\\\\\\/a4d45b69f5473648bfd7d2f134662e52.xlsx\\\"]\"}','{\"photos\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\"]\",\"doc_info\":\"[\\\"uploads\\\\\\/a4d45b69f5473648bfd7d2f134662e52.xlsx\\\",\\\"uploads\\\\\\/a4d45b69f5473648bfd7d2f134662e52.xlsx\\\"]\"}','super_admin','http://master.dev/product/1','127.0.0.1','2017-01-20 04:11:00','updated'),('4eba9ccc-1edd-4507-9e7c-0db73ee157c2',1,'App\\Models\\Product','{\"photos\":\"[\\\"uploads\\\\\\/1c6cae8ed4f793fa029554ee088dbc08.png\\\"]\"}','{\"photos\":\"[\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','super_admin','http://master.dev/product/1','127.0.0.1','2017-01-20 03:42:55','updated'),('4f88e3b2-2d82-4585-80ea-18f44775ba29',56,'App\\Models\\Customer','[]','{\"name\":\"ew\",\"email\":\"fdf@gmail.cmerer\",\"desc\":\"dsd\",\"address\":\"dsd\",\"city\":\"dd\",\"state\":\"ds\",\"zipcode\":\"ds\",\"loc_lat\":49.84519599999999,\"loc_lng\":21.81333649999999,\"contact_person\":\"dd\",\"contact_no\":\"+919524609638\",\"country\":\"dsd\",\"pan\":\"dsd\",\"tin\":\"dsd\",\"location\":\"ds\",\"emp_id\":\"30\",\"uploads\":\"[]\",\"district\":\"d\",\"type\":\"1\",\"id\":56}','super_admin','http://master.dev/customer','127.0.0.1','2017-01-20 06:04:37','created'),('591f28ec-84d4-403d-88e3-3e8d90c4e1e9',8,'App\\Models\\Competitor','[]','{\"name\":\"dsd\",\"address\":\"dsd\",\"loc_lat\":40.9808295,\"loc_lng\":-111.88638889999999,\"remark\":\"dsd\",\"desc\":\"dsd\",\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"id\":8}','super_admin','http://master.dev/competitor','127.0.0.1','2017-01-20 07:25:42','created'),('594893da-b34e-4f79-a304-4d3741bb7269',3,'App\\Models\\VisitReport','{\"date\":\"2017-01-02\"}','{\"date\":\"2016-12-29\"}','super_admin','http://master.dev/visit/3','127.0.0.1','2017-01-20 08:50:42','updated'),('5b4b7a54-696a-44ee-b3bb-1424f9f5e764',3,'App\\Models\\VisitReport','{\"uploads\":\"[\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','super_admin','http://master.dev/visit/3','127.0.0.1','2017-01-20 08:37:01','updated'),('5bc3e55a-644f-4879-8b7b-fee8889e3afe',3,'App\\Models\\VisitReport','{\"date\":null}','{\"date\":\"2017-01-02\"}','super_admin','http://master.dev/visit/3','127.0.0.1','2017-01-20 08:49:40','updated'),('5d10b799-9f3d-4192-ba88-7e392dae8290',1,'App\\Models\\Product','{\"photos\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"doc_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','{\"photos\":\"[]\",\"doc_info\":\"[]\"}','super_admin','http://master.dev/product/1','127.0.0.1','2017-01-20 04:55:35','updated'),('5d3bceea-b40e-4b08-8c0d-4ab633b185fb',4,'App\\Models\\Competitor','[]','{\"name\":\"Kalidass\",\"address\":\"chennai,india\",\"loc_lat\":13.0826802,\"loc_lng\":80.27071840000008,\"remark\":\"how\",\"desc\":\"thanks\",\"id\":4}','super_admin','http://master.dev/competitor','127.0.0.1','2017-01-20 06:12:12','created'),('5eca1747-5970-42e2-9b8e-07328b9f4423',8,'App\\Models\\Category','{\"id\":8,\"name\":\"fdgfg\",\"desc\":\"gf\"}','[]','super_admin','http://master.dev/category/8','127.0.0.1','2017-01-20 02:27:57','deleted'),('5efd41a8-e657-4b9c-b375-425854947614',28,'App\\Models\\User','{\"user_pwd\":\"eyJpdiI6IlhPSDJoWUtCb2NPUlJpSmFLZnRLZmc9PSIsInZhbHVlIjoiZ0IrSkpQZ2pueDhnbjI0RnVcL3h2MWc9PSIsIm1hYyI6IjM3OTNkMDdhMGIzYWM2NzQ3NTRiZDhiZjE1M2RkZjA2MTYwZmNkOTA5ZjQ4YzhiYmI2NWM1OGRiZTYzNTU1MTYifQ==\"}','{\"user_pwd\":\"eyJpdiI6ImZXZFhHZnpTYzdnUk9zdzJ1TCtxaWc9PSIsInZhbHVlIjoiOXJMdHU5Q3BQSjQzOEpGdXRBREcrUT09IiwibWFjIjoiOGZlMWZhYTZkYzMyY2U2NmVjYTUxZDgwOWRjMjMzMzhjYzk2MzUxYmEyZmE1YmFjNzgwYTMwNmM5M2EyMGE5MCJ9\"}','super_admin','http://master.dev/user/28','127.0.0.1','2017-01-21 00:20:57','updated'),('5f2b1361-6d77-4b06-9069-ab0645a4e7f2',6,'App\\Models\\Competitor','{\"id\":6,\"name\":\"df\",\"desc\":\"fdf\",\"remark\":\"df\",\"address\":\"fdf\",\"loc_lat\":\"29.721792\",\"loc_lng\":\"-95.3458546\",\"uploads\":\"[]\"}','[]','super_admin','http://master.dev/competitor/6','127.0.0.1','2017-01-20 07:35:54','deleted'),('5ff1b603-0644-4a03-ae0d-e99517d24c91',5,'App\\Models\\Product','{\"photos\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\"}','{\"photos\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\"}','super_admin','http://master.dev/product/5','127.0.0.1','2017-01-20 05:03:23','updated'),('6193f526-a2c5-477f-9507-4b2dc006e6e9',4,'App\\Models\\Competitor','{\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','super_admin','http://master.dev/competitor/4','127.0.0.1','2017-01-20 07:20:13','updated'),('69bd965a-aac1-4dc5-8824-80bec0ecd0a7',1,'App\\Models\\Product','{\"unit\":501}','{\"unit\":515}','super_admin','http://master.dev/product/1','127.0.0.1','2017-01-20 04:48:23','updated'),('6be13f55-070d-4600-abf5-d12f93443084',8,'App\\Models\\Category','[]','{\"name\":\"fdgfg\",\"desc\":\"gf\",\"id\":8}','super_admin','http://master.dev/category','127.0.0.1','2017-01-20 02:27:55','created'),('722a130c-445a-4d71-8d89-8b75d3c06ff5',56,'App\\Models\\Customer','{\"type\":\"1\"}','{\"type\":\"2\"}','super_admin','http://master.dev/customer/56','127.0.0.1','2017-01-20 09:45:01','updated'),('72834d54-7ec6-49d2-ae51-d27598a85860',25,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6IlFINTBReVJteHh0QXVBREJ2TzAzdnc9PSIsInZhbHVlIjoiYVVtM2JVS2tDQ3ZpSDdhK0x2TVpcL3FQZEVmQjJTQW8yR2YrWUJIelwvaXlWSlBiVWVrWVlcL2J1UDJJdzZWRTA2b1lhaUtzb2xlekdxMDVXNXhvS3FibTZDQmdTTUVxTzhiUUVyTHZQWEoyZGc9IiwibWFjIjoiMjI0ZTMwZjFiMDMxMDY4YzNlNjk2MWRiMDNkMjVkOTczYjBiMGM1ODI4Nzg3OTI2OGVjZGM3ZmI5OTI0Njg0YSJ9\"}','{\"company_pwd\":\"eyJpdiI6ImhGSFQyQXpobk5kRlAxbUg0Z29YdWc9PSIsInZhbHVlIjoiQks3aXNIY0dmRzJ6a1FLaXp6d2hOYzMyeXdSYjRSRkppR2xmODRlUXFkNWRlT1wvOWZ0VU5XTlcrZ0tTVk54MFVwWEVidjZId0YySU9ZMVwvK01QdzhXTGJ3Nlc2TlhZY1dncldzNWJ2K2R2dz0iLCJtYWMiOiI1ODNjM2E0MTBlN2IxOGZkNzkwZGZiMmQwM2E1ZmU2MGExNWUxNGQ5OGY4NTRjMWQyNmUzYzczYWEwOTM5MmY2In0=\"}','super_admin','http://master.dev/company/25','127.0.0.1','2017-01-21 00:49:10','updated'),('7588e85c-8395-4639-8c22-5910e82a7733',4,'App\\Models\\Competitor','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','super_admin','http://master.dev/competitor/4','127.0.0.1','2017-01-20 07:18:41','updated'),('785bbe20-6d9a-45e6-9aa3-8302235fedd3',25,'App\\Models\\User','{\"user_pwd\":\"eyJpdiI6InlGUDEzSHk2N3dXWE80Y1hiNHRXS0E9PSIsInZhbHVlIjoiN0pvNUJxUkhESXJPbkxLQUVQZm1aQT09IiwibWFjIjoiMzBkMmFmMTM2MjQxOTI0NmEyYWNkNjcxZjg5OTQ1ZjRkODYxZjY3ZTZmZjg4ZjJjY2E2MmViNjIzNzk3ZDJkZCJ9\"}','{\"user_pwd\":\"eyJpdiI6InFKam5EdTBnK05MTDgySTZ5ciswSlE9PSIsInZhbHVlIjoiVGR4UUgwZyt6UkpUUitMUXFJeVNBZz09IiwibWFjIjoiNDQwNGZjM2I4MWYyYTcwNDk3ZGRiY2M3NTRmMGEwMzVkMDM0ODJlOGE3YzZiMzFhOWFlZTM4NmQxMGE4ZjlmNiJ9\"}','super_admin','http://master.dev/user/25','127.0.0.1','2017-01-20 08:30:48','updated'),('7a729b16-b486-4108-88e9-b0b424c0fb7c',1,'App\\Models\\Product','{\"price\":10.49,\"unit\":\"4343.656\",\"quantity\":32}','{\"price\":\"10.4943434\",\"unit\":545,\"quantity\":\"3243.434\"}','super_admin','http://master.dev/product/1','127.0.0.1','2017-01-20 04:54:54','updated'),('7e7698a7-9028-431f-87cd-40ebd1d1cdb9',7,'App\\Models\\Category','{\"id\":7,\"name\":\"fdfd\",\"desc\":\"fdf\"}','[]','super_admin','http://master.dev/category/7','127.0.0.1','2017-01-20 02:22:19','deleted'),('82889870-554c-4e2d-95dc-d345d103add7',17,'App\\Models\\ProspectType','[]','{\"name\":\"fdf\",\"desc\":\"fdf\",\"id\":17}','super_admin','http://master.dev/prospect','127.0.0.1','2017-01-20 02:23:03','created'),('8d8b87d9-03cb-4f61-8491-594039f0445a',53,'App\\Models\\Customer','{\"uploads\":\"[\\\"No File Found\\\"]\"}','{\"uploads\":\"[]\"}','super_admin','http://master.dev/customer/53','127.0.0.1','2017-01-20 05:45:02','updated'),('97a5b2db-b253-4407-bbf9-6c864d4c1f62',3,'App\\Models\\VisitReport','{\"uploads\":\"[\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','super_admin','http://master.dev/visit/3','127.0.0.1','2017-01-20 08:54:15','updated'),('9e459247-1410-4d13-8b8b-8fe466a6166f',53,'App\\Models\\Customer','{\"uploads\":\"[]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','super_admin','http://master.dev/customer/53','127.0.0.1','2017-01-20 05:27:36','updated'),('a77a9938-c51d-4372-86ea-6af858f8dbef',1,'App\\Models\\Product','{\"category\":3}','{\"category\":\"9\"}','super_admin','http://master.dev/product/1','127.0.0.1','2017-01-20 03:37:28','updated'),('aa1f5f30-f142-4a7a-88de-4dbab68c51e1',2,'App\\Models\\Product','[]','{\"name\":\"tes\",\"price\":1000,\"unit\":1000,\"quantity\":101,\"desc\":\"thanks\",\"photos\":\"[]\",\"doc_info\":\"[]\",\"category\":\"9\",\"product_id\":2}','super_admin','http://master.dev/product','127.0.0.1','2017-01-20 04:27:12','created'),('aa5e984d-a1c2-47f5-a45e-cc7b761f6ea5',5,'App\\Models\\Competitor','{\"id\":5,\"name\":\"dsd\",\"desc\":\"fdf\",\"remark\":\"f\",\"address\":\"ds\",\"loc_lat\":\"42.5480632\",\"loc_lng\":\"-71.27821929999999\",\"uploads\":\"[]\"}','[]','super_admin','http://master.dev/competitor/5','127.0.0.1','2017-01-20 07:35:56','deleted'),('ae589f8b-25a4-4f1c-8e49-a9fa28b71d17',8,'App\\Models\\Competitor','{\"id\":8,\"name\":\"dsd\",\"desc\":\"dsd\",\"remark\":\"dsd\",\"address\":\"dsd\",\"loc_lat\":\"40.9808295\",\"loc_lng\":\"-111.88638889999999\",\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','[]','super_admin','http://master.dev/competitor/8','127.0.0.1','2017-01-20 07:35:58','deleted'),('b2bc170e-5f65-4f80-b13e-3f974200e151',3,'App\\Models\\Product','[]','{\"name\":\"tes\",\"price\":1000,\"unit\":1000,\"quantity\":101,\"desc\":\"thanks\",\"photos\":\"[]\",\"doc_info\":\"[]\",\"category\":\"9\",\"product_id\":3}','super_admin','http://master.dev/product','127.0.0.1','2017-01-20 04:27:22','created'),('b3395cf6-2963-40fc-89da-e55d08c3250f',1,'App\\Models\\Product','{\"unit\":500}','{\"unit\":500.65767}','super_admin','http://master.dev/product/1','127.0.0.1','2017-01-20 04:48:05','updated'),('b4a9b6b6-0f21-4774-ac4c-a40c3257c2c3',9,'App\\Models\\Competitor','{\"id\":9,\"name\":\"kaidass\",\"desc\":\"dskjdk\",\"remark\":\"dsdskd\",\"address\":\"dksjdk\",\"loc_lat\":\"47.6034418\",\"loc_lng\":\"-122.33391010000003\",\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','[]','super_admin','http://master.dev/competitor/9','127.0.0.1','2017-01-20 07:57:06','deleted'),('b4cb1fc6-f31c-421e-be18-bd2e6a6466c9',25,'App\\Models\\Master','[]','{\"company_name\":\"Master\",\"company_street\":\"fdjhf\",\"company_city\":\"fjhdfj\",\"company_state\":\"djsfj\",\"company_zipcode\":\"fdj\",\"company_url\":\"http:\\/\\/thanks.com\",\"company_phone\":\"+919524609638\",\"company_desc\":\"fjhfjd\",\"company_country\":\"fjhdj\",\"company_pwd\":\"eyJpdiI6IkltT0lITVhKMjB2NlAyQmJwdVJzdEE9PSIsInZhbHVlIjoiMlNOeGJNdldsVFR2ZktFOUFiekk2czZTWnhZb3lQTk9tRTNSemV3TGRLSjZYUXUrMXg5cFc1amtrbE1XWnMzZ05EWTd3YnZxTmVscXV2dVwvOUJGYno5Nm5OTzBBNUFyY0VISjNOVTRTUnVvPSIsIm1hYyI6IjkxZDYyOTMzZTg3NzZiOGUyZjE5ZDRkNGQxMmY3YjJkMDY3ZDNkMTgxMDAzNjM0YzcwMzI4ZTlhMDliN2M2MmQifQ==\",\"company_email\":\"dass.k@gmail.com\",\"company_id\":25}','super_admin','http://master.dev/company','127.0.0.1','2017-01-20 07:35:14','created'),('be6e7878-7f82-4798-82e0-da87a3720ebb',4,'App\\Models\\Competitor','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','{\"uploads\":\"[]\"}','super_admin','http://master.dev/competitor/4','127.0.0.1','2017-01-20 07:26:03','updated'),('bf1acbd5-eab2-4991-95b4-b20f231d8f27',9,'App\\Models\\Competitor','[]','{\"name\":\"kaidass\",\"address\":\"dksjdk\",\"loc_lat\":47.6034418,\"loc_lng\":-122.33391010000003,\"remark\":\"dsdskd\",\"desc\":\"dskjdk\",\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"id\":9}','super_admin','http://master.dev/competitor','127.0.0.1','2017-01-20 07:39:05','created'),('c01d8a17-1d8b-4c26-a704-a8ef76d638c3',6,'App\\Models\\Category','[]','{\"name\":\"fdf\",\"desc\":\"fdfd\",\"id\":6}','super_admin','http://master.dev/category','127.0.0.1','2017-01-20 02:21:57','created'),('c03cdd3a-d02f-472b-b13e-7df6a8624221',3,'App\\Models\\VisitReport','{\"date\":\"2016-12-29\"}','{\"date\":\"2016-12-27\"}','super_admin','http://master.dev/visit/3','127.0.0.1','2017-01-20 08:52:17','updated'),('c1c5966a-1940-4834-ad95-c37b91de4783',9,'App\\Models\\Category','[]','{\"name\":\"Category 1\",\"desc\":\"Test\",\"id\":9}','super_admin','http://master.dev/category','127.0.0.1','2017-01-20 03:06:00','created'),('c3945c69-5763-480f-8180-0974e743ac60',6,'App\\Models\\Category','{\"id\":6,\"name\":\"fdffdf\",\"desc\":\"fdfd\"}','[]','super_admin','http://master.dev/category/6','127.0.0.1','2017-01-20 02:24:40','deleted'),('c3a6c196-6482-42e5-96b6-77d6a0569dfc',4,'App\\Models\\Competitor','{\"uploads\":\"[]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/1c6cae8ed4f793fa029554ee088dbc08.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','super_admin','http://master.dev/competitor/4','127.0.0.1','2017-01-20 07:38:37','updated'),('cb9362c4-c2a7-4773-a3cf-59fcef30cb70',25,'App\\Models\\User','{\"user_pwd\":\"eyJpdiI6IjR4Y0RoMFhDNzd0eENrNFc2ek9mUlE9PSIsInZhbHVlIjoiSHk5SUpYZ2tEa3dNNUtrUzBPcWxwQT09IiwibWFjIjoiZWM0OWQwOWY1N2JjOWFmNDliZGM0ZDJhNTZjYTI2YzE2YTQxM2VlMDk3YzM3NmIzNmRjMGQ1MTgxMjUxMWMzYSJ9\",\"is_active\":1}','{\"user_pwd\":\"eyJpdiI6Ik9mWjhxNTFCVStTS2VSK1g1WlBGY1E9PSIsInZhbHVlIjoiYlgwb1FqK3pmbEZnK0ppcEY5SVJZUT09IiwibWFjIjoiOGMzMzUyNmQ0NzIyYTRmMDZiMTdlYWY0YTI4NTljNWU5NjQ0NDhlNGIxZjg3Yzg0NjM2MWI0MDIzNTMzZTVjZiJ9\",\"is_active\":\"0\"}','super_admin','http://master.dev/user/25','127.0.0.1','2017-01-20 02:24:55','updated'),('ce9c7929-a9d9-4b8e-8e94-e88888d701a8',25,'App\\Models\\User','{\"role_id\":1,\"user_pwd\":\"eyJpdiI6Ik9mWjhxNTFCVStTS2VSK1g1WlBGY1E9PSIsInZhbHVlIjoiYlgwb1FqK3pmbEZnK0ppcEY5SVJZUT09IiwibWFjIjoiOGMzMzUyNmQ0NzIyYTRmMDZiMTdlYWY0YTI4NTljNWU5NjQ0NDhlNGIxZjg3Yzg0NjM2MWI0MDIzNTMzZTVjZiJ9\",\"is_active\":0}','{\"role_id\":\"2\",\"user_pwd\":\"eyJpdiI6Ijc0Zk44Qm5DNFkyTkd0TGVWcTVySnc9PSIsInZhbHVlIjoieXRRdUpWOThPaU9rY0hoUWI5VWkrUT09IiwibWFjIjoiMGM5YmQ3N2EzZTA4Zjk1Mjc2ZGJkYzljNWYwMzFkNDk3NGFhM2I1YjRmN2MwMDJhZTlkY2NiMTEyNDE2ZDMwYSJ9\",\"is_active\":\"1\"}','super_admin','http://master.dev/user/25','127.0.0.1','2017-01-20 07:59:53','updated'),('d12d92b3-c5af-42b4-b0cc-a8332f6863b1',2,'App\\Models\\Product','{\"photos\":\"[]\",\"doc_info\":\"[]\"}','{\"photos\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\",\"doc_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','super_admin','http://master.dev/product/2','127.0.0.1','2017-01-20 04:58:37','updated'),('d2d083f2-50bb-4e06-bcc1-de721b9eeccf',25,'App\\Models\\User','{\"user_pwd\":\"eyJpdiI6InFKam5EdTBnK05MTDgySTZ5ciswSlE9PSIsInZhbHVlIjoiVGR4UUgwZyt6UkpUUitMUXFJeVNBZz09IiwibWFjIjoiNDQwNGZjM2I4MWYyYTcwNDk3ZGRiY2M3NTRmMGEwMzVkMDM0ODJlOGE3YzZiMzFhOWFlZTM4NmQxMGE4ZjlmNiJ9\",\"profile_image\":\"[\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','{\"user_pwd\":\"eyJpdiI6IkNtM3ZQSElWYUpraWlrMzhNRjJRVFE9PSIsInZhbHVlIjoiRWNpek9lM3NvUGRwWitmRUc2NlJmQT09IiwibWFjIjoiNzE1ODY3MWM5YTI2ODA5M2JjYzQyMWYyN2EzNzZiYzRjNzI0NTIyOTAwZWIxZmE4MzNmNzc4NTlhZmRhOGM1NCJ9\",\"profile_image\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','super_admin','http://master.dev/user/25','127.0.0.1','2017-01-20 08:31:15','updated'),('d93de458-4654-4e18-9744-e52ab33b683c',6,'App\\Models\\Competitor','[]','{\"name\":\"df\",\"address\":\"fdf\",\"loc_lat\":29.721792,\"loc_lng\":-95.3458546,\"remark\":\"df\",\"desc\":\"fdf\",\"uploads\":\"[]\",\"id\":6}','super_admin','http://master.dev/competitor','127.0.0.1','2017-01-20 07:24:12','created'),('da71dd7a-2c67-40fd-8f32-ddb4447b6c4d',1,'App\\Models\\Product','{\"doc_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','{\"doc_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','super_admin','http://master.dev/product/1','127.0.0.1','2017-01-20 04:26:13','updated'),('db603893-926b-440b-8456-1bc6e0d81770',11,'App\\Models\\Activity','[]','{\"name\":\"dfd\",\"desc\":\"fdf\",\"id\":11}','super_admin','http://master.dev/activity','127.0.0.1','2017-01-20 07:57:20','created'),('dce1b5d3-4d5f-475c-a080-aef0ad6d733d',7,'App\\Models\\Competitor','{\"id\":7,\"name\":\"fdf\",\"desc\":\"fdf\",\"remark\":\"fdfd\",\"address\":\"fdf\",\"loc_lat\":\"34.03939\",\"loc_lng\":\"-118.2500114\",\"uploads\":\"[]\"}','[]','super_admin','http://master.dev/competitor/7','127.0.0.1','2017-01-20 07:36:18','deleted'),('deb56ab3-4aa6-4038-bbcf-bb34a69b95a8',5,'App\\Models\\Competitor','[]','{\"name\":\"dsd\",\"address\":\"ds\",\"loc_lat\":42.5480632,\"loc_lng\":-71.27821929999999,\"remark\":\"f\",\"desc\":\"fdf\",\"uploads\":\"[]\",\"id\":5}','super_admin','http://master.dev/competitor','127.0.0.1','2017-01-20 07:20:26','created'),('e0342a5d-4c6b-402e-acca-3f13439f5c8c',53,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"No File Found\\\"]\"}','{\"uploads\":\"[\\\"No File Found\\\"]\"}','super_admin','http://master.dev/customer/53','127.0.0.1','2017-01-20 05:42:42','updated'),('e3f248ef-db81-4ad4-9ae5-131ae6cf1ef0',4,'App\\Models\\Competitor','{\"uploads\":null}','{\"uploads\":\"null\"}','super_admin','http://master.dev/competitor/4','127.0.0.1','2017-01-20 06:59:28','updated'),('eb0eab80-31e3-4d62-a807-d69118c6b790',5,'App\\Models\\Product','{\"photos\":\"[]\",\"doc_info\":\"[]\"}','{\"photos\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\",\"doc_info\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\"]\"}','super_admin','http://master.dev/product/5','127.0.0.1','2017-01-20 05:02:38','updated'),('ed4e296a-eb6f-4fbf-8edc-ef15e45e66dd',6,'App\\Models\\Category','{\"name\":\"fdf\"}','{\"name\":\"fdffdf\"}','super_admin','http://master.dev/category/6','127.0.0.1','2017-01-20 02:22:03','updated'),('efd7295c-0932-419c-8cad-ad43759a0a23',3,'App\\Models\\VisitReport','{\"loc_lat\":\"53.120405283106564\",\"loc_lng\":\"-1.7578125\"}','{\"loc_lat\":53.132611427668344,\"loc_lng\":-1.7494010925292969}','super_admin','http://master.dev/visit/3','127.0.0.1','2017-01-20 09:05:40','updated'),('f3b65049-df9b-45d6-91a3-ec34fafff342',57,'App\\Models\\Customer','[]','{\"name\":\"ds\",\"email\":\"djsfj@fdfhdj.com\",\"desc\":\"dkd\",\"address\":\"dskj\",\"city\":\"skjdk\",\"state\":\"dskdj\",\"zipcode\":\"dskdjk\",\"loc_lat\":0,\"loc_lng\":0,\"contact_person\":\"ksjfk\",\"contact_no\":\"+919542111111\",\"country\":\"dskdj\",\"pan\":\"dskjfk\",\"tin\":\"skfj\",\"location\":\"skcjk\",\"emp_id\":\"28\",\"uploads\":\"[\\\"uploads\\\\\\/a4d45b69f5473648bfd7d2f134662e52.xlsx\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"district\":\"dskdjk\",\"type\":\"1\",\"id\":57}','super_admin','http://master.dev/customer','127.0.0.1','2017-01-20 07:43:42','created');
/*!40000 ALTER TABLE `audits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_clients`
--

DROP TABLE IF EXISTS `auth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_clients` (
  `client_id` int(11) NOT NULL,
  `client_x_data` text,
  `auth_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  KEY `fk_auth_clients_1_idx` (`auth_id`),
  CONSTRAINT `fk_auth_clients_1` FOREIGN KEY (`auth_id`) REFERENCES `api_auth` (`auth_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_clients`
--

LOCK TABLES `auth_clients` WRITE;
/*!40000 ALTER TABLE `auth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_clients` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'fdf','gfg','2016-12-28 01:04:04','2016-12-28 01:04:07','2016-12-28 06:34:07'),(2,'kalitrfgfgghhh','dkfkfhk','2017-01-02 04:40:01','2017-01-04 10:42:42','2017-01-04 16:12:42'),(3,'kalitrfgfgghhh','dkfkfhk','2017-01-04 10:42:40','2017-01-20 02:17:23','2017-01-20 07:47:23'),(4,'hghg','hgh','2017-01-05 09:27:17','2017-01-20 02:17:22','2017-01-20 07:47:22'),(5,'fdf','fdf','2017-01-20 02:17:32','2017-01-20 02:22:00','2017-01-20 07:52:00'),(6,'fdffdf','fdfd','2017-01-20 02:21:57','2017-01-20 02:24:40','2017-01-20 07:54:40'),(7,'fdfd','fdf','2017-01-20 02:22:16','2017-01-20 02:22:19','2017-01-20 07:52:19'),(8,'fdgfg','gf','2017-01-20 02:27:55','2017-01-20 02:27:57','2017-01-20 07:57:57'),(9,'Category 1','Test','2017-01-20 03:06:00','2017-01-20 03:06:00',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_db_info`
--

LOCK TABLES `company_db_info` WRITE;
/*!40000 ALTER TABLE `company_db_info` DISABLE KEYS */;
INSERT INTO `company_db_info` VALUES (25,'master.dev','localhost','3306','root','sfa_database','eyJpdiI6InljVUpGU2xSeE80YStwNWZpQzhMVXc9PSIsInZhbHVlIjoid0hcL3NnSmxSWVZZQnhiQ2hJRmhsakE9PSIsIm1hYyI6ImFkZDY1YzFjOWFiYzkyNTMzMTBkNTA4ZGZkYzM0NzI3ZGYxY2QyOWRkYWJiYzAyNzk1MzBhZDg3MGZkOTQ2OGQifQ==','0000-00-00 00:00:00',NULL,NULL,1);
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
  `name` varchar(500) NOT NULL,
  `desc` text,
  `remark` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` tinytext,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `loc_lat` varchar(45) DEFAULT NULL,
  `loc_lng` varchar(45) DEFAULT NULL,
  `uploads` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitor`
--

LOCK TABLES `competitor` WRITE;
/*!40000 ALTER TABLE `competitor` DISABLE KEYS */;
INSERT INTO `competitor` VALUES (4,'Kalidass','thanks','how','2017-01-20 06:12:12','2017-01-20 07:38:37','chennai,india',NULL,'13.065290182853248','80.06644136142586','[\"uploads\\/3dcbe4762c03437a29feaefb2467014a.jpeg\",\"uploads\\/1c6cae8ed4f793fa029554ee088dbc08.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (41,'1','1','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-12-26 08:51:10','2016-12-26 08:51:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(43,'1','dsfd','fdg','gfgf','f','gfg','Dass Kali','+19524609638','54545','45454',NULL,'2016-12-26 08:58:31','2016-12-26 09:07:19','2016-12-26 09:07:19','dass.kali14@gmail.com','gfg','20.3034175184893','79.8046855','gfg','[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/746c2e995f4397713ab140586924430d.png\"]','Chennai',1),(44,'1','dsfd','fdg','gfgf','f','gfg','Dass Kali','+19524609638','54545','45454',NULL,'2016-12-26 08:59:24','2016-12-26 09:07:20','2016-12-26 09:07:20','dass.kali14@gmail.com','gfg','20.3034175184893','79.8046855','gfg',NULL,'Chennai',1),(45,'1','dsfd','fdg','gfgf','f','gfg','Dass Kali','+19524609638','54545','45454',NULL,'2016-12-26 08:59:50','2016-12-26 09:07:21','2016-12-26 09:07:21','dass.kali14@gmail.com','gfg','20.3034175184893','79.8046855','gfg',NULL,'Chennai',1),(46,'1','dsfd','fdg','gfgf','f','gfg','Dass Kali','+19524609638','54545','45454',NULL,'2016-12-26 09:00:06','2016-12-26 09:07:21','2016-12-26 09:07:21','dass.kali14@gmail.com','gfg','20.3034175184893','79.8046855','gfg',NULL,'Chennai',1),(47,'1','dsfd','fdg','gfgf','f','gfg','Dass Kali','+19524609638','54545','45454',NULL,'2016-12-26 09:00:31','2016-12-26 09:07:23','2016-12-26 09:07:23','dass.kali14@gmail.com','gfg','20.3034175184893','79.8046855','gfg',NULL,'Chennai',1),(48,'kalidass','djsdj','dsdj','dsjdj','djsjs','dsjdjs','dshgdj','+19524609638','djsfdj','djsdj',NULL,'2016-12-26 09:07:58','2016-12-26 09:09:06','2016-12-26 09:09:06','kalidass@gmail.com','djsdj','16.426328078619054','-5.22222499999998','djshdj','[\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]','jsdj',1),(49,'kalidassdsdgfgf','djsdjjhjhj','dsdj','dsjdj','djsjs','dsjdjs','dshgdj','+19524609638','djsfdj','djsdj',NULL,'2016-12-26 09:09:28','2017-01-09 03:59:43','2017-01-09 03:59:43','kalidass@gmail.com','djsdj','12.340796817197432','77.04340000000002','djshdj','[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\"]','jsdj',2),(50,'kalidass','dsd','dsd','dsd','dsd','ds','dsd','+919524609638','dsd','dsd',NULL,'2017-01-08 23:57:13','2017-01-09 03:59:45','2017-01-09 03:59:45','dass.kali14@gmail.com','dsd','12.126727028477408','77.46159820000008','dsd','[]','dsd',17),(51,'fdf','dd','dsd','dsdfdf','dsd','ssd','dsd','+919524609638','ds','dsd',NULL,'2017-01-09 00:22:49','2017-01-20 05:26:52',NULL,'dsd.com@g.com','dsd','13.048718814297999','80.18263829427644','dsd','[\"uploads\\/3dcbe4762c03437a29feaefb2467014a.jpeg\",\"No File Found\"]','\\jjkkkjkkjkjkjjhjhjhj',25),(52,'w2s',',',',',',','india','600041','kali','+919524609638','dsd','dsds',NULL,'2017-01-09 00:38:29','2017-01-09 03:59:41','2017-01-09 03:59:41','kalidass@way2smile.co',NULL,'11.527181624018487','78.72001950000003',',','[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/746c2e995f4397713ab140586924430d.png\"]','chennai',16),(53,'company one','fdf','sdf','fdf','fdf','600042','pratap','+12345676879','fdf','df','3','2017-01-09 06:39:06','2017-01-20 07:43:03',NULL,'mk@mkone.com','fdf','13.049465642592857','80.28141192744147','fd','[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]','south',25),(54,'fdf','fdf','fdf','fdf','fdf','fdf','','+919524609638','','',NULL,'2017-01-10 00:10:07','2017-01-12 00:57:01',NULL,'dass.kali14@gmail.com',NULL,'29.721792','-95.3458546','fdf','[]','fdf',24),(55,'kalidass','l303','4th main road','chennai,tamil nadu','india','600041','kalidass','+919524609638','43434','43434',NULL,'2017-01-17 03:45:43','2017-01-17 03:45:43',NULL,'kalidass@way2smile.com','thanks','12.9834109','80.25597360000006','thiruvanmiyur','[]','chennai',24),(56,'ew','dsd','dd','ds','dsd','ds','dd','+919524609638','dsd','dsd','2','2017-01-20 06:04:37','2017-01-20 09:45:01',NULL,'fdf@gmail.cmerer','dsd','49.84519599999999','21.81333649999999','d','[]','ds',30),(57,'ds','dskj','skjdk','dskdj','dskdj','dskdjk','ksjfk','+919542111111','dskjfk','skfj','1','2017-01-20 07:43:42','2017-01-20 07:43:42',NULL,'djsfj@fdfhdj.com','dkd','0','0','dskdjk','[\"uploads\\/a4d45b69f5473648bfd7d2f134662e52.xlsx\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]','skcjk',28);
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
  `status` varchar(45) DEFAULT 'waiting',
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_cust_schedule`
--

LOCK TABLES `emp_cust_schedule` WRITE;
/*!40000 ALTER TABLE `emp_cust_schedule` DISABLE KEYS */;
INSERT INTO `emp_cust_schedule` VALUES (25,53,'2017-01-27','waiting','0','',25,NULL,NULL,NULL,104),(26,53,'2017-01-28','waiting','0','',25,NULL,'2017-01-11 08:26:02','2017-01-11 08:26:02',104),(27,54,'2017-01-26','waiting','2','1',24,NULL,'2017-01-11 06:47:56','2017-01-11 06:47:56',105),(28,54,'2017-01-26','complete','2','1',24,NULL,'2017-01-11 07:46:30','2017-01-11 07:46:30',105),(29,53,'2017-01-26','waiting','2','1',24,NULL,NULL,NULL,105),(30,53,'2017-01-28','waiting','0','',25,NULL,'2017-01-20 02:23:20','2017-01-20 02:23:20',104),(31,53,'2017-01-28','waiting','0','',25,NULL,'2017-01-20 02:23:20','2017-01-20 02:23:20',104),(32,53,'2017-01-28','waiting','0','',25,NULL,'2017-01-20 05:45:59','2017-01-20 05:45:59',104),(33,53,'2017-01-28','waiting','0','',25,NULL,'2017-01-20 05:45:59','2017-01-20 05:45:59',104),(34,53,'2017-01-28','waiting','0','',25,NULL,'2017-01-20 05:45:59','2017-01-20 05:45:59',104),(35,53,'2017-01-28','waiting','0','',25,NULL,NULL,NULL,104);
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
  CONSTRAINT `fk_emp_schedule_1` FOREIGN KEY (`emp`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_emp_schedule_2` FOREIGN KEY (`add_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_schedule`
--

LOCK TABLES `emp_schedule` WRITE;
/*!40000 ALTER TABLE `emp_schedule` DISABLE KEYS */;
INSERT INTO `emp_schedule` VALUES (103,25,'2017-01-10 07:18:28','2017-01-10 07:23:51','2017-01-10 07:23:51',25,'2017-01-26'),(104,25,'2017-01-10 07:19:54',NULL,'2017-01-11 08:26:02',24,'2017-01-28'),(105,24,'2017-01-11 06:47:47',NULL,'2017-01-11 07:46:30',24,'2017-01-26'),(106,25,'2017-01-13 03:13:20',NULL,'2017-01-13 03:13:20',25,'2017-01-19');
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
-- Table structure for table `js_error`
--

DROP TABLE IF EXISTS `js_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `js_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `error` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `user_agent` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `js_error`
--

LOCK TABLES `js_error` WRITE;
/*!40000 ALTER TABLE `js_error` DISABLE KEYS */;
INSERT INTO `js_error` VALUES (1,'Exception: \"TypeError: Cannot read property \'user_id\' of null\"\nCaused by: undefined\nMessage: Cannot read property \'user_id\' of null\nStack Trace: TypeError: Cannot read property \'user_id\' of null\n    at http://master.dev/app/competitor/competitor.view.controller.js:69:64\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 07:50:47','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(2,'Exception: \"Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\" data-ng-animate=\"1\">\nMessage: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl\nStack Trace: Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:43:220\n    at Object.d [as get] (http://master.dev/bower_components/angular/angular.min.js:41:1)\n    at http://master.dev/bower_components/angular/angular.min.js:43:282\n    at d (http://master.dev/bower_components/angular/angular.min.js:41:1)\n    at e (http://master.dev/bower_components/angular/angular.min.js:41:242)\n    at Object.instantiate (http://master.dev/bower_components/angular/angular.min.js:42:77)\n    at http://master.dev/bower_components/angular/angular.min.js:91:109\n    at http://master.dev/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n','2017-01-20 07:57:29','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(3,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 07:57:31','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(4,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 07:57:31','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(5,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 07:57:31','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(6,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 07:57:31','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(7,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 07:57:31','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(8,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 07:57:31','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(9,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 07:57:31','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(10,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 07:57:31','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(11,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 07:57:31','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(12,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 07:57:31','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(13,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 07:57:31','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(14,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 07:57:31','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(15,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 07:57:31','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(16,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 07:57:31','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(17,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 07:57:31','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(18,'Exception: \"Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\" data-ng-animate=\"1\">\nMessage: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl\nStack Trace: Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:43:220\n    at Object.d [as get] (http://master.dev/bower_components/angular/angular.min.js:41:1)\n    at http://master.dev/bower_components/angular/angular.min.js:43:282\n    at d (http://master.dev/bower_components/angular/angular.min.js:41:1)\n    at e (http://master.dev/bower_components/angular/angular.min.js:41:242)\n    at Object.instantiate (http://master.dev/bower_components/angular/angular.min.js:42:77)\n    at http://master.dev/bower_components/angular/angular.min.js:91:109\n    at http://master.dev/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n','2017-01-20 07:57:34','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(19,'Exception: \"Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\" data-ng-animate=\"1\">\nMessage: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl\nStack Trace: Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:43:220\n    at Object.d [as get] (http://master.dev/bower_components/angular/angular.min.js:41:1)\n    at http://master.dev/bower_components/angular/angular.min.js:43:282\n    at d (http://master.dev/bower_components/angular/angular.min.js:41:1)\n    at e (http://master.dev/bower_components/angular/angular.min.js:41:242)\n    at Object.instantiate (http://master.dev/bower_components/angular/angular.min.js:42:77)\n    at http://master.dev/bower_components/angular/angular.min.js:91:109\n    at http://master.dev/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n','2017-01-20 07:58:16','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(20,'Exception: \"Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\" data-ng-animate=\"1\">\nMessage: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl\nStack Trace: Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:43:220\n    at Object.d [as get] (http://master.dev/bower_components/angular/angular.min.js:41:1)\n    at http://master.dev/bower_components/angular/angular.min.js:43:282\n    at d (http://master.dev/bower_components/angular/angular.min.js:41:1)\n    at e (http://master.dev/bower_components/angular/angular.min.js:41:242)\n    at Object.instantiate (http://master.dev/bower_components/angular/angular.min.js:42:77)\n    at http://master.dev/bower_components/angular/angular.min.js:91:109\n    at http://master.dev/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n','2017-01-20 07:58:18','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(21,'Exception: \"Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\">\nMessage: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl\nStack Trace: Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:43:220\n    at Object.d [as get] (http://master.dev/bower_components/angular/angular.min.js:41:1)\n    at http://master.dev/bower_components/angular/angular.min.js:43:282\n    at d (http://master.dev/bower_components/angular/angular.min.js:41:1)\n    at e (http://master.dev/bower_components/angular/angular.min.js:41:242)\n    at Object.instantiate (http://master.dev/bower_components/angular/angular.min.js:42:77)\n    at http://master.dev/bower_components/angular/angular.min.js:91:109\n    at http://master.dev/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n','2017-01-20 07:59:15','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(22,'Exception: \"Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\" data-ng-animate=\"1\">\nMessage: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl\nStack Trace: Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:43:220\n    at Object.d [as get] (http://master.dev/bower_components/angular/angular.min.js:41:1)\n    at http://master.dev/bower_components/angular/angular.min.js:43:282\n    at d (http://master.dev/bower_components/angular/angular.min.js:41:1)\n    at e (http://master.dev/bower_components/angular/angular.min.js:41:242)\n    at Object.instantiate (http://master.dev/bower_components/angular/angular.min.js:42:77)\n    at http://master.dev/bower_components/angular/angular.min.js:91:109\n    at http://master.dev/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n','2017-01-20 08:00:02','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(23,'Exception: \"Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\" data-ng-animate=\"1\">\nMessage: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl\nStack Trace: Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:43:220\n    at Object.d [as get] (http://master.dev/bower_components/angular/angular.min.js:41:1)\n    at http://master.dev/bower_components/angular/angular.min.js:43:282\n    at d (http://master.dev/bower_components/angular/angular.min.js:41:1)\n    at e (http://master.dev/bower_components/angular/angular.min.js:41:242)\n    at Object.instantiate (http://master.dev/bower_components/angular/angular.min.js:42:77)\n    at http://master.dev/bower_components/angular/angular.min.js:91:109\n    at http://master.dev/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n','2017-01-20 08:00:04','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(24,'Exception: \"Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\" data-ng-animate=\"1\">\nMessage: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl\nStack Trace: Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:43:220\n    at Object.d [as get] (http://master.dev/bower_components/angular/angular.min.js:41:1)\n    at http://master.dev/bower_components/angular/angular.min.js:43:282\n    at d (http://master.dev/bower_components/angular/angular.min.js:41:1)\n    at e (http://master.dev/bower_components/angular/angular.min.js:41:242)\n    at Object.instantiate (http://master.dev/bower_components/angular/angular.min.js:42:77)\n    at http://master.dev/bower_components/angular/angular.min.js:91:109\n    at http://master.dev/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n','2017-01-20 08:01:09','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(25,'Exception: \"Error: [ngRepeat:dupes] http://errors.angularjs.org/1.5.9/ngRepeat/dupes?p0=user%20in%20%20users&p1=string%3Ar&p2=r\"\nCaused by: undefined\nMessage: [ngRepeat:dupes] http://errors.angularjs.org/1.5.9/ngRepeat/dupes?p0=user%20in%20%20users&p1=string%3Ar&p2=r\nStack Trace: Error: [ngRepeat:dupes] http://errors.angularjs.org/1.5.9/ngRepeat/dupes?p0=user%20in%20%20users&p1=string%3Ar&p2=r\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:307:375\n    at http://master.dev/bower_components/angular/angular.min.js:143:77\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:131)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 08:01:10','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(26,'Exception: \"Error: [ngRepeat:dupes] http://errors.angularjs.org/1.5.9/ngRepeat/dupes?p0=user%20in%20%20users&p1=string%3Ar&p2=r\"\nCaused by: undefined\nMessage: [ngRepeat:dupes] http://errors.angularjs.org/1.5.9/ngRepeat/dupes?p0=user%20in%20%20users&p1=string%3Ar&p2=r\nStack Trace: Error: [ngRepeat:dupes] http://errors.angularjs.org/1.5.9/ngRepeat/dupes?p0=user%20in%20%20users&p1=string%3Ar&p2=r\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:307:375\n    at http://master.dev/bower_components/angular/angular.min.js:143:77\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:131)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 08:01:15','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(27,'Exception: \"Error: [ngRepeat:dupes] http://errors.angularjs.org/1.5.9/ngRepeat/dupes?p0=user%20in%20%20users&p1=string%3Ar&p2=r\"\nCaused by: undefined\nMessage: [ngRepeat:dupes] http://errors.angularjs.org/1.5.9/ngRepeat/dupes?p0=user%20in%20%20users&p1=string%3Ar&p2=r\nStack Trace: Error: [ngRepeat:dupes] http://errors.angularjs.org/1.5.9/ngRepeat/dupes?p0=user%20in%20%20users&p1=string%3Ar&p2=r\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:307:375\n    at http://master.dev/bower_components/angular/angular.min.js:143:77\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:131)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 08:01:23','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(28,'Exception: \"Error: [ngRepeat:dupes] http://errors.angularjs.org/1.5.9/ngRepeat/dupes?p0=user%20in%20%20users&p1=string%3Ar&p2=r\"\nCaused by: undefined\nMessage: [ngRepeat:dupes] http://errors.angularjs.org/1.5.9/ngRepeat/dupes?p0=user%20in%20%20users&p1=string%3Ar&p2=r\nStack Trace: Error: [ngRepeat:dupes] http://errors.angularjs.org/1.5.9/ngRepeat/dupes?p0=user%20in%20%20users&p1=string%3Ar&p2=r\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:307:375\n    at http://master.dev/bower_components/angular/angular.min.js:143:77\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:131)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 08:01:29','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(29,'Exception: \"Error: [ngRepeat:dupes] http://errors.angularjs.org/1.5.9/ngRepeat/dupes?p0=user%20in%20%20users&p1=string%3Ar&p2=r\"\nCaused by: undefined\nMessage: [ngRepeat:dupes] http://errors.angularjs.org/1.5.9/ngRepeat/dupes?p0=user%20in%20%20users&p1=string%3Ar&p2=r\nStack Trace: Error: [ngRepeat:dupes] http://errors.angularjs.org/1.5.9/ngRepeat/dupes?p0=user%20in%20%20users&p1=string%3Ar&p2=r\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:307:375\n    at http://master.dev/bower_components/angular/angular.min.js:143:77\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:131)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 08:01:29','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(30,'Exception: \"Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\" data-ng-animate=\"1\">\nMessage: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl\nStack Trace: Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=NgMapProvider%20%3C-%20NgMap%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl%20%3C-%20VisitCtrl\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:43:220\n    at Object.d [as get] (http://master.dev/bower_components/angular/angular.min.js:41:1)\n    at http://master.dev/bower_components/angular/angular.min.js:43:282\n    at d (http://master.dev/bower_components/angular/angular.min.js:41:1)\n    at e (http://master.dev/bower_components/angular/angular.min.js:41:242)\n    at Object.instantiate (http://master.dev/bower_components/angular/angular.min.js:42:77)\n    at http://master.dev/bower_components/angular/angular.min.js:91:109\n    at http://master.dev/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n','2017-01-20 08:01:48','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(31,'Exception: \"Error: [ngRepeat:dupes] http://errors.angularjs.org/1.5.9/ngRepeat/dupes?p0=user%20in%20%20users&p1=string%3Ar&p2=r\"\nCaused by: undefined\nMessage: [ngRepeat:dupes] http://errors.angularjs.org/1.5.9/ngRepeat/dupes?p0=user%20in%20%20users&p1=string%3Ar&p2=r\nStack Trace: Error: [ngRepeat:dupes] http://errors.angularjs.org/1.5.9/ngRepeat/dupes?p0=user%20in%20%20users&p1=string%3Ar&p2=r\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:307:375\n    at http://master.dev/bower_components/angular/angular.min.js:143:77\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:131)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 08:05:16','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(32,'Exception: \"TypeError: Cannot read property \'length\' of undefined\"\nCaused by: undefined\nMessage: Cannot read property \'length\' of undefined\nStack Trace: TypeError: Cannot read property \'length\' of undefined\n    at m.VisitCtrl.$scope.addNewChoice (http://master.dev/app/visit-report/visit-report.controller.js:263:45)\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:227)\n    at b (http://master.dev/bower_components/angular/angular.min.js:127:128)\n    at e (http://master.dev/bower_components/angular/angular.min.js:281:195)\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:17)\n    at HTMLButtonElement.<anonymous> (http://master.dev/bower_components/angular/angular.min.js:281:247)\n    at HTMLButtonElement.dispatch (http://master.dev/bower_components/jquery/dist/jquery.min.js:3:7537)\n    at HTMLButtonElement.r.handle (http://master.dev/bower_components/jquery/dist/jquery.min.js:3:5620)\n','2017-01-20 08:08:53','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(33,'Exception: \"TypeError: Cannot read property \'length\' of undefined\"\nCaused by: undefined\nMessage: Cannot read property \'length\' of undefined\nStack Trace: TypeError: Cannot read property \'length\' of undefined\n    at m.VisitCtrl.$scope.addNewChoice (http://master.dev/app/visit-report/visit-report.controller.js:263:45)\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:227)\n    at b (http://master.dev/bower_components/angular/angular.min.js:127:128)\n    at e (http://master.dev/bower_components/angular/angular.min.js:281:195)\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:17)\n    at HTMLButtonElement.<anonymous> (http://master.dev/bower_components/angular/angular.min.js:281:247)\n    at HTMLButtonElement.dispatch (http://master.dev/bower_components/jquery/dist/jquery.min.js:3:7537)\n    at HTMLButtonElement.r.handle (http://master.dev/bower_components/jquery/dist/jquery.min.js:3:5620)\n','2017-01-20 08:08:53','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(34,'Exception: \"TypeError: Cannot read property \'length\' of undefined\"\nCaused by: undefined\nMessage: Cannot read property \'length\' of undefined\nStack Trace: TypeError: Cannot read property \'length\' of undefined\n    at m.VisitCtrl.$scope.addNewChoice (http://master.dev/app/visit-report/visit-report.controller.js:263:45)\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:227)\n    at b (http://master.dev/bower_components/angular/angular.min.js:127:128)\n    at e (http://master.dev/bower_components/angular/angular.min.js:281:195)\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:17)\n    at HTMLButtonElement.<anonymous> (http://master.dev/bower_components/angular/angular.min.js:281:247)\n    at HTMLButtonElement.dispatch (http://master.dev/bower_components/jquery/dist/jquery.min.js:3:7537)\n    at HTMLButtonElement.r.handle (http://master.dev/bower_components/jquery/dist/jquery.min.js:3:5620)\n','2017-01-20 08:08:54','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(35,'Exception: \"TypeError: Cannot read property \'length\' of undefined\"\nCaused by: undefined\nMessage: Cannot read property \'length\' of undefined\nStack Trace: TypeError: Cannot read property \'length\' of undefined\n    at m.VisitCtrl.$scope.addNewChoice (http://master.dev/app/visit-report/visit-report.controller.js:272:45)\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:227)\n    at b (http://master.dev/bower_components/angular/angular.min.js:127:128)\n    at e (http://master.dev/bower_components/angular/angular.min.js:281:195)\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:17)\n    at HTMLButtonElement.<anonymous> (http://master.dev/bower_components/angular/angular.min.js:281:247)\n    at HTMLButtonElement.dispatch (http://master.dev/bower_components/jquery/dist/jquery.min.js:3:7537)\n    at HTMLButtonElement.r.handle (http://master.dev/bower_components/jquery/dist/jquery.min.js:3:5620)\n','2017-01-20 08:10:25','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(36,'Exception: \"TypeError: Cannot read property \'length\' of undefined\"\nCaused by: undefined\nMessage: Cannot read property \'length\' of undefined\nStack Trace: TypeError: Cannot read property \'length\' of undefined\n    at m.VisitCtrl.$scope.addNewChoice (http://master.dev/app/visit-report/visit-report.controller.js:272:45)\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:227)\n    at b (http://master.dev/bower_components/angular/angular.min.js:127:128)\n    at e (http://master.dev/bower_components/angular/angular.min.js:281:195)\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:17)\n    at HTMLButtonElement.<anonymous> (http://master.dev/bower_components/angular/angular.min.js:281:247)\n    at HTMLButtonElement.dispatch (http://master.dev/bower_components/jquery/dist/jquery.min.js:3:7537)\n    at HTMLButtonElement.r.handle (http://master.dev/bower_components/jquery/dist/jquery.min.js:3:5620)\n','2017-01-20 08:11:18','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(37,'Exception: \"TypeError: Cannot read property \'push\' of undefined\"\nCaused by: undefined\nMessage: Cannot read property \'push\' of undefined\nStack Trace: TypeError: Cannot read property \'push\' of undefined\n    at m.VisitCtrl.$scope.addNewChoice (http://master.dev/app/visit-report/visit-report.controller.js:276:29)\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:227)\n    at b (http://master.dev/bower_components/angular/angular.min.js:127:128)\n    at e (http://master.dev/bower_components/angular/angular.min.js:281:195)\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:17)\n    at HTMLButtonElement.<anonymous> (http://master.dev/bower_components/angular/angular.min.js:281:247)\n    at HTMLButtonElement.dispatch (http://master.dev/bower_components/jquery/dist/jquery.min.js:3:7537)\n    at HTMLButtonElement.r.handle (http://master.dev/bower_components/jquery/dist/jquery.min.js:3:5620)\n','2017-01-20 08:13:23','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(38,'Exception: \"Error: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\"\nCaused by: <md-option ng-repeat=\"cust in  competitor\" value=\"{{cust.id}}\" tabindex=\"0\" class=\"ng-scope\">\nMessage: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\nStack Trace: Error: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\n    at d.m.addOption (http://master.dev/bower_components/angular-material/angular-material.min.js:11:23910)\n    at d (http://master.dev/bower_components/angular-material/angular-material.min.js:11:25092)\n    at Object.r (http://master.dev/bower_components/angular-material/angular-material.min.js:11:25392)\n    at http://master.dev/bower_components/angular/angular.min.js:16:71\n    at la (http://master.dev/bower_components/angular/angular.min.js:82:90)\n    at p (http://master.dev/bower_components/angular/angular.min.js:67:274)\n    at g (http://master.dev/bower_components/angular/angular.min.js:59:252)\n    at http://master.dev/bower_components/angular/angular.min.js:58:394\n    at http://master.dev/bower_components/angular/angular.min.js:63:421\n    at d (http://master.dev/bower_components/angular/angular.min.js:60:238)\n','2017-01-20 08:22:43','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(39,'Exception: \"Error: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\"\nCaused by: <md-option ng-repeat=\"cust in  competitor\" value=\"{{cust.id}}\" tabindex=\"0\" class=\"ng-scope\">\nMessage: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\nStack Trace: Error: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\n    at d.m.addOption (http://master.dev/bower_components/angular-material/angular-material.min.js:11:23910)\n    at d (http://master.dev/bower_components/angular-material/angular-material.min.js:11:25092)\n    at Object.r (http://master.dev/bower_components/angular-material/angular-material.min.js:11:25392)\n    at http://master.dev/bower_components/angular/angular.min.js:16:71\n    at la (http://master.dev/bower_components/angular/angular.min.js:82:90)\n    at p (http://master.dev/bower_components/angular/angular.min.js:67:274)\n    at g (http://master.dev/bower_components/angular/angular.min.js:59:252)\n    at http://master.dev/bower_components/angular/angular.min.js:58:394\n    at http://master.dev/bower_components/angular/angular.min.js:63:421\n    at d (http://master.dev/bower_components/angular/angular.min.js:60:238)\n','2017-01-20 08:22:43','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(40,'Exception: \"Error: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\"\nCaused by: <md-option ng-repeat=\"cust in  competitor\" value=\"{{cust.id}}\" tabindex=\"0\" class=\"ng-scope\">\nMessage: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\nStack Trace: Error: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\n    at d.m.addOption (http://master.dev/bower_components/angular-material/angular-material.min.js:11:23910)\n    at d (http://master.dev/bower_components/angular-material/angular-material.min.js:11:25092)\n    at Object.r (http://master.dev/bower_components/angular-material/angular-material.min.js:11:25392)\n    at http://master.dev/bower_components/angular/angular.min.js:16:71\n    at la (http://master.dev/bower_components/angular/angular.min.js:82:90)\n    at p (http://master.dev/bower_components/angular/angular.min.js:67:274)\n    at g (http://master.dev/bower_components/angular/angular.min.js:59:252)\n    at http://master.dev/bower_components/angular/angular.min.js:58:394\n    at http://master.dev/bower_components/angular/angular.min.js:63:421\n    at d (http://master.dev/bower_components/angular/angular.min.js:60:238)\n','2017-01-20 08:22:43','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(41,'Exception: \"Error: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\"\nCaused by: <md-option ng-repeat=\"cust in  competitor\" value=\"{{cust.id}}\" tabindex=\"0\" class=\"ng-scope\">\nMessage: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\nStack Trace: Error: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\n    at d.m.addOption (http://master.dev/bower_components/angular-material/angular-material.min.js:11:23910)\n    at d (http://master.dev/bower_components/angular-material/angular-material.min.js:11:25092)\n    at Object.r (http://master.dev/bower_components/angular-material/angular-material.min.js:11:25392)\n    at http://master.dev/bower_components/angular/angular.min.js:16:71\n    at la (http://master.dev/bower_components/angular/angular.min.js:82:90)\n    at p (http://master.dev/bower_components/angular/angular.min.js:67:274)\n    at g (http://master.dev/bower_components/angular/angular.min.js:59:252)\n    at http://master.dev/bower_components/angular/angular.min.js:58:394\n    at http://master.dev/bower_components/angular/angular.min.js:63:421\n    at d (http://master.dev/bower_components/angular/angular.min.js:60:238)\n','2017-01-20 08:22:43','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(42,'Exception: \"Error: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\"\nCaused by: <md-option ng-repeat=\"cust in  competitor\" value=\"{{cust.id}}\" tabindex=\"0\" class=\"ng-scope\" data-ng-animate=\"1\">\nMessage: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\nStack Trace: Error: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\n    at d.m.addOption (http://master.dev/bower_components/angular-material/angular-material.min.js:11:23910)\n    at d (http://master.dev/bower_components/angular-material/angular-material.min.js:11:25092)\n    at Object.r (http://master.dev/bower_components/angular-material/angular-material.min.js:11:25392)\n    at http://master.dev/bower_components/angular/angular.min.js:16:71\n    at la (http://master.dev/bower_components/angular/angular.min.js:82:90)\n    at p (http://master.dev/bower_components/angular/angular.min.js:67:274)\n    at g (http://master.dev/bower_components/angular/angular.min.js:59:252)\n    at http://master.dev/bower_components/angular/angular.min.js:58:394\n    at http://master.dev/bower_components/angular/angular.min.js:63:421\n    at d (http://master.dev/bower_components/angular/angular.min.js:60:238)\n','2017-01-20 08:22:47','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(43,'Exception: \"Error: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\"\nCaused by: <md-option ng-repeat=\"cust in  competitor\" value=\"{{cust.id}}\" tabindex=\"0\" class=\"ng-scope\">\nMessage: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\nStack Trace: Error: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\n    at d.m.addOption (http://master.dev/bower_components/angular-material/angular-material.min.js:11:23910)\n    at d (http://master.dev/bower_components/angular-material/angular-material.min.js:11:25092)\n    at Object.r (http://master.dev/bower_components/angular-material/angular-material.min.js:11:25392)\n    at http://master.dev/bower_components/angular/angular.min.js:16:71\n    at la (http://master.dev/bower_components/angular/angular.min.js:82:90)\n    at p (http://master.dev/bower_components/angular/angular.min.js:67:274)\n    at g (http://master.dev/bower_components/angular/angular.min.js:59:252)\n    at http://master.dev/bower_components/angular/angular.min.js:58:394\n    at http://master.dev/bower_components/angular/angular.min.js:63:421\n    at d (http://master.dev/bower_components/angular/angular.min.js:60:238)\n','2017-01-20 08:22:58','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(44,'Exception: \"Error: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\"\nCaused by: <md-option ng-repeat=\"cust in  competitor\" value=\"{{cust.id}}\" tabindex=\"0\" class=\"ng-scope\">\nMessage: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\nStack Trace: Error: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\n    at d.m.addOption (http://master.dev/bower_components/angular-material/angular-material.min.js:11:23910)\n    at d (http://master.dev/bower_components/angular-material/angular-material.min.js:11:25092)\n    at Object.r (http://master.dev/bower_components/angular-material/angular-material.min.js:11:25392)\n    at http://master.dev/bower_components/angular/angular.min.js:16:71\n    at la (http://master.dev/bower_components/angular/angular.min.js:82:90)\n    at p (http://master.dev/bower_components/angular/angular.min.js:67:274)\n    at g (http://master.dev/bower_components/angular/angular.min.js:59:252)\n    at http://master.dev/bower_components/angular/angular.min.js:58:394\n    at http://master.dev/bower_components/angular/angular.min.js:63:421\n    at d (http://master.dev/bower_components/angular/angular.min.js:60:238)\n','2017-01-20 08:22:58','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(45,'Exception: \"Error: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\"\nCaused by: <md-option ng-repeat=\"cust in  competitor\" value=\"{{cust.id}}\" tabindex=\"0\" class=\"ng-scope\">\nMessage: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\nStack Trace: Error: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\n    at d.m.addOption (http://master.dev/bower_components/angular-material/angular-material.min.js:11:23910)\n    at d (http://master.dev/bower_components/angular-material/angular-material.min.js:11:25092)\n    at Object.r (http://master.dev/bower_components/angular-material/angular-material.min.js:11:25392)\n    at http://master.dev/bower_components/angular/angular.min.js:16:71\n    at la (http://master.dev/bower_components/angular/angular.min.js:82:90)\n    at p (http://master.dev/bower_components/angular/angular.min.js:67:274)\n    at g (http://master.dev/bower_components/angular/angular.min.js:59:252)\n    at http://master.dev/bower_components/angular/angular.min.js:58:394\n    at http://master.dev/bower_components/angular/angular.min.js:63:421\n    at d (http://master.dev/bower_components/angular/angular.min.js:60:238)\n','2017-01-20 08:22:58','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(46,'Exception: \"Error: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\"\nCaused by: <md-option ng-repeat=\"cust in  competitor\" value=\"{{cust.id}}\" tabindex=\"0\" class=\"ng-scope\">\nMessage: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\nStack Trace: Error: Duplicate md-option values are not allowed in a select. Duplicate value \"\" found.\n    at d.m.addOption (http://master.dev/bower_components/angular-material/angular-material.min.js:11:23910)\n    at d (http://master.dev/bower_components/angular-material/angular-material.min.js:11:25092)\n    at Object.r (http://master.dev/bower_components/angular-material/angular-material.min.js:11:25392)\n    at http://master.dev/bower_components/angular/angular.min.js:16:71\n    at la (http://master.dev/bower_components/angular/angular.min.js:82:90)\n    at p (http://master.dev/bower_components/angular/angular.min.js:67:274)\n    at g (http://master.dev/bower_components/angular/angular.min.js:59:252)\n    at http://master.dev/bower_components/angular/angular.min.js:58:394\n    at http://master.dev/bower_components/angular/angular.min.js:63:421\n    at d (http://master.dev/bower_components/angular/angular.min.js:60:238)\n','2017-01-20 08:22:58','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(47,'Exception: \"Error: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=VisitCtrl&p1=not%20a%20function%2C%20got%20undefined\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\">\nMessage: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=VisitCtrl&p1=not%20a%20function%2C%20got%20undefined\nStack Trace: Error: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=VisitCtrl&p1=not%20a%20function%2C%20got%20undefined\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at vb (http://master.dev/bower_components/angular/angular.min.js:23:159)\n    at Pa (http://master.dev/bower_components/angular/angular.min.js:23:246)\n    at http://master.dev/bower_components/angular/angular.min.js:90:379\n    at http://master.dev/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n    at http://master.dev/bower_components/angular/angular.min.js:16:71\n    at la (http://master.dev/bower_components/angular/angular.min.js:82:90)\n    at p (http://master.dev/bower_components/angular/angular.min.js:67:274)\n    at g (http://master.dev/bower_components/angular/angular.min.js:59:252)\n','2017-01-20 08:28:24','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(48,'Exception: \"TypeError: Cannot read property \'uploads\' of null\"\nCaused by: undefined\nMessage: Cannot read property \'uploads\' of null\nStack Trace: TypeError: Cannot read property \'uploads\' of null\n    at http://master.dev/app/visit-report/visit-report.controller.js:517:79\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 08:33:50','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(49,'Exception: \"TypeError: Cannot read property \'length\' of undefined\"\nCaused by: undefined\nMessage: Cannot read property \'length\' of undefined\nStack Trace: TypeError: Cannot read property \'length\' of undefined\n    at m.VisitCtrl.$scope.addNewChoice (http://master.dev/app/visit-report/visit-report.controller.js:283:50)\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:227)\n    at b (http://master.dev/bower_components/angular/angular.min.js:127:128)\n    at e (http://master.dev/bower_components/angular/angular.min.js:281:195)\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:17)\n    at HTMLButtonElement.<anonymous> (http://master.dev/bower_components/angular/angular.min.js:281:247)\n    at HTMLButtonElement.dispatch (http://master.dev/bower_components/jquery/dist/jquery.min.js:3:7537)\n    at HTMLButtonElement.r.handle (http://master.dev/bower_components/jquery/dist/jquery.min.js:3:5620)\n','2017-01-20 08:35:37','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(50,'Exception: \"Error: The ng-model for md-datepicker must be a Date instance. Currently the model is a: string\"\nCaused by: undefined\nMessage: The ng-model for md-datepicker must be a Date instance. Currently the model is a: string\nStack Trace: Error: The ng-model for md-datepicker must be a Date instance. Currently the model is a: string\n    at Array.<anonymous> (http://master.dev/bower_components/angular-material/angular-material.min.js:15:5789)\n    at http://master.dev/bower_components/angular/angular.min.js:293:316\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 08:49:41','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(51,'Exception: \"Error: Could not resolve \'admin.visitview\' from state \'admin.visit\'\"\nCaused by: undefined\nMessage: Could not resolve \'admin.visitview\' from state \'admin.visit\'\nStack Trace: Error: Could not resolve \'admin.visitview\' from state \'admin.visit\'\n    at Object.transitionTo (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:3190:17)\n    at Object.go (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:3118:21)\n    at m.VisitCtrl.$scope.view (http://master.dev/app/visit-report/visit-report.controller.js:99:20)\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:1:1), <anonymous>:4:368)\n    at b (http://master.dev/bower_components/angular/angular.min.js:127:128)\n    at e (http://master.dev/bower_components/angular/angular.min.js:281:195)\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:17)\n    at HTMLButtonElement.<anonymous> (http://master.dev/bower_components/angular/angular.min.js:281:247)\n    at HTMLButtonElement.dispatch (http://master.dev/bower_components/jquery/dist/jquery.min.js:3:7537)\n','2017-01-20 08:54:35','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(52,'Exception: \"Error: Could not resolve \'admin.visitview\' from state \'admin.visit\'\"\nCaused by: undefined\nMessage: Could not resolve \'admin.visitview\' from state \'admin.visit\'\nStack Trace: Error: Could not resolve \'admin.visitview\' from state \'admin.visit\'\n    at Object.transitionTo (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:3190:17)\n    at Object.go (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:3118:21)\n    at m.VisitCtrl.$scope.view (http://master.dev/app/visit-report/visit-report.controller.js:99:20)\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:368)\n    at b (http://master.dev/bower_components/angular/angular.min.js:127:128)\n    at e (http://master.dev/bower_components/angular/angular.min.js:281:195)\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:17)\n    at HTMLButtonElement.<anonymous> (http://master.dev/bower_components/angular/angular.min.js:281:247)\n    at HTMLButtonElement.dispatch (http://master.dev/bower_components/jquery/dist/jquery.min.js:3:7537)\n','2017-01-20 09:05:48','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(53,'Exception: \"Error: Could not resolve \'admin.visitview\' from state \'admin.visit\'\"\nCaused by: undefined\nMessage: Could not resolve \'admin.visitview\' from state \'admin.visit\'\nStack Trace: Error: Could not resolve \'admin.visitview\' from state \'admin.visit\'\n    at Object.transitionTo (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:3190:17)\n    at Object.go (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:3118:21)\n    at m.VisitCtrl.$scope.view (http://master.dev/app/visit-report/visit-report.controller.js:99:20)\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:368)\n    at b (http://master.dev/bower_components/angular/angular.min.js:127:128)\n    at e (http://master.dev/bower_components/angular/angular.min.js:281:195)\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:17)\n    at HTMLButtonElement.<anonymous> (http://master.dev/bower_components/angular/angular.min.js:281:247)\n    at HTMLButtonElement.dispatch (http://master.dev/bower_components/jquery/dist/jquery.min.js:3:7537)\n','2017-01-20 09:06:04','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(54,'Exception: \"Error: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=VisitViewCtrl&p1=not%20a%20function%2C%20got%20undefined\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\" data-ng-animate=\"1\">\nMessage: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=VisitViewCtrl&p1=not%20a%20function%2C%20got%20undefined\nStack Trace: Error: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=VisitViewCtrl&p1=not%20a%20function%2C%20got%20undefined\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at vb (http://master.dev/bower_components/angular/angular.min.js:23:159)\n    at Pa (http://master.dev/bower_components/angular/angular.min.js:23:246)\n    at http://master.dev/bower_components/angular/angular.min.js:90:379\n    at http://master.dev/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n    at http://master.dev/bower_components/angular/angular.min.js:16:71\n    at la (http://master.dev/bower_components/angular/angular.min.js:82:90)\n    at p (http://master.dev/bower_components/angular/angular.min.js:67:274)\n    at g (http://master.dev/bower_components/angular/angular.min.js:59:252)\n','2017-01-20 09:08:35','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(55,'Exception: \"TypeError: Cannot read property \'user_id\' of null\"\nCaused by: undefined\nMessage: Cannot read property \'user_id\' of null\nStack Trace: TypeError: Cannot read property \'user_id\' of null\n    at http://master.dev/app/visit-report/visit-report.view.controller.js:70:64\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:11:34','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(56,'Exception: \"ReferenceError: visittypes is not defined\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\">\nMessage: visittypes is not defined\nStack Trace: ReferenceError: visittypes is not defined\n    at new VisitViewCtrl (http://master.dev/app/visit-report/visit-report.view.controller.js:16:21)\n    at Object.instantiate (http://master.dev/bower_components/angular/angular.min.js:42:109)\n    at http://master.dev/bower_components/angular/angular.min.js:91:109\n    at http://master.dev/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n    at http://master.dev/bower_components/angular/angular.min.js:16:71\n    at la (http://master.dev/bower_components/angular/angular.min.js:82:90)\n    at p (http://master.dev/bower_components/angular/angular.min.js:67:274)\n    at g (http://master.dev/bower_components/angular/angular.min.js:59:252)\n    at http://master.dev/bower_components/angular/angular.min.js:58:394\n','2017-01-20 09:17:37','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(57,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:327)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:42:22','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(58,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:327)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:42:22','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(59,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:327)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:42:22','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(60,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:327)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:42:22','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(61,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:327)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:42:22','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(62,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:327)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:42:22','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(63,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:327)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:42:22','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(64,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:327)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:42:22','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(65,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:327)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:42:22','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(66,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:327)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:42:22','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(67,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:327)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:42:23','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(68,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:327)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:42:23','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(69,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:327)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:42:23','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(70,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:327)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:42:23','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(71,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:236:126), <anonymous>:4:327)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:42:23','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(72,'Exception: \"TypeError: Cannot read property \'user_id\' of null\"\nCaused by: undefined\nMessage: Cannot read property \'user_id\' of null\nStack Trace: TypeError: Cannot read property \'user_id\' of null\n    at http://master.dev/app/customer/customer.view.controller.js:69:64\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:44:37','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(73,'Exception: \"TypeError: Cannot read property \'user_id\' of null\"\nCaused by: undefined\nMessage: Cannot read property \'user_id\' of null\nStack Trace: TypeError: Cannot read property \'user_id\' of null\n    at http://master.dev/app/customer/customer.view.controller.js:69:64\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:44:45','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(74,'Exception: \"TypeError: Cannot read property \'user_id\' of null\"\nCaused by: undefined\nMessage: Cannot read property \'user_id\' of null\nStack Trace: TypeError: Cannot read property \'user_id\' of null\n    at http://master.dev/app/customer/customer.view.controller.js:69:64\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:44:48','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(75,'Exception: \"TypeError: Cannot read property \'user_id\' of null\"\nCaused by: undefined\nMessage: Cannot read property \'user_id\' of null\nStack Trace: TypeError: Cannot read property \'user_id\' of null\n    at http://master.dev/app/customer/customer.view.controller.js:69:64\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 09:45:04','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(76,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:1:1), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 10:00:01','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(77,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:1:1), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 10:00:01','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(78,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:1:1), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 10:00:01','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(79,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:1:1), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 10:00:01','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(80,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:1:1), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 10:00:01','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(81,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:1:1), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 10:00:01','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(82,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:1:1), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 10:00:01','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(83,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:1:1), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 10:00:01','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(84,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:1:1), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 10:00:01','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(85,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:1:1), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 10:00:01','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(86,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:1:1), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 10:00:01','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(87,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:1:1), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 10:00:01','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(88,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:1:1), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 10:00:01','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(89,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:1:1), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 10:00:01','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(90,'Exception: \"Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\"\nCaused by: undefined\nMessage: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\nStack Trace: Error: [filter:notarray] http://errors.angularjs.org/1.5.9/filter/notarray?p0=function%20()\n    at http://master.dev/bower_components/angular/angular.min.js:6:412\n    at http://master.dev/bower_components/angular/angular.min.js:163:56\n    at fn (eval at compile (http://master.dev/bower_components/angular/angular.min.js:1:1), <anonymous>:4:330)\n    at http://master.dev/bower_components/angular/angular.min.js:129:453\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://master.dev/bower_components/angular/angular.min.js:147:78)\n    at l (http://master.dev/bower_components/angular/angular.min.js:98:421)\n    at D (http://master.dev/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://master.dev/bower_components/angular/angular.min.js:104:77)\n','2017-01-20 10:00:02','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(91,'Exception: \"SyntaxError: Unexpected token A in JSON at position 0\"\nCaused by: undefined\nMessage: Unexpected token A in JSON at position 0\nStack Trace: SyntaxError: Unexpected token A in JSON at position 0\n    at JSON.parse (<anonymous>)\n    at Ec (http://master.dev/bower_components/angular/angular.min.js:16:379)\n    at ic (http://master.dev/bower_components/angular/angular.min.js:93:45)\n    at http://master.dev/bower_components/angular/angular.min.js:93:460\n    at q (http://master.dev/bower_components/angular/angular.min.js:7:359)\n    at od (http://master.dev/bower_components/angular/angular.min.js:93:442)\n    at f (http://master.dev/bower_components/angular/angular.min.js:95:393)\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n','2017-01-21 00:32:32','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(92,'Exception: \"SyntaxError: Unexpected token A in JSON at position 0\"\nCaused by: undefined\nMessage: Unexpected token A in JSON at position 0\nStack Trace: SyntaxError: Unexpected token A in JSON at position 0\n    at JSON.parse (<anonymous>)\n    at Ec (http://master.dev/bower_components/angular/angular.min.js:16:379)\n    at ic (http://master.dev/bower_components/angular/angular.min.js:93:45)\n    at http://master.dev/bower_components/angular/angular.min.js:93:460\n    at q (http://master.dev/bower_components/angular/angular.min.js:7:359)\n    at od (http://master.dev/bower_components/angular/angular.min.js:93:442)\n    at f (http://master.dev/bower_components/angular/angular.min.js:95:393)\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n','2017-01-21 00:32:32','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(93,'Exception: \"SyntaxError: Unexpected token A in JSON at position 0\"\nCaused by: undefined\nMessage: Unexpected token A in JSON at position 0\nStack Trace: SyntaxError: Unexpected token A in JSON at position 0\n    at JSON.parse (<anonymous>)\n    at Ec (http://master.dev/bower_components/angular/angular.min.js:16:379)\n    at ic (http://master.dev/bower_components/angular/angular.min.js:93:45)\n    at http://master.dev/bower_components/angular/angular.min.js:93:460\n    at q (http://master.dev/bower_components/angular/angular.min.js:7:359)\n    at od (http://master.dev/bower_components/angular/angular.min.js:93:442)\n    at f (http://master.dev/bower_components/angular/angular.min.js:95:393)\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n','2017-01-21 00:32:32','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(94,'Exception: \"SyntaxError: Unexpected token A in JSON at position 0\"\nCaused by: undefined\nMessage: Unexpected token A in JSON at position 0\nStack Trace: SyntaxError: Unexpected token A in JSON at position 0\n    at JSON.parse (<anonymous>)\n    at Ec (http://master.dev/bower_components/angular/angular.min.js:16:379)\n    at ic (http://master.dev/bower_components/angular/angular.min.js:93:45)\n    at http://master.dev/bower_components/angular/angular.min.js:93:460\n    at q (http://master.dev/bower_components/angular/angular.min.js:7:359)\n    at od (http://master.dev/bower_components/angular/angular.min.js:93:442)\n    at f (http://master.dev/bower_components/angular/angular.min.js:95:393)\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n','2017-01-21 00:32:32','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(95,'Exception: \"SyntaxError: Unexpected token A in JSON at position 0\"\nCaused by: undefined\nMessage: Unexpected token A in JSON at position 0\nStack Trace: SyntaxError: Unexpected token A in JSON at position 0\n    at JSON.parse (<anonymous>)\n    at Ec (http://master.dev/bower_components/angular/angular.min.js:16:379)\n    at ic (http://master.dev/bower_components/angular/angular.min.js:93:45)\n    at http://master.dev/bower_components/angular/angular.min.js:93:460\n    at q (http://master.dev/bower_components/angular/angular.min.js:7:359)\n    at od (http://master.dev/bower_components/angular/angular.min.js:93:442)\n    at f (http://master.dev/bower_components/angular/angular.min.js:95:393)\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n','2017-01-21 00:32:33','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(96,'Exception: \"SyntaxError: Unexpected token A in JSON at position 0\"\nCaused by: undefined\nMessage: Unexpected token A in JSON at position 0\nStack Trace: SyntaxError: Unexpected token A in JSON at position 0\n    at JSON.parse (<anonymous>)\n    at Ec (http://master.dev/bower_components/angular/angular.min.js:16:379)\n    at ic (http://master.dev/bower_components/angular/angular.min.js:93:45)\n    at http://master.dev/bower_components/angular/angular.min.js:93:460\n    at q (http://master.dev/bower_components/angular/angular.min.js:7:359)\n    at od (http://master.dev/bower_components/angular/angular.min.js:93:442)\n    at f (http://master.dev/bower_components/angular/angular.min.js:95:393)\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n','2017-01-21 00:32:33','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(97,'Exception: \"SyntaxError: Unexpected token A in JSON at position 0\"\nCaused by: undefined\nMessage: Unexpected token A in JSON at position 0\nStack Trace: SyntaxError: Unexpected token A in JSON at position 0\n    at JSON.parse (<anonymous>)\n    at Ec (http://master.dev/bower_components/angular/angular.min.js:16:379)\n    at ic (http://master.dev/bower_components/angular/angular.min.js:93:45)\n    at http://master.dev/bower_components/angular/angular.min.js:93:460\n    at q (http://master.dev/bower_components/angular/angular.min.js:7:359)\n    at od (http://master.dev/bower_components/angular/angular.min.js:93:442)\n    at f (http://master.dev/bower_components/angular/angular.min.js:95:393)\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n','2017-01-21 00:42:23','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(98,'Exception: \"SyntaxError: Unexpected token A in JSON at position 0\"\nCaused by: undefined\nMessage: Unexpected token A in JSON at position 0\nStack Trace: SyntaxError: Unexpected token A in JSON at position 0\n    at JSON.parse (<anonymous>)\n    at Ec (http://master.dev/bower_components/angular/angular.min.js:16:379)\n    at ic (http://master.dev/bower_components/angular/angular.min.js:93:45)\n    at http://master.dev/bower_components/angular/angular.min.js:93:460\n    at q (http://master.dev/bower_components/angular/angular.min.js:7:359)\n    at od (http://master.dev/bower_components/angular/angular.min.js:93:442)\n    at f (http://master.dev/bower_components/angular/angular.min.js:95:393)\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n','2017-01-21 00:42:23','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(99,'Exception: \"SyntaxError: Unexpected token A in JSON at position 0\"\nCaused by: undefined\nMessage: Unexpected token A in JSON at position 0\nStack Trace: SyntaxError: Unexpected token A in JSON at position 0\n    at JSON.parse (<anonymous>)\n    at Ec (http://master.dev/bower_components/angular/angular.min.js:16:379)\n    at ic (http://master.dev/bower_components/angular/angular.min.js:93:45)\n    at http://master.dev/bower_components/angular/angular.min.js:93:460\n    at q (http://master.dev/bower_components/angular/angular.min.js:7:359)\n    at od (http://master.dev/bower_components/angular/angular.min.js:93:442)\n    at f (http://master.dev/bower_components/angular/angular.min.js:95:393)\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n','2017-01-21 00:42:23','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(100,'Exception: \"SyntaxError: Unexpected token A in JSON at position 0\"\nCaused by: undefined\nMessage: Unexpected token A in JSON at position 0\nStack Trace: SyntaxError: Unexpected token A in JSON at position 0\n    at JSON.parse (<anonymous>)\n    at Ec (http://master.dev/bower_components/angular/angular.min.js:16:379)\n    at ic (http://master.dev/bower_components/angular/angular.min.js:93:45)\n    at http://master.dev/bower_components/angular/angular.min.js:93:460\n    at q (http://master.dev/bower_components/angular/angular.min.js:7:359)\n    at od (http://master.dev/bower_components/angular/angular.min.js:93:442)\n    at f (http://master.dev/bower_components/angular/angular.min.js:95:393)\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n','2017-01-21 00:42:23','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(101,'Exception: \"SyntaxError: Unexpected token A in JSON at position 0\"\nCaused by: undefined\nMessage: Unexpected token A in JSON at position 0\nStack Trace: SyntaxError: Unexpected token A in JSON at position 0\n    at JSON.parse (<anonymous>)\n    at Ec (http://master.dev/bower_components/angular/angular.min.js:16:379)\n    at ic (http://master.dev/bower_components/angular/angular.min.js:93:45)\n    at http://master.dev/bower_components/angular/angular.min.js:93:460\n    at q (http://master.dev/bower_components/angular/angular.min.js:7:359)\n    at od (http://master.dev/bower_components/angular/angular.min.js:93:442)\n    at f (http://master.dev/bower_components/angular/angular.min.js:95:393)\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n','2017-01-21 00:42:23','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(102,'Exception: \"SyntaxError: Unexpected token A in JSON at position 0\"\nCaused by: undefined\nMessage: Unexpected token A in JSON at position 0\nStack Trace: SyntaxError: Unexpected token A in JSON at position 0\n    at JSON.parse (<anonymous>)\n    at Ec (http://master.dev/bower_components/angular/angular.min.js:16:379)\n    at ic (http://master.dev/bower_components/angular/angular.min.js:93:45)\n    at http://master.dev/bower_components/angular/angular.min.js:93:460\n    at q (http://master.dev/bower_components/angular/angular.min.js:7:359)\n    at od (http://master.dev/bower_components/angular/angular.min.js:93:442)\n    at f (http://master.dev/bower_components/angular/angular.min.js:95:393)\n    at http://master.dev/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://master.dev/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://master.dev/bower_components/angular/angular.min.js:143:420)\n','2017-01-21 00:42:23','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36');
/*!40000 ALTER TABLE `js_error` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master`
--

LOCK TABLES `master` WRITE;
/*!40000 ALTER TABLE `master` DISABLE KEYS */;
INSERT INTO `master` VALUES ('Master','fdjhf','fjhdfj','djsfj','fdj','http://thanks.com','+919524609638','fjhfjd',25,'2017-01-20 07:35:14','2017-01-21 00:49:10','fjhdj','eyJpdiI6ImhGSFQyQXpobk5kRlAxbUg0Z29YdWc9PSIsInZhbHVlIjoiQks3aXNIY0dmRzJ6a1FLaXp6d2hOYzMyeXdSYjRSRkppR2xmODRlUXFkNWRlT1wvOWZ0VU5XTlcrZ0tTVk54MFVwWEVidjZId0YySU9ZMVwvK01QdzhXTGJ3Nlc2TlhZY1dncldzNWJ2K2R2dz0iLCJtYWMiOiI1ODNjM2E0MTBlN2IxOGZkNzkwZGZiMmQwM2E1ZmU2MGExNWUxNGQ5OGY4NTRjMWQyNmUzYzczYWEwOTM5MmY2In0=','dass.k@gmail.com',NULL);
/*!40000 ALTER TABLE `master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_28_175635_create_threads_table',1),(2,'2014_10_28_175710_create_messages_table',1),(3,'2014_10_28_180224_create_participants_table',1),(4,'2014_11_03_154831_add_soft_deletes_to_participants_table',1),(5,'2014_12_04_124531_add_softdeletes_to_threads_table',1);
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
  `quote_ref` varchar(100) DEFAULT NULL,
  `po_num` varchar(100) DEFAULT NULL,
  `po_date` date DEFAULT NULL,
  `ship_to` tinytext,
  `bil_to` tinytext,
  `remarks` tinytext,
  `files_info` text,
  `emp_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_booking_id`),
  KEY `fk_order_bookings_1_idx` (`cust_id`),
  KEY `fk_order_bookings_2_idx` (`emp_id`),
  CONSTRAINT `fk_order_bookings_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_bookings_2` FOREIGN KEY (`emp_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_bookings`
--

LOCK TABLES `order_bookings` WRITE;
/*!40000 ALTER TABLE `order_bookings` DISABLE KEYS */;
INSERT INTO `order_bookings` VALUES (8,41,NULL,'1',NULL,'2017-11-14','1','1','1','[\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]',24,'2015-05-01',NULL,'2017-01-11 05:37:21',NULL),(9,53,NULL,'ds','fdg','2017-01-24','gf','gfg',NULL,'[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]',25,'2017-01-26',NULL,'2017-01-11 05:37:30',NULL),(12,53,NULL,'ds','fdg','2017-01-25','gf','gfg',NULL,'[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]',25,'2017-01-24',NULL,'2017-01-11 05:37:33',NULL),(13,53,NULL,'gfg','gfg','2017-01-24','v','gfg','fg','[]',24,'2017-01-24',NULL,NULL,NULL),(14,53,NULL,'fdf','gfgfg','2017-01-09','gfg','gfg','gfg','[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\"]',25,'2017-01-23',NULL,NULL,NULL),(16,53,NULL,'gfg','gfg','2017-01-25','gf','gf','ggf','[]',25,'2017-01-16',NULL,NULL,NULL),(22,53,NULL,'fd','fdf','2017-01-24','fd','fd','fdf','[]',25,'2017-02-14',NULL,NULL,NULL),(23,53,NULL,'fd','dfd','2017-01-09','fd','fd','fd','[\"uploads\\/3dcbe4762c03437a29feaefb2467014a.jpeg\"]',25,'2017-01-24',NULL,'2017-01-11 05:37:27',NULL),(24,54,NULL,'direct referal','50000','2017-01-25','thanks','how','you','[]',24,'2017-01-26',NULL,NULL,NULL);
/*!40000 ALTER TABLE `order_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `last_read` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
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
  `pro_req_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_orders_1_idx` (`order_id`),
  KEY `fk_product_orders_2_idx` (`product_id`),
  CONSTRAINT `fk_product_orders_1` FOREIGN KEY (`order_id`) REFERENCES `order_bookings` (`order_booking_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_orders_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_orders`
--

LOCK TABLES `product_orders` WRITE;
/*!40000 ALTER TABLE `product_orders` DISABLE KEYS */;
INSERT INTO `product_orders` VALUES (1,8,1,'1000','2014-05-15',NULL,NULL,NULL),(2,22,1,'fdfd','2017-02-14',NULL,NULL,NULL),(3,23,1,'fdf','2017-02-15',NULL,NULL,NULL),(4,9,1,'dsd','2017-01-25',NULL,NULL,NULL),(5,24,1,'','2017-01-13',NULL,NULL,NULL);
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
  `unit` varchar(500) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `desc` text,
  `photos` tinytext,
  `doc_info` tinytext,
  `category` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `fk_products_idx` (`category`),
  CONSTRAINT `fk_products_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'kalidass',10.4943,'gfgf',3243,'test','[]','[]',9,'2017-01-05 01:25:45','2017-01-20 04:55:35',NULL),(2,'tes',1000,'1000',101,'thanks','[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\"]','[\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]',9,'2017-01-20 04:27:12','2017-01-20 04:58:37',NULL),(4,'kalidasss',545,'545ffgfg',434,'4343','[]','[]',9,'2017-01-20 04:57:52','2017-01-20 04:57:52',NULL),(5,'fdf',434,'rer',434,'434434','[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\"]','[\"uploads\\/3dcbe4762c03437a29feaefb2467014a.jpeg\",\"uploads\\/3dcbe4762c03437a29feaefb2467014a.jpeg\"]',9,'2017-01-20 04:58:22','2017-01-20 05:03:32',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_types`
--

LOCK TABLES `prospect_types` WRITE;
/*!40000 ALTER TABLE `prospect_types` DISABLE KEYS */;
INSERT INTO `prospect_types` VALUES (17,'fdf','fdf','2017-01-20 02:23:03','2017-01-20 02:23:03',NULL);
/*!40000 ALTER TABLE `prospect_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rep_ind_cmp`
--

DROP TABLE IF EXISTS `rep_ind_cmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rep_ind_cmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comp_id` int(11) DEFAULT NULL,
  `product` text,
  `rsp` varchar(45) DEFAULT NULL,
  `wsp` varchar(45) DEFAULT NULL,
  `stk` varchar(45) DEFAULT NULL,
  `visit_report_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rep_ind_cmp_1_idx` (`visit_report_id`),
  KEY `fk_rep_ind_cmp_2_idx` (`comp_id`),
  CONSTRAINT `fk_rep_ind_cmp_1` FOREIGN KEY (`visit_report_id`) REFERENCES `visit_report` (`report_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rep_ind_cmp_2` FOREIGN KEY (`comp_id`) REFERENCES `competitor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rep_ind_cmp`
--

LOCK TABLES `rep_ind_cmp` WRITE;
/*!40000 ALTER TABLE `rep_ind_cmp` DISABLE KEYS */;
INSERT INTO `rep_ind_cmp` VALUES (2,4,'ds','ds','ds','ds',3);
/*!40000 ALTER TABLE `rep_ind_cmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_clients`
--

DROP TABLE IF EXISTS `session_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_ip` varchar(45) NOT NULL,
  `client_data` varchar(45) DEFAULT NULL,
  `client_info` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_clients`
--

LOCK TABLES `session_clients` WRITE;
/*!40000 ALTER TABLE `session_clients` DISABLE KEYS */;
INSERT INTO `session_clients` VALUES (7,'127.0.0.1','0ef1f9d9cb8d1ffbebf7a7481392b800','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','2017-01-05 04:17:49',NULL,'2017-01-05 04:17:49'),(8,'127.0.0.1','309c84d1eaecbb673c600c23f173c227','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','2017-01-05 05:07:40',NULL,'2017-01-05 05:07:40'),(9,'127.0.0.1','512a2adb6535dacebd5f1872e5bc2644','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:50.0) Gecko/20100101 Firefox/50.0','2017-01-05 08:53:06',NULL,'2017-01-05 08:53:06'),(10,'127.0.0.1','7e20696728db5c007c80c01924894365','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','2017-01-11 07:16:33',NULL,'2017-01-11 07:16:33'),(11,'127.0.0.1','a3ce3d1347e8fe1daecc9f13f6fb2ff1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','2017-01-12 00:52:38',NULL,'2017-01-12 00:52:38');
/*!40000 ALTER TABLE `session_clients` ENABLE KEYS */;
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
  `is_active` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_admin`
--

LOCK TABLES `super_admin` WRITE;
/*!40000 ALTER TABLE `super_admin` DISABLE KEYS */;
INSERT INTO `super_admin` VALUES (1,'admin@sfa.com','kali',NULL,NULL,NULL,NULL,'eyJpdiI6InljVUpGU2xSeE80YStwNWZpQzhMVXc9PSIsInZhbHVlIjoid0hcL3NnSmxSWVZZQnhiQ2hJRmhsakE9PSIsIm1hYyI6ImFkZDY1YzFjOWFiYzkyNTMzMTBkNTA4ZGZkYzM0NzI3ZGYxY2QyOWRkYWJiYzAyNzk1MzBhZDg3MGZkOTQ2OGQifQ==',1);
/*!40000 ALTER TABLE `super_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threads`
--

DROP TABLE IF EXISTS `threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threads`
--

LOCK TABLES `threads` WRITE;
/*!40000 ALTER TABLE `threads` DISABLE KEYS */;
/*!40000 ALTER TABLE `threads` ENABLE KEYS */;
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
  `profile_image` varchar(500) DEFAULT NULL,
  `belongs_manager` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_user_1_idx` (`role_id`),
  CONSTRAINT `fk_user_1` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'kali','dass','eyJpdiI6IkRCSEkrd0NzT3Z0NHErMVo5YzZpRmc9PSIsInZhbHVlIjoibWplb09Uak44bHZZWUVoOGJzdVwvMUE9PSIsIm1hYyI6ImI5YmJlZDEwNGMxNDgxYmM2M2EyNmMwY2VmNTE3N2QwZGE2MDBiNTMxYTk0YWFmZmFhMGVkMDQ4MzVjNzQ4Y2IifQ==','dass',NULL,NULL,NULL,NULL,NULL,'2017-01-08 23:36:04','kalidass@gmail.com',1,NULL,NULL,NULL,NULL,'2017-01-08 23:36:04',NULL,NULL),(2,3,'manager','kitty','eyJpdiI6ImpFZUZ4MWVZbWhjRVlOY0VBRGltY0E9PSIsInZhbHVlIjoiUUlqQU9LakdlZTQyQ3AwVytLd3FLUT09IiwibWFjIjoiMWU0OGFjM2MzZjk3YjNmMjIwNjgwN2MzMTBjYjgzZDdkN2Q2MDIxNTliYzA2YjkwMjc4M2Q2NWNiODljMGI5YyJ9','+919524609638','dsd','dsd','dsd','dds','0000-00-00 00:00:00','2017-01-08 23:36:10','manager@sfa.com',1,NULL,NULL,'fdf','','2017-01-08 23:36:10',NULL,NULL),(5,2,'Kali Dass','W2s','eyJpdiI6IkNmU05qM09SSUFxVlFKSDF3NkZaZFE9PSIsInZhbHVlIjoiSDA2QXdJTDJvWXI3cVRkK1pCeExGUT09IiwibWFjIjoiZmM5NWM5YjcxNDgzM2E1MzQ3M2QxMWUwMDBmYjIxOTUzN2FiNGYwM2NlYWI3YTE2MmY3NzIyNTJiY2EyYzc1MiJ9','+919524609637','das','dass','tamil nadu','600041','2017-01-08 23:27:31','2017-01-08 23:36:12','kalidass@way2smile.com',0,NULL,NULL,'india','9524609638','2017-01-08 23:36:12',NULL,NULL),(8,2,'Kali Dass','W2s','eyJpdiI6Ik44eFNEUEV1dmlmUDllbm1XdFR5SFE9PSIsInZhbHVlIjoiWXErT242WFhNN3F5Y09RdTJ0Z2ppdz09IiwibWFjIjoiZWZkODM3NTJkMTdhY2NmZWI0ZGRlMmZlMDY3NDJjNGJhZTMwMmZiMzA2ZGQzOTA5MmUwYWEzZWJkNmE4OTc0ZCJ9','+919524609637','das','dass','tamil nadu','600041','2017-01-08 23:29:58','2017-01-09 02:04:28','kalidass@way2smile.co',0,NULL,NULL,'india','','2017-01-09 02:04:28',NULL,NULL),(9,2,'Kali Dass','W2s','eyJpdiI6IkpHVkd3UFh1YlwvWHJwUG1SdXRmUHB3PT0iLCJ2YWx1ZSI6IlRYanlZQU04Q0lIbWtyMzVCUnJBaFE9PSIsIm1hYyI6Ijc1ZjMyYjhhODMwNTg4ODg5MDAxNTY3NzU1ZWFmZmE0ODliNzI5MTA1MzgwOThiYTVlZGI2MWFlZGFhNDcxOGUifQ==','+919524609637','dasfdf','dass','tamil nadu','600041','2017-01-08 23:30:30','2017-01-08 23:37:48','kalidass@way2smile.c',0,NULL,NULL,'india','','2017-01-08 23:37:48',NULL,NULL),(10,2,'Kali Dass','W2s','eyJpdiI6ImU0Z1VmNEc0SnlEZmFVVnZnazVpS2c9PSIsInZhbHVlIjoidUswXC9NODZhQTdDOVpoWUhibTRPS2c9PSIsIm1hYyI6ImQ5NjlhMmI3YWViZTc1NWRjNjhjMzM0NmJmNWFhNTIzNjM3MTYyYTQwMGZhOTMxM2YzYTJhZTA0YzczMmQ5MDAifQ==','+919524609637','das','dass','tamil nadu','600041','2017-01-08 23:31:09','2017-01-08 23:37:35','kalidass@way2sile.c',0,NULL,NULL,'india','9524609638','2017-01-08 23:37:35',NULL,NULL),(14,2,'kalidass','dass','eyJpdiI6IlltRGlwVkdcL1NMYVE5S0hIc1krK0FBPT0iLCJ2YWx1ZSI6Ilg4cSszXC81cUowekd0Mm01VGNseGxRPT0iLCJtYWMiOiIxMTg3NGFiMzgzYWNkMzM0MjkzYjk2MjYwZmNhNmUxYzIwMjI0NjFiM2U4ZWI2MmEyZGY5MzU3YjEwNjVjYjE2In0=','+919524609638','dsd','dsd','fds','sdsf','2017-01-08 23:39:01','2017-01-09 02:04:26','kalidass@way2.com',1,NULL,NULL,'sf','fdf','2017-01-09 02:04:26',NULL,NULL),(16,2,'fdffdfdfdfdf','http://www.s.com','eyJpdiI6Ik1NenpERG1GMTVjM0J1XC93emtSQklRPT0iLCJ2YWx1ZSI6ImZ6WEdwUmNCUXZBTW81MHpPNXJMRHc9PSIsIm1hYyI6IjAyYzEyMzQ3ZGQ3YzAzZmRmYTkwMTBjMjQ0OGIyMDQ3MjNiMjA2ZmQwZDAyYjE1OTA1YzAyYzdlYTIzMmJmMWUifQ==','+919524609638','dsd','dss','dsf','dfdf','2017-01-08 23:40:13','2017-01-09 02:04:24','kali@gmail.com',1,NULL,NULL,'sfdf','dsf','2017-01-09 02:04:24',NULL,NULL),(17,2,'fdffdfdfdfdf','http://www.s.com','eyJpdiI6ImZkOFowRUF1NGZ6dUlHV09TZm1CbUE9PSIsInZhbHVlIjoiU3l0eGxJUkgwZFB2aVJ4K1dzdkFkQT09IiwibWFjIjoiNzY1Y2MyYWNkMTg0NTBhOTJjMjczYTQyMWE2MzExYjRhMDQ0OTdhZGMwZmJiYWI0YTE1Y2IzMGRkOTYwZjc5YyJ9','+919524609638','dsd','dss','dsf','dfdf','2017-01-08 23:40:59','2017-01-09 02:04:21','ali@gmail.com',1,NULL,NULL,'sfdf','','2017-01-09 02:04:21',NULL,NULL),(19,3,'gf','ggfg','eyJpdiI6IkNPNkdqUHJuZ3l2MU9hV082N2lUdWc9PSIsInZhbHVlIjoiY3ZIdUtmZjNmOXN4R0RpeUtTRE9cL3c9PSIsIm1hYyI6ImM0ZjBkMTNhM2M4YzliOTM0Y2VlMjU3Yjc4MDE3ZTBkMmQyYjUxNTcwZDRlMmUyODc3Njk3ZDgxZTAzNGEwZGUifQ==','+919524609638','sfd','ds','fd','fdfd','2017-01-08 23:41:58','2017-01-09 02:04:20','kalidass@g.com',1,NULL,NULL,'sfs','fdf','2017-01-09 02:04:20',NULL,NULL),(20,2,'dfd','dhfd','eyJpdiI6Ik1VYTU4UVdcL3I0bmFwTjZBY2ZoQWJnPT0iLCJ2YWx1ZSI6Ind2RDBcL0R3KzBQNUNQMGVKdFwvQjR1UT09IiwibWFjIjoiZTQ2ZmU3ZTM2ZDc5M2NmNzY2ZTNlMTIwNDFkN2YwM2I5ZWJmMWIzZjQyODkyOGM5NjEzYjMxZmE3YWY2MGIyMiJ9','+919524609638','dsh','sdfhdjf','djsfhdj','fdsjhfj','2017-01-08 23:44:08','2017-01-08 23:49:22','jfdjf@g.cm',1,NULL,NULL,'jsfhjd','dsjj','2017-01-08 23:49:22',NULL,NULL),(21,3,'sdf','fdf','eyJpdiI6Ik02eitwK0hNTlVYcWZTRURnUTNcL3ZBPT0iLCJ2YWx1ZSI6ImhSWHJpaG5cL2dEMGRDYkJaXC9uZmtkZz09IiwibWFjIjoiMjNlZmVkOGI0ODFkMWViYTk5Y2UxY2FiMDhlNjJlYmUxZTcwNDY2ZDM5YzliMzRiODNhZDA2ZTE4YzI3ZmZkYiJ9','+919524609638','djshfj','jsfjdf','djsfhj','djsjd','2017-01-08 23:45:11','2017-01-08 23:49:20','djshj@gmail.c',0,NULL,NULL,'djshj@gmail.c','csjc','2017-01-08 23:49:20',NULL,NULL),(22,3,'fdf','fdf','eyJpdiI6ImRnMFc2alp2STdWMUROU1dRVDdaaHc9PSIsInZhbHVlIjoiXC94dkM0c0VJclwveEI5YitoTmx6UUZnPT0iLCJtYWMiOiIwODQyNDI1NDU3NmQ1NDljOTI0Zjk5YzVlMmIxMmI5NDA1NDUzMzFjMmZmZTkyNTE0MTNhN2ZlZGFmZmE4N2M4In0=','+919524609638','fdf','dsf','fd','fd','2017-01-08 23:46:50','2017-01-08 23:49:19','dass.kali14@gmail.com',1,NULL,NULL,'fdf','fdf','2017-01-08 23:49:19',NULL,NULL),(23,3,'gfg','gfg','eyJpdiI6InhZXC9cL0NLaUxmemJTM0tuN01OZlpBZz09IiwidmFsdWUiOiJMeFZjMFpDSlhOZEFPT3IrTVN1TThnPT0iLCJtYWMiOiJjMzI2ZWUwOWI1OWRlOTlhNmYzYzUwNWVmZGEzZWIxZmQyMjBhYTRhZGI3ZDc0MmU4ZjEyNDRlYzlhN2UyMGJmIn0=','+919524609638','dsjkfhdj','fdfhd','fdjhfj','dsfdg','2017-01-08 23:48:15','2017-01-08 23:49:17','dass.k@gmail.com',0,NULL,NULL,'dsdh','','2017-01-08 23:49:17',NULL,NULL),(24,3,'Kali Dass','W2s','eyJpdiI6IkpQKzN2djhwOTl5VG9lSWxRbzgrcUE9PSIsInZhbHVlIjoiSndka0VoeTI0SVJpcXhHS3Iyd3prZz09IiwibWFjIjoiZmE2YjczNDhjYWQyMGU0ZWQyMzZmYTA2NjMzY2RkNjA5MWQ4MGMxNWJiMmI4N2U1OTgzM2U3ODZlODE2MGU5OSJ9','+919524609638','chennai','dsds','tamil nadu','600041','2017-01-09 03:56:15','2017-01-19 09:44:38','dass@gmail.com',1,NULL,NULL,'indiafdf','','2017-01-19 09:44:38','[\"uploads\\/3dcbe4762c03437a29feaefb2467014a.jpeg\"]',NULL),(25,3,'Test sales','employee','eyJpdiI6IkNtM3ZQSElWYUpraWlrMzhNRjJRVFE9PSIsInZhbHVlIjoiRWNpek9lM3NvUGRwWitmRUc2NlJmQT09IiwibWFjIjoiNzE1ODY3MWM5YTI2ODA5M2JjYzQyMWYyN2EzNzZiYzRjNzI0NTIyOTAwZWIxZmE4MzNmNzc4NTlhZmRhOGM1NCJ9','+15123765678','chennai','dummy','tamilnadu','678903','2017-01-09 06:34:58','2017-01-20 08:31:15','mk@mk.com',1,NULL,NULL,'india','fdf',NULL,'[\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]',29),(27,2,'dsd','fg','eyJpdiI6InJJK1NiRWlsWUtVc0FHZVhBT2N4XC9RPT0iLCJ2YWx1ZSI6Ik0zYWZ3Q1piT0VlTFRFTUJuR3ozTnc9PSIsIm1hYyI6Ijg1Y2U2OGI2MWI4YzM2YTNiOTg2NGIzZDMxMGQxYjM2OGI4ZTkzOTUyYjE4YzQ0ODM5MTJjYTEyNWU2ZjZhZjUifQ==','+919524609638','ds','ds','dsd','dsd','2017-01-19 07:59:27','2017-01-19 07:59:27','dsd.com@gm.c',0,NULL,NULL,'dsd','dsd','0000-00-00 00:00:00','',NULL),(28,3,'gf','gfg','eyJpdiI6ImZXZFhHZnpTYzdnUk9zdzJ1TCtxaWc9PSIsInZhbHVlIjoiOXJMdHU5Q3BQSjQzOEpGdXRBREcrUT09IiwibWFjIjoiOGZlMWZhYTZkYzMyY2U2NmVjYTUxZDgwOWRjMjMzMzhjYzk2MzUxYmEyZmE1YmFjNzgwYTMwNmM5M2EyMGE5MCJ9','+919524609638','f','ff','gf','gf','2017-01-19 08:22:41','2017-01-21 00:20:57','dsdsdsds@fhfd.co',1,NULL,NULL,'gf','',NULL,'[\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]',NULL),(29,2,'fd','gfg','eyJpdiI6Imk0cmwrVzlkd2taaUdQXC9ETlRidVhnPT0iLCJ2YWx1ZSI6IjNtRDFFOHpzSlV5bzhqYWhmNVFHOHc9PSIsIm1hYyI6IjZjZWFkNGFmM2MxMDQ3Zjg4MTIwOWZjODAyZDMyYmIzMDk3ZjNjZjVkZDQ2MGI0NWU4OThmNTlhNTliM2VkYTgifQ==','+919524609638','fdf','dfd','fdf','fd','2017-01-19 08:23:26','2017-01-19 10:28:37','dsdsd@gmail.comfdf',1,NULL,NULL,'fdf','',NULL,'[\"uploads\\/3dcbe4762c03437a29feaefb2467014a.jpeg\"]',NULL),(30,1,'fdf','fd','eyJpdiI6Ik1sNm5ZZnRlbUNFM3VlMDYrUlBQRHc9PSIsInZhbHVlIjoiMFdic1QyZ3VObGhzRFwvRm9wNitiXC9RPT0iLCJtYWMiOiIwMTA4ZTgxYzU5ZTEyMDk1YmU2ZTI3MzZlMmU5MGJjMWNjYTljMTQyMGJmZTdkZThjYTVlODY5NmZjMDQwYzllIn0=','+919524609638','fd','dsd','sfdf','dsf','2017-01-19 08:23:59','2017-01-19 10:10:13','dsfdf@dfd.c',1,NULL,NULL,'dfd','',NULL,'[\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]',25),(31,3,'fdf','fdf','eyJpdiI6IjVValZhTmJIWFdSWTU3amd4a3I5TGc9PSIsInZhbHVlIjoieEdzT3NcL1J6MHJneEVoU3RqUUt0VUE9PSIsIm1hYyI6IjA2ZDdmNmFmYmNiMWQxM2JiYThmZDMyNTdlZjBkYmQwYWY1YTU3YzM2OTFhNmY0NDQxNThkZWVmZmY5Zjk0MzIifQ==','+919524609638','fdf','fdf','fd','5435','2017-01-19 09:42:21','2017-01-19 09:42:21','fdhf@gmail.com',1,NULL,NULL,'fef3241','54',NULL,'[\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]',NULL);
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
  `desc` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `display_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'user','Sales Person',NULL,NULL,NULL,'Sales Person'),(2,'manager','Sales Manager',NULL,NULL,NULL,'Sales Manager'),(3,'admin','Office Back end Admin',NULL,NULL,NULL,'Office Back end Admin');
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
  `met_with` varchar(500) DEFAULT NULL,
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
  `date` date DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `fk_visit_report_1_idx` (`cust_id`),
  CONSTRAINT `fk_visit_report_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_report`
--

LOCK TABLES `visit_report` WRITE;
/*!40000 ALTER TABLE `visit_report` DISABLE KEYS */;
INSERT INTO `visit_report` VALUES (3,'dsdsd',53,'dsd','dsd','dsds','[\"uploads\\/746c2e995f4397713ab140586924430d.png\"]','53.132611427668344','-1.7494010925292969','2017-01-20 08:33:47',NULL,'2017-01-20 09:05:40',0,29,'2016-12-27');
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

-- Dump completed on 2017-01-21 11:58:47
