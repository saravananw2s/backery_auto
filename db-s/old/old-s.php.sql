-- MySQL dump 10.16  Distrib 10.1.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: 127.0.0.1
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_auth`
--

LOCK TABLES `api_auth` WRITE;
/*!40000 ALTER TABLE `api_auth` DISABLE KEYS */;
INSERT INTO `api_auth` VALUES (137,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6ImdERWVvQmVkbkIiLCJpc3MiOiJtYW5hZ2V0ZWFtei5jb20iLCJ0eXBlIjoibWFuYWdldGVhbXouY29tIn0.nEd201XxN-AtrVHNKuWCWGxlJjwr4J09xoGxpamk-YU','2017-01-23 05:55:22','2017-01-25 02:30:16','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',1,NULL);
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
INSERT INTO `audits` VALUES ('0ed2e072-db17-4904-b509-6b0b2c34f56e',27,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6Ik5kNlhJcTRzbmpXWHl6dFR4WDFFUHc9PSIsInZhbHVlIjoib2E1a3QwdXpOaVRlK21VSERaR1hDRGVJTEdxSll4MXh4XC9vM29MYUk1ZFpJNVwvc1R4NndPa005SyswN2ZsS2FQZGFMWTg2TDFnOUVNK01WN0JhTytKbklxMCtmWDNjdGVjZWlIWHBBWGNLbz0iLCJtYWMiOiJlZjM0YTE1MGJhZjYwYTdiOGU5Y2RmNjczNzNkZGIyNDJjNDY1YzQ5ODU0ODhhOWI1OWQ2ZjBkZThmMjdjZWYyIn0=\"}','{\"company_pwd\":\"eyJpdiI6IjM4RGtWcFN4RHRWR0hBNDhOM2tcL1hBPT0iLCJ2YWx1ZSI6ImhQYSsyeGV1eUlsRDd5dm9qUnlqclAxek4zVTUwNnorR0xsVXVOK2ZpUXZDdEljN1lSYVNGdVA0M0txdzlIbVlYMFMzVDNLVHdJVVhYT0oxQVJ5VkE1UURPSFNJaW9vMVZJV1JSenZGbjVNPSIsIm1hYyI6IjRhOTM2ODBlYzUwOTA5ZDQ1NmJkMzg4OWExNmRlOTExM2E3N2Y0ODBhYzk5ZTYwNTFmZTcwZGY2YTJhZDE5OWMifQ==\"}','super_admin','http://manageteamz.com/company/27','127.0.0.1','2017-01-24 08:31:31','updated'),('1a56bfe5-bd07-4108-9d60-b587241d242c',27,'App\\Models\\Master','{\"company_name\":\"apis\",\"company_pwd\":\"eyJpdiI6IndWY3dtS0NZWDl5OWhqRjJXcFFTbkE9PSIsInZhbHVlIjoiZlwvTkprcDRpbndqblVmQmVUWFhKS0QrVjFVNEt3Y29TVXNQNHF5eG8yalNraDMwQUp5TzBmV3RKN0ZnN0x5Z2o5XC9sbUFxdDRKMW9uNW5sb05RZnJPY293c29RT1JyWU1uZFhLT2ZSeFRiVT0iLCJtYWMiOiI0MjhkZjUxM2I4ZmQzNDA4MjhjMzA0OTNkNjdkZTQ0ZGJhOTlkZDA0YTRlZjVhOGRiNzhlOTMxNTA2MjMxMjAxIn0=\"}','{\"company_name\":\"api\",\"company_pwd\":\"eyJpdiI6Im9Oc0Jpaks5NkIzXC9pZm0zQ245XC9QZz09IiwidmFsdWUiOiIrM2J0endnWkNUWWV6WVl4VEZ1dm5XTGRXSU9NRzhSaWNRdGZ6d2xjSUtma2J4K0RUd1hDVTJNM0EyV0oyZ2NzQzZ5enBcL1BVXC9vWURzM244b1hGS2w1V0RBTmQ2d3hYdEg0bzk0aWRqVnkwPSIsIm1hYyI6IjhhYjMxZTc4Mzc5ZDlmNzdlYjRlNmUxY2U3MWJlZjE0NDczZjIwM2E3NTlmMTI0OGRmYTUyMWE2OTA4OTlkMTgifQ==\"}','super_admin','http://manageteamz.com/company/27','127.0.0.1','2017-01-24 08:48:17','updated'),('23d3ba3b-f0eb-47a1-8992-2c7cfaead925',27,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6Im9Oc0Jpaks5NkIzXC9pZm0zQ245XC9QZz09IiwidmFsdWUiOiIrM2J0endnWkNUWWV6WVl4VEZ1dm5XTGRXSU9NRzhSaWNRdGZ6d2xjSUtma2J4K0RUd1hDVTJNM0EyV0oyZ2NzQzZ5enBcL1BVXC9vWURzM244b1hGS2w1V0RBTmQ2d3hYdEg0bzk0aWRqVnkwPSIsIm1hYyI6IjhhYjMxZTc4Mzc5ZDlmNzdlYjRlNmUxY2U3MWJlZjE0NDczZjIwM2E3NTlmMTI0OGRmYTUyMWE2OTA4OTlkMTgifQ==\"}','{\"company_pwd\":\"eyJpdiI6IjJPNndMTGN2UXVmRFZtN2pBQ2RXWHc9PSIsInZhbHVlIjoiTkdreTBQQ3lDaDdyeUlLejU5cUloWUhzZnpTMVptUUtIVTVlZzEwaUVrVGFMZnJnemRkZFwvcHBTS1hPbU9yRUx6eHdndHozeStjeWxVNWFqczFqdVFcL2hZN09ZT1dOcVlmRXJBS1NDbnZqdz0iLCJtYWMiOiJmNjNlN2UxMTFhNTA5N2IwOWZmODJkYzU1ZmNiOWZkNDkwYjA1NGM0NWMxZThjNjVkODQxNTgwNGY4YWI5YWIyIn0=\"}','super_admin','http://manageteamz.com/company/27','127.0.0.1','2017-01-24 08:50:22','updated'),('3fa5a7d6-e869-455e-a3d0-a74f6dc13b48',27,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6InFkRWdPUDh4QjRuaGNtbnI4eGdiTVE9PSIsInZhbHVlIjoiU0FsQWRHYkZCWFE3dUVVUktUbVdsUERoUGZYZEtkcmNvZXZCY2QrODdxXC92Nm9Lc3l6ZmR6UXB3SzlBeG53bDZvcGNOZ1Bpdk5OS1wvM1p1VXVmbVpJOW5kZW5tQnlyTVFFeHBKMDgyTERpYz0iLCJtYWMiOiI5NjllMTExNjY1Y2I0YTFhZDVhMmVjNWJiMjM5ZTQ0MWZlMjJlNTU1YWNjNmI1YmFhMjA5NGRjMzllOGJhY2I5In0=\"}','{\"company_pwd\":\"eyJpdiI6ImlLa21QM0FYQ0RWOWRKcDFTSU5GU3c9PSIsInZhbHVlIjoiUGx6RGg1ZERrTEJ3WlBOZXFuXC9KMTdYTk5xeWtQWkU5ZkYyTnlpUTRzdGlnYmZBMGQ0aDE0bmJsTzVjSEVnaEd2TkVlczZSMlB0V0tZcTNjS09Ka1AzVThQUWVWVGpieXI3anQ3dnNKRTlvPSIsIm1hYyI6IjBhYmJiMTc4NzRmMjU2YjMxYTE1OWNjOWM0NWNhYzRhYTE5NmJjYmM0YThhOTRlODM1YjAyZDhmZDU4MGQyODUifQ==\"}','super_admin','http://manageteamz.com/company/27','127.0.0.1','2017-01-24 02:17:36','updated'),('428d435a-b590-4385-a9d2-551e2948a97c',27,'App\\Models\\Master','{\"company_name\":\"apiss\",\"company_pwd\":\"eyJpdiI6Im5TOStxamgxMnQ4MTZDd1c1eVZvRVE9PSIsInZhbHVlIjoiSmxUaXZma1VKYmE5Zk1ONmpzUDlMM0Q0VkRlSTI4YjRNNTV2OXA3Y1N0NkdtdzNSaU1EV0toVlwvTFpoUnI5OFlyYXhWdGl6bW5JQk8xTVdwYVJpV3hsTVBrWklnK1hQS21xVjdEMkpSb3hZPSIsIm1hYyI6IjhmZmYxNmIxOGIyYTY5MjNkMzMyNDc3NDEyYTJlZTI2MzFmZDk5ZWQ3MzI5ZmQ1ZDcyODIyNmYxYzYzYjNkZTEifQ==\"}','{\"company_name\":\"api\",\"company_pwd\":\"eyJpdiI6IndyQjF3VmtiaklcL1gweUpIMVhRMFR3PT0iLCJ2YWx1ZSI6ImhEWUIrenY4dW9sVEhkMVZkdE9MRENHQ2RTT2RGWUZhWFVjOVZ4bzJ6azFOYml6MFwvM1wvWkltYjNRRFwvRW0xaXZXY1U0Zzl2azhxXC9ZMWZvWVNsNlRrR3JVd2lBTFV1blU2UXNPOXlZejFOST0iLCJtYWMiOiIxOGNhMTBiMjhlN2JjODY5NTdiZjI2NWVmNWYyYTVhZTZmZTc4NTQ2MDczMGU2ZDEzZGRmZDE5MzAyNDM3NTJhIn0=\"}','super_admin','http://manageteamz.com/company/27','127.0.0.1','2017-01-24 08:39:22','updated'),('4d5b7c69-3e14-4e8f-90b3-8c7557c12bc7',27,'App\\Models\\Master','{\"company_name\":\"api\",\"company_pwd\":\"eyJpdiI6IjJPNndMTGN2UXVmRFZtN2pBQ2RXWHc9PSIsInZhbHVlIjoiTkdreTBQQ3lDaDdyeUlLejU5cUloWUhzZnpTMVptUUtIVTVlZzEwaUVrVGFMZnJnemRkZFwvcHBTS1hPbU9yRUx6eHdndHozeStjeWxVNWFqczFqdVFcL2hZN09ZT1dOcVlmRXJBS1NDbnZqdz0iLCJtYWMiOiJmNjNlN2UxMTFhNTA5N2IwOWZmODJkYzU1ZmNiOWZkNDkwYjA1NGM0NWMxZThjNjVkODQxNTgwNGY4YWI5YWIyIn0=\"}','{\"company_name\":\"apis\",\"company_pwd\":\"eyJpdiI6Im5IY2ttVGdSa3oreHc5SmpubWp3Zmc9PSIsInZhbHVlIjoiamxYRUo0NDV1XC9EYndFT0RYUllKbE5TRitaMUpHZWJZdTZCTTZMT1dLdGtHTzN1MmVXenVhdDZWcE93MlJLM3ptOXZnOUlsRW8wODFmSmpqalBuQ3FcL2YrT3RSMjlsQzVoc3VwNTAwTDlVdz0iLCJtYWMiOiI0NjBhNjY5MzA4ZmEzMzRmMmRkOGM5ZWUzNTZhZmFmMmIyMTVlYmQ5ZDZhMmRkZTZhMjQ1YTZhZTc4ZWIyNTZmIn0=\"}','super_admin','http://manageteamz.com/company/27','127.0.0.1','2017-01-25 00:50:57','updated'),('5e2d43e0-6893-470d-9f3c-075d86004453',27,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6ImlLa21QM0FYQ0RWOWRKcDFTSU5GU3c9PSIsInZhbHVlIjoiUGx6RGg1ZERrTEJ3WlBOZXFuXC9KMTdYTk5xeWtQWkU5ZkYyTnlpUTRzdGlnYmZBMGQ0aDE0bmJsTzVjSEVnaEd2TkVlczZSMlB0V0tZcTNjS09Ka1AzVThQUWVWVGpieXI3anQ3dnNKRTlvPSIsIm1hYyI6IjBhYmJiMTc4NzRmMjU2YjMxYTE1OWNjOWM0NWNhYzRhYTE5NmJjYmM0YThhOTRlODM1YjAyZDhmZDU4MGQyODUifQ==\"}','{\"company_pwd\":\"eyJpdiI6ImZ4TzBTQVNaNnZxcVJoZEt5XC9DQWJBPT0iLCJ2YWx1ZSI6InZueFdGYXJcLzhpblo1a205UXVrZm1vemhTSEhyNlZxUGdCNTN4WnQxOXI4VHo5UmowTFNTU3BNV0VrTVFJY1VycTE3TGlDYTRKdlNhMWlvV242TFQydk5yZ09kV0hFWmdOaCtsTEZsUmhuWT0iLCJtYWMiOiI3NzEyZmEwMzk0NTcyODRhNzM0ODkzODg5YTA0NTg4ODZkYWFjYTQ5MjU1MmQ1YzliOGViNTZhODYyN2RkYTI1In0=\"}','super_admin','http://manageteamz.com/company/27','127.0.0.1','2017-01-24 02:19:49','updated'),('7c480590-31bb-42a6-a8b7-3e4b6c3a3739',27,'App\\Models\\Master','{\"company_name\":\"apis\",\"company_pwd\":\"eyJpdiI6ImxleUFjSFNYNlpSNFptNWd1d0l6RlE9PSIsInZhbHVlIjoiODU4WjlJWGFYV1pcL05mNnlkMUFOdFwvUFFTYTZOSnN3VDFkcVhYNTRHcWpBR3ozYnMxTnZta3VsUzFsY2ltUXhwYWlEemUzK3gzQ0V0a3lhU1RpQXN6OStBbEh3VnBOTTBpaDRlTURCVTl3ND0iLCJtYWMiOiI4NGZkMGU2NDgzMDIzNTNmM2RiNTg5ZjcyODcwN2Q3MjQxYzNjM2Q5YTM1OGE5ZDgyYjYyYjhmNjJjYmIyNDg5In0=\"}','{\"company_name\":\"apiss\",\"company_pwd\":\"eyJpdiI6Im5TOStxamgxMnQ4MTZDd1c1eVZvRVE9PSIsInZhbHVlIjoiSmxUaXZma1VKYmE5Zk1ONmpzUDlMM0Q0VkRlSTI4YjRNNTV2OXA3Y1N0NkdtdzNSaU1EV0toVlwvTFpoUnI5OFlyYXhWdGl6bW5JQk8xTVdwYVJpV3hsTVBrWklnK1hQS21xVjdEMkpSb3hZPSIsIm1hYyI6IjhmZmYxNmIxOGIyYTY5MjNkMzMyNDc3NDEyYTJlZTI2MzFmZDk5ZWQ3MzI5ZmQ1ZDcyODIyNmYxYzYzYjNkZTEifQ==\"}','super_admin','http://manageteamz.com/company/27','127.0.0.1','2017-01-24 08:38:51','updated'),('8377a1b1-d00f-41ba-b390-0bb0ee7bf4e1',27,'App\\Models\\Master','{\"company_name\":\"apis\",\"company_pwd\":\"eyJpdiI6Im5IY2ttVGdSa3oreHc5SmpubWp3Zmc9PSIsInZhbHVlIjoiamxYRUo0NDV1XC9EYndFT0RYUllKbE5TRitaMUpHZWJZdTZCTTZMT1dLdGtHTzN1MmVXenVhdDZWcE93MlJLM3ptOXZnOUlsRW8wODFmSmpqalBuQ3FcL2YrT3RSMjlsQzVoc3VwNTAwTDlVdz0iLCJtYWMiOiI0NjBhNjY5MzA4ZmEzMzRmMmRkOGM5ZWUzNTZhZmFmMmIyMTVlYmQ5ZDZhMmRkZTZhMjQ1YTZhZTc4ZWIyNTZmIn0=\"}','{\"company_name\":\"api\",\"company_pwd\":\"eyJpdiI6IllmMEVGM3Q2Z0lUT0RJQ2VxcVdiN1E9PSIsInZhbHVlIjoidGVGbWw2ZGNCSWpubFhxYWlSS2NISVpwc1hQS0xBM2NjVEhva0dReFAzdTgxTzdZZThCWDNqSFdkbjRyMnFxV2xZaFkxR1RUQXRLK29zMkRVM1pNMitQbVc2RFwvXC9OXC9YYldhdWlCb1c3dlE9IiwibWFjIjoiOGI0OGM3YzdkYWY1MDA2ZjVmYjY1NTMzY2RiMDk1MDFlMzEzNDVjNDc1NWQ5Y2Y2YzZiNTBhNTliMmU4NDQ5NiJ9\"}','super_admin','http://manageteamz.com/company/27','127.0.0.1','2017-01-25 00:51:15','updated'),('8e12ff70-f146-4dd5-a22e-a50a02015fe5',27,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6Ik1qaFpmeGRJVWNTMXc2aGFoRHpZZkE9PSIsInZhbHVlIjoiRGt1RFFKNFU2NmVXUHJXdktkcEpkY0NEa1UrNEdpbDMreDl0cmFuRTBFYW9pYVlZQ3VJM2dURklVTXB2Um9xUEdqcnZ5UzM1QlEzeXNvTG1raTVFbU5SSmptcGhtS3FLaGMwMXdHNUV6MEU9IiwibWFjIjoiZmQwZTZjNmU5NDVmYTQ5YmJkNThkMzE1MjMxOGY5NGZlNDAyNWIyM2Y3ZmQ3ZWQyYTkwNjhiMDBhZWQwMzMyNCJ9\"}','{\"company_pwd\":\"eyJpdiI6ImlZd2UxaUd0Njh0UjJaUTA4QkpqMEE9PSIsInZhbHVlIjoidWdIakcyTFgrV3NWVnRwZGVSdXhmNXdPYkxJMDNwTmE5TmtmVVNySmlBSjk3ZCtEcGNza3BsVWZLWkhcLzFqMytrK2p5Unk4NjJsMFZ2TTdENkQ0QTB2OFRKTnJrSjlBaTFjMUV3WkpBTkJrPSIsIm1hYyI6ImU1YmNjNTIzYjBkMjk1NzdkNzAzMGZkNjk1MWM3ZWQ5OTQ1NmQxZTQ0N2UyZGY2ZTg3N2M3MjEzOWYxZjA5ZmMifQ==\"}','super_admin','http://manageteamz.com/company/27','127.0.0.1','2017-01-23 06:56:57','updated'),('9593bf30-6779-46af-a068-e47de7288c4d',4,'App\\Models\\CompanyDbInfo','[]','{\"sub_domain_url\":\"w2s.manageteamz.com\",\"sub_db_host\":\"localhost\",\"sub_db_port\":\"3306\",\"sub_db_user\":\"root\",\"sub_db_name\":\"w2s_y7ol7\",\"sub_db_pwd\":\"eyJpdiI6IitsR2g3MVpcL0VOUmh3Z1ZWNVNoOEF3PT0iLCJ2YWx1ZSI6InZkK1BxbjRuSCtmUFpQUjZUUkY0VlE9PSIsIm1hYyI6Ijc4ZTAzY2E2OWVlOGUxZDU2Y2IxYTE3NTdjNTM3ZGU3NmNlM2FkNzI5ZThkZDczMWM4YjYyYmJhMTM4NmVmZDcifQ==\",\"company_id\":28,\"id\":4}','super_admin','http://manageteamz.com/company','127.0.0.1','2017-01-23 07:41:10','created'),('96f70c58-d72d-4ba2-9923-7f54b784b6c4',27,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6IlZXOTRWQllmcnhwN1U4N2VwaHVpTGc9PSIsInZhbHVlIjoieWRMd0Rhd3NqemlnSkJ1Mm5qV3V2cDI4ck8yVHArWm55WHZHMER5dGl2Tm0yUFhsUHg1a1F1SVwvRkdzTkIza2tWOVp5M2JBczNXN04rR2hpSHBqWXNoUUVTdURFUFVTTTJ3NGIrR1hMQlwvVT0iLCJtYWMiOiIyOTBlMTAzNTU0ZTAyMDdkYTQzYzcwZTc3Yjg5YmRkYjI3ZGRmNzdhMzU5NzMwNGQxMDNhMmVhZmQ4NWRlMzJmIn0=\"}','{\"company_pwd\":\"eyJpdiI6Inc1WEJvQ1p4MTZEd1B5MTY2c1RWd1E9PSIsInZhbHVlIjoiQ3FXQ1ZyMWJObjUwWDVEZTgxVGdleE1vZEZuR2FzcXlZSFlUVzBFTERGcDVnc0hoYkQ4NHpyc2hVNmlyVlNFaVhxV3pISEFxYStmUDJabzcyMGJPZTNQMksrNlFEdStsNG5WQjcxbnF4bUE9IiwibWFjIjoiY2RmZDhhYWQwNDU0YzNmNGVmZDM4ODBjMjE4NWM2YjQ3N2UzMjk5ZWFkMzc2OWNmYmRkMzA5ZmVjM2M2OWY0YSJ9\"}','super_admin','http://manageteamz.com/company/27','127.0.0.1','2017-01-24 08:48:08','updated'),('9c1d6c2a-80e9-43b0-9583-511e8a3dd4bc',27,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6ImZ4TzBTQVNaNnZxcVJoZEt5XC9DQWJBPT0iLCJ2YWx1ZSI6InZueFdGYXJcLzhpblo1a205UXVrZm1vemhTSEhyNlZxUGdCNTN4WnQxOXI4VHo5UmowTFNTU3BNV0VrTVFJY1VycTE3TGlDYTRKdlNhMWlvV242TFQydk5yZ09kV0hFWmdOaCtsTEZsUmhuWT0iLCJtYWMiOiI3NzEyZmEwMzk0NTcyODRhNzM0ODkzODg5YTA0NTg4ODZkYWFjYTQ5MjU1MmQ1YzliOGViNTZhODYyN2RkYTI1In0=\"}','{\"company_pwd\":\"eyJpdiI6Ik5kNlhJcTRzbmpXWHl6dFR4WDFFUHc9PSIsInZhbHVlIjoib2E1a3QwdXpOaVRlK21VSERaR1hDRGVJTEdxSll4MXh4XC9vM29MYUk1ZFpJNVwvc1R4NndPa005SyswN2ZsS2FQZGFMWTg2TDFnOUVNK01WN0JhTytKbklxMCtmWDNjdGVjZWlIWHBBWGNLbz0iLCJtYWMiOiJlZjM0YTE1MGJhZjYwYTdiOGU5Y2RmNjczNzNkZGIyNDJjNDY1YzQ5ODU0ODhhOWI1OWQ2ZjBkZThmMjdjZWYyIn0=\"}','super_admin','http://manageteamz.com/company/27','127.0.0.1','2017-01-24 07:37:43','updated'),('9ced7e47-d54b-49aa-aac0-6aa5eb93af83',28,'App\\Models\\Master','[]','{\"company_name\":\"w2s\",\"company_street\":\"hanks\",\"company_city\":\"hi\",\"company_state\":\"tamil nadu\",\"company_zipcode\":\"600041\",\"company_url\":\"http:\\/\\/sfa.com\",\"company_phone\":\"+919524609638\",\"company_desc\":\"th\",\"company_country\":\"omdo\",\"company_pwd\":\"eyJpdiI6IlBGaFNlaVViN2hGTUNwSHhPOE1wcEE9PSIsInZhbHVlIjoiMVRoUEpZWXVJNUM2N055ZEhSZzQwXC9VQjNvQ0FyOG1oQ3F1Y1pJcU1JMU05MlFKZlFiWm50VW83Tzd1VWJCeklMMm9MMjdYRW1vcldINHFtVjdxa2ZaMUc0aUVYdlVUZXhJK1QxUGU5RjYwPSIsIm1hYyI6Ijk4YTgxOWFhZjk5ZTZmZDk2MDFjNWFhNjI2NGFiOTJlZDYyYzI5NDY5ZjE1YjY4MjJiMmY0OGIwNTUwZmMwMzMifQ==\",\"company_email\":\"w2s@sfa.com\",\"company_id\":28}','super_admin','http://manageteamz.com/company','127.0.0.1','2017-01-23 07:41:10','created'),('aed97de2-1816-4359-bb84-a6638e1e9795',27,'App\\Models\\Master','[]','{\"company_name\":\"api\",\"company_street\":\"sfa\",\"company_city\":\"chenn\",\"company_state\":\"tamil nadu\",\"company_zipcode\":\"600041\",\"company_url\":\"http:\\/\\/api.com\",\"company_phone\":\"+919524609638\",\"company_desc\":\"dfdf\",\"company_country\":\"indai\",\"company_pwd\":\"eyJpdiI6Ik1qaFpmeGRJVWNTMXc2aGFoRHpZZkE9PSIsInZhbHVlIjoiRGt1RFFKNFU2NmVXUHJXdktkcEpkY0NEa1UrNEdpbDMreDl0cmFuRTBFYW9pYVlZQ3VJM2dURklVTXB2Um9xUEdqcnZ5UzM1QlEzeXNvTG1raTVFbU5SSmptcGhtS3FLaGMwMXdHNUV6MEU9IiwibWFjIjoiZmQwZTZjNmU5NDVmYTQ5YmJkNThkMzE1MjMxOGY5NGZlNDAyNWIyM2Y3ZmQ3ZWQyYTkwNjhiMDBhZWQwMzMyNCJ9\",\"company_email\":\"api@sfa.com\",\"company_id\":27}','super_admin','http://manageteamz.com/company','127.0.0.1','2017-01-23 06:05:44','created'),('b2b42678-ec86-4838-a530-723ebc0705af',28,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6ImwwV0pCVE9Ud3Vhd2RvM0dqcVdOUkE9PSIsInZhbHVlIjoiWHY3SzRtTzVnQ0ErWEhQRUdaM2w0b3VmSmxhZEQzZ3p3QklkNWpNM3IzcUlIK0ppdFdoV3M3SkwrR2FQVmpCcWpvVFwvZXBIUmM0RUd0OEhYUUowem5Dc3ZkOXlUdW9ac3ZxdExROElCVTRzPSIsIm1hYyI6IjQ0NDE4MGZhYTliNmI2OWJhZWY4YmY2NmQxOGJmNTAxYjk3YzcxOWIyMjM0OTJiMWE5ZGQ3OTdjNTI3ZDZlZGIifQ==\"}','{\"company_pwd\":\"eyJpdiI6InRiNkpTXC9NZkxZZ1dHRnFhQUc2WVB3PT0iLCJ2YWx1ZSI6Ijh5a1pBcHVzTUMxakpibFMwTTNOOGZ1VWNEWVBXQ0czVklLakM0bHNPeFlMbmpzRDJVRDluQ2VXT2tYdVA4dzNnaW04bStUUUVsV1ZDXC91Zm9GMGFaZmg3UDNEOHZESU1XeGdOcjJYMTdnTT0iLCJtYWMiOiJmMWVmNDAyY2U0NGM3Mjk4NjIxODEzYjI0NGI3OGZlYWRlNjBmNTZmYWM1ZmU0MDBjMGM4N2FmNGQyYTQwNTc0In0=\"}','super_admin','http://manageteamz.com/company/28','127.0.0.1','2017-01-24 08:50:24','updated'),('beb7ccf7-a16d-4770-904d-a39c2a7340f7',27,'App\\Models\\Master','{\"company_name\":\"api\",\"company_pwd\":\"eyJpdiI6IjM4RGtWcFN4RHRWR0hBNDhOM2tcL1hBPT0iLCJ2YWx1ZSI6ImhQYSsyeGV1eUlsRDd5dm9qUnlqclAxek4zVTUwNnorR0xsVXVOK2ZpUXZDdEljN1lSYVNGdVA0M0txdzlIbVlYMFMzVDNLVHdJVVhYT0oxQVJ5VkE1UURPSFNJaW9vMVZJV1JSenZGbjVNPSIsIm1hYyI6IjRhOTM2ODBlYzUwOTA5ZDQ1NmJkMzg4OWExNmRlOTExM2E3N2Y0ODBhYzk5ZTYwNTFmZTcwZGY2YTJhZDE5OWMifQ==\"}','{\"company_name\":\"apis\",\"company_pwd\":\"eyJpdiI6ImxleUFjSFNYNlpSNFptNWd1d0l6RlE9PSIsInZhbHVlIjoiODU4WjlJWGFYV1pcL05mNnlkMUFOdFwvUFFTYTZOSnN3VDFkcVhYNTRHcWpBR3ozYnMxTnZta3VsUzFsY2ltUXhwYWlEemUzK3gzQ0V0a3lhU1RpQXN6OStBbEh3VnBOTTBpaDRlTURCVTl3ND0iLCJtYWMiOiI4NGZkMGU2NDgzMDIzNTNmM2RiNTg5ZjcyODcwN2Q3MjQxYzNjM2Q5YTM1OGE5ZDgyYjYyYjhmNjJjYmIyNDg5In0=\"}','super_admin','http://manageteamz.com/company/27','127.0.0.1','2017-01-24 08:38:08','updated'),('c6fcd539-d9c0-4b36-8feb-9c19aa0a4d2e',27,'App\\Models\\Master','{\"company_name\":\"api\",\"company_pwd\":\"eyJpdiI6Inc1WEJvQ1p4MTZEd1B5MTY2c1RWd1E9PSIsInZhbHVlIjoiQ3FXQ1ZyMWJObjUwWDVEZTgxVGdleE1vZEZuR2FzcXlZSFlUVzBFTERGcDVnc0hoYkQ4NHpyc2hVNmlyVlNFaVhxV3pISEFxYStmUDJabzcyMGJPZTNQMksrNlFEdStsNG5WQjcxbnF4bUE9IiwibWFjIjoiY2RmZDhhYWQwNDU0YzNmNGVmZDM4ODBjMjE4NWM2YjQ3N2UzMjk5ZWFkMzc2OWNmYmRkMzA5ZmVjM2M2OWY0YSJ9\"}','{\"company_name\":\"apis\",\"company_pwd\":\"eyJpdiI6IndWY3dtS0NZWDl5OWhqRjJXcFFTbkE9PSIsInZhbHVlIjoiZlwvTkprcDRpbndqblVmQmVUWFhKS0QrVjFVNEt3Y29TVXNQNHF5eG8yalNraDMwQUp5TzBmV3RKN0ZnN0x5Z2o5XC9sbUFxdDRKMW9uNW5sb05RZnJPY293c29RT1JyWU1uZFhLT2ZSeFRiVT0iLCJtYWMiOiI0MjhkZjUxM2I4ZmQzNDA4MjhjMzA0OTNkNjdkZTQ0ZGJhOTlkZDA0YTRlZjVhOGRiNzhlOTMxNTA2MjMxMjAxIn0=\"}','super_admin','http://manageteamz.com/company/27','127.0.0.1','2017-01-24 08:48:12','updated'),('d29c8320-8d26-41a5-a252-8796b0df27db',3,'App\\Models\\CompanyDbInfo','[]','{\"sub_domain_url\":\"api.manageteamz.com\",\"sub_db_host\":\"localhost\",\"sub_db_port\":\"3306\",\"sub_db_user\":\"root\",\"sub_db_name\":\"api_guovr\",\"sub_db_pwd\":\"eyJpdiI6InNcL0RxNzNQY3IwMlZaQ1VTbVJzSGNnPT0iLCJ2YWx1ZSI6Ik5ZdXc2dGIwV1BSUjBpVnFjd1h0Tmc9PSIsIm1hYyI6IjUyOGZlYzc2NTMzNTBkZjYyNWJmYWFkZDlmYTI1OTdkYzQ5Y2E2NDIyMmJkZWYyNWRhOTJhMTY1Mjk4ZGMyY2UifQ==\",\"company_id\":27,\"id\":3}','super_admin','http://manageteamz.com/company','127.0.0.1','2017-01-23 06:05:45','created'),('ee1ff45d-9d53-46ff-b72b-5f376b40fe6f',27,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6ImlZd2UxaUd0Njh0UjJaUTA4QkpqMEE9PSIsInZhbHVlIjoidWdIakcyTFgrV3NWVnRwZGVSdXhmNXdPYkxJMDNwTmE5TmtmVVNySmlBSjk3ZCtEcGNza3BsVWZLWkhcLzFqMytrK2p5Unk4NjJsMFZ2TTdENkQ0QTB2OFRKTnJrSjlBaTFjMUV3WkpBTkJrPSIsIm1hYyI6ImU1YmNjNTIzYjBkMjk1NzdkNzAzMGZkNjk1MWM3ZWQ5OTQ1NmQxZTQ0N2UyZGY2ZTg3N2M3MjEzOWYxZjA5ZmMifQ==\"}','{\"company_pwd\":\"eyJpdiI6InFkRWdPUDh4QjRuaGNtbnI4eGdiTVE9PSIsInZhbHVlIjoiU0FsQWRHYkZCWFE3dUVVUktUbVdsUERoUGZYZEtkcmNvZXZCY2QrODdxXC92Nm9Lc3l6ZmR6UXB3SzlBeG53bDZvcGNOZ1Bpdk5OS1wvM1p1VXVmbVpJOW5kZW5tQnlyTVFFeHBKMDgyTERpYz0iLCJtYWMiOiI5NjllMTExNjY1Y2I0YTFhZDVhMmVjNWJiMjM5ZTQ0MWZlMjJlNTU1YWNjNmI1YmFhMjA5NGRjMzllOGJhY2I5In0=\"}','super_admin','http://manageteamz.com/company/27','127.0.0.1','2017-01-23 07:08:55','updated'),('fb716cbc-5eb6-4cdf-93c3-f6cc6feaf296',28,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6IlBGaFNlaVViN2hGTUNwSHhPOE1wcEE9PSIsInZhbHVlIjoiMVRoUEpZWXVJNUM2N055ZEhSZzQwXC9VQjNvQ0FyOG1oQ3F1Y1pJcU1JMU05MlFKZlFiWm50VW83Tzd1VWJCeklMMm9MMjdYRW1vcldINHFtVjdxa2ZaMUc0aUVYdlVUZXhJK1QxUGU5RjYwPSIsIm1hYyI6Ijk4YTgxOWFhZjk5ZTZmZDk2MDFjNWFhNjI2NGFiOTJlZDYyYzI5NDY5ZjE1YjY4MjJiMmY0OGIwNTUwZmMwMzMifQ==\"}','{\"company_pwd\":\"eyJpdiI6ImwwV0pCVE9Ud3Vhd2RvM0dqcVdOUkE9PSIsInZhbHVlIjoiWHY3SzRtTzVnQ0ErWEhQRUdaM2w0b3VmSmxhZEQzZ3p3QklkNWpNM3IzcUlIK0ppdFdoV3M3SkwrR2FQVmpCcWpvVFwvZXBIUmM0RUd0OEhYUUowem5Dc3ZkOXlUdW9ac3ZxdExROElCVTRzPSIsIm1hYyI6IjQ0NDE4MGZhYTliNmI2OWJhZWY4YmY2NmQxOGJmNTAxYjk3YzcxOWIyMjM0OTJiMWE5ZGQ3OTdjNTI3ZDZlZGIifQ==\"}','super_admin','http://manageteamz.com/company/28','127.0.0.1','2017-01-24 07:37:46','updated'),('ff57d09f-61fc-4dac-9163-b3fec2587917',27,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6IndyQjF3VmtiaklcL1gweUpIMVhRMFR3PT0iLCJ2YWx1ZSI6ImhEWUIrenY4dW9sVEhkMVZkdE9MRENHQ2RTT2RGWUZhWFVjOVZ4bzJ6azFOYml6MFwvM1wvWkltYjNRRFwvRW0xaXZXY1U0Zzl2azhxXC9ZMWZvWVNsNlRrR3JVd2lBTFV1blU2UXNPOXlZejFOST0iLCJtYWMiOiIxOGNhMTBiMjhlN2JjODY5NTdiZjI2NWVmNWYyYTVhZTZmZTc4NTQ2MDczMGU2ZDEzZGRmZDE5MzAyNDM3NTJhIn0=\"}','{\"company_pwd\":\"eyJpdiI6IlZXOTRWQllmcnhwN1U4N2VwaHVpTGc9PSIsInZhbHVlIjoieWRMd0Rhd3NqemlnSkJ1Mm5qV3V2cDI4ck8yVHArWm55WHZHMER5dGl2Tm0yUFhsUHg1a1F1SVwvRkdzTkIza2tWOVp5M2JBczNXN04rR2hpSHBqWXNoUUVTdURFUFVTTTJ3NGIrR1hMQlwvVT0iLCJtYWMiOiIyOTBlMTAzNTU0ZTAyMDdkYTQzYzcwZTc3Yjg5YmRkYjI3ZGRmNzdhMzU5NzMwNGQxMDNhMmVhZmQ4NWRlMzJmIn0=\"}','super_admin','http://manageteamz.com/company/27','127.0.0.1','2017-01-24 08:40:14','updated');
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
  `case_id` int(11) NOT NULL AUTO_INCREMENT,
  `open_dt` date DEFAULT NULL,
  `close_dt` date DEFAULT NULL,
  `cust_id` int(11) NOT NULL,
  `batch_details` tinytext,
  `pro_id` int(11) DEFAULT NULL,
  `types` varchar(45) DEFAULT NULL,
  `invoice_ref` varchar(500) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `prob_quantiy` varchar(500) DEFAULT NULL,
  `site_info` varchar(500) DEFAULT NULL,
  `del_from` varchar(500) DEFAULT NULL,
  `desc` text,
  `uploads` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `taken_by` int(11) NOT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`case_id`),
  KEY `fk_cases_1_idx` (`cust_id`),
  KEY `fk_cases_info_1_idx` (`taken_by`),
  KEY `fk_cases_info_2_idx` (`pro_id`),
  CONSTRAINT `fk_cases_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cases_info_1` FOREIGN KEY (`taken_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cases_info_2` FOREIGN KEY (`pro_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_db_info`
--

LOCK TABLES `company_db_info` WRITE;
/*!40000 ALTER TABLE `company_db_info` DISABLE KEYS */;
INSERT INTO `company_db_info` VALUES (27,'api.manageteamz.com','localhost','3306','root','api_guovr','eyJpdiI6InNcL0RxNzNQY3IwMlZaQ1VTbVJzSGNnPT0iLCJ2YWx1ZSI6Ik5ZdXc2dGIwV1BSUjBpVnFjd1h0Tmc9PSIsIm1hYyI6IjUyOGZlYzc2NTMzNTBkZjYyNWJmYWFkZDlmYTI1OTdkYzQ5Y2E2NDIyMmJkZWYyNWRhOTJhMTY1Mjk4ZGMyY2UifQ==','2017-01-23 06:05:44','2017-01-23 06:05:44',NULL,3),(28,'w2s.manageteamz.com','localhost','3306','root','w2s_y7ol7','eyJpdiI6IitsR2g3MVpcL0VOUmh3Z1ZWNVNoOEF3PT0iLCJ2YWx1ZSI6InZkK1BxbjRuSCtmUFpQUjZUUkY0VlE9PSIsIm1hYyI6Ijc4ZTAzY2E2OWVlOGUxZDU2Y2IxYTE3NTdjNTM3ZGU3NmNlM2FkNzI5ZThkZDczMWM4YjYyYmJhMTM4NmVmZDcifQ==','2017-01-23 07:41:10','2017-01-23 07:41:10',NULL,4);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  CONSTRAINT `fk_emp_schedule_1` FOREIGN KEY (`emp`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_emp_schedule_2` FOREIGN KEY (`add_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_schedule`
--

LOCK TABLES `emp_schedule` WRITE;
/*!40000 ALTER TABLE `emp_schedule` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `js_error`
--

LOCK TABLES `js_error` WRITE;
/*!40000 ALTER TABLE `js_error` DISABLE KEYS */;
INSERT INTO `js_error` VALUES (1,'Exception: \"Error: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=UserCtrl&p1=not%20a%20function%2C%20got%20undefined\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\">\nMessage: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=UserCtrl&p1=not%20a%20function%2C%20got%20undefined\nStack Trace: Error: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=UserCtrl&p1=not%20a%20function%2C%20got%20undefined\n    at http://manageteamz.com/bower_components/angular/angular.min.js:6:412\n    at vb (http://manageteamz.com/bower_components/angular/angular.min.js:23:159)\n    at Pa (http://manageteamz.com/bower_components/angular/angular.min.js:23:246)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:90:379\n    at http://manageteamz.com/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:16:71\n    at la (http://manageteamz.com/bower_components/angular/angular.min.js:82:90)\n    at p (http://manageteamz.com/bower_components/angular/angular.min.js:67:274)\n    at g (http://manageteamz.com/bower_components/angular/angular.min.js:59:252)\n','2017-01-24 08:56:08','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(2,'Exception: \"Error: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=UserCtrl&p1=not%20a%20function%2C%20got%20undefined\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\">\nMessage: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=UserCtrl&p1=not%20a%20function%2C%20got%20undefined\nStack Trace: Error: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=UserCtrl&p1=not%20a%20function%2C%20got%20undefined\n    at http://manageteamz.com/bower_components/angular/angular.min.js:6:412\n    at vb (http://manageteamz.com/bower_components/angular/angular.min.js:23:159)\n    at Pa (http://manageteamz.com/bower_components/angular/angular.min.js:23:246)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:90:379\n    at http://manageteamz.com/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:16:71\n    at la (http://manageteamz.com/bower_components/angular/angular.min.js:82:90)\n    at p (http://manageteamz.com/bower_components/angular/angular.min.js:67:274)\n    at g (http://manageteamz.com/bower_components/angular/angular.min.js:59:252)\n','2017-01-24 08:56:29','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(3,'Exception: \"Error: [$compile:tpload] http://errors.angularjs.org/1.5.9/$compile/tpload?p0=reset.html&p1=404&p2=Not%20Found\"\nCaused by: undefined\nMessage: [$compile:tpload] http://errors.angularjs.org/1.5.9/$compile/tpload?p0=reset.html&p1=404&p2=Not%20Found\nStack Trace: Error: [$compile:tpload] http://errors.angularjs.org/1.5.9/$compile/tpload?p0=reset.html&p1=404&p2=Not%20Found\n    at http://manageteamz.com/bower_components/angular/angular.min.js:6:412\n    at http://manageteamz.com/bower_components/angular/angular.min.js:158:48\n    at http://manageteamz.com/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://manageteamz.com/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://manageteamz.com/bower_components/angular/angular.min.js:143:420)\n    at m.$apply (http://manageteamz.com/bower_components/angular/angular.min.js:147:78)\n    at l (http://manageteamz.com/bower_components/angular/angular.min.js:98:421)\n    at D (http://manageteamz.com/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://manageteamz.com/bower_components/angular/angular.min.js:104:77)\n','2017-01-24 08:57:54','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(4,'Exception: \"Error: [$compile:tpload] http://errors.angularjs.org/1.5.9/$compile/tpload?p0=%2Fapp%2Fpopup%2Freset.html&p1=404&p2=Not%20Found\"\nCaused by: undefined\nMessage: [$compile:tpload] http://errors.angularjs.org/1.5.9/$compile/tpload?p0=%2Fapp%2Fpopup%2Freset.html&p1=404&p2=Not%20Found\nStack Trace: Error: [$compile:tpload] http://errors.angularjs.org/1.5.9/$compile/tpload?p0=%2Fapp%2Fpopup%2Freset.html&p1=404&p2=Not%20Found\n    at http://manageteamz.com/bower_components/angular/angular.min.js:6:412\n    at http://manageteamz.com/bower_components/angular/angular.min.js:158:48\n    at http://manageteamz.com/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://manageteamz.com/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://manageteamz.com/bower_components/angular/angular.min.js:143:420)\n    at m.$apply (http://manageteamz.com/bower_components/angular/angular.min.js:147:78)\n    at l (http://manageteamz.com/bower_components/angular/angular.min.js:98:421)\n    at D (http://manageteamz.com/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://manageteamz.com/bower_components/angular/angular.min.js:104:77)\n','2017-01-24 08:58:08','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(5,'Exception: \"Error: [$compile:tpload] http://errors.angularjs.org/1.5.9/$compile/tpload?p0=app%2Fpopup%2Freset.html&p1=404&p2=Not%20Found\"\nCaused by: undefined\nMessage: [$compile:tpload] http://errors.angularjs.org/1.5.9/$compile/tpload?p0=app%2Fpopup%2Freset.html&p1=404&p2=Not%20Found\nStack Trace: Error: [$compile:tpload] http://errors.angularjs.org/1.5.9/$compile/tpload?p0=app%2Fpopup%2Freset.html&p1=404&p2=Not%20Found\n    at http://manageteamz.com/bower_components/angular/angular.min.js:6:412\n    at http://manageteamz.com/bower_components/angular/angular.min.js:158:48\n    at http://manageteamz.com/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://manageteamz.com/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://manageteamz.com/bower_components/angular/angular.min.js:143:420)\n    at m.$apply (http://manageteamz.com/bower_components/angular/angular.min.js:147:78)\n    at l (http://manageteamz.com/bower_components/angular/angular.min.js:98:421)\n    at D (http://manageteamz.com/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://manageteamz.com/bower_components/angular/angular.min.js:104:77)\n','2017-01-24 08:59:17','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(6,'Exception: \"Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=dataToPassProvider%20%3C-%20dataToPass\"\nCaused by: undefined\nMessage: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=dataToPassProvider%20%3C-%20dataToPass\nStack Trace: Error: [$injector:unpr] http://errors.angularjs.org/1.5.9/$injector/unpr?p0=dataToPassProvider%20%3C-%20dataToPass\n    at http://manageteamz.com/bower_components/angular/angular.min.js:6:412\n    at http://manageteamz.com/bower_components/angular/angular.min.js:43:220\n    at Object.d [as get] (http://manageteamz.com/bower_components/angular/angular.min.js:41:1)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:43:282\n    at d (http://manageteamz.com/bower_components/angular/angular.min.js:41:1)\n    at e (http://manageteamz.com/bower_components/angular/angular.min.js:41:242)\n    at Object.invoke (http://manageteamz.com/bower_components/angular/angular.min.js:41:327)\n    at R.instance (http://manageteamz.com/bower_components/angular/angular.min.js:91:3)\n    at Object.link (http://manageteamz.com/bower_components/angular-material/angular-material.min.js:7:18818)\n    at b (http://manageteamz.com/bower_components/angular-material/angular-material.min.js:7:30494)\n','2017-01-24 09:56:14','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(7,'Exception: \"TypeError: v2.reset is not a function\"\nCaused by: undefined\nMessage: v2.reset is not a function\nStack Trace: TypeError: v2.reset is not a function\n    at fn (eval at compile (http://manageteamz.com/bower_components/angular/angular.min.js:236:126), <anonymous>:4:206)\n    at b (http://manageteamz.com/bower_components/angular/angular.min.js:127:128)\n    at e (http://manageteamz.com/bower_components/angular/angular.min.js:281:195)\n    at m.$eval (http://manageteamz.com/bower_components/angular/angular.min.js:146:293)\n    at m.$apply (http://manageteamz.com/bower_components/angular/angular.min.js:147:17)\n    at HTMLFormElement.<anonymous> (http://manageteamz.com/bower_components/angular/angular.min.js:281:247)\n    at HTMLFormElement.dispatch (http://manageteamz.com/bower_components/jquery/dist/jquery.min.js:3:7537)\n    at HTMLFormElement.r.handle (http://manageteamz.com/bower_components/jquery/dist/jquery.min.js:3:5620)\n','2017-01-24 10:00:20','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(8,'Exception: \"TypeError: Cannot read property \'$dirty\' of undefined\"\nCaused by: undefined\nMessage: Cannot read property \'$dirty\' of undefined\nStack Trace: TypeError: Cannot read property \'$dirty\' of undefined\n    at m.ResetPasswordController.$scope.resetpwd (http://manageteamz.com/app/user/user.controller.js:42:23)\n    at fn (eval at compile (http://manageteamz.com/bower_components/angular/angular.min.js:236:126), <anonymous>:4:215)\n    at b (http://manageteamz.com/bower_components/angular/angular.min.js:127:128)\n    at e (http://manageteamz.com/bower_components/angular/angular.min.js:281:195)\n    at m.$eval (http://manageteamz.com/bower_components/angular/angular.min.js:146:293)\n    at m.$apply (http://manageteamz.com/bower_components/angular/angular.min.js:147:17)\n    at HTMLFormElement.<anonymous> (http://manageteamz.com/bower_components/angular/angular.min.js:281:247)\n    at HTMLFormElement.dispatch (http://manageteamz.com/bower_components/jquery/dist/jquery.min.js:3:7537)\n    at HTMLFormElement.r.handle (http://manageteamz.com/bower_components/jquery/dist/jquery.min.js:3:5620)\n','2017-01-24 10:00:49','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(9,'Exception: \"ReferenceError: answer is not defined\"\nCaused by: undefined\nMessage: answer is not defined\nStack Trace: ReferenceError: answer is not defined\n    at m.ResetPasswordController.$scope.resetpwd (http://manageteamz.com/app/user/user.controller.js:46:22)\n    at fn (eval at compile (http://manageteamz.com/bower_components/angular/angular.min.js:236:126), <anonymous>:4:215)\n    at b (http://manageteamz.com/bower_components/angular/angular.min.js:127:128)\n    at e (http://manageteamz.com/bower_components/angular/angular.min.js:281:195)\n    at m.$eval (http://manageteamz.com/bower_components/angular/angular.min.js:146:293)\n    at m.$apply (http://manageteamz.com/bower_components/angular/angular.min.js:147:17)\n    at HTMLFormElement.<anonymous> (http://manageteamz.com/bower_components/angular/angular.min.js:281:247)\n    at HTMLFormElement.dispatch (http://manageteamz.com/bower_components/jquery/dist/jquery.min.js:3:7537)\n    at HTMLFormElement.r.handle (http://manageteamz.com/bower_components/jquery/dist/jquery.min.js:3:5620)\n','2017-01-24 10:01:33','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(10,'Exception: \"ReferenceError: answer is not defined\"\nCaused by: undefined\nMessage: answer is not defined\nStack Trace: ReferenceError: answer is not defined\n    at m.ResetPasswordController.$scope.resetpwd (http://manageteamz.com/app/user/user.controller.js:46:22)\n    at fn (eval at compile (http://manageteamz.com/bower_components/angular/angular.min.js:236:126), <anonymous>:4:215)\n    at b (http://manageteamz.com/bower_components/angular/angular.min.js:127:128)\n    at e (http://manageteamz.com/bower_components/angular/angular.min.js:281:195)\n    at m.$eval (http://manageteamz.com/bower_components/angular/angular.min.js:146:293)\n    at m.$apply (http://manageteamz.com/bower_components/angular/angular.min.js:147:17)\n    at HTMLFormElement.<anonymous> (http://manageteamz.com/bower_components/angular/angular.min.js:281:247)\n    at HTMLFormElement.dispatch (http://manageteamz.com/bower_components/jquery/dist/jquery.min.js:3:7537)\n    at HTMLFormElement.r.handle (http://manageteamz.com/bower_components/jquery/dist/jquery.min.js:3:5620)\n','2017-01-24 10:01:58','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(11,'Exception: \"SyntaxError: JSON.parse: unexpected character at line 1 column 38 of the JSON data\"\nCaused by: undefined\nMessage: JSON.parse: unexpected character at line 1 column 38 of the JSON data\nFile Name: http://manageteamz.com/bower_components/angular/angular.min.js\nLine Number: 16\nStack Trace: Ec@http://manageteamz.com/bower_components/angular/angular.min.js:16:374\nic@http://manageteamz.com/bower_components/angular/angular.min.js:93:45\nod/<@http://manageteamz.com/bower_components/angular/angular.min.js:93:460\nq@http://manageteamz.com/bower_components/angular/angular.min.js:7:357\nod@http://manageteamz.com/bower_components/angular/angular.min.js:93:442\nf@http://manageteamz.com/bower_components/angular/angular.min.js:95:393\ne/<@http://manageteamz.com/bower_components/angular/angular.min.js:132:20\nKf/this.$get</m.prototype.$eval@http://manageteamz.com/bower_components/angular/angular.min.js:146:289\nKf/this.$get</m.prototype.$digest@http://manageteamz.com/bower_components/angular/angular.min.js:143:412\nKf/this.$get</m.prototype.$apply@http://manageteamz.com/bower_components/angular/angular.min.js:147:76\nl@http://manageteamz.com/bower_components/angular/angular.min.js:98:419\nD@http://manageteamz.com/bower_components/angular/angular.min.js:103:105\nug/</w.onload@http://manageteamz.com/bower_components/angular/angular.min.js:104:77\n\n','2017-01-25 00:59:05','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:50.0) Gecko/20100101 Firefox/50.0'),(12,'Exception: \"SyntaxError: Unexpected token \' in JSON at position 37\"\nCaused by: undefined\nMessage: Unexpected token \' in JSON at position 37\nStack Trace: SyntaxError: Unexpected token \' in JSON at position 37\n    at JSON.parse (<anonymous>)\n    at Ec (http://manageteamz.com/bower_components/angular/angular.min.js:16:379)\n    at ic (http://manageteamz.com/bower_components/angular/angular.min.js:93:45)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:93:460\n    at q (http://manageteamz.com/bower_components/angular/angular.min.js:7:359)\n    at od (http://manageteamz.com/bower_components/angular/angular.min.js:93:442)\n    at f (http://manageteamz.com/bower_components/angular/angular.min.js:95:393)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://manageteamz.com/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://manageteamz.com/bower_components/angular/angular.min.js:143:420)\n','2017-01-25 01:19:45','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(13,'Exception: \"SyntaxError: JSON.parse: unexpected character at line 1 column 38 of the JSON data\"\nCaused by: undefined\nMessage: JSON.parse: unexpected character at line 1 column 38 of the JSON data\nFile Name: http://manageteamz.com/bower_components/angular/angular.min.js\nLine Number: 16\nStack Trace: Ec@http://manageteamz.com/bower_components/angular/angular.min.js:16:374\nic@http://manageteamz.com/bower_components/angular/angular.min.js:93:45\nod/<@http://manageteamz.com/bower_components/angular/angular.min.js:93:460\nq@http://manageteamz.com/bower_components/angular/angular.min.js:7:357\nod@http://manageteamz.com/bower_components/angular/angular.min.js:93:442\nf@http://manageteamz.com/bower_components/angular/angular.min.js:95:393\ne/<@http://manageteamz.com/bower_components/angular/angular.min.js:132:20\nKf/this.$get</m.prototype.$eval@http://manageteamz.com/bower_components/angular/angular.min.js:146:289\nKf/this.$get</m.prototype.$digest@http://manageteamz.com/bower_components/angular/angular.min.js:143:412\nKf/this.$get</m.prototype.$apply@http://manageteamz.com/bower_components/angular/angular.min.js:147:76\nl@http://manageteamz.com/bower_components/angular/angular.min.js:98:419\nD@http://manageteamz.com/bower_components/angular/angular.min.js:103:105\nug/</w.onload@http://manageteamz.com/bower_components/angular/angular.min.js:104:77\n\n','2017-01-25 01:29:56','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:50.0) Gecko/20100101 Firefox/50.0'),(14,'Exception: \"SyntaxError: Unexpected token \' in JSON at position 37\"\nCaused by: undefined\nMessage: Unexpected token \' in JSON at position 37\nStack Trace: SyntaxError: Unexpected token \' in JSON at position 37\n    at JSON.parse (<anonymous>)\n    at Ec (http://manageteamz.com/bower_components/angular/angular.min.js:16:379)\n    at ic (http://manageteamz.com/bower_components/angular/angular.min.js:93:45)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:93:460\n    at q (http://manageteamz.com/bower_components/angular/angular.min.js:7:359)\n    at od (http://manageteamz.com/bower_components/angular/angular.min.js:93:442)\n    at f (http://manageteamz.com/bower_components/angular/angular.min.js:95:393)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:132:20\n    at m.$eval (http://manageteamz.com/bower_components/angular/angular.min.js:146:293)\n    at m.$digest (http://manageteamz.com/bower_components/angular/angular.min.js:143:420)\n','2017-01-25 02:30:16','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(15,'Exception: \"Error: Could not resolve \'admin.adminprofile\' from state \'admin\'\"\nCaused by: undefined\nMessage: Could not resolve \'admin.adminprofile\' from state \'admin\'\nStack Trace: Error: Could not resolve \'admin.adminprofile\' from state \'admin\'\n    at Object.transitionTo (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:3190:17)\n    at Object.go (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:3118:21)\n    at http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:4192:16\n    at http://manageteamz.com/bower_components/angular/angular.min.js:160:52\n    at e (http://manageteamz.com/bower_components/angular/angular.min.js:45:487)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:48:414\n','2017-01-25 06:23:55','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(16,'Exception: \"Error: Could not resolve \'admin.adminprofile\' from state \'admin\'\"\nCaused by: undefined\nMessage: Could not resolve \'admin.adminprofile\' from state \'admin\'\nStack Trace: Error: Could not resolve \'admin.adminprofile\' from state \'admin\'\n    at Object.transitionTo (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:3190:17)\n    at Object.go (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:3118:21)\n    at http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:4192:16\n    at http://manageteamz.com/bower_components/angular/angular.min.js:160:52\n    at e (http://manageteamz.com/bower_components/angular/angular.min.js:45:487)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:48:414\n','2017-01-25 06:28:45','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(17,'Exception: \"Error: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=RequestCtrl&p1=not%20a%20function%2C%20got%20undefined\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\" data-ng-animate=\"1\">\nMessage: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=RequestCtrl&p1=not%20a%20function%2C%20got%20undefined\nStack Trace: Error: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=RequestCtrl&p1=not%20a%20function%2C%20got%20undefined\n    at http://manageteamz.com/bower_components/angular/angular.min.js:6:412\n    at vb (http://manageteamz.com/bower_components/angular/angular.min.js:23:159)\n    at Pa (http://manageteamz.com/bower_components/angular/angular.min.js:23:246)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:90:379\n    at http://manageteamz.com/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:16:71\n    at la (http://manageteamz.com/bower_components/angular/angular.min.js:82:90)\n    at p (http://manageteamz.com/bower_components/angular/angular.min.js:67:274)\n    at g (http://manageteamz.com/bower_components/angular/angular.min.js:59:252)\n','2017-01-25 07:30:40','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(18,'Exception: \"Error: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=RequestViewCtrl&p1=not%20a%20function%2C%20got%20undefined\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\" data-ng-animate=\"1\">\nMessage: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=RequestViewCtrl&p1=not%20a%20function%2C%20got%20undefined\nStack Trace: Error: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=RequestViewCtrl&p1=not%20a%20function%2C%20got%20undefined\n    at http://manageteamz.com/bower_components/angular/angular.min.js:6:412\n    at vb (http://manageteamz.com/bower_components/angular/angular.min.js:23:159)\n    at Pa (http://manageteamz.com/bower_components/angular/angular.min.js:23:246)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:90:379\n    at http://manageteamz.com/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:16:71\n    at la (http://manageteamz.com/bower_components/angular/angular.min.js:82:90)\n    at p (http://manageteamz.com/bower_components/angular/angular.min.js:67:274)\n    at g (http://manageteamz.com/bower_components/angular/angular.min.js:59:252)\n','2017-01-25 08:03:43','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(19,'Exception: \"ReferenceError: $scopeRequestViewCtrl is not defined\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\">\nMessage: $scopeRequestViewCtrl is not defined\nStack Trace: ReferenceError: $scopeRequestViewCtrl is not defined\n    at new RequestViewCtrl (http://manageteamz.com/app/request-info/request-info.view.controller.js:126:44)\n    at Object.instantiate (http://manageteamz.com/bower_components/angular/angular.min.js:42:109)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:91:109\n    at http://manageteamz.com/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:16:71\n    at la (http://manageteamz.com/bower_components/angular/angular.min.js:82:90)\n    at p (http://manageteamz.com/bower_components/angular/angular.min.js:67:274)\n    at g (http://manageteamz.com/bower_components/angular/angular.min.js:59:252)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:58:394\n','2017-01-25 08:03:59','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(20,'Exception: \"ReferenceError: $scopeRequestViewCtrl is not defined\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\">\nMessage: $scopeRequestViewCtrl is not defined\nStack Trace: ReferenceError: $scopeRequestViewCtrl is not defined\n    at new RequestViewCtrl (http://manageteamz.com/app/request-info/request-info.view.controller.js:126:44)\n    at Object.instantiate (http://manageteamz.com/bower_components/angular/angular.min.js:42:109)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:91:109\n    at http://manageteamz.com/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:16:71\n    at la (http://manageteamz.com/bower_components/angular/angular.min.js:82:90)\n    at p (http://manageteamz.com/bower_components/angular/angular.min.js:67:274)\n    at g (http://manageteamz.com/bower_components/angular/angular.min.js:59:252)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:58:394\n','2017-01-25 08:04:05','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(21,'Exception: \"Error: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=CaseInfoCtrl&p1=not%20a%20function%2C%20got%20undefined\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\" data-ng-animate=\"1\">\nMessage: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=CaseInfoCtrl&p1=not%20a%20function%2C%20got%20undefined\nStack Trace: Error: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=CaseInfoCtrl&p1=not%20a%20function%2C%20got%20undefined\n    at http://manageteamz.com/bower_components/angular/angular.min.js:6:412\n    at vb (http://manageteamz.com/bower_components/angular/angular.min.js:23:159)\n    at Pa (http://manageteamz.com/bower_components/angular/angular.min.js:23:246)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:90:379\n    at http://manageteamz.com/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:16:71\n    at la (http://manageteamz.com/bower_components/angular/angular.min.js:82:90)\n    at p (http://manageteamz.com/bower_components/angular/angular.min.js:67:274)\n    at g (http://manageteamz.com/bower_components/angular/angular.min.js:59:252)\n','2017-01-25 08:45:57','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(22,'Exception: \"Error: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=CaseInfoCtrl&p1=not%20a%20function%2C%20got%20undefined\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\">\nMessage: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=CaseInfoCtrl&p1=not%20a%20function%2C%20got%20undefined\nStack Trace: Error: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=CaseInfoCtrl&p1=not%20a%20function%2C%20got%20undefined\n    at http://manageteamz.com/bower_components/angular/angular.min.js:6:412\n    at vb (http://manageteamz.com/bower_components/angular/angular.min.js:23:159)\n    at Pa (http://manageteamz.com/bower_components/angular/angular.min.js:23:246)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:90:379\n    at http://manageteamz.com/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:16:71\n    at la (http://manageteamz.com/bower_components/angular/angular.min.js:82:90)\n    at p (http://manageteamz.com/bower_components/angular/angular.min.js:67:274)\n    at g (http://manageteamz.com/bower_components/angular/angular.min.js:59:252)\n','2017-01-25 08:46:07','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(23,'Exception: \"Error: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=CaseInfoCtrl&p1=not%20a%20function%2C%20got%20undefined\"\nCaused by: <div class=\"full-height {{app.pageTransition.class}} ng-scope\" ui-view=\"\">\nMessage: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=CaseInfoCtrl&p1=not%20a%20function%2C%20got%20undefined\nStack Trace: Error: [ng:areq] http://errors.angularjs.org/1.5.9/ng/areq?p0=CaseInfoCtrl&p1=not%20a%20function%2C%20got%20undefined\n    at http://manageteamz.com/bower_components/angular/angular.min.js:6:412\n    at vb (http://manageteamz.com/bower_components/angular/angular.min.js:23:159)\n    at Pa (http://manageteamz.com/bower_components/angular/angular.min.js:23:246)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:90:379\n    at http://manageteamz.com/bower_components/angular-material-data-table/dist/md-data-table.min.js:1:2557\n    at Object.<anonymous> (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:4128:28)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:16:71\n    at la (http://manageteamz.com/bower_components/angular/angular.min.js:82:90)\n    at p (http://manageteamz.com/bower_components/angular/angular.min.js:67:274)\n    at g (http://manageteamz.com/bower_components/angular/angular.min.js:59:252)\n','2017-01-25 08:46:21','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(24,'Exception: \"TypeError: $scope.rRequestCtrleset is not a function\"\nCaused by: undefined\nMessage: $scope.rRequestCtrleset is not a function\nStack Trace: TypeError: $scope.rRequestCtrleset is not a function\n    at m.CaseInfoCtrl.$scope.formmode (http://manageteamz.com/app/case-info/case-info.controller.js:146:24)\n    at m.CaseInfoCtrl.$scope.addbtn (http://manageteamz.com/app/case-info/case-info.controller.js:86:20)\n    at fn (eval at compile (http://manageteamz.com/bower_components/angular/angular.min.js:236:126), <anonymous>:4:209)\n    at b (http://manageteamz.com/bower_components/angular/angular.min.js:127:128)\n    at e (http://manageteamz.com/bower_components/angular/angular.min.js:281:195)\n    at m.$eval (http://manageteamz.com/bower_components/angular/angular.min.js:146:293)\n    at m.$apply (http://manageteamz.com/bower_components/angular/angular.min.js:147:17)\n    at HTMLButtonElement.<anonymous> (http://manageteamz.com/bower_components/angular/angular.min.js:281:247)\n    at HTMLButtonElement.dispatch (http://manageteamz.com/bower_components/jquery/dist/jquery.min.js:3:7537)\n    at HTMLButtonElement.r.handle (http://manageteamz.com/bower_components/jquery/dist/jquery.min.js:3:5620)\n','2017-01-25 08:47:34','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(25,'Exception: \"Error: Could not resolve \'admin.adminprofile\' from state \'admin\'\"\nCaused by: undefined\nMessage: Could not resolve \'admin.adminprofile\' from state \'admin\'\nStack Trace: Error: Could not resolve \'admin.adminprofile\' from state \'admin\'\n    at Object.transitionTo (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:3190:17)\n    at Object.go (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:3118:21)\n    at http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:4192:16\n    at http://manageteamz.com/bower_components/angular/angular.min.js:160:52\n    at e (http://manageteamz.com/bower_components/angular/angular.min.js:45:487)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:48:414\n','2017-01-25 08:49:47','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(26,'Exception: \"Error: Could not resolve \'admin.adminprofile\' from state \'admin\'\"\nCaused by: undefined\nMessage: Could not resolve \'admin.adminprofile\' from state \'admin\'\nStack Trace: Error: Could not resolve \'admin.adminprofile\' from state \'admin\'\n    at Object.transitionTo (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:3190:17)\n    at Object.go (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:3118:21)\n    at http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:4192:16\n    at http://manageteamz.com/bower_components/angular/angular.min.js:160:52\n    at e (http://manageteamz.com/bower_components/angular/angular.min.js:45:487)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:48:414\n','2017-01-25 08:50:03','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(27,'Exception: \"Error: Could not resolve \'admin.adminprofile\' from state \'admin\'\"\nCaused by: undefined\nMessage: Could not resolve \'admin.adminprofile\' from state \'admin\'\nStack Trace: Error: Could not resolve \'admin.adminprofile\' from state \'admin\'\n    at Object.transitionTo (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:3190:17)\n    at Object.go (http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:3118:21)\n    at http://manageteamz.com/bower_components/angular-ui-router/release/angular-ui-router.js:4192:16\n    at http://manageteamz.com/bower_components/angular/angular.min.js:160:52\n    at e (http://manageteamz.com/bower_components/angular/angular.min.js:45:487)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:48:414\n','2017-01-25 08:50:06','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(28,'Exception: \"Error: The ng-model for md-datepicker must be a Date instance. Currently the model is a: string\"\nCaused by: undefined\nMessage: The ng-model for md-datepicker must be a Date instance. Currently the model is a: string\nStack Trace: Error: The ng-model for md-datepicker must be a Date instance. Currently the model is a: string\n    at Array.<anonymous> (http://manageteamz.com/bower_components/angular-material/angular-material.min.js:15:5789)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:293:316\n    at m.$digest (http://manageteamz.com/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://manageteamz.com/bower_components/angular/angular.min.js:147:78)\n    at l (http://manageteamz.com/bower_components/angular/angular.min.js:98:421)\n    at D (http://manageteamz.com/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://manageteamz.com/bower_components/angular/angular.min.js:104:77)\n','2017-01-25 09:08:47','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(29,'Exception: \"Error: The ng-model for md-datepicker must be a Date instance. Currently the model is a: string\"\nCaused by: undefined\nMessage: The ng-model for md-datepicker must be a Date instance. Currently the model is a: string\nStack Trace: Error: The ng-model for md-datepicker must be a Date instance. Currently the model is a: string\n    at Array.<anonymous> (http://manageteamz.com/bower_components/angular-material/angular-material.min.js:15:5789)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:293:316\n    at m.$digest (http://manageteamz.com/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://manageteamz.com/bower_components/angular/angular.min.js:147:78)\n    at l (http://manageteamz.com/bower_components/angular/angular.min.js:98:421)\n    at D (http://manageteamz.com/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://manageteamz.com/bower_components/angular/angular.min.js:104:77)\n','2017-01-25 09:08:47','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'),(30,'Exception: \"Error: The ng-model for md-datepicker must be a Date instance. Currently the model is a: string\"\nCaused by: undefined\nMessage: The ng-model for md-datepicker must be a Date instance. Currently the model is a: string\nStack Trace: Error: The ng-model for md-datepicker must be a Date instance. Currently the model is a: string\n    at Array.<anonymous> (http://manageteamz.com/bower_components/angular-material/angular-material.min.js:15:5789)\n    at http://manageteamz.com/bower_components/angular/angular.min.js:293:316\n    at m.$digest (http://manageteamz.com/bower_components/angular/angular.min.js:144:43)\n    at m.$apply (http://manageteamz.com/bower_components/angular/angular.min.js:147:78)\n    at l (http://manageteamz.com/bower_components/angular/angular.min.js:98:421)\n    at D (http://manageteamz.com/bower_components/angular/angular.min.js:103:105)\n    at XMLHttpRequest.w.onload (http://manageteamz.com/bower_components/angular/angular.min.js:104:77)\n','2017-01-25 09:31:47','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36');
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
  `uploads` text,
  `desc` tinytext,
  `location` varchar(120) DEFAULT NULL,
  `loc_lat` varchar(45) DEFAULT NULL,
  `loc_lng` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `taken_by` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `is_approved` int(11) DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master`
--

LOCK TABLES `master` WRITE;
/*!40000 ALTER TABLE `master` DISABLE KEYS */;
INSERT INTO `master` VALUES ('api','sfa','chenn','tamil nadu','600041','http://api.com','+919524609638','dfdf',27,'2017-01-23 06:05:44','2017-01-25 00:51:15','indai','eyJpdiI6IllmMEVGM3Q2Z0lUT0RJQ2VxcVdiN1E9PSIsInZhbHVlIjoidGVGbWw2ZGNCSWpubFhxYWlSS2NISVpwc1hQS0xBM2NjVEhva0dReFAzdTgxTzdZZThCWDNqSFdkbjRyMnFxV2xZaFkxR1RUQXRLK29zMkRVM1pNMitQbVc2RFwvXC9OXC9YYldhdWlCb1c3dlE9IiwibWFjIjoiOGI0OGM3YzdkYWY1MDA2ZjVmYjY1NTMzY2RiMDk1MDFlMzEzNDVjNDc1NWQ5Y2Y2YzZiNTBhNTliMmU4NDQ5NiJ9','api@sfa.com',NULL),('w2s','hanks','hi','tamil nadu','600041','http://sfa.com','+919524609638','th',28,'2017-01-23 07:41:09','2017-01-24 08:50:24','omdo','eyJpdiI6InRiNkpTXC9NZkxZZ1dHRnFhQUc2WVB3PT0iLCJ2YWx1ZSI6Ijh5a1pBcHVzTUMxakpibFMwTTNOOGZ1VWNEWVBXQ0czVklLakM0bHNPeFlMbmpzRDJVRDluQ2VXT2tYdVA4dzNnaW04bStUUUVsV1ZDXC91Zm9GMGFaZmg3UDNEOHZESU1XeGdOcjJYMTdnTT0iLCJtYWMiOiJmMWVmNDAyY2U0NGM3Mjk4NjIxODEzYjI0NGI3OGZlYWRlNjBmNTZmYWM1ZmU0MDBjMGM4N2FmNGQyYTQwNTc0In0=','w2s@sfa.com',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_bookings`
--

LOCK TABLES `order_bookings` WRITE;
/*!40000 ALTER TABLE `order_bookings` DISABLE KEYS */;
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
  `pro_req_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_orders_1_idx` (`order_id`),
  KEY `fk_product_orders_2_idx` (`product_id`),
  CONSTRAINT `fk_product_orders_1` FOREIGN KEY (`order_id`) REFERENCES `order_bookings` (`order_booking_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_orders_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_orders`
--

LOCK TABLES `product_orders` WRITE;
/*!40000 ALTER TABLE `product_orders` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_types`
--

LOCK TABLES `prospect_types` WRITE;
/*!40000 ALTER TABLE `prospect_types` DISABLE KEYS */;
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
  `date` date DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `uploads` text,
  `status` int(11) DEFAULT '0',
  `taken_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_requests_1_idx` (`cust_id`),
  KEY `fk_requests_2_idx` (`taken_by`),
  CONSTRAINT `fk_requests_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_requests_2` FOREIGN KEY (`taken_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `requests_info`
--

DROP TABLE IF EXISTS `requests_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) NOT NULL,
  `type` varchar(500) DEFAULT NULL,
  `desc` text,
  PRIMARY KEY (`id`),
  KEY `fk_requests_info_1_idx` (`request_id`),
  CONSTRAINT `fk_requests_info_1` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests_info`
--

LOCK TABLES `requests_info` WRITE;
/*!40000 ALTER TABLE `requests_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests_info` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_clients`
--

LOCK TABLES `session_clients` WRITE;
/*!40000 ALTER TABLE `session_clients` DISABLE KEYS */;
INSERT INTO `session_clients` VALUES (12,'127.0.0.1','7e20696728db5c007c80c01924894365','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','2017-01-23 05:55:22',NULL,'2017-01-23 05:55:22'),(13,'127.0.0.1','a3ce3d1347e8fe1daecc9f13f6fb2ff1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','2017-01-24 00:11:51',NULL,'2017-01-24 00:11:51'),(14,'127.0.0.1','ae8a183191102176981e119731e12ecc','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:50.0) Gecko/20100101 Firefox/50.0','2017-01-25 00:59:05',NULL,'2017-01-25 00:59:05');
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
INSERT INTO `super_admin` VALUES (1,'admin@sfa.com','Admin',NULL,NULL,NULL,NULL,'eyJpdiI6InljVUpGU2xSeE80YStwNWZpQzhMVXc9PSIsInZhbHVlIjoid0hcL3NnSmxSWVZZQnhiQ2hJRmhsakE9PSIsIm1hYyI6ImFkZDY1YzFjOWFiYzkyNTMzMTBkNTA4ZGZkYzM0NzI3ZGYxY2QyOWRkYWJiYzAyNzk1MzBhZDg3MGZkOTQ2OGQifQ==',1);
/*!40000 ALTER TABLE `super_admin` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
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
  `profile_image` varchar(500) DEFAULT NULL,
  `belongs_manager` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_user_1_idx` (`role_id`),
  CONSTRAINT `fk_user_1` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2017-01-25 21:02:36
