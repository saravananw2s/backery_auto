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
  `name` varchar(45) NOT NULL,
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
  KEY `fk_api_auth_1_idx` (`auth_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_auth`
--

LOCK TABLES `api_auth` WRITE;
/*!40000 ALTER TABLE `api_auth` DISABLE KEYS */;
INSERT INTO `api_auth` VALUES (53,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6ImdERWVvQmVkbkIifQ.IpIkaSdAsuz3XULoM74mRUA0TYtQYXFF5oe5iLYSY-k','2016-12-26 07:01:28','2016-12-26 07:01:28','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'',0),(54,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QifQ.z2nJJJLYrlixSeg3umYbMCyf3EcjMogW32F8pPwyDSA','2016-12-27 08:25:13','2016-12-27 08:25:13','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(56,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6IkFwcFxcTW9kZWxzXFxTdXBlckFkbWluIn0.4U_spSF9U7AoTy004IpNuQjZVDGMmx0celbM2b3K6Y4','2016-12-27 08:54:07','2016-12-27 08:54:07','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(57,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6IiJ9.tlYSANqxe-4c2yHqVcbjETML0dl5s1016iN00xEWnOo','2016-12-27 08:58:31','2016-12-27 08:58:31','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(58,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SW1rcmEyZDRXblJIU1ZSM1JsQnpNemgwU213NWNtYzlQU0lzSW5aaGJIVmxJam9pV21wTlUyOXNNa3QzUWtZNVFVRkZPVFJEVVhCd1dHeHlRWGxzYVUxd1JXTk9kVEZqU1V4VFNuVXhiejBpTENKdFlXTWlPaUkyWlRFd1l6UXdNelZsTkRCbFpUWXpOVFE1WWpBNVlUQm1NVEZtWTJKbU5EbGhPVGcyWVRZMFlqa3lNVFZqTW1WbFpUSmhNR0V5Wm1KaU1tUm1PREEwSW4wPSJ9.6rMExBQdFPgw5WeTnEqc0kF9Y-f0empeJniaU45cz40','2016-12-27 08:59:45','2016-12-27 08:59:45','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(59,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWpCWFNtTmlOSHBvVEdnMVpucEpTMDFNYmtWSGRsRTlQU0lzSW5aaGJIVmxJam9pU2tScmFHOVhiekkyYkhaTFdWUlJTbVZUZEhZMFZtcHhkME40TW05cVNIZDRjamxaU25jMFZHRkhWVDBpTENKdFlXTWlPaUpqTVRNNE5UYzVNRE5oTmpBelpqVTRPRE00TkdNeE16QXdNekkxWmpJME5qUmtNelU0TkRRM09ERmlOekUwT0dZMVpESTVaVGhsTVRNM01qaGlNV1kxSW4wPSJ9.wn6z2rUo_oB4IxI6ygusQboV0qNuapN5VzmHLTUnZZE','2016-12-27 08:59:52','2016-12-27 08:59:52','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(60,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWpaMk5sVkdNbU13WTI1aGRUTlNjRnd2ZW5FclRVdDNQVDBpTENKMllXeDFaU0k2SW5KNE4wbDRXazFXTkc0NEsyc3plRU01YTJ4TWRHcG5XRzlGTkdSV1JVcGFVMVJ4ZDNwQ05HVmNMMDV2UFNJc0ltMWhZeUk2SW1abU5URmtZMlE1Wm1VeVpqZ3haVGcyWlRFNE4yTTJOakV3TmpOa1pHWTFOREF5WVRFeE1qVTRNV0ppWkdJMU1tTmhZalprWVRCaVlqSm1NRGRqT0dNaWZRPT0ifQ.sKCg2EbxS-QCalzfySE_XqtUOg4_9HrY2puIP34rU1o','2016-12-27 09:00:01','2016-12-27 09:00:01','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(61,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWxwSWJuVXpiRXgwV25kM05VeHhhV3gyUzBscFRGRTlQU0lzSW5aaGJIVmxJam9pTVRacFZqWjFiWEYwUzBVMFVubDNWbWxGWkhKVE5YVkxVM0UzWkZVMlVVbFpaakI2VGxFd2R6aEtVVDBpTENKdFlXTWlPaUpsTURNeU56RXlaREJsTkRVMk1ERTBPVE5oTURsa09HUTFNMlJrWldJeE1HSTFaRFZoTnpZMk5ETTNORGczWkRGbE56UXlZakU0TWpRNU9XTmlPV0ptSW4wPSJ9.scfhIf565XJYOeJUE6UlSgEbabI842xiD_H_Ro-f9T8','2016-12-27 09:00:04','2016-12-27 09:00:04','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(62,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWtscWRGTXJUVXRTY0d0YVp6bE9kMlJHY2t4ek4yYzlQU0lzSW5aaGJIVmxJam9pWkRObk5VWm9aWFZ0YTJ0elJreDJZbFZ6V0ZKakszSllha1ZNS3pWUGJuWlNaM1JVUXpCTlFtWnBVVDBpTENKdFlXTWlPaUl5WkRJeU5XVTFaRGc1T0daaE1HTXdZemczTTJJMk5qZ3pZemxqTnpRNFlqaGpOV1ZrTnpCaVltUTBNamRoTkRKbFptSmtOMlExTnpZeU1tSTVZamhtSW4wPSJ9.BEksatZCVCyewZVrMsliWqockFNEqGo6FM7Ux4rVSPA','2016-12-27 09:00:11','2016-12-27 09:00:11','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(63,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWpKT1NsSXpTMFJ2ZVhOb04xbHlZbU5hUkZWWk1rRTlQU0lzSW5aaGJIVmxJam9pV1ZGSFUweDFZMUZ0YVdkaVZsRnpaVnd2Y1Vod2NuZEJibmg1VEZ3dlMzRjBaMk5GYVVzMWNEWkdZMnBGUFNJc0ltMWhZeUk2SWpGaVpURTBaakk0T0dFMll6RTJOMkZsWWpKalptVmtaREE0Wm1RNU5UaGhaalEyT1RjMk5XWTRNR1V3Wm1JM05UVmxabUl3WXpSa05EbGxaak14T1dNaWZRPT0ifQ.7ouznGUqfo_UTSfgyXOwxZrXVymsc3FXmpwVzLyO5iY','2016-12-27 09:00:23','2016-12-27 09:00:23','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(64,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SW1saGJuSXhOMUl3U0dsVWJXa3lkbXc1VWpKaGRGRTlQU0lzSW5aaGJIVmxJam9pZWtKVVEyRkVUbmxYYlhOaU5FMXdjWEJ2Um1GdlNsVnFTR2gyWVVKbmNITTNPVVZOZDNSRU5GVTVORDBpTENKdFlXTWlPaUl3T1RZd05EUXhOREZqWXpobVpEWTJZMlUxT0dOaE56SXpORE15TWpBd05UZzNNRGRoT0Rjd01HSXlaR1ZsWm1JM04yRXpNRGszTlRJeU9EWTNNamxsSW4wPSJ9.OuZ2hi5vPplh_0QVN9yLwFhOLPyb7M-fm0379tmMxRc','2016-12-27 09:00:39','2016-12-27 09:00:39','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(65,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWtZek5ETjNRMnRZYkRacVEzbGpjRE50Tm05dmRIYzlQU0lzSW5aaGJIVmxJam9pVFd4VlJWZDRkRzB4TTNGV2J6azRYQzkyUjBGSWVGbHZNVEJUVkZsNFdGaEtOSFJYYm5KblFUZFlaVlU5SWl3aWJXRmpJam9pTVdKaFlUQTFaV1k0TldRME1qSTRPREExTmpKbFpHRmtZbVkzWkRjeFpUaGhabUU1TkdReFl6Z3dNelUwTVdOa05EWTFOalpqWVRsaU1UVXpOMlJtTWlKOSJ9.BRQiWowkNt9hR4Q-dl5S0L51agUfCEOC7pkpf_8imgA','2016-12-27 09:00:57','2016-12-27 09:00:57','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(66,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SW5GSVNVRmtSMlZNV1hWME5XbHRNa3Q2UW1kemNYYzlQU0lzSW5aaGJIVmxJam9pT0RCT1RqQnJabXA0WkZOblNEZG9VRTV2UWpOMlpuQmlZa0k0WlRadGFFTnZhelJpVkc0eE0xTk9jejBpTENKdFlXTWlPaUl5TkRRMU9EVTJZemRqTVRCaFl6TTBPRE16TnpBM01XTm1OMk5rT0dWalpqZGxZMlZqTkRKbE9HRTFZemszTXpGaFlUVXdPR1ZqTkRjMFpqUmxZbUZqSW4wPSJ9.-X2n-R1_jBMpcNJaff68f5CoFbNiDUZxjae4eTaPMkQ','2016-12-27 09:00:58','2016-12-27 09:00:58','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(67,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWpORFpsRlFSRmM1Ym5vek1FWlFUM2h2YmxkUVVGRTlQU0lzSW5aaGJIVmxJam9pYVZ3dllYbDFaRTEyUTJVMVYxSnZSRnd2WmxsU1ZVbG9ZVlZaVkV0dFpqVnJLM1Z6ZDJSelZUSjJVWFJCUFNJc0ltMWhZeUk2SWpnM05UZGhPV1ZoWmpKak1USXpNVEU1WkRCaE5UazJOR1prTVRSak9HRmhaRFpsWmpVd09HRXdZV1JtT0RWaVpUVTVNakprTW1KbVlUVXdZMlZrTmpRaWZRPT0ifQ.p2HTb2_6SLw6dd-6jJRW1wX3TRNhrdX5edxGtACx0Sk','2016-12-27 09:00:58','2016-12-27 09:00:58','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(68,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWpSREswNXpiWElyVjFWNVJtZEdiRkJDVFdaeVoxRTlQU0lzSW5aaGJIVmxJam9pY1V4d1FUWllPVmRZVFVkbk1GaFlZME5WWjA1Sk16VldaMU14VGt4T2NrTlhhRmgyV1ZwMVZESmhUVDBpTENKdFlXTWlPaUk1WTJGa056VXhPV1kwWkRrM1kyRXdORFF4TVRaaU1UUm1aVEkxTUdVMk56UTRORGhpT0RRNE0yWXlaRGczTVRCbE5ESTJOVFpqWW1ZM09ESXpPVFk1SW4wPSJ9.eSFh6m9boOgQ3nRk8LJ-j9SuxW8SQ3-gH3WBhZZzlrM','2016-12-27 09:00:58','2016-12-27 09:00:58','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(69,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SW05eGJYSXJLM056TUcxMFRFVklVMUZsZVZKbFlWRTlQU0lzSW5aaGJIVmxJam9pYzBNcmJVVTJRWFE1Y2xBNFFVNXFSRlJYU2xOU1JtdGpObnB1WTB4S2MwcEpXR3B4VTJSbWQxSldjejBpTENKdFlXTWlPaUppTVdSalpURTJNakZpWVdNMVltSTNOakE1TTJFME4yUmlNMkpsWlRrME5qa3pPR0U0TkRReU16TTNOV1V6TW1FMU5EWTFPRFF3TWpVMlptVmpOVEE1SW4wPSJ9.hVrc61BiGWbgjH6dYwM9TxpbQPUQ7QN6rjBl16o3c9Y','2016-12-27 09:01:26','2016-12-27 09:01:26','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(70,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWpaNmVXeFlYQzh4V0c5NmRERkJhWGwyVFhoNlZsSlJQVDBpTENKMllXeDFaU0k2SWtsSE9GUklOVVZsUmtsTFRXaHhTSEZTTVhwQlZYUmlkREo0VnpZM0swSlNkMlY1VUZ3dk5sWjFVV05yUFNJc0ltMWhZeUk2SWpFMU1EVTFPR1EwWWpKa016QTJOR1JpWXpnNVpEVmlOVGM1T1dKbE5tWTJaV0ptWm1VeVlXWXlOVGhpTlRBM05EbGhOVFF3T1RoaFkyVmtZMll6TnpRaWZRPT0ifQ.4u4UUglAvs1CPuQWYPtlwwrZ5Zot8MEJM71HONHSywk','2016-12-27 09:02:36','2016-12-27 09:02:36','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(71,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWpaNE0wMXlTM0p3WW5KMVNIUllSMmhtVVZSaGJFRTlQU0lzSW5aaGJIVmxJam9pVDJZMU5ERnZRbVE1YjA1d1drSjFablF3WWl0MldqRnBXRFYxY2tJMFEzQmFUbkZETWxoQ2QzVXdVVDBpTENKdFlXTWlPaUpqTldVeU1qTmpaR05sWldRNU16QmpOR0ZtTkROalpqQTVOV0V3Tm1Oa09UYzNOVEpoTVdFM09XTTVZakV3TmpVM01HWTJObVppT0RBMFlUUmlORGd5SW4wPSJ9.nEoLJNqXM_xTEcDwe-2dZ_aiwv-xr8BlZwUDPNd7LGQ','2016-12-27 09:03:10','2016-12-27 09:03:10','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(72,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWxVMVVpczNUVk54WEM5Q1JtMTZaWGRzVms5SE9XTjNQVDBpTENKMllXeDFaU0k2SWtKT0swMVJURTV4ZUhKbGFYRTNabUZSVGpGdlRFMWxSRkZCZURseFdtZHFlVFpJVHpCblFXSlJhMnM5SWl3aWJXRmpJam9pWm1VMU9XUmtNbVZoTWpjMVlXTTBZamhoTlRRMk1EazBOREkwWkdZM1ltUXhZekptTmpZNFptWTROamt3TURJNE9UUm1OalJrTVdSbU1UWTFaREEwWVNKOSJ9.GYGrRgNbKovMn9Oj-BfsCtoB6MdmFf7P8Kw4UGwuReg','2016-12-27 09:04:39','2016-12-27 09:04:39','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(73,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWxaSGNrTTNWbTlMVmxKWFpXdFFhakJjTHpKNGRHZEJQVDBpTENKMllXeDFaU0k2SWxWWlluTnpNMUJ3VldkdVIzSlNSU3RFU1V0WVdrZGFPVWRVVjFaMlprTnVTRkZzZFhOelVFZEpSRFE5SWl3aWJXRmpJam9pTURVMVkySmtPREEyTm1ZellUQXlNekU1TlRnNU5XUmpOVGt6TkROa1pEYzJNamxpTlRrelltRTBaVFJqTkRZd01qY3pZbU0wWVRabU5XWXhNalZrTmlKOSJ9.Szze2atrPeHbI7t8ouzGtsKRJcG5A7AlqswlG9fmsbs','2016-12-27 09:05:18','2016-12-27 09:05:18','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(74,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWpkalIydHdkMHRRWTJjM2QzWTFObU5xWkhGdWNWRTlQU0lzSW5aaGJIVmxJam9pUmxOU1UxaHZkMUJUUVdWSFJIQXlhRUZhY0dOeGNGaHRRbWs0ZDJSMWNYRlZWVGhSTTJkeVNreHZNRDBpTENKdFlXTWlPaUprTlRjeE1UVm1ZelJpTkRjeE1URTBNMk0wWVdRMVlqQmlPVFkxWlRZM09ERmxPVFUwTkRCaFltVXdaamhqWXpFeVptVTRNMlJsTm1RNVpqUmtZalkySW4wPSJ9.wc51Vcm31AusgHmtp3xj6sgVfP06nqzyaVCVkZCfKN4','2016-12-27 09:07:02','2016-12-27 09:07:02','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(75,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWpOSVUyWXJOSE5aTTNSWGJWd3ZTVk5sTmt4NWNVbDNQVDBpTENKMllXeDFaU0k2SW1KME5EQlZLMXBuUm0xVk5XNVBSVmRQUmxReGVYcE5TV2hUUnpkeGExSlRUMVpuYzA0d1pDdEZYQzkzUFNJc0ltMWhZeUk2SWpFMk1EVmlaVGc1TXpSaVpEVmhOV0pqTm1VMU5HRTFPREl5WXpneU16STRaRFUzTlRObU5EWmhZV1poWWpRek5qQXlOR00yTm1FeE5tRmxaV00xTkRZaWZRPT0ifQ.dU2Mz9WQFDNTTk6cdD8bNxqjsX3D96vT55RyzoU6O9s','2016-12-27 09:07:11','2016-12-27 09:07:11','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(76,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SW14RWVtRjBZbmRLZUVwck9IWnVXR3R0TTJZNVdGRTlQU0lzSW5aaGJIVmxJam9pU20xSFZsbHFPVnd2V2pkd2RYazRTM0JrZFZSM1lqVmhiMDgxVURsTFZtaGxiRzlRZDBoNlZHOHdZa1U5SWl3aWJXRmpJam9pTkRabFlUQmpZemMyTVRGak1EazBOemhqTmpSbVltVTBZVFV6WXpJMllXWXdOekZsT0RRMk9UazVaakkwTVdVME4yVXdNelU0T0dJNU5tWTFNekUxTVNKOSJ9.cK6O5aARshvwk2Cy-SIFRACti2Gm-BVV4s8S3iHQAyA','2016-12-27 09:07:11','2016-12-27 09:07:11','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(77,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWxWTFVGbGtXa1JyYm10a2FuVkxZa2RzY210a2FtYzlQU0lzSW5aaGJIVmxJam9pYkdwb2NuVkVXWEZ1TnpnMFZsaHJPWEE0YW0xNVkyTklabHBWVnpGamNGcDNYQzlKSzBSTlQybHVkMk05SWl3aWJXRmpJam9pT1RSbFpESXpaREk0WTJOaFl6SXhNVEJqTlRBelpqSXpOelk0TmpVM1lUazNPV1V4T0dJd016UTFNV0ptWWpZNFltTTJNREV5Wm1Fd01qSXdPV0ZqTWlKOSJ9.t2zMTKoMtggQwiWuQXaHRskUeyn1CrDvdRAPk9NIIQI','2016-12-27 09:07:11','2016-12-27 09:07:11','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(78,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWtOdk0zSmFia3RLVUcxV1RXTnpNV1ZuTUhacWVrRTlQU0lzSW5aaGJIVmxJam9pZFZWblJtNVdlSGxEYUhCcmNrRkpaMXd2WEM4M05GQlRTV2cxY1ZsTWVtTlNiMDkzVjNCb2NIcHRaa2ROUFNJc0ltMWhZeUk2SWpBNU9UQTRNVEJqTm1FNE1HVmxaRGczTlRJM1kyRXdOVEJoWVdGbVlXSXlOR1JtWkRBNU56ZGtZamcyTmpaaU1HTXhOV1UxTUdKbVlqSTBORGxtTlRjaWZRPT0ifQ.LZOaDgit-JDN3nGao8oOvsEi_fC-TsH6kf4nsWZlKGI','2016-12-27 09:07:11','2016-12-27 09:07:11','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(79,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SW10WU5YTmNMMEVyYzNsNU5WRmpOMGxoTTNjd1ZucG5QVDBpTENKMllXeDFaU0k2SWtWSVRFZzNaWEkxV1ZBck5WZzJSMk5jTDNSME1Yb3JOelJPTmtSR1dFcGlVVzFLWjFWbU5HOVBkMHN3UFNJc0ltMWhZeUk2SWpsbU5EY3hZV0UyT0dSbVpqRmlOREExWVRobVpERTFPR05oWWpKbU4ySTFZalZsWWpFME5tVmlPV0ZtWkRKbFpUQTNOamxqWWpRek5XVmpNakE0T1dZaWZRPT0ifQ.4FIqrZ6RKrGFZL1MOlux39pM9HGRgKZEiTvZWH3sQV4','2016-12-27 09:07:11','2016-12-27 09:07:11','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(80,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWxkd2VHNWxhWFZPUW5OR1Z6Tk5NbGhIY3poblNXYzlQU0lzSW5aaGJIVmxJam9pVmpKQlRWbFBRWGRrVGtveFFsbGtTV3RYSzBwYVoyY3lORTEzU0c4M2FGSlBiSEZKYUhwS01WQXpjejBpTENKdFlXTWlPaUpqWVdWbFpqUTFZVEJqT1RGall6VmtORGxsTVRjM05tUTNNR1ZtTlRNeU16ZGhNVEV4WVRaalpUTmpNelJrWWpCbE5EYzJPR1V6WXpFNFlUUTBZakpqSW4wPSJ9.Oh0c11u8MZXV3-PD7G_1Yn5a5EZYUjuxOLqOvrkeZHY','2016-12-27 09:07:12','2016-12-27 09:07:12','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(81,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SW5CU1FUaFRhR000UmtkR2FGbFFXRms0VDFNeFMzYzlQU0lzSW5aaGJIVmxJam9pYjJrcmVuZFpiMmhNTkZSY0wxZG5hVFpLVEN0cE1GbFVNbkl5WEM5d1ZubEZiM2c0VGtwRWRXZFROMkZSUFNJc0ltMWhZeUk2SW1ReFl6YzVZekV3T0dOaE5XUmtNakZtWVRFME5tWmhNV1ptWkRJNU5qTXhNMll4T0dKa016RTROV1kzWXpVeFlqWmlOMlF3WVdZeU5UZ3laRGN4WVRJaWZRPT0ifQ.DcAp6C1KQV1heonqqcs5ZdQx2Y9rG85qQLD1_iyYOz0','2016-12-27 09:07:12','2016-12-27 09:07:12','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(82,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SW5KTE9IRldaR0pwV2tWbVdGVnNhM1pCT0Z3dk5qRjNQVDBpTENKMllXeDFaU0k2SWxwT2EyNVphbmMxVUN0RFprVTRSbWR3Y2s5a1ZXdFFVMXd2T0ZGM2RqUlBWMGRVY2tSRVZuUmFRMnc0UFNJc0ltMWhZeUk2SWpVd09XUXpNREpoTjJObFpEZGhPV0kzTWpNek5UazBZVE14TWpBMllqTTJOV1F6T1dSalpERTNNV00zTjJSaU1XTmhORGMxTVRBd1pEUmpPR1U0T1dRaWZRPT0ifQ.XlADdp-4VoWcA1zmO08vxm7z8r2JUHR8UROlzTCNYMg','2016-12-27 09:07:12','2016-12-27 09:07:12','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(83,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWxOSVdHbEtZMWxDY0dKRksxaGxiMk55TVROb09YYzlQU0lzSW5aaGJIVmxJam9pT0dGM04zbzFhbFJsU1RkeVRIbGhOMk5CYnpGRloxbFZjVTFMT1ZvcmJ6STRhRTR4TTJwRVFXcDVXVDBpTENKdFlXTWlPaUl6WTJRMU1URmxOMlZrWkRCaU16ZzFPV1V5TTJGak9XTmtNbU5rT0RSak1HTTBORGM1TjJNeE5qZzRNR1k1TURjMk1HUmxNelJoWlRNMlpXWTFOekJrSW4wPSJ9.GEZa90l3O-HhI2FWv9Vqpaa8oTGXlTu1hRH5J8bfvco','2016-12-27 09:07:12','2016-12-27 09:07:12','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(84,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWtFd09HUjNXa050ZWpWTlduUndZVGxQUW1WVFRIYzlQU0lzSW5aaGJIVmxJam9pWVZsSVpGSjZWekpWVmlzNVFrNWpZVVpOTmpkNGFtRnNVVE4zVlhKTU9XaENVV1JJVFZ3dldHaEZjbWM5SWl3aWJXRmpJam9pTnpRNE4yUmlNVGszTnpjME16RXpNR1kxTTJaaVkyUXhNVFF5WWpoak1tRTBaREk0TUdObU9HVTFOemcwTWpNME9HWmlOREkyTkRVMFpUTTBNbUl4TXlKOSJ9.jtyi0MMn-MvTou-YEeXhbAuoi-bFs01yJWsjA8fPBPA','2016-12-27 09:07:12','2016-12-27 09:07:12','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(85,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWtWTVVuZElZMWxXUkdOY0x6UkhiamRhUVhCM2R6ZEJQVDBpTENKMllXeDFaU0k2SW5wUVYxd3ZLMlpEZW1nM1RVNTBla1JHV1Vab2JWbHdZVlJXVTJaT09FNTNibUprTUZaSk5FUlRTVmMwUFNJc0ltMWhZeUk2SWpneE9UUmpPV1EyTmpnd09UWXlZemhqWkdVMk9HVmpZVE5sTldNMVkyRmpNbUUyTVRrell6ZzFZalF3TldRME1qZ3dObVF5WWpJM1kyRTVZMlF6WWpJaWZRPT0ifQ.lGLQsSY4C2o2yhQnRJP8I0MggMm9QlK2q4GPtPHskGo','2016-12-27 09:07:12','2016-12-27 09:07:12','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(86,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWpWUFhDOHpPSEJWVUVRMU5GQkJVbllyWVVSM04wbFJQVDBpTENKMllXeDFaU0k2SW1VckswaHdOR0ZLTUhaQ2RVMHpOVEkyZWtkclpWbDBNRU5SVldWNU9GaEdlR3AwVDNaaVhDOWtWVXRaUFNJc0ltMWhZeUk2SWpoaFlXUmpZbVUyTnpreU5HVmhZV1k0WTJJek16VXpNekF3TURNMk1URTNZakl3TWprM1ltTTRZbUkyTURZMU9UZ3dNR0kyWm1aa01EZGxPVFEwWm1JaWZRPT0ifQ.y9J8Cuq2fej5p42aPsam1ryb4AHObRhjaKIt5J-rmV0','2016-12-27 09:07:13','2016-12-27 09:07:13','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(87,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWxGaldsTk1ORFZSY0hGY0wwaFpPSGxqYVRCUFNtNW5QVDBpTENKMllXeDFaU0k2SWtkNllWWkxVblJNVlRsY0wyUnJUQ3RDVERZNU9VeHJRMFJHVUVWck0yRnRTblkxV214MFVWSlZhbkp6UFNJc0ltMWhZeUk2SW1SaU1XUmxaREptT1RNNU9EUXpNREkyWm1WaVpqZGlaRGhoWmpGbU5qRmlZamswWWpKalkyVm1ORGsxTTJJek9HUXpZVFpoTVRNM01UTXpPRGt4WkdJaWZRPT0ifQ.SggfipoWi4QrY3fkQkA2rUn9IkRUPJZwsMpdrVEdF8I','2016-12-27 09:07:13','2016-12-27 09:07:13','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(88,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWt4UVVVMW1XRWh3Y1ZKb056VlZTRzFjTDA1TFNGUjNQVDBpTENKMllXeDFaU0k2SW1FMFV6ZEhWRFJJTTAxMU1UUmlkVmgzWXpsd01tZEdYQzkxYW5JME5WSlRNMkZRTkhKRWIybElNQ3RCUFNJc0ltMWhZeUk2SWpsaE4yVTFabU5oTlRkbFpEZ3hNemd6WVdVek5EVTVNVGMyWm1SaE5USXlaRGN3TVRKak9UQTVOek14TURrM00ySXdZVFExWXpsa05XVXhaakZqTnpBaWZRPT0ifQ.smsrdPPMGzyhnwRDJ9SUOSJqrnhMcsIZ3qZYacjfs8k','2016-12-27 09:07:13','2016-12-27 09:07:13','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(89,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWpsSVpYcEZaMDhyVWtKNVVGRjRVMGxtWjJvcmJGRTlQU0lzSW5aaGJIVmxJam9pVm1Ga1RYWk5XV3g0YVUxNk5HZE9XWFZMTW1SSlNXVTBNVWwyUzA1UU9UQjFkVEZEY1RoR01uZDFhejBpTENKdFlXTWlPaUk0TmpNNE1tWTFZVFZpTkdFM1lqbGpOekF4TWpabU1qazFOV1JoTmpsaE5XTTFOREk1TlRVMFpERTVPVEU0Tm1VeE0ySm1NR0ZpTnpFd1lqaGtNakZsSW4wPSJ9.OYG8dLR0Fi1pCrCo6aFr-NQPv6bjsZG9M74_Fimy7xQ','2016-12-27 09:07:13','2016-12-27 09:07:13','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(90,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SW5OMU1rRkdVWEpNYVhONWMzZE9OblJRYTAxb2QxRTlQU0lzSW5aaGJIVmxJam9pYlVoTVpsWm1Ra1JwYjBOamRVTjJSbGN5Y210SlZuaFNXVnd2UjFoQ1oxcHhUMDlKU1ZaeU4zSlhWa1U5SWl3aWJXRmpJam9pWlRjMk4yWXpPR0kwTVROa04yUTBaV1l3WlRRNU1UY3pZV1k1WlRRM1lqRXdaV00wTXpOa1l6RTVOV1poTldKaFpUWm1Nems0T0dVNVl6RXdNMlk1WWlKOSJ9._QNLvaLjAEeqOFEKQMyjx2OPUmkUfJiMjceIUJE-zqw','2016-12-27 09:07:13','2016-12-27 09:07:13','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2),(91,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGl0b2tlbiI6IkFsRWVnbGVvZ2QiLCJtb2RlbCI6ImV5SnBkaUk2SWpCU2EwUllRbWRhUVVWRlVWaHNNalpaYjA5dk5HYzlQU0lzSW5aaGJIVmxJam9pVEhNMVNUUjVNWFozUldaa1VubHVhM1oxVjF3dldqSkhXWEIyTUdaWmVtSTFNMEpoUzNOU2RXeG5OR3M5SWl3aWJXRmpJam9pT0dJek5XVmlPVE13TURnd05qSmxaREptWW1WbE5USTFNRFl3WVRKak1qTmhaVGcxTm1GbVpUTTJNREl5WkdNNE1tTXhNV0ZqWXpGaE1EVXlaR1JsT0NKOSJ9.oU2ZfkeLRguEYwJWa556ZGgO5nqOvQjCrh6Vj_sMy0Q','2016-12-27 09:07:13','2016-12-27 09:07:13','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','127.0.0.1',1,'App\\Models\\SuperAdmin',2);
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
INSERT INTO `audits` VALUES ('05be5f8e-a245-41c3-8c74-4bb40dbea5ca',47,'App\\Models\\Customer','{\"id\":47,\"name\":\"1\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"country\":\"f\",\"zipcode\":\"gfg\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"pan\":\"54545\",\"tin\":\"45454\",\"type\":null,\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"district\":\"gfg\",\"uploads\":null,\"location\":\"Chennai\",\"emp_id\":1}','[]','1','http://master.dev/customer/47','127.0.0.1','2016-12-26 09:07:23','deleted'),('10a16f54-237d-499a-9bcf-e3532097bec5',46,'App\\Models\\Customer','{\"id\":46,\"name\":\"1\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"country\":\"f\",\"zipcode\":\"gfg\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"pan\":\"54545\",\"tin\":\"45454\",\"type\":null,\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"district\":\"gfg\",\"uploads\":null,\"location\":\"Chennai\",\"emp_id\":1}','[]','1','http://master.dev/customer/46','127.0.0.1','2016-12-26 09:07:21','deleted'),('2e34caba-f666-4ee5-b66e-e8f308e8c302',45,'App\\Models\\Customer','{\"id\":45,\"name\":\"1\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"country\":\"f\",\"zipcode\":\"gfg\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"pan\":\"54545\",\"tin\":\"45454\",\"type\":null,\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"district\":\"gfg\",\"uploads\":null,\"location\":\"Chennai\",\"emp_id\":1}','[]','1','http://master.dev/customer/45','127.0.0.1','2016-12-26 09:07:21','deleted'),('324206d3-9098-4e40-a578-904923e0f34f',46,'App\\Models\\Customer','[]','{\"name\":\"1\",\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"zipcode\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"country\":\"f\",\"pan\":\"54545\",\"tin\":\"45454\",\"location\":\"Chennai\",\"emp_id\":1,\"district\":\"gfg\",\"type\":null,\"id\":46}','1','http://master.dev/customer','127.0.0.1','2016-12-26 09:00:06','created'),('3360a962-9c12-4bdc-ba73-a7fa790ee120',70,'App\\Models\\EmpSchedule','[]','{\"emp\":\"1\",\"date\":\"2016-12-26\",\"add_by\":1,\"id\":70}','1','http://master.dev/task','127.0.0.1','2016-12-26 09:06:58','created'),('380c3e92-f655-4030-8d8f-305537f2d82a',10,'App\\Models\\Activity','[]','{\"name\":\"Kali Dass\",\"desc\":\"Test\",\"id\":10}','1','http://master.dev/activity','127.0.0.1','2016-12-26 07:36:06','created'),('38c6b408-6ca2-4501-a728-cce0c2a3ef33',71,'App\\Models\\EmpSchedule','{\"id\":71,\"emp\":1,\"add_by\":1,\"date\":\"2016-12-26\"}','[]','1','http://master.dev/task/71','127.0.0.1','2016-12-26 09:07:03','deleted'),('400da4de-bfb7-421c-bb58-bb4958c6d3bd',42,'App\\Models\\Customer','{\"id\":42,\"name\":\"1\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"country\":\"f\",\"zipcode\":\"gfg\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"pan\":\"54545\",\"tin\":\"45454\",\"type\":null,\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"district\":\"gfg\",\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"location\":\"Chennai\",\"emp_id\":1}','[]','1','http://master.dev/customer/42','127.0.0.1','2016-12-26 09:07:19','deleted'),('4102cdae-d3af-455c-8ba8-bef03739d80a',47,'App\\Models\\Customer','[]','{\"name\":\"1\",\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"zipcode\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"country\":\"f\",\"pan\":\"54545\",\"tin\":\"45454\",\"location\":\"Chennai\",\"emp_id\":1,\"district\":\"gfg\",\"type\":null,\"id\":47}','1','http://master.dev/customer','127.0.0.1','2016-12-26 09:00:31','created'),('4213b1c9-7644-4ebe-9252-d38523323052',15,'App\\Models\\Master','[]','{\"company_name\":\"Kali Dass\",\"company_street\":\"dsds\",\"company_city\":\"dsd\",\"company_state\":\"dsds\",\"company_zipcode\":\"`dsf\",\"company_url\":\"http:\\/\\/www.google.com\",\"company_phone\":\"9524609638\",\"company_desc\":\"fdfdfdf\",\"company_country\":\"fdsf\",\"company_pwd\":\"eyJpdiI6ImZ4OHQyZ2pJXC9IeG9xYWJTN1FtQ1lRPT0iLCJ2YWx1ZSI6InVUc1JDWlpBTEJ1bnl2Q2RlUEN6TWptRWFNdGtreWNTSmRYTVd1VTdCck1UUXNIMTJqUjdQejFHeXVXWE9SbnBIWTBpbkN6YWJDSmR3dFNCcDdVMFwvRzNrTk9MWlhCMEROblUzbkVOZEhBMD0iLCJtYWMiOiJkZWRmODNiOTZmZmU0MmE4OWJmYzhkODc0Yjc0NDExNDdhZDdmZWI4NjRiNmJmZGNiMTIyZTY5NmM3NmYwNzZlIn0=\",\"company_email\":\"kalidafdfdfss@gmail.com\",\"company_id\":15}','1','http://master.dev/company','127.0.0.1','2016-12-26 08:55:52','created'),('49f6c87c-f1a1-4bcf-bffa-c801fd2522a7',16,'App\\Models\\Master','[]','{\"company_name\":\"Kali Dass\",\"company_street\":\"gat\",\"company_city\":\"chen\",\"company_state\":\"tamil nadu\",\"company_zipcode\":\"600041\",\"company_url\":\"http:\\/\\/google.com\",\"company_phone\":\"9524609638\",\"company_desc\":\"test\",\"company_country\":\"india\",\"company_pwd\":\"eyJpdiI6InJNRTNkZ1BBMWxxWGd5U2lESGFtdGc9PSIsInZhbHVlIjoieXNIajR3VjRMZ0l5R0cxVWJpdjdFN1FvQjBjcTMzaERHYWtkOE9NZERtZk9Jdk4zV1ZHUkFrM3NHOExCSjY1Y2RuS0hZNU8wcExKNXFXRllOUXR1MjI4UGVmU2RTcHhkM25cL0Z5OCtvVnlvPSIsIm1hYyI6ImIxZTM3MDVjZDE4YjExMDc4NTgzMGZmM2RjMWY0OTkxNWYxZDRiYjdkMmZkN2UxOTc5ZTUwNDk2OTE0ODZlNjkifQ==\",\"company_email\":\"kalidafdfdsdsddfss@gmail.com\",\"company_id\":16}','1','http://master.dev/company','127.0.0.1','2016-12-26 09:03:30','created'),('50685c21-ad08-4300-a363-658e4383b395',48,'App\\Models\\Customer','{\"id\":48,\"name\":\"kalidass\",\"address\":\"djsdj\",\"city\":\"dsdj\",\"state\":\"dsjdj\",\"country\":\"djsjs\",\"zipcode\":\"dsjdjs\",\"contact_person\":\"dshgdj\",\"contact_no\":\"+19524609638\",\"pan\":\"djsfdj\",\"tin\":\"djsdj\",\"type\":null,\"email\":\"kalidass@gmail.com\",\"desc\":\"djsdj\",\"loc_lat\":\"16.426328078619054\",\"loc_lng\":\"-5.22222499999998\",\"district\":\"djshdj\",\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"location\":\"jsdj\",\"emp_id\":1}','[]','1','http://master.dev/customer/48','127.0.0.1','2016-12-26 09:09:06','deleted'),('5c8a649a-f885-4af2-acf0-fe3ef500daa8',72,'App\\Models\\EmpSchedule','{\"id\":72,\"emp\":1,\"add_by\":1,\"date\":\"2016-12-30\"}','[]','1','http://127.0.0.1/task/72','127.0.0.1','2016-12-27 02:26:39','deleted'),('6836b038-e1c2-45b8-b96e-6f304c1264fb',43,'App\\Models\\Customer','[]','{\"name\":\"1\",\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"zipcode\":\"gfg\",\"loc_lat\":20.303417518489,\"loc_lng\":79.8046855,\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"country\":\"f\",\"pan\":\"54545\",\"tin\":\"45454\",\"location\":\"Chennai\",\"emp_id\":1,\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\",\"district\":\"gfg\",\"type\":null,\"id\":43}','1','http://master.dev/customer','127.0.0.1','2016-12-26 08:58:31','created'),('76cc1382-fc16-4053-88cb-a55dede63cbb',42,'App\\Models\\Customer','{\"loc_lat\":\"14.26438308756265\",\"loc_lng\":\"-3.164064499999995\",\"uploads\":null}','{\"loc_lat\":20.303417518489,\"loc_lng\":79.8046855,\"uploads\":\"[\\\"uploads\\\\\\/3dcbe4762c03437a29feaefb2467014a.jpeg\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\"}','1','http://master.dev/customer/42','127.0.0.1','2016-12-26 08:58:11','updated'),('78e3d38a-0b46-423b-a1ae-aa77a558359d',10,'App\\Models\\Activity','{\"name\":\"Kali Dass\",\"desc\":\"Test\"}','{\"name\":null,\"desc\":null}','1','http://master.dev/activity/10','127.0.0.1','2016-12-26 07:37:02','updated'),('7ded5619-2367-489e-ab8c-f367a1c3e6bd',43,'App\\Models\\Customer','{\"id\":43,\"name\":\"1\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"country\":\"f\",\"zipcode\":\"gfg\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"pan\":\"54545\",\"tin\":\"45454\",\"type\":null,\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"district\":\"gfg\",\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\",\"location\":\"Chennai\",\"emp_id\":1}','[]','1','http://master.dev/customer/43','127.0.0.1','2016-12-26 09:07:19','deleted'),('84368de1-7e4f-49e6-b85c-c468bb0bcf05',42,'App\\Models\\Customer','{\"loc_lat\":null,\"loc_lng\":null}','{\"loc_lat\":14.264383087563,\"loc_lng\":-3.1640645}','1','http://master.dev/customer/42','127.0.0.1','2016-12-26 08:57:56','updated'),('9bcf278c-d60d-4110-9916-824b3c17deaa',72,'App\\Models\\EmpSchedule','[]','{\"emp\":\"1\",\"date\":\"2016-12-30\",\"add_by\":1,\"id\":72}','1','http://127.0.0.1/task','127.0.0.1','2016-12-27 02:26:36','created'),('a73e603d-50f6-4570-9ca9-852ca3eebc3f',44,'App\\Models\\Customer','[]','{\"name\":\"1\",\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"zipcode\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"country\":\"f\",\"pan\":\"54545\",\"tin\":\"45454\",\"location\":\"Chennai\",\"emp_id\":1,\"district\":\"gfg\",\"type\":null,\"id\":44}','1','http://master.dev/customer','127.0.0.1','2016-12-26 08:59:24','created'),('b2631336-b84c-492a-b2de-6dfeee830a77',49,'App\\Models\\Customer','{\"uploads\":null}','{\"uploads\":\"[\\\"uploads\\\\\\/f4644b273c7e9823af7b8cc38c9b6995.png\\\",\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\",\\\"uploads\\\\\\/746c2e995f4397713ab140586924430d.png\\\"]\"}','1','http://master.dev/customer/49','127.0.0.1','2016-12-26 09:14:17','updated'),('b7ac853d-0c48-46d9-b88c-b6037122d05a',44,'App\\Models\\Customer','{\"id\":44,\"name\":\"1\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"country\":\"f\",\"zipcode\":\"gfg\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"pan\":\"54545\",\"tin\":\"45454\",\"type\":null,\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"district\":\"gfg\",\"uploads\":null,\"location\":\"Chennai\",\"emp_id\":1}','[]','1','http://master.dev/customer/44','127.0.0.1','2016-12-26 09:07:20','deleted'),('c1620b3c-ef9b-4e50-8fb0-b21289c8a61f',45,'App\\Models\\Customer','[]','{\"name\":\"1\",\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"zipcode\":\"gfg\",\"loc_lat\":\"20.3034175184893\",\"loc_lng\":\"79.8046855\",\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"country\":\"f\",\"pan\":\"54545\",\"tin\":\"45454\",\"location\":\"Chennai\",\"emp_id\":1,\"district\":\"gfg\",\"type\":null,\"id\":45}','1','http://master.dev/customer','127.0.0.1','2016-12-26 08:59:51','created'),('c3634f7f-e1f6-432e-93c9-7dadbf47d351',49,'App\\Models\\Customer','[]','{\"name\":\"kalidass\",\"email\":\"kalidass@gmail.com\",\"desc\":\"djsdj\",\"address\":\"djsdj\",\"city\":\"dsdj\",\"state\":\"dsjdj\",\"zipcode\":\"dsjdjs\",\"loc_lat\":\"16.426328078619054\",\"loc_lng\":\"-5.22222499999998\",\"contact_person\":\"dshgdj\",\"contact_no\":\"+19524609638\",\"country\":\"djsjs\",\"pan\":\"djsfdj\",\"tin\":\"djsdj\",\"location\":\"jsdj\",\"emp_id\":1,\"district\":\"djshdj\",\"type\":null,\"id\":49}','1','http://master.dev/customer','127.0.0.1','2016-12-26 09:09:28','created'),('ca68cd77-7364-4b4f-9d16-8dfd395cbf74',48,'App\\Models\\Customer','[]','{\"name\":\"kalidass\",\"email\":\"kalidass@gmail.com\",\"desc\":\"djsdj\",\"address\":\"djsdj\",\"city\":\"dsdj\",\"state\":\"dsjdj\",\"zipcode\":\"dsjdjs\",\"loc_lat\":16.426328078619,\"loc_lng\":-5.222225,\"contact_person\":\"dshgdj\",\"contact_no\":\"+19524609638\",\"country\":\"djsjs\",\"pan\":\"djsfdj\",\"tin\":\"djsdj\",\"location\":\"jsdj\",\"emp_id\":\"1\",\"uploads\":\"[\\\"uploads\\\\\\/d6c594a8ab2957722421c517ae5304ba.png\\\"]\",\"district\":\"djshdj\",\"type\":null,\"id\":48}','1','http://master.dev/customer','127.0.0.1','2016-12-26 09:07:58','created'),('d7214300-30e5-416f-aba2-298708e50457',42,'App\\Models\\Customer','[]','{\"name\":\"1\",\"email\":\"dass.kali14@gmail.com\",\"desc\":\"gfg\",\"address\":\"dsfd\",\"city\":\"fdg\",\"state\":\"gfgf\",\"zipcode\":\"gfg\",\"loc_lat\":null,\"loc_lng\":null,\"contact_person\":\"Dass Kali\",\"contact_no\":\"+19524609638\",\"country\":\"f\",\"pan\":\"54545\",\"tin\":\"45454\",\"location\":\"Chennai\",\"emp_id\":1,\"district\":\"gfg\",\"type\":null,\"id\":42}','1','http://master.dev/customer','127.0.0.1','2016-12-26 08:51:01','created'),('d93d21fb-0846-4bb8-ab3b-d942a40c5fb8',41,'App\\Models\\Customer','{\"id\":41,\"name\":\"1\",\"address\":\"1\",\"city\":\"1\",\"state\":\"1\",\"country\":null,\"zipcode\":null,\"contact_person\":null,\"contact_no\":null,\"pan\":null,\"tin\":null,\"type\":null,\"email\":null,\"desc\":null,\"loc_lat\":null,\"loc_lng\":null,\"district\":null,\"uploads\":null,\"location\":null,\"emp_id\":1}','[]','1','http://master.dev/customer/41','127.0.0.1','2016-12-26 08:51:10','deleted'),('dae3a371-ac47-472e-9f8e-879ce8b22be5',1,'App\\Models\\Competitor','[]','{\"name\":\"fgf\",\"address\":\"gf\",\"loc_lat\":3.933889,\"loc_lng\":-53.125782,\"remark\":\"gfg\",\"desc\":\"gfg\",\"id\":1}','1','http://127.0.0.1/competitor','127.0.0.1','2016-12-27 03:34:16','created'),('daf31345-63af-41a1-86ce-7d85d9794788',70,'App\\Models\\EmpSchedule','{\"id\":70,\"emp\":1,\"add_by\":1,\"date\":\"2016-12-26\"}','[]','1','http://master.dev/task/70','127.0.0.1','2016-12-26 09:07:02','deleted'),('eb3bcf71-5b0f-42e9-8579-3ca59f0d09d5',71,'App\\Models\\EmpSchedule','[]','{\"emp\":\"1\",\"date\":\"2016-12-26\",\"add_by\":1,\"id\":71}','1','http://master.dev/task','127.0.0.1','2016-12-26 09:07:00','created'),('f7450b73-a9b0-4540-a8da-4f0683474c1f',15,'App\\Models\\Master','{\"company_pwd\":\"eyJpdiI6ImZ4OHQyZ2pJXC9IeG9xYWJTN1FtQ1lRPT0iLCJ2YWx1ZSI6InVUc1JDWlpBTEJ1bnl2Q2RlUEN6TWptRWFNdGtreWNTSmRYTVd1VTdCck1UUXNIMTJqUjdQejFHeXVXWE9SbnBIWTBpbkN6YWJDSmR3dFNCcDdVMFwvRzNrTk9MWlhCMEROblUzbkVOZEhBMD0iLCJtYWMiOiJkZWRmODNiOTZmZmU0MmE4OWJmYzhkODc0Yjc0NDExNDdhZDdmZWI4NjRiNmJmZGNiMTIyZTY5NmM3NmYwNzZlIn0=\"}','{\"company_pwd\":\"eyJpdiI6InFFSktVMytMZmwzZXZ4bEsxNytmb1E9PSIsInZhbHVlIjoiNkRYeHlkajJvWkU5VDhmS1kzY2tZV3pXemRcL3VjcVBXbk9MTG53RnNqOTlqbUo3RGtpZXNIRlFtUUJnKzFMY1BwTW5RWkZDVEh1Wnhrc1Rwc3BHd1c4cmk1SEJMZ3p5dFVSSnd4QmhBK3M0PSIsIm1hYyI6ImZmOWU4MmE1OTEyOThmNTljZDBjM2FjMzJkODM3YjliZDU3NDQ2ZTViZDkxMWUwNDRkOWIwNjk5ZTliNDBhOGQifQ==\"}','1','http://master.dev/company/15','127.0.0.1','2016-12-26 09:03:42','updated');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_db_info`
--

LOCK TABLES `company_db_info` WRITE;
/*!40000 ALTER TABLE `company_db_info` DISABLE KEYS */;
INSERT INTO `company_db_info` VALUES (15,'api.master.dev','localhost','3306','root','sfa_database','eyJpdiI6InljVUpGU2xSeE80YStwNWZpQzhMVXc9PSIsInZhbHVlIjoid0hcL3NnSmxSWVZZQnhiQ2hJRmhsakE9PSIsIm1hYyI6ImFkZDY1YzFjOWFiYzkyNTMzMTBkNTA4ZGZkYzM0NzI3ZGYxY2QyOWRkYWJiYzAyNzk1MzBhZDg3MGZkOTQ2OGQifQ==','0000-00-00 00:00:00',NULL,NULL,1),(16,'master.dev','localhost','3306','root','sfa_database','eyJpdiI6InljVUpGU2xSeE80YStwNWZpQzhMVXc9PSIsInZhbHVlIjoid0hcL3NnSmxSWVZZQnhiQ2hJRmhsakE9PSIsIm1hYyI6ImFkZDY1YzFjOWFiYzkyNTMzMTBkNTA4ZGZkYzM0NzI3ZGYxY2QyOWRkYWJiYzAyNzk1MzBhZDg3MGZkOTQ2OGQifQ==',NULL,NULL,NULL,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitor`
--

LOCK TABLES `competitor` WRITE;
/*!40000 ALTER TABLE `competitor` DISABLE KEYS */;
INSERT INTO `competitor` VALUES (1,'fgf','gfg','gfg','2016-12-27 03:34:16','2016-12-27 03:34:16','gf',NULL,'3.933889','-53.125782000000015');
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_schedule`
--

LOCK TABLES `emp_schedule` WRITE;
/*!40000 ALTER TABLE `emp_schedule` DISABLE KEYS */;
INSERT INTO `emp_schedule` VALUES (70,1,'2016-12-26 09:06:58','2016-12-26 09:07:02','2016-12-26 09:07:02',1,'2016-12-26'),(71,1,'2016-12-26 09:07:00','2016-12-26 09:07:03','2016-12-26 09:07:03',1,'2016-12-26'),(72,1,'2016-12-27 02:26:36','2016-12-27 02:26:38','2016-12-27 02:26:38',1,'2016-12-30');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master`
--

LOCK TABLES `master` WRITE;
/*!40000 ALTER TABLE `master` DISABLE KEYS */;
INSERT INTO `master` VALUES ('Master','dsds','dsd','dsds','`dsf','http://www.google.com','9524609638','fdfdfdf',15,'2016-12-26 08:55:52','2016-12-26 09:03:42','fdsf','eyJpdiI6InljVUpGU2xSeE80YStwNWZpQzhMVXc9PSIsInZhbHVlIjoid0hcL3NnSmxSWVZZQnhiQ2hJRmhsakE9PSIsIm1hYyI6ImFkZDY1YzFjOWFiYzkyNTMzMTBkNTA4ZGZkYzM0NzI3ZGYxY2QyOWRkYWJiYzAyNzk1MzBhZDg3MGZkOTQ2OGQifQ==','kalidafdfdfss@gmail.com',NULL),('Admin','gat','chen','tamil nadu','600041','http://google.com','9524609638','test',16,'2016-12-26 09:03:30','2016-12-26 09:03:30','india','eyJpdiI6InljVUpGU2xSeE80YStwNWZpQzhMVXc9PSIsInZhbHVlIjoid0hcL3NnSmxSWVZZQnhiQ2hJRmhsakE9PSIsIm1hYyI6ImFkZDY1YzFjOWFiYzkyNTMzMTBkNTA4ZGZkYzM0NzI3ZGYxY2QyOWRkYWJiYzAyNzk1MzBhZDg3MGZkOTQ2OGQifQ==','kalidafdfdsdsddfss@gmail.com',NULL);
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
INSERT INTO `super_admin` VALUES (2,'admin@sfa.com','kali',NULL,NULL,NULL,NULL,'eyJpdiI6InljVUpGU2xSeE80YStwNWZpQzhMVXc9PSIsInZhbHVlIjoid0hcL3NnSmxSWVZZQnhiQ2hJRmhsakE9PSIsIm1hYyI6ImFkZDY1YzFjOWFiYzkyNTMzMTBkNTA4ZGZkYzM0NzI3ZGYxY2QyOWRkYWJiYzAyNzk1MzBhZDg3MGZkOTQ2OGQifQ==',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
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

-- Dump completed on 2016-12-27 20:16:27
