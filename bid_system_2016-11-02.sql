# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.01 (MySQL 5.7.15)
# Database: bid_system
# Generation Time: 2016-11-02 11:34:39 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table bid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bid`;

CREATE TABLE `bid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `is_recent` tinyint(1) NOT NULL,
  `bid_amount` int(11) NOT NULL,
  `bid_won` tinyint(1) DEFAULT NULL,
  `bid_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;

INSERT INTO `bid` (`id`, `user_id`, `item_id`, `is_recent`, `bid_amount`, `bid_won`, `bid_time`)
VALUES
	(85,5,70,0,6900,0,'2016-11-01 16:09:31'),
	(86,1,4,0,45000,0,'2016-11-02 11:35:39'),
	(87,5,1,0,5100,0,'2016-11-01 19:23:15'),
	(88,6,4,0,48000,0,'2016-11-01 19:35:36'),
	(89,6,5,0,6600,0,'2016-11-02 13:30:10'),
	(91,1,5,0,6758,0,'2016-11-02 11:36:07'),
	(92,6,70,0,7000,0,'2016-11-01 16:01:00'),
	(93,1,4,0,40000,0,'2016-11-02 11:41:45'),
	(96,1,36,0,7600,0,'2016-11-02 13:16:35'),
	(98,1,4,0,45000,0,'2016-11-02 15:52:49');

/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`id`, `category`)
VALUES
	(1,'Electronics'),
	(2,'Vechiles'),
	(3,'Home Appliances'),
	(4,'Others');

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `initial_price` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `bid_type` tinyint(1) DEFAULT NULL,
  `min_balance` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;

INSERT INTO `item` (`id`, `item`, `description`, `image_url`, `initial_price`, `start_time`, `end_time`, `category_id`, `owner_id`, `bid_type`, `min_balance`)
VALUES
	(1,'Samsung J5 Mobile','2015 purchased',NULL,5000,NULL,'2016-11-25 18:37:00',1,1,NULL,NULL),
	(4,'Splender Bike','2014 purchased',NULL,40000,NULL,'2016-11-03 13:00:00',2,5,NULL,NULL),
	(5,'Fridge','2013 purchased',NULL,6000,NULL,'2016-11-04 14:30:00',1,2,NULL,NULL),
	(6,'Pulsar 150 cc','2009 purchased',NULL,20000,NULL,'2016-11-01 14:30:00',2,5,NULL,NULL),
	(31,'Laptop','Dell Inspiron',NULL,14500,NULL,'2016-11-27 03:03:00',1,2,NULL,NULL),
	(36,'Voltas AC','2 years old',NULL,7000,NULL,'2016-11-27 13:00:00',1,2,NULL,NULL),
	(64,'Maruti Swift','2014 model',NULL,400000,NULL,'2016-11-26 17:39:00',2,5,NULL,NULL),
	(70,'Sofa','3+2 Seater',NULL,6000,NULL,'2016-11-01 17:39:00',3,3,NULL,NULL),
	(84,'Chair','Wooden material',NULL,350,NULL,'2016-11-02 23:59:00',3,1,NULL,NULL);

/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `name`, `email`, `contact_no`)
VALUES
	(1,'om','nirankariom@gmail.com','9826471322'),
	(2,'rahul','rahulpat@gmail.com','9826473281'),
	(3,'prerna','prerna@gmail.com','9875647210'),
	(4,'ritesh','rit@gmail.com','9875647211'),
	(5,'Om Prakash Nirankari','omprakash@practo.com','9826471322'),
	(6,'Anoop Singh Rawat','anoop.singh@practo.com',NULL);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wallet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wallet`;

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `balance` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;

INSERT INTO `wallet` (`id`, `user_id`, `balance`)
VALUES
	(1,1,500),
	(2,1,500),
	(3,1,500);

/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
