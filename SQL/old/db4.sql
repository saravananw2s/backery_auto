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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'dsd','dsd','2016-12-03 06:39:00','2016-12-03 06:44:05','2016-12-03 06:44:05'),(2,'dsddfd','dsdfdf','2016-12-03 06:39:10','2016-12-03 06:46:23','2016-12-03 06:46:23'),(3,'fdf','fdf','2016-12-03 06:39:53','2016-12-03 06:47:38','2016-12-03 06:47:38'),(4,'fdf','fdf','2016-12-03 06:39:58','2016-12-03 06:44:08','2016-12-03 06:44:08'),(5,'fdf','fdf','2016-12-03 06:43:38','2016-12-03 06:44:07','2016-12-03 06:44:07'),(6,'dsddfd','dsdfdf','2016-12-03 06:45:36','2016-12-03 06:46:24','2016-12-03 06:46:24'),(7,'dsddfdfdf','ghghdsdfdffdfdf','2016-12-03 06:45:41','2016-12-03 07:09:33','2016-12-03 07:09:33'),(8,'CampaignsFGFGhfhfhgh','Campaigns','2016-12-03 06:47:32','2016-12-22 09:50:28',NULL),(9,NULL,NULL,'2016-12-07 07:38:57','2016-12-16 00:04:24','2016-12-16 00:04:24');
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
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_auth`
--

LOCK TABLES `api_auth` WRITE;
/*!40000 ALTER TABLE `api_auth` DISABLE KEYS */;
INSERT INTO `api_auth` VALUES (52,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6ImdERWVvQmVkbkIifQ.IpIkaSdAsuz3XULoM74mRUA0TYtQYXFF5oe5iLYSY-k','2016-12-22 04:59:36','2016-12-23 09:37:35','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1);
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
  `user_id` varchar(45) NOT NULL,
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
  CONSTRAINT `fk_attendance_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
