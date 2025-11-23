-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: minishop_db
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.20.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add customer',7,'add_customer'),(26,'Can change customer',7,'change_customer'),(27,'Can delete customer',7,'delete_customer'),(28,'Can view customer',7,'view_customer'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add product',9,'add_product'),(34,'Can change product',9,'change_product'),(35,'Can delete product',9,'delete_product'),(36,'Can view product',9,'view_product'),(37,'Can add wishlist',10,'add_wishlist'),(38,'Can change wishlist',10,'change_wishlist'),(39,'Can delete wishlist',10,'delete_wishlist'),(40,'Can view wishlist',10,'view_wishlist'),(41,'Can add payment',11,'add_payment'),(42,'Can change payment',11,'change_payment'),(43,'Can delete payment',11,'delete_payment'),(44,'Can view payment',11,'view_payment'),(45,'Can add order placed',12,'add_orderplaced'),(46,'Can change order placed',12,'change_orderplaced'),(47,'Can delete order placed',12,'delete_orderplaced'),(48,'Can view order placed',12,'view_orderplaced'),(49,'Can add cart',13,'add_cart'),(50,'Can change cart',13,'change_cart'),(51,'Can delete cart',13,'delete_cart'),(52,'Can view cart',13,'view_cart');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$Qf1tYMlhY0hkiEkXDan3qu$2kjcenmyrXcX9ScHb7tMp9jhQX1hoYvGeg3P2wo3Zxw=','2025-11-23 13:26:40.644339',1,'admin','','','admin@gmail.com',1,1,'2025-11-23 12:41:58.375867'),(2,'pbkdf2_sha256$600000$GufgTvad6Xkr61rIe0xLnU$14khLqpGu/t+lee8CJzmnG9P0TInb+pDpslomXvfbnI=',NULL,0,'user','','','',0,1,'2025-11-23 12:44:38.880758'),(3,'pbkdf2_sha256$600000$xZ7z8CgUoxA4RRi19EiMxp$m4ptNYMoz38UdbWZhXCiBkghrhYils1IFbnW+8Ed5r0=','2025-11-23 14:01:37.496286',0,'NguyenVanB','','','',0,1,'2025-11-23 13:20:58.303723');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-11-23 12:44:39.347388','2','user',1,'[{\"added\": {}}]',4,1),(2,'2025-11-23 12:44:47.189171','1','1',1,'[{\"added\": {}}]',7,1),(3,'2025-11-23 12:54:47.068921','1','Thực phẩm dinh dưỡng',1,'[{\"added\": {}}]',8,1),(4,'2025-11-23 12:55:03.302509','2','Thực phẩm chức năng',1,'[{\"added\": {}}]',8,1),(5,'2025-11-23 12:55:20.659142','3','Dưỡng da',1,'[{\"added\": {}}]',8,1),(6,'2025-11-23 12:55:48.206472','4','Chăm sóc tóc',1,'[{\"added\": {}}]',8,1),(7,'2025-11-23 12:57:29.932004','1','Sữa rửa mặt MONO',1,'[{\"added\": {}}]',9,1),(8,'2025-11-23 13:12:27.762854','5','Thuốc',1,'[{\"added\": {}}]',8,1),(9,'2025-11-23 13:13:23.669827','2','Mì tôm',1,'[{\"added\": {}}]',9,1),(10,'2025-11-23 13:26:51.233177','1','NguyenVanB - Sữa rửa mặt MONO - accepted',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',12,1),(11,'2025-11-23 13:48:52.577409','2','2',3,'',7,1),(12,'2025-11-23 13:48:58.567831','1','1',3,'',7,1),(13,'2025-11-23 13:53:25.385414','2','Mì tôm',2,'[{\"changed\": {\"fields\": [\"Product image\"]}}]',9,1),(14,'2025-11-23 13:53:36.471876','2','Mì tôm Omachi',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',9,1),(15,'2025-11-23 14:00:17.443627','3','Sữa tươi cô gái Hà Lan',1,'[{\"added\": {}}]',9,1),(16,'2025-11-23 14:02:56.801355','3','NguyenVanB - Sữa tươi cô gái Hà Lan - on_the_way',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',12,1),(17,'2025-11-23 14:03:05.364140','3','NguyenVanB - 285000.0',2,'[{\"changed\": {\"fields\": [\"Payment status\"]}}]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(13,'orders','cart'),(12,'orders','orderplaced'),(11,'orders','payment'),(8,'products','category'),(9,'products','product'),(10,'products','wishlist'),(6,'sessions','session'),(7,'users','customer');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-11-23 12:39:32.350377'),(2,'auth','0001_initial','2025-11-23 12:39:35.278453'),(3,'admin','0001_initial','2025-11-23 12:39:35.991098'),(4,'admin','0002_logentry_remove_auto_add','2025-11-23 12:39:36.045284'),(5,'admin','0003_logentry_add_action_flag_choices','2025-11-23 12:39:36.083969'),(6,'contenttypes','0002_remove_content_type_name','2025-11-23 12:39:36.573530'),(7,'auth','0002_alter_permission_name_max_length','2025-11-23 12:39:36.983039'),(8,'auth','0003_alter_user_email_max_length','2025-11-23 12:39:37.107947'),(9,'auth','0004_alter_user_username_opts','2025-11-23 12:39:37.154427'),(10,'auth','0005_alter_user_last_login_null','2025-11-23 12:39:37.519005'),(11,'auth','0006_require_contenttypes_0002','2025-11-23 12:39:37.533920'),(12,'auth','0007_alter_validators_add_error_messages','2025-11-23 12:39:37.594109'),(13,'auth','0008_alter_user_username_max_length','2025-11-23 12:39:37.899616'),(14,'auth','0009_alter_user_last_name_max_length','2025-11-23 12:39:38.208634'),(15,'auth','0010_alter_group_name_max_length','2025-11-23 12:39:38.276588'),(16,'auth','0011_update_proxy_permissions','2025-11-23 12:39:38.306126'),(17,'auth','0012_alter_user_first_name_max_length','2025-11-23 12:39:38.609598'),(18,'users','0001_initial','2025-11-23 12:39:38.981674'),(19,'products','0001_initial','2025-11-23 12:39:40.326854'),(20,'orders','0001_initial','2025-11-23 12:39:42.767274'),(21,'sessions','0001_initial','2025-11-23 12:39:43.038837'),(22,'users','0002_alter_customer_city_alter_customer_locality_and_more','2025-11-23 13:23:53.143624'),(23,'orders','0002_alter_orderplaced_status_and_more','2025-11-23 13:40:33.988678');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9ckoa7ru06ekjtpqrcar37zmt5zfiozi','.eJxVjEEOwiAQRe_C2hCgYAeX7j0DmRkGqZo2Ke3KeHfbpAvd_vf-e6uE61LT2mROQ1YXZdXpdyPkp4w7yA8c75PmaVzmgfSu6IM2fZuyvK6H-xeo2Or2FiOmc4WBY-9JrHFdPgewPZLfKs56ZCDjgDjmgo7Adz5IjBFKsAzq8wXqzzgA:1vNA6y:YyL0Ra0acwBwhRmy2ipeBy0VxM1dYVEClzSCrWDy1dk','2025-12-07 13:26:40.661186'),('tvmp5hczxqba1e9abhekxahz4e8fe6kh','.eJxVjDsOwjAQRO_iGllx_Kekzxms9a6NA8iW4qRC3J1ESgFTznszbxZgW0vYelrCTOzKJLv8dhHwmeoB6AH13ji2ui5z5IfCT9r51Ci9bqf7d1Cgl32NEJ3EPdmBkSabMUaVs8BonBVeWmu8BiJQGgmTHxSJATx41CK5EdnnCxmLOPk:1vNAen:P4Iwo5SJbczpO8TtQlpjeMOOJhii4SDPTkoak9fCVuA','2025-12-07 14:01:37.513647');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_cart`
--

DROP TABLE IF EXISTS `orders_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_cart_product_id_113fcfc9_fk_products_product_id` (`product_id`),
  KEY `orders_cart_user_id_121a069e_fk_auth_user_id` (`user_id`),
  CONSTRAINT `orders_cart_product_id_113fcfc9_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `orders_cart_user_id_121a069e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `orders_cart_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_cart`
--

LOCK TABLES `orders_cart` WRITE;
/*!40000 ALTER TABLE `orders_cart` DISABLE KEYS */;
INSERT INTO `orders_cart` VALUES (2,2,3,3),(3,2,2,3);
/*!40000 ALTER TABLE `orders_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orderplaced`
--

DROP TABLE IF EXISTS `orders_orderplaced`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_orderplaced` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `ordered_date` datetime(6) NOT NULL,
  `status` varchar(50) NOT NULL,
  `customer_id` bigint NOT NULL,
  `payment_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_orderplaced_customer_id_8b4b0e54_fk_users_customer_id` (`customer_id`),
  KEY `orders_orderplaced_payment_id_e3b64690_fk_orders_payment_id` (`payment_id`),
  KEY `orders_orderplaced_product_id_dd731c43_fk_products_product_id` (`product_id`),
  KEY `orders_orderplaced_user_id_04e6027e_fk_auth_user_id` (`user_id`),
  CONSTRAINT `orders_orderplaced_customer_id_8b4b0e54_fk_users_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `users_customer` (`id`),
  CONSTRAINT `orders_orderplaced_payment_id_e3b64690_fk_orders_payment_id` FOREIGN KEY (`payment_id`) REFERENCES `orders_payment` (`id`),
  CONSTRAINT `orders_orderplaced_product_id_dd731c43_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `orders_orderplaced_user_id_04e6027e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `orders_orderplaced_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orderplaced`
--

LOCK TABLES `orders_orderplaced` WRITE;
/*!40000 ALTER TABLE `orders_orderplaced` DISABLE KEYS */;
INSERT INTO `orders_orderplaced` VALUES (1,1,'2025-11-23 13:26:14.476932','accepted',3,1,1,3),(2,2,'2025-11-23 13:49:16.561217','pending',3,2,1,3),(3,1,'2025-11-23 14:02:36.365315','on_the_way',3,3,3,3);
/*!40000 ALTER TABLE `orders_orderplaced` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_payment`
--

DROP TABLE IF EXISTS `orders_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `payment_status` varchar(100) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_payment_user_id_cfa9f321_fk_auth_user_id` (`user_id`),
  CONSTRAINT `orders_payment_user_id_cfa9f321_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_payment`
--

LOCK TABLES `orders_payment` WRITE;
/*!40000 ALTER TABLE `orders_payment` DISABLE KEYS */;
INSERT INTO `orders_payment` VALUES (1,80000,0,'2025-11-23 13:26:14.461460','cod','pending',NULL,3),(2,160000,0,'2025-11-23 13:49:16.544009','cod','pending',NULL,3),(3,285000,0,'2025-11-23 14:02:36.349381','cod','success',NULL,3);
/*!40000 ALTER TABLE `orders_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_category`
--

DROP TABLE IF EXISTS `products_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `is_sub` tinyint(1) NOT NULL,
  `sub_category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `products_category_sub_category_id_91b24a41_fk_products_` (`sub_category_id`),
  CONSTRAINT `products_category_sub_category_id_91b24a41_fk_products_` FOREIGN KEY (`sub_category_id`) REFERENCES `products_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_category`
--

LOCK TABLES `products_category` WRITE;
/*!40000 ALTER TABLE `products_category` DISABLE KEYS */;
INSERT INTO `products_category` VALUES (1,'Thực phẩm dinh dưỡng','thuc-pham-dinh-duong',0,NULL),(2,'Thực phẩm chức năng','thuc-pham-chuc-nang',0,NULL),(3,'Dưỡng da','duonh-da',1,2),(4,'Chăm sóc tóc','cham-soc-toc',1,2),(5,'Thuốc','thuoc',0,NULL);
/*!40000 ALTER TABLE `products_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_product`
--

DROP TABLE IF EXISTS `products_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `selling_price` double NOT NULL,
  `discounted_price` double NOT NULL,
  `description` longtext NOT NULL,
  `composition` longtext NOT NULL,
  `prodapp` longtext NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_category_id_9b594869_fk_products_category_id` (`category_id`),
  CONSTRAINT `products_product_category_id_9b594869_fk_products_category_id` FOREIGN KEY (`category_id`) REFERENCES `products_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product`
--

LOCK TABLES `products_product` WRITE;
/*!40000 ALTER TABLE `products_product` DISABLE KEYS */;
INSERT INTO `products_product` VALUES (1,'Sữa rửa mặt MONO',100000,80000,'Sữa rửa mặt MONO','Sữa rửa mặt MONO','Sữa rửa mặt MONO','product/sua-rua-mat-la-roche-posay-effaclar-purifying-foaming-gel-cleanser-400ml.jpg',3),(2,'Mì tôm Omachi',85000,65000,'Mì tôm','Mì tôm','Mì tôm','product/mitom.jpeg',2),(3,'Sữa tươi cô gái Hà Lan',300000,285000,'Sữa Tiệt Trùng Cô Gái Hà Lan Dutch Lady 220ml (CTKM: Mua 1T giảm 2k/ 1 gói, có thể mix)','Sữa Tiệt Trùng Cô Gái Hà Lan Dutch Lady 220ml (CTKM: Mua 1T giảm 2k/ 1 gói, có thể mix)','Sữa Tiệt Trùng Cô Gái Hà Lan Dutch Lady 220ml (CTKM: Mua 1T giảm 2k/ 1 gói, có thể mix)','product/-1-goi-co-the-mix.jpg',1);
/*!40000 ALTER TABLE `products_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_wishlist`
--

DROP TABLE IF EXISTS `products_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_wishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_wishlist_product_id_7c798228_fk_products_product_id` (`product_id`),
  KEY `products_wishlist_user_id_eea5692f_fk_auth_user_id` (`user_id`),
  CONSTRAINT `products_wishlist_product_id_7c798228_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `products_wishlist_user_id_eea5692f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_wishlist`
--

LOCK TABLES `products_wishlist` WRITE;
/*!40000 ALTER TABLE `products_wishlist` DISABLE KEYS */;
INSERT INTO `products_wishlist` VALUES (1,1,1),(2,1,3);
/*!40000 ALTER TABLE `products_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customer`
--

DROP TABLE IF EXISTS `users_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `locality` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `zipcode` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_customer_user_id_a09bb4be_fk_auth_user_id` (`user_id`),
  CONSTRAINT `users_customer_user_id_a09bb4be_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customer`
--

LOCK TABLES `users_customer` WRITE;
/*!40000 ALTER TABLE `users_customer` DISABLE KEYS */;
INSERT INTO `users_customer` VALUES (3,'Nguyen Van B','So 8 Tran Thai Tong','Hà Nội','0981248222',100000,3);
/*!40000 ALTER TABLE `users_customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-23 21:06:17
