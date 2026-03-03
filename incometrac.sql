-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: incometrac
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `budget`
--

DROP TABLE IF EXISTS `budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budget` (
  `budget_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `monthly_income` decimal(10,2) DEFAULT NULL,
  `monthly_savings` decimal(10,2) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`budget_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `budget_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget`
--

LOCK TABLES `budget` WRITE;
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
INSERT INTO `budget` VALUES (23,13,'2024-08-01','2024-08-31',100.00,NULL,'AUGUST BUDGET'),(24,8,'2024-08-01','2024-08-31',10.00,NULL,'qaa'),(25,8,'2024-08-01','2024-08-31',50.00,NULL,'au bud'),(26,8,'2024-08-01','2024-08-31',1000.00,NULL,'');
/*!40000 ALTER TABLE `budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `expense_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `date_spent` date DEFAULT NULL,
  PRIMARY KEY (`expense_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (45,13,10.00,'Groceries','2024-08-14'),(46,13,10.00,'Entertainment','2024-08-09'),(48,8,10.00,'Groceries','2024-08-16'),(49,8,100.00,'Utilities','2024-08-01'),(50,8,50.00,'Groceries','2024-08-06'),(51,8,100.00,'Dining Out','2024-08-08'),(52,8,5000.00,'Utilities','2024-08-14');
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income` (
  `income_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  `date_received` date DEFAULT NULL,
  PRIMARY KEY (`income_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `income_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income`
--

LOCK TABLES `income` WRITE;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
INSERT INTO `income` VALUES (23,13,400.00,'SALARY','2024-08-14'),(24,8,3940.00,'SALARY','2024-08-05'),(25,8,3950.00,'SALARY','2024-08-05'),(26,8,-900.00,'SALARY','2024-08-16'),(27,8,4000.00,'SALARY','2024-08-01');
/*!40000 ALTER TABLE `income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `recipient_id` int NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('sent','received','read') DEFAULT 'sent',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`),
  KEY `recipient_id` (`recipient_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (12,4,1,'me','memememem','2024-07-31 16:20:57','sent'),(13,4,5,'me','memememem','2024-07-31 16:21:50','sent'),(14,5,4,'oaky','roger','2024-07-31 16:29:22','sent'),(15,4,6,'budget','help','2024-07-31 21:49:50','sent'),(16,6,6,'okay','working on it','2024-08-01 10:17:30','sent'),(17,4,6,'budget','check my busget','2024-08-01 10:45:03','sent'),(18,6,6,'workin','working on it','2024-08-01 10:46:18','sent'),(19,6,6,'wha','wahd','2024-08-02 10:29:33','sent'),(20,6,6,'afwff','afvkfv','2024-08-02 11:44:05','sent'),(21,8,6,'budget','check my budget and adjust','2024-08-07 18:59:16','sent'),(22,8,6,'budget','edit','2024-08-07 19:08:10','sent'),(23,8,6,'samy@yahoo.com','Adjust Budet','2024-08-15 13:28:41','sent');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_activity_logs`
--

DROP TABLE IF EXISTS `user_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_activity_logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `details` text,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_activity_logs`
--

LOCK TABLES `user_activity_logs` WRITE;
/*!40000 ALTER TABLE `user_activity_logs` DISABLE KEYS */;
INSERT INTO `user_activity_logs` VALUES (1,4,'User Login','2024-07-30 17:42:14','User logged in successfully.'),(2,4,'User Login','2024-07-31 16:06:56','User logged in successfully.'),(3,4,'User Login','2024-07-31 16:09:19','User logged in successfully.'),(4,4,'User Login','2024-07-31 16:14:59','User logged in successfully.'),(5,4,'User Login','2024-07-31 16:18:39','User logged in successfully.'),(6,4,'User Login','2024-07-31 16:23:57','User logged in successfully.'),(7,4,'User Login','2024-07-31 16:34:47','User logged in successfully.'),(8,4,'User save Income','2024-07-31 16:35:27','Income saved successfully.'),(9,4,'User Login','2024-07-31 16:41:37','User logged in successfully.'),(10,4,'User Login','2024-07-31 16:44:19','User logged in successfully.'),(11,4,'User Login','2024-07-31 16:50:25','User logged in successfully.'),(12,4,'User save Expense','2024-07-31 16:50:49','Expense saved successfully.'),(13,4,'User Login','2024-07-31 16:58:58','User logged in successfully.'),(14,4,'User Login','2024-07-31 18:20:31','User logged in successfully.'),(15,5,'User Login','2024-07-31 18:22:30','User logged in successfully.'),(16,5,'User Login','2024-07-31 18:28:45','User logged in successfully.'),(17,4,'User Login','2024-07-31 23:43:58','User logged in successfully.'),(18,4,'User Login','2024-07-31 23:49:38','User logged in successfully.'),(19,6,'User Login','2024-07-31 23:51:04','User logged in successfully.'),(20,6,'User Login','2024-08-01 10:42:02','User logged in successfully.'),(21,6,'User Login','2024-08-01 10:51:52','User logged in successfully.'),(22,6,'User Login','2024-08-01 10:58:43','User logged in successfully.'),(23,4,'User Login','2024-08-01 11:30:15','User logged in successfully.'),(24,6,'User Login','2024-08-01 11:42:51','User logged in successfully.'),(25,6,'User Login','2024-08-01 12:16:58','User logged in successfully.'),(26,5,'User Login','2024-08-01 12:18:07','User logged in successfully.'),(27,4,'User Login','2024-08-01 12:18:37','User logged in successfully.'),(28,4,'User Login','2024-08-01 12:44:34','User logged in successfully.'),(29,6,'User Login','2024-08-01 12:45:47','User logged in successfully.'),(30,4,'User Login','2024-08-01 12:46:43','User logged in successfully.'),(31,4,'User Login','2024-08-02 09:18:32','User logged in successfully.'),(32,4,'User Login','2024-08-02 10:29:58','User logged in successfully.'),(33,4,'User Login','2024-08-02 10:34:42','User logged in successfully.'),(34,4,'User Login','2024-08-02 10:45:00','User logged in successfully.'),(35,4,'User Login','2024-08-02 11:05:44','User logged in successfully.'),(36,4,'Transactions','2024-08-02 11:08:30','Payment made successfully.'),(37,4,'Transactions','2024-08-02 11:08:39','Payment made successfully.'),(38,4,'User Login','2024-08-02 11:15:01','User logged in successfully.'),(39,7,'User Login','2024-08-02 12:11:42','User logged in successfully.'),(40,7,'User save Income','2024-08-02 12:13:23','Income saved successfully.'),(41,7,'User save Expense','2024-08-02 12:15:13','Expense saved successfully.'),(42,7,'User save Expense','2024-08-02 12:15:29','Expense saved successfully.'),(43,7,'User saves Budget','2024-08-02 12:18:00','Budget saved successfully.'),(44,7,'Transactions','2024-08-02 12:23:24','Payment made successfully.'),(45,6,'User Login','2024-08-02 12:29:10','User logged in successfully.'),(46,8,'User Login','2024-08-02 12:41:02','User logged in successfully.'),(47,8,'User save Income','2024-08-02 12:43:52','Income saved successfully.'),(48,8,'User save Expense','2024-08-02 12:44:29','Expense saved successfully.'),(49,8,'User save Expense','2024-08-02 12:44:43','Expense saved successfully.'),(50,8,'User saves Budget','2024-08-02 12:49:43','Budget saved successfully.'),(51,9,'User Login','2024-08-02 13:05:10','User logged in successfully.'),(52,9,'User save Income','2024-08-02 13:22:18','Income saved successfully.'),(53,9,'User save Income','2024-08-02 13:23:47','Income saved successfully.'),(54,9,'User save Income','2024-08-02 13:26:41','Income saved successfully.'),(55,9,'User save Expense','2024-08-02 13:28:01','Expense saved successfully.'),(56,9,'User save Expense','2024-08-02 13:29:04','Expense saved successfully.'),(57,9,'User save Expense','2024-08-02 13:30:30','Expense saved successfully.'),(58,9,'User saves Budget','2024-08-02 13:34:59','Budget saved successfully.'),(59,9,'Transactions','2024-08-02 13:41:22','Payment made successfully.'),(60,6,'User Login','2024-08-02 13:42:37','User logged in successfully.'),(61,4,'User Login','2024-08-07 17:16:19','User logged in successfully.'),(62,8,'User Login','2024-08-07 17:53:27','User logged in successfully.'),(63,8,'User Login','2024-08-07 18:08:29','User logged in successfully.'),(64,8,'User Login','2024-08-07 18:13:02','User logged in successfully.'),(65,8,'User Login','2024-08-07 18:17:16','User logged in successfully.'),(66,8,'User saves Budget','2024-08-07 18:17:38','Budget saved successfully.'),(67,8,'User Login','2024-08-07 18:32:03','User logged in successfully.'),(68,8,'User Login','2024-08-07 18:34:41','User logged in successfully.'),(69,8,'User Login','2024-08-07 18:36:44','User logged in successfully.'),(70,8,'Transactions','2024-08-07 18:37:27','Payment made successfully.'),(71,8,'User Login','2024-08-07 18:45:30','User logged in successfully.'),(72,8,'User Login','2024-08-07 18:47:29','User logged in successfully.'),(73,8,'User save Income','2024-08-07 18:47:41','Income saved successfully.'),(74,8,'User saves Budget','2024-08-07 18:49:31','Budget saved successfully.'),(75,8,'User Login','2024-08-07 19:38:28','User logged in successfully.'),(76,8,'User saves Expense','2024-08-07 19:38:46','Expense saved successfully.'),(77,8,'User Login','2024-08-07 20:09:52','User logged in successfully.'),(78,8,'User Login','2024-08-07 20:11:55','User logged in successfully.'),(79,8,'User Login','2024-08-07 20:14:23','User logged in successfully.'),(80,8,'User Login','2024-08-07 20:58:52','User logged in successfully.'),(81,6,'User Login','2024-08-07 21:00:06','User logged in successfully.'),(82,6,'User Login','2024-08-07 21:06:34','User logged in successfully.'),(83,8,'User Login','2024-08-07 21:07:57','User logged in successfully.'),(84,6,'User Login','2024-08-07 21:08:38','User logged in successfully.'),(85,6,'User Login','2024-08-07 21:31:22','User logged in successfully.'),(86,6,'User Login','2024-08-07 21:32:59','User logged in successfully.'),(87,8,'User Login','2024-08-09 13:15:51','User logged in successfully.'),(88,8,'User Login','2024-08-09 13:27:03','User logged in successfully.'),(89,8,'User saves Budget','2024-08-09 13:30:26','Budget saved successfully.'),(90,6,'User Login','2024-08-09 13:34:30','User logged in successfully.'),(91,6,'User Login','2024-08-09 13:35:32','User logged in successfully.'),(92,10,'User Login','2024-08-09 13:49:45','User logged in successfully.'),(93,10,'User save Income','2024-08-09 13:50:51','Income saved successfully.'),(94,10,'User saves Budget','2024-08-09 13:53:51','Budget saved successfully.'),(95,10,'User saves Expense','2024-08-09 13:55:00','Expense saved successfully.'),(96,10,'User saves Expense','2024-08-09 13:55:19','Expense saved successfully.'),(97,8,'User Login','2024-08-09 14:06:52','User logged in successfully.'),(98,8,'User save Income','2024-08-09 14:07:38','Income saved successfully.'),(99,8,'User saves Budget','2024-08-09 14:09:00','Budget saved successfully.'),(100,8,'User saves Expense','2024-08-09 14:09:56','Expense saved successfully.'),(101,8,'User saves Expense','2024-08-09 14:10:11','Expense saved successfully.'),(102,8,'Transactions','2024-08-09 14:14:05','Payment made successfully.'),(103,11,'User Login','2024-08-10 21:11:15','User logged in successfully.'),(104,11,'User save Income','2024-08-10 21:11:41','Income saved successfully.'),(105,11,'User saves Budget','2024-08-10 21:12:56','Budget saved successfully.'),(106,11,'User Login','2024-08-10 21:43:54','User logged in successfully.'),(107,11,'User saves Budget','2024-08-10 21:45:23','Budget saved successfully.'),(108,8,'User Login','2024-08-12 07:47:11','User logged in successfully.'),(109,12,'User Login','2024-08-12 11:22:11','User logged in successfully.'),(110,12,'User save Income','2024-08-12 11:22:41','Income saved successfully.'),(111,12,'User saves Budget','2024-08-12 11:24:40','Budget saved successfully.'),(112,12,'User saves Expense','2024-08-12 11:25:59','Expense saved successfully.'),(113,12,'User saves Expense','2024-08-12 11:26:16','Expense saved successfully.'),(114,12,'User Login','2024-08-12 12:03:17','User logged in successfully.'),(115,12,'User save Income','2024-08-12 12:04:11','Income saved successfully.'),(116,12,'User saves Budget','2024-08-12 12:05:48','Budget saved successfully.'),(117,12,'User saves Budget','2024-08-12 12:06:51','Budget saved successfully.'),(118,12,'User saves Budget','2024-08-12 12:07:56','Budget saved successfully.'),(119,12,'User save Income','2024-08-12 12:10:10','Income saved successfully.'),(120,12,'User saves Budget','2024-08-12 12:10:29','Budget saved successfully.'),(121,12,'User saves Expense','2024-08-12 12:12:16','Expense saved successfully.'),(122,12,'User saves Expense','2024-08-12 12:12:44','Expense saved successfully.'),(123,6,'User Login','2024-08-12 12:22:45','User logged in successfully.'),(124,8,'User Login','2024-08-13 23:04:42','User logged in successfully.'),(125,8,'User save Income','2024-08-13 23:05:15','Income saved successfully.'),(126,8,'User saves Budget','2024-08-13 23:05:50','Budget saved successfully.'),(127,6,'User Login','2024-08-14 02:22:58','User logged in successfully.'),(128,8,'User Login','2024-08-14 14:39:03','User logged in successfully.'),(129,8,'User saves Budget','2024-08-14 14:41:53','Budget saved successfully.'),(130,8,'User Login','2024-08-14 14:59:40','User logged in successfully.'),(131,8,'User saves Expense','2024-08-14 15:03:31','Expense saved successfully.'),(132,8,'User saves Expense','2024-08-14 15:04:31','Expense saved successfully.'),(133,8,'User save Income','2024-08-14 15:05:35','Income saved successfully.'),(134,8,'User saves Budget','2024-08-14 15:06:29','Budget saved successfully.'),(135,13,'User Login','2024-08-14 15:11:27','User logged in successfully.'),(136,13,'User save Income','2024-08-14 15:11:40','Income saved successfully.'),(137,13,'User saves Budget','2024-08-14 15:12:30','Budget saved successfully.'),(138,13,'User saves Expense','2024-08-14 15:13:19','Expense saved successfully.'),(139,13,'User saves Expense','2024-08-14 15:13:30','Expense saved successfully.'),(140,13,'User Login','2024-08-14 18:13:06','User logged in successfully.'),(141,13,'User Login','2024-08-14 18:15:19','User logged in successfully.'),(142,13,'User Login','2024-08-14 18:25:46','User logged in successfully.'),(143,13,'User Login','2024-08-14 18:35:12','User logged in successfully.'),(144,13,'User Login','2024-08-14 18:41:04','User logged in successfully.'),(145,13,'User Login','2024-08-14 18:56:07','User logged in successfully.'),(146,13,'User Login','2024-08-14 19:15:57','User logged in successfully.'),(147,13,'User Login','2024-08-14 19:23:37','User logged in successfully.'),(148,13,'User Login','2024-08-14 19:27:19','User logged in successfully.'),(149,13,'User Login','2024-08-14 19:34:50','User logged in successfully.'),(150,13,'User Login','2024-08-14 23:20:29','User logged in successfully.'),(151,13,'User Login','2024-08-15 09:18:54','User logged in successfully.'),(152,8,'User Login','2024-08-15 15:21:37','User logged in successfully.'),(153,8,'User save Income','2024-08-15 15:22:53','Income saved successfully.'),(154,8,'User saves Expense','2024-08-15 15:24:18','Expense saved successfully.'),(155,8,'User saves Budget','2024-08-15 15:25:36','Budget saved successfully.'),(156,8,'Transactions','2024-08-15 15:27:47','Payment made successfully.'),(157,14,'User Login','2024-08-15 15:34:08','User logged in successfully.'),(158,6,'User Login','2024-08-15 15:36:20','User logged in successfully.'),(159,6,'User Login','2024-08-15 15:37:17','User logged in successfully.'),(160,8,'User Login','2024-08-15 15:39:01','User logged in successfully.'),(161,8,'User Login','2024-08-15 15:41:14','User logged in successfully.'),(162,8,'User save Income','2024-08-15 15:41:52','Income saved successfully.'),(163,8,'User saves Expense','2024-08-15 15:42:32','Expense saved successfully.'),(164,8,'User saves Budget','2024-08-15 15:43:28','Budget saved successfully.'),(165,6,'User Login','2024-08-15 15:45:07','User logged in successfully.'),(166,6,'User Login','2024-08-15 16:03:33','User logged in successfully.'),(167,8,'User Login','2024-08-16 09:16:01','User logged in successfully.'),(168,8,'User Login','2024-08-16 09:19:26','User logged in successfully.'),(169,8,'User Login','2024-08-16 09:23:23','User logged in successfully.'),(170,8,'User Login','2024-08-16 09:30:57','User logged in successfully.'),(171,8,'User Login','2024-08-16 09:45:51','User logged in successfully.'),(172,8,'User Login','2024-08-16 12:50:47','User logged in successfully.'),(173,8,'User save Income','2024-08-16 12:51:17','Income saved successfully.'),(174,8,'User Login','2024-08-16 12:55:20','User logged in successfully.'),(175,8,'User saves Expense','2024-08-16 12:55:53','Expense saved successfully.'),(176,8,'User Login','2024-08-16 12:57:40','User logged in successfully.'),(177,8,'User Login','2024-08-16 12:58:43','User logged in successfully.'),(178,8,'User Login','2024-08-16 14:23:51','User logged in successfully.'),(179,8,'User save Income','2024-08-16 14:24:59','Income saved successfully.'),(180,8,'User saves Budget','2024-08-16 14:30:17','Budget saved successfully.'),(181,8,'User saves Expense','2024-08-16 14:30:52','Expense saved successfully.'),(182,8,'User saves Expense','2024-08-16 14:31:08','Expense saved successfully.'),(183,8,'User saves Expense','2024-08-16 14:32:12','Expense saved successfully.'),(184,8,'User Login','2024-09-05 17:26:48','User logged in successfully.');
/*!40000 ALTER TABLE `user_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'','kofi','233','s@yahoo.com','MALE','sabnkk',0,NULL),(4,'','kofi','233','s@yahoo.com','MALE','sabnkk',0,NULL),(5,'','kofi','233','s@yahoo.com','MALE','sabnkk',0,NULL),(6,'sammy','password123','admin@eyahoo.com','Samuel A','M','1234567890',1,'admin'),(7,'Eric','0000','eric@yahoo.com','Mr Eric','MALE ','0900090909',0,NULL),(8,'sammy','1234','samy@yahoo.com','sammy yaw','MALE ','0202220202',0,NULL),(9,'16','sammy','123456','ge2@gmail.com','MALE','sammy',0,NULL),(10,'sammy','1234','my@yahoo.com','samuel yeboah','MALE ','0235322444',0,NULL),(11,'sammy','1234','gab@yahoo.com','samuel yeboah','MALE ','0235322444',0,NULL),(12,'16','','','','MALE','',0,NULL),(13,'Paa Yaw','0000','py@yahoo.com','Pius Yaw','MALE ','0909989098',0,NULL),(14,'sammy','0000','admin@yahoo.com','Sammy Yeboah','Male','1234567890',1,'Admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-22  0:18:25