INSERT INTO `audits` VALUES ('0a935f52-ee9c-4bf7-bd2a-2edb996d223a',49,'App\\Models\\ApiAuth','[]','[]','1','http://master.dev/auth','127.0.0.1','2016-12-22 02:53:17','updated'),('15e4e5ec-bdf7-43d1-8c31-74b31db8289d',14,'App\\Models\\Master','{\"company_name\":\"kalia\",\"company_street\":\"dsdsd\",\"company_city\":\"sdshghgh\",\"company_state\":\"fdfdf\",\"company_zipcode\":\"600041\",\"company_url\":\"http:\\/\\/www.google.com\",\"company_phone\":\"565656\",\"company_desc\":\"kalidasss\",\"company_id\":14,\"company_country\":\"dsdsds\",\"company_pwd\":\"eyJpdiI6IlFzcGlIeTIwZlBTTk9JdkpQMmhWYXc9PSIsInZhbHVlIjoiTGJVMnluTkNoeFBqMHRaZXlcL0FNZWFRTExGaEtwMHJ2cm9QenBrVmR6a3NJNGQzNzNzdThwcEMxb21oZWx5bGFNM0VraVBIR3ZEUG81Q1B4YXVQY2FDT2xSWXlhVlRQM0h3bHJ4Rm5walJrPSIsIm1hYyI6ImQyNmM0NzJmMmM0YzBiNjAyMDViMmE2NzMzZThmNWZiOGY4MTRjMGEzODhkMjdmNGZjZjQxMjM1NGNhZjExNTQifQ==\",\"company_email\":\"6565@gmail.com\"}','[]','1','http://api.master.dev/company/14','127.0.0.1','2016-12-23 04:06:46','deleted'),('18935dc6-4e4f-43b0-924d-dcce06b4aeaf',51,'App\\Models\\ApiAuth','[]','[]','1','http://master.dev/auth','127.0.0.1','2016-12-22 03:28:42','updated'),('1f3ebf6a-5dc0-4b2e-9b0e-0f81e851d838',49,'App\\Models\\ApiAuth','[]','[]','1','http://master.dev/auth','127.0.0.1','2016-12-22 02:44:14','updated'),('2e2f722f-2fff-4bc0-813d-400e5815534c',67,'App\\Models\\EmpSchedule','[]','{\"emp\":2,\"date\":\"2016-12-31\",\"add_by\":1,\"id\":67}','1','http://master.dev/task','127.0.0.1','2016-12-22 05:40:23','created'),('364215bb-0dae-4b09-a8d3-92a821663428',68,'App\\Models\\EmpSchedule','[]','{\"emp\":2,\"date\":\"2017-01-14\",\"add_by\":1,\"id\":68}','1','http://master.dev/task','127.0.0.1','2016-12-22 05:40:33','created'),('4b706cf0-b386-4f4f-9b2e-0fc3edf9561e',52,'App\\Models\\ApiAuth','{\"auth_user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.75 Safari\\/537.36\"}','{\"auth_user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.87 Safari\\/537.36\"}','1','http://master.dev/auth','127.0.0.1','2016-12-23 09:37:35','updated'),('5535309b-30c1-4d48-a2c1-c41e249acf64',2,'App\\Models\\ProspectType','{\"name\":\"Builderdsfdf\"}','{\"name\":\"Builderdsfdfsdxff\"}','1','http://master.dev/prospect/2','127.0.0.1','2016-12-24 00:50:55','updated'),('59fab469-f344-480b-a659-a00a85dff01b',51,'App\\Models\\ApiAuth','[]','[]','1','http://master.dev/auth','127.0.0.1','2016-12-22 03:26:36','updated'),('69f965b6-40f4-4725-953c-f3f65c5b84c7',8,'App\\Models\\Activity','{\"name\":\"Campaigns\"}','{\"name\":\"CampaignsFGFG\"}','1','http://master.dev/activity/8','127.0.0.1','2016-12-22 05:49:52','updated'),('7147645d-f3f8-4cb3-a0b3-a80f263e0825',52,'App\\Models\\ApiAuth','{\"auth_user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_12) AppleWebKit\\/602.1.50 (KHTML, like Gecko) Version\\/10.0 Safari\\/602.1.50\",\"auth_ip\":\"192.168.1.135\"}','{\"auth_user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.75 Safari\\/537.36\",\"auth_ip\":\"127.0.0.1\"}','1','http://master.dev/auth','127.0.0.1','2016-12-23 00:31:35','updated'),('7a2165ff-cd8f-4055-bce1-f9eec18d1e42',38,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','1','http://api.master.dev/customer/38','127.0.0.1','2016-12-24 00:40:05','updated'),('8b2eaf86-1688-4abe-aa71-9f609bd1ae67',3,'App\\Models\\Category','{\"name\":\"hghdfdfd\",\"desc\":\"hgh\"}','{\"name\":\"KALIDASS\",\"desc\":\"HFJDF\"}','1','http://master.dev/category/3','127.0.0.1','2016-12-24 07:10:38','updated'),('9b46ff77-62bf-4296-9b93-7735450ada3c',38,'App\\Models\\Customer','{\"name\":\"kalidassfdfdf\"}','{\"name\":\"dasskali`32323232\"}','1','http://master.dev/customer/38','127.0.0.1','2016-12-22 02:49:50','updated'),('a60263df-83b3-409c-a79f-d45d491a604b',8,'App\\Models\\Activity','{\"name\":\"CampaignsFGFG\"}','{\"name\":\"CampaignsFGFGhfhfhgh\"}','1','http://192.168.1.132/activity/8','192.168.1.135','2016-12-22 09:50:28','updated'),('b775fae7-6afc-4311-9c26-1bd205f0b419',38,'App\\Models\\Customer','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\"]\"}','{\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','1','http://master.dev/customer/38','127.0.0.1','2016-12-22 02:46:25','updated'),('c0a5d7af-0622-48fa-b04a-a3ffdb303f2e',38,'App\\Models\\Customer','{\"name\":\"dasskali`32323232\",\"address\":\"dsd\",\"city\":\"dsd\",\"zipcode\":\"dsd\",\"contact_person\":\"ddsd\",\"pan\":\"sdd\",\"tin\":\"dsd\",\"email\":\"kalidass@gmail.com\",\"desc\":\"dsd\",\"location\":\"dsds\",\"emp_id\":2}','{\"name\":\"dasskali`32323232fdfd\",\"address\":\"dsdfdf\",\"city\":\"dsdfdf\",\"zipcode\":\"dsdfdfd\",\"contact_person\":\"ddsdfdf\",\"pan\":\"sddfdf\",\"tin\":\"fdfdsd\",\"email\":\"kalidass@gmail.comfdf\",\"desc\":\"fdf\",\"location\":\"dsdsdsds\",\"emp_id\":\"1\"}','1','http://master.dev/customer/38','127.0.0.1','2016-12-22 09:43:12','updated'),('d75d8e1b-bec0-4351-ad17-9196683a06e1',49,'App\\Models\\ApiAuth','[]','[]','1','http://master.dev/auth','127.0.0.1','2016-12-22 02:47:10','updated'),('def4b69d-5a66-4cbb-a4ee-4b01ab0d0454',52,'App\\Models\\ApiAuth','[]','{\"auth_key\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6ImdERWVvQmVkbkIifQ.IpIkaSdAsuz3XULoM74mRUA0TYtQYXFF5oe5iLYSY-k\",\"auth_user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.75 Safari\\/537.36\",\"auth_ip\":\"127.0.0.1\",\"auth_id\":52}','1','http://api.master.dev/auth','127.0.0.1','2016-12-22 04:59:36','created'),('e6caba98-d375-49bf-8f48-9b1bb98e48fa',67,'App\\Models\\EmpSchedule','{\"id\":67,\"emp\":2,\"add_by\":1,\"date\":\"2016-12-31\"}','[]','1','http://master.dev/task/67','127.0.0.1','2016-12-22 05:40:37','deleted'),('f848ab84-06f6-4653-8a8e-76b47e013c02',49,'App\\Models\\ApiAuth','[]','[]','1','http://master.dev/auth','127.0.0.1','2016-12-22 02:58:49','updated'),('fb8206d3-0ddb-4496-bb9a-9bdc1776c050',51,'App\\Models\\ApiAuth','[]','{\"auth_key\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6ImdERWVvQmVkbkIifQ.IpIkaSdAsuz3XULoM74mRUA0TYtQYXFF5oe5iLYSY-k\",\"auth_user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/55.0.2883.75 Safari\\/537.36\",\"auth_ip\":\"127.0.0.1\",\"auth_id\":51}','1','http://master.dev/auth','127.0.0.1','2016-12-22 03:17:35','created'),('fbdd6402-a32f-4f26-acc8-3ed6f5dd00e1',69,'App\\Models\\EmpSchedule','[]','{\"emp\":\"2\",\"date\":\"2016-12-22\",\"add_by\":1,\"id\":69}','1','http://master.dev/task','127.0.0.1','2016-12-22 05:42:06','created');
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
  `cus_id` int(11) DEFAULT NULL,
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
  `taken_by` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT '0',
  PRIMARY KEY (`case_id`),
  KEY `fk_cases_1_idx` (`cus_id`),
  CONSTRAINT `fk_cases_1` FOREIGN KEY (`cus_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
INSERT INTO `category` VALUES (2,'dfglklgh','gfg','2016-12-03 07:24:58','2016-12-04 23:44:57','2016-12-05 05:14:57'),(3,'KALIDASS','HFJDF','2016-12-04 23:44:53','2016-12-24 07:10:37',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_db_info`
--

DROP TABLE IF EXISTS `company_db_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_db_info` (
  `company_id` varchar(45) NOT NULL,
  `sub_domain_url` varchar(45) DEFAULT NULL,
  `sub_db_host` varchar(45) DEFAULT NULL,
  `sub_db_port` varchar(45) DEFAULT NULL,
  `sub_db_user` varchar(45) DEFAULT NULL,
  `sub_db_name` varchar(45) DEFAULT NULL,
  `sub_db_pwd` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  KEY `master_db_link_idx` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_db_info`
--

LOCK TABLES `company_db_info` WRITE;
/*!40000 ALTER TABLE `company_db_info` DISABLE KEYS */;
INSERT INTO `company_db_info` VALUES ('1','master.dev','localhost','3306','root','sfa_database','eyJpdiI6InRMaHVKV2dpQkV2dFFFb2U0cVwvY2FRPT0iLCJ2YWx1ZSI6IjV2VkM5Um1SVjAwSHFwa3JrM25kTEE9PSIsIm1hYyI6ImJhZjA1YjI1MTA0N2VhNGQ0NzZlOGY4NDFhMGJiOTc2YTQ1MmY2N2I3MTgxZGU1ZmVkNDdhZGE4MzMwZWViYmIifQ','0000-00-00 00:00:00',NULL,NULL),('2','35.154.5.174','localhost','3306','root','sfa_database','eyJpdiI6ImQ1RHdhN1VEVm93TkpaZDVcL09EOTFRPT0iLCJ2YWx1ZSI6IlMxTmwwOE9tRmpGdXJIOTBZbjh3Qnc9PSIsIm1hYyI6ImUwYWM0YWE5OTcxZmNiNGMxNTZjMDA5OGNiYTEwMDNkOWM5MGU1OTM0MDg0NzE0MWQ1YTYyYjE2MDEyMjIxODAifQ==',NULL,NULL,NULL),('3','api.master.dev','localhost','3306','root','sfa_database','eyJpdiI6InRMaHVKV2dpQkV2dFFFb2U0cVwvY2FRPT0iLCJ2YWx1ZSI6IjV2VkM5Um1SVjAwSHFwa3JrM25kTEE9PSIsIm1hYyI6ImJhZjA1YjI1MTA0N2VhNGQ0NzZlOGY4NDFhMGJiOTc2YTQ1MmY2N2I3MTgxZGU1ZmVkNDdhZGE4MzMwZWViYmIifQ',NULL,NULL,NULL);
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
INSERT INTO `competitor` VALUES (1,'dsd','dsddsd','dsdsd','2016-12-03 05:33:25','2016-12-03 05:38:34','fdfdf ka','2016-12-03 05:38:34','dsd','dsdgfgf'),(2,'Chennai','Test','Gooolge','2016-12-03 05:33:35','2016-12-03 05:44:14','Chennai,india',NULL,'13.0826802','80.27071840000008'),(3,'dsd','dsddsd','dsdsd','2016-12-03 05:33:41','2016-12-03 05:38:37','dsddsdsdsd','2016-12-03 05:38:37','dsd','dsd'),(4,'gfg','gfg','gf','2016-12-03 05:34:39','2016-12-03 05:45:28','London,uk',NULL,'51.5073509','-0.12775829999998223'),(5,'fdf','fdf','fdf','2016-12-03 05:35:42','2016-12-03 05:38:38','fdf','2016-12-03 05:38:38','fdf','fd'),(6,'gfg','gfg','gf','2016-12-03 05:36:19','2016-12-03 05:38:39','gf','2016-12-03 05:38:39','gfg','gf'),(7,'Kali Dass','dsd','hh','2016-12-03 05:49:48','2016-12-04 23:46:25','chennai','2016-12-04 23:46:25','13.0826802','80.27071840000008'),(8,'gh','fdf','fdf','2016-12-03 05:50:19','2016-12-04 23:46:18','hghg',NULL,'30.2359486','120.4388907');
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
  `month` varchar(45) DEFAULT NULL,
  `credit_limit` varchar(45) DEFAULT NULL,
  `credit_terms` varchar(45) DEFAULT NULL,
  `outstandings` varchar(45) DEFAULT NULL,
  `last_visited` timestamp NULL DEFAULT NULL,
  `over_due` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_statistics`
--

LOCK TABLES `customer_statistics` WRITE;
/*!40000 ALTER TABLE `customer_statistics` DISABLE KEYS */;
INSERT INTO `customer_statistics` VALUES (1,39,2007,'01','5000','test','500','0000-00-00 00:00:00','8000',NULL,NULL,NULL),(2,39,2006,'02','8000','test','5000','0000-00-00 00:00:00',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (38,'dasskali`32323232fdfd','dsdfdf','dsdfdf','dsd','dsd','dsdfdfd','ddsdfdf','+919524609638','sddfdf','fdfdsd',NULL,'2016-12-19 09:12:02','2016-12-24 00:40:05',NULL,'kalidass@gmail.comfdf','fdf','33.3593113','-112.38215179999997','dsd','[\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/3dcbe4762c03437a29feaefb2467014a.jpeg\",\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/746c2e995f4397713ab140586924430d.png\",\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/746c2e995f4397713ab140586924430d.png\"]','dsdsdsds',1),(39,'kalidassgfgfgfg','kkdfkdf','fdkfk','dskfdk','dksfkd','fdkjfkfdf','dasskali','+919524609638','98493849394','349859459',NULL,'2016-12-19 10:35:54','2016-12-21 09:15:54',NULL,'kalidass@gmail.com','dkfkdf','12.897489183755892','80.1123046875','kdsjfkdfdf','[\"uploads\\/3dcbe4762c03437a29feaefb2467014a.jpeg\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]','chennaiaa',1);
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
INSERT INTO `emp_cust_schedule` VALUES (1,39,'2017-01-05','approved','text','text',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(2,39,'2017-01-05','2017-01-05','2017-01-05','2017-01-05',1,NULL,NULL,NULL,1),(4,39,'2016-12-15',NULL,'1','1',2,NULL,NULL,NULL,5),(5,39,'2016-12-31',NULL,'1','2',2,NULL,NULL,NULL,11),(6,39,'2016-12-31',NULL,'1','1',2,NULL,NULL,NULL,12),(7,39,'2016-12-31',NULL,'','',2,NULL,NULL,NULL,13),(8,39,'2016-12-31',NULL,'1','thank you',2,NULL,NULL,NULL,14),(9,39,'2016-12-30',NULL,'1','',2,NULL,NULL,NULL,16),(10,39,'2016-12-30',NULL,'1','',2,NULL,NULL,NULL,17),(11,39,'2016-12-30',NULL,'1','',2,NULL,NULL,NULL,18),(12,39,'2016-12-30',NULL,'1','',2,NULL,NULL,NULL,19),(13,39,'2016-12-30',NULL,'1','',2,NULL,NULL,NULL,20),(14,39,'2016-12-30',NULL,'1','',2,NULL,NULL,NULL,21),(15,39,'2016-12-30',NULL,'1','',2,NULL,NULL,NULL,22),(16,39,'2016-12-21',NULL,'1','1',1,NULL,NULL,NULL,23),(17,39,'2016-12-21',NULL,'','',1,NULL,NULL,NULL,25),(18,39,'2016-12-21',NULL,'1','1',1,NULL,NULL,NULL,26),(19,39,'2016-12-21',NULL,'','',1,NULL,NULL,NULL,28),(20,39,'2016-12-21',NULL,'','',1,NULL,NULL,NULL,29),(21,39,'2016-12-21',NULL,'','',2,NULL,NULL,NULL,30),(22,39,'2016-12-21',NULL,'','',2,NULL,NULL,NULL,31),(23,39,'2016-12-21',NULL,'1','',2,NULL,NULL,NULL,32),(24,39,'2016-12-21',NULL,'1','',2,NULL,NULL,NULL,35),(47,39,'2016-12-21',NULL,NULL,'',2,NULL,NULL,NULL,47),(48,39,'2016-12-21',NULL,NULL,'',2,NULL,NULL,NULL,59),(49,39,'2016-12-21',NULL,NULL,'',2,NULL,NULL,NULL,60),(50,39,'2016-12-21',NULL,'1','',2,NULL,NULL,NULL,62),(51,39,'2016-12-21',NULL,'1','',2,NULL,NULL,NULL,62),(52,39,'2016-12-21',NULL,NULL,'',2,NULL,NULL,NULL,63),(53,39,'2016-12-21',NULL,NULL,'',2,NULL,NULL,NULL,63),(54,39,'2016-12-21',NULL,NULL,'',2,NULL,NULL,NULL,64),(55,39,'2016-12-21',NULL,NULL,'',2,NULL,NULL,NULL,64),(56,39,'2016-12-21',NULL,NULL,'',2,NULL,NULL,NULL,66),(57,39,'2016-12-21',NULL,NULL,'',2,NULL,NULL,NULL,66),(58,39,'2016-12-31',NULL,'1','',2,NULL,NULL,NULL,67),(59,39,'2017-01-14',NULL,'1','',2,NULL,NULL,NULL,68),(60,39,'2016-12-22',NULL,'test','kali',2,NULL,NULL,NULL,69);
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
  CONSTRAINT `fk_emp_schedule_1` FOREIGN KEY (`emp`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_schedule`
--

LOCK TABLES `emp_schedule` WRITE;
/*!40000 ALTER TABLE `emp_schedule` DISABLE KEYS */;
INSERT INTO `emp_schedule` VALUES (1,1,'0000-00-00 00:00:00','2016-12-21 02:46:23','2016-12-21 02:46:23',1,'2015-05-20'),(2,2,'2016-12-21 02:08:21','2016-12-21 02:46:17','2016-12-21 02:46:17',1,'2016-12-30'),(3,2,'2016-12-21 02:08:24','2016-12-21 02:45:43','2016-12-21 02:45:43',1,'2016-12-30'),(4,2,'2016-12-21 02:08:44','2016-12-21 02:45:42','2016-12-21 02:45:42',1,'2016-12-30'),(5,2,'2016-12-21 02:09:51','2016-12-21 02:45:41','2016-12-21 02:45:41',1,'2016-12-15'),(6,1,'2016-12-21 02:10:29','2016-12-21 02:45:41','2016-12-21 02:45:41',1,'2016-12-15'),(7,1,'2016-12-21 02:10:33','2016-12-21 02:45:42','2016-12-21 02:45:42',1,'2016-12-15'),(8,2,'2016-12-21 02:45:48','2016-12-21 02:46:17','2016-12-21 02:46:17',1,'2016-12-31'),(9,2,'2016-12-21 02:46:25','2016-12-21 02:50:13','2016-12-21 02:50:13',1,'2016-12-31'),(10,2,'2016-12-21 02:46:42','2016-12-21 02:49:40','2016-12-21 02:49:40',1,'2016-12-31'),(11,2,'2016-12-21 02:47:40','2016-12-21 02:49:39','2016-12-21 02:49:39',1,'2016-12-31'),(12,2,'2016-12-21 02:50:19','2016-12-21 02:52:39','2016-12-21 02:52:39',1,'2016-12-31'),(13,2,'2016-12-21 02:52:15','2016-12-21 03:16:12','2016-12-21 03:16:12',1,'2016-12-31'),(14,2,'2016-12-21 02:52:26','2016-12-21 02:52:38','2016-12-21 02:52:38',1,'2016-12-31'),(15,2,'2016-12-21 02:53:02','2016-12-21 03:16:10','2016-12-21 03:16:10',1,'2016-12-30'),(16,2,'2016-12-21 02:53:09','2016-12-21 02:53:28','2016-12-21 02:53:28',1,'2016-12-30'),(17,2,'2016-12-21 02:53:12','2016-12-21 02:53:27','2016-12-21 02:53:27',1,'2016-12-30'),(18,2,'2016-12-21 02:53:14','2016-12-21 02:53:27','2016-12-21 02:53:27',1,'2016-12-30'),(19,2,'2016-12-21 02:53:15','2016-12-21 02:53:27','2016-12-21 02:53:27',1,'2016-12-30'),(20,2,'2016-12-21 02:53:16','2016-12-21 02:53:27','2016-12-21 02:53:27',1,'2016-12-30'),(21,2,'2016-12-21 02:53:19','2016-12-21 02:53:26','2016-12-21 02:53:26',1,'2016-12-30'),(22,2,'2016-12-21 02:53:21','2016-12-21 02:53:26','2016-12-21 02:53:26',1,'2016-12-30'),(23,1,'2016-12-21 02:55:07','2016-12-21 03:16:10','2016-12-21 03:16:10',1,'2016-12-21'),(24,1,'2016-12-21 03:03:29','2016-12-21 03:16:10','2016-12-21 03:16:10',1,'2016-12-21'),(25,1,'2016-12-21 03:10:28','2016-12-21 03:16:09','2016-12-21 03:16:09',1,'2016-12-21'),(26,1,'2016-12-21 03:10:53','2016-12-21 03:16:09','2016-12-21 03:16:09',1,'2016-12-21'),(27,1,'2016-12-21 03:11:38','2016-12-21 03:16:08','2016-12-21 03:16:08',1,'2016-12-21'),(28,1,'2016-12-21 03:15:20','2016-12-21 03:16:08','2016-12-21 03:16:08',1,'2016-12-21'),(29,1,'2016-12-21 03:15:23','2016-12-21 03:16:08','2016-12-21 03:16:08',1,'2016-12-21'),(30,2,'2016-12-21 03:15:35','2016-12-21 03:16:07','2016-12-21 03:16:07',1,'2016-12-21'),(31,2,'2016-12-21 03:15:54','2016-12-21 03:16:06','2016-12-21 03:16:06',1,'2016-12-21'),(32,2,'2016-12-21 03:16:15',NULL,'2016-12-21 03:16:15',1,'2016-12-21'),(33,1,'2016-12-21 03:19:51','2016-12-21 03:40:57','2016-12-21 03:40:57',1,'2016-12-21'),(34,2,'2016-12-21 03:31:22','2016-12-21 03:40:57','2016-12-21 03:40:57',1,'2016-12-21'),(35,2,'2016-12-21 03:31:28','2016-12-21 03:40:56','2016-12-21 03:40:56',1,'2016-12-21'),(36,2,'2016-12-21 03:31:33','2016-12-21 03:40:47','2016-12-21 03:40:47',1,'2016-12-21'),(37,2,'2016-12-21 03:31:34','2016-12-21 03:40:47','2016-12-21 03:40:47',1,'2016-12-21'),(38,2,'2016-12-21 03:31:34','2016-12-21 03:40:48','2016-12-21 03:40:48',1,'2016-12-21'),(39,2,'2016-12-21 03:31:34','2016-12-21 03:40:48','2016-12-21 03:40:48',1,'2016-12-21'),(40,2,'2016-12-21 03:31:34','2016-12-21 03:40:48','2016-12-21 03:40:48',1,'2016-12-21'),(41,2,'2016-12-21 03:31:34','2016-12-21 03:40:49','2016-12-21 03:40:49',1,'2016-12-21'),(42,2,'2016-12-21 03:31:35','2016-12-21 03:40:49','2016-12-21 03:40:49',1,'2016-12-21'),(43,2,'2016-12-21 03:31:35','2016-12-21 03:40:49','2016-12-21 03:40:49',1,'2016-12-21'),(44,2,'2016-12-21 03:31:35','2016-12-21 03:40:49','2016-12-21 03:40:49',1,'2016-12-21'),(45,2,'2016-12-21 03:31:36','2016-12-21 03:40:50','2016-12-21 03:40:50',1,'2016-12-21'),(46,2,'2016-12-21 03:31:36','2016-12-21 03:40:50','2016-12-21 03:40:50',1,'2016-12-21'),(47,2,'2016-12-21 03:31:40','2016-12-21 03:40:50','2016-12-21 03:40:50',1,'2016-12-21'),(48,2,'2016-12-21 03:31:45','2016-12-21 03:40:51','2016-12-21 03:40:51',1,'2016-12-21'),(49,2,'2016-12-21 03:31:46','2016-12-21 03:40:51','2016-12-21 03:40:51',1,'2016-12-21'),(50,2,'2016-12-21 03:31:46','2016-12-21 03:40:51','2016-12-21 03:40:51',1,'2016-12-21'),(51,2,'2016-12-21 03:31:46','2016-12-21 03:40:52','2016-12-21 03:40:52',1,'2016-12-21'),(52,2,'2016-12-21 03:31:49','2016-12-21 03:40:52','2016-12-21 03:40:52',1,'2016-12-21'),(53,2,'2016-12-21 03:31:50','2016-12-21 03:40:52','2016-12-21 03:40:52',1,'2016-12-21'),(54,2,'2016-12-21 03:31:51','2016-12-21 03:40:52','2016-12-21 03:40:52',1,'2016-12-21'),(55,2,'2016-12-21 03:31:54','2016-12-21 03:40:53','2016-12-21 03:40:53',1,'2016-12-21'),(56,2,'2016-12-21 03:31:54','2016-12-21 03:40:53','2016-12-21 03:40:53',1,'2016-12-21'),(57,2,'2016-12-21 03:31:54','2016-12-21 03:40:53','2016-12-21 03:40:53',1,'2016-12-21'),(58,2,'2016-12-21 03:32:00','2016-12-21 03:40:54','2016-12-21 03:40:54',1,'2016-12-21'),(59,2,'2016-12-21 03:32:37','2016-12-21 03:40:54','2016-12-21 03:40:54',1,'2016-12-21'),(60,2,'2016-12-21 03:32:50','2016-12-21 03:40:54','2016-12-21 03:40:54',1,'2016-12-21'),(61,2,'2016-12-21 03:33:07','2016-12-21 03:40:55','2016-12-21 03:40:55',1,'2016-12-21'),(62,2,'2016-12-21 03:33:10','2016-12-21 03:40:55','2016-12-21 03:40:55',1,'2016-12-21'),(63,2,'2016-12-21 03:33:32','2016-12-21 03:40:55','2016-12-21 03:40:55',1,'2016-12-21'),(64,2,'2016-12-21 03:37:01','2016-12-21 03:40:56','2016-12-21 03:40:56',1,'2016-12-21'),(65,2,'2016-12-21 03:38:05','2016-12-21 03:40:56','2016-12-21 03:40:56',1,'2016-12-21'),(66,2,'2016-12-21 03:38:14','2016-12-21 03:40:56','2016-12-21 03:40:56',1,'2016-12-21'),(67,2,'2016-12-22 05:40:23','2016-12-22 05:40:37','2016-12-22 05:40:37',1,'2016-12-31'),(68,2,'2016-12-22 05:40:33',NULL,'2016-12-22 05:40:33',1,'2017-01-14'),(69,2,'2016-12-22 05:42:06',NULL,'2016-12-22 05:42:06',1,'2016-12-22');
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
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `lat` varchar(45) DEFAULT NULL,
  `lng` varchar(45) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market`
--

DROP TABLE IF EXISTS `market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comp_name` varchar(45) DEFAULT NULL,
  `comp_activity` varchar(45) DEFAULT NULL,
  `comp_remark` varchar(45) DEFAULT NULL,
  `market_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_market_1_idx` (`market_id`),
  CONSTRAINT `fk_market_1` FOREIGN KEY (`market_id`) REFERENCES `market_intelligence` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market`
--

LOCK TABLES `market` WRITE;
/*!40000 ALTER TABLE `market` DISABLE KEYS */;
INSERT INTO `market` VALUES (8,'fdf','fd','fd',8),(9,'gf','gf','gfg',8),(10,'gfg','gfg','gfg',8),(11,'gfg','gfg','fgfg',8),(12,'test','baser','dskdhsk',8),(13,'dskdhk','dskhsk','asdskss',8),(14,'dsdkj','dskdjk','sfddfd',8);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_intelligence`
--

LOCK TABLES `market_intelligence` WRITE;
/*!40000 ALTER TABLE `market_intelligence` DISABLE KEYS */;
INSERT INTO `market_intelligence` VALUES (8,'[\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\"]','Desc','Chennai','38.89428494649416','-64.27802737499997','2016-12-07 00:25:26','2016-12-07 00:43:49',NULL,1),(9,'null',NULL,NULL,NULL,NULL,'2016-12-07 07:38:57','2016-12-07 07:38:57',NULL,NULL),(10,'[\"uploads\\/f4644b273c7e9823af7b8cc38c9b6995.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/d6c594a8ab2957722421c517ae5304ba.png\",\"uploads\\/746c2e995f4397713ab140586924430d.png\"]','test','test','39.9129412','-104.79560549999997','2016-12-08 09:10:03','2016-12-08 09:10:03',NULL,1);
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
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master`
--

LOCK TABLES `master` WRITE;
/*!40000 ALTER TABLE `master` DISABLE KEYS */;
INSERT INTO `master` VALUES ('ddkalidassdass','dsdsd','sds','fdfdf','600041','http://www.google.com','ghgh565656','fdfd',12,'2016-11-29 01:45:27','2016-12-21 08:51:41','dsdsds','eyJpdiI6InN5aHM2M1EzcVdLZnBIb042SEVHZkE9PSIsInZhbHVlIjoiYkhiWXB3Y2V5WWl0K3JXcXF3ZUhQR2hiWVh1R1hnaUNlTlwvWXZYQnRLODArV0tLWk14ajdTRmV5aDlGaFBnWEJqR0tlQ3RsblRsc0czZHYwSnlFaWV5cldcL205aGFmN0x1bllaV0VEdXd2VT0iLCJtYWMiOiI5NDhmMDRiMDM2NmQwZmFiMjlkZTgxZWIxOWFhY2RjMTUwNTYyMjAwMmU1OGQ0YmZlNjdlYjVjNDlkODQ0MmYwIn0=','6565@gmail.com',NULL),('kalia','dsdsd','sdshghgh','fdfdf','600041','http://www.google.com','565656','kalidasss',14,'2016-11-29 02:11:21','2016-12-23 04:06:46','dsdsds','eyJpdiI6IlFzcGlIeTIwZlBTTk9JdkpQMmhWYXc9PSIsInZhbHVlIjoiTGJVMnluTkNoeFBqMHRaZXlcL0FNZWFRTExGaEtwMHJ2cm9QenBrVmR6a3NJNGQzNzNzdThwcEMxb21oZWx5bGFNM0VraVBIR3ZEUG81Q1B4YXVQY2FDT2xSWXlhVlRQM0h3bHJ4Rm5walJrPSIsIm1hYyI6ImQyNmM0NzJmMmM0YzBiNjAyMDViMmE2NzMzZThmNWZiOGY4MTRjMGEzODhkMjdmNGZjZjQxMjM1NGNhZjExNTQifQ==','6565@gmail.com','2016-12-23 04:06:46');
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2016_12_21_111444_create_activities_table',0),(2,'2016_12_21_111444_create_api_auth_table',0),(3,'2016_12_21_111444_create_attendance_table',0),(4,'2016_12_21_111444_create_audits_table',0),(5,'2016_12_21_111444_create_cases_info_table',0),(6,'2016_12_21_111444_create_category_table',0),(7,'2016_12_21_111444_create_company_db_info_table',0),(8,'2016_12_21_111444_create_competitor_table',0),(9,'2016_12_21_111444_create_customer_statistics_table',0),(10,'2016_12_21_111444_create_customers_table',0),(11,'2016_12_21_111444_create_emp_cust_schedule_table',0),(12,'2016_12_21_111444_create_emp_schedule_table',0),(13,'2016_12_21_111444_create_jobs_table',0),(14,'2016_12_21_111444_create_locations_table',0),(15,'2016_12_21_111444_create_market_table',0),(16,'2016_12_21_111444_create_market_intelligence_table',0),(17,'2016_12_21_111444_create_master_table',0),(18,'2016_12_21_111444_create_new_project_opp_table',0),(19,'2016_12_21_111444_create_one_time_pwd_table',0),(20,'2016_12_21_111444_create_order_bookings_table',0),(21,'2016_12_21_111444_create_product_orders_table',0),(22,'2016_12_21_111444_create_product_statistics_table',0),(23,'2016_12_21_111444_create_products_table',0),(24,'2016_12_21_111444_create_prospect_types_table',0),(25,'2016_12_21_111444_create_quality_cert_table',0),(26,'2016_12_21_111444_create_rep_ind_cmp_table',0),(27,'2016_12_21_111444_create_requests_table',0),(28,'2016_12_21_111444_create_travel_exp_table',0),(29,'2016_12_21_111444_create_user_table',0),(30,'2016_12_21_111444_create_user_roles_table',0),(31,'2016_12_21_111444_create_visit_report_table',0),(32,'2016_12_21_111446_add_foreign_keys_to_attendance_table',0),(33,'2016_12_21_111446_add_foreign_keys_to_cases_info_table',0),(34,'2016_12_21_111446_add_foreign_keys_to_customers_table',0),(35,'2016_12_21_111446_add_foreign_keys_to_emp_cust_schedule_table',0),(36,'2016_12_21_111446_add_foreign_keys_to_emp_schedule_table',0),(37,'2016_12_21_111446_add_foreign_keys_to_market_table',0),(38,'2016_12_21_111446_add_foreign_keys_to_one_time_pwd_table',0),(39,'2016_12_21_111446_add_foreign_keys_to_order_bookings_table',0),(40,'2016_12_21_111446_add_foreign_keys_to_product_statistics_table',0),(41,'2016_12_21_111446_add_foreign_keys_to_products_table',0),(42,'2016_12_21_111446_add_foreign_keys_to_rep_ind_cmp_table',0),(43,'2016_12_21_111446_add_foreign_keys_to_requests_table',0),(44,'2016_12_21_111446_add_foreign_keys_to_travel_exp_table',0),(45,'2016_12_21_111446_add_foreign_keys_to_user_table',0),(46,'2016_12_21_111446_add_foreign_keys_to_visit_report_table',0);
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
  `prospect_type` varchar(45) DEFAULT NULL,
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
  UNIQUE KEY `lead_id_UNIQUE` (`lead_id`)
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
-- Table structure for table `one_time_pwd`
--

DROP TABLE IF EXISTS `one_time_pwd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `one_time_pwd` (
  `id` int(11) NOT NULL,
  `pwd` varchar(45) DEFAULT NULL,
  `userid` varchar(45) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `valid_until` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_one_time_pwd_idx` (`userid`),
  CONSTRAINT `fk_one_time_pwd` FOREIGN KEY (`userid`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `one_time_pwd`
--

LOCK TABLES `one_time_pwd` WRITE;
/*!40000 ALTER TABLE `one_time_pwd` DISABLE KEYS */;
/*!40000 ALTER TABLE `one_time_pwd` ENABLE KEYS */;
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
  PRIMARY KEY (`order_booking_id`),
  KEY `fk_order_bookings_1_idx` (`cust_id`),
  CONSTRAINT `fk_order_bookings_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_bookings`
--

LOCK TABLES `order_bookings` WRITE;
/*!40000 ALTER TABLE `order_bookings` DISABLE KEYS */;
INSERT INTO `order_bookings` VALUES (1,39,'kalidass','555','dsd','0000-00-00 00:00:00','ds','dsd','ds',NULL,0);
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
  `order_id` varchar(45) NOT NULL,
  `product_id` varchar(45) DEFAULT NULL,
  `pro_quantity` varchar(45) DEFAULT NULL,
  `pro_req_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_orders`
--

LOCK TABLES `product_orders` WRITE;
/*!40000 ALTER TABLE `product_orders` DISABLE KEYS */;
INSERT INTO `product_orders` VALUES (1,'1','1','1000','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `product_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_statistics`
--

DROP TABLE IF EXISTS `product_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `pdt_grade` varchar(45) DEFAULT NULL,
  `target` varchar(45) DEFAULT NULL,
  `actuals` varchar(45) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `month` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_statistics_1_idx` (`cust_id`),
  KEY `fk_product_statistics_2_idx` (`prod_id`),
  CONSTRAINT `fk_product_statistics_1` FOREIGN KEY (`prod_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_statistics_2` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_statistics`
--

LOCK TABLES `product_statistics` WRITE;
/*!40000 ALTER TABLE `product_statistics` DISABLE KEYS */;
INSERT INTO `product_statistics` VALUES (1,1,39,'A','500','800',2007,'01',NULL,NULL,NULL),(2,1,39,'B','5000','80',2006,'02',NULL,NULL,NULL);
/*!40000 ALTER TABLE `product_statistics` ENABLE KEYS */;
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
INSERT INTO `products` VALUES (1,'ere',343,'434','434','434','[\"d6c594a8ab2957722421c517ae5304ba.png\",\"d6c594a8ab2957722421c517ae5304ba.png\",\"746c2e995f4397713ab140586924430d.png\"]','[\"61b817333a5f29ecc9d586bc8b240ae7.txt\"]',2,'2016-12-03 08:13:52','2016-12-03 08:13:52',NULL);
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
INSERT INTO `prospect_types` VALUES (1,'fgfggfg','gfggfg','2016-12-03 07:03:35','2016-12-03 07:03:49','2016-12-03 07:03:49'),(2,'Builderdsfdfsdxff','Builder','2016-12-03 07:03:47','2016-12-24 00:50:55',NULL),(3,'Builderdsdsfdfd','Builderfdfdf','2016-12-08 00:04:50','2016-12-16 06:14:12','2016-12-16 06:14:12'),(4,'Builderdsdsfdfddsds','Builderfdfdffdff','2016-12-08 00:04:55','2016-12-16 06:14:13','2016-12-16 06:14:13');
/*!40000 ALTER TABLE `prospect_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_cert`
--

DROP TABLE IF EXISTS `quality_cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_cert` (
  `id` int(11) NOT NULL,
  `cert_id` varchar(45) NOT NULL,
  `comp_id` varchar(45) NOT NULL,
  `prod_id` varchar(45) NOT NULL,
  `bath_id` varchar(45) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `month` varchar(45) DEFAULT NULL,
  `week_no` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_cert`
--

LOCK TABLES `quality_cert` WRITE;
/*!40000 ALTER TABLE `quality_cert` DISABLE KEYS */;
/*!40000 ALTER TABLE `quality_cert` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rep_ind_cmp`
--

LOCK TABLES `rep_ind_cmp` WRITE;
/*!40000 ALTER TABLE `rep_ind_cmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `rep_ind_cmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(45) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `info` text,
  `cus_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `uploads` text,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_requests_1_idx` (`cus_id`),
  CONSTRAINT `fk_requests_1` FOREIGN KEY (`cus_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_exp`
--

DROP TABLE IF EXISTS `travel_exp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_exp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `claim_id` varchar(45) DEFAULT NULL,
  `purpose` varchar(45) DEFAULT NULL,
  `appr_status` varchar(45) DEFAULT '0',
  `location` varchar(45) DEFAULT NULL,
  `hotel_checkin` timestamp NULL DEFAULT NULL,
  `hotel_checkout` timestamp NULL DEFAULT NULL,
  `start_reading` varchar(45) DEFAULT NULL,
  `end_reading` varchar(45) DEFAULT NULL,
  `total_kms` varchar(45) DEFAULT NULL,
  `hotel_exp` varchar(45) DEFAULT NULL,
  `start_read2` varchar(45) DEFAULT NULL,
  `end_read2` varchar(45) DEFAULT NULL,
  `travel_exp` varchar(45) DEFAULT NULL,
  `food_exp` varchar(45) DEFAULT NULL,
  `out_pdt` varchar(45) DEFAULT NULL,
  `travel_with_mngr` varchar(45) DEFAULT NULL,
  `total_exp` varchar(45) DEFAULT NULL,
  `travel_desc` varchar(45) DEFAULT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_travel_exp_1_idx` (`user_id`),
  CONSTRAINT `fk_travel_exp_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_exp`
--

LOCK TABLES `travel_exp` WRITE;
/*!40000 ALTER TABLE `travel_exp` DISABLE KEYS */;
/*!40000 ALTER TABLE `travel_exp` ENABLE KEYS */;
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
  CONSTRAINT `fk_user_1` FOREIGN KEY (`user_id`) REFERENCES `user_roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,4,'kalidass','dass','eyJpdiI6Ikdja24wOTh1ZXFlUmg2NThoWGcrYUE9PSIsInZhbHVlIjoiekI2XC83NG5Pc2E4NGJONEh1MXJGdHc9PSIsIm1hYyI6ImZmYjRjMzFjYTU4YWJkNTg1NzZhMGMzM2VjNjFiZDc5N2UwNzNkYWU2NDhkN2NmZTQ2ZTQ4NzM4MWIzYzE2MGUifQ==','123','chennai',NULL,NULL,NULL,NULL,NULL,'kalidass@gmail.com',1,NULL,NULL,NULL,NULL,NULL),(2,2,'admin','w2s','eyJpdiI6Ikdja24wOTh1ZXFlUmg2NThoWGcrYUE9PSIsInZhbHVlIjoiekI2XC83NG5Pc2E4NGJONEh1MXJGdHc9PSIsIm1hYyI6ImZmYjRjMzFjYTU4YWJkNTg1NzZhMGMzM2VjNjFiZDc5N2UwNzNkYWU2NDhkN2NmZTQ2ZTQ4NzM4MWIzYzE2MGUifQ==','',NULL,NULL,NULL,NULL,NULL,NULL,'admin@gmail.com',2,NULL,NULL,NULL,NULL,NULL);
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
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'superadmin','Root Admin','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'admin','Company Admin',NULL,NULL),(3,'manager','Sales Manager',NULL,NULL),(4,'user','Sales Ref',NULL,NULL);
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

-- Dump completed on 2016-12-24 20:40:02
