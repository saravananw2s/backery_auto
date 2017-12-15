CREATE DATABASE  IF NOT EXISTS `core_db` ;
USE `core_db`;
-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: sfa_database
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
  `name` varchar(500) NOT NULL,
  `desc` tinytext,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_auth`
--

DROP TABLE IF EXISTS `api_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_auth` (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT,
  `device_token` text NULL DEFAULT NULL,
  `device_type` text NULL DEFAULT NULL,
  `auth_key` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_user_agent` tinytext NOT NULL,
  `auth_ip` varchar(500) NOT NULL,
  `is_active` int(11) DEFAULT '1',
  `auth_model` varchar(100) NOT NULL,
  `auth_user_id` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`auth_id`),
  KEY `fk_api_auth_1_idx` (`auth_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `in_time` timestamp NULL DEFAULT NULL,
  `out_time` timestamp NULL DEFAULT NULL,
  `attent_type` int(11) DEFAULT '0',
  `leave_desc` text DEFAULT NULL,
  `login_lat` varchar(500) DEFAULT NULL,
  `login_lon` varchar(500) DEFAULT NULL,
  `logout_lat` varchar(500) DEFAULT NULL,
  `logout_lon` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attendance_1_idx` (`user_id`),
  CONSTRAINT `fk_attendance_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditable_id` int(10) unsigned NOT NULL,
  `auditable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `old_values` text COLLATE utf8_unicode_ci,
  `new_values` text COLLATE utf8_unicode_ci,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `event` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `audits_auditable_id_auditable_type_index` (`auditable_id`,`auditable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Table structure for table `cases_info`
--

-- DROP TABLE IF EXISTS `cases_info`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!40101 SET character_set_client = utf8 */;
-- CREATE TABLE `cases_info` (
--   `case_id` int(11) NOT NULL AUTO_INCREMENT,
--   `open_dt` date DEFAULT NULL,
--   `close_dt` date DEFAULT NULL,
--   `cust_id` int(11) NOT NULL,
--   `batch_details` tinytext,
--   `pro_id` int(11) DEFAULT NULL,
--   `types` varchar(500) DEFAULT NULL,
--   `invoice_ref` varchar(500) DEFAULT NULL,
--   `invoice_date` date DEFAULT NULL,
--   `prob_quantiy` varchar(500) DEFAULT NULL,
--   `site_info` varchar(500) DEFAULT NULL,
--   `del_from` varchar(500) DEFAULT NULL,
--   `desc` text,
--   `uploads` text,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `deleted_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL,
--   `taken_by` int(11) NOT NULL,
--   `status` int(11) DEFAULT '0',
--   PRIMARY KEY (`case_id`),
--   KEY `fk_cases_1_idx` (`cust_id`),
--   KEY `fk_cases_info_1_idx` (`taken_by`),
--   KEY `fk_cases_info_2_idx` (`pro_id`),
--   CONSTRAINT `fk_cases_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
--   CONSTRAINT `fk_cases_info_1` FOREIGN KEY (`taken_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
--   CONSTRAINT `fk_cases_info_2` FOREIGN KEY (`pro_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
-- ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
-- /*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--


-- DROP TABLE IF EXISTS `cases_info`;
-- CREATE TABLE `cases_info` (
--   `case_id` int(11) NOT NULL AUTO_INCREMENT,
--   `open_dt` date DEFAULT NULL,
--   `close_dt` date DEFAULT NULL,
--   `cust_id` int(11) NOT NULL,
--   `desc` text,
--   `uploads` text,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `deleted_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL,
--   `taken_by` int(11) NOT NULL,
--   `status` int(11) DEFAULT '0',
--   `closed_by` int(11) DEFAULT NULL,
--   PRIMARY KEY (`case_id`),
--   KEY `fk_cases_1_idx` (`cust_id`),
--   KEY `fk_cases_info_1_idx` (`taken_by`),
--   KEY `fk_cases_info_2_idx` (`closed_by`),
--   CONSTRAINT `fk_cases_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
--   CONSTRAINT `fk_cases_info_1` FOREIGN KEY (`taken_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
--   CONSTRAINT `fk_cases_info_2` FOREIGN KEY (`closed_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
-- ) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;




--  DROP TABLE IF EXISTS `case_info_details`;
--  CREATE TABLE `case_info_details` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `case_id` int(11) NOT NULL,
--   `case_type` int(11) NOT NULL DEFAULT '0',
--   `product_id` int(11) DEFAULT NULL,
--   `batch_info` varchar(500) DEFAULT NULL,
--   `invoice_no` varchar(500) DEFAULT NULL,
--   `invoice_date` date DEFAULT NULL,
--   `site_info` varchar(500) DEFAULT NULL,
--   `deliver_from` varchar(500) DEFAULT NULL,
--   `order_no` int(11) DEFAULT NULL,
--   `delivery_no` varchar(500) DEFAULT NULL,
--   `delivery_date` date DEFAULT NULL,
--   `created_at` datetime DEFAULT NULL,
--   `deleted_at` datetime DEFAULT NULL,
--   `updated_at` datetime DEFAULT NULL,
--   `desc` text,
--   PRIMARY KEY (`id`),
--   KEY `fk_case_info_details_1_idx` (`product_id`),
--   KEY `fk_case_info_details_2_idx` (`order_no`),
--   KEY `fk_case_info_details_3_idx` (`case_id`),
--   CONSTRAINT `fk_case_info_details_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
--   CONSTRAINT `fk_case_info_details_2` FOREIGN KEY (`order_no`) REFERENCES `order_bookings` (`order_booking_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
--   CONSTRAINT `fk_case_info_details_3` FOREIGN KEY (`case_id`) REFERENCES `cases_info` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
-- ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `cases_info` (
    `case_id` INT(11) NOT NULL AUTO_INCREMENT,
    `open_dt` DATE DEFAULT NULL,
    `close_dt` DATE DEFAULT NULL,
    `cust_id` INT(11) NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `deleted_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    `taken_by` INT(11) NOT NULL,
    `status` INT(11) DEFAULT '0',
    `closed_by` INT(11) DEFAULT NULL,
    PRIMARY KEY (`case_id`),
    KEY `fk_cases_1_idx` (`cust_id`),
    KEY `fk_cases_info_1_idx` (`taken_by`),
    KEY `fk_cases_info_2_idx` (`closed_by`),
    CONSTRAINT `fk_cases_1` FOREIGN KEY (`cust_id`)
        REFERENCES `customers` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_cases_info_1` FOREIGN KEY (`taken_by`)
        REFERENCES `user` (`user_id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_cases_info_2` FOREIGN KEY (`closed_by`)
        REFERENCES `user` (`user_id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=LATIN1;



CREATE TABLE `case_info_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL,
  `case_type` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) DEFAULT NULL,
  `batch_info` varchar(500) DEFAULT NULL,
  `invoice_no` varchar(500) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `site_info` varchar(500) DEFAULT NULL,
  `deliver_from` varchar(500) DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL,
  `delivery_no` varchar(500) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `desc` text,
  `uploads` text,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `fk_case_info_details_1_idx` (`product_id`),
  KEY `fk_case_info_details_2_idx` (`order_no`),
  KEY `fk_case_info_details_3_idx` (`case_id`),
  CONSTRAINT `fk_case_info_details_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_case_info_details_2` FOREIGN KEY (`order_no`) REFERENCES `order_bookings` (`order_booking_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_case_info_details_3` FOREIGN KEY (`case_id`) REFERENCES `cases_info` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;



/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `desc` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_db_info`
--



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
  `loc_lat` varchar(500) DEFAULT NULL,
  `loc_lng` varchar(500) DEFAULT NULL,
  `uploads` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_statistics`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `month` int(2) DEFAULT NULL,
  `credit_limit` varchar(500) DEFAULT NULL,
  `credit_terms` varchar(500) DEFAULT NULL,
  `outstandings` varchar(500) DEFAULT NULL,
  `last_visited` date NULL DEFAULT NULL,
  `over_due` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_statistics_1_idx` (`cust_id`),
  CONSTRAINT `fk_customer_statistics_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customers`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(500) DEFAULT NULL,
  `state` varchar(500) DEFAULT NULL,
  `country` varchar(500) DEFAULT NULL,
  `zipcode` varchar(500) DEFAULT NULL,
  `contact_person` varchar(500) DEFAULT NULL,
  `contact_no` varchar(500) DEFAULT NULL,
  `pan` varchar(500) DEFAULT NULL,
  `tin` varchar(500) DEFAULT NULL,
  `type` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `desc` tinytext,
  `loc_lat` varchar(500) DEFAULT NULL,
  `loc_lng` varchar(500) DEFAULT NULL,
  `district` varchar(500) DEFAULT NULL,
  `uploads` text,
  `location` varchar(500) DEFAULT NULL,
  `emp_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customers_1_idx` (`emp_id`),
  CONSTRAINT `fk_customers_1` FOREIGN KEY (`emp_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emp_cust_schedule`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_cust_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(500) DEFAULT 'waiting',
  `type` varchar(500) DEFAULT NULL,
  `notes` varchar(1500) DEFAULT NULL,
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
-- Table structure for table `emp_schedule`
--


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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobs`
--


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
-- Table structure for table `js_error`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `js_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `error` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `user_agent` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `market`
--


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
-- Table structure for table `market_intelligence`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_intelligence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uploads` text,
  `desc` tinytext,
  `location` varchar(120) DEFAULT NULL,
  `loc_lat` varchar(500) DEFAULT NULL,
  `loc_lng` varchar(500) DEFAULT NULL,
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
-- Table structure for table `new_project_opp`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_project_opp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` varchar(500) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `loc_lat` varchar(500) DEFAULT NULL,
  `loc_lng` varchar(500) DEFAULT NULL,
  `site_name` varchar(500) DEFAULT NULL,
  `prospect_type` int(11) DEFAULT NULL,
  `contact_name` varchar(500) DEFAULT NULL,
  `contact_no` varchar(500) DEFAULT NULL,
  `contact_email` varchar(500) DEFAULT NULL,
  `exp_date` timestamp NULL DEFAULT NULL,
  `price_exp` varchar(500) DEFAULT NULL,
  `cement_used` varchar(500) DEFAULT NULL,
  `uploads` tinytext,
  `taken_by` int(11) DEFAULT NULL,
  `created_at` varchar(500) DEFAULT NULL,
  `updated_at` varchar(500) DEFAULT NULL,
  `deleted_at` varchar(500) DEFAULT NULL,
  `desc` text,
  `location` varchar(500) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `new_project_products`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_project_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `new_project_opp_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` varchar(500) DEFAULT NULL,
  `desc` text,
  PRIMARY KEY (`id`),
  KEY `fk_new_project_products_1_idx` (`new_project_opp_id`),
  KEY `fk_new_project_products_2_idx` (`product_id`),
  CONSTRAINT `fk_new_project_products_1` FOREIGN KEY (`new_project_opp_id`) REFERENCES `new_project_opp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_new_project_products_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_bookings`
--


-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!40101 SET character_set_client = utf8 */;
-- CREATE TABLE `order_bookings` (
--   `order_booking_id` int(11) NOT NULL AUTO_INCREMENT,
--   `cust_id` int(11) DEFAULT NULL,
--   `product_info` text,
--   `quote_ref` varchar(100) DEFAULT NULL,
--   `po_num` varchar(100) DEFAULT NULL,
--   `po_date` date DEFAULT NULL,
--   `ship_to` tinytext,
--   `bil_to` tinytext,
--   `remarks` tinytext,
--   `files_info` text,
--   `emp_id` int(11) NOT NULL,
--   `status` int(11) DEFAULT '0',
--   `order_date` date NOT NULL,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `deleted_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL,
--   PRIMARY KEY (`order_booking_id`),
--   KEY `fk_order_bookings_1_idx` (`cust_id`),
--   KEY `fk_order_bookings_2_idx` (`emp_id`),
--   CONSTRAINT `fk_order_bookings_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
--   CONSTRAINT `fk_order_bookings_2` FOREIGN KEY (`emp_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
-- ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
-- /*!40101 SET character_set_client = @saved_cs_client */;


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
  `status` int(11) DEFAULT '0',
  `order_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_booking_id`),
  KEY `fk_order_bookings_1_idx` (`cust_id`),
  KEY `fk_order_bookings_2_idx` (`emp_id`),
  CONSTRAINT `fk_order_bookings_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_bookings_2` FOREIGN KEY (`emp_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;



--
-- Table structure for table `product_orders`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `product_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `pro_quantity` varchar(500) NOT NULL,
  `pro_req_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pro_price` decimal(18,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_orders_1_idx` (`order_id`),
  KEY `fk_product_orders_2_idx` (`product_id`),
  CONSTRAINT `fk_product_orders_1` FOREIGN KEY (`order_id`) REFERENCES `order_bookings` (`order_booking_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_orders_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_statistics`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `pdt_grade` varchar(500) DEFAULT NULL,
  `target` varchar(500) DEFAULT NULL,
  `actuals` varchar(500) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `month` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_statistics_1_idx` (`cust_id`),
  KEY `fk_product_statistics_2_idx` (`prod_id`),
  CONSTRAINT `fk_product_statistics_1` FOREIGN KEY (`prod_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_statistics_2` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prospect_types`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `desc` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quality_cert`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_cert` (
  `id` int(11) NOT NULL,
  `cert_id` varchar(500) NOT NULL,
  `comp_id` varchar(500) NOT NULL,
  `prod_id` varchar(500) NOT NULL,
  `bath_id` varchar(500) DEFAULT NULL,
  `year` varchar(500) DEFAULT NULL,
  `month` varchar(500) DEFAULT NULL,
  `week_no` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`cert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rep_ind_cmp`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rep_ind_cmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comp_id` int(11) DEFAULT NULL,
  `product` text,
  `rsp` varchar(500) DEFAULT NULL,
  `wsp` varchar(500) DEFAULT NULL,
  `stk` varchar(500) DEFAULT NULL,
  `visit_report_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rep_ind_cmp_1_idx` (`visit_report_id`),
  KEY `fk_rep_ind_cmp_2_idx` (`comp_id`),
  CONSTRAINT `fk_rep_ind_cmp_1` FOREIGN KEY (`visit_report_id`) REFERENCES `visit_report` (`report_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rep_ind_cmp_2` FOREIGN KEY (`comp_id`) REFERENCES `competitor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requests`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(500) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requests_info`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `session_clients`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_ip` varchar(500) NOT NULL,
  `client_data` varchar(500) DEFAULT NULL,
  `client_info` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `super_admin`
--


--
-- Table structure for table `travel_exp`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_exp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_report_id` int(11) DEFAULT NULL,
  `mode` varchar(100) DEFAULT NULL,
  `start` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `total_exp` float DEFAULT NULL,
  `total_kms` float DEFAULT NULL,
  `desc` text,
  PRIMARY KEY (`id`),
  KEY `fk_travel_exp_1_idx` (`travel_report_id`),
  CONSTRAINT `fk_travel_exp_1` FOREIGN KEY (`travel_report_id`) REFERENCES `travel_exp_report` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `travel_exp_hotel`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_exp_hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_report_id` int(11) DEFAULT NULL,
  `check_in` timestamp NULL DEFAULT NULL,
  `check_out` timestamp NULL DEFAULT NULL,
  `hotel_info` text,
  `total_exp` float DEFAULT NULL,
  `desc` text,
  PRIMARY KEY (`id`),
  KEY `fk_travel_exp_hotel_1_idx` (`travel_report_id`),
  CONSTRAINT `fk_travel_exp_hotel_1` FOREIGN KEY (`travel_report_id`) REFERENCES `travel_exp_report` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `travel_exp_report`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_exp_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `type` varchar(500) DEFAULT '0',
  `claim_id` varchar(500) DEFAULT NULL,
  `purpose` varchar(500) DEFAULT NULL,
  `appr_status` int(11) DEFAULT '0',
  `food_exp` varchar(500) DEFAULT NULL,
  `out_pdt` float DEFAULT NULL,
  `travel_with_mngr` int(11) DEFAULT '0',
  `total_exp` varchar(500) DEFAULT NULL,
  `travel_desc` text DEFAULT NULL,
  `travel_by` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `extra_exp` float DEFAULT NULL,
  `notes` text,
  `location` varchar(500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `uploads` text,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_travel_exp_report_1_idx` (`user_id`),
  CONSTRAINT `fk_travel_exp_report_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `first_name` varchar(500) DEFAULT NULL,
  `last_name` varchar(500) DEFAULT NULL,
  `user_pwd` text,
  `phone` varchar(500) DEFAULT NULL,
  `city` varchar(500) DEFAULT NULL,
  `street` varchar(500) DEFAULT NULL,
  `state` varchar(500) DEFAULT NULL,
  `zipcode` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(500) NOT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `activated_on` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `country` varchar(500) DEFAULT NULL,
  `phone_imei` varchar(500) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `profile_image` varchar(500) DEFAULT NULL,
  `belongs_manager` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_user_1_idx` (`role_id`),
  CONSTRAINT `fk_user_1` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_roles`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `display_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


CREATE TABLE `travel_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `accuracy` varchar(80) DEFAULT NULL,
  `speed` varchar(80) DEFAULT NULL,
  `bearing` varchar(80) DEFAULT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `activity` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_travel_history_1_idx` (`user_id`),
  CONSTRAINT `fk_travel_history_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `visit_report`
--

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
  `loc_lat` varchar(500) DEFAULT NULL,
  `loc_lng` varchar(500) DEFAULT NULL,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on




CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `user_roles` VALUES (1,'user','Sales Person',NULL,NULL,NULL,'Sales Person'),(2,'manager','Sales Manager',NULL,NULL,NULL,'Sales Manager'),(3,'admin','Office Back end Admin',NULL,NULL,NULL,'Office Back end Admin');

-- INSERT INTO `user` VALUES (1,2,'Dinesh','iOS','eyJpdiI6IlN0dmlcLytRZ1NCR0ptZ0hvRUUrdHZBPT0iLCJ2YWx1ZSI6ImdDZmVkZ2YwQTlUdFBtVElFbzFcLzVBPT0iLCJtYWMiOiI5OTYyMmZhYTMyMGY4ZDhiN2FhYTgwZjJhNTQ0OGRmYjIzNGI3NWNkMTlkMTViYmM5NjA2YjQ4ZGRhZWIxYTk5In0=','+911234567890','Chennai','Ganesh','Tamil Nadu','600028','2017-01-24 06:25:25','2017-01-25 10:58:12','dinesh@erb.com',1,NULL,NULL,'India','9235480598298yishg w4389t7y',NULL,'[\"uploads\\/0626068b537f6604f0c01b8f748aa31c.jpeg\"]',NULL),(2,1,'Kali','dass','eyJpdiI6ImZyaHByWkpuV1VRamoyczd0d1VHd0E9PSIsInZhbHVlIjoiMHJwTmZERWZ5YzgyTG5JbjNoeWZGQT09IiwibWFjIjoiY2JiZTk0NzA4ZWFjZDlhN2YzMzQzNzU1YTY2YmZmMzZkYjUyNGJiMTQyZTI5N2FjNTBjZmMxZmIwMDc4YmVkMCJ9','+911234567890','odshghdof','asgireshjbhrhn','wejgedmrbo','wrfjsegok','2017-01-25 10:57:47','2017-01-25 10:58:06','kali@erb.com',1,NULL,NULL,'wefgsej','wrewmkfmew`',NULL,'[\"uploads\\/ee3a3e76863723e418418eb2b905ba48.jpeg\"]',1);

-- INSERT INTO `customers` VALUES (1,'Dinesh','W2S Solutions, 200 ft road','Thuraipakkam','Tamil Nadu','India','600097','dinesh android','+911234567890','1245678','124','3','2017-01-24 13:41:03','2017-01-24 13:41:03',NULL,'dinesh@android.com','Mobile app development','12.94996','80.23772800000006','Chennai','[]','Chennai',1);


ALTER TABLE `emp_cust_schedule`
ADD COLUMN `lat` VARCHAR(500) NULL DEFAULT '' AFTER `emp_cust_id`,
ADD COLUMN `lng` VARCHAR(500) NULL DEFAULT '' AFTER `lat`;



ALTER TABLE  `emp_cust_schedule`
ADD COLUMN `delivery_to` VARCHAR(500) NULL AFTER `lng`,
ADD COLUMN `delivery_phone` VARCHAR(500) NULL AFTER `delivery_to`,
ADD COLUMN `is_cust_delivery` TINYINT NULL DEFAULT 1 AFTER `delivery_phone`,
ADD COLUMN `timestamp` VARCHAR(500) NULL AFTER `delivery_phone`,
ADD COLUMN `remarks` TEXT NULL AFTER `is_cust_delivery`;


ALTER TABLE `user`
ADD COLUMN  `demo_links` TEXT NULL;




-- Beta
ALTER TABLE `emp_cust_schedule`
ADD COLUMN `added_by` INT NOT NULL,
ADD COLUMN `item_tracking_url` TEXT  NULL,
ADD COLUMN `customer_phone` TEXT  NULL,
ADD COLUMN `signature` TEXT  NULL,
ADD COLUMN `images` TEXT  NULL,
ADD COLUMN `items` TEXT NULL,
ADD COLUMN `schedule_date_time` DATETIME NULL;


ALTER TABLE `travel_history`
ADD COLUMN `battery_status` TEXT NULL;


CREATE TABLE `reviews` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `cust_id` INT NOT NULL,
  `emp_id` INT NOT NULL,
  `review` VARCHAR(150) NULL,
  `stars` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_new_table_1_idx` (`cust_id` ASC),
  INDEX `fk_new_table_2_idx` (`emp_id` ASC),
  CONSTRAINT `fk_new_table_1`
    FOREIGN KEY (`cust_id`)
    REFERENCES  `customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_new_table_2`
    FOREIGN KEY (`emp_id`)
    REFERENCES  `user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);




ALTER TABLE `reviews`
ADD COLUMN `task_id` INT NULL AFTER `updated_at`,
ADD INDEX `fk_reviews_1_idx` (`task_id` ASC);
ALTER TABLE `reviews`
ADD CONSTRAINT `fk_reviews_1`
  FOREIGN KEY (`task_id`)
  REFERENCES `emp_cust_schedule` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;




# new api
ALTER TABLE `emp_cust_schedule`
ADD COLUMN `is_new_address` TINYINT NULL DEFAULT 0,
ADD COLUMN `phone` VARCHAR(500) NULL,
ADD COLUMN `address` VARCHAR(500) NULL,
ADD COLUMN `loc_lng` VARCHAR(500) NULL ,
ADD COLUMN `loc_lat` VARCHAR(500) NULL,
ADD COLUMN `method` VARCHAR(500) NULL;

ALTER TABLE `emp_cust_schedule`
DROP FOREIGN KEY `fk_emp_cust_schedule_3`;


ALTER TABLE `emp_schedule`
ADD COLUMN `task_id` int;

ALTER TABLE `emp_schedule`
ADD INDEX `emp_schedule_index4` (`task_id` ASC);







CREATE TABLE `task_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `timestamps` TIMESTAMP NULL,
  `task_id` INT NOT NULL,
  `emp_id` INT NOT NULL,
  `status` text NOT NULL,
  `address` VARCHAR(500) NULL,
  `lat` VARCHAR(45) NULL,
  `long` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`));

ALTER TABLE `task_status`
ADD INDEX `fk_task_status_1_idx` (`emp_id` ASC),
ADD INDEX `fk_task_status_2_idx` (`task_id` ASC);
ALTER TABLE `task_status`
ADD CONSTRAINT `fk_task_status_1`
  FOREIGN KEY (`emp_id`)
  REFERENCES `user` (`user_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_task_status_2`
  FOREIGN KEY (`task_id`)
  REFERENCES `emp_cust_schedule` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;



ALTER TABLE `emp_schedule`
ADD CONSTRAINT `fk_emp_schedule_3`
  FOREIGN KEY (`task_id`)
  REFERENCES `emp_cust_schedule` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `emp_cust_schedule`
DROP COLUMN `emp_cust_id`,
DROP INDEX `fk_emp_cust_schedule_3_idx` ;


ALTER TABLE  `emp_cust_schedule`
CHANGE COLUMN `timestamp` `timestamps` DATETIME NULL DEFAULT NULL ,
CHANGE COLUMN `customer_phone` `cust_phone` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `address` `cust_address` VARCHAR(500) NULL DEFAULT NULL ;



ALTER TABLE `emp_cust_schedule`
ADD COLUMN `is_geo_fence` int DEFAULT 0,
ADD COLUMN `geo_fence_meter` float DEFAULT null;


ALTER TABLE `travel_history`
ADD COLUMN `compass_direction` TEXT NULL;

ALTER TABLE `user`
ADD COLUMN `activity` VARCHAR(45) NULL DEFAULT 'Offline' AFTER `demo_links`;


# to be updates
ALTER TABLE `emp_cust_schedule`
ADD COLUMN `delivery_time` DATETIME NULL DEFAULT NULL;

ALTER TABLE `emp_cust_schedule`
ADD COLUMN `contact_person` text NULL DEFAULT NULL;
