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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'kalidassgfgfdfdf244444444444444','sdsdshghg','2017-01-02 23:53:19','2017-01-11 05:47:49','2017-01-11 05:47:49'),(2,'kalidassgfg','sdsdshghg','2017-01-05 00:29:05','2017-01-05 00:29:05',NULL),(3,'kalidassgfgerdrdr','sdsdshghgrdrdr','2017-01-05 00:29:13','2017-01-11 05:49:09','2017-01-11 05:49:09'),(4,'kalidassgfgerdrdr','sdsdshghgrdrdr','2017-01-05 00:29:20','2017-01-11 05:47:51','2017-01-11 05:47:51'),(5,'Kali Dass','fdf','2017-01-13 07:15:57','2017-01-16 01:20:02',NULL),(6,'dfd','fdf','2017-01-13 07:16:06','2017-01-13 07:16:06',NULL);
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
INSERT INTO `api_auth` VALUES (128,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6ImdERWVvQmVkbkIiLCJpc3MiOiJhcGkubWFzdGVyLmRldiIsInR5cGUiOiJhcGkubWFzdGVyLmRldiJ9.vpj7Va3oslq52TFHXm173hF_7kDqOFb53UrAqKcslhs','2017-01-02 02:02:51','2017-01-02 02:02:51','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\User',1,NULL),(129,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJpc3MiOiJtYXN0ZXIuZGV2IiwidHlwZSI6Im1hc3Rlci5kZXYifQ.DAWRM4dCZJLj8QdZD9MTwSXR8eNNKDgNMaT3C5Ja_D4','2017-01-02 02:04:05','2017-01-02 07:32:11','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\User',2,NULL),(130,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6ImdERWVvQmVkbkIiLCJpc3MiOiJtYXN0ZXIuZGV2IiwidHlwZSI6Im1hc3Rlci5kZXYifQ.IYxbNPkWnerY4mFnmkijgCO5GwuEwzm18cf125Y82GU','2017-01-02 02:40:08','2017-01-17 05:47:00','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',1,NULL),(131,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6ImdERWVvQmVkbkIiLCJpc3MiOiIxOTIuMTY4LjEuMTA0IiwidHlwZSI6IjE5Mi4xNjguMS4xMDQifQ.tzJHhE2MWKWTuGMAyyonH5t06Ow_JpW-BQd3_7uCRG4','2017-01-04 09:24:07','2017-01-04 09:24:07','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','192.168.1.104',1,'App\\Models\\User',1,NULL),(132,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkJBbGVkRW5lREciLCJpc3MiOiJtYXN0ZXIuZGV2IiwidHlwZSI6Im1hc3Rlci5kZXYifQ.Arq8T8gINrnRsAccATFoY2K44Q0hiaWESVFKvlcxRas','2017-01-09 03:56:53','2017-01-09 03:56:53','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\User',24,NULL),(133,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkJBbGVkRW5lREciLCJpc3MiOiJhcGkubWFzdGVyLmRldiIsInR5cGUiOiJhcGkubWFzdGVyLmRldiJ9.ZH8zpXe9EjEs05TC-SgitfmaD3PCte727vIrSayxmyI','2017-01-10 00:16:17','2017-01-10 00:16:17','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\User',24,NULL),(134,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkRBZGVCQkRlQm8iLCJpc3MiOiJtYXN0ZXIuZGV2IiwidHlwZSI6Im1hc3Rlci5kZXYifQ.tmn_yWHLTnDHNFuN_pWqF4OsnKxNLOjBaCPYRzo3URE','2017-01-10 06:51:39','2017-01-17 05:20:22','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:50.0) Gecko/20100101 Firefox/50.0','127.0.0.1',1,'App\\Models\\User',25,NULL),(135,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkRBZGVCQkRlQm8iLCJpc3MiOiJ3MnMubWFzdGVyLmRldiIsInR5cGUiOiJ3MnMubWFzdGVyLmRldiJ9.NJvVV1sIm1vsDZNcr4P9G4YcLbRGGXlF7r_MAdwzn4M','2017-01-13 06:01:21','2017-01-13 06:01:21','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\User',25,NULL);
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
INSERT INTO `audits` VALUES ('0059f71c-6636-44b7-bc1f-734d13d18caf',14,'App\\Models\\OrderBooking','{\"files_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','{\"files_info\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\"}','25','http://master.dev/order/14','127.0.0.1','2017-01-11 06:44:17','updated'),('0083bc0f-ea3e-4d9e-9c70-facf35fe9f0e',93,'App\\Models\\EmpSchedule','{\"id\":93,\"emp\":2,\"add_by\":2,\"date\":\"2017-01-27\"}','[]','24','http://master.dev/task/93','127.0.0.1','2017-01-09 03:57:32','deleted'),('0112b30f-53f2-4637-8171-7224e0163873',13,'App\\Models\\OrderBooking','{\"quote_ref\":\"gfg\",\"files_info\":\"[]\"}','{\"quote_ref\":\"test\",\"files_info\":\"[\\\"uploads\\\\\\/61b817333a5f29ecc9d586bc8b240ae7.txt\\\"]\"}','super_admin','http://master.dev/order/13','127.0.0.1','2017-01-18 04:57:33','updated'),('016804ca-12f5-4ab7-89ad-71b360006cee',50,'App\\Models\\Customer','{\"loc_lat\":\"33.3593113\",\"loc_lng\":\"-112.38215179999997\"}','{\"loc_lat\":12.126727028477,\"loc_lng\":77.4615982}','super_admin','http://master.dev/customer/50','127.0.0.1','2017-01-09 00:20:36','updated'),('0180e472-d23a-4b6d-8958-d136129e4afe',14,'App\\Models\\OrderBooking','{\"files_info\":\"[\\\"uploads\\\\\\/a4d45b69f5473648bfd7d2f134662e52.xlsx\\\"]\"}','{\"files_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','super_admin','http://master.dev/order/14','127.0.0.1','2017-01-18 04:56:44','updated'),('028e3947-06a5-4bb3-9fe7-5aba1e4f0f7d',8,'App\\Models\\User','{\"user_id\":8,\"role_id\":2,\"first_name\":\"Kali Dass\",\"last_name\":\"W2s\",\"user_pwd\":\"eyJpdiI6Ik44eFNEUEV1dmlmUDllbm1XdFR5SFE9PSIsInZhbHVlIjoiWXErT242WFhNN3F5Y09RdTJ0Z2ppdz09IiwibWFjIjoiZWZkODM3NTJkMTdhY2NmZWI0ZGRlMmZlMDY3NDJjNGJhZTMwMmZiMzA2ZGQzOTA5MmUwYWEzZWJkNmE4OTc0ZCJ9\",\"phone\":\"+919524609637\",\"city\":\"das\",\"street\":\"dass\",\"state\":\"tamil nadu\",\"zipcode\":\"600041\",\"email\":\"kalidass@way2smile.co\",\"is_active\":0,\"activated_on\":null,\"last_login\":null,\"country\":\"india\",\"phone_imei\":\"\",\"profile_image\":null}','[]','super_admin','http://master.dev/user/8','127.0.0.1','2017-01-09 02:04:28','deleted'),('02efe915-369f-4975-99f3-2c787172d11d',17,'App\\Models\\Master','{\"company_name\":\"gfg\",\"company_street\":\"chebba\",\"company_city\":\"djfhjd\",\"company_state\":\"dfjfhj\",\"company_zipcode\":\"fdjfh\",\"company_url\":\"http:\\/\\/www.dsds.con\",\"company_phone\":\"+447400503589\",\"company_desc\":\"fdjhfjdfdf\",\"company_id\":17,\"company_country\":\"fdjfhj\",\"company_pwd\":\"eyJpdiI6InBjNStLNTl6NW03VzRWS2VqWmw3Y0E9PSIsInZhbHVlIjoiU0tkZ1I3RURDYTZ3MWdCQ2NUWnFVS25kcFZwR2dseDl4aGRCOHpieGxoUkxsZ0JsTm1aRHVcL2lTTmEyTStXbWlGb0tHY0diWlpcL1wvMnYwa3NLM1ZxVThLdjZielpGMXJSdmhjY1llTEpnNFE9IiwibWFjIjoiN2IzNjMzNDc3ZTc5MDlmMWQyZWM1NWEwZWY3MDIwYTA1MDFiYWQyNjY0ZmJhMzE2YmY5NDU0OTAxY2YwNTk0MSJ9\",\"company_email\":\"gm@google.com\"}','[]','super_admin','http://master.dev/company/17','127.0.0.1','2017-01-12 08:40:24','deleted'),('03fa7cfe-c187-4413-bbec-876272680ed0',21,'App\\Models\\User','{\"user_id\":21,\"role_id\":3,\"first_name\":\"sdf\",\"last_name\":\"fdf\",\"user_pwd\":\"eyJpdiI6Ik02eitwK0hNTlVYcWZTRURnUTNcL3ZBPT0iLCJ2YWx1ZSI6ImhSWHJpaG5cL2dEMGRDYkJaXC9uZmtkZz09IiwibWFjIjoiMjNlZmVkOGI0ODFkMWViYTk5Y2UxY2FiMDhlNjJlYmUxZTcwNDY2ZDM5YzliMzRiODNhZDA2ZTE4YzI3ZmZkYiJ9\",\"phone\":\"+919524609638\",\"city\":\"djshfj\",\"street\":\"jsfjdf\",\"state\":\"djsfhj\",\"zipcode\":\"djsjd\",\"email\":\"djshj@gmail.c\",\"is_active\":0,\"activated_on\":null,\"last_login\":null,\"country\":\"djshj@gmail.c\",\"phone_imei\":\"csjc\",\"profile_image\":null}','[]','super_admin','http://master.dev/user/21','127.0.0.1','2017-01-08 23:49:20','deleted'),('04b5e4fc-c00b-44bc-be2d-eac700499c46',56,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/6d484452ce316651052a1c631f9b4d32.txt\\\"]\"}','super_admin','http://master.dev/customer/56','127.0.0.1','2017-01-18 05:43:49','updated'),('05f82c9b-a4f5-4a9f-b65f-403b028e0bf8',87,'App\\Models\\EmpSchedule','[]','{\"emp\":\"2\",\"date\":\"2017-01-06\",\"add_by\":1,\"id\":87}','1','http://master.dev/task','127.0.0.1','2017-01-06 08:32:17','created'),('06111c87-a4b1-4f98-b797-ed33068bc5bc',8,'App\\Models\\OrderBooking','{\"order_booking_id\":8,\"cust_id\":41,\"product_info\":null,\"quote_ref\":\"1\",\"po_num\":null,\"po_date\":\"2017-11-14\",\"ship_to\":\"1\",\"bil_to\":\"1\",\"remarks\":\"1\",\"files_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"emp_id\":24,\"order_date\":\"2015-05-01\"}','[]','super_admin','http://master.dev/order/8','127.0.0.1','2017-01-11 05:37:21','deleted'),('065e7f7f-e934-4e42-b588-c87b750dda9b',104,'App\\Models\\EmpSchedule','{\"date\":\"2017-01-26\"}','{\"date\":\"2017-01-27\"}','25','http://master.dev/task/104','127.0.0.1','2017-01-11 05:42:46','updated'),('0686be8e-225a-4f2b-8a86-1532386a7800',23,'App\\Models\\User','[]','{\"role_id\":\"3\",\"first_name\":\"gfg\",\"last_name\":\"gfg\",\"user_pwd\":\"eyJpdiI6InhZXC9cL0NLaUxmemJTM0tuN01OZlpBZz09IiwidmFsdWUiOiJMeFZjMFpDSlhOZEFPT3IrTVN1TThnPT0iLCJtYWMiOiJjMzI2ZWUwOWI1OWRlOTlhNmYzYzUwNWVmZGEzZWIxZmQyMjBhYTRhZGI3ZDc0MmU4ZjEyNDRlYzlhN2UyMGJmIn0=\",\"phone\":\"+919524609638\",\"city\":\"dsjkfhdj\",\"street\":\"fdfhd\",\"state\":\"fdjhfj\",\"zipcode\":\"dsfdg\",\"email\":\"dass.k@gmail.com\",\"country\":\"dsdh\",\"phone_imei\":\"\",\"is_active\":\"0\",\"user_id\":23}','super_admin','http://master.dev/user','127.0.0.1','2017-01-08 23:48:15','created'),('0862edb1-e0fe-4073-9200-e3a94cacba5a',25,'App\\Models\\User','{\"user_pwd\":\"eyJpdiI6IkNXbm5lSFlsU0dkUXhZZzBEQm5zOVE9PSIsInZhbHVlIjoiXC90Y0FUN3VESFg5TUI1M3ZBQVBVeEE9PSIsIm1hYyI6IjUwODZlYzFjNTFiN2QxNzYzYzgwNTVkMWIxMWRkY2E0Zjg0Mjc4MGFhZDczYTA2YzNlMDFmZmZiNTJlYjdmZmYifQ==\"}','{\"user_pwd\":\"eyJpdiI6IkRxV21iUE02M1YyUnB3cGNIQTBBb1E9PSIsInZhbHVlIjoiWXU4ZVExalFpZVo4MnVUWnFqUWxjQT09IiwibWFjIjoiYjYyMGZlNGI4NTIyYzQ2MzgxMzE2NTVlYTI1NGUwNDA5MzVjZjZjYmY3MjY4ZjY4NmNjMGQ2ZTgxOTViMTJkZiJ9\"}','super_admin','http://master.dev/user/25','127.0.0.1','2017-01-13 07:10:37','updated'),('08977329-3eec-47a8-bafc-8a05c1802873',24,'App\\Models\\OrderBooking','[]','{\"remarks\":\"you\",\"cust_id\":\"51\",\"quote_ref\":\"direct referal\",\"order_date\":\"2017-01-25\",\"po_num\":\"50000\",\"po_date\":\"2017-01-25\",\"ship_to\":\"thanks\",\"bil_to\":\"how\",\"emp_id\":25,\"files_info\":\"[]\",\"order_booking_id\":24}','25','http://master.dev/order','127.0.0.1','2017-01-11 06:49:46','created'),('09239da9-c7c1-47c0-ada9-2c6d52cafda0',16,'App\\Models\\User','{\"user_id\":16,\"role_id\":2,\"first_name\":\"fdffdfdfdfdf\",\"last_name\":\"http:\\/\\/www.s.com\",\"user_pwd\":\"eyJpdiI6Ik1NenpERG1GMTVjM0J1XC93emtSQklRPT0iLCJ2YWx1ZSI6ImZ6WEdwUmNCUXZBTW81MHpPNXJMRHc9PSIsIm1hYyI6IjAyYzEyMzQ3ZGQ3YzAzZmRmYTkwMTBjMjQ0OGIyMDQ3MjNiMjA2ZmQwZDAyYjE1OTA1YzAyYzdlYTIzMmJmMWUifQ==\",\"phone\":\"+919524609638\",\"city\":\"dsd\",\"street\":\"dss\",\"state\":\"dsf\",\"zipcode\":\"dfdf\",\"email\":\"kali@gmail.com\",\"is_active\":1,\"activated_on\":null,\"last_login\":null,\"country\":\"sfdf\",\"phone_imei\":\"dsf\",\"profile_image\":null}','[]','super_admin','http://master.dev/user/16','127.0.0.1','2017-01-09 02:04:24','deleted'),('0a1ce4aa-3302-4304-86e6-a4b6c32ddb81',2,'App\\Models\\User','{\"role_id\":1,\"user_pwd\":\"eyJpdiI6ImpBXC9cL3RcL0ZCSUdNalQ2RWtWeUhmblE9PSIsInZhbHVlIjoibmpDRnM2K3NkbjFZNHpqUkpEYXV2Zz09IiwibWFjIjoiOTIxY2E2YzIwYjFjNWY5YWU3M2UzZDQxN2JmYjA4MGQ3YzdmN2Y2YmIzZTBjNWJjZTkxYWVjZTU1NzA5NThmOCJ9\"}','{\"role_id\":\"3\",\"user_pwd\":\"eyJpdiI6ImpFZUZ4MWVZbWhjRVlOY0VBRGltY0E9PSIsInZhbHVlIjoiUUlqQU9LakdlZTQyQ3AwVytLd3FLUT09IiwibWFjIjoiMWU0OGFjM2MzZjk3YjNmMjIwNjgwN2MzMTBjYjgzZDdkN2Q2MDIxNTliYzA2YjkwMjc4M2Q2NWNiODljMGI5YyJ9\"}','super_admin','http://master.dev/user/2','127.0.0.1','2017-01-08 23:25:18','updated'),('0a4dbb08-167a-4c5a-9025-03222cba14ae',50,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\"}','{\"uploads\":\"[]\"}','super_admin','http://master.dev/customer/50','127.0.0.1','2017-01-09 00:16:50','updated'),('0c2e0e47-7a6b-4db1-81b2-ad55963c38b9',54,'App\\Models\\Customer','{\"contact_person\":\"fdfd\",\"pan\":\"fdf\",\"tin\":\"fdf\"}','{\"contact_person\":\"\",\"pan\":\"\",\"tin\":\"\"}','25','http://master.dev/customer/54','127.0.0.1','2017-01-12 00:57:01','updated'),('0cefda96-6891-462e-a7aa-f90afdb1d276',13,'App\\Models\\MarketIntelligence','[]','{\"desc\":\"chennai,india\",\"location\":\"chennai\",\"loc_lat\":13.0826802,\"loc_lng\":80.2707184,\"taken_by\":\"25\",\"upload\":\"[]\",\"id\":13}','25','http://master.dev/marketinfo','127.0.0.1','2017-01-11 01:56:12','created'),('0d51062e-8acf-4f5a-84e0-c92384546ac6',21,'App\\Models\\OrderBooking','[]','{\"remarks\":\"fdf\",\"cust_id\":\"53\",\"quote_ref\":\"fdf\",\"order_date\":\"2017-01-24\",\"po_num\":\"fdf\",\"po_date\":\"2017-01-16\",\"ship_to\":\"fdf\",\"bil_to\":\"fdf\",\"emp_id\":25,\"files_info\":\"[]\",\"order_booking_id\":21}','25','http://master.dev/order','127.0.0.1','2017-01-11 01:09:28','created'),('0dedba04-5415-4a88-b863-c0f5d679d928',17,'App\\Models\\Master','[]','{\"company_name\":\"gfg\",\"company_street\":\"chebba\",\"company_city\":\"djfhjd\",\"company_state\":\"dfjfhj\",\"company_zipcode\":\"fdjfh\",\"company_url\":\"http:\\/\\/www.dsds.con\",\"company_phone\":\"+447400503589\",\"company_desc\":\"fdjhfjdfdf\",\"company_country\":\"fdjfhj\",\"company_pwd\":\"eyJpdiI6InBjNStLNTl6NW03VzRWS2VqWmw3Y0E9PSIsInZhbHVlIjoiU0tkZ1I3RURDYTZ3MWdCQ2NUWnFVS25kcFZwR2dseDl4aGRCOHpieGxoUkxsZ0JsTm1aRHVcL2lTTmEyTStXbWlGb0tHY0diWlpcL1wvMnYwa3NLM1ZxVThLdjZielpGMXJSdmhjY1llTEpnNFE9IiwibWFjIjoiN2IzNjMzNDc3ZTc5MDlmMWQyZWM1NWEwZWY3MDIwYTA1MDFiYWQyNjY0ZmJhMzE2YmY5NDU0OTAxY2YwNTk0MSJ9\",\"company_email\":\"gm@google.com\",\"company_id\":17}','super_admin','http://master.dev/company','127.0.0.1','2017-01-12 08:29:11','created'),('0ea194cc-cf52-4ac6-b707-41d68fc9f807',23,'App\\Models\\OrderBooking','[]','{\"remarks\":\"fd\",\"cust_id\":\"53\",\"quote_ref\":\"fd\",\"order_date\":\"2017-01-24\",\"po_num\":\"dfd\",\"po_date\":\"2017-01-09\",\"ship_to\":\"fd\",\"bil_to\":\"fd\",\"emp_id\":25,\"files_info\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\"]\",\"order_booking_id\":23}','25','http://master.dev/order','127.0.0.1','2017-01-11 01:18:31','created'),('0fa2b489-53c5-4339-9b48-4e9e5ddebc5e',130,'App\\Models\\ApiAuth','{\"auth_model\":\"App\\\\Models\\\\SuperAdmin\"}','{\"auth_model\":\"App\\\\Models\\\\User\"}','1','http://master.dev/auth?api','127.0.0.1','2017-01-05 07:29:21','updated'),('0fb2efc1-e2ec-4632-8d07-091542f04088',24,'App\\Models\\User','{\"user_pwd\":\"eyJpdiI6Ik9aazNDdlNKdHVMdTFmSVdwTTJFRUE9PSIsInZhbHVlIjoiNXVWamQ3SEtLU2c5ZzRMcUxIcU5HQT09IiwibWFjIjoiYjAwMDMzNmYwOTIzMmY3M2NhZTMxYWI0NTMzOGNmN2YxMmVkNjY1MjU2MDU3YWY3NzBjNGY3YzdjNTEwNzA2MyJ9\",\"phone_imei\":\"4545\"}','{\"user_pwd\":\"eyJpdiI6Ik1hbmxsQzk0aEZuNmVvSWlHSnN1cFE9PSIsInZhbHVlIjoiNURlM081OXBPT0d3dkJcL0h4ZmVyM1E9PSIsIm1hYyI6IjM2NGJjNTI1MzZiZDNiNTQzNzQ4ZWFlNjVmZDkwNjg0ZjE4Y2U1NGZjOTVkMTE3OTgyMGMzYjYyYjlmNmUwYTQifQ==\",\"phone_imei\":\"\"}','super_admin','http://master.dev/user/24','127.0.0.1','2017-01-17 04:53:20','updated'),('10ad7fbc-4e7a-4482-a58e-489ac74a0e84',16,'App\\Models\\Market','[]','{\"comp_id\":3,\"comp_activity_id\":2,\"comp_remark\":\"1\",\"market_id\":10,\"id\":16}','25','http://master.dev/marketinfo/10','127.0.0.1','2017-01-12 00:59:00','created'),('11131a9d-08f6-4bc2-8d62-27bdf0e49249',1,'App\\Models\\VisitReport','{\"cust_id\":49}','{\"cust_id\":\"53\"}','25','http://master.dev/visit/1','127.0.0.1','2017-01-10 07:40:14','updated'),('12963d95-0a1e-471f-be9a-53719986169f',25,'App\\Models\\User','[]','{\"role_id\":\"2\",\"first_name\":\"Test sales\",\"last_name\":\"employee\",\"user_pwd\":\"eyJpdiI6IkNXbm5lSFlsU0dkUXhZZzBEQm5zOVE9PSIsInZhbHVlIjoiXC90Y0FUN3VESFg5TUI1M3ZBQVBVeEE9PSIsIm1hYyI6IjUwODZlYzFjNTFiN2QxNzYzYzgwNTVkMWIxMWRkY2E0Zjg0Mjc4MGFhZDczYTA2YzNlMDFmZmZiNTJlYjdmZmYifQ==\",\"phone\":\"+15123765678\",\"city\":\"chennai\",\"street\":\"dummy\",\"state\":\"tamilnadu\",\"zipcode\":\"678903\",\"email\":\"mk@mk.com\",\"country\":\"india\",\"phone_imei\":\"\",\"is_active\":\"1\",\"user_id\":25}','24','http://master.dev/user','127.0.0.1','2017-01-09 06:34:58','created'),('12a54040-2c08-4664-8cb0-d0e9c063258d',11,'App\\Models\\Market','[]','{\"comp_id\":3,\"comp_activity_id\":\"2\",\"comp_remark\":\"1\",\"market_id\":10,\"id\":11}','25','http://master.dev/marketinfo/10','127.0.0.1','2017-01-11 06:59:24','created'),('1466999b-e3a2-4e9b-b019-d8af6d2fa9c9',53,'App\\Models\\Customer','{\"address\":\"D8 Sangeeth apartments\",\"city\":\"chennai\",\"state\":\"tamilnadu\",\"country\":\"india\",\"loc_lat\":\"12.9967984\",\"loc_lng\":\"80.21287410000002\",\"district\":\"chennai\"}','{\"address\":\"fdf\",\"city\":\"sdf\",\"state\":\"fdf\",\"country\":\"fdf\",\"loc_lat\":13.082574628007,\"loc_lng\":74.83734301875,\"district\":\"fd\"}','super_admin','http://master.dev/customer/53','127.0.0.1','2017-01-10 05:37:51','updated'),('14d238b8-f6f8-4f6a-8f31-b0edee7e252f',56,'App\\Models\\Customer','{\"uploads\":\"[]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/5e31557a843b2aa23bdc68b614d5067c.txt\\\"]\"}','super_admin','http://master.dev/customer/56','127.0.0.1','2017-01-18 05:42:22','updated'),('1638b1e6-4c26-4c9b-abac-27bbcd3936e7',53,'App\\Models\\Customer','{\"loc_lat\":\"27.05963324479294\",\"loc_lng\":\"75.87378260000003\"}','{\"loc_lat\":27.18674906966,\"loc_lng\":80.586917365625}','super_admin','http://master.dev/customer/53','127.0.0.1','2017-01-10 02:10:06','updated'),('1934acb9-2988-48f5-a578-cc56103a231f',9,'App\\Models\\OrderBooking','{\"order_booking_id\":9,\"cust_id\":53,\"product_info\":null,\"quote_ref\":\"ds\",\"po_num\":\"fdg\",\"po_date\":\"2017-01-24\",\"ship_to\":\"gf\",\"bil_to\":\"gfg\",\"remarks\":null,\"files_info\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"emp_id\":25,\"order_date\":\"2017-01-26\"}','[]','super_admin','http://master.dev/order/9','127.0.0.1','2017-01-11 05:37:30','deleted'),('1a3a6427-ae13-47c9-8fdf-0539999b03ee',17,'App\\Models\\OrderBooking','[]','{\"remarks\":\"dsd\",\"cust_id\":\"51\",\"quote_ref\":\"ds\",\"order_date\":\"2017-01-16\",\"po_num\":\"dsd\",\"po_date\":\"2017-01-16\",\"ship_to\":\"dsd\",\"bil_to\":\"dsd\",\"emp_id\":25,\"files_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\",\"order_booking_id\":17}','25','http://master.dev/order','127.0.0.1','2017-01-11 01:04:30','created'),('1b803e1a-00a8-4711-b15a-572687f85a00',6,'App\\Models\\OrderBooking','{\"order_booking_id\":6,\"cust_id\":41,\"product_info\":null,\"quote_ref\":\"1\",\"po_num\":null,\"po_date\":\"2017-11-14\",\"ship_to\":\"1\",\"bil_to\":\"1\",\"remarks\":\"1\",\"files_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"emp_id\":24,\"order_date\":\"2015-05-01\"}','[]','25','http://master.dev/order/6','127.0.0.1','2017-01-11 01:17:27','deleted'),('1def4b94-0323-4f79-bc1c-908bcce28ae1',1,'App\\Models\\OrderBooking','{\"files_info\":\"[\\\\\\\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\\\\\\\", \\\\\\\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\\\\\\\"]\",\"emp_id\":1}','{\"files_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"emp_id\":24}','super_admin','http://master.dev/order/1','127.0.0.1','2017-01-10 01:23:33','updated'),('1e9193ff-dbe2-4d79-9b61-7dd1af41fe39',56,'App\\Models\\Customer','{\"tin\":\"tkjj\"}','{\"tin\":\"tkjjfdfd\"}','super_admin','http://master.dev/customer/56','127.0.0.1','2017-01-18 05:35:39','updated'),('1f204b47-7189-49e6-b131-f38c8a9bcc13',23,'App\\Models\\OrderBooking','{\"order_booking_id\":23,\"cust_id\":53,\"product_info\":null,\"quote_ref\":\"fd\",\"po_num\":\"dfd\",\"po_date\":\"2017-01-09\",\"ship_to\":\"fd\",\"bil_to\":\"fd\",\"remarks\":\"fd\",\"files_info\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\"]\",\"emp_id\":25,\"order_date\":\"2017-01-24\"}','[]','super_admin','http://master.dev/order/23','127.0.0.1','2017-01-11 05:37:27','deleted'),('1fe4662d-a69f-44f2-b5e1-5a7301e730d7',24,'App\\Models\\User','{\"user_pwd\":\"eyJpdiI6ImxGUUlYVDJyYnVabFJ6NVwvRGl3MVdnPT0iLCJ2YWx1ZSI6IlZyNTBhYVk0b1lHdmFjQ3dqVTJ5OXc9PSIsIm1hYyI6IjZkYjJlYmViYTBiN2NhYTY2Y2Q3YWViYTkyNDgxYjZmZTdlZTFlYTBlMGIzNWRkOTRmOGJhM2MyODJhOGZkNTcifQ==\",\"phone_imei\":\"94464646\"}','{\"user_pwd\":\"eyJpdiI6IkRvVHNNdHNwNkJvTzVqSkdTVHhCWWc9PSIsInZhbHVlIjoiV3IyTWVcL1hHaG9ON0RRWGJmXC9Ub1VBPT0iLCJtYWMiOiJmNjdjMDhhMTUxOTU4ZTJjMmY4Y2U2ZTg1Mjk3MTFmMThhNTliMjZjZDZmYTQ1N2IxMDk2YTc0ODhhN2MyNWQwIn0=\",\"phone_imei\":\"\"}','24','http://master.dev/user/24','127.0.0.1','2017-01-09 06:45:26','updated'),('235cf8ba-8d44-4bf8-bc8d-c83d19f06f0b',15,'App\\Models\\Master','{\"company_name\":\"fgfgW2S\",\"company_phone\":\"9524609638gfgghfdfdf\",\"company_pwd\":\"eyJpdiI6IlFYZXBYRlVSM3V4TGk2N2o5cVYxeWc9PSIsInZhbHVlIjoiXC8zWjdJQTBuZ3BZRlVjclFocm1ZNTFaM0p1ZzkrMDBDOVVwV0NaXC9sUXM0WVBLUXA5VksxNENcL2FUaVNaVUQ0cFdrSmpjemVJUVEwendpRkMycjBjWmZUVlJhNHpHRzVCUlhiZjkxdm9NamM9IiwibWFjIjoiZDlhODkzNmFlNTA5NzliMjExM2VmNDRkZDNiOTBjN2JiNjNlMmYxODdmMmIzOTEwOWU4MjhlOTgzYTNiY2NiNCJ9\"}','{\"company_name\":\"W2S\",\"company_phone\":\"+919524609638\",\"company_pwd\":\"eyJpdiI6ImFUd1FHNHBkZm1tazNaMWxqVDRsNmc9PSIsInZhbHVlIjoicnJpamtQd1Fza1FVS2Z5WFp2b1NSeHVTWUhzaGZINnZQaFl6QVV0YWhLV2JqSWlQMW80NmIxU1JuRHNXcTV1VnlvMjQwUmpxRkhNMmxVWFYyWURyZHVIUUxsWllPTWlUZmJEd0p4ckNjRkE9IiwibWFjIjoiMzJmNmFlNWUyZTVmMmExODMwMmJmZGIzMTQyZWRmMWYxZTI4YTA1ZDExM2QwM2ZmOTY4M2YzYjU4YWI4YTljZiJ9\"}','super_admin','http://master.dev/company/15','127.0.0.1','2017-01-09 02:26:07','updated'),('243fddfe-a78b-43f3-b84e-803e7122b05d',1,'App\\Models\\VisitReport','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','25','http://master.dev/visit/1','127.0.0.1','2017-01-16 04:41:34','updated'),('244e4a20-2b61-4e23-9e2a-32801182b551',19,'App\\Models\\OrderBooking','{\"order_booking_id\":19,\"cust_id\":53,\"product_info\":null,\"quote_ref\":\"fdf\",\"po_num\":\"fdf\",\"po_date\":\"2017-01-16\",\"ship_to\":\"fdf\",\"bil_to\":\"fdf\",\"remarks\":\"fdf\",\"files_info\":\"[]\",\"emp_id\":25,\"order_date\":\"2017-01-24\"}','[]','25','http://master.dev/order/19','127.0.0.1','2017-01-11 01:22:13','deleted'),('247f7fac-15bf-4cec-93ef-2fa9fd453f21',16,'App\\Models\\Master','[]','{\"company_name\":\"gfg\",\"company_street\":\"chebba\",\"company_city\":\"djfhjd\",\"company_state\":\"dfjfhj\",\"company_zipcode\":\"fdjfh\",\"company_url\":\"http:\\/\\/www.dsds.con\",\"company_phone\":\"+447400503589\",\"company_desc\":\"fdjhfjdfdf\",\"company_country\":\"fdjfhj\",\"company_pwd\":\"eyJpdiI6IkwxY3RtR3NxdDZPMzBKWVNXNU9qbXc9PSIsInZhbHVlIjoiXC9rbk1QSHc5Y1NodElwczNWbDRWK0M1UnpTRG5vR3pEenJqcXIyRkJsdUY2KzRoVWJSQVZcL0NSajVUWHgrc2JjUlhzTXJzOU1BeE15cFQxa3JCMnZIdUlZczZhdjlWVHpaTzl6Z1JWa0hSUT0iLCJtYWMiOiI5MzFiMGUyMzFkOWVjNjk1YTUyMThkODU1NjMwOGE3NmUxZGYzZDhkZGM4ZTBlNjczM2JjZTgwZmI2NWZiMjI0In0=\",\"company_email\":\"admin@sfa.com\",\"company_id\":16}','super_admin','http://master.dev/company','127.0.0.1','2017-01-12 08:28:35','created'),('24f7ab45-d3e3-4573-b2c5-2b009c979c92',50,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\"}','super_admin','http://master.dev/customer/50','127.0.0.1','2017-01-09 00:10:24','updated'),('254ddfa5-8f4f-42d1-a15a-1623423c4b68',16,'App\\Models\\OrderBooking','[]','{\"remarks\":\"ggf\",\"cust_id\":\"53\",\"quote_ref\":\"gfg\",\"order_date\":\"2017-01-16\",\"po_num\":\"gfg\",\"po_date\":\"2017-01-25\",\"ship_to\":\"gf\",\"bil_to\":\"gf\",\"emp_id\":25,\"files_info\":\"[]\",\"order_booking_id\":16}','25','http://master.dev/order','127.0.0.1','2017-01-11 01:03:26','created'),('259d09f3-a33a-4977-9eb7-9c3a41d1cbd0',53,'App\\Models\\Customer','{\"loc_lat\":\"43.2616211\",\"loc_lng\":\"0.9909701000000268\"}','{\"loc_lat\":27.059633244793,\"loc_lng\":75.8737826}','24','http://master.dev/customer/53','127.0.0.1','2017-01-10 00:08:26','updated'),('2718bb60-d3a5-42e0-9d59-5e084836af1a',1,'App\\Models\\VisitReport','{\"uploads\":\"[\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','25','http://master.dev/visit/1','127.0.0.1','2017-01-11 03:02:35','updated'),('283f94c6-9cfb-4feb-ba8a-baa71f9af24e',7,'App\\Models\\Market','[]','{\"comp_remark\":\"1\",\"market_id\":11,\"id\":7}','25','http://master.dev/marketinfo/11','127.0.0.1','2017-01-11 02:16:06','created'),('2a7bb298-6fa6-4d3b-bb06-80d8a6507c20',130,'App\\Models\\ApiAuth','{\"auth_model\":\"App\\\\Models\\\\SuperAdmin\"}','{\"auth_model\":\"App\\\\Models\\\\User\"}','1','http://master.dev/auth?api','127.0.0.1','2017-01-06 08:32:10','updated'),('2b4ca830-f566-4f96-8ef0-9ef2d1746fc6',13,'App\\Models\\Market','[]','{\"comp_id\":3,\"comp_activity_id\":\"2\",\"comp_remark\":\"1\",\"market_id\":10,\"id\":13}','25','http://master.dev/marketinfo/10','127.0.0.1','2017-01-11 07:00:47','created'),('2b68b01e-bc08-40d2-8ef0-7c0352c0fe92',103,'App\\Models\\EmpSchedule','{\"id\":103,\"emp\":25,\"add_by\":25,\"date\":\"2017-01-26\"}','[]','25','http://master.dev/task/103','127.0.0.1','2017-01-10 07:23:51','deleted'),('2bf37fa5-35fa-413e-bbfb-f571db930109',96,'App\\Models\\EmpSchedule','[]','{\"emp\":\"25\",\"date\":\"2017-01-24\",\"add_by\":24,\"id\":96}','24','http://master.dev/task','127.0.0.1','2017-01-09 08:23:58','created'),('2c52e48a-7b21-48c6-becd-4a46dbd7b1cb',8,'App\\Models\\MarketIntelligence','[]','{\"desc\":\"fdf\",\"location\":\"chennai\",\"loc_lat\":0,\"loc_lng\":0,\"taken_by\":\"25\",\"upload\":\"[]\",\"id\":8}','25','http://master.dev/marketinfo','127.0.0.1','2017-01-11 01:49:27','created'),('2e0ffa65-b856-4b3f-b29a-a0f064ebec40',15,'App\\Models\\OrderBooking','{\"order_booking_id\":15,\"cust_id\":53,\"product_info\":null,\"quote_ref\":\"fdf\",\"po_num\":\"gfgfg\",\"po_date\":\"2017-01-09\",\"ship_to\":\"gfg\",\"bil_to\":\"gfg\",\"remarks\":\"gfg\",\"files_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"emp_id\":25,\"order_date\":\"2017-01-23\"}','[]','25','http://master.dev/order/15','127.0.0.1','2017-01-11 02:55:47','deleted'),('2e6c5960-78fc-4cfb-add4-e9022b082b18',20,'App\\Models\\User','{\"user_id\":20,\"role_id\":2,\"first_name\":\"dfd\",\"last_name\":\"dhfd\",\"user_pwd\":\"eyJpdiI6Ik1VYTU4UVdcL3I0bmFwTjZBY2ZoQWJnPT0iLCJ2YWx1ZSI6Ind2RDBcL0R3KzBQNUNQMGVKdFwvQjR1UT09IiwibWFjIjoiZTQ2ZmU3ZTM2ZDc5M2NmNzY2ZTNlMTIwNDFkN2YwM2I5ZWJmMWIzZjQyODkyOGM5NjEzYjMxZmE3YWY2MGIyMiJ9\",\"phone\":\"+919524609638\",\"city\":\"dsh\",\"street\":\"sdfhdjf\",\"state\":\"djsfhdj\",\"zipcode\":\"fdsjhfj\",\"email\":\"jfdjf@g.cm\",\"is_active\":1,\"activated_on\":null,\"last_login\":null,\"country\":\"jsfhjd\",\"phone_imei\":\"dsjj\",\"profile_image\":null}','[]','super_admin','http://master.dev/user/20','127.0.0.1','2017-01-08 23:49:22','deleted'),('30050219-5f82-4abc-b75b-84952f962e36',51,'App\\Models\\Customer','{\"tin\":\"dsd\"}','{\"tin\":\"\"}','super_admin','http://master.dev/customer/51','127.0.0.1','2017-01-17 07:55:41','updated'),('3346bdf3-497c-4e9a-92cf-1903489db635',15,'App\\Models\\Market','[]','{\"comp_id\":2,\"comp_activity_id\":2,\"comp_remark\":\"1\",\"market_id\":10,\"id\":15}','25','http://master.dev/marketinfo/10','127.0.0.1','2017-01-12 00:59:00','created'),('33d87aeb-bb9b-44fd-9056-97fd8e25b156',5,'App\\Models\\OrderBooking','{\"order_booking_id\":5,\"cust_id\":41,\"product_info\":null,\"quote_ref\":\"1\",\"po_num\":null,\"po_date\":\"2017-11-14\",\"ship_to\":\"1\",\"bil_to\":\"1\",\"remarks\":\"1\",\"files_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"emp_id\":24,\"order_date\":\"2015-05-01\"}','[]','25','http://master.dev/order/5','127.0.0.1','2017-01-11 01:17:25','deleted'),('34259183-ad54-4679-b122-2bed0280b998',15,'App\\Models\\OrderBooking','[]','{\"remarks\":\"gfg\",\"cust_id\":\"53\",\"quote_ref\":\"fdf\",\"order_date\":\"2017-01-23\",\"po_num\":\"gfgfg\",\"po_date\":\"2017-01-09\",\"ship_to\":\"gfg\",\"bil_to\":\"gfg\",\"emp_id\":25,\"files_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"order_booking_id\":15}','25','http://master.dev/order','127.0.0.1','2017-01-11 01:02:43','created'),('3469a285-783b-4fe3-bb88-9aaca2816f9e',50,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','super_admin','http://master.dev/customer/50','127.0.0.1','2017-01-09 00:12:55','updated'),('36a6e78a-973d-4646-a842-02d7aaffc629',16,'App\\Models\\User','[]','{\"role_id\":\"2\",\"first_name\":\"fdffdfdfdfdf\",\"last_name\":\"http:\\/\\/www.s.com\",\"user_pwd\":\"eyJpdiI6Ik1NenpERG1GMTVjM0J1XC93emtSQklRPT0iLCJ2YWx1ZSI6ImZ6WEdwUmNCUXZBTW81MHpPNXJMRHc9PSIsIm1hYyI6IjAyYzEyMzQ3ZGQ3YzAzZmRmYTkwMTBjMjQ0OGIyMDQ3MjNiMjA2ZmQwZDAyYjE1OTA1YzAyYzdlYTIzMmJmMWUifQ==\",\"phone\":\"+919524609638\",\"city\":\"dsd\",\"street\":\"dss\",\"state\":\"dsf\",\"zipcode\":\"dfdf\",\"email\":\"kali@gmail.com\",\"country\":\"sfdf\",\"phone_imei\":\"dsf\",\"is_active\":\"1\",\"user_id\":16}','super_admin','http://master.dev/user','127.0.0.1','2017-01-08 23:40:13','created'),('373bdf0e-e7ef-4e8d-9472-5c962f8dbe5c',5,'App\\Models\\MarketIntelligence','{\"id\":5,\"upload\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"desc\":\"sf\",\"location\":\"chennai\",\"loc_lat\":\"39.9129412\",\"loc_lng\":\"-104.79560549999997\",\"taken_by\":25}','[]','25','http://master.dev/marketinfo/5','127.0.0.1','2017-01-11 01:53:05','deleted'),('37942311-1344-4cfe-918a-8a40284a1fbc',51,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3ce93d68e83be2be317ed5e790adba7f.txt\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3ce93d68e83be2be317ed5e790adba7f.txt\\\",\\\"uploads\\\\\\/bd358a0eb25156b44bd903378742350a.html\\\"]\"}','25','http://master.dev/customer/51','127.0.0.1','2017-01-16 09:19:46','updated'),('37a1fd53-753a-4c37-b38c-01479e35de7a',15,'App\\Models\\Master','{\"company_name\":\"W2S\",\"company_street\":\"dsds\",\"company_city\":\"0\",\"company_state\":\"0fd\",\"company_phone\":\"9524609638\",\"company_country\":\"fgfgfg243\",\"company_pwd\":\"eyJpdiI6Ikx4SVVBc0NPOTFOVWt4Y0x1Kzd2NWc9PSIsInZhbHVlIjoiWFRuRmJZWm9KbENmXC81OUJwc2dwVE11RTFscWJCXC9TazZYa0tibGE4dVdqcFZCTlR4enMxd1Y2QW5CaEtQOHphdDI0OWpoNklhXC9FcU9JQUYzZTBVYXdnVUg2OVlXM0Jram9IUGJ2ZXFVRVk9IiwibWFjIjoiMTUwNmE0MGVhY2M5YjA4ZTM4ZWYzY2ZiODc5NTYwZDQzNjg1YjA4ZDA5Y2FkYTM3Y2Y1YjhjMDc0NGUzY2Y2OCJ9\",\"company_email\":\"kalidafdfdfss@gmail.comdffdf\"}','{\"company_name\":\"W2Sgfg\",\"company_street\":\"dsdsgfg\",\"company_city\":\"0gfgfg\",\"company_state\":\"0fdgfg\",\"company_phone\":\"9524609638gfg\",\"company_country\":\"fgfgfg243gfg\",\"company_pwd\":\"eyJpdiI6IlwvZ2dsRlR6TDQ2TG9MNzVLVko4cEVnPT0iLCJ2YWx1ZSI6IkNCVlU2Ymw5OFRONEN6Z2tZSXFXSFhtS05SOTlSb3hxWUNiVHhxUzkwKzhXakZZM1R4cml4SzZuQTBvT1VsNW1XRkJvcVEwMVhOdSt3WThKaGkwNmR2QzUzOXpoS1QraW9KdXVcL09kWEp0RT0iLCJtYWMiOiJmOGRhNGVmY2U5ZjM0NmNkZjgwZDIwNzRmMDI2YTFjNDI3MjI5ZDA3YjRiNjlkZmUyYzBjNGM4YWZhZjU2ZDkzIn0=\",\"company_email\":\"kalidafdfdfss@gmail.comdffdffg\"}','super_admin','http://master.dev/company/15','127.0.0.1','2017-01-06 00:58:28','updated'),('388a0775-9c0c-4bce-955a-ccb9c2855f84',10,'App\\Models\\User','[]','{\"role_id\":\"2\",\"first_name\":\"Kali Dass\",\"last_name\":\"W2s\",\"user_pwd\":\"eyJpdiI6ImU0Z1VmNEc0SnlEZmFVVnZnazVpS2c9PSIsInZhbHVlIjoidUswXC9NODZhQTdDOVpoWUhibTRPS2c9PSIsIm1hYyI6ImQ5NjlhMmI3YWViZTc1NWRjNjhjMzM0NmJmNWFhNTIzNjM3MTYyYTQwMGZhOTMxM2YzYTJhZTA0YzczMmQ5MDAifQ==\",\"phone\":\"+919524609637\",\"city\":\"das\",\"street\":\"dass\",\"state\":\"tamil nadu\",\"zipcode\":\"600041\",\"email\":\"kalidass@way2sile.c\",\"country\":\"india\",\"phone_imei\":\"9524609638\",\"is_active\":\"0\",\"user_id\":10}','super_admin','http://master.dev/user','127.0.0.1','2017-01-08 23:31:09','created'),('39008247-e7b0-41ec-b892-c5d4d8f7cc22',53,'App\\Models\\Customer','{\"loc_lat\":\"13.082316748985118\",\"loc_lng\":\"80.27144667012942\"}','{\"loc_lat\":12.9967984,\"loc_lng\":80.2128741}','super_admin','http://master.dev/customer/53','127.0.0.1','2017-01-10 04:38:41','updated'),('39264bc1-033a-4797-87c1-29ff651caf1d',10,'App\\Models\\MarketIntelligence','{\"taken_by\":25}','{\"taken_by\":\"24\"}','super_admin','http://master.dev/marketinfo/10','127.0.0.1','2017-01-17 00:12:01','updated'),('397e3c02-a180-433b-87c3-d01bc827d478',19,'App\\Models\\OrderBooking','[]','{\"remarks\":\"fdf\",\"cust_id\":\"53\",\"quote_ref\":\"fdf\",\"order_date\":\"2017-01-24\",\"po_num\":\"fdf\",\"po_date\":\"2017-01-16\",\"ship_to\":\"fdf\",\"bil_to\":\"fdf\",\"emp_id\":25,\"files_info\":\"[]\",\"order_booking_id\":19}','25','http://master.dev/order','127.0.0.1','2017-01-11 01:08:06','created'),('3be8158b-77df-4276-a90a-8451022579ac',97,'App\\Models\\EmpSchedule','[]','{\"emp\":\"25\",\"date\":\"2017-01-26\",\"add_by\":24,\"id\":97}','24','http://master.dev/task','127.0.0.1','2017-01-09 08:28:34','created'),('3d729471-59b7-400f-b2c5-536aa13a2612',130,'App\\Models\\ApiAuth','{\"auth_user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36\"}','{\"auth_user_agent\":\"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:50.0) Gecko\\/20100101 Firefox\\/50.0\"}','25','http://master.dev/auth?api','127.0.0.1','2017-01-17 05:41:50','updated'),('3f334d83-1d1f-4c98-8b7f-e9d12ff191f9',96,'App\\Models\\EmpSchedule','{\"id\":96,\"emp\":25,\"add_by\":24,\"date\":\"2017-01-27\"}','[]','24','http://master.dev/task/96','127.0.0.1','2017-01-09 08:28:40','deleted'),('434043e3-cbc2-478c-aead-6cc65847170b',52,'App\\Models\\Customer','[]','{\"name\":\"w2s\",\"email\":\"kalidass@way2smile.co\",\"desc\":null,\"address\":\",\",\"city\":\",\",\"state\":\",\",\"zipcode\":\"600041\",\"loc_lat\":11.527181624018,\"loc_lng\":78.7200195,\"contact_person\":\"kali\",\"contact_no\":\"+919524609638\",\"country\":\"india\",\"pan\":\"dsd\",\"tin\":\"dsds\",\"location\":\"chennai\",\"emp_id\":\"16\",\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/61b817333a5f29ecc9d586bc8b240ae7.txt\\\",\\\"uploads\\\\\\/a4d45b69f5473648bfd7d2f134662e52.xlsx\\\"]\",\"district\":\",\",\"type\":null,\"id\":52}','super_admin','http://master.dev/customer','127.0.0.1','2017-01-09 00:38:29','created'),('4380bace-7fb1-4e67-baca-7071683b7d33',85,'App\\Models\\EmpSchedule','[]','{\"emp\":\"1\",\"date\":\"2017-01-06\",\"add_by\":2,\"id\":85}','2','http://master.dev/task','127.0.0.1','2017-01-06 02:22:08','created'),('451654b7-f9eb-475e-8cd2-b955ead1bffb',51,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3ce93d68e83be2be317ed5e790adba7f.txt\\\",\\\"uploads\\\\\\/bd358a0eb25156b44bd903378742350a.html\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3ce93d68e83be2be317ed5e790adba7f.txt\\\",\\\"uploads\\\\\\/bd358a0eb25156b44bd903378742350a.html\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/a4d45b69f5473648bfd7d2f134662e52.xlsx\\\"]\"}','25','http://master.dev/customer/51','127.0.0.1','2017-01-16 09:25:11','updated'),('4525411e-4bf2-4a97-90ab-3424703cc5fc',6,'App\\Models\\OrderBooking','[]','{\"remarks\":\"1\",\"cust_id\":41,\"quote_ref\":\"1\",\"order_date\":\"2015-05-01\",\"po_num\":null,\"po_date\":\"2017-11-14\",\"ship_to\":\"1\",\"bil_to\":\"1\",\"emp_id\":24,\"files_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"order_booking_id\":6}','super_admin','http://master.dev/order','127.0.0.1','2017-01-10 01:46:47','created'),('47676c5a-f869-47b2-9df2-36d70d0ab915',15,'App\\Models\\Master','{\"company_name\":\"W2Sgfghghgh\",\"company_phone\":\"9524609638gfg\",\"company_pwd\":\"eyJpdiI6IjhyWW9HK0h5dm1hbGh4VXRQdjhtTnc9PSIsInZhbHVlIjoiWURWWWhMb1lPSGFKNWRqWEFXUmJTNlpnZHJHdDRjMWxpem1mM0lFV04wdE8xOWJIK2tKZUcyZkw0aFd2QWU2UTI0ZHBZY0c5M1B6Q09aOWxSV0ZRQmxkb1h3c1ROS1VocURoRGFKUUU3aFU9IiwibWFjIjoiMzUzYzRkNDMwMjY4NDMxOWJiYWM3NjkyMjgxMzk2MjUyYmE3YjJjYzViZjg4ZGE1OTJiYzk1YTA3NTM2NzQ5MCJ9\"}','{\"company_name\":\"hghW2Sgfghghgh\",\"company_phone\":\"9524609638gfggh\",\"company_pwd\":\"eyJpdiI6ImlEYVdPdzNmUThcLzBaZ1JLazBSRUlBPT0iLCJ2YWx1ZSI6IkFEZ0U2c095SWl3YytzRHJNbjdndmZTMUxYRXFrMXNOWEcyQ2grQUlmRkZ3OEpES0pSRXZvZHdJVGhCTU0zNnhZWHF4aXVsMXRwMHlcL0YxV1hXUUpteFk2SHZic25oSktXcXY5dDNuZ1YwYz0iLCJtYWMiOiJjNTMzNTEyZjBmNTA2ZTNkMjRhZmNjYzQ4ODk5ODM3ZDgwNzliNWZhZmQwNDI1NzMwMjlkNzdkODg4MTFiMWI0In0=\"}','super_admin','http://master.dev/company/15','127.0.0.1','2017-01-06 01:34:13','updated'),('48c376e2-e816-4ef2-be04-daad04000a7e',21,'App\\Models\\User','[]','{\"role_id\":\"3\",\"first_name\":\"sdf\",\"last_name\":\"fdf\",\"user_pwd\":\"eyJpdiI6Ik02eitwK0hNTlVYcWZTRURnUTNcL3ZBPT0iLCJ2YWx1ZSI6ImhSWHJpaG5cL2dEMGRDYkJaXC9uZmtkZz09IiwibWFjIjoiMjNlZmVkOGI0ODFkMWViYTk5Y2UxY2FiMDhlNjJlYmUxZTcwNDY2ZDM5YzliMzRiODNhZDA2ZTE4YzI3ZmZkYiJ9\",\"phone\":\"+919524609638\",\"city\":\"djshfj\",\"street\":\"jsfjdf\",\"state\":\"djsfhj\",\"zipcode\":\"djsjd\",\"email\":\"djshj@gmail.c\",\"country\":\"djshj@gmail.c\",\"phone_imei\":\"csjc\",\"is_active\":\"0\",\"user_id\":21}','super_admin','http://master.dev/user','127.0.0.1','2017-01-08 23:45:11','created'),('49bdb106-64c0-472e-9a21-1cfde42814a2',9,'App\\Models\\Market','[]','{\"comp_id\":\"2\",\"comp_activity_id\":\"2\",\"comp_remark\":\"1\",\"market_id\":10,\"id\":9}','25','http://master.dev/marketinfo/10','127.0.0.1','2017-01-11 02:18:15','created'),('49cef30a-130e-4288-8791-3bebe220813b',18,'App\\Models\\OrderBooking','{\"order_booking_id\":18,\"cust_id\":53,\"product_info\":null,\"quote_ref\":\"fdf\",\"po_num\":\"fdf\",\"po_date\":\"2017-01-16\",\"ship_to\":\"fdf\",\"bil_to\":\"fdf\",\"remarks\":\"fdf\",\"files_info\":\"[]\",\"emp_id\":25,\"order_date\":\"2017-01-24\"}','[]','25','http://master.dev/order/18','127.0.0.1','2017-01-11 01:21:58','deleted'),('49f69246-75c8-4e47-b839-8ba245018fa2',14,'App\\Models\\OrderBooking','[]','{\"remarks\":\"gfg\",\"cust_id\":\"53\",\"quote_ref\":\"fdf\",\"order_date\":\"2017-01-23\",\"po_num\":\"gfgfg\",\"po_date\":\"2017-01-09\",\"ship_to\":\"gfg\",\"bil_to\":\"gfg\",\"emp_id\":25,\"files_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"order_booking_id\":14}','25','http://master.dev/order','127.0.0.1','2017-01-11 01:01:48','created'),('4afc2d5a-55b3-4c51-b805-d6fe4344d2b9',2,'App\\Models\\User','{\"role_id\":3,\"user_pwd\":\"eyJpdiI6InBWK1FcL3RteDRxa2hETHY5UWg2TFJ3PT0iLCJ2YWx1ZSI6IjZVcTE3WnZJNDI0YVROc09ZOWpTRVE9PSIsIm1hYyI6IjlhOWQxMWI0OTNlMDc3YTQwYmQxNTgzM2ZlMTI4YjlmMjNiNGNlY2I5YWZlZjRkNmI1YzIwZmIzZDQ4YWUzZWUifQ==\",\"phone_imei\":\"fdf\"}','{\"role_id\":\"1\",\"user_pwd\":\"eyJpdiI6ImpBXC9cL3RcL0ZCSUdNalQ2RWtWeUhmblE9PSIsInZhbHVlIjoibmpDRnM2K3NkbjFZNHpqUkpEYXV2Zz09IiwibWFjIjoiOTIxY2E2YzIwYjFjNWY5YWU3M2UzZDQxN2JmYjA4MGQ3YzdmN2Y2YmIzZTBjNWJjZTkxYWVjZTU1NzA5NThmOCJ9\",\"phone_imei\":\"\"}','super_admin','http://master.dev/user/2','127.0.0.1','2017-01-08 23:25:12','updated'),('4bc8a71b-bb8e-4e17-be2c-bec41ea4e455',51,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/61b817333a5f29ecc9d586bc8b240ae7.txt\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/61b817333a5f29ecc9d586bc8b240ae7.txt\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\"}','25','http://master.dev/customer/51','127.0.0.1','2017-01-16 09:52:59','updated'),('4ce4d7da-bfac-4b97-9add-5b7e9e8b239e',12,'App\\Models\\Market','[]','{\"comp_id\":2,\"comp_activity_id\":2,\"comp_remark\":\"1\",\"market_id\":10,\"id\":12}','25','http://master.dev/marketinfo/10','127.0.0.1','2017-01-11 07:00:47','created'),('4d564a57-d330-4bd1-9d68-cd6ec24d5687',6,'App\\Models\\MarketIntelligence','[]','{\"desc\":\"sf\",\"location\":\"chennai\",\"loc_lat\":39.9129412,\"loc_lng\":-104.7956055,\"taken_by\":\"25\",\"upload\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"id\":6}','25','http://master.dev/marketinfo','127.0.0.1','2017-01-11 01:32:51','created'),('4d75111c-5d1f-4722-bed2-af077d6a9fc0',4,'App\\Models\\Category','[]','{\"name\":\"hghg\",\"desc\":\"hgh\",\"id\":4}','super_admin','http://master.dev/category','127.0.0.1','2017-01-05 09:27:17','created'),('4e7890a9-98b2-47c4-9fb0-0dd1fdb1a55b',93,'App\\Models\\EmpSchedule','[]','{\"emp\":\"2\",\"date\":\"2017-01-27\",\"add_by\":\"2\",\"id\":93}','super_admin','http://master.dev/task','127.0.0.1','2017-01-09 03:36:49','created'),('4ee11ca1-1f73-41e8-983b-8bc53f91c1cc',51,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/10889252fa481b50d7484eb1e97837a6.jpeg\\\"]\"}','super_admin','http://master.dev/customer/51','127.0.0.1','2017-01-17 06:47:15','updated'),('4f361eb9-9ddc-4ebd-bd0e-7772541ebe6c',12,'App\\Models\\MarketIntelligence','[]','{\"desc\":\"chennai,india\",\"location\":\"chennai\",\"loc_lat\":0,\"loc_lng\":0,\"taken_by\":\"25\",\"upload\":\"[]\",\"id\":12}','25','http://master.dev/marketinfo','127.0.0.1','2017-01-11 01:55:56','created'),('4f95fe30-cab2-43ea-a6b1-dd0fea30c345',15,'App\\Models\\Master','{\"company_name\":\"W2S\",\"company_pwd\":\"eyJpdiI6ImwwYjIzSUhXazlURDEzNEdXaEl6UHc9PSIsInZhbHVlIjoiTmx0NkFNTXZIVlwvdHlEaDNlUTlINEg4RVJwV2NTQTRLamQzRzNFVnRYWTg1NW9rbDRaRDJ6U2JQcUZNaHp2aEhzazBmNTRYcCtpNkdYbUFETDRBVjZqZDlTeEwwT3phYTdGZUFna295VXU4PSIsIm1hYyI6IjViNWI4YWQyZGE5OThiYjlhOTExMmQ5MDJmZjRlMmI2ZmNjYWZmNmIzZTI3YzUyNDA0NGQ0NmJhNTQ5Y2I2OTkifQ==\"}','{\"company_name\":\"fgfgW2S\",\"company_pwd\":\"eyJpdiI6ImpyaE1zR0N5MzFCVmdIRDNvMU4zWUE9PSIsInZhbHVlIjoiWWs5SFVpNXE3UUZ1VnNkaW0rQ09ZZ0prbk9xaE8rbGdUNVFuUVdXSFh1Q2xEXC9BcHNMMnlnQ2dTeUo5a3ZcL0FpaXQxQVZcL0dBbElrMGlpU3hpeUY0MGJPS2xoYXpSTWc3eUU0TDhZXC9raFBFPSIsIm1hYyI6IjBiMDlmMGFhMmNjMzAxYWFlYWFjMWE1NWU2ODNiMWVmOWM3ODFhODk0ZmVhNTAxZTE0MGY3ZmEyOTI5OTA4NzgifQ==\"}','super_admin','http://master.dev/company/15','127.0.0.1','2017-01-06 06:32:06','updated'),('4fd367a5-3e1f-44d3-a710-659f65fcf630',50,'App\\Models\\Customer','[]','{\"name\":\"kalidass\",\"email\":\"dass.kali14@gmail.com\",\"desc\":\"dsd\",\"address\":\"dsd\",\"city\":\"dsd\",\"state\":\"dsd\",\"zipcode\":\"ds\",\"loc_lat\":33.3593113,\"loc_lng\":-112.3821518,\"contact_person\":\"dsd\",\"contact_no\":\"+919524609638\",\"country\":\"dsd\",\"pan\":\"dsd\",\"tin\":\"dsd\",\"location\":\"dsd\",\"emp_id\":\"17\",\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"district\":\"dsd\",\"type\":null,\"id\":50}','super_admin','http://master.dev/customer','127.0.0.1','2017-01-08 23:57:13','created'),('506613b9-0339-464c-ad67-4a173814b840',13,'App\\Models\\OrderBooking','{\"files_info\":\"[]\"}','{\"files_info\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','super_admin','http://master.dev/order/13','127.0.0.1','2017-01-18 04:59:39','updated'),('50efcad8-b942-4915-a5e3-0c1121e6db2d',4,'App\\Models\\Market','[]','{\"comp_remark\":\"1\",\"market_id\":11,\"id\":4}','25','http://master.dev/marketinfo/11','127.0.0.1','2017-01-11 02:10:33','created'),('52883ce4-c5be-4c87-9502-fb3520affc3b',9,'App\\Models\\OrderBooking','[]','{\"remarks\":null,\"cust_id\":\"53\",\"quote_ref\":\"ds\",\"order_date\":\"2017-01-26\",\"po_num\":\"fdg\",\"po_date\":\"2017-01-24\",\"ship_to\":\"gf\",\"bil_to\":\"gfg\",\"emp_id\":25,\"files_info\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"order_booking_id\":9}','25','http://master.dev/order','127.0.0.1','2017-01-11 00:48:12','created'),('554fa18f-676c-4e6e-8559-8de3e34194f7',23,'App\\Models\\User','{\"user_id\":23,\"role_id\":3,\"first_name\":\"gfg\",\"last_name\":\"gfg\",\"user_pwd\":\"eyJpdiI6InhZXC9cL0NLaUxmemJTM0tuN01OZlpBZz09IiwidmFsdWUiOiJMeFZjMFpDSlhOZEFPT3IrTVN1TThnPT0iLCJtYWMiOiJjMzI2ZWUwOWI1OWRlOTlhNmYzYzUwNWVmZGEzZWIxZmQyMjBhYTRhZGI3ZDc0MmU4ZjEyNDRlYzlhN2UyMGJmIn0=\",\"phone\":\"+919524609638\",\"city\":\"dsjkfhdj\",\"street\":\"fdfhd\",\"state\":\"fdjhfj\",\"zipcode\":\"dsfdg\",\"email\":\"dass.k@gmail.com\",\"is_active\":0,\"activated_on\":null,\"last_login\":null,\"country\":\"dsdh\",\"phone_imei\":\"\",\"profile_image\":null}','[]','super_admin','http://master.dev/user/23','127.0.0.1','2017-01-08 23:49:17','deleted'),('5693b4c5-7269-4fa0-ad28-a006f9010826',11,'App\\Models\\OrderBooking','[]','{\"remarks\":null,\"cust_id\":\"53\",\"quote_ref\":\"ds\",\"order_date\":\"2017-01-24\",\"po_num\":\"fdg\",\"po_date\":\"2017-01-24\",\"ship_to\":\"gf\",\"bil_to\":\"gfg\",\"emp_id\":25,\"files_info\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"order_booking_id\":11}','25','http://master.dev/order','127.0.0.1','2017-01-11 00:49:59','created'),('56e303f0-28fa-410c-917c-78939b06c117',105,'App\\Models\\EmpSchedule','[]','{\"emp\":\"24\",\"date\":\"2017-01-26\",\"add_by\":25,\"id\":105}','25','http://master.dev/task','127.0.0.1','2017-01-11 06:47:48','created'),('57be1500-4a8f-43da-9961-5211e66d6f3d',97,'App\\Models\\EmpSchedule','{\"id\":97,\"emp\":25,\"add_by\":24,\"date\":\"2017-01-26\"}','[]','24','http://master.dev/task/97','127.0.0.1','2017-01-09 08:28:38','deleted'),('57be6bd2-165c-4d34-8fc1-397eef4d72cf',15,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6ImFUd1FHNHBkZm1tazNaMWxqVDRsNmc9PSIsInZhbHVlIjoicnJpamtQd1Fza1FVS2Z5WFp2b1NSeHVTWUhzaGZINnZQaFl6QVV0YWhLV2JqSWlQMW80NmIxU1JuRHNXcTV1VnlvMjQwUmpxRkhNMmxVWFYyWURyZHVIUUxsWllPTWlUZmJEd0p4ckNjRkE9IiwibWFjIjoiMzJmNmFlNWUyZTVmMmExODMwMmJmZGIzMTQyZWRmMWYxZTI4YTA1ZDExM2QwM2ZmOTY4M2YzYjU4YWI4YTljZiJ9\"}','{\"company_pwd\":\"eyJpdiI6Ik1WbE15dmkzRkxxYTEyd3NOMmx4bEE9PSIsInZhbHVlIjoiNXA3K1JvQVJaYWIrSVphUG9ybFN2R1BmRGpkVFNCelgzVm1XTFBlZ1A0a3NkMk14eEJ1eGdGd2dzdVUrbWxQVVFwclBrUWViXC9cL0pxVktIWGtjMldNcmZSXC9HazgrUHBDQlptUTNMZExtdHM9IiwibWFjIjoiMTRjNmUyZTE3NzNiOGVhZWIwYTk2NzkwOTFiOTgyNGFiMjI4OGQxMDM1NDJmNGE2MjdlYWIwNTQ1NDA0YTg2ZSJ9\"}','super_admin','http://master.dev/company/15','127.0.0.1','2017-01-09 02:32:49','updated'),('594b0a47-d173-46bd-8d3a-120f5e49b13b',53,'App\\Models\\Customer','{\"uploads\":\"[]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/2242d6d0ea596fc457f04c50a5598a24.jpeg\\\"]\"}','super_admin','http://master.dev/customer/53','127.0.0.1','2017-01-18 04:15:31','updated'),('596053ab-91a8-4074-a39e-f5e5aa153889',2,'App\\Models\\User','{\"user_id\":2,\"role_id\":3,\"first_name\":\"manager\",\"last_name\":\"kitty\",\"user_pwd\":\"eyJpdiI6ImpFZUZ4MWVZbWhjRVlOY0VBRGltY0E9PSIsInZhbHVlIjoiUUlqQU9LakdlZTQyQ3AwVytLd3FLUT09IiwibWFjIjoiMWU0OGFjM2MzZjk3YjNmMjIwNjgwN2MzMTBjYjgzZDdkN2Q2MDIxNTliYzA2YjkwMjc4M2Q2NWNiODljMGI5YyJ9\",\"phone\":\"+919524609638\",\"city\":\"dsd\",\"street\":\"dsd\",\"state\":\"dsd\",\"zipcode\":\"dds\",\"email\":\"manager@sfa.com\",\"is_active\":1,\"activated_on\":null,\"last_login\":null,\"country\":\"fdf\",\"phone_imei\":\"\",\"profile_image\":null}','[]','super_admin','http://master.dev/user/10','127.0.0.1','2017-01-08 23:36:10','deleted'),('5ad5b8c5-44de-4252-bdba-b0627c18851c',17,'App\\Models\\User','[]','{\"role_id\":\"2\",\"first_name\":\"fdffdfdfdfdf\",\"last_name\":\"http:\\/\\/www.s.com\",\"user_pwd\":\"eyJpdiI6InYrZWh3elwvMjNvVlU0QkxHYkxuM21BPT0iLCJ2YWx1ZSI6IjMyNVhoWmpLNHpLdXdBejh4S0YzeGc9PSIsIm1hYyI6IjRkYjA2Y2RkZTYzNGU4MjIyMGM2M2NjZGQ1ZWQ2YjEzZGM0MzQ1ZWI3NTRkM2FkNmZlYzQ0NDc3MGUyMDdhMjYifQ==\",\"phone\":\"+919524609638\",\"city\":\"dsd\",\"street\":\"dss\",\"state\":\"dsf\",\"zipcode\":\"dfdf\",\"email\":\"ali@gmail.com\",\"country\":\"sfdf\",\"phone_imei\":\"dsf\",\"is_active\":\"1\",\"user_id\":17}','super_admin','http://master.dev/user','127.0.0.1','2017-01-08 23:41:00','created'),('5b818ea6-f992-46a2-9abc-724c362268d3',130,'App\\Models\\ApiAuth','{\"auth_user_agent\":\"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:50.0) Gecko\\/20100101 Firefox\\/50.0\"}','{\"auth_user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36\"}','2','http://master.dev/auth?api','127.0.0.1','2017-01-06 02:48:28','updated'),('5ca4085b-cac9-44c8-9867-a9ff42cf11b3',17,'App\\Models\\OrderBooking','{\"order_booking_id\":17,\"cust_id\":51,\"product_info\":null,\"quote_ref\":\"ds\",\"po_num\":\"dsd\",\"po_date\":\"2017-01-16\",\"ship_to\":\"dsd\",\"bil_to\":\"dsd\",\"remarks\":\"dsd\",\"files_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\",\"emp_id\":25,\"order_date\":\"2017-01-16\"}','[]','25','http://master.dev/order/17','127.0.0.1','2017-01-11 01:22:15','deleted'),('5dbe9b86-1f02-4dfe-a64a-0f894941408c',24,'App\\Models\\User','[]','{\"role_id\":\"3\",\"first_name\":\"Kali Dass\",\"last_name\":\"W2s\",\"user_pwd\":\"eyJpdiI6ImxGUUlYVDJyYnVabFJ6NVwvRGl3MVdnPT0iLCJ2YWx1ZSI6IlZyNTBhYVk0b1lHdmFjQ3dqVTJ5OXc9PSIsIm1hYyI6IjZkYjJlYmViYTBiN2NhYTY2Y2Q3YWViYTkyNDgxYjZmZTdlZTFlYTBlMGIzNWRkOTRmOGJhM2MyODJhOGZkNTcifQ==\",\"phone\":\"+919524609638\",\"city\":\"chennai\",\"street\":\"dsds\",\"state\":\"tamil nadu\",\"zipcode\":\"600041\",\"email\":\"dass@gmail.com\",\"country\":\"india\",\"phone_imei\":\"94464646\",\"is_active\":\"1\",\"user_id\":24}','super_admin','http://master.dev/user','127.0.0.1','2017-01-09 03:56:15','created'),('5eb70953-1355-4e89-a9a5-b31a44daf5de',104,'App\\Models\\EmpSchedule','[]','{\"emp\":\"25\",\"date\":\"2017-01-24\",\"add_by\":25,\"id\":104}','25','http://master.dev/task','127.0.0.1','2017-01-10 07:19:54','created'),('5ec3f3d7-cd0f-4326-a299-eb5f965324d3',15,'App\\Models\\Master','{\"company_name\":\"hghW2Sgfghghgh\",\"company_phone\":\"9524609638gfggh\",\"company_pwd\":\"eyJpdiI6ImlEYVdPdzNmUThcLzBaZ1JLazBSRUlBPT0iLCJ2YWx1ZSI6IkFEZ0U2c095SWl3YytzRHJNbjdndmZTMUxYRXFrMXNOWEcyQ2grQUlmRkZ3OEpES0pSRXZvZHdJVGhCTU0zNnhZWHF4aXVsMXRwMHlcL0YxV1hXUUpteFk2SHZic25oSktXcXY5dDNuZ1YwYz0iLCJtYWMiOiJjNTMzNTEyZjBmNTA2ZTNkMjRhZmNjYzQ4ODk5ODM3ZDgwNzliNWZhZmQwNDI1NzMwMjlkNzdkODg4MTFiMWI0In0=\"}','{\"company_name\":\"hghW2Sgfghghghfdfd\",\"company_phone\":\"9524609638gfgghfdfdf\",\"company_pwd\":\"eyJpdiI6InNzSVwvbkJXWlVVUWdqWmZuTVdYOWZBPT0iLCJ2YWx1ZSI6IlFDNWZYZlBzUE9zUmMyaDg4S0Z2aDVaV0hhU0ZSZHVoWVNhV0Z4UVdLb3pGU2xwM2FxSVcyQUhSZ1pYc21PdVh0U0lTcWZSTnBNTUhPN1M3cU9JVUJld00xbEJvcWVkS3dlMjlWcXpoXC9jST0iLCJtYWMiOiJjNjcyYTljYzI2OTg0YjlhZDA1YzZkMjViOGVlOWJjMjk4NzhjNWQ4MmMwOTYxY2RhNzdmZmI1MzZhN2NlNzY2In0=\"}','super_admin','http://master.dev/company/15','127.0.0.1','2017-01-06 01:35:13','updated'),('5ecf1419-3c05-4f5c-92f0-2d6cf4889606',5,'App\\Models\\User','{\"user_id\":5,\"role_id\":2,\"first_name\":\"Kali Dass\",\"last_name\":\"W2s\",\"user_pwd\":\"eyJpdiI6IkNmU05qM09SSUFxVlFKSDF3NkZaZFE9PSIsInZhbHVlIjoiSDA2QXdJTDJvWXI3cVRkK1pCeExGUT09IiwibWFjIjoiZmM5NWM5YjcxNDgzM2E1MzQ3M2QxMWUwMDBmYjIxOTUzN2FiNGYwM2NlYWI3YTE2MmY3NzIyNTJiY2EyYzc1MiJ9\",\"phone\":\"+919524609637\",\"city\":\"das\",\"street\":\"dass\",\"state\":\"tamil nadu\",\"zipcode\":\"600041\",\"email\":\"kalidass@way2smile.com\",\"is_active\":0,\"activated_on\":null,\"last_login\":null,\"country\":\"india\",\"phone_imei\":\"9524609638\",\"profile_image\":null}','[]','super_admin','http://master.dev/user/10','127.0.0.1','2017-01-08 23:36:12','deleted'),('5f0a217a-7eaa-4d57-9e8a-a5b0bdb06dd9',13,'App\\Models\\OrderBooking','{\"files_info\":\"[\\\"uploads\\\\\\/61b817333a5f29ecc9d586bc8b240ae7.txt\\\"]\"}','{\"files_info\":\"[]\"}','super_admin','http://master.dev/order/13','127.0.0.1','2017-01-18 04:58:48','updated'),('600165d1-0979-43d1-a591-a0401bf3b8ad',15,'App\\Models\\Master','{\"company_name\":\"hghW2Sgfghghghfdfd\",\"company_pwd\":\"eyJpdiI6InJ4UWhIa0F3S1FrNzlDXC9EXC9hRDVRZz09IiwidmFsdWUiOiJ6bVUzM2YzTmVcL1B5eHFadng0Zm94UFJjTndcL0N0RG1XNEF3eXU1TkZBRytsZEZwUlZiNWJwc3BlRlhxemhvY2pzZDRjWW5IYWxLTmhNN3FFdUQ5elVTRWU2N0tqVVNMSnVIdlVyY1hjbGFJPSIsIm1hYyI6IjVhYjY5MzQ3MTA2MTEwYzgzZTE4MjhmMWI2NWQ5YTdjNzA0NWM2ODZiZDZlMWUxYmIxOWUyOGYwZmNlY2JmMmEifQ==\"}','{\"company_name\":\"hghW2Sgfghghghfdfdfhfh\",\"company_pwd\":\"eyJpdiI6ImV1TTVwck52WXVMUmpKMVBmZTFFVGc9PSIsInZhbHVlIjoiak1xWXlmSWEwVkhqeXdYSGp4K1VKOFdwdXdcL1ZOVE5VeWtpR24rdXhyblo0ZnVhR1J6eTFuZWtjSVNCY1Zpa01zSnBQWTlZbnMzeGl5MTV2Y24waldYXC9rK1ByNFF6REJueHBwd05NMGx5ST0iLCJtYWMiOiJiYzQ4MWE2ZDZkZTFiNzhjN2Y5OTVmMzBhNTYwZTExZGVkMGU3NTE1OTllYzY3YzE1Y2E3MjcwNDFhYjJjNjY4In0=\"}','super_admin','http://master.dev/company/15','127.0.0.1','2017-01-06 03:08:56','updated'),('60e82429-5616-42f0-a7c1-cb420dba60db',51,'App\\Models\\Customer','{\"loc_lat\":\"20.428283\",\"loc_lng\":\"72.83973170000002\"}','{\"loc_lat\":20.46992143194989,\"loc_lng\":72.90476990419313}','25','http://master.dev/customer/51','127.0.0.1','2017-01-16 07:46:54','updated'),('6115b1d4-4f12-4625-a106-391c250516bb',53,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/2242d6d0ea596fc457f04c50a5598a24.jpeg\\\",\\\"uploads\\\\\\/10889252fa481b50d7484eb1e97837a6.jpeg\\\",\\\"uploads\\\\\\/3ce93d68e83be2be317ed5e790adba7f.txt\\\"]\"}','{\"uploads\":\"[]\"}','super_admin','http://master.dev/customer/53','127.0.0.1','2017-01-18 05:30:30','updated'),('612fc2b4-fddd-4dc4-bcf3-05e903bd6c32',51,'App\\Models\\Customer','{\"location\":\"\\\\jjkkkjkkjkjk\"}','{\"location\":\"\\\\jjkkkjkkjkjkjjhjhjhj\"}','super_admin','http://master.dev/customer/51','127.0.0.1','2017-01-17 03:40:04','updated'),('62ca897a-f2ba-442c-8aff-9f2143ac73e6',5,'App\\Models\\User','[]','{\"role_id\":\"2\",\"first_name\":\"Kali Dass\",\"last_name\":\"W2s\",\"user_pwd\":\"eyJpdiI6IkNmU05qM09SSUFxVlFKSDF3NkZaZFE9PSIsInZhbHVlIjoiSDA2QXdJTDJvWXI3cVRkK1pCeExGUT09IiwibWFjIjoiZmM5NWM5YjcxNDgzM2E1MzQ3M2QxMWUwMDBmYjIxOTUzN2FiNGYwM2NlYWI3YTE2MmY3NzIyNTJiY2EyYzc1MiJ9\",\"phone\":\"+919524609637\",\"city\":\"das\",\"street\":\"dass\",\"state\":\"tamil nadu\",\"zipcode\":\"600041\",\"email\":\"kalidass@way2smile.com\",\"country\":\"india\",\"phone_imei\":\"9524609638\",\"is_active\":\"0\",\"user_id\":5}','super_admin','http://master.dev/user','127.0.0.1','2017-01-08 23:27:31','created'),('64198c20-6b3a-45b2-a809-b3cfcde50651',20,'App\\Models\\OrderBooking','[]','{\"remarks\":\"fdf\",\"cust_id\":\"53\",\"quote_ref\":\"fdf\",\"order_date\":\"2017-01-24\",\"po_num\":\"fdf\",\"po_date\":\"2017-01-16\",\"ship_to\":\"fdf\",\"bil_to\":\"fdf\",\"emp_id\":25,\"files_info\":\"[]\",\"order_booking_id\":20}','25','http://master.dev/order','127.0.0.1','2017-01-11 01:08:40','created'),('651744d9-5516-4889-b05b-e1da52bb51e5',52,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/61b817333a5f29ecc9d586bc8b240ae7.txt\\\",\\\"uploads\\\\\\/a4d45b69f5473648bfd7d2f134662e52.xlsx\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','super_admin','http://master.dev/customer/52','127.0.0.1','2017-01-09 00:38:50','updated'),('651a9b6f-5eb7-4cfd-8c38-7654260ba6c2',49,'App\\Models\\Customer','{\"name\":\"kalidassdsd\"}','{\"name\":\"kalidassdsdgfgf\"}','super_admin','http://master.dev/customer/49','127.0.0.1','2017-01-06 00:10:01','updated'),('66a9c065-5a58-48ec-855c-13f092247627',18,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6IklTOE5PZWVGYkZTZEkzN0x4WU9rUkE9PSIsInZhbHVlIjoiSW16N09KVE5BdTUyeXlPdnlyRHlTRnowbHdiZ1MyXC9xM0s0ZFVlRDM3WlwvUWlqMklOVno1VmppT3pOdk91eGUrUUZhcDVZd1wveEhveTRSY0hyN1BlTnU0U09UTWpGOEU4YzB1YW1XMCs2Mmc9IiwibWFjIjoiYTljZWZjMjViZGE5ZTE3OGY1OTY4MTlmMzlmZWIwYTI3N2I2ODE1NGVlMTExYzdjYmFmNzNiMzBkYzk1M2IyZSJ9\"}','{\"company_pwd\":\"eyJpdiI6IndlTmRTV0JQamJLVEcwUkJCUmNMVmc9PSIsInZhbHVlIjoiQzE3QjR3QitGQ0RCcjFxUlNJOGREZmM2V1dqYWc5NUdURlVKZWFLSnVMblJTbDFZWkx2ZnV5dGF4S0FvSUtKMGgzZDJoVXhtaklEcE1hY1dHQkxFZGtRRm1kTEJXWWJCcFVxVEZsaDhkS3M9IiwibWFjIjoiNWRjNjM4NzE2MmViZGQ0YmI0ZjAxNzgxMzAwY2QyNjQ1MTVkZDU2ZDQxZTVkODE0NTlhMzY1OGJhZGU3YThlMSJ9\"}','super_admin','http://master.dev/company/18','127.0.0.1','2017-01-13 05:40:16','updated'),('66d06b6f-e48d-4137-9174-a56627ea3a9e',8,'App\\Models\\User','[]','{\"role_id\":\"2\",\"first_name\":\"Kali Dass\",\"last_name\":\"W2s\",\"user_pwd\":\"eyJpdiI6IlNZejFScHp6QkpMUlwvT0dobHhYbE53PT0iLCJ2YWx1ZSI6ImhFY2h5S3o2QzZXTWhaZ2FGcjE1Wnc9PSIsIm1hYyI6IjNiN2Y1N2JmNGNmMGRhMmJiOTFjZjE2ZTY3ZjA3NmQ3ZGY4NGM2ODk0YTE5YTJhMzUxOTRiYjAyZmVlY2JkOTQifQ==\",\"phone\":\"+919524609637\",\"city\":\"das\",\"street\":\"dass\",\"state\":\"tamil nadu\",\"zipcode\":\"600041\",\"email\":\"kalidass@way2smile.co\",\"country\":\"india\",\"phone_imei\":\"9524609638\",\"is_active\":\"0\",\"user_id\":8}','super_admin','http://master.dev/user','127.0.0.1','2017-01-08 23:29:58','created'),('678167b6-05f4-4b3c-a03c-620753e40a0a',22,'App\\Models\\OrderBooking','[]','{\"remarks\":\"fdf\",\"cust_id\":\"53\",\"quote_ref\":\"fd\",\"order_date\":\"2017-02-14\",\"po_num\":\"fdf\",\"po_date\":\"2017-01-24\",\"ship_to\":\"fd\",\"bil_to\":\"fd\",\"emp_id\":25,\"files_info\":\"[]\",\"order_booking_id\":22}','25','http://master.dev/order','127.0.0.1','2017-01-11 01:11:23','created'),('6789becf-8d92-424c-ba89-ca7fa9a67e3b',130,'App\\Models\\ApiAuth','{\"auth_model\":\"App\\\\Models\\\\User\"}','{\"auth_model\":\"App\\\\Models\\\\SuperAdmin\"}','super_admin','http://master.dev/auth?api','127.0.0.1','2017-01-06 00:42:04','updated'),('6833c935-0f98-4128-9555-3ffffcb33927',1,'App\\Models\\Competitor','{\"name\":\"alidsdsdsds\",\"desc\":\"gfg\",\"address\":\"gf\",\"loc_lat\":\"48.96833967428106\",\"loc_lng\":\"78.44648362499993\"}','{\"name\":\"alidsdsdsdsyty\",\"desc\":\"ytygfg\",\"address\":\"chennai,india\",\"loc_lat\":13.0826802,\"loc_lng\":80.2707184}','25','http://master.dev/competitor/1','127.0.0.1','2017-01-11 06:58:42','updated'),('69b81a9c-df9f-4284-a14d-0eedcf75658e',130,'App\\Models\\ApiAuth','{\"auth_model\":\"App\\\\Models\\\\User\"}','{\"auth_model\":\"App\\\\Models\\\\SuperAdmin\"}','super_admin','http://master.dev/auth?api','127.0.0.1','2017-01-05 05:47:09','updated'),('6d8a4d2b-0798-46d7-a93d-bc2474af3866',49,'App\\Models\\Customer','{\"emp_id\":1}','{\"emp_id\":\"17\"}','super_admin','http://master.dev/customer/49','127.0.0.1','2017-01-09 00:08:28','updated'),('6e175020-8a35-4437-a10c-a2e476d8da99',130,'App\\Models\\ApiAuth','{\"auth_model\":\"App\\\\Models\\\\SuperAdmin\"}','{\"auth_model\":\"App\\\\Models\\\\User\"}','1','http://master.dev/auth?api','127.0.0.1','2017-01-05 05:50:14','updated'),('71c773dd-e163-4c21-b15e-149c483f7517',2,'App\\Models\\MarketIntelligence','{\"id\":2,\"upload\":\"[]\",\"desc\":\"chennai\",\"location\":\"chennai,tamilnadu\",\"loc_lat\":\"39.9129412\",\"loc_lng\":\"-104.79560549999997\",\"taken_by\":1}','[]','super_admin','http://master.dev/marketinfo/2','127.0.0.1','2017-01-06 08:30:45','deleted'),('72cbd205-70de-47b0-9076-08a573d55200',17,'App\\Models\\User','{\"user_pwd\":\"eyJpdiI6InYrZWh3elwvMjNvVlU0QkxHYkxuM21BPT0iLCJ2YWx1ZSI6IjMyNVhoWmpLNHpLdXdBejh4S0YzeGc9PSIsIm1hYyI6IjRkYjA2Y2RkZTYzNGU4MjIyMGM2M2NjZGQ1ZWQ2YjEzZGM0MzQ1ZWI3NTRkM2FkNmZlYzQ0NDc3MGUyMDdhMjYifQ==\",\"phone_imei\":\"dsf\"}','{\"user_pwd\":\"eyJpdiI6ImZkOFowRUF1NGZ6dUlHV09TZm1CbUE9PSIsInZhbHVlIjoiU3l0eGxJUkgwZFB2aVJ4K1dzdkFkQT09IiwibWFjIjoiNzY1Y2MyYWNkMTg0NTBhOTJjMjczYTQyMWE2MzExYjRhMDQ0OTdhZGMwZmJiYWI0YTE1Y2IzMGRkOTYwZjc5YyJ9\",\"phone_imei\":\"\"}','super_admin','http://master.dev/user/17','127.0.0.1','2017-01-08 23:44:42','updated'),('73243ac4-719c-4012-a851-da9d059358ab',53,'App\\Models\\Customer','{\"uploads\":\"[]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/10889252fa481b50d7484eb1e97837a6.jpeg\\\"]\"}','super_admin','http://master.dev/customer/53','127.0.0.1','2017-01-18 04:13:53','updated'),('7486db8e-aae1-4c6e-a8b4-79e2175261c8',5,'App\\Models\\Activity','{\"name\":\"dfd\"}','{\"name\":\"Kali Dass\"}','25','http://master.dev/activity/5','127.0.0.1','2017-01-16 01:20:02','updated'),('74c23d33-0b88-4400-85f0-9ee5d9f95bb1',16,'App\\Models\\Master','{\"company_name\":\"Google\",\"company_street\":\"gatfdf\",\"company_city\":\"chenfdf\",\"company_zipcode\":\"600041fdf\",\"company_phone\":\"9524609638\",\"company_desc\":\"testfdf\",\"company_country\":\"72\",\"company_pwd\":\"eyJpdiI6Ikg5a2Vqb0JQVkx3QnliUlpQVlwvK2ZBPT0iLCJ2YWx1ZSI6Iks3SXFLZTlyanpHR2lEdnNDcGx6WWZrZ3dha3p2QVc4QmozZnFmS1VzTEhkZ1lTUHhqanBlWXIxUlwvb0NQbWIrVzM3b09jWVwvZ2JXcUNSaW10aVwvdldlZnU0SGpPN2t5eENiRFloTmNlMTBFPSIsIm1hYyI6IjVjNjJmNjhlM2E0NWM5ODZjNWNjMDk0ZjdkMzExMDJlOTdkZjE1NmU4MWQ1YjFhMDYxMjg0Nzk1MzI2ZTZjYzIifQ==\"}','{\"company_name\":\"Googlegf\",\"company_street\":\"gatfdfgfg\",\"company_city\":\"chenfdfgfg\",\"company_zipcode\":\"600041fdfgfg\",\"company_phone\":\"gfg9524609638\",\"company_desc\":\"gfgtestfdf\",\"company_country\":\"79\",\"company_pwd\":\"eyJpdiI6ImIyRDVBZE0wQWduN1pkNFwvUllUeUtRPT0iLCJ2YWx1ZSI6InZTZGRXellpdloxWmREeE1tTXlmaUJhOVVZTmR1Y0tZZm8zMjU4WE9sa0hPWnVEdkFUZUt5b2Q2cTBpbmdlWTRaM2VxTXpNXC9NeWd4VW9lN2drRGZYZTN5RmFjblJcLys1eURXc3JQdEdCQzQ9IiwibWFjIjoiNTFkZTBjYWE3NTRhMWJmMTY1YTVhNDM5OWU1NjJlZGNjNmQyMGQ0MDNhOGZhYTgyZDViZmYzNmM0ZGUzOTU1MiJ9\"}','super_admin','http://master.dev/company/16','127.0.0.1','2017-01-06 03:56:31','updated'),('74d06b31-ae8b-4eb2-970a-8becbc7531e2',99,'App\\Models\\EmpSchedule','[]','{\"emp\":\"24\",\"date\":\"2017-01-27\",\"add_by\":\"25\",\"id\":99}','super_admin','http://master.dev/task','127.0.0.1','2017-01-10 01:14:00','created'),('74ec3ccf-b408-4ffa-8c38-174956e8d06e',56,'App\\Models\\Customer','[]','{\"name\":\"ds\",\"email\":\"dass.kali14@gmail.com\",\"desc\":\"fdf\",\"address\":\"chennai\",\"city\":\"india\",\"state\":\"fd\",\"zipcode\":\"fdf\",\"loc_lat\":13.0826802,\"loc_lng\":80.27071840000008,\"contact_person\":\"kalidass\",\"contact_no\":\"+919524609638\",\"country\":\"fd\",\"pan\":\"thanks\",\"tin\":\"tkjj\",\"location\":\"chennai\",\"emp_id\":\"25\",\"uploads\":\"[]\",\"district\":\"fd\",\"type\":null,\"id\":56}','super_admin','http://master.dev/customer','127.0.0.1','2017-01-17 07:57:18','created'),('75cdb15a-f0c8-4971-a801-3e8492f0f4ed',24,'App\\Models\\OrderBooking','{\"order_date\":\"2017-01-25\"}','{\"order_date\":\"2017-01-26\"}','25','http://master.dev/order/24','127.0.0.1','2017-01-11 06:52:38','updated'),('785b9267-b1c7-48b6-9546-3fc51f356ae0',5,'App\\Models\\OrderBooking','[]','{\"remarks\":\"1\",\"cust_id\":41,\"quote_ref\":\"1\",\"order_date\":\"2015-05-01\",\"po_num\":null,\"po_date\":\"2017-11-14\",\"ship_to\":\"1\",\"bil_to\":\"1\",\"emp_id\":24,\"files_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"order_booking_id\":5}','super_admin','http://master.dev/order','127.0.0.1','2017-01-10 01:46:35','created'),('78bfea84-9b91-4ee7-9129-9f992b6790d0',9,'App\\Models\\User','{\"user_id\":9,\"role_id\":2,\"first_name\":\"Kali Dass\",\"last_name\":\"W2s\",\"user_pwd\":\"eyJpdiI6IkpHVkd3UFh1YlwvWHJwUG1SdXRmUHB3PT0iLCJ2YWx1ZSI6IlRYanlZQU04Q0lIbWtyMzVCUnJBaFE9PSIsIm1hYyI6Ijc1ZjMyYjhhODMwNTg4ODg5MDAxNTY3NzU1ZWFmZmE0ODliNzI5MTA1MzgwOThiYTVlZGI2MWFlZGFhNDcxOGUifQ==\",\"phone\":\"+919524609637\",\"city\":\"dasfdf\",\"street\":\"dass\",\"state\":\"tamil nadu\",\"zipcode\":\"600041\",\"email\":\"kalidass@way2smile.c\",\"is_active\":0,\"activated_on\":null,\"last_login\":null,\"country\":\"india\",\"phone_imei\":\"\",\"profile_image\":null}','[]','super_admin','http://master.dev/user/9','127.0.0.1','2017-01-08 23:37:48','deleted'),('791e180e-5bee-4013-a4a4-bcbed7db9f6e',24,'App\\Models\\OrderBooking','{\"emp_id\":25}','{\"emp_id\":\"24\"}','25','http://master.dev/order/24','127.0.0.1','2017-01-11 06:52:11','updated'),('797045c2-330f-4b5a-ba9b-ca9977063822',4,'App\\Models\\ProductOrder','[]','{\"product_id\":\"1\",\"pro_req_date\":\"2017-01-25\",\"pro_quantity\":\"dsd\",\"order_id\":9,\"id\":4}','25','http://master.dev/order/9','127.0.0.1','2017-01-11 01:27:39','created'),('79a559a7-e814-46a1-9eeb-5d802badf3eb',13,'App\\Models\\OrderBooking','{\"files_info\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\"}','{\"files_info\":\"[]\"}','24','http://master.dev/order/13','127.0.0.1','2017-01-11 08:50:35','updated'),('7ac6579e-60f3-4066-8652-2d1a5348b824',10,'App\\Models\\MarketIntelligence','{\"upload\":\"[]\"}','{\"upload\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','25','http://master.dev/marketinfo/10','127.0.0.1','2017-01-12 00:59:00','updated'),('7b92f79c-e8b0-4b0f-9733-37c4d34b13f2',50,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\"}','super_admin','http://master.dev/customer/50','127.0.0.1','2017-01-09 00:13:11','updated'),('7d383752-8ca0-4db2-83ae-dcab87f46901',17,'App\\Models\\Market','[]','{\"comp_id\":3,\"comp_activity_id\":2,\"comp_remark\":\"1\",\"market_id\":10,\"id\":17}','25','http://master.dev/marketinfo/10','127.0.0.1','2017-01-12 00:59:00','created'),('7dd440d7-a9c7-4b2b-bd08-c7ebce0ef3ad',24,'App\\Models\\OrderBooking','{\"cust_id\":51}','{\"cust_id\":\"54\"}','25','http://master.dev/order/24','127.0.0.1','2017-01-11 06:53:06','updated'),('7f67e3ff-5c89-4ba9-9a61-285d918df0ae',130,'App\\Models\\ApiAuth','{\"auth_model\":\"App\\\\Models\\\\User\"}','{\"auth_model\":\"App\\\\Models\\\\SuperAdmin\"}','super_admin','http://master.dev/auth?api','127.0.0.1','2017-01-06 08:56:49','updated'),('7fd84302-e741-4122-9ba4-f8268b631ae0',16,'App\\Models\\Master','{\"company_street\":\"gat\",\"company_city\":\"chen\",\"company_state\":\"tamil nadu\",\"company_zipcode\":\"600041\",\"company_desc\":\"test\",\"company_country\":\"india\",\"company_pwd\":\"eyJpdiI6IjBodGVHVGxkUlR3NkFlN1VkTkh2S0E9PSIsInZhbHVlIjoieUlRbFhhOUt4YTRsR3FLMjdkYXA4VUNMRnhHdDV5cTl4c3JLdWp1WG5LMGluckJpck9XV0c4bENnQjhrd3dUcWhISWNmOGk0Z3VuZEFkU3lTYWprUXhRb295QnA1OUlRUXpVb0U3b0tvQWM9IiwibWFjIjoiMDQ2NTJmZmNjZDkzNzBlNzZkY2JjMDExNjA0MmFiMDk1OWQxY2QxYjM2ODJjYWM4NmQxNmRlNmM4MTM2YzQ3NCJ9\"}','{\"company_street\":\"gatfdf\",\"company_city\":\"chenfdf\",\"company_state\":\"0\",\"company_zipcode\":\"600041fdf\",\"company_desc\":\"testfdf\",\"company_country\":\"72\",\"company_pwd\":\"eyJpdiI6Ikg5a2Vqb0JQVkx3QnliUlpQVlwvK2ZBPT0iLCJ2YWx1ZSI6Iks3SXFLZTlyanpHR2lEdnNDcGx6WWZrZ3dha3p2QVc4QmozZnFmS1VzTEhkZ1lTUHhqanBlWXIxUlwvb0NQbWIrVzM3b09jWVwvZ2JXcUNSaW10aVwvdldlZnU0SGpPN2t5eENiRFloTmNlMTBFPSIsIm1hYyI6IjVjNjJmNjhlM2E0NWM5ODZjNWNjMDk0ZjdkMzExMDJlOTdkZjE1NmU4MWQ1YjFhMDYxMjg0Nzk1MzI2ZTZjYzIifQ==\"}','super_admin','http://master.dev/company/16','127.0.0.1','2017-01-06 01:50:37','updated'),('81670168-c00c-4513-9c46-bd77f273b9c1',17,'App\\Models\\Master','[]','{\"company_name\":\"Master\",\"company_street\":\"thanks\",\"company_city\":\"sete\",\"company_state\":\"dsd\",\"company_zipcode\":\"dsf\",\"company_url\":\"http:\\/\\/api.master.dev\",\"company_phone\":\"9524609638\",\"company_desc\":\"d\",\"company_country\":\"71\",\"company_pwd\":\"eyJpdiI6IlwvV3BlVjFFb0JzU1ZuckY2NmZPVjhBPT0iLCJ2YWx1ZSI6InRScHVtT0pxNWc3bjBRM2ZDK3pXckpnZFFjU2ZremUxNVpmVUN1TGI5NndXeDRMdVRhNU52QVFuOFNJY2xLTGErMUF5MnV3eXpTNDZxazdLZjJ3SHVkUFVaY1l1SzVFZXRvM1N5MjZzaWFFPSIsIm1hYyI6ImQzNTU0Y2Q5NDRkNWU0OTliYjQxZGY5MGNkNjIwNjQzMWEyMTVkMTM0YzA2NjE1OWFiN2MxYzI5N2I3MDU1NjEifQ==\",\"company_email\":\"test@master.dev\",\"company_id\":17}','super_admin','http://master.dev/company','127.0.0.1','2017-01-05 06:41:03','created'),('8224730a-b71b-4f30-8c84-4bfff2a91afd',16,'App\\Models\\Master','{\"company_street\":\"gatfdfgfg\",\"company_city\":\"chenfdfgfg\",\"company_state\":\"0\",\"company_zipcode\":\"600041fdfgfg\",\"company_url\":\"http:\\/\\/google.com\",\"company_desc\":\"gfgtestfdf\",\"company_country\":\"79\",\"company_pwd\":\"eyJpdiI6ImIyRDVBZE0wQWduN1pkNFwvUllUeUtRPT0iLCJ2YWx1ZSI6InZTZGRXellpdloxWmREeE1tTXlmaUJhOVVZTmR1Y0tZZm8zMjU4WE9sa0hPWnVEdkFUZUt5b2Q2cTBpbmdlWTRaM2VxTXpNXC9NeWd4VW9lN2drRGZYZTN5RmFjblJcLys1eURXc3JQdEdCQzQ9IiwibWFjIjoiNTFkZTBjYWE3NTRhMWJmMTY1YTVhNDM5OWU1NjJlZGNjNmQyMGQ0MDNhOGZhYTgyZDViZmYzNmM0ZGUzOTU1MiJ9\",\"company_email\":\"kalidafdfdsdsddfss@gmail.com\"}','{\"company_street\":\"gatfdfgfgfdf\",\"company_city\":\"chenfdfgfgfdf\",\"company_state\":\"0fdf\",\"company_zipcode\":\"600041fdfgfgfdfhjh\",\"company_url\":\"http:\\/\\/google.comfdf\",\"company_desc\":\"gfgtestfdffdf\",\"company_country\":\"79fdf\",\"company_pwd\":\"eyJpdiI6Im82TTRxbitCaGJzTEJMcXJ3RWRKTWc9PSIsInZhbHVlIjoiTThHRmtEOHRKbGdLaFwvVW1qNFoxaHplTXQwRytXb0tsSCs4V0M5eExTY2NIYnRnMEh4UVNxK0tTdXJ1ZkNQc0dWVys1eVc4QkhaMDZNMGhvakNJWFN6UVpZUlM4MWVXT0k0Y3g1SVhEWDFrPSIsIm1hYyI6ImVjZjg2MTBmM2MyNGJkMTVjODIwODI4ODVmNWEyMjJkMjMwZjkwYWZiNjJhZTM0Nzg5YzgyNmUxM2Y4OTk3YzIifQ==\",\"company_email\":\"fdfkalidafdfdsdsddfss@gmail.com\"}','super_admin','http://master.dev/company/16','127.0.0.1','2017-01-06 04:29:48','updated'),('82d3a9a2-004b-4d1c-801f-66df25973679',130,'App\\Models\\ApiAuth','{\"auth_model\":\"App\\\\Models\\\\SuperAdmin\"}','{\"auth_model\":\"App\\\\Models\\\\User\"}','1','http://master.dev/auth?api','127.0.0.1','2017-01-05 08:14:32','updated'),('8317d5b5-8073-4e0e-ab88-258b155b04a2',130,'App\\Models\\ApiAuth','{\"auth_model\":\"App\\\\Models\\\\User\"}','{\"auth_model\":\"App\\\\Models\\\\SuperAdmin\"}','super_admin','http://master.dev/auth?api','127.0.0.1','2017-01-06 00:57:52','updated'),('832c3678-3989-4c24-9a0f-8e6bc7ae8725',53,'App\\Models\\Customer','{\"id\":53,\"name\":\"company one\",\"address\":\"fdf\",\"city\":\"sdf\",\"state\":\"fdf\",\"country\":\"fdf\",\"zipcode\":\"600042\",\"contact_person\":\"pratap\",\"contact_no\":\"+12345676879\",\"pan\":\"fdf\",\"tin\":\"df\",\"type\":null,\"email\":\"mk@mkone.com\",\"desc\":\"fdf\",\"loc_lat\":\"13.049465642592857\",\"loc_lng\":\"80.28141192744147\",\"district\":\"fd\",\"uploads\":\"[\\\"uploads\\\\\\/fd55617a0d8150a531bdcf396bb44cb9.txt\\\"]\",\"location\":\"south\",\"emp_id\":25}','[]','super_admin','http://master.dev/customer/53','127.0.0.1','2017-01-18 05:35:15','deleted'),('84e396e4-b850-4136-98b6-9b6bde9959fb',19,'App\\Models\\User','{\"user_id\":19,\"role_id\":3,\"first_name\":\"gf\",\"last_name\":\"ggfg\",\"user_pwd\":\"eyJpdiI6IkNPNkdqUHJuZ3l2MU9hV082N2lUdWc9PSIsInZhbHVlIjoiY3ZIdUtmZjNmOXN4R0RpeUtTRE9cL3c9PSIsIm1hYyI6ImM0ZjBkMTNhM2M4YzliOTM0Y2VlMjU3Yjc4MDE3ZTBkMmQyYjUxNTcwZDRlMmUyODc3Njk3ZDgxZTAzNGEwZGUifQ==\",\"phone\":\"+919524609638\",\"city\":\"sfd\",\"street\":\"ds\",\"state\":\"fd\",\"zipcode\":\"fdfd\",\"email\":\"kalidass@g.com\",\"is_active\":1,\"activated_on\":null,\"last_login\":null,\"country\":\"sfs\",\"phone_imei\":\"fdf\",\"profile_image\":null}','[]','super_admin','http://master.dev/user/19','127.0.0.1','2017-01-09 02:04:20','deleted'),('853fd19d-8697-4056-96e8-3c7c87ce4407',6,'App\\Models\\MarketIntelligence','{\"id\":6,\"upload\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"desc\":\"sf\",\"location\":\"chennai\",\"loc_lat\":\"39.9129412\",\"loc_lng\":\"-104.79560549999997\",\"taken_by\":25}','[]','25','http://master.dev/marketinfo/6','127.0.0.1','2017-01-11 01:53:07','deleted'),('874fe023-0be0-41f4-aa69-c0310755b493',86,'App\\Models\\EmpSchedule','{\"id\":86,\"emp\":1,\"add_by\":2,\"date\":\"2017-01-06\"}','[]','1','http://master.dev/task/86','127.0.0.1','2017-01-06 08:32:21','deleted'),('89717320-eae9-4e51-bea7-672a5b4029e7',5,'App\\Models\\Activity','[]','{\"name\":\"dfd\",\"desc\":\"fdf\",\"id\":5}','25','http://master.dev/activity','127.0.0.1','2017-01-13 07:15:57','created'),('897a10f9-07c7-4cd3-9599-948ef526605b',18,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6ImZJXC84N0EyQmQ4cGZIVHIxajFEd0hRPT0iLCJ2YWx1ZSI6ImQ4aTBYN2ljWEswbUp4bW5oS09Wbzk4Wk5GenhJYVlQQW5VT1BRV013YjNoS3ZsNkp6QVNpWFUzdGlLOGR2dlA2WmRCV3VQXC8rWXJJeXBnajFEVnoyM0twcUlOeHZZY1hBMFl1dG5aT1YxZz0iLCJtYWMiOiJlODAxZjBjOGE0ODdiYzRmNzJhMjEwY2ExY2U0ZTI0MmYyZjIxNjg3ZDIwMTYwODViZjI4OTlmMGE5MWRjMjEzIn0=\"}','{\"company_pwd\":\"eyJpdiI6ImJOVllcL3R5Z2NLWjZSaHUrclZ2VFBBPT0iLCJ2YWx1ZSI6IkF5Q1UzTFJ4bDJWcVd6b2QrUWNuQWRDT05mMzZhK0NcL09vM0ErNUMraUJxQTBEcjdJRXpvUzhFTmtTS0ZDQUhxVmFac3dQMDhZUldIaGRMWVMrZFRxVVZpUk5TN201T1hEQnA1R25lQUo2WT0iLCJtYWMiOiI0NTRkOWRlMjZjOGM1YzI2OTY0NDVhNzZlYTYzZjEwZWFlYTFmNTU1ODZmMDYxZTRlYzdiMmFlMDYwMzBhMGM1In0=\"}','super_admin','http://master.dev/company/18','127.0.0.1','2017-01-17 06:45:55','updated'),('8aea5f08-0a0d-44bc-9a45-03b9d9fdf3a1',4,'App\\Models\\Activity','{\"id\":4,\"name\":\"kalidassgfgerdrdr\",\"desc\":\"sdsdshghgrdrdr\"}','[]','25','http://master.dev/activity/4','127.0.0.1','2017-01-11 05:47:51','deleted'),('8bdd1c5f-6f39-4463-a164-0aae8c3d094c',51,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\"}','25','http://master.dev/customer/51','127.0.0.1','2017-01-16 01:47:53','updated'),('8d1043ec-3da0-4361-b11a-372e5663cc94',51,'App\\Models\\Customer','{\"location\":\"\\\\\"}','{\"location\":\"\\\\jjk\"}','super_admin','http://master.dev/customer/51','127.0.0.1','2017-01-17 03:38:46','updated'),('8db65a3f-c8b8-47d3-980c-69c4bdbdd34c',18,'App\\Models\\Master','[]','{\"company_name\":\"hghW2Sgfghghghfdfdfhfhhgh\",\"company_street\":\"dsdsgfghgh\",\"company_city\":\"hgh0gfgfg\",\"company_state\":\"0hgh\",\"company_zipcode\":\"hgh`dsf\",\"company_url\":\"http:\\/\\/www.google.comhgh\",\"company_phone\":\"9524609638gfgghfdfdfhgh\",\"company_desc\":\"fdfdfdf\",\"company_country\":\"hgh3\",\"company_pwd\":\"eyJpdiI6IjNpMXZ6SVFZa3BxaXlcL3MrS1FcL0lRZz09IiwidmFsdWUiOiJHU0JZMWRqNXNSRmlmcjBBeWZVejdYR3JGWHBjVlFsY2xjOE5XVmVRdDFWK0dqSXVOcVdrcnUrNWxuU0cxU0tmczlIMXNlZ2tYVk9yZ0tIQlpYNEhuNW9IK1htWEJEMkU2VkFuV1psNTNKST0iLCJtYWMiOiJkYWI5NDU0ZDVjYTE3OWVhMTllN2ZiYmUwNjk5MzY2NGQ0NzcxOTFlOTRiOTUwMjg4NmRiYjY0YTZlZGRjOTZiIn0=\",\"company_email\":\"kalidafdfdfss@gmail.comdffdffghgh\",\"company_id\":18}','super_admin','http://master.dev/company','127.0.0.1','2017-01-06 03:09:10','created'),('8dfe6e81-5819-47d7-8ebf-4dc78e979a21',24,'App\\Models\\User','{\"user_pwd\":\"eyJpdiI6IkRvVHNNdHNwNkJvTzVqSkdTVHhCWWc9PSIsInZhbHVlIjoiV3IyTWVcL1hHaG9ON0RRWGJmXC9Ub1VBPT0iLCJtYWMiOiJmNjdjMDhhMTUxOTU4ZTJjMmY4Y2U2ZTg1Mjk3MTFmMThhNTliMjZjZDZmYTQ1N2IxMDk2YTc0ODhhN2MyNWQwIn0=\"}','{\"user_pwd\":\"eyJpdiI6IkhBT1NNcVJRRHNBZjNLRXcrNU1YRHc9PSIsInZhbHVlIjoia0ZvMW5NWTZEWUQ4NHVLQmhmUUJWZz09IiwibWFjIjoiNzYzNGU2MTRjMTZlMmQ4YmI3MzgzZDQ5ZWVhODk0ZmJhOWUwODdmZTM2NmY4OWI3ZmM3M2JkZTRlMDRmYWU0YyJ9\"}','24','http://master.dev/user/24','127.0.0.1','2017-01-09 06:53:06','updated'),('8e631f18-68bb-4590-ba91-d6624091237f',53,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/10889252fa481b50d7484eb1e97837a6.jpeg\\\"]\"}','{\"uploads\":\"[]\"}','super_admin','http://master.dev/customer/53','127.0.0.1','2017-01-18 04:14:10','updated'),('8ea59713-cad1-4829-8ad2-4cc28dcad042',22,'App\\Models\\User','[]','{\"role_id\":\"3\",\"first_name\":\"fdf\",\"last_name\":\"fdf\",\"user_pwd\":\"eyJpdiI6ImRnMFc2alp2STdWMUROU1dRVDdaaHc9PSIsInZhbHVlIjoiXC94dkM0c0VJclwveEI5YitoTmx6UUZnPT0iLCJtYWMiOiIwODQyNDI1NDU3NmQ1NDljOTI0Zjk5YzVlMmIxMmI5NDA1NDUzMzFjMmZmZTkyNTE0MTNhN2ZlZGFmZmE4N2M4In0=\",\"phone\":\"+919524609638\",\"city\":\"fdf\",\"street\":\"dsf\",\"state\":\"fd\",\"zipcode\":\"fd\",\"email\":\"dass.kali14@gmail.com\",\"country\":\"fdf\",\"phone_imei\":\"fdf\",\"is_active\":\"1\",\"user_id\":22}','super_admin','http://master.dev/user','127.0.0.1','2017-01-08 23:46:50','created'),('8f44c0ba-8a23-488c-a98c-ecf984b82b12',53,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/2242d6d0ea596fc457f04c50a5598a24.jpeg\\\",\\\"uploads\\\\\\/10889252fa481b50d7484eb1e97837a6.jpeg\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/2242d6d0ea596fc457f04c50a5598a24.jpeg\\\",\\\"uploads\\\\\\/10889252fa481b50d7484eb1e97837a6.jpeg\\\",\\\"uploads\\\\\\/3ce93d68e83be2be317ed5e790adba7f.txt\\\"]\"}','super_admin','http://master.dev/customer/53','127.0.0.1','2017-01-18 04:19:19','updated'),('8fbc718e-a770-484f-a8e0-fc9a8d3ffbd6',8,'App\\Models\\OrderBooking','[]','{\"remarks\":\"1\",\"cust_id\":41,\"quote_ref\":\"1\",\"order_date\":\"2015-05-01\",\"po_num\":null,\"po_date\":\"2017-11-14\",\"ship_to\":\"1\",\"bil_to\":\"1\",\"emp_id\":24,\"files_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"order_booking_id\":8}','super_admin','http://master.dev/order','127.0.0.1','2017-01-10 01:47:25','created'),('90813c54-7a7c-4ad7-80b9-e9df89585be0',51,'App\\Models\\Customer','{\"state\":\"dsd\"}','{\"state\":\"dsdfdf\"}','super_admin','http://master.dev/customer/51','127.0.0.1','2017-01-17 03:44:38','updated'),('9093e109-5760-4d0e-bc58-0ea21bd94595',15,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6Ik1WbE15dmkzRkxxYTEyd3NOMmx4bEE9PSIsInZhbHVlIjoiNXA3K1JvQVJaYWIrSVphUG9ybFN2R1BmRGpkVFNCelgzVm1XTFBlZ1A0a3NkMk14eEJ1eGdGd2dzdVUrbWxQVVFwclBrUWViXC9cL0pxVktIWGtjMldNcmZSXC9HazgrUHBDQlptUTNMZExtdHM9IiwibWFjIjoiMTRjNmUyZTE3NzNiOGVhZWIwYTk2NzkwOTFiOTgyNGFiMjI4OGQxMDM1NDJmNGE2MjdlYWIwNTQ1NDA0YTg2ZSJ9\"}','{\"company_pwd\":\"eyJpdiI6Ik5VQXNweDI0ekFiZGNrSkUwRFFNdWc9PSIsInZhbHVlIjoicWFIQ0pKRnpTZndMXC9wYkFRNjVScXJySTFQZXZoa0hUVUthb1wvZkdiRDlGdVwvSHByZmxFNkJsZjNTQmVBNm1YbnI0R0FiQ0RwdU1MZndBa21ua292TlhPbGdTQm93bVlEYUVVTTl4VUR4NTQ9IiwibWFjIjoiMzQ4YjQyZGU5ZWY2NTFkZDZlZGI0ODUwNjI2MzE2NzY1NjQyZmUwYjVkMmUxMmZkM2UxNmVkYjkyZjNiYjg5ZCJ9\"}','super_admin','http://master.dev/company/15','127.0.0.1','2017-01-12 07:50:57','updated'),('90f46d39-ffae-4df9-9d66-31a536d8a191',21,'App\\Models\\OrderBooking','{\"order_booking_id\":21,\"cust_id\":53,\"product_info\":null,\"quote_ref\":\"fdf\",\"po_num\":\"fdf\",\"po_date\":\"2017-01-16\",\"ship_to\":\"fdf\",\"bil_to\":\"fdf\",\"remarks\":\"fdf\",\"files_info\":\"[]\",\"emp_id\":25,\"order_date\":\"2017-01-24\"}','[]','25','http://master.dev/order/21','127.0.0.1','2017-01-11 02:55:50','deleted'),('9167e946-37e8-4ba2-adb4-d42d149ef824',130,'App\\Models\\ApiAuth','{\"auth_model\":\"App\\\\Models\\\\SuperAdmin\"}','{\"auth_model\":\"App\\\\Models\\\\User\"}','1','http://master.dev/auth?api','127.0.0.1','2017-01-06 00:56:42','updated'),('9416baf2-4850-4f0f-972b-b973dee9b4f7',51,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/61b817333a5f29ecc9d586bc8b240ae7.txt\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/61b817333a5f29ecc9d586bc8b240ae7.txt\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3ce93d68e83be2be317ed5e790adba7f.txt\\\"]\"}','25','http://master.dev/customer/51','127.0.0.1','2017-01-16 09:59:49','updated'),('94a57c3d-94c4-43c7-b2e6-0118a074dbcd',104,'App\\Models\\EmpSchedule','{\"date\":\"2017-01-27\"}','{\"date\":\"2017-01-28\"}','25','http://master.dev/task/104','127.0.0.1','2017-01-11 06:40:58','updated'),('9507fb12-6438-4be9-ad96-7cb8af6b5e5c',130,'App\\Models\\ApiAuth','{\"auth_model\":\"App\\\\Models\\\\User\"}','{\"auth_model\":\"App\\\\Models\\\\SuperAdmin\"}','super_admin','http://master.dev/auth?api','127.0.0.1','2017-01-06 00:59:52','updated'),('95a910d3-4dd3-4e8f-b211-41ac35609109',18,'App\\Models\\Master','{\"company_name\":\"hghW2Sgfghghghfdfdfhfhhgh\",\"company_street\":\"dsdsgfghgh\",\"company_city\":\"hgh0gfgfg\",\"company_state\":\"0hgh\",\"company_zipcode\":\"hgh`dsf\",\"company_url\":\"http:\\/\\/www.google.comhgh\",\"company_phone\":\"9524609638gfgghfdfdfhgh\",\"company_desc\":\"fdfdfdf\",\"company_id\":18,\"company_country\":\"hgh3\",\"company_pwd\":\"eyJpdiI6IjNpMXZ6SVFZa3BxaXlcL3MrS1FcL0lRZz09IiwidmFsdWUiOiJHU0JZMWRqNXNSRmlmcjBBeWZVejdYR3JGWHBjVlFsY2xjOE5XVmVRdDFWK0dqSXVOcVdrcnUrNWxuU0cxU0tmczlIMXNlZ2tYVk9yZ0tIQlpYNEhuNW9IK1htWEJEMkU2VkFuV1psNTNKST0iLCJtYWMiOiJkYWI5NDU0ZDVjYTE3OWVhMTllN2ZiYmUwNjk5MzY2NGQ0NzcxOTFlOTRiOTUwMjg4NmRiYjY0YTZlZGRjOTZiIn0=\",\"company_email\":\"kalidafdfdfss@gmail.comdffdffghgh\"}','[]','super_admin','http://master.dev/company/18','127.0.0.1','2017-01-06 03:14:52','deleted'),('9631d1d6-6760-41ba-8e1d-2d1c2ed928c4',12,'App\\Models\\OrderBooking','{\"order_booking_id\":12,\"cust_id\":53,\"product_info\":null,\"quote_ref\":\"ds\",\"po_num\":\"fdg\",\"po_date\":\"2017-01-25\",\"ship_to\":\"gf\",\"bil_to\":\"gfg\",\"remarks\":null,\"files_info\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"emp_id\":25,\"order_date\":\"2017-01-24\"}','[]','super_admin','http://master.dev/order/12','127.0.0.1','2017-01-11 05:37:33','deleted'),('96c40875-358e-4185-a5d8-b223006c5446',9,'App\\Models\\User','[]','{\"role_id\":\"2\",\"first_name\":\"Kali Dass\",\"last_name\":\"W2s\",\"user_pwd\":\"eyJpdiI6ImY1dTlybHZKbkpieSt2RDM0MzhiY1E9PSIsInZhbHVlIjoiNHpJelp1eTdDZEZ1VUNDZVF1dGI2QT09IiwibWFjIjoiNzQyNzQ5MTA4YmY3MzlmMDA5YzJkMGQ2ODliMzNjNjgwYjE0YWQ1NDRkMzNkZDRjY2QzNWViN2Q0MjAzMGI3ZiJ9\",\"phone\":\"+919524609637\",\"city\":\"das\",\"street\":\"dass\",\"state\":\"tamil nadu\",\"zipcode\":\"600041\",\"email\":\"kalidass@way2smile.c\",\"country\":\"india\",\"phone_imei\":\"9524609638\",\"is_active\":\"0\",\"user_id\":9}','super_admin','http://master.dev/user','127.0.0.1','2017-01-08 23:30:30','created'),('9728d8d3-6fb1-4fe1-87c5-8560d75b71be',17,'App\\Models\\User','{\"user_id\":17,\"role_id\":2,\"first_name\":\"fdffdfdfdfdf\",\"last_name\":\"http:\\/\\/www.s.com\",\"user_pwd\":\"eyJpdiI6ImZkOFowRUF1NGZ6dUlHV09TZm1CbUE9PSIsInZhbHVlIjoiU3l0eGxJUkgwZFB2aVJ4K1dzdkFkQT09IiwibWFjIjoiNzY1Y2MyYWNkMTg0NTBhOTJjMjczYTQyMWE2MzExYjRhMDQ0OTdhZGMwZmJiYWI0YTE1Y2IzMGRkOTYwZjc5YyJ9\",\"phone\":\"+919524609638\",\"city\":\"dsd\",\"street\":\"dss\",\"state\":\"dsf\",\"zipcode\":\"dfdf\",\"email\":\"ali@gmail.com\",\"is_active\":1,\"activated_on\":null,\"last_login\":null,\"country\":\"sfdf\",\"phone_imei\":\"\",\"profile_image\":null}','[]','super_admin','http://master.dev/user/17','127.0.0.1','2017-01-09 02:04:21','deleted'),('97d11704-01b9-4da5-8c8d-a066fa5f2925',4,'App\\Models\\MarketIntelligence','{\"id\":4,\"upload\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"desc\":\"chennai\",\"location\":\"chennai,tamilnadu\",\"loc_lat\":\"39.9129412\",\"loc_lng\":\"-104.79560549999997\",\"taken_by\":1}','[]','25','http://master.dev/marketinfo/4','127.0.0.1','2017-01-11 01:53:04','deleted'),('97f2e8bc-b920-48ff-9e50-fefe498101da',15,'App\\Models\\Master','{\"company_city\":\"df\",\"company_state\":\"fdf\",\"company_country\":\"13\",\"company_pwd\":\"eyJpdiI6InRWMEk0S0JWeWRnMW9vVFJjeVwvQ0p3PT0iLCJ2YWx1ZSI6IkNOUjhcL0UzYklWMWdGeWVTV1RVT0xGTXJYTUVVT1V3UEpiWTNIUEZ2UzVhOWNQeTRBMjRqM01RZHpDSmZFUUJNM2FENlphZzBJN2FhZ3FMNXp2RjN0TDFnNzl4NU9JQTh5U2pXQWl4cU9ETT0iLCJtYWMiOiI4MjY4OTA2MGY0NDVlNWYxNDQ3OWZmNzhiMzlkN2FhM2UwZjkwOTk4YjMwOWM5MzQ3ZjY5YTdiNjAwM2NhMzg0In0=\"}','{\"company_city\":\"434\",\"company_state\":\"434\",\"company_country\":31,\"company_pwd\":\"eyJpdiI6IlFYZXBYRlVSM3V4TGk2N2o5cVYxeWc9PSIsInZhbHVlIjoiXC8zWjdJQTBuZ3BZRlVjclFocm1ZNTFaM0p1ZzkrMDBDOVVwV0NaXC9sUXM0WVBLUXA5VksxNENcL2FUaVNaVUQ0cFdrSmpjemVJUVEwendpRkMycjBjWmZUVlJhNHpHRzVCUlhiZjkxdm9NamM9IiwibWFjIjoiZDlhODkzNmFlNTA5NzliMjExM2VmNDRkZDNiOTBjN2JiNjNlMmYxODdmMmIzOTEwOWU4MjhlOTgzYTNiY2NiNCJ9\"}','super_admin','http://master.dev/company/15','127.0.0.1','2017-01-06 10:17:50','updated'),('9849c8d6-f08d-4879-9add-e3ed80d4fe4a',56,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','super_admin','http://master.dev/customer/56','127.0.0.1','2017-01-18 05:43:20','updated'),('98dfa1e0-bb9c-4836-a067-5a0884eeb4b0',95,'App\\Models\\EmpSchedule','{\"emp\":25,\"date\":\"2017-01-28\"}','{\"emp\":\"24\",\"date\":\"2017-01-27\"}','25','http://master.dev/task/95','127.0.0.1','2017-01-10 07:04:37','updated'),('99575972-987b-4910-9728-3d345cd17c66',1,'App\\Models\\Activity','{\"id\":1,\"name\":\"kalidassgfgfdfdf244444444444444\",\"desc\":\"sdsdshghg\"}','[]','25','http://master.dev/activity/1','127.0.0.1','2017-01-11 05:47:49','deleted'),('99a1e1b4-de51-448b-a232-bba0838ed9f1',49,'App\\Models\\Customer','{\"loc_lat\":\"16.426328078619054\",\"loc_lng\":\"-5.22222499999998\",\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\",\"emp_id\":17}','{\"loc_lat\":12.340796817197,\"loc_lng\":77.0434,\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\",\"emp_id\":\"19\"}','super_admin','http://master.dev/customer/49','127.0.0.1','2017-01-09 00:20:24','updated'),('9c538e25-dd2b-4aec-8948-d1d750bc917c',24,'App\\Models\\User','{\"user_pwd\":\"eyJpdiI6ImtwU3NuNE9ZYys3UWg5M0FzUlhSWXc9PSIsInZhbHVlIjoieGZrUkRrek5wRVI1VzF2eE45cFZ6dz09IiwibWFjIjoiNmNiMzEwNTY2NjEwYTU5YmQ5NjIxZWJlOTVhYmU4MTRiOTNjYzVmZTJiZjhkYjJlYjU1N2Y4MDljNjgzZmI2NyJ9\",\"phone_imei\":\"\"}','{\"user_pwd\":\"eyJpdiI6Ik9aazNDdlNKdHVMdTFmSVdwTTJFRUE9PSIsInZhbHVlIjoiNXVWamQ3SEtLU2c5ZzRMcUxIcU5HQT09IiwibWFjIjoiYjAwMDMzNmYwOTIzMmY3M2NhZTMxYWI0NTMzOGNmN2YxMmVkNjY1MjU2MDU3YWY3NzBjNGY3YzdjNTEwNzA2MyJ9\",\"phone_imei\":\"4545\"}','24','http://master.dev/user/24','127.0.0.1','2017-01-09 06:53:15','updated'),('9e2c9d2a-1079-463c-9a0f-685e60095361',7,'App\\Models\\OrderBooking','{\"order_booking_id\":7,\"cust_id\":41,\"product_info\":null,\"quote_ref\":\"1\",\"po_num\":null,\"po_date\":\"2017-11-14\",\"ship_to\":\"1\",\"bil_to\":\"1\",\"remarks\":\"1\",\"files_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"emp_id\":24,\"order_date\":\"2015-05-01\"}','[]','25','http://master.dev/order/7','127.0.0.1','2017-01-11 01:17:21','deleted'),('9ea4a3e8-2bf6-4891-b5ec-0890fe6f59c1',51,'App\\Models\\Customer','{\"loc_lat\":\"20.46992143194989\",\"loc_lng\":\"72.90476990419313\",\"location\":\"dsd\"}','{\"loc_lat\":13.048718814297999,\"loc_lng\":80.18263829427644,\"location\":\"\\\\\"}','25','http://master.dev/customer/51','127.0.0.1','2017-01-16 09:35:58','updated'),('9f1fe511-a5fc-410a-969b-117d988b6ae5',50,'App\\Models\\Customer','{\"id\":50,\"name\":\"kalidass\",\"address\":\"dsd\",\"city\":\"dsd\",\"state\":\"dsd\",\"country\":\"dsd\",\"zipcode\":\"ds\",\"contact_person\":\"dsd\",\"contact_no\":\"+919524609638\",\"pan\":\"dsd\",\"tin\":\"dsd\",\"type\":null,\"email\":\"dass.kali14@gmail.com\",\"desc\":\"dsd\",\"loc_lat\":\"12.126727028477408\",\"loc_lng\":\"77.46159820000008\",\"district\":\"dsd\",\"uploads\":\"[]\",\"location\":\"dsd\",\"emp_id\":17}','[]','24','http://master.dev/customer/50','127.0.0.1','2017-01-09 03:59:45','deleted'),('a0aa8dc1-da36-42a0-b736-168712802286',94,'App\\Models\\EmpSchedule','{\"date\":\"2017-01-26\"}','{\"date\":\"2017-01-28\"}','24','http://master.dev/task/94','127.0.0.1','2017-01-09 03:58:22','updated'),('a1f5f30f-efef-461c-9bdc-269b64844919',20,'App\\Models\\User','[]','{\"role_id\":\"2\",\"first_name\":\"dfd\",\"last_name\":\"dhfd\",\"user_pwd\":\"eyJpdiI6Ik1VYTU4UVdcL3I0bmFwTjZBY2ZoQWJnPT0iLCJ2YWx1ZSI6Ind2RDBcL0R3KzBQNUNQMGVKdFwvQjR1UT09IiwibWFjIjoiZTQ2ZmU3ZTM2ZDc5M2NmNzY2ZTNlMTIwNDFkN2YwM2I5ZWJmMWIzZjQyODkyOGM5NjEzYjMxZmE3YWY2MGIyMiJ9\",\"phone\":\"+919524609638\",\"city\":\"dsh\",\"street\":\"sdfhdjf\",\"state\":\"djsfhdj\",\"zipcode\":\"fdsjhfj\",\"email\":\"jfdjf@g.cm\",\"country\":\"jsfhjd\",\"phone_imei\":\"dsjj\",\"is_active\":\"1\",\"user_id\":20}','super_admin','http://master.dev/user','127.0.0.1','2017-01-08 23:44:08','created'),('a3242fe4-506d-4a48-935e-6f5cce3951fe',8,'App\\Models\\User','{\"user_pwd\":\"eyJpdiI6IkRCWVpyeHk0RFpBY3J5TWE3eE02Qmc9PSIsInZhbHVlIjoiejBDK2VTdnFiM1V6NHBvbHFmMjFyQT09IiwibWFjIjoiNTQ1YWNiMTMxY2U1ZmZlMzY0OGZhZTQxZjliMWIzM2FmMGZhZDU2ZTExNTMwMGU1NGMzZDcyN2FiY2MyYjkzNiJ9\"}','{\"user_pwd\":\"eyJpdiI6Ik44eFNEUEV1dmlmUDllbm1XdFR5SFE9PSIsInZhbHVlIjoiWXErT242WFhNN3F5Y09RdTJ0Z2ppdz09IiwibWFjIjoiZWZkODM3NTJkMTdhY2NmZWI0ZGRlMmZlMDY3NDJjNGJhZTMwMmZiMzA2ZGQzOTA5MmUwYWEzZWJkNmE4OTc0ZCJ9\"}','super_admin','http://master.dev/user/8','127.0.0.1','2017-01-08 23:44:38','updated'),('a36c6cf2-8865-4ffb-baa3-ff0d2b31a4cd',94,'App\\Models\\EmpSchedule','{\"id\":94,\"emp\":24,\"add_by\":24,\"date\":\"2017-01-28\"}','[]','24','http://master.dev/task/94','127.0.0.1','2017-01-09 03:58:27','deleted'),('a3eb3ace-d587-4b1f-97e6-09af5d5e0940',86,'App\\Models\\EmpSchedule','[]','{\"emp\":\"1\",\"date\":\"2017-01-06\",\"add_by\":2,\"id\":86}','2','http://master.dev/task','127.0.0.1','2017-01-06 02:22:47','created'),('a424be6f-739c-4623-b063-012bf9b70ec0',3,'App\\Models\\Competitor','[]','{\"name\":\"fd\",\"address\":\"gfg\",\"loc_lat\":3.933889,\"loc_lng\":-53.125782,\"remark\":\"gfg\",\"desc\":\"gfg\",\"id\":3}','super_admin','http://master.dev/competitor','127.0.0.1','2017-01-10 01:02:32','created'),('a47c1726-1059-4fda-97a7-acd3df1c7ab3',1,'App\\Models\\OrderBooking','{\"order_booking_id\":1,\"cust_id\":41,\"product_info\":\"1\",\"quote_ref\":\"1\",\"po_num\":null,\"po_date\":\"0000-00-00\",\"ship_to\":\"1\",\"bil_to\":\"1\",\"remarks\":\"1\",\"files_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"emp_id\":24,\"order_date\":\"2015-05-01\"}','[]','25','http://master.dev/order/1','127.0.0.1','2017-01-11 01:24:57','deleted'),('a4e28edb-e1d5-48f5-babf-8ce6c986b6b5',51,'App\\Models\\Customer','{\"contact_person\":\"dsd\"}','{\"contact_person\":\"\"}','super_admin','http://master.dev/customer/51','127.0.0.1','2017-01-17 07:55:51','updated'),('a5a6ec7b-94b9-496f-967d-f3c5aecdc4d8',24,'App\\Models\\User','{\"user_pwd\":\"eyJpdiI6IkhBT1NNcVJRRHNBZjNLRXcrNU1YRHc9PSIsInZhbHVlIjoia0ZvMW5NWTZEWUQ4NHVLQmhmUUJWZz09IiwibWFjIjoiNzYzNGU2MTRjMTZlMmQ4YmI3MzgzZDQ5ZWVhODk0ZmJhOWUwODdmZTM2NmY4OWI3ZmM3M2JkZTRlMDRmYWU0YyJ9\"}','{\"user_pwd\":\"eyJpdiI6ImtwU3NuNE9ZYys3UWg5M0FzUlhSWXc9PSIsInZhbHVlIjoieGZrUkRrek5wRVI1VzF2eE45cFZ6dz09IiwibWFjIjoiNmNiMzEwNTY2NjEwYTU5YmQ5NjIxZWJlOTVhYmU4MTRiOTNjYzVmZTJiZjhkYjJlYjU1N2Y4MDljNjgzZmI2NyJ9\"}','24','http://master.dev/user/24','127.0.0.1','2017-01-09 06:53:09','updated'),('a6027d77-a052-48ab-871c-f0a7ed2c73cd',15,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6IlwvZ2dsRlR6TDQ2TG9MNzVLVko4cEVnPT0iLCJ2YWx1ZSI6IkNCVlU2Ymw5OFRONEN6Z2tZSXFXSFhtS05SOTlSb3hxWUNiVHhxUzkwKzhXakZZM1R4cml4SzZuQTBvT1VsNW1XRkJvcVEwMVhOdSt3WThKaGkwNmR2QzUzOXpoS1QraW9KdXVcL09kWEp0RT0iLCJtYWMiOiJmOGRhNGVmY2U5ZjM0NmNkZjgwZDIwNzRmMDI2YTFjNDI3MjI5ZDA3YjRiNjlkZmUyYzBjNGM4YWZhZjU2ZDkzIn0=\"}','{\"company_pwd\":\"eyJpdiI6IlFib1QxS3YwckFrNUw3bVQzckNaV0E9PSIsInZhbHVlIjoiYlwvcWZ1OElWNkpCWHdGWkMwXC9CWkpuWW1IdWs1V3R6Tzl5eHE4K2NmaGNKNGNvVng3WlMrWXlTazZKVUttNGJYeG1mZnRMYjRFV2NlZlpVRmw5QWRoOUp2QmdqaFZtNHhId08xSkg5eTJuRT0iLCJtYWMiOiI4ZTI0YTcwMjgyZWIyNjllODI5YTQwMjNmYWI2NDBlMDJjYjg2N2MwM2JiYmJlMGUxOTU1ZjM1MDFjYzg4MjIyIn0=\"}','super_admin','http://master.dev/company/15','127.0.0.1','2017-01-06 00:59:57','updated'),('a72e9b5f-6ae6-4b55-a7ce-2764c09f0ed6',10,'App\\Models\\Market','[]','{\"comp_id\":\"3\",\"comp_activity_id\":\"3\",\"comp_remark\":\"1\",\"market_id\":10,\"id\":10}','25','http://master.dev/marketinfo/10','127.0.0.1','2017-01-11 02:18:24','created'),('a87856ba-b585-45ed-9e01-2fa16ecaa6c4',5,'App\\Models\\ProductOrder','[]','{\"product_id\":\"1\",\"pro_req_date\":\"2017-01-13\",\"pro_quantity\":\"\",\"order_id\":24,\"id\":5}','25','http://master.dev/order/24','127.0.0.1','2017-01-13 03:07:48','created'),('a886a9a7-47de-4ad6-8540-fbf537417b50',15,'App\\Models\\Master','{\"company_state\":\"0fdgfg\",\"company_country\":\"fgfgfg243gfg\",\"company_pwd\":\"eyJpdiI6Im9iQ283U0NKWmc5YTR4QW5menVPbmc9PSIsInZhbHVlIjoiRUdTVEI1WlwvSTdoMG1LNEcrdmVjQWNIOXZNa09pcTdFN0FSd2s2c21Bb0tYaXJYcU1tb2pnbVdDXC9OOGVRTHBLV3pRbG1ndE92dmNnSjVCUFgwOFgyMnJka05FaFNpWVRlKzl6ODl3VjQ0UT0iLCJtYWMiOiIyNjg4MTFmNjQ4MTcwYTBkODUzOTVlMzU4OWI5NzFhMGM5NGFlYmU1MjNjOWM2MmFlYmFkNzU3MGVhNGU2ZGNiIn0=\"}','{\"company_state\":\"0\",\"company_country\":\"3\",\"company_pwd\":\"eyJpdiI6InJ4UWhIa0F3S1FrNzlDXC9EXC9hRDVRZz09IiwidmFsdWUiOiJ6bVUzM2YzTmVcL1B5eHFadng0Zm94UFJjTndcL0N0RG1XNEF3eXU1TkZBRytsZEZwUlZiNWJwc3BlRlhxemhvY2pzZDRjWW5IYWxLTmhNN3FFdUQ5elVTRWU2N0tqVVNMSnVIdlVyY1hjbGFJPSIsIm1hYyI6IjVhYjY5MzQ3MTA2MTEwYzgzZTE4MjhmMWI2NWQ5YTdjNzA0NWM2ODZiZDZlMWUxYmIxOWUyOGYwZmNlY2JmMmEifQ==\"}','super_admin','http://master.dev/company/15','127.0.0.1','2017-01-06 01:58:11','updated'),('a8e8565f-1dbf-43ee-a972-8a4c80914a7e',9,'App\\Models\\MarketIntelligence','{\"id\":9,\"upload\":\"[]\",\"desc\":\"fdf\",\"location\":\"fdf\",\"loc_lat\":\"0\",\"loc_lng\":\"0\",\"taken_by\":25}','[]','25','http://master.dev/marketinfo/9','127.0.0.1','2017-01-11 01:53:12','deleted'),('a94066b3-cd95-4bb1-a9d3-4e0e8dac8d5c',130,'App\\Models\\ApiAuth','{\"auth_user_agent\":\"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:50.0) Gecko\\/20100101 Firefox\\/50.0\"}','{\"auth_user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36\"}','super_admin','http://master.dev/auth?api','127.0.0.1','2017-01-05 09:27:45','updated'),('a94d9138-0da9-420b-9a1d-1a1ff237cc8a',2,'App\\Models\\User','{\"user_pwd\":\"eyJpdiI6IkRCSEkrd0NzT3Z0NHErMVo5YzZpRmc9PSIsInZhbHVlIjoibWplb09Uak44bHZZWUVoOGJzdVwvMUE9PSIsIm1hYyI6ImI5YmJlZDEwNGMxNDgxYmM2M2EyNmMwY2VmNTE3N2QwZGE2MDBiNTMxYTk0YWFmZmFhMGVkMDQ4MzVjNzQ4Y2IifQ==\",\"phone\":\"ds\",\"country\":null,\"phone_imei\":null}','{\"user_pwd\":\"eyJpdiI6InBWK1FcL3RteDRxa2hETHY5UWg2TFJ3PT0iLCJ2YWx1ZSI6IjZVcTE3WnZJNDI0YVROc09ZOWpTRVE9PSIsIm1hYyI6IjlhOWQxMWI0OTNlMDc3YTQwYmQxNTgzM2ZlMTI4YjlmMjNiNGNlY2I5YWZlZjRkNmI1YzIwZmIzZDQ4YWUzZWUifQ==\",\"phone\":\"+919524609638\",\"country\":\"fdf\",\"phone_imei\":\"fdf\"}','super_admin','http://master.dev/user/2','127.0.0.1','2017-01-08 23:25:03','updated'),('aadef95f-5258-4a9e-ac8a-81aa3a763c2c',19,'App\\Models\\User','[]','{\"role_id\":\"3\",\"first_name\":\"gf\",\"last_name\":\"ggfg\",\"user_pwd\":\"eyJpdiI6IkNPNkdqUHJuZ3l2MU9hV082N2lUdWc9PSIsInZhbHVlIjoiY3ZIdUtmZjNmOXN4R0RpeUtTRE9cL3c9PSIsIm1hYyI6ImM0ZjBkMTNhM2M4YzliOTM0Y2VlMjU3Yjc4MDE3ZTBkMmQyYjUxNTcwZDRlMmUyODc3Njk3ZDgxZTAzNGEwZGUifQ==\",\"phone\":\"+919524609638\",\"city\":\"sfd\",\"street\":\"ds\",\"state\":\"fd\",\"zipcode\":\"fdfd\",\"email\":\"kalidass@g.com\",\"country\":\"sfs\",\"phone_imei\":\"fdf\",\"is_active\":\"1\",\"user_id\":19}','super_admin','http://master.dev/user','127.0.0.1','2017-01-08 23:41:58','created'),('ab051a60-fe4c-45c6-b52b-71911c562b57',101,'App\\Models\\EmpSchedule','[]','{\"emp\":\"25\",\"date\":\"2017-01-26\",\"add_by\":25,\"id\":101}','25','http://master.dev/task','127.0.0.1','2017-01-10 06:57:29','created'),('ab523f88-22eb-4631-8e93-fc3aa9a621f7',18,'App\\Models\\Market','[]','{\"comp_id\":\"2\",\"comp_activity_id\":\"6\",\"comp_remark\":\"sd\",\"market_id\":10,\"id\":18}','super_admin','http://master.dev/marketinfo/10','127.0.0.1','2017-01-17 00:12:01','created'),('ab91a036-0830-4d37-b302-4b28da003b07',54,'App\\Models\\Customer','{\"id\":54,\"name\":\"fdf\",\"address\":\"fdf\",\"city\":\"fdf\",\"state\":\"fdf\",\"country\":\"fdf\",\"zipcode\":\"fdf\",\"contact_person\":\"\",\"contact_no\":\"+919524609638\",\"pan\":\"\",\"tin\":\"\",\"type\":null,\"email\":\"dass.kali14@gmail.com\",\"desc\":null,\"loc_lat\":\"29.721792\",\"loc_lng\":\"-95.3458546\",\"district\":\"fdf\",\"uploads\":\"[]\",\"location\":\"fdf\",\"emp_id\":24}','[]','super_admin','http://master.dev/customer/54','127.0.0.1','2017-01-17 07:45:32','deleted'),('ac1a6a03-1719-4d13-8c88-32c50bccc66b',3,'App\\Models\\Activity','{\"id\":3,\"name\":\"kalidassgfgerdrdr\",\"desc\":\"sdsdshghgrdrdr\"}','[]','25','http://master.dev/activity/3','127.0.0.1','2017-01-11 05:49:09','deleted'),('ad0c76db-8f0b-4cc2-bc71-7327615f159b',1,'App\\Models\\ProspectType','{\"name\":\"fdfdKali dass\"}','{\"name\":\"Google\"}','25','http://master.dev/prospect/1','127.0.0.1','2017-01-16 01:22:08','updated'),('ae3df793-bbac-452b-829b-07f42a72f9d8',56,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/5e31557a843b2aa23bdc68b614d5067c.txt\\\"]\"}','{\"uploads\":\"[]\"}','super_admin','http://master.dev/customer/56','127.0.0.1','2017-01-18 05:42:31','updated'),('af37334a-a877-4bfe-b895-96a6c9463233',8,'App\\Models\\MarketIntelligence','{\"id\":8,\"upload\":\"[]\",\"desc\":\"fdf\",\"location\":\"chennai\",\"loc_lat\":\"0\",\"loc_lng\":\"0\",\"taken_by\":25}','[]','25','http://master.dev/marketinfo/8','127.0.0.1','2017-01-11 01:53:14','deleted'),('aff529da-bd74-4f8c-b7b3-f8d832756004',14,'App\\Models\\OrderBooking','{\"files_info\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\"}','{\"files_info\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','super_admin','http://master.dev/order/14','127.0.0.1','2017-01-18 04:54:45','updated'),('b0358d9d-4731-45ab-bd3d-b72fd36f208b',96,'App\\Models\\EmpSchedule','{\"date\":\"2017-01-24\"}','{\"date\":\"2017-01-27\"}','24','http://master.dev/task/96','127.0.0.1','2017-01-09 08:24:06','updated'),('b29f61fa-dcb6-4bfd-bfa2-387f85b32359',10,'App\\Models\\OrderBooking','{\"order_booking_id\":10,\"cust_id\":53,\"product_info\":null,\"quote_ref\":\"ds\",\"po_num\":\"fdg\",\"po_date\":\"2017-01-24\",\"ship_to\":\"gf\",\"bil_to\":\"gfg\",\"remarks\":null,\"files_info\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"emp_id\":25,\"order_date\":\"2017-01-26\"}','[]','super_admin','http://master.dev/order/10','127.0.0.1','2017-01-11 05:34:00','deleted'),('b333e739-c5de-47c1-9ec0-8d77248bf90a',53,'App\\Models\\Customer','{\"loc_lat\":\"13.082574628006745\",\"loc_lng\":\"74.83734301875006\"}','{\"loc_lat\":13.049465642593,\"loc_lng\":80.281411927441}','25','http://master.dev/customer/53','127.0.0.1','2017-01-10 06:52:40','updated'),('b3a6edfa-b6b9-427a-978e-858c8dbe0975',49,'App\\Models\\Customer','{\"id\":49,\"name\":\"kalidassdsdgfgf\",\"address\":\"djsdjjhjhj\",\"city\":\"dsdj\",\"state\":\"dsjdj\",\"country\":\"djsjs\",\"zipcode\":\"dsjdjs\",\"contact_person\":\"dshgdj\",\"contact_no\":\"+19524609638\",\"pan\":\"djsfdj\",\"tin\":\"djsdj\",\"type\":null,\"email\":\"kalidass@gmail.com\",\"desc\":\"djsdj\",\"loc_lat\":\"12.340796817197432\",\"loc_lng\":\"77.04340000000002\",\"district\":\"djshdj\",\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\",\"location\":\"jsdj\",\"emp_id\":2}','[]','24','http://master.dev/customer/49','127.0.0.1','2017-01-09 03:59:43','deleted'),('b4c38273-e8c3-4b09-8e4a-fc426eba72d8',51,'App\\Models\\Customer','[]','{\"name\":\"fdf\",\"email\":\"dsd.com@g.com\",\"desc\":\"dsd\",\"address\":\"dd\",\"city\":\"dsd\",\"state\":\"dsd\",\"zipcode\":\"ssd\",\"loc_lat\":20.428283,\"loc_lng\":72.8397317,\"contact_person\":\"dsd\",\"contact_no\":\"+919524609638\",\"country\":\"dsd\",\"pan\":\"ds\",\"tin\":\"dsd\",\"location\":\"dsd\",\"emp_id\":\"17\",\"uploads\":\"[]\",\"district\":\"dsd\",\"type\":null,\"id\":51}','super_admin','http://master.dev/customer','127.0.0.1','2017-01-09 00:22:50','created'),('b5748f57-8cd0-47d0-9de7-3c60f8045054',52,'App\\Models\\Customer','{\"id\":52,\"name\":\"w2s\",\"address\":\",\",\"city\":\",\",\"state\":\",\",\"country\":\"india\",\"zipcode\":\"600041\",\"contact_person\":\"kali\",\"contact_no\":\"+919524609638\",\"pan\":\"dsd\",\"tin\":\"dsds\",\"type\":null,\"email\":\"kalidass@way2smile.co\",\"desc\":null,\"loc_lat\":\"11.527181624018487\",\"loc_lng\":\"78.72001950000003\",\"district\":\",\",\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\",\"location\":\"chennai\",\"emp_id\":16}','[]','24','http://master.dev/customer/52','127.0.0.1','2017-01-09 03:59:41','deleted'),('b77d2852-5a1d-4794-9a0f-57fb93d2260c',95,'App\\Models\\EmpSchedule','{\"date\":\"2017-01-08\"}','{\"date\":\"2017-01-28\"}','25','http://master.dev/task/95','127.0.0.1','2017-01-10 06:57:37','updated'),('ba5e17f8-36ad-4765-bb4b-92ddf91b81e9',54,'App\\Models\\Customer','{\"emp_id\":25}','{\"emp_id\":\"24\"}','24','http://master.dev/customer/54','127.0.0.1','2017-01-10 00:11:37','updated'),('bad5b864-1083-47fd-9d49-0ffedda5fc32',20,'App\\Models\\OrderBooking','{\"order_booking_id\":20,\"cust_id\":53,\"product_info\":null,\"quote_ref\":\"fdf\",\"po_num\":\"fdf\",\"po_date\":\"2017-01-16\",\"ship_to\":\"fdf\",\"bil_to\":\"fdf\",\"remarks\":\"fdf\",\"files_info\":\"[]\",\"emp_id\":25,\"order_date\":\"2017-01-24\"}','[]','25','http://master.dev/order/20','127.0.0.1','2017-01-11 01:22:04','deleted'),('bb5e3435-17f3-48fb-8e7b-1faa253ba222',7,'App\\Models\\MarketIntelligence','{\"id\":7,\"upload\":\"[]\",\"desc\":\"fd\",\"location\":\"fdf\",\"loc_lat\":\"0\",\"loc_lng\":\"0\",\"taken_by\":25}','[]','25','http://master.dev/marketinfo/7','127.0.0.1','2017-01-11 01:53:02','deleted'),('bc15b530-31d0-4692-b746-30550bef6fa2',6,'App\\Models\\Market','[]','{\"comp_remark\":\"1\",\"market_id\":11,\"id\":6}','25','http://master.dev/marketinfo/11','127.0.0.1','2017-01-11 02:16:05','created'),('bd1cd4b8-a7c8-4f31-82cc-392f7854d942',53,'App\\Models\\Customer','[]','{\"name\":\"company one\",\"email\":\"mk@mkone.com\",\"desc\":\"fdf\",\"address\":\"D8 Sangeeth apartments\",\"city\":\"chennai\",\"state\":\"tamilnadu\",\"zipcode\":\"600042\",\"loc_lat\":43.2616211,\"loc_lng\":0.99097010000003,\"contact_person\":\"pratap\",\"contact_no\":\"+12345676879\",\"country\":\"india\",\"pan\":\"fdf\",\"tin\":\"df\",\"location\":\"south\",\"emp_id\":\"25\",\"uploads\":\"[]\",\"district\":\"chennai\",\"type\":null,\"id\":53}','24','http://master.dev/customer','127.0.0.1','2017-01-09 06:39:06','created'),('bdaad1ea-25f2-4f00-b923-458c944e1b68',13,'App\\Models\\OrderBooking','{\"emp_id\":25}','{\"emp_id\":\"24\"}','25','http://master.dev/order/13','127.0.0.1','2017-01-12 01:38:09','updated'),('bde48cd7-9cf8-4ee9-96c7-d687c1b41b20',8,'App\\Models\\User','{\"user_pwd\":\"eyJpdiI6IjJyQk1IYnlSTU1WWUp4bWVpNTZWb0E9PSIsInZhbHVlIjoiNm44aHpjbnlkeXZFNFgrR2VudzYxZz09IiwibWFjIjoiNTM4YTMzYTY1MjgwNmMzZTczN2JmOWY0NzQ5ZGQ1MTQyYzU4ZmE0Zjk2NDQ2ZWQ1MTcxYzE3NTgxMWVhODhiZSJ9\"}','{\"user_pwd\":\"eyJpdiI6IkRCWVpyeHk0RFpBY3J5TWE3eE02Qmc9PSIsInZhbHVlIjoiejBDK2VTdnFiM1V6NHBvbHFmMjFyQT09IiwibWFjIjoiNTQ1YWNiMTMxY2U1ZmZlMzY0OGZhZTQxZjliMWIzM2FmMGZhZDU2ZTExNTMwMGU1NGMzZDcyN2FiY2MyYjkzNiJ9\"}','super_admin','http://master.dev/user/8','127.0.0.1','2017-01-08 23:44:33','updated'),('bea585b3-5b2f-44f9-88bc-43633aa645d6',98,'App\\Models\\EmpSchedule','[]','{\"emp\":\"25\",\"date\":\"2017-01-27\",\"add_by\":\"25\",\"id\":98}','super_admin','http://master.dev/task','127.0.0.1','2017-01-10 00:45:23','created'),('bf771375-d1f1-447c-bb59-fa0b8982bc30',89,'App\\Models\\EmpSchedule','{\"id\":89,\"emp\":2,\"add_by\":2,\"date\":\"2017-01-26\"}','[]','24','http://master.dev/task/89','127.0.0.1','2017-01-09 03:57:30','deleted'),('c01dc4f3-b5d8-4c0f-b156-f42726fdf024',51,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3ce93d68e83be2be317ed5e790adba7f.txt\\\"]\"}','25','http://master.dev/customer/51','127.0.0.1','2017-01-16 09:13:38','updated'),('c057849c-7150-49d8-a745-d59c56e857a3',51,'App\\Models\\Customer','{\"uploads\":\"[]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','25','http://master.dev/customer/51','127.0.0.1','2017-01-12 01:51:13','updated'),('c294d531-75a3-4324-bf15-b5253bed96c6',130,'App\\Models\\ApiAuth','{\"auth_model\":\"App\\\\Models\\\\User\"}','{\"auth_model\":\"App\\\\Models\\\\SuperAdmin\"}','super_admin','http://master.dev/auth?api','127.0.0.1','2017-01-05 06:10:25','updated'),('c302d26e-68a5-4293-a695-e242d505b8c2',50,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','{\"uploads\":\"[]\"}','super_admin','http://master.dev/customer/50','127.0.0.1','2017-01-09 00:23:16','updated'),('c3475c88-fc3e-4618-a2fa-08e283c48257',19,'App\\Models\\Master','[]','{\"company_name\":\"Testing with company\",\"company_street\":\"test\",\"company_city\":\"chennai\",\"company_state\":\"tamilnadu\",\"company_zipcode\":\"345678\",\"company_url\":\"http:\\/\\/ok.com\",\"company_phone\":\"+12345464567\",\"company_desc\":\"fine\",\"company_country\":\"india\",\"company_pwd\":\"eyJpdiI6ImRkZjN3K3kyMW1nRWcyOUtFVVpcL0Z3PT0iLCJ2YWx1ZSI6IjlLM1J1R1ZTSFlON1hhTGtEcEI2OVQwRWhUalhhNmYxWnJzYnJQSGs0MUFaRFkrWmVmUHFvY1kyQlBpZWprS05oR2llSlwveXJSWUppSzJyV1IwNGZtenZPektzQ3E0RzRPYUVmYlpSV0tDWT0iLCJtYWMiOiI5NDYyYmU1ZWE0YTcxOTNiYWMxMGIzMjgwNGYxZWRiMGU2OGZkZjkzODg1ODNhYjFkODQyMGRlMzhjMWI3Zjc2In0=\",\"company_email\":\"mk@mk.com\",\"company_id\":19}','super_admin','http://master.dev/company','127.0.0.1','2017-01-17 05:49:17','created'),('c39b0b10-0992-4ff8-a86d-553bf9755bc5',53,'App\\Models\\Customer','{\"loc_lat\":\"27.18674906965998\",\"loc_lng\":\"80.58691736562503\"}','{\"loc_lat\":13.082316748985,\"loc_lng\":80.271446670129}','super_admin','http://master.dev/customer/53','127.0.0.1','2017-01-10 03:04:08','updated'),('c3a48145-e47f-4312-9fc9-d4dd16eb5ade',51,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/61b817333a5f29ecc9d586bc8b240ae7.txt\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3ce93d68e83be2be317ed5e790adba7f.txt\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\"]\"}','super_admin','http://master.dev/customer/51','127.0.0.1','2017-01-17 00:53:23','updated'),('c3dda82d-e5a9-4089-9a8a-6fde2d76c7ad',2,'App\\Models\\CompanyDbInfo','[]','{\"sub_domain_url\":\"gfgf.master.dev\",\"sub_db_host\":\"127.0.0.1\",\"sub_db_port\":\"3306\",\"sub_db_user\":\"root\",\"sub_db_name\":\"gfgf_mywvy\",\"sub_db_pwd\":\"eyJpdiI6ImpHdVlMWlFvcytUcmdaektLNW1hREE9PSIsInZhbHVlIjoiZWFUenFPZURkXC9vTjVBMWVzcjJFdUE9PSIsIm1hYyI6IjI4OGI1OWQ2Y2RlNzUwOWMxMjUwYjI1NDM1NWQwNDA3NDA5NDU4OTBhMThmZjQ0NWMzZTE5Yzg0ZTEzNDNmZjkifQ==\",\"company_id\":20,\"id\":2}','super_admin','http://master.dev/company','127.0.0.1','2017-01-17 06:42:25','created'),('c403d1c1-1920-4519-828a-e3d652a78996',103,'App\\Models\\EmpSchedule','[]','{\"emp\":\"25\",\"date\":\"2017-01-26\",\"add_by\":25,\"id\":103}','25','http://master.dev/task','127.0.0.1','2017-01-10 07:18:28','created'),('c40538e1-431f-45f5-b996-4e6096581b8e',15,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6Ikg3ZCtcLzdYVWpvZE5FVU5RTTc3SzlnPT0iLCJ2YWx1ZSI6IjJOSDg1czVNZyt0VWN0RnJEaTk4YnlYRkd1UGRuZU5HUXNHYWJcL245bXdldGNkS0p0R04rKzVHVjI1dVNjamtnY0dwemZjc2d4dmF5ZllrMDQ0a2wrejlsMkdHNEJBemxhSG9jbHppT1owST0iLCJtYWMiOiIwMWRkY2YxMzQ5YmE2ZmUyMWUwMmQ2NzQzYzZiNTNjYmYxMzZkNWNhNzNiZjYwYWYzMWU1YmJmYTA3NDkyODlmIn0=\"}','{\"company_pwd\":\"eyJpdiI6IjhyWW9HK0h5dm1hbGh4VXRQdjhtTnc9PSIsInZhbHVlIjoiWURWWWhMb1lPSGFKNWRqWEFXUmJTNlpnZHJHdDRjMWxpem1mM0lFV04wdE8xOWJIK2tKZUcyZkw0aFd2QWU2UTI0ZHBZY0c5M1B6Q09aOWxSV0ZRQmxkb1h3c1ROS1VocURoRGFKUUU3aFU9IiwibWFjIjoiMzUzYzRkNDMwMjY4NDMxOWJiYWM3NjkyMjgxMzk2MjUyYmE3YjJjYzViZjg4ZGE1OTJiYzk1YTA3NTM2NzQ5MCJ9\"}','super_admin','http://master.dev/company/15','127.0.0.1','2017-01-06 01:11:49','updated'),('c53d65b8-63b3-416c-a7e6-d1b437086ca2',14,'App\\Models\\OrderBooking','{\"files_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','{\"files_info\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\"]\"}','super_admin','http://master.dev/order/14','127.0.0.1','2017-01-18 04:57:00','updated'),('c612a249-2e8b-4543-8440-ed79e886b0b6',9,'App\\Models\\User','{\"user_pwd\":\"eyJpdiI6ImY1dTlybHZKbkpieSt2RDM0MzhiY1E9PSIsInZhbHVlIjoiNHpJelp1eTdDZEZ1VUNDZVF1dGI2QT09IiwibWFjIjoiNzQyNzQ5MTA4YmY3MzlmMDA5YzJkMGQ2ODliMzNjNjgwYjE0YWQ1NDRkMzNkZDRjY2QzNWViN2Q0MjAzMGI3ZiJ9\",\"city\":\"das\",\"phone_imei\":\"9524609638\"}','{\"user_pwd\":\"eyJpdiI6IkpHVkd3UFh1YlwvWHJwUG1SdXRmUHB3PT0iLCJ2YWx1ZSI6IlRYanlZQU04Q0lIbWtyMzVCUnJBaFE9PSIsIm1hYyI6Ijc1ZjMyYjhhODMwNTg4ODg5MDAxNTY3NzU1ZWFmZmE0ODliNzI5MTA1MzgwOThiYTVlZGI2MWFlZGFhNDcxOGUifQ==\",\"city\":\"dasfdf\",\"phone_imei\":\"\"}','super_admin','http://master.dev/user/9','127.0.0.1','2017-01-08 23:37:41','updated'),('c64601f0-7db5-45aa-8090-51d65c35f712',50,'App\\Models\\Customer','{\"uploads\":\"[]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','super_admin','http://master.dev/customer/50','127.0.0.1','2017-01-09 00:16:58','updated'),('c670993e-48cd-4d7f-9213-ab13db7c9ed2',100,'App\\Models\\EmpSchedule','[]','{\"emp\":\"25\",\"date\":\"2017-01-25\",\"add_by\":\"25\",\"id\":100}','super_admin','http://master.dev/task','127.0.0.1','2017-01-10 06:49:56','created'),('c67373e3-4e79-4fe0-b9f1-0dac13dbd747',18,'App\\Models\\OrderBooking','[]','{\"remarks\":\"fdf\",\"cust_id\":\"53\",\"quote_ref\":\"fdf\",\"order_date\":\"2017-01-24\",\"po_num\":\"fdf\",\"po_date\":\"2017-01-16\",\"ship_to\":\"fdf\",\"bil_to\":\"fdf\",\"emp_id\":25,\"files_info\":\"[]\",\"order_booking_id\":18}','25','http://master.dev/order','127.0.0.1','2017-01-11 01:07:26','created'),('c723887e-be4d-4fd5-82d9-efa0dc4d0f63',87,'App\\Models\\EmpSchedule','{\"id\":87,\"emp\":2,\"add_by\":1,\"date\":\"2017-01-06\"}','[]','1','http://master.dev/task/87','127.0.0.1','2017-01-06 08:32:20','deleted'),('c8bfdc9c-edba-43b6-9ed1-63ed8753828e',51,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3ce93d68e83be2be317ed5e790adba7f.txt\\\",\\\"uploads\\\\\\/bd358a0eb25156b44bd903378742350a.html\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3ce93d68e83be2be317ed5e790adba7f.txt\\\",\\\"uploads\\\\\\/bd358a0eb25156b44bd903378742350a.html\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\"]\"}','25','http://master.dev/customer/51','127.0.0.1','2017-01-16 09:24:57','updated'),('c92279f3-7405-47ea-a85a-5a8ac8bf1fc4',11,'App\\Models\\OrderBooking','{\"order_booking_id\":11,\"cust_id\":53,\"product_info\":null,\"quote_ref\":\"ds\",\"po_num\":\"fdg\",\"po_date\":\"2017-01-24\",\"ship_to\":\"gf\",\"bil_to\":\"gfg\",\"remarks\":null,\"files_info\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"emp_id\":25,\"order_date\":\"2017-01-24\"}','[]','25','http://master.dev/order/11','127.0.0.1','2017-01-11 02:55:45','deleted'),('ca52c09a-2017-4e0e-829a-ea25ed970cd5',134,'App\\Models\\ApiAuth','[]','{\"auth_key\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkRBZGVCQkRlQm8iLCJpc3MiOiJtYXN0ZXIuZGV2IiwidHlwZSI6Im1hc3Rlci5kZXYifQ.tmn_yWHLTnDHNFuN_pWqF4OsnKxNLOjBaCPYRzo3URE\",\"auth_user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36\",\"auth_ip\":\"127.0.0.1\",\"auth_model\":\"App\\\\Models\\\\User\",\"auth_user_id\":25,\"auth_id\":134}','super_admin','http://master.dev/auth?api','127.0.0.1','2017-01-10 06:51:39','created'),('ca575523-4f1b-4a75-9f20-ed67cea6db4e',5,'App\\Models\\MarketIntelligence','[]','{\"desc\":\"sf\",\"location\":\"chennai\",\"loc_lat\":39.9129412,\"loc_lng\":-104.7956055,\"taken_by\":\"25\",\"upload\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"id\":5}','25','http://master.dev/marketinfo','127.0.0.1','2017-01-11 01:32:45','created'),('ca8666eb-05f1-4082-8b40-3b3e66ef6ce1',15,'App\\Models\\Master','{\"company_city\":\"0gfgfg\",\"company_state\":\"0\",\"company_country\":\"3\",\"company_pwd\":\"eyJpdiI6ImpyaE1zR0N5MzFCVmdIRDNvMU4zWUE9PSIsInZhbHVlIjoiWWs5SFVpNXE3UUZ1VnNkaW0rQ09ZZ0prbk9xaE8rbGdUNVFuUVdXSFh1Q2xEXC9BcHNMMnlnQ2dTeUo5a3ZcL0FpaXQxQVZcL0dBbElrMGlpU3hpeUY0MGJPS2xoYXpSTWc3eUU0TDhZXC9raFBFPSIsIm1hYyI6IjBiMDlmMGFhMmNjMzAxYWFlYWFjMWE1NWU2ODNiMWVmOWM3ODFhODk0ZmVhNTAxZTE0MGY3ZmEyOTI5OTA4NzgifQ==\"}','{\"company_city\":\"df\",\"company_state\":\"fdf\",\"company_country\":13,\"company_pwd\":\"eyJpdiI6InRWMEk0S0JWeWRnMW9vVFJjeVwvQ0p3PT0iLCJ2YWx1ZSI6IkNOUjhcL0UzYklWMWdGeWVTV1RVT0xGTXJYTUVVT1V3UEpiWTNIUEZ2UzVhOWNQeTRBMjRqM01RZHpDSmZFUUJNM2FENlphZzBJN2FhZ3FMNXp2RjN0TDFnNzl4NU9JQTh5U2pXQWl4cU9ETT0iLCJtYWMiOiI4MjY4OTA2MGY0NDVlNWYxNDQ3OWZmNzhiMzlkN2FhM2UwZjkwOTk4YjMwOWM5MzQ3ZjY5YTdiNjAwM2NhMzg0In0=\"}','super_admin','http://master.dev/company/15','127.0.0.1','2017-01-06 10:03:51','updated'),('cabe718c-14a7-4103-9e83-26dc33d53317',17,'App\\Models\\Master','{\"company_phone\":\"9524609638\",\"company_pwd\":\"eyJpdiI6IlwvV3BlVjFFb0JzU1ZuckY2NmZPVjhBPT0iLCJ2YWx1ZSI6InRScHVtT0pxNWc3bjBRM2ZDK3pXckpnZFFjU2ZremUxNVpmVUN1TGI5NndXeDRMdVRhNU52QVFuOFNJY2xLTGErMUF5MnV3eXpTNDZxazdLZjJ3SHVkUFVaY1l1SzVFZXRvM1N5MjZzaWFFPSIsIm1hYyI6ImQzNTU0Y2Q5NDRkNWU0OTliYjQxZGY5MGNkNjIwNjQzMWEyMTVkMTM0YzA2NjE1OWFiN2MxYzI5N2I3MDU1NjEifQ==\"}','{\"company_phone\":\"+919524609638\",\"company_pwd\":\"eyJpdiI6Imx5a1BlMHFcL1FcL1UxN3ZTSTRPdm1GZz09IiwidmFsdWUiOiJSUXlrRU1xT0tMTE1abHhWY0FyckJrdDNEOWhSU3U3V25Pd1oyUmdraCs1cEd0alE4cEI0Q1NyeTJWM2FPT0V4cVNoRDlwM21veW9LTitObk5WNk12K28zRVQ3ODlzZ2E4ajgyYlh3bG5xbz0iLCJtYWMiOiIyZGIxZTc2OGU3YmM1MWNhZTIxMTQ5MzlhODgzMDg3Mjk0YmE0YmU1Zjk1MzFmMDFjM2MyMDlmMDgwZWZkNzM2In0=\"}','super_admin','http://master.dev/company/17','127.0.0.1','2017-01-09 03:09:08','updated'),('cacee7c7-0aa6-4d9d-96a6-56a20de616da',104,'App\\Models\\EmpSchedule','{\"add_by\":25}','{\"add_by\":24}','24','http://master.dev/task/104','127.0.0.1','2017-01-11 08:26:02','updated'),('cb4f7ca3-7430-47be-ab8a-9ff52c16a7fa',51,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/61b817333a5f29ecc9d586bc8b240ae7.txt\\\"]\"}','25','http://master.dev/customer/51','127.0.0.1','2017-01-16 09:45:04','updated'),('cb98fe66-0c38-4169-86cd-74ca3beb96b3',95,'App\\Models\\EmpSchedule','[]','{\"emp\":\"25\",\"date\":\"2017-01-08\",\"add_by\":24,\"id\":95}','24','http://master.dev/task','127.0.0.1','2017-01-09 06:40:51','created'),('cbe6a391-cf8c-493e-a93d-dfcfdf8e0542',58,'App\\Models\\Customer','[]','{\"name\":\"fd\",\"email\":\"dass@gmail.com\",\"desc\":\"3232\",\"address\":\"fdf\",\"city\":\"fdf\",\"state\":\"fdf\",\"zipcode\":\"3232\",\"loc_lat\":22.59372606392931,\"loc_lng\":29.1796875,\"contact_person\":\"fdf\",\"contact_no\":\"+919524609638\",\"country\":\"fddfd\",\"pan\":\"fd\",\"tin\":\"fd\",\"location\":\"fdf\",\"emp_id\":\"25\",\"uploads\":\"[]\",\"district\":\"fdf\",\"type\":null,\"id\":58}','super_admin','http://master.dev/customer','127.0.0.1','2017-01-18 05:34:26','created'),('ce75c4ae-eb32-4ad2-8447-c35f0e5e0932',15,'App\\Models\\Master','{\"company_name\":\"W2Sgfg\",\"company_pwd\":\"eyJpdiI6IlFib1QxS3YwckFrNUw3bVQzckNaV0E9PSIsInZhbHVlIjoiYlwvcWZ1OElWNkpCWHdGWkMwXC9CWkpuWW1IdWs1V3R6Tzl5eHE4K2NmaGNKNGNvVng3WlMrWXlTazZKVUttNGJYeG1mZnRMYjRFV2NlZlpVRmw5QWRoOUp2QmdqaFZtNHhId08xSkg5eTJuRT0iLCJtYWMiOiI4ZTI0YTcwMjgyZWIyNjllODI5YTQwMjNmYWI2NDBlMDJjYjg2N2MwM2JiYmJlMGUxOTU1ZjM1MDFjYzg4MjIyIn0=\"}','{\"company_name\":\"W2Sgfghghgh\",\"company_pwd\":\"eyJpdiI6Ikg3ZCtcLzdYVWpvZE5FVU5RTTc3SzlnPT0iLCJ2YWx1ZSI6IjJOSDg1czVNZyt0VWN0RnJEaTk4YnlYRkd1UGRuZU5HUXNHYWJcL245bXdldGNkS0p0R04rKzVHVjI1dVNjamtnY0dwemZjc2d4dmF5ZllrMDQ0a2wrejlsMkdHNEJBemxhSG9jbHppT1owST0iLCJtYWMiOiIwMWRkY2YxMzQ5YmE2ZmUyMWUwMmQ2NzQzYzZiNTNjYmYxMzZkNWNhNzNiZjYwYWYzMWU1YmJmYTA3NDkyODlmIn0=\"}','super_admin','http://master.dev/company/15','127.0.0.1','2017-01-06 01:11:37','updated'),('cfc62cdd-6a5a-4bfe-9e78-056e64647804',53,'App\\Models\\Customer','{\"uploads\":\"[]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/fd55617a0d8150a531bdcf396bb44cb9.txt\\\"]\"}','super_admin','http://master.dev/customer/53','127.0.0.1','2017-01-18 05:32:34','updated'),('cfeb12ad-f3b9-4d57-bd87-f93f85e228c9',56,'App\\Models\\Customer','{\"uploads\":\"[]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','super_admin','http://master.dev/customer/56','127.0.0.1','2017-01-18 05:42:51','updated'),('d02dd3da-efb2-416f-ba92-3d4e55d1ca91',14,'App\\Models\\User','[]','{\"role_id\":\"2\",\"first_name\":\"kalidass\",\"last_name\":\"dass\",\"user_pwd\":\"eyJpdiI6IlltRGlwVkdcL1NMYVE5S0hIc1krK0FBPT0iLCJ2YWx1ZSI6Ilg4cSszXC81cUowekd0Mm01VGNseGxRPT0iLCJtYWMiOiIxMTg3NGFiMzgzYWNkMzM0MjkzYjk2MjYwZmNhNmUxYzIwMjI0NjFiM2U4ZWI2MmEyZGY5MzU3YjEwNjVjYjE2In0=\",\"phone\":\"+919524609638\",\"city\":\"dsd\",\"street\":\"dsd\",\"state\":\"fds\",\"zipcode\":\"sdsf\",\"email\":\"kalidass@way2.com\",\"country\":\"sf\",\"phone_imei\":\"fdf\",\"is_active\":\"1\",\"user_id\":14}','super_admin','http://master.dev/user','127.0.0.1','2017-01-08 23:39:01','created'),('d19dfc92-6453-48cc-9893-d28105601f74',54,'App\\Models\\Customer','[]','{\"name\":\"fdf\",\"email\":\"dass.kali14@gmail.com\",\"desc\":null,\"address\":\"fdf\",\"city\":\"fdf\",\"state\":\"fdf\",\"zipcode\":\"fdf\",\"loc_lat\":29.721792,\"loc_lng\":-95.3458546,\"contact_person\":\"fdfd\",\"contact_no\":\"+919524609638\",\"country\":\"fdf\",\"pan\":\"fdf\",\"tin\":\"fdf\",\"location\":\"fdf\",\"emp_id\":\"25\",\"uploads\":\"[]\",\"district\":\"fdf\",\"type\":null,\"id\":54}','24','http://master.dev/customer','127.0.0.1','2017-01-10 00:10:07','created'),('d1bacf18-2f7b-48e7-83e5-15ace033bc0c',9,'App\\Models\\MarketIntelligence','[]','{\"desc\":\"fdf\",\"location\":\"fdf\",\"loc_lat\":0,\"loc_lng\":0,\"taken_by\":\"25\",\"upload\":\"[]\",\"id\":9}','25','http://master.dev/marketinfo','127.0.0.1','2017-01-11 01:51:38','created'),('d20fb77b-fb48-473f-9014-269d91e3fff1',4,'App\\Models\\MarketIntelligence','{\"upload\":\"[]\"}','{\"upload\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','25','http://master.dev/marketinfo/4','127.0.0.1','2017-01-10 08:21:40','updated'),('d3bf781b-bc9d-475f-aea7-bc3f371488c9',53,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/2242d6d0ea596fc457f04c50a5598a24.jpeg\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/2242d6d0ea596fc457f04c50a5598a24.jpeg\\\",\\\"uploads\\\\\\/10889252fa481b50d7484eb1e97837a6.jpeg\\\"]\"}','super_admin','http://master.dev/customer/53','127.0.0.1','2017-01-18 04:17:27','updated'),('d4642542-caf6-41b4-9f07-04075e2a6e01',16,'App\\Models\\Master','{\"company_name\":\"gfg\",\"company_street\":\"chebba\",\"company_city\":\"djfhjd\",\"company_state\":\"dfjfhj\",\"company_zipcode\":\"fdjfh\",\"company_url\":\"http:\\/\\/www.dsds.con\",\"company_phone\":\"+447400503589\",\"company_desc\":\"fdjhfjdfdf\",\"company_id\":16,\"company_country\":\"fdjfhj\",\"company_pwd\":\"eyJpdiI6IkwxY3RtR3NxdDZPMzBKWVNXNU9qbXc9PSIsInZhbHVlIjoiXC9rbk1QSHc5Y1NodElwczNWbDRWK0M1UnpTRG5vR3pEenJqcXIyRkJsdUY2KzRoVWJSQVZcL0NSajVUWHgrc2JjUlhzTXJzOU1BeE15cFQxa3JCMnZIdUlZczZhdjlWVHpaTzl6Z1JWa0hSUT0iLCJtYWMiOiI5MzFiMGUyMzFkOWVjNjk1YTUyMThkODU1NjMwOGE3NmUxZGYzZDhkZGM4ZTBlNjczM2JjZTgwZmI2NWZiMjI0In0=\",\"company_email\":\"admin@sfa.com\"}','[]','super_admin','http://master.dev/company/16','127.0.0.1','2017-01-12 08:30:13','deleted'),('d48112fe-952a-4597-b09a-9f1d52523d56',7,'App\\Models\\MarketIntelligence','[]','{\"desc\":\"fd\",\"location\":\"fdf\",\"loc_lat\":0,\"loc_lng\":0,\"taken_by\":\"25\",\"upload\":\"[]\",\"id\":7}','25','http://master.dev/marketinfo','127.0.0.1','2017-01-11 01:48:31','created'),('d55388b8-6106-4067-9265-867c077dc977',130,'App\\Models\\ApiAuth','{\"auth_model\":\"App\\\\Models\\\\SuperAdmin\"}','{\"auth_model\":\"App\\\\Models\\\\User\"}','1','http://master.dev/auth?api','127.0.0.1','2017-01-05 07:02:45','updated'),('d864c5f1-28bc-4cd2-908c-c267470d3198',1,'App\\Models\\User','{\"user_id\":1,\"role_id\":1,\"first_name\":\"kali\",\"last_name\":\"dass\",\"user_pwd\":\"eyJpdiI6IkRCSEkrd0NzT3Z0NHErMVo5YzZpRmc9PSIsInZhbHVlIjoibWplb09Uak44bHZZWUVoOGJzdVwvMUE9PSIsIm1hYyI6ImI5YmJlZDEwNGMxNDgxYmM2M2EyNmMwY2VmNTE3N2QwZGE2MDBiNTMxYTk0YWFmZmFhMGVkMDQ4MzVjNzQ4Y2IifQ==\",\"phone\":\"dass\",\"city\":null,\"street\":null,\"state\":null,\"zipcode\":null,\"email\":\"kalidass@gmail.com\",\"is_active\":1,\"activated_on\":null,\"last_login\":null,\"country\":null,\"phone_imei\":null,\"profile_image\":null}','[]','super_admin','http://master.dev/user/9','127.0.0.1','2017-01-08 23:36:04','deleted'),('d9829039-f3ac-4312-8a40-00a523c2cf66',95,'App\\Models\\EmpSchedule','{\"add_by\":24}','{\"add_by\":\"25\"}','super_admin','http://master.dev/task/95','127.0.0.1','2017-01-10 06:49:38','updated'),('d9cf54ba-3c8c-484b-a38c-4cc8fc83dc06',22,'App\\Models\\User','{\"user_id\":22,\"role_id\":3,\"first_name\":\"fdf\",\"last_name\":\"fdf\",\"user_pwd\":\"eyJpdiI6ImRnMFc2alp2STdWMUROU1dRVDdaaHc9PSIsInZhbHVlIjoiXC94dkM0c0VJclwveEI5YitoTmx6UUZnPT0iLCJtYWMiOiIwODQyNDI1NDU3NmQ1NDljOTI0Zjk5YzVlMmIxMmI5NDA1NDUzMzFjMmZmZTkyNTE0MTNhN2ZlZGFmZmE4N2M4In0=\",\"phone\":\"+919524609638\",\"city\":\"fdf\",\"street\":\"dsf\",\"state\":\"fd\",\"zipcode\":\"fd\",\"email\":\"dass.kali14@gmail.com\",\"is_active\":1,\"activated_on\":null,\"last_login\":null,\"country\":\"fdf\",\"phone_imei\":\"fdf\",\"profile_image\":null}','[]','super_admin','http://master.dev/user/22','127.0.0.1','2017-01-08 23:49:19','deleted'),('daadef7c-a36b-4873-942b-9b12aac4dde3',89,'App\\Models\\EmpSchedule','[]','{\"emp\":\"2\",\"date\":\"2017-01-26\",\"add_by\":\"2\",\"id\":89}','super_admin','http://master.dev/task','127.0.0.1','2017-01-09 03:34:15','created'),('db67de3a-f830-476d-9649-636e2999e2af',7,'App\\Models\\OrderBooking','[]','{\"remarks\":\"1\",\"cust_id\":41,\"quote_ref\":\"1\",\"order_date\":\"2015-05-01\",\"po_num\":null,\"po_date\":\"2017-11-14\",\"ship_to\":\"1\",\"bil_to\":\"1\",\"emp_id\":24,\"files_info\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"order_booking_id\":7}','super_admin','http://master.dev/order','127.0.0.1','2017-01-10 01:47:18','created'),('db6a93a4-0503-4a2b-a5fc-009496fc25b3',1,'App\\Models\\ProspectType','{\"name\":\"Kali dass\",\"desc\":\"test\"}','{\"name\":\"fdfdKali dass\",\"desc\":\"testfdf\"}','25','http://master.dev/prospect/1','127.0.0.1','2017-01-11 06:58:28','updated'),('dbc6d75c-b25a-4a84-8f7a-00f2139d4327',3,'App\\Models\\MarketIntelligence','{\"id\":3,\"upload\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"desc\":\"chennai\",\"location\":\"chennai,tamilnadu\",\"loc_lat\":\"39.9129412\",\"loc_lng\":\"-104.79560549999997\",\"taken_by\":1}','[]','25','http://master.dev/marketinfo/3','127.0.0.1','2017-01-11 01:52:55','deleted'),('df29f033-f44b-4695-8ca3-ccd727769c2d',3,'App\\Models\\MarketIntelligence','{\"upload\":\"[]\"}','{\"upload\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','25','http://master.dev/marketinfo/3','127.0.0.1','2017-01-10 08:29:34','updated'),('df4d47ca-468d-4667-87db-4ce2df9eccd9',14,'App\\Models\\Market','[]','{\"comp_id\":3,\"comp_activity_id\":2,\"comp_remark\":\"1\",\"market_id\":10,\"id\":14}','25','http://master.dev/marketinfo/10','127.0.0.1','2017-01-11 07:00:47','created'),('df5a45e0-9aa8-48fe-a79c-9a6c2d38f5eb',57,'App\\Models\\Customer','[]','{\"name\":\"kalidasss\",\"email\":\"dass.k@gmail.com\",\"desc\":\"thank\",\"address\":\"chennai\",\"city\":\"chennai\",\"state\":\"tamil nadu\",\"zipcode\":\"600041\",\"loc_lat\":12.9610867,\"loc_lng\":80.25918539999998,\"contact_person\":\"dsds\",\"contact_no\":\"+919524609638\",\"country\":\"india\",\"pan\":\"dsjhd\",\"tin\":\"jdhjf\",\"location\":\"chennai\",\"emp_id\":\"24\",\"uploads\":\"[]\",\"district\":\"chennai\",\"type\":null,\"id\":57}','super_admin','http://master.dev/customer','127.0.0.1','2017-01-18 04:12:19','created'),('dfe9738c-8c91-4b23-9ba3-118aa9561d86',104,'App\\Models\\EmpSchedule','{\"date\":\"2017-01-24\"}','{\"date\":\"2017-01-26\"}','25','http://master.dev/task/104','127.0.0.1','2017-01-10 07:20:42','updated'),('e0dbfd58-2520-447e-a1dc-dbd46be61717',85,'App\\Models\\EmpSchedule','{\"id\":85,\"emp\":1,\"add_by\":2,\"date\":\"2017-01-06\"}','[]','24','http://master.dev/task/85','127.0.0.1','2017-01-09 03:57:28','deleted'),('e1ec2e77-62c4-452a-afd6-451ba84d2803',55,'App\\Models\\Customer','[]','{\"name\":\"kalidass\",\"email\":\"kalidass@way2smile.com\",\"desc\":\"thanks\",\"address\":\"l303\",\"city\":\"4th main road\",\"state\":\"chennai,tamil nadu\",\"zipcode\":\"600041\",\"loc_lat\":12.9834109,\"loc_lng\":80.25597360000006,\"contact_person\":\"kalidass\",\"contact_no\":\"+919524609638\",\"country\":\"india\",\"pan\":\"43434\",\"tin\":\"43434\",\"location\":\"chennai\",\"emp_id\":\"24\",\"uploads\":\"[]\",\"district\":\"thiruvanmiyur\",\"type\":null,\"id\":55}','super_admin','http://master.dev/customer','127.0.0.1','2017-01-17 03:45:43','created'),('e3d36091-eab6-4fe3-96e8-709956d52b5b',51,'App\\Models\\Customer','{\"location\":\"\\\\jjk\"}','{\"location\":\"\\\\jjkkkjkkjkjk\"}','super_admin','http://master.dev/customer/51','127.0.0.1','2017-01-17 03:39:07','updated'),('e3d8efad-ec1d-4f5e-b6bc-b4934105b8ed',14,'App\\Models\\User','{\"user_id\":14,\"role_id\":2,\"first_name\":\"kalidass\",\"last_name\":\"dass\",\"user_pwd\":\"eyJpdiI6IlltRGlwVkdcL1NMYVE5S0hIc1krK0FBPT0iLCJ2YWx1ZSI6Ilg4cSszXC81cUowekd0Mm01VGNseGxRPT0iLCJtYWMiOiIxMTg3NGFiMzgzYWNkMzM0MjkzYjk2MjYwZmNhNmUxYzIwMjI0NjFiM2U4ZWI2MmEyZGY5MzU3YjEwNjVjYjE2In0=\",\"phone\":\"+919524609638\",\"city\":\"dsd\",\"street\":\"dsd\",\"state\":\"fds\",\"zipcode\":\"sdsf\",\"email\":\"kalidass@way2.com\",\"is_active\":1,\"activated_on\":null,\"last_login\":null,\"country\":\"sf\",\"phone_imei\":\"fdf\",\"profile_image\":null}','[]','super_admin','http://master.dev/user/14','127.0.0.1','2017-01-09 02:04:26','deleted'),('e52fc5bb-c909-48ee-a40c-4cec834ad8ba',15,'App\\Models\\Master','{\"company_name\":\"hghW2Sgfghghghfdfdfhfh\",\"company_pwd\":\"eyJpdiI6ImV1TTVwck52WXVMUmpKMVBmZTFFVGc9PSIsInZhbHVlIjoiak1xWXlmSWEwVkhqeXdYSGp4K1VKOFdwdXdcL1ZOVE5VeWtpR24rdXhyblo0ZnVhR1J6eTFuZWtjSVNCY1Zpa01zSnBQWTlZbnMzeGl5MTV2Y24waldYXC9rK1ByNFF6REJueHBwd05NMGx5ST0iLCJtYWMiOiJiYzQ4MWE2ZDZkZTFiNzhjN2Y5OTVmMzBhNTYwZTExZGVkMGU3NTE1OTllYzY3YzE1Y2E3MjcwNDFhYjJjNjY4In0=\"}','{\"company_name\":\"W2S\",\"company_pwd\":\"eyJpdiI6ImwwYjIzSUhXazlURDEzNEdXaEl6UHc9PSIsInZhbHVlIjoiTmx0NkFNTXZIVlwvdHlEaDNlUTlINEg4RVJwV2NTQTRLamQzRzNFVnRYWTg1NW9rbDRaRDJ6U2JQcUZNaHp2aEhzazBmNTRYcCtpNkdYbUFETDRBVjZqZDlTeEwwT3phYTdGZUFna295VXU4PSIsIm1hYyI6IjViNWI4YWQyZGE5OThiYjlhOTExMmQ5MDJmZjRlMmI2ZmNjYWZmNmIzZTI3YzUyNDA0NGQ0NmJhNTQ5Y2I2OTkifQ==\"}','super_admin','http://master.dev/company/15','127.0.0.1','2017-01-06 03:31:39','updated'),('e66b78b6-073c-43f4-89ac-19f64e2ac94a',8,'App\\Models\\User','{\"user_pwd\":\"eyJpdiI6IlNZejFScHp6QkpMUlwvT0dobHhYbE53PT0iLCJ2YWx1ZSI6ImhFY2h5S3o2QzZXTWhaZ2FGcjE1Wnc9PSIsIm1hYyI6IjNiN2Y1N2JmNGNmMGRhMmJiOTFjZjE2ZTY3ZjA3NmQ3ZGY4NGM2ODk0YTE5YTJhMzUxOTRiYjAyZmVlY2JkOTQifQ==\",\"phone_imei\":\"9524609638\"}','{\"user_pwd\":\"eyJpdiI6IjJyQk1IYnlSTU1WWUp4bWVpNTZWb0E9PSIsInZhbHVlIjoiNm44aHpjbnlkeXZFNFgrR2VudzYxZz09IiwibWFjIjoiNTM4YTMzYTY1MjgwNmMzZTczN2JmOWY0NzQ5ZGQ1MTQyYzU4ZmE0Zjk2NDQ2ZWQ1MTcxYzE3NTgxMWVhODhiZSJ9\",\"phone_imei\":\"\"}','super_admin','http://master.dev/user/8','127.0.0.1','2017-01-08 23:41:29','updated'),('e66f2ca0-507e-4b92-96b1-79d27f82abde',51,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3ce93d68e83be2be317ed5e790adba7f.txt\\\",\\\"uploads\\\\\\/bd358a0eb25156b44bd903378742350a.html\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/a4d45b69f5473648bfd7d2f134662e52.xlsx\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\"]\"}','25','http://master.dev/customer/51','127.0.0.1','2017-01-16 09:25:35','updated'),('e7deed54-ea93-42c3-8436-6dcabdbd8337',10,'App\\Models\\OrderBooking','[]','{\"remarks\":null,\"cust_id\":\"53\",\"quote_ref\":\"ds\",\"order_date\":\"2017-01-26\",\"po_num\":\"fdg\",\"po_date\":\"2017-01-24\",\"ship_to\":\"gf\",\"bil_to\":\"gfg\",\"emp_id\":25,\"files_info\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"order_booking_id\":10}','25','http://master.dev/order','127.0.0.1','2017-01-11 00:49:51','created'),('e9590261-d5c7-4da8-9dbc-50a7e018e89c',51,'App\\Models\\Customer','{\"emp_id\":17}','{\"emp_id\":\"25\"}','super_admin','http://master.dev/customer/51','127.0.0.1','2017-01-10 05:59:28','updated'),('e97b7921-5a75-4adb-a768-6ff912fa50e7',130,'App\\Models\\ApiAuth','{\"auth_model\":\"App\\\\Models\\\\SuperAdmin\"}','{\"auth_model\":\"App\\\\Models\\\\User\"}','1','http://master.dev/auth?api','127.0.0.1','2017-01-05 05:28:43','updated'),('ea94bee0-a43b-4cf0-8349-11f8456faa26',18,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6IndlTmRTV0JQamJLVEcwUkJCUmNMVmc9PSIsInZhbHVlIjoiQzE3QjR3QitGQ0RCcjFxUlNJOGREZmM2V1dqYWc5NUdURlVKZWFLSnVMblJTbDFZWkx2ZnV5dGF4S0FvSUtKMGgzZDJoVXhtaklEcE1hY1dHQkxFZGtRRm1kTEJXWWJCcFVxVEZsaDhkS3M9IiwibWFjIjoiNWRjNjM4NzE2MmViZGQ0YmI0ZjAxNzgxMzAwY2QyNjQ1MTVkZDU2ZDQxZTVkODE0NTlhMzY1OGJhZGU3YThlMSJ9\"}','{\"company_pwd\":\"eyJpdiI6ImZJXC84N0EyQmQ4cGZIVHIxajFEd0hRPT0iLCJ2YWx1ZSI6ImQ4aTBYN2ljWEswbUp4bW5oS09Wbzk4Wk5GenhJYVlQQW5VT1BRV013YjNoS3ZsNkp6QVNpWFUzdGlLOGR2dlA2WmRCV3VQXC8rWXJJeXBnajFEVnoyM0twcUlOeHZZY1hBMFl1dG5aT1YxZz0iLCJtYWMiOiJlODAxZjBjOGE0ODdiYzRmNzJhMjEwY2ExY2U0ZTI0MmYyZjIxNjg3ZDIwMTYwODViZjI4OTlmMGE5MWRjMjEzIn0=\"}','super_admin','http://master.dev/company/18','127.0.0.1','2017-01-17 00:07:31','updated'),('eb7b4cd1-778a-4abc-8ef0-32a7a3fab594',49,'App\\Models\\Customer','{\"emp_id\":19}','{\"emp_id\":\"2\"}','super_admin','http://master.dev/customer/49','127.0.0.1','2017-01-09 00:59:01','updated'),('ebf7a7a6-ae16-449f-9844-d905b8d4c7c3',106,'App\\Models\\EmpSchedule','[]','{\"emp\":\"25\",\"date\":\"2017-01-19\",\"add_by\":25,\"id\":106}','25','http://master.dev/task','127.0.0.1','2017-01-13 03:13:20','created'),('ec11c2a3-5957-474f-a747-739a76473b63',10,'App\\Models\\User','{\"user_id\":10,\"role_id\":2,\"first_name\":\"Kali Dass\",\"last_name\":\"W2s\",\"user_pwd\":\"eyJpdiI6ImU0Z1VmNEc0SnlEZmFVVnZnazVpS2c9PSIsInZhbHVlIjoidUswXC9NODZhQTdDOVpoWUhibTRPS2c9PSIsIm1hYyI6ImQ5NjlhMmI3YWViZTc1NWRjNjhjMzM0NmJmNWFhNTIzNjM3MTYyYTQwMGZhOTMxM2YzYTJhZTA0YzczMmQ5MDAifQ==\",\"phone\":\"+919524609637\",\"city\":\"das\",\"street\":\"dass\",\"state\":\"tamil nadu\",\"zipcode\":\"600041\",\"email\":\"kalidass@way2sile.c\",\"is_active\":0,\"activated_on\":null,\"last_login\":null,\"country\":\"india\",\"phone_imei\":\"9524609638\",\"profile_image\":null}','[]','super_admin','http://master.dev/user/10','127.0.0.1','2017-01-08 23:37:35','deleted'),('ed1b7114-1119-4d55-8b52-fcbd2307774a',105,'App\\Models\\EmpSchedule','{\"add_by\":25}','{\"add_by\":24}','24','http://master.dev/task/105','127.0.0.1','2017-01-11 07:46:30','updated'),('ee23d3f5-8202-4897-9dbb-520f909bd0f5',13,'App\\Models\\OrderBooking','[]','{\"remarks\":\"fg\",\"cust_id\":\"53\",\"quote_ref\":\"gfg\",\"order_date\":\"2017-01-24\",\"po_num\":\"gfg\",\"po_date\":\"2017-01-24\",\"ship_to\":\"v\",\"bil_to\":\"gfg\",\"emp_id\":25,\"files_info\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\",\"order_booking_id\":13}','25','http://master.dev/order','127.0.0.1','2017-01-11 01:00:19','created'),('eeb40dfa-d71d-437f-93e2-e0886630688e',102,'App\\Models\\EmpSchedule','{\"id\":102,\"emp\":25,\"add_by\":25,\"date\":\"2017-01-30\"}','[]','25','http://master.dev/task/102','127.0.0.1','2017-01-10 07:03:42','deleted'),('f133c794-f52d-4ecd-ae72-679c5427e742',6,'App\\Models\\Activity','[]','{\"name\":\"dfd\",\"desc\":\"fdf\",\"id\":6}','25','http://master.dev/activity','127.0.0.1','2017-01-13 07:16:07','created'),('f1ed7496-671a-406a-abf5-b37ea95fb9d2',8,'App\\Models\\Market','[]','{\"comp_remark\":\"1\",\"market_id\":10,\"id\":8}','25','http://master.dev/marketinfo/10','127.0.0.1','2017-01-11 02:16:24','created'),('f2812e4d-f460-4fcb-b682-c790a8e7a549',15,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6InNzSVwvbkJXWlVVUWdqWmZuTVdYOWZBPT0iLCJ2YWx1ZSI6IlFDNWZYZlBzUE9zUmMyaDg4S0Z2aDVaV0hhU0ZSZHVoWVNhV0Z4UVdLb3pGU2xwM2FxSVcyQUhSZ1pYc21PdVh0U0lTcWZSTnBNTUhPN1M3cU9JVUJld00xbEJvcWVkS3dlMjlWcXpoXC9jST0iLCJtYWMiOiJjNjcyYTljYzI2OTg0YjlhZDA1YzZkMjViOGVlOWJjMjk4NzhjNWQ4MmMwOTYxY2RhNzdmZmI1MzZhN2NlNzY2In0=\"}','{\"company_pwd\":\"eyJpdiI6Im9iQ283U0NKWmc5YTR4QW5menVPbmc9PSIsInZhbHVlIjoiRUdTVEI1WlwvSTdoMG1LNEcrdmVjQWNIOXZNa09pcTdFN0FSd2s2c21Bb0tYaXJYcU1tb2pnbVdDXC9OOGVRTHBLV3pRbG1ndE92dmNnSjVCUFgwOFgyMnJka05FaFNpWVRlKzl6ODl3VjQ0UT0iLCJtYWMiOiIyNjg4MTFmNjQ4MTcwYTBkODUzOTVlMzU4OWI5NzFhMGM5NGFlYmU1MjNjOWM2MmFlYmFkNzU3MGVhNGU2ZGNiIn0=\"}','super_admin','http://master.dev/company/15','127.0.0.1','2017-01-06 01:55:35','updated'),('f386ee41-077e-456d-84a8-e30a206da593',11,'App\\Models\\MarketIntelligence','[]','{\"desc\":\"dkfkfhk\",\"location\":\"chennai\",\"loc_lat\":13.0826802,\"loc_lng\":80.2707184,\"taken_by\":\"25\",\"upload\":\"[]\",\"id\":11}','25','http://master.dev/marketinfo','127.0.0.1','2017-01-11 01:54:41','created'),('f5bde81f-8fa6-4bb7-8ab9-39b814309973',15,'App\\Models\\Master','{\"company_name\":\"W2S\",\"company_street\":\"dsdsgfg\",\"company_city\":\"434\",\"company_state\":\"434\",\"company_zipcode\":\"`dsf\",\"company_url\":\"http:\\/\\/www.google.com\",\"company_phone\":\"+919524609638\",\"company_desc\":\"fdfdfdf\",\"company_id\":15,\"company_country\":\"31\",\"company_pwd\":\"eyJpdiI6Ik5VQXNweDI0ekFiZGNrSkUwRFFNdWc9PSIsInZhbHVlIjoicWFIQ0pKRnpTZndMXC9wYkFRNjVScXJySTFQZXZoa0hUVUthb1wvZkdiRDlGdVwvSHByZmxFNkJsZjNTQmVBNm1YbnI0R0FiQ0RwdU1MZndBa21ua292TlhPbGdTQm93bVlEYUVVTTl4VUR4NTQ9IiwibWFjIjoiMzQ4YjQyZGU5ZWY2NTFkZDZlZGI0ODUwNjI2MzE2NzY1NjQyZmUwYjVkMmUxMmZkM2UxNmVkYjkyZjNiYjg5ZCJ9\",\"company_email\":\"kalidafdfdfss@gmail.com\"}','[]','super_admin','http://master.dev/company/15','127.0.0.1','2017-01-12 08:30:01','deleted'),('f629f44d-153c-4a76-b8c1-263b7f2887f9',18,'App\\Models\\Master','[]','{\"company_name\":\"w2s\",\"company_street\":\"thants\",\"company_city\":\"not\",\"company_state\":\"an\",\"company_zipcode\":\"600041\",\"company_url\":\"http:\\/\\/www.w2s.com\",\"company_phone\":\"+919524609638\",\"company_desc\":\"djhjdf\\ndfdf\",\"company_country\":\"problem\",\"company_pwd\":\"eyJpdiI6IklTOE5PZWVGYkZTZEkzN0x4WU9rUkE9PSIsInZhbHVlIjoiSW16N09KVE5BdTUyeXlPdnlyRHlTRnowbHdiZ1MyXC9xM0s0ZFVlRDM3WlwvUWlqMklOVno1VmppT3pOdk91eGUrUUZhcDVZd1wveEhveTRSY0hyN1BlTnU0U09UTWpGOEU4YzB1YW1XMCs2Mmc9IiwibWFjIjoiYTljZWZjMjViZGE5ZTE3OGY1OTY4MTlmMzlmZWIwYTI3N2I2ODE1NGVlMTExYzdjYmFmNzNiMzBkYzk1M2IyZSJ9\",\"company_email\":\"kalidass@way2smile.com\",\"company_id\":18}','super_admin','http://master.dev/company','127.0.0.1','2017-01-13 05:39:30','created'),('f6576c97-02c6-49ff-ba81-c46e9c216ac1',19,'App\\Models\\Market','[]','{\"comp_id\":\"2\",\"comp_activity_id\":\"5\",\"comp_remark\":\"\",\"market_id\":10,\"id\":19}','super_admin','http://master.dev/marketinfo/10','127.0.0.1','2017-01-17 00:12:02','created'),('f6c08549-2588-4b1f-b040-d25a5ab28501',94,'App\\Models\\EmpSchedule','{\"date\":\"2017-01-27\"}','{\"date\":\"2017-01-26\"}','24','http://master.dev/task/94','127.0.0.1','2017-01-09 03:58:02','updated'),('f7a9a243-c93a-458c-be3a-6ea149faaf68',102,'App\\Models\\EmpSchedule','[]','{\"emp\":\"25\",\"date\":\"2017-01-30\",\"add_by\":25,\"id\":102}','25','http://master.dev/task','127.0.0.1','2017-01-10 07:03:37','created'),('f9f6af30-0a67-44ac-8b68-3bfe9f4bb06b',5,'App\\Models\\Market','[]','{\"comp_remark\":\"1\",\"market_id\":11,\"id\":5}','25','http://master.dev/marketinfo/11','127.0.0.1','2017-01-11 02:15:34','created'),('fa1d7b8a-3981-444b-8c5c-2242c0e2b9f5',130,'App\\Models\\ApiAuth','{\"auth_user_agent\":\"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:50.0) Gecko\\/20100101 Firefox\\/50.0\"}','{\"auth_user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36\"}','super_admin','http://master.dev/auth?api','127.0.0.1','2017-01-17 05:47:00','updated'),('fa217007-5ea6-4080-8ec2-c1c4cb77e2b1',12,'App\\Models\\OrderBooking','[]','{\"remarks\":null,\"cust_id\":\"53\",\"quote_ref\":\"ds\",\"order_date\":\"2017-01-24\",\"po_num\":\"fdg\",\"po_date\":\"2017-01-25\",\"ship_to\":\"gf\",\"bil_to\":\"gfg\",\"emp_id\":25,\"files_info\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"order_booking_id\":12}','25','http://master.dev/order','127.0.0.1','2017-01-11 00:50:04','created'),('fc903e08-d139-45d4-a70f-451e284fbe57',130,'App\\Models\\ApiAuth','{\"auth_model\":\"App\\\\Models\\\\User\"}','{\"auth_model\":\"App\\\\Models\\\\SuperAdmin\"}','super_admin','http://master.dev/auth?api','127.0.0.1','2017-01-05 08:55:29','updated'),('fd511e64-707e-456d-9087-5a3b8a44b01a',94,'App\\Models\\EmpSchedule','[]','{\"emp\":\"24\",\"date\":\"2017-01-27\",\"add_by\":24,\"id\":94}','24','http://master.dev/task','127.0.0.1','2017-01-09 03:57:41','created'),('fe5299ec-23f5-4912-93e6-17b8f24d0afc',5,'App\\Models\\ProductOrder','[]','{\"product_id\":\"1\",\"pro_req_date\":\"2017-01-24\",\"pro_quantity\":\"1\",\"order_id\":24,\"id\":5}','25','http://master.dev/order/24','127.0.0.1','2017-01-11 06:56:47','created'),('fe60753c-da42-4afe-8a06-3d2f1cbc5a49',14,'App\\Models\\OrderBooking','{\"files_info\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','{\"files_info\":\"[\\\"uploads\\\\\\/a4d45b69f5473648bfd7d2f134662e52.xlsx\\\"]\"}','super_admin','http://master.dev/order/14','127.0.0.1','2017-01-18 04:56:03','updated'),('ff07f869-3eb5-46c8-96e1-574155e1da7a',10,'App\\Models\\MarketIntelligence','[]','{\"desc\":\"fdf\",\"location\":\"chennai\",\"loc_lat\":0,\"loc_lng\":0,\"taken_by\":\"25\",\"upload\":\"[]\",\"id\":10}','25','http://master.dev/marketinfo','127.0.0.1','2017-01-11 01:53:36','created');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'fdf','gfg','2016-12-28 01:04:04','2016-12-28 01:04:07','2016-12-28 06:34:07'),(2,'kalitrfgfgghhh','dkfkfhk','2017-01-02 04:40:01','2017-01-04 10:42:42','2017-01-04 16:12:42'),(3,'kalitrfgfgghhh','dkfkfhk','2017-01-04 10:42:40','2017-01-04 10:42:40',NULL),(4,'hghg','hgh','2017-01-05 09:27:17','2017-01-05 09:27:17',NULL);
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
INSERT INTO `company_db_info` VALUES (18,'w2s.master.dev','localhost','3306','root','sfa_database','eyJpdiI6InljVUpGU2xSeE80YStwNWZpQzhMVXc9PSIsInZhbHVlIjoid0hcL3NnSmxSWVZZQnhiQ2hJRmhsakE9PSIsIm1hYyI6ImFkZDY1YzFjOWFiYzkyNTMzMTBkNTA4ZGZkYzM0NzI3ZGYxY2QyOWRkYWJiYzAyNzk1MzBhZDg3MGZkOTQ2OGQifQ==','0000-00-00 00:00:00',NULL,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitor`
--

LOCK TABLES `competitor` WRITE;
/*!40000 ALTER TABLE `competitor` DISABLE KEYS */;
INSERT INTO `competitor` VALUES (1,'alidsdsdsdsyty','ytygfg','gfg','2016-12-27 03:34:16','2017-01-11 06:58:41','chennai,india',NULL,'13.0826802','80.27071840000008'),(2,'Chennai','gfg','nothing','2017-01-02 03:34:40','2017-01-02 03:34:40','madurai',NULL,'9.9252007','78.11977539999998'),(3,'fd','gfg','gfg','2017-01-10 01:02:32','2017-01-10 01:02:32','gfg',NULL,'3.933889','-53.125782000000015');
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (41,'1','1','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-12-26 08:51:10','2016-12-26 08:51:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(43,'1','dsfd','fdg','gfgf','f','gfg','Dass Kali','+19524609638','54545','45454',NULL,'2016-12-26 08:58:31','2016-12-26 09:07:19','2016-12-26 09:07:19','dass.kali14@gmail.com','gfg','20.3034175184893','79.8046855','gfg','[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/746c2e995f4397713ab140586924430d.png\"]','Chennai',1),(44,'1','dsfd','fdg','gfgf','f','gfg','Dass Kali','+19524609638','54545','45454',NULL,'2016-12-26 08:59:24','2016-12-26 09:07:20','2016-12-26 09:07:20','dass.kali14@gmail.com','gfg','20.3034175184893','79.8046855','gfg',NULL,'Chennai',1),(45,'1','dsfd','fdg','gfgf','f','gfg','Dass Kali','+19524609638','54545','45454',NULL,'2016-12-26 08:59:50','2016-12-26 09:07:21','2016-12-26 09:07:21','dass.kali14@gmail.com','gfg','20.3034175184893','79.8046855','gfg',NULL,'Chennai',1),(46,'1','dsfd','fdg','gfgf','f','gfg','Dass Kali','+19524609638','54545','45454',NULL,'2016-12-26 09:00:06','2016-12-26 09:07:21','2016-12-26 09:07:21','dass.kali14@gmail.com','gfg','20.3034175184893','79.8046855','gfg',NULL,'Chennai',1),(47,'1','dsfd','fdg','gfgf','f','gfg','Dass Kali','+19524609638','54545','45454',NULL,'2016-12-26 09:00:31','2016-12-26 09:07:23','2016-12-26 09:07:23','dass.kali14@gmail.com','gfg','20.3034175184893','79.8046855','gfg',NULL,'Chennai',1),(48,'kalidass','djsdj','dsdj','dsjdj','djsjs','dsjdjs','dshgdj','+19524609638','djsfdj','djsdj',NULL,'2016-12-26 09:07:58','2016-12-26 09:09:06','2016-12-26 09:09:06','kalidass@gmail.com','djsdj','16.426328078619054','-5.22222499999998','djshdj','[\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]','jsdj',1),(49,'kalidassdsdgfgf','djsdjjhjhj','dsdj','dsjdj','djsjs','dsjdjs','dshgdj','+19524609638','djsfdj','djsdj',NULL,'2016-12-26 09:09:28','2017-01-09 03:59:43','2017-01-09 03:59:43','kalidass@gmail.com','djsdj','12.340796817197432','77.04340000000002','djshdj','[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\"]','jsdj',2),(50,'kalidass','dsd','dsd','dsd','dsd','ds','dsd','+919524609638','dsd','dsd',NULL,'2017-01-08 23:57:13','2017-01-09 03:59:45','2017-01-09 03:59:45','dass.kali14@gmail.com','dsd','12.126727028477408','77.46159820000008','dsd','[]','dsd',17),(51,'fdf','dd','dsd','dsdfdf','dsd','ssd','','+919524609638','ds','',NULL,'2017-01-09 00:22:49','2017-01-17 07:55:51',NULL,'dsd.com@g.com','dsd','13.048718814297999','80.18263829427644','dsd','[\"uploads\\/3dcbe4762c03437a29feaefb2467014a.jpeg\",\"uploads\\/10889252fa481b50d7484eb1e97837a6.jpeg\"]','\\jjkkkjkkjkjkjjhjhjhj',25),(52,'w2s',',',',',',','india','600041','kali','+919524609638','dsd','dsds',NULL,'2017-01-09 00:38:29','2017-01-09 03:59:41','2017-01-09 03:59:41','kalidass@way2smile.co',NULL,'11.527181624018487','78.72001950000003',',','[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/746c2e995f4397713ab140586924430d.png\"]','chennai',16),(53,'company one','fdf','sdf','fdf','fdf','600042','pratap','+12345676879','fdf','df',NULL,'2017-01-09 06:39:06','2017-01-18 05:35:15','2017-01-18 05:35:15','mk@mkone.com','fdf','13.049465642592857','80.28141192744147','fd','[\"uploads\\/fd55617a0d8150a531bdcf396bb44cb9.txt\"]','south',25),(54,'fdf','fdf','fdf','fdf','fdf','fdf','','+919524609638','','',NULL,'2017-01-10 00:10:07','2017-01-17 07:45:32','2017-01-17 07:45:32','dass.kali14@gmail.com',NULL,'29.721792','-95.3458546','fdf','[]','fdf',24),(55,'kalidass','l303','4th main road','chennai,tamil nadu','india','600041','kalidass','+919524609638','43434','43434',NULL,'2017-01-17 03:45:43','2017-01-17 03:45:43',NULL,'kalidass@way2smile.com','thanks','12.9834109','80.25597360000006','thiruvanmiyur','[]','chennai',24),(56,'ds','chennai','india','fd','fd','fdf','kalidass','+919524609638','thanks','tkjjfdfd',NULL,'2017-01-17 07:57:18','2017-01-18 05:43:49',NULL,'dass.kali14@gmail.com','fdf','13.0826802','80.27071840000008','fd','[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/3dcbe4762c03437a29feaefb2467014a.jpeg\",\"uploads\\/746c2e995f4397713ab140586924430d.png\",\"uploads\\/6d484452ce316651052a1c631f9b4d32.txt\"]','chennai',25),(57,'kalidasss','chennai','chennai','tamil nadu','india','600041','dsds','+919524609638','dsjhd','jdhjf',NULL,'2017-01-18 04:12:18','2017-01-18 04:12:18',NULL,'dass.k@gmail.com','thank','12.9610867','80.25918539999998','chennai','[]','chennai',24),(58,'fd','fdf','fdf','fdf','fddfd','3232','fdf','+919524609638','fd','fd',NULL,'2017-01-18 05:34:26','2017-01-18 05:34:26',NULL,'dass@gmail.com','3232','22.59372606392931','29.1796875','fdf','[]','fdf',25);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_cust_schedule`
--

LOCK TABLES `emp_cust_schedule` WRITE;
/*!40000 ALTER TABLE `emp_cust_schedule` DISABLE KEYS */;
INSERT INTO `emp_cust_schedule` VALUES (25,53,'2017-01-27','waiting','0','',25,NULL,NULL,NULL,104),(26,53,'2017-01-28','waiting','0','',25,NULL,'2017-01-11 08:26:02','2017-01-11 08:26:02',104),(27,54,'2017-01-26','waiting','2','1',24,NULL,'2017-01-11 06:47:56','2017-01-11 06:47:56',105),(28,54,'2017-01-26','complete','2','1',24,NULL,'2017-01-11 07:46:30','2017-01-11 07:46:30',105),(29,53,'2017-01-26','waiting','2','1',24,NULL,NULL,NULL,105),(30,53,'2017-01-28','waiting','0','',25,NULL,NULL,NULL,104),(31,53,'2017-01-28','waiting','0','',25,NULL,NULL,NULL,104);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `js_error`
--

LOCK TABLES `js_error` WRITE;
/*!40000 ALTER TABLE `js_error` DISABLE KEYS */;
INSERT INTO `js_error` VALUES (1,'Exception: \"ReferenceError: fdfd is not defined\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\">\nMessage: fdfd is not defined\nStack Trace: ReferenceError: fdfd is not defined\n    at new DevViewCtrl (http://master.dev/app/dev/devview.js:11:1)\n    at Object.instantiate (http://master.dev/bower_components/angular/angular.min.js:42:109)\n    at http://master.dev/bower_components/angular/angular.min.js:91:109\n    at http://master.dev/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n    at http://master.dev/bower_components/angular/angular.min.js:16:71\n    at la (http://master.dev/bower_components/angular/angular.min.js:82:90)\n    at p (http://master.dev/bower_components/angular/angular.min.js:67:274)\n    at g (http://master.dev/bower_components/angular/angular.min.js:59:252)\n    at http://master.dev/bower_components/angular/angular.min.js:58:394\n','2017-01-18 08:54:57',NULL),(2,'Exception: \"ReferenceError: fdfd is not defined\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\">\nMessage: fdfd is not defined\nStack Trace: ReferenceError: fdfd is not defined\n    at new DevViewCtrl (http://master.dev/app/dev/devview.js:11:1)\n    at Object.instantiate (http://master.dev/bower_components/angular/angular.min.js:42:109)\n    at http://master.dev/bower_components/angular/angular.min.js:91:109\n    at http://master.dev/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n    at http://master.dev/bower_components/angular/angular.min.js:16:71\n    at la (http://master.dev/bower_components/angular/angular.min.js:82:90)\n    at p (http://master.dev/bower_components/angular/angular.min.js:67:274)\n    at g (http://master.dev/bower_components/angular/angular.min.js:59:252)\n    at http://master.dev/bower_components/angular/angular.min.js:58:394\n','2017-01-18 08:57:00',NULL),(3,'Exception: \"ReferenceError: fdfd is not defined\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\">\nMessage: fdfd is not defined\nStack Trace: ReferenceError: fdfd is not defined\n    at new DevViewCtrl (http://master.dev/app/dev/devview.js:11:1)\n    at Object.instantiate (http://master.dev/bower_components/angular/angular.min.js:42:109)\n    at http://master.dev/bower_components/angular/angular.min.js:91:109\n    at http://master.dev/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n    at http://master.dev/bower_components/angular/angular.min.js:16:71\n    at la (http://master.dev/bower_components/angular/angular.min.js:82:90)\n    at p (http://master.dev/bower_components/angular/angular.min.js:67:274)\n    at g (http://master.dev/bower_components/angular/angular.min.js:59:252)\n    at http://master.dev/bower_components/angular/angular.min.js:58:394\n','2017-01-18 09:06:52','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(4,'Exception: \"ReferenceError: fdfd is not defined\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\">\nMessage: fdfd is not defined\nStack Trace: ReferenceError: fdfd is not defined\n    at new DevViewCtrl (http://master.dev/app/dev/devview.js:11:1)\n    at Object.instantiate (http://master.dev/bower_components/angular/angular.min.js:42:109)\n    at http://master.dev/bower_components/angular/angular.min.js:91:109\n    at http://master.dev/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://master.dev/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n    at http://master.dev/bower_components/angular/angular.min.js:16:71\n    at la (http://master.dev/bower_components/angular/angular.min.js:82:90)\n    at p (http://master.dev/bower_components/angular/angular.min.js:67:274)\n    at g (http://master.dev/bower_components/angular/angular.min.js:59:252)\n    at http://master.dev/bower_components/angular/angular.min.js:58:394\n','2017-01-18 09:13:52','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market`
--

LOCK TABLES `market` WRITE;
/*!40000 ALTER TABLE `market` DISABLE KEYS */;
INSERT INTO `market` VALUES (1,1,1,'1',9),(2,1,1,'1',11),(3,1,1,'1',13),(4,NULL,NULL,'1',11),(5,NULL,NULL,'1',11),(6,NULL,NULL,'1',11),(7,NULL,NULL,'1',11),(18,2,6,'sd',10),(19,2,5,'',10);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_intelligence`
--

LOCK TABLES `market_intelligence` WRITE;
/*!40000 ALTER TABLE `market_intelligence` DISABLE KEYS */;
INSERT INTO `market_intelligence` VALUES (1,'[]','chennai','chennai,tamilnadu','39.9129412','-104.79560549999997','2017-01-02 03:35:56','2017-01-02 03:51:21','2017-01-02 03:51:21',1),(2,'[]','chennai','chennai,tamilnadu','39.9129412','-104.79560549999997','2017-01-02 03:36:02','2017-01-06 08:30:45','2017-01-06 08:30:45',1),(3,'[\"uploads\\/3dcbe4762c03437a29feaefb2467014a.jpeg\",\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]','chennai','chennai,tamilnadu','39.9129412','-104.79560549999997','2017-01-02 03:36:14','2017-01-11 01:52:55','2017-01-11 01:52:55',1),(4,'[\"uploads\\/3dcbe4762c03437a29feaefb2467014a.jpeg\",\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]','chennai','chennai,tamilnadu','39.9129412','-104.79560549999997','2017-01-02 03:52:01','2017-01-11 01:53:04','2017-01-11 01:53:04',1),(5,'[\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]','sf','chennai','39.9129412','-104.79560549999997','2017-01-11 01:32:45','2017-01-11 01:53:05','2017-01-11 01:53:05',25),(6,'[\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]','sf','chennai','39.9129412','-104.79560549999997','2017-01-11 01:32:51','2017-01-11 01:53:07','2017-01-11 01:53:07',25),(7,'[]','fd','fdf','0','0','2017-01-11 01:48:31','2017-01-11 01:53:02','2017-01-11 01:53:02',25),(8,'[]','fdf','chennai','0','0','2017-01-11 01:49:27','2017-01-11 01:53:14','2017-01-11 01:53:14',25),(9,'[]','fdf','fdf','0','0','2017-01-11 01:51:38','2017-01-11 01:53:12','2017-01-11 01:53:12',25),(10,'[\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]','fdf','chennai','0','0','2017-01-11 01:53:35','2017-01-17 00:12:01',NULL,24),(11,'[]','dkfkfhk','chennai','13.0826802','80.27071840000008','2017-01-11 01:54:41','2017-01-11 01:54:41',NULL,25),(12,'[]','chennai,india','chennai','0','0','2017-01-11 01:55:56','2017-01-11 01:55:56',NULL,25),(13,'[]','chennai,india','chennai','13.0826802','80.27071840000008','2017-01-11 01:56:12','2017-01-11 01:56:12',NULL,25);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master`
--

LOCK TABLES `master` WRITE;
/*!40000 ALTER TABLE `master` DISABLE KEYS */;
INSERT INTO `master` VALUES ('w2s','thants','not','an','600041','http://www.w2s.com','+919524609638','djhjdf\ndfdf',18,'2017-01-13 05:39:29','2017-01-17 06:45:55','problem','eyJpdiI6ImJOVllcL3R5Z2NLWjZSaHUrclZ2VFBBPT0iLCJ2YWx1ZSI6IkF5Q1UzTFJ4bDJWcVd6b2QrUWNuQWRDT05mMzZhK0NcL09vM0ErNUMraUJxQTBEcjdJRXpvUzhFTmtTS0ZDQUhxVmFac3dQMDhZUldIaGRMWVMrZFRxVVZpUk5TN201T1hEQnA1R25lQUo2WT0iLCJtYWMiOiI0NTRkOWRlMjZjOGM1YzI2OTY0NDVhNzZlYTYzZjEwZWFlYTFmNTU1ODZmMDYxZTRlYzdiMmFlMDYwMzBhMGM1In0=','kalidass@way2smile.com',NULL);
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
INSERT INTO `order_bookings` VALUES (8,41,NULL,'1',NULL,'2017-11-14','1','1','1','[\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]',24,'2015-05-01',NULL,'2017-01-11 05:37:21',NULL),(9,53,NULL,'ds','fdg','2017-01-24','gf','gfg',NULL,'[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]',25,'2017-01-26',NULL,'2017-01-11 05:37:30',NULL),(12,53,NULL,'ds','fdg','2017-01-25','gf','gfg',NULL,'[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]',25,'2017-01-24',NULL,'2017-01-11 05:37:33',NULL),(13,53,NULL,'test','gfg','2017-01-24','v','gfg','fg','[\"uploads\\/3dcbe4762c03437a29feaefb2467014a.jpeg\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/746c2e995f4397713ab140586924430d.png\"]',24,'2017-01-24',NULL,NULL,NULL),(14,53,NULL,'fdf','gfgfg','2017-01-09','gfg','gfg','gfg','[\"uploads\\/3dcbe4762c03437a29feaefb2467014a.jpeg\"]',25,'2017-01-23',NULL,NULL,NULL),(16,53,NULL,'gfg','gfg','2017-01-25','gf','gf','ggf','[]',25,'2017-01-16',NULL,NULL,NULL),(22,53,NULL,'fd','fdf','2017-01-24','fd','fd','fdf','[]',25,'2017-02-14',NULL,NULL,NULL),(23,53,NULL,'fd','dfd','2017-01-09','fd','fd','fd','[\"uploads\\/3dcbe4762c03437a29feaefb2467014a.jpeg\"]',25,'2017-01-24',NULL,'2017-01-11 05:37:27',NULL),(24,54,NULL,'direct referal','50000','2017-01-25','thanks','how','you','[]',24,'2017-01-26',NULL,NULL,NULL);
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
INSERT INTO `products` VALUES (1,'kalidass',10,'500','32','test','[]','[]',3,'2017-01-05 01:25:45','2017-01-05 01:25:45',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_types`
--

LOCK TABLES `prospect_types` WRITE;
/*!40000 ALTER TABLE `prospect_types` DISABLE KEYS */;
INSERT INTO `prospect_types` VALUES (1,'Google','testfdf','2016-12-30 09:56:16','2017-01-16 01:22:07',NULL),(2,'Kali dass','test','2016-12-30 09:56:20','2017-01-02 04:40:28','2017-01-02 04:40:28'),(3,'Kali dass','test','2016-12-30 09:56:24','2017-01-02 04:40:26','2017-01-02 04:40:26'),(4,'Kali dass','test','2016-12-30 09:56:27','2016-12-30 09:56:29','2016-12-30 09:56:29'),(5,'Kali dass','test','2016-12-30 09:56:32','2017-01-02 04:40:26','2017-01-02 04:40:26'),(6,'Kali dass','test','2016-12-30 09:56:35','2017-01-02 04:40:27','2017-01-02 04:40:27'),(7,'Kali dass','test','2016-12-30 09:56:37','2017-01-02 04:40:27','2017-01-02 04:40:27'),(8,'Kali dass','test','2016-12-30 09:56:47','2017-01-02 04:40:28','2017-01-02 04:40:28'),(9,'Kali dass','test','2016-12-30 09:56:50','2017-01-02 04:40:28','2017-01-02 04:40:28'),(10,'Kali dass','test','2016-12-30 09:56:52','2017-01-02 04:40:29','2017-01-02 04:40:29'),(11,'KALIDASS','TEST','2017-01-03 00:34:39','2017-01-03 00:34:39',NULL);
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
  `name` varchar(45) DEFAULT NULL,
  `product` varchar(45) DEFAULT NULL,
  `rsp` varchar(45) DEFAULT NULL,
  `wsp` varchar(45) DEFAULT NULL,
  `stk` varchar(45) DEFAULT NULL,
  `visit_report_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rep_ind_cmp_1_idx` (`visit_report_id`),
  CONSTRAINT `fk_rep_ind_cmp_1` FOREIGN KEY (`visit_report_id`) REFERENCES `visit_report` (`report_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rep_ind_cmp`
--

LOCK TABLES `rep_ind_cmp` WRITE;
/*!40000 ALTER TABLE `rep_ind_cmp` DISABLE KEYS */;
INSERT INTO `rep_ind_cmp` VALUES (1,NULL,NULL,NULL,NULL,NULL,1);
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
  `profile_image` varchar(45) DEFAULT NULL,
  `belongs_manager` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_user_1_idx` (`role_id`),
  CONSTRAINT `fk_user_1` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'kali','dass','eyJpdiI6IkRCSEkrd0NzT3Z0NHErMVo5YzZpRmc9PSIsInZhbHVlIjoibWplb09Uak44bHZZWUVoOGJzdVwvMUE9PSIsIm1hYyI6ImI5YmJlZDEwNGMxNDgxYmM2M2EyNmMwY2VmNTE3N2QwZGE2MDBiNTMxYTk0YWFmZmFhMGVkMDQ4MzVjNzQ4Y2IifQ==','dass',NULL,NULL,NULL,NULL,NULL,'2017-01-08 23:36:04','kalidass@gmail.com',1,NULL,NULL,NULL,NULL,'2017-01-08 23:36:04',NULL,NULL),(2,3,'manager','kitty','eyJpdiI6ImpFZUZ4MWVZbWhjRVlOY0VBRGltY0E9PSIsInZhbHVlIjoiUUlqQU9LakdlZTQyQ3AwVytLd3FLUT09IiwibWFjIjoiMWU0OGFjM2MzZjk3YjNmMjIwNjgwN2MzMTBjYjgzZDdkN2Q2MDIxNTliYzA2YjkwMjc4M2Q2NWNiODljMGI5YyJ9','+919524609638','dsd','dsd','dsd','dds','0000-00-00 00:00:00','2017-01-08 23:36:10','manager@sfa.com',1,NULL,NULL,'fdf','','2017-01-08 23:36:10',NULL,NULL),(5,2,'Kali Dass','W2s','eyJpdiI6IkNmU05qM09SSUFxVlFKSDF3NkZaZFE9PSIsInZhbHVlIjoiSDA2QXdJTDJvWXI3cVRkK1pCeExGUT09IiwibWFjIjoiZmM5NWM5YjcxNDgzM2E1MzQ3M2QxMWUwMDBmYjIxOTUzN2FiNGYwM2NlYWI3YTE2MmY3NzIyNTJiY2EyYzc1MiJ9','+919524609637','das','dass','tamil nadu','600041','2017-01-08 23:27:31','2017-01-08 23:36:12','kalidass@way2smile.com',0,NULL,NULL,'india','9524609638','2017-01-08 23:36:12',NULL,NULL),(8,2,'Kali Dass','W2s','eyJpdiI6Ik44eFNEUEV1dmlmUDllbm1XdFR5SFE9PSIsInZhbHVlIjoiWXErT242WFhNN3F5Y09RdTJ0Z2ppdz09IiwibWFjIjoiZWZkODM3NTJkMTdhY2NmZWI0ZGRlMmZlMDY3NDJjNGJhZTMwMmZiMzA2ZGQzOTA5MmUwYWEzZWJkNmE4OTc0ZCJ9','+919524609637','das','dass','tamil nadu','600041','2017-01-08 23:29:58','2017-01-09 02:04:28','kalidass@way2smile.co',0,NULL,NULL,'india','','2017-01-09 02:04:28',NULL,NULL),(9,2,'Kali Dass','W2s','eyJpdiI6IkpHVkd3UFh1YlwvWHJwUG1SdXRmUHB3PT0iLCJ2YWx1ZSI6IlRYanlZQU04Q0lIbWtyMzVCUnJBaFE9PSIsIm1hYyI6Ijc1ZjMyYjhhODMwNTg4ODg5MDAxNTY3NzU1ZWFmZmE0ODliNzI5MTA1MzgwOThiYTVlZGI2MWFlZGFhNDcxOGUifQ==','+919524609637','dasfdf','dass','tamil nadu','600041','2017-01-08 23:30:30','2017-01-08 23:37:48','kalidass@way2smile.c',0,NULL,NULL,'india','','2017-01-08 23:37:48',NULL,NULL),(10,2,'Kali Dass','W2s','eyJpdiI6ImU0Z1VmNEc0SnlEZmFVVnZnazVpS2c9PSIsInZhbHVlIjoidUswXC9NODZhQTdDOVpoWUhibTRPS2c9PSIsIm1hYyI6ImQ5NjlhMmI3YWViZTc1NWRjNjhjMzM0NmJmNWFhNTIzNjM3MTYyYTQwMGZhOTMxM2YzYTJhZTA0YzczMmQ5MDAifQ==','+919524609637','das','dass','tamil nadu','600041','2017-01-08 23:31:09','2017-01-08 23:37:35','kalidass@way2sile.c',0,NULL,NULL,'india','9524609638','2017-01-08 23:37:35',NULL,NULL),(14,2,'kalidass','dass','eyJpdiI6IlltRGlwVkdcL1NMYVE5S0hIc1krK0FBPT0iLCJ2YWx1ZSI6Ilg4cSszXC81cUowekd0Mm01VGNseGxRPT0iLCJtYWMiOiIxMTg3NGFiMzgzYWNkMzM0MjkzYjk2MjYwZmNhNmUxYzIwMjI0NjFiM2U4ZWI2MmEyZGY5MzU3YjEwNjVjYjE2In0=','+919524609638','dsd','dsd','fds','sdsf','2017-01-08 23:39:01','2017-01-09 02:04:26','kalidass@way2.com',1,NULL,NULL,'sf','fdf','2017-01-09 02:04:26',NULL,NULL),(16,2,'fdffdfdfdfdf','http://www.s.com','eyJpdiI6Ik1NenpERG1GMTVjM0J1XC93emtSQklRPT0iLCJ2YWx1ZSI6ImZ6WEdwUmNCUXZBTW81MHpPNXJMRHc9PSIsIm1hYyI6IjAyYzEyMzQ3ZGQ3YzAzZmRmYTkwMTBjMjQ0OGIyMDQ3MjNiMjA2ZmQwZDAyYjE1OTA1YzAyYzdlYTIzMmJmMWUifQ==','+919524609638','dsd','dss','dsf','dfdf','2017-01-08 23:40:13','2017-01-09 02:04:24','kali@gmail.com',1,NULL,NULL,'sfdf','dsf','2017-01-09 02:04:24',NULL,NULL),(17,2,'fdffdfdfdfdf','http://www.s.com','eyJpdiI6ImZkOFowRUF1NGZ6dUlHV09TZm1CbUE9PSIsInZhbHVlIjoiU3l0eGxJUkgwZFB2aVJ4K1dzdkFkQT09IiwibWFjIjoiNzY1Y2MyYWNkMTg0NTBhOTJjMjczYTQyMWE2MzExYjRhMDQ0OTdhZGMwZmJiYWI0YTE1Y2IzMGRkOTYwZjc5YyJ9','+919524609638','dsd','dss','dsf','dfdf','2017-01-08 23:40:59','2017-01-09 02:04:21','ali@gmail.com',1,NULL,NULL,'sfdf','','2017-01-09 02:04:21',NULL,NULL),(19,3,'gf','ggfg','eyJpdiI6IkNPNkdqUHJuZ3l2MU9hV082N2lUdWc9PSIsInZhbHVlIjoiY3ZIdUtmZjNmOXN4R0RpeUtTRE9cL3c9PSIsIm1hYyI6ImM0ZjBkMTNhM2M4YzliOTM0Y2VlMjU3Yjc4MDE3ZTBkMmQyYjUxNTcwZDRlMmUyODc3Njk3ZDgxZTAzNGEwZGUifQ==','+919524609638','sfd','ds','fd','fdfd','2017-01-08 23:41:58','2017-01-09 02:04:20','kalidass@g.com',1,NULL,NULL,'sfs','fdf','2017-01-09 02:04:20',NULL,NULL),(20,2,'dfd','dhfd','eyJpdiI6Ik1VYTU4UVdcL3I0bmFwTjZBY2ZoQWJnPT0iLCJ2YWx1ZSI6Ind2RDBcL0R3KzBQNUNQMGVKdFwvQjR1UT09IiwibWFjIjoiZTQ2ZmU3ZTM2ZDc5M2NmNzY2ZTNlMTIwNDFkN2YwM2I5ZWJmMWIzZjQyODkyOGM5NjEzYjMxZmE3YWY2MGIyMiJ9','+919524609638','dsh','sdfhdjf','djsfhdj','fdsjhfj','2017-01-08 23:44:08','2017-01-08 23:49:22','jfdjf@g.cm',1,NULL,NULL,'jsfhjd','dsjj','2017-01-08 23:49:22',NULL,NULL),(21,3,'sdf','fdf','eyJpdiI6Ik02eitwK0hNTlVYcWZTRURnUTNcL3ZBPT0iLCJ2YWx1ZSI6ImhSWHJpaG5cL2dEMGRDYkJaXC9uZmtkZz09IiwibWFjIjoiMjNlZmVkOGI0ODFkMWViYTk5Y2UxY2FiMDhlNjJlYmUxZTcwNDY2ZDM5YzliMzRiODNhZDA2ZTE4YzI3ZmZkYiJ9','+919524609638','djshfj','jsfjdf','djsfhj','djsjd','2017-01-08 23:45:11','2017-01-08 23:49:20','djshj@gmail.c',0,NULL,NULL,'djshj@gmail.c','csjc','2017-01-08 23:49:20',NULL,NULL),(22,3,'fdf','fdf','eyJpdiI6ImRnMFc2alp2STdWMUROU1dRVDdaaHc9PSIsInZhbHVlIjoiXC94dkM0c0VJclwveEI5YitoTmx6UUZnPT0iLCJtYWMiOiIwODQyNDI1NDU3NmQ1NDljOTI0Zjk5YzVlMmIxMmI5NDA1NDUzMzFjMmZmZTkyNTE0MTNhN2ZlZGFmZmE4N2M4In0=','+919524609638','fdf','dsf','fd','fd','2017-01-08 23:46:50','2017-01-08 23:49:19','dass.kali14@gmail.com',1,NULL,NULL,'fdf','fdf','2017-01-08 23:49:19',NULL,NULL),(23,3,'gfg','gfg','eyJpdiI6InhZXC9cL0NLaUxmemJTM0tuN01OZlpBZz09IiwidmFsdWUiOiJMeFZjMFpDSlhOZEFPT3IrTVN1TThnPT0iLCJtYWMiOiJjMzI2ZWUwOWI1OWRlOTlhNmYzYzUwNWVmZGEzZWIxZmQyMjBhYTRhZGI3ZDc0MmU4ZjEyNDRlYzlhN2UyMGJmIn0=','+919524609638','dsjkfhdj','fdfhd','fdjhfj','dsfdg','2017-01-08 23:48:15','2017-01-08 23:49:17','dass.k@gmail.com',0,NULL,NULL,'dsdh','','2017-01-08 23:49:17',NULL,NULL),(24,3,'Kali Dass','W2s','eyJpdiI6Ik1hbmxsQzk0aEZuNmVvSWlHSnN1cFE9PSIsInZhbHVlIjoiNURlM081OXBPT0d3dkJcL0h4ZmVyM1E9PSIsIm1hYyI6IjM2NGJjNTI1MzZiZDNiNTQzNzQ4ZWFlNjVmZDkwNjg0ZjE4Y2U1NGZjOTVkMTE3OTgyMGMzYjYyYjlmNmUwYTQifQ==','+919524609638','chennai','dsds','tamil nadu','600041','2017-01-09 03:56:15','2017-01-17 04:53:20','dass@gmail.com',1,NULL,NULL,'india','',NULL,NULL,NULL),(25,2,'Test sales','employee','eyJpdiI6IkRxV21iUE02M1YyUnB3cGNIQTBBb1E9PSIsInZhbHVlIjoiWXU4ZVExalFpZVo4MnVUWnFqUWxjQT09IiwibWFjIjoiYjYyMGZlNGI4NTIyYzQ2MzgxMzE2NTVlYTI1NGUwNDA5MzVjZjZjYmY3MjY4ZjY4NmNjMGQ2ZTgxOTViMTJkZiJ9','+15123765678','chennai','dummy','tamilnadu','678903','2017-01-09 06:34:58','2017-01-13 07:10:37','mk@mk.com',1,NULL,NULL,'india','',NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_report`
--

LOCK TABLES `visit_report` WRITE;
/*!40000 ALTER TABLE `visit_report` DISABLE KEYS */;
INSERT INTO `visit_report` VALUES (1,'1',53,'kalida','dsd43434','fdf','[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/746c2e995f4397713ab140586924430d.png\",\"uploads\\/746c2e995f4397713ab140586924430d.png\"]','0','0','2017-01-05 01:37:26',NULL,'2017-01-16 04:41:34',0,NULL),(2,'1',49,'kalida','dsd43434','fdf','[]','0','0','2017-01-05 05:09:39',NULL,'2017-01-05 05:09:39',0,NULL);
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

-- Dump completed on 2017-01-18 21:32:02
