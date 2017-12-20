-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: it610
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data` (
  `id` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ip_address` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES (1,'Agnese','Cool','acool0@people.com.cn','19.12.177.202'),(2,'Nannie','Di Bernardo','ndibernardo1@wikipedia.org','137.113.230.198'),(3,'Dukie','McBrady','dmcbrady2@ox.ac.uk','7.125.182.35'),(4,'Stormie','Simmonite','ssimmonite3@mit.edu','115.70.200.249'),(5,'Koo','Pigney','kpigney4@multiply.com','222.28.245.3'),(6,'Milo','McGlone','mmcglone5@parallels.com','122.119.208.108'),(7,'Westbrooke','Dat','wdat6@imdb.com','16.6.220.147'),(8,'Brigham','Grouvel','bgrouvel7@reddit.com','28.82.231.112'),(9,'Estell','Rapper','erapper8@aol.com','172.78.220.230'),(10,'Malvina','Anwell','manwell9@posterous.com','108.153.161.144'),(11,'Rebecca','Canacott','rcanacotta@earthlink.net','252.86.44.15'),(12,'Rosalinda','Pohl','rpohlb@pcworld.com','162.176.150.138'),(13,'Carita','Koppel','ckoppelc@gov.uk','190.23.251.149'),(14,'Ofilia','Amps','oampsd@dailymail.co.uk','250.188.185.85'),(15,'Kristoforo','Bridgland','kbridglande@abc.net.au','184.157.103.112');
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-18  0:00:01
