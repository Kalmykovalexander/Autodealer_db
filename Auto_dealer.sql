-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: auto_dealer
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(130) NOT NULL,
  `city` varchar(130) NOT NULL,
  `province` varchar(130) NOT NULL,
  `street` varchar(130) NOT NULL,
  `house_number` varchar(30) NOT NULL,
  `postcode` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `street_house_idx` (`street`,`house_number`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Italy','Sezze','LT','Via Lavinio','4','04018'),(2,'Italy','Sezze','LT','Via Quarto','27','04018'),(3,'Italy','Sezze','LT','Via Sulmo','38','04018'),(4,'Italy','Latina','LT','Via Toscana','78','04100'),(5,'Italy','Latina','LT','Via Molise','14','04100'),(6,'Italy','Latina','LT','Via Milano','23','04100'),(7,'Italy','Roma','RM','Via Puglia','45','00127'),(8,'Italy','Latina','LT','Via Pompeo','27','04100'),(9,'Italy','Frosinone','FR','Via Roma','19','03100');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive_orders`
--

DROP TABLE IF EXISTS `archive_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archive_orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Sold vehicles archive';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive_orders`
--

LOCK TABLES `archive_orders` WRITE;
/*!40000 ALTER TABLE `archive_orders` DISABLE KEYS */;
INSERT INTO `archive_orders` VALUES (1,3);
/*!40000 ALTER TABLE `archive_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autopark`
--

DROP TABLE IF EXISTS `autopark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autopark` (
  `autosalon_id` int unsigned NOT NULL COMMENT 'Link to autosalon',
  `vehicle_id` int unsigned NOT NULL COMMENT 'Link to vehicle',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`autosalon_id`,`vehicle_id`),
  KEY `autopark_vehicle_id_fk` (`vehicle_id`),
  CONSTRAINT `autopark_autosalon_id_fk` FOREIGN KEY (`autosalon_id`) REFERENCES `autosalon` (`id`),
  CONSTRAINT `autopark_vehicle_id_fk` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Autopark';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autopark`
--

LOCK TABLES `autopark` WRITE;
/*!40000 ALTER TABLE `autopark` DISABLE KEYS */;
INSERT INTO `autopark` VALUES (1,2,'2021-03-22 20:53:32','2021-03-22 20:53:32'),(1,3,'2021-03-23 22:46:03','2021-03-23 22:46:03'),(2,3,'2021-03-22 20:53:32','2021-03-22 20:53:32'),(3,1,'2021-03-22 20:53:32','2021-03-22 20:53:32');
/*!40000 ALTER TABLE `autopark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autosalon`
--

DROP TABLE IF EXISTS `autosalon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autosalon` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identity',
  `address_id` int unsigned NOT NULL COMMENT 'Link to address',
  `phone` varchar(100) NOT NULL COMMENT 'Phone',
  `email` varchar(100) NOT NULL COMMENT 'Email',
  `fax` varchar(100) DEFAULT NULL COMMENT 'Fax',
  `company_data_id` int unsigned NOT NULL COMMENT 'Link to company data',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`),
  KEY `autosalon_company_data_id_fk` (`company_data_id`),
  KEY `autosalon_address_id_fk` (`address_id`),
  CONSTRAINT `autosalon_address_id_fk` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `autosalon_company_data_id_fk` FOREIGN KEY (`company_data_id`) REFERENCES `company_data` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Autosalon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autosalon`
--

LOCK TABLES `autosalon` WRITE;
/*!40000 ALTER TABLE `autosalon` DISABLE KEYS */;
INSERT INTO `autosalon` VALUES (1,1,'0773 846730','autosalonsezze@libero.it','0773 872411',1,'2021-03-21 18:29:11','2021-03-21 18:32:35'),(2,2,'0773 843750','autosalonsezze@libero.it','0773 858409',1,'2021-03-21 18:29:11','2021-03-21 18:32:35'),(3,3,'0773 825249','autosalonsezze@libero.it','0773 827010',1,'2021-03-21 18:29:11','2021-03-21 18:32:35');
/*!40000 ALTER TABLE `autosalon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autosalon_users`
--

DROP TABLE IF EXISTS `autosalon_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autosalon_users` (
  `autosalon_id` int unsigned NOT NULL COMMENT 'Link to autosalon',
  `user_id` int unsigned NOT NULL COMMENT 'Link to user',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`autosalon_id`,`user_id`),
  KEY `user_id_fk` (`user_id`),
  CONSTRAINT `autosalon_id_fk` FOREIGN KEY (`autosalon_id`) REFERENCES `autosalon` (`id`),
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Autosalon users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autosalon_users`
--

LOCK TABLES `autosalon_users` WRITE;
/*!40000 ALTER TABLE `autosalon_users` DISABLE KEYS */;
INSERT INTO `autosalon_users` VALUES (1,2,'2021-03-21 19:06:59','2021-03-21 19:06:59'),(2,3,'2021-03-21 19:06:59','2021-03-21 19:06:59'),(3,1,'2021-03-21 19:06:59','2021-03-21 19:06:59');
/*!40000 ALTER TABLE `autosalon_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `body_vehicle`
--

DROP TABLE IF EXISTS `body_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `body_vehicle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identity',
  `name` varchar(100) NOT NULL COMMENT 'Name',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`),
  KEY `name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Body vehicle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `body_vehicle`
--

LOCK TABLES `body_vehicle` WRITE;
/*!40000 ALTER TABLE `body_vehicle` DISABLE KEYS */;
INSERT INTO `body_vehicle` VALUES (1,'sedan','2021-03-21 21:13:27','2021-03-21 21:13:27'),(2,'coupe','2021-03-21 21:13:27','2021-03-21 21:13:27'),(3,'sports car','2021-03-21 21:13:27','2021-03-21 21:13:27'),(4,'station wagon','2021-03-21 21:13:27','2021-03-21 21:13:27'),(5,'hatchback','2021-03-21 21:13:27','2021-03-21 21:13:27'),(6,'convertible','2021-03-21 21:13:27','2021-03-21 21:13:27'),(7,'minivan','2021-03-21 21:13:27','2021-03-21 21:13:27'),(8,'pickup','2021-03-21 21:13:27','2021-03-21 21:13:27'),(9,'Moto Standard','2021-03-21 21:13:27','2021-03-21 21:13:27'),(10,'Moto Street','2021-03-21 21:13:27','2021-03-21 21:13:27'),(11,'Moto Sport','2021-03-21 21:13:27','2021-03-21 21:13:27'),(12,'Moto Touring','2021-03-21 21:13:27','2021-03-21 21:13:27'),(13,'Moto Off-road','2021-03-21 21:13:27','2021-03-21 21:13:27'),(14,'Bus Mini','2021-03-21 21:13:27','2021-03-21 21:13:27'),(15,'Scooter','2021-03-21 21:13:27','2021-03-21 21:13:27');
/*!40000 ALTER TABLE `body_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identity',
  `brand_name` varchar(100) NOT NULL COMMENT 'Brand name',
  `brand_country` varchar(100) NOT NULL COMMENT 'Brand country',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`),
  KEY `brand_name_idx` (`brand_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Brand';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Toyota','Japan','2021-03-21 20:19:33','2021-03-21 20:19:33'),(2,'Skoda','Czech Republic','2021-03-21 20:19:33','2021-03-21 20:19:33'),(3,'Dacia','Romania','2021-03-21 20:19:33','2021-03-21 20:19:33'),(4,'Renault','France','2021-03-21 20:19:33','2021-03-21 20:19:33'),(5,'Ford','USA','2021-03-21 20:19:33','2021-03-21 20:19:33'),(6,'Hyundai','South Korea','2021-03-21 20:19:33','2021-03-21 20:19:33'),(7,'Volkswagen','Germany','2021-03-21 20:19:33','2021-03-21 20:19:33'),(8,'Chevrolet','USA','2021-03-21 20:19:33','2021-03-21 20:19:33'),(9,'Suzuki','Japan','2021-03-21 20:19:33','2021-03-21 20:19:33'),(10,'Fiat','Italy','2021-03-21 20:19:33','2021-03-21 20:19:33');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color_vehicle`
--

DROP TABLE IF EXISTS `color_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color_vehicle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identity',
  `name` varchar(100) NOT NULL COMMENT 'Name',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`),
  KEY `name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Color vehicle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color_vehicle`
--

LOCK TABLES `color_vehicle` WRITE;
/*!40000 ALTER TABLE `color_vehicle` DISABLE KEYS */;
INSERT INTO `color_vehicle` VALUES (1,'Red','2021-03-21 21:18:35','2021-03-21 21:18:35'),(2,'Orange','2021-03-21 21:18:35','2021-03-21 21:18:35'),(3,'Yellow','2021-03-21 21:18:35','2021-03-21 21:18:35'),(4,'Green','2021-03-21 21:18:35','2021-03-21 21:18:35'),(5,'Blue','2021-03-21 21:18:35','2021-03-21 21:18:35'),(6,'Violet','2021-03-21 21:18:35','2021-03-21 21:18:35'),(7,'Brown','2021-03-21 21:18:35','2021-03-21 21:18:35'),(8,'Black','2021-03-21 21:18:35','2021-03-21 21:18:35'),(9,'Grey','2021-03-21 21:18:35','2021-03-21 21:18:35'),(10,'White','2021-03-21 21:18:35','2021-03-21 21:18:35'),(11,'Pink','2021-03-21 21:18:35','2021-03-21 21:18:35'),(12,'Purple','2021-03-21 21:18:35','2021-03-21 21:18:35');
/*!40000 ALTER TABLE `color_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_data`
--

DROP TABLE IF EXISTS `company_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identity',
  `company_type` varchar(30) NOT NULL COMMENT 'Tipo di impresa',
  `company_name` varchar(150) NOT NULL COMMENT 'Denominazione della ditta',
  `company_address_id` int unsigned NOT NULL COMMENT 'Indirizzo della sede legale',
  `vat_number` varchar(30) NOT NULL COMMENT 'Numero di partita IVA',
  `register_office` varchar(130) NOT NULL COMMENT 'Ufficio del registro delle imprese',
  `number_rea` varchar(30) NOT NULL COMMENT 'Numero di iscrizione REA',
  `fiscal_code` varchar(30) DEFAULT NULL COMMENT 'Codice Fiscale della societ?',
  `share_capital` varchar(30) DEFAULT NULL COMMENT 'Capitale sociale e quota versata',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`),
  KEY `company_address_id_fk` (`company_address_id`),
  CONSTRAINT `company_address_id_fk` FOREIGN KEY (`company_address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Company data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_data`
--

LOCK TABLES `company_data` WRITE;
/*!40000 ALTER TABLE `company_data` DISABLE KEYS */;
INSERT INTO `company_data` VALUES (1,'imprenditore individuale','Autosalon di Sezze',1,'02056900561','Latina','2-03567',NULL,NULL,'2021-03-21 18:29:00','2021-03-21 18:29:00');
/*!40000 ALTER TABLE `company_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `count_vehicle`
--

DROP TABLE IF EXISTS `count_vehicle`;
/*!50001 DROP VIEW IF EXISTS `count_vehicle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `count_vehicle` AS SELECT 
 1 AS `autosalon_id`,
 1 AS `total_vehicle`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `drivetrain_type`
--

DROP TABLE IF EXISTS `drivetrain_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivetrain_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identity',
  `name` varchar(100) NOT NULL COMMENT 'Name',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`),
  KEY `name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Drivetrain type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivetrain_type`
--

LOCK TABLES `drivetrain_type` WRITE;
/*!40000 ALTER TABLE `drivetrain_type` DISABLE KEYS */;
INSERT INTO `drivetrain_type` VALUES (1,'Front Wheel Drive','2021-03-21 21:32:45','2021-03-21 21:32:45'),(2,'Rear Wheel Drive','2021-03-21 21:32:45','2021-03-21 21:32:45'),(3,'Four Wheel Drive','2021-03-21 21:32:45','2021-03-21 21:32:45'),(4,'All-Wheel Drive','2021-03-21 21:32:45','2021-03-21 21:32:45');
/*!40000 ALTER TABLE `drivetrain_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine_type`
--

DROP TABLE IF EXISTS `engine_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engine_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identity',
  `name` varchar(100) NOT NULL COMMENT 'Name',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`),
  KEY `name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Engine type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine_type`
--

LOCK TABLES `engine_type` WRITE;
/*!40000 ALTER TABLE `engine_type` DISABLE KEYS */;
INSERT INTO `engine_type` VALUES (1,'Gasoline','2021-03-21 21:30:23','2021-03-21 21:30:23'),(2,'Diesel','2021-03-21 21:30:23','2021-03-21 21:30:23'),(3,'Electric','2021-03-21 21:30:23','2021-03-21 21:30:23'),(4,'Gas','2021-03-21 21:30:23','2021-03-21 21:30:23');
/*!40000 ALTER TABLE `engine_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identity',
  `brand_id` int unsigned NOT NULL COMMENT 'Link to brand vehicle',
  `model_name` varchar(100) NOT NULL COMMENT 'Model name',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`),
  KEY `model_name_idx` (`model_name`),
  KEY `model_brand_id_idx` (`brand_id`),
  CONSTRAINT `model_brand_id_fk` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Model';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,1,'Highlander 3.5','2021-03-21 20:38:47','2021-03-21 20:38:47'),(2,2,'Karoq 1.6 MPI','2021-03-21 20:38:47','2021-03-21 20:38:47'),(3,3,'Duster','2021-03-21 20:38:47','2021-03-21 20:38:47'),(4,4,'Logan 1.6','2021-03-21 20:38:47','2021-03-21 20:38:47'),(5,5,'Transit','2021-03-21 20:38:47','2021-03-21 20:38:47'),(6,6,'Palisade 2.2 CRDi','2021-03-21 20:38:47','2021-03-21 20:38:47'),(7,7,'Teramont 2.0 TSI','2021-03-21 20:38:47','2021-03-21 20:38:47'),(8,8,'Traverse 3.6','2021-03-21 20:38:47','2021-03-21 20:38:47'),(9,9,'Forenza','2021-03-21 20:38:47','2021-03-21 20:38:47'),(10,10,'Punto','2021-03-21 20:38:47','2021-03-21 20:38:47');
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identity',
  `autosalon_id` int unsigned NOT NULL COMMENT 'Link to autosalon',
  `manager_id` int unsigned NOT NULL COMMENT 'Link to manager-user',
  `client_id` int unsigned NOT NULL COMMENT 'Link to client-user',
  `vehicle_id` int unsigned NOT NULL COMMENT 'Link to vehicle',
  `status_id` tinyint unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`),
  KEY `orders_client_id_fk` (`client_id`),
  KEY `orders_status_id_fk` (`status_id`),
  KEY `orders_vehicle_id_fk` (`vehicle_id`),
  KEY `orders_autosalon_id_fk` (`autosalon_id`),
  KEY `orders_manager_id_fk` (`manager_id`),
  CONSTRAINT `orders_autosalon_id_fk` FOREIGN KEY (`autosalon_id`) REFERENCES `autosalon` (`id`),
  CONSTRAINT `orders_client_id_fk` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_manager_id_fk` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_status_id_fk` FOREIGN KEY (`status_id`) REFERENCES `status_orders` (`id`),
  CONSTRAINT `orders_user_id_fk` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_vehicle_id_fk` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Orders';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,2,4,1,1,'2021-03-22 20:50:06','2021-04-10 21:31:19'),(2,2,3,5,2,1,'2021-03-22 20:50:06','2021-04-10 21:31:19'),(3,3,1,6,3,1,'2021-03-22 20:50:06','2021-04-10 21:31:19'),(4,1,2,5,1,1,'2021-03-23 22:39:51','2021-04-10 21:31:19'),(5,2,3,4,3,1,'2021-03-24 20:52:13','2021-04-10 21:31:19');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `archive_orders` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN 
  INSERT INTO archive_orders (vehicle_id) VALUES (NEW.vehicle_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `sold_by_manager`
--

DROP TABLE IF EXISTS `sold_by_manager`;
/*!50001 DROP VIEW IF EXISTS `sold_by_manager`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sold_by_manager` AS SELECT 
 1 AS `managers_name`,
 1 AS `total_sold`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `status_orders`
--

DROP TABLE IF EXISTS `status_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_orders` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_orders`
--

LOCK TABLES `status_orders` WRITE;
/*!40000 ALTER TABLE `status_orders` DISABLE KEYS */;
INSERT INTO `status_orders` VALUES (1,'in progress'),(2,'complete'),(3,'canceled');
/*!40000 ALTER TABLE `status_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transmission`
--

DROP TABLE IF EXISTS `transmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transmission` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identity',
  `name` varchar(100) NOT NULL COMMENT 'Name',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`),
  KEY `name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Transmission vehicle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transmission`
--

LOCK TABLES `transmission` WRITE;
/*!40000 ALTER TABLE `transmission` DISABLE KEYS */;
INSERT INTO `transmission` VALUES (1,'Manual','2021-03-21 21:24:24','2021-03-21 21:24:24'),(2,'Automatic','2021-03-21 21:24:24','2021-03-21 21:24:24'),(3,'CVT','2021-03-21 21:24:24','2021-03-21 21:24:24'),(4,'Semi-automatic','2021-03-21 21:24:24','2021-03-21 21:24:24');
/*!40000 ALTER TABLE `transmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_user`
--

DROP TABLE IF EXISTS `type_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_user`
--

LOCK TABLES `type_user` WRITE;
/*!40000 ALTER TABLE `type_user` DISABLE KEYS */;
INSERT INTO `type_user` VALUES (1,'Manager'),(2,'Client');
/*!40000 ALTER TABLE `type_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identity',
  `type_user_id` int unsigned NOT NULL,
  `first_name` varchar(100) NOT NULL COMMENT 'First name',
  `last_name` varchar(100) NOT NULL COMMENT 'Last name',
  `gender` char(1) NOT NULL COMMENT 'Gender',
  `birthday` date NOT NULL COMMENT 'Birthday',
  `address_id` int unsigned NOT NULL COMMENT 'Address of residence',
  `birthplace` varchar(130) NOT NULL COMMENT 'Birthplace',
  `province_birthplace` varchar(130) NOT NULL COMMENT 'Province of birthplace',
  `phone` varchar(100) NOT NULL COMMENT 'Phone',
  `email` varchar(100) NOT NULL COMMENT 'Email',
  `salary` float unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`),
  KEY `gender_birthday_idx` (`gender`,`birthday`),
  KEY `users_address_id_fk` (`address_id`),
  KEY `type_user_id_fk` (`type_user_id`),
  CONSTRAINT `type_user_id_fk` FOREIGN KEY (`type_user_id`) REFERENCES `type_user` (`id`),
  CONSTRAINT `users_address_id_fk` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Giorgio','Gallo','m','1978-09-11',4,'Latina','Latina','+393982546581','giorgiogallo@gmail.com',1500,'2021-03-21 18:49:53','2021-04-11 20:12:21'),(2,1,'Alessandro','Rossi','m','1982-03-24',5,'Latina','Latina','+393116479322','alessandrorossi@gmail.com',1500,'2021-03-21 18:49:53','2021-04-11 20:12:21'),(3,1,'Chiara','Romano','f','1985-06-28',6,'Latina','Latina','+393427458177','chiararomano@gmail.com',1500,'2021-03-21 18:49:53','2021-04-11 20:12:21'),(4,2,'Andrea','Lombardi','m','1991-02-16',7,'Roma','Roma','+393113249472','andrealombardi@gmail.com',0,'2021-03-21 19:02:10','2021-04-11 20:12:48'),(5,2,'Antonio','Greco','m','1995-06-11',8,'Latina','Latina','+393982647846','antoniogreco@gmail.com',0,'2021-03-21 19:02:10','2021-04-11 20:12:48'),(6,2,'Francesca','Conte','f','1989-03-23',9,'Frosinone','Frosinone','+393589856544','francescaconte@gmail.com',0,'2021-03-21 19:02:10','2021-04-11 20:12:48');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identity',
  `vehicle_type_id` int unsigned NOT NULL COMMENT 'Link to type vehicle',
  `model_id` int unsigned NOT NULL COMMENT 'Link to model vehicle',
  `body_vehicle_id` int unsigned NOT NULL COMMENT 'Link to body vehicle',
  `color_id` int unsigned NOT NULL COMMENT 'Link to color vehicle',
  `transmission_id` int unsigned DEFAULT NULL COMMENT 'Link to transmission',
  `engine_type_id` int unsigned NOT NULL COMMENT 'Link to engine type',
  `drivetrain_type_id` int unsigned NOT NULL COMMENT 'Link to drivetrain type',
  `engine_volume` int unsigned NOT NULL COMMENT 'Engine volume',
  `engine_capacity` int unsigned NOT NULL COMMENT 'Engine capacity',
  `engine_power` int unsigned NOT NULL COMMENT 'Engine power',
  `manufacture_year` year NOT NULL COMMENT 'Year of manufacture',
  `price` float unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`),
  KEY `price_idx` (`price`),
  KEY `body_vehicle_id_fk` (`body_vehicle_id`),
  KEY `color_vehicle_id_fk` (`color_id`),
  KEY `transmission_vehicle_id_fk` (`transmission_id`),
  KEY `engine_type_id_fk` (`engine_type_id`),
  KEY `drivetrain_type_id_fk` (`drivetrain_type_id`),
  KEY `vehicle_type_id_fk` (`vehicle_type_id`),
  KEY `vehicle_model_id_fk` (`model_id`),
  CONSTRAINT `body_vehicle_id_fk` FOREIGN KEY (`body_vehicle_id`) REFERENCES `body_vehicle` (`id`),
  CONSTRAINT `color_vehicle_id_fk` FOREIGN KEY (`color_id`) REFERENCES `color_vehicle` (`id`),
  CONSTRAINT `drivetrain_type_id_fk` FOREIGN KEY (`drivetrain_type_id`) REFERENCES `drivetrain_type` (`id`),
  CONSTRAINT `engine_type_id_fk` FOREIGN KEY (`engine_type_id`) REFERENCES `engine_type` (`id`),
  CONSTRAINT `transmission_vehicle_id_fk` FOREIGN KEY (`transmission_id`) REFERENCES `transmission` (`id`),
  CONSTRAINT `vehicle_model_id_fk` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`),
  CONSTRAINT `vehicle_type_id_fk` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Vehicle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1,1,10,5,10,1,4,3,2,175,20,2015,7000,'2021-03-22 20:47:39','2021-03-22 20:47:39'),(2,1,1,2,5,1,1,2,2,200,25,2018,10000,'2021-03-22 20:47:39','2021-03-22 20:47:39'),(3,1,2,3,3,2,3,2,2,255,30,2020,8000,'2021-03-22 20:47:39','2021-03-22 20:47:39');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_type`
--

DROP TABLE IF EXISTS `vehicle_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identity',
  `name` varchar(100) NOT NULL COMMENT 'Name',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Create time',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`),
  KEY `name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Type vehicle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_type`
--

LOCK TABLES `vehicle_type` WRITE;
/*!40000 ALTER TABLE `vehicle_type` DISABLE KEYS */;
INSERT INTO `vehicle_type` VALUES (1,'passenger car','2021-03-21 21:03:59','2021-03-21 21:03:59'),(2,'minibus','2021-03-21 21:03:59','2021-03-21 21:03:59'),(3,'moto','2021-03-21 21:03:59','2021-03-21 21:03:59'),(4,'scooter','2021-03-21 21:03:59','2021-03-21 21:03:59');
/*!40000 ALTER TABLE `vehicle_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `count_vehicle`
--

/*!50001 DROP VIEW IF EXISTS `count_vehicle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `count_vehicle` AS select `autopark`.`autosalon_id` AS `autosalon_id`,count(`autopark`.`vehicle_id`) AS `total_vehicle` from `autopark` group by `autopark`.`autosalon_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sold_by_manager`
--

/*!50001 DROP VIEW IF EXISTS `sold_by_manager`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sold_by_manager` AS select concat(`users`.`last_name`,' ',`users`.`first_name`) AS `managers_name`,sum(`vehicle`.`price`) AS `total_sold` from ((`users` join `orders` on((`users`.`id` = `orders`.`manager_id`))) left join `vehicle` on((`orders`.`vehicle_id` = `vehicle`.`id`))) group by `managers_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-12 20:33:01
