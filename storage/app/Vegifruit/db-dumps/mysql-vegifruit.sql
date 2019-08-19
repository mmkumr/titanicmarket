
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,1,'Category 1','category-1','2019-07-17 06:04:45','2019-07-17 06:04:45'),(2,NULL,1,'Category 2','category-2','2019-07-17 06:04:46','2019-07-17 06:04:46');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name_unique` (`name`),
  UNIQUE KEY `category_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Vegetables','vegetables','2019-07-17 06:04:23','2019-07-28 10:30:23'),(2,'Fruits','fruits','2019-07-17 06:04:23','2019-07-17 06:04:23'),(3,'Dry Fruits','dry-fruits','2019-07-17 06:04:23','2019-07-17 06:04:23'),(4,'Taste of Berhampur','namkeens','2019-07-17 06:04:23','2019-08-03 04:28:40'),(5,'Bakery','bakery','2019-07-17 06:24:44','2019-07-17 06:24:44'),(6,'Flowers','flowers','2019-07-17 06:24:58','2019-07-17 06:24:58');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_product_product_id_foreign` (`product_id`),
  KEY `category_product_category_id_foreign` (`category_id`),
  CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `category_product` WRITE;
/*!40000 ALTER TABLE `category_product` DISABLE KEYS */;
INSERT INTO `category_product` VALUES (4,3,6,'2019-08-04 03:16:44','2019-08-04 03:16:44'),(6,4,6,'2019-08-05 14:35:21','2019-08-05 14:35:21'),(8,6,6,'2019-08-05 15:06:16','2019-08-05 15:06:16'),(14,10,6,'2019-08-09 13:23:46','2019-08-09 13:23:46'),(19,11,6,'2019-08-09 13:41:29','2019-08-09 13:41:29'),(43,33,2,'2019-08-16 12:34:10','2019-08-16 12:34:10'),(48,34,2,'2019-08-16 13:06:01','2019-08-16 13:06:01'),(53,37,2,'2019-08-18 02:40:26','2019-08-18 02:40:26'),(54,38,2,'2019-08-18 02:50:32','2019-08-18 02:50:32'),(55,39,2,'2019-08-18 02:57:07','2019-08-18 02:57:07'),(56,40,2,'2019-08-18 03:03:45','2019-08-18 03:03:45'),(57,41,2,'2019-08-18 03:17:49','2019-08-18 03:17:49'),(58,42,2,'2019-08-18 03:30:35','2019-08-18 03:30:35'),(59,43,2,'2019-08-18 03:43:07','2019-08-18 03:43:07'),(61,45,2,'2019-08-18 04:56:43','2019-08-18 04:56:43'),(62,46,2,'2019-08-18 05:10:21','2019-08-18 05:10:21'),(65,50,2,'2019-08-18 12:17:32','2019-08-18 12:17:32'),(66,51,2,'2019-08-18 12:31:00','2019-08-18 12:31:00'),(69,52,2,'2019-08-18 21:29:37','2019-08-18 21:29:37'),(70,44,2,'2019-08-18 21:29:56','2019-08-18 21:29:56'),(71,36,2,'2019-08-18 21:30:21','2019-08-18 21:30:21'),(72,35,2,'2019-08-18 21:30:45','2019-08-18 21:30:45'),(73,47,2,'2019-08-18 21:31:01','2019-08-18 21:31:01'),(74,13,6,'2019-08-18 21:31:40','2019-08-18 21:31:40'),(75,9,6,'2019-08-18 21:32:03','2019-08-18 21:32:03'),(76,1,6,'2019-08-18 21:32:35','2019-08-18 21:32:35');
/*!40000 ALTER TABLE `category_product` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) DEFAULT NULL,
  `percent_off` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (1,'ABC123','fixed',3000,NULL,'2019-07-17 06:04:36','2019-07-17 06:04:36'),(2,'DEF456','percent',NULL,50,'2019-07-17 06:04:36','2019-07-17 06:04:36');
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,'\"\"',1),(2,1,'author_id','text','Author',1,0,1,1,0,1,'\"\"',2),(3,1,'category_id','text','Category',1,0,1,1,1,0,'\"\"',3),(4,1,'title','text','Title',1,1,1,1,1,1,'\"\"',4),(5,1,'excerpt','text_area','excerpt',1,0,1,1,1,1,'\"\"',5),(6,1,'body','rich_text_box','Body',1,0,1,1,1,1,'\"\"',6),(7,1,'image','image','Post Image',0,1,1,1,1,1,'\"{\\\"resize\\\":{\\\"width\\\":\\\"1000\\\",\\\"height\\\":\\\"null\\\"},\\\"quality\\\":\\\"70%\\\",\\\"upsize\\\":true,\\\"thumbnails\\\":[{\\\"name\\\":\\\"medium\\\",\\\"scale\\\":\\\"50%\\\"},{\\\"name\\\":\\\"small\\\",\\\"scale\\\":\\\"25%\\\"},{\\\"name\\\":\\\"cropped\\\",\\\"crop\\\":{\\\"width\\\":\\\"300\\\",\\\"height\\\":\\\"250\\\"}}]}\"',7),(8,1,'slug','text','slug',1,0,1,1,1,1,'\"{\\\"slugify\\\":{\\\"origin\\\":\\\"title\\\",\\\"forceUpdate\\\":true}}\"',8),(9,1,'meta_description','text_area','meta_description',1,0,1,1,1,1,'\"\"',9),(10,1,'meta_keywords','text_area','meta_keywords',1,0,1,1,1,1,'\"\"',10),(11,1,'status','select_dropdown','status',1,1,1,1,1,1,'\"{\\\"default\\\":\\\"DRAFT\\\",\\\"options\\\":{\\\"PUBLISHED\\\":\\\"published\\\",\\\"DRAFT\\\":\\\"draft\\\",\\\"PENDING\\\":\\\"pending\\\"}}\"',11),(12,1,'created_at','timestamp','created_at',0,1,1,0,0,0,'\"\"',12),(13,1,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'\"\"',13),(14,2,'id','number','id',1,0,0,0,0,0,'\"\"',1),(15,2,'author_id','text','author_id',1,0,0,0,0,0,'\"\"',2),(16,2,'title','text','title',1,1,1,1,1,1,'\"\"',3),(17,2,'excerpt','text_area','excerpt',1,0,1,1,1,1,'\"\"',4),(18,2,'body','rich_text_box','body',1,0,1,1,1,1,'\"\"',5),(19,2,'slug','text','slug',1,0,1,1,1,1,'\"{\\\"slugify\\\":{\\\"origin\\\":\\\"title\\\"}}\"',6),(20,2,'meta_description','text','meta_description',1,0,1,1,1,1,'\"\"',7),(21,2,'meta_keywords','text','meta_keywords',1,0,1,1,1,1,'\"\"',8),(22,2,'status','select_dropdown','status',1,1,1,1,1,1,'\"{\\\"default\\\":\\\"INACTIVE\\\",\\\"options\\\":{\\\"INACTIVE\\\":\\\"INACTIVE\\\",\\\"ACTIVE\\\":\\\"ACTIVE\\\"}}\"',9),(23,2,'created_at','timestamp','created_at',1,1,1,0,0,0,'\"\"',10),(24,2,'updated_at','timestamp','updated_at',1,0,0,0,0,0,'\"\"',11),(25,2,'image','image','image',0,1,1,1,1,1,'\"\"',12),(26,3,'id','number','id',1,0,0,0,0,0,'\"\"',1),(27,3,'name','text','name',1,1,1,1,1,1,'\"\"',2),(28,3,'email','text','email',1,1,1,1,1,1,'\"\"',3),(29,3,'password','password','password',1,0,0,1,1,0,'\"\"',4),(30,3,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}',10),(31,3,'remember_token','text','remember_token',0,0,0,0,0,0,'\"\"',5),(32,3,'created_at','timestamp','created_at',0,1,1,0,0,0,'\"\"',6),(33,3,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'\"\"',7),(34,3,'avatar','image','avatar',0,1,1,1,1,1,'\"\"',8),(35,5,'id','number','id',1,0,0,0,0,0,'\"\"',1),(36,5,'name','text','name',1,1,1,1,1,1,'\"\"',2),(37,5,'created_at','timestamp','created_at',0,0,0,0,0,0,'\"\"',3),(38,5,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'\"\"',4),(39,4,'id','number','id',1,0,0,0,0,0,'\"\"',1),(40,4,'parent_id','select_dropdown','parent_id',0,0,1,1,1,1,'\"{\\\"default\\\":\\\"\\\",\\\"null\\\":\\\"\\\",\\\"options\\\":{\\\"\\\":\\\"-- None --\\\"},\\\"relationship\\\":{\\\"key\\\":\\\"id\\\",\\\"label\\\":\\\"name\\\"}}\"',2),(41,4,'order','text','order',1,1,1,1,1,1,'\"{\\\"default\\\":1}\"',3),(42,4,'name','text','name',1,1,1,1,1,1,'\"\"',4),(43,4,'slug','text','slug',1,1,1,1,1,1,'\"{\\\"slugify\\\":{\\\"origin\\\":\\\"name\\\"}}\"',5),(44,4,'created_at','timestamp','created_at',0,0,1,0,0,0,'\"\"',6),(45,4,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'\"\"',7),(46,6,'id','number','id',1,0,0,0,0,0,'\"\"',1),(47,6,'name','text','Name',1,1,1,1,1,1,'\"\"',2),(48,6,'created_at','timestamp','created_at',0,0,0,0,0,0,'\"\"',3),(49,6,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'\"\"',4),(50,6,'display_name','text','Display Name',1,1,1,1,1,1,'\"\"',5),(51,1,'seo_title','text','seo_title',0,1,1,1,1,1,'\"\"',14),(52,1,'featured','checkbox','featured',1,1,1,1,1,1,'\"\"',15),(53,3,'role_id','text','role_id',0,1,1,1,1,1,'\"\"',9),(54,3,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(55,7,'id','hidden','Id',1,1,1,1,1,0,'\"\"',1),(56,7,'name','text','name',1,1,1,1,1,1,'\"{\\\"validation\\\":{\\\"rule\\\":\\\"max:100\\\"}}\"',2),(57,7,'slug','text','slug',1,1,1,1,1,1,'\"\"',3),(58,7,'details','text','Details',0,1,1,1,1,1,'\"\"',4),(59,7,'price','number','price',1,1,1,1,1,1,'\"{\\\"validation\\\":{\\\"rule\\\":\\\"required|regex:\\/^\\\\\\\\d*(\\\\\\\\.\\\\\\\\d{1,2})?$\\/\\\"}}\"',5),(60,7,'description','text','Description',1,1,1,1,1,1,'\"\"',6),(61,7,'featured','checkbox','Featured',1,1,1,1,1,1,'\"{\\\"on\\\":\\\"Yes\\\",\\\"off\\\":\\\"No\\\"}\"',7),(62,7,'image','image','Image',0,1,1,1,1,1,'\"{\\\"quality\\\":\\\"70%\\\",\\\"thumbnails\\\":[{\\\"name\\\":\\\"medium\\\",\\\"scale\\\":\\\"50%\\\"},{\\\"name\\\":\\\"small\\\",\\\"scale\\\":\\\"25%\\\"},{\\\"name\\\":\\\"cropped\\\",\\\"crop\\\":{\\\"width\\\":\\\"300\\\",\\\"height\\\":\\\"250\\\"}}]}\"',8),(63,7,'images','multiple_images','Images',0,1,1,1,1,1,'\"\"',9),(64,7,'created_at','timestamp','Created At',0,1,1,1,1,1,'\"\"',10),(65,7,'updated_at','timestamp','Updated At',0,1,1,1,1,1,'\"\"',11),(66,7,'quantity','number','Quantity',1,1,1,1,1,1,'\"\"',8),(67,8,'id','hidden','Id',1,1,1,0,0,0,'\"\"',1),(68,8,'code','text','code',1,1,1,1,1,1,'\"\"',2),(69,8,'type','select_dropdown','Type',1,1,1,1,1,1,'\"{\\\"default\\\":\\\"fixed\\\",\\\"options\\\":{\\\"fixed\\\":\\\"Fixed Value\\\",\\\"percent\\\":\\\"Percent Off\\\"}}\"',3),(70,8,'value','number','Value',0,1,1,1,1,1,'\"{\\\"null\\\":\\\"\\\"}\"',4),(71,8,'percent_off','number','Percent Off',0,1,1,1,1,1,'\"{\\\"null\\\":\\\"\\\"}\"',5),(72,8,'created_at','timestamp','Created At',0,0,1,0,0,0,'\"\"',6),(73,8,'updated_at','timestamp','Updated At',0,0,1,0,0,0,'\"\"',7),(74,9,'id','hidden','Id',1,1,1,0,0,0,'\"\"',1),(75,9,'name','text','Name',1,1,1,1,1,1,'\"\"',2),(76,9,'slug','text','Slug',1,1,1,1,1,1,'\"\"',3),(77,9,'created_at','timestamp','Created At',0,0,0,0,0,0,'\"\"',4),(78,9,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'\"\"',5),(79,10,'id','hidden','Id',1,0,0,0,0,0,'\"\"',1),(80,10,'product_id','number','Product Id',1,1,1,1,1,1,'\"\"',2),(81,10,'category_id','number','Category Id',1,1,1,1,1,1,'\"\"',3),(82,10,'created_at','timestamp','Created At',0,0,0,0,0,0,'\"\"',4),(83,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'\"\"',5),(84,11,'id','hidden','Id',1,1,1,0,0,0,'\"\"',1),(85,11,'user_id','number','User Id',0,1,1,0,0,0,'\"\"',2),(86,11,'billing_email','text','Billing Email',0,1,1,1,1,0,'\"\"',3),(87,11,'billing_name','text','Billing Name',0,1,1,1,1,0,'\"\"',4),(88,11,'billing_address','text','Billing Address',0,1,1,1,1,0,'\"\"',5),(89,11,'billing_city','text','Billing City',0,1,1,1,1,0,'\"\"',6),(90,11,'billing_province','text','Billing Province',0,0,1,1,1,0,'\"\"',7),(91,11,'billing_postalcode','text','Billing Postalcode',0,0,1,1,1,0,'\"\"',8),(92,11,'billing_phone','text','Billing Phone',0,0,1,1,1,0,'\"\"',9),(93,11,'billing_name_on_card','text','Billing Name On Card',0,1,1,1,1,0,'\"\"',10),(94,11,'billing_discount','number','Discount',1,1,1,0,0,0,'\"\"',11),(95,11,'billing_discount_code','text','Discount Code',0,0,1,0,0,0,'\"\"',12),(96,11,'billing_subtotal','number','Subtotal',1,1,1,0,0,0,'\"\"',13),(97,11,'billing_tax','number','Tax',1,1,1,0,0,0,'\"\"',14),(98,11,'billing_total','number','Total',1,1,1,0,0,0,'\"\"',15),(99,11,'payment_gateway','text','Payment Gateway',1,1,1,1,1,0,'\"\"',16),(100,11,'shipped','checkbox','Shipped',1,1,1,1,0,0,'\"{\\\"on\\\":\\\"Yes\\\",\\\"off\\\":\\\"No\\\"}\"',17),(101,11,'error','text','Error',0,1,1,0,0,0,'\"\"',18),(102,11,'created_at','timestamp','Created At',0,0,0,0,0,0,'\"\"',19),(103,11,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'\"\"',20),(104,12,'id','hidden','Id',1,1,1,1,1,0,'{}',1),(105,12,'name','text','Name',1,1,1,1,1,1,'{}',2),(106,12,'email','text','Email',1,1,1,1,1,1,'{}',3),(107,12,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',4),(108,12,'updated_at','timestamp','Updated At',0,1,1,0,0,0,'{}',5),(109,3,'dp','image','Dp',0,1,1,1,1,1,'{}',3),(110,3,'phone','number','Phone',0,1,1,1,1,1,'{}',7),(111,3,'address','text','Address',0,1,1,1,1,1,'{}',8),(112,3,'city','text','City',0,1,1,1,1,1,'{}',9),(113,3,'state','text','State',0,1,1,1,1,1,'{}',10),(114,3,'pin_code','text','Pin Code',0,1,1,1,1,1,'{}',11),(115,3,'wallet','text','Wallet',0,1,1,1,1,1,'{}',13),(116,3,'referred','text','Referred',1,1,1,1,1,1,'{}',14),(117,3,'settings','text','Settings',0,1,1,1,1,1,'{}',16);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy','','',1,0,NULL,'2019-07-17 06:04:37','2019-07-17 06:04:37'),(2,'pages','pages','Page','Pages','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,NULL,'2019-07-17 06:04:37','2019-07-17 06:04:37'),(3,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','\\App\\Http\\Controllers\\Voyager\\UsersController',NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}','2019-07-17 06:04:37','2019-07-20 05:42:35'),(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,NULL,'2019-07-17 06:04:37','2019-07-17 06:04:37'),(5,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2019-07-17 06:04:37','2019-07-17 06:04:37'),(6,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,NULL,'2019-07-17 06:04:37','2019-07-17 06:04:37'),(7,'products','products','Product','Products','voyager-bag','App\\Product',NULL,'\\App\\Http\\Controllers\\Voyager\\ProductsController',NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}','2019-07-17 06:04:47','2019-07-17 06:38:11'),(8,'coupons','coupons','Coupon','Coupons','voyager-dollar','App\\Coupon',NULL,'','',1,0,NULL,'2019-07-17 06:04:47','2019-07-17 06:04:47'),(9,'category','category','Category','Categories','voyager-tag','App\\Category',NULL,'','',1,0,NULL,'2019-07-17 06:04:47','2019-07-17 06:04:47'),(10,'category-product','category-product','Category Product','Category Products','voyager-categories','App\\CategoryProduct',NULL,'','',1,0,NULL,'2019-07-17 06:04:47','2019-07-17 06:04:47'),(11,'orders','orders','Order','Orders','voyager-documentation','App\\Order',NULL,'\\App\\Http\\Controllers\\Voyager\\OrdersController',NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}','2019-07-17 06:04:48','2019-07-20 14:45:11'),(12,'subscribe','subscribe','Subscribe','Subscribes','voyager-mail','App\\Subscriber',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-07-17 06:28:57','2019-07-17 06:28:57');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2019-07-17 06:04:40','2019-07-17 06:04:40','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,10,'2019-07-17 06:04:40','2019-07-17 06:29:47','voyager.media.index',NULL),(3,1,'Posts','','_self','voyager-news',NULL,NULL,11,'2019-07-17 06:04:40','2019-07-17 06:29:47','voyager.posts.index',NULL),(4,1,'Users','','_self','voyager-person',NULL,NULL,9,'2019-07-17 06:04:40','2019-07-17 06:29:47','voyager.users.index',NULL),(5,1,'Categories','','_self','voyager-categories',NULL,NULL,15,'2019-07-17 06:04:40','2019-07-17 06:29:47','voyager.categories.index',NULL),(6,1,'Pages','','_self','voyager-file-text',NULL,NULL,12,'2019-07-17 06:04:40','2019-07-17 06:29:47','voyager.pages.index',NULL),(7,1,'Roles','','_self','voyager-lock',NULL,NULL,8,'2019-07-17 06:04:41','2019-07-17 06:29:47','voyager.roles.index',NULL),(8,1,'Tools','','_self','voyager-tools',NULL,NULL,13,'2019-07-17 06:04:41','2019-07-17 06:29:47',NULL,NULL),(9,1,'Menu Builder','','_self','voyager-list',NULL,8,1,'2019-07-17 06:04:41','2019-07-17 06:04:51','voyager.menus.index',NULL),(10,1,'Database','','_self','voyager-data',NULL,8,2,'2019-07-17 06:04:41','2019-07-17 06:04:51','voyager.database.index',NULL),(11,1,'Compass','','_self','voyager-compass',NULL,8,3,'2019-07-17 06:04:41','2019-07-17 06:04:51','voyager.compass.index',NULL),(12,1,'Settings','','_self','voyager-settings',NULL,NULL,14,'2019-07-17 06:04:41','2019-07-17 06:29:47','voyager.settings.index',NULL),(13,1,'Orders','/admin/orders','_self','voyager-documentation',NULL,NULL,2,'2019-07-17 06:04:50','2019-07-17 06:04:50',NULL,NULL),(14,1,'Products','/admin/products','_self','voyager-bag',NULL,NULL,3,'2019-07-17 06:04:50','2019-07-17 06:04:50',NULL,NULL),(15,1,'Categories','/admin/category','_self','voyager-tag',NULL,NULL,4,'2019-07-17 06:04:50','2019-07-17 06:04:50',NULL,NULL),(16,1,'Coupons','/admin/coupons','_self','voyager-dollar',NULL,NULL,6,'2019-07-17 06:04:50','2019-07-17 06:29:47',NULL,NULL),(17,1,'Category Products','/admin/category-product','_self','voyager-categories',NULL,NULL,7,'2019-07-17 06:04:50','2019-07-17 06:29:47',NULL,NULL),(18,2,'Shop','','_self',NULL,NULL,NULL,1,'2019-07-17 06:04:51','2019-07-17 06:04:51','shop.index',NULL),(19,2,'Orders','/admin/orders','_self',NULL,'#000000',NULL,2,'2019-07-17 06:04:51','2019-07-20 15:36:34',NULL,''),(20,2,'Blog','https://blog.laravelecommerceexample.ca','_self',NULL,NULL,NULL,3,'2019-07-17 06:04:51','2019-07-20 15:36:03',NULL,NULL),(26,1,'Subscribes','','_self','voyager-mail',NULL,NULL,5,'2019-07-17 06:28:57','2019-07-17 06:29:47','voyager.subscribe.index',NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2019-07-17 06:04:40','2019-07-17 06:04:40'),(2,'main','2019-07-17 06:04:50','2019-07-17 06:04:50');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_01_01_000000_create_pages_table',1),(6,'2016_01_01_000000_create_posts_table',1),(7,'2016_02_15_204651_create_categories_table',1),(8,'2016_05_19_173453_create_menu_table',1),(9,'2016_10_21_190000_create_roles_table',1),(10,'2016_10_21_190000_create_settings_table',1),(11,'2016_11_30_135954_create_permission_table',1),(12,'2016_11_30_141208_create_permission_role_table',1),(13,'2016_12_26_201236_data_types__add__server_side',1),(14,'2017_01_13_000000_add_route_to_menu_items_table',1),(15,'2017_01_14_005015_create_translations_table',1),(16,'2017_01_15_000000_add_permission_group_id_to_permissions_table',1),(17,'2017_01_15_000000_create_permission_groups_table',1),(18,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(19,'2017_03_06_000000_add_controller_to_data_types_table',1),(20,'2017_04_11_000000_alter_post_nullable_fields_table',1),(21,'2017_04_21_000000_add_order_to_data_rows_table',1),(22,'2017_07_05_210000_add_policyname_to_data_types_table',1),(23,'2017_08_05_000000_add_group_to_settings_table',1),(24,'2017_11_26_013050_add_user_role_relationship',1),(25,'2017_11_26_015000_create_user_roles_table',1),(26,'2017_12_11_054653_create_products_table',1),(27,'2018_01_11_060124_create_category_table',1),(28,'2018_01_11_060548_create_category_product_table',1),(29,'2018_01_14_215535_create_coupons_table',1),(30,'2018_02_08_021546_add_image_to_products_table',1),(31,'2018_02_08_032544_add_images_to_products_table',1),(32,'2018_02_25_005243_create_orders_table',1),(33,'2018_02_25_010522_create_order_product_table',1),(34,'2018_03_11_000000_add_user_settings',1),(35,'2018_03_14_000000_add_details_to_data_types_table',1),(36,'2018_03_16_000000_make_settings_value_nullable',1),(37,'2018_04_23_011947_add_user_role_relationship_fix',1),(38,'2018_04_23_012009_create_user_roles_table_fix',1),(39,'2018_06_29_032914_add_quantity_to_products_table',1),(40,'2019_07_01_090241_create_subscribe_table',1),(41,'2019_07_02_121112_add_image_to_users_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_product_order_id_foreign` (`order_id`),
  KEY `order_product_product_id_foreign` (`product_id`),
  CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` VALUES (1,NULL,NULL,1,'2019-07-17 06:04:36','2019-07-17 06:04:36'),(2,NULL,NULL,1,'2019-07-17 06:04:36','2019-07-17 06:04:36'),(3,NULL,NULL,1,'2019-07-17 06:04:36','2019-07-17 06:04:36'),(4,NULL,NULL,1,'2019-07-17 06:04:37','2019-07-17 06:04:37'),(5,NULL,NULL,1,'2019-07-17 06:04:37','2019-07-17 06:04:37'),(6,NULL,NULL,1,'2019-07-17 06:04:37','2019-07-17 06:04:37'),(7,NULL,NULL,1,'2019-07-20 06:17:19','2019-07-20 06:17:19'),(8,NULL,NULL,1,'2019-07-20 06:17:19','2019-07-20 06:17:19'),(9,NULL,NULL,1,'2019-07-20 06:17:19','2019-07-20 06:17:19'),(10,NULL,NULL,1,'2019-07-20 11:36:04','2019-07-20 11:36:04'),(11,NULL,NULL,1,'2019-07-20 11:36:04','2019-07-20 11:36:04'),(12,NULL,NULL,2,'2019-07-20 11:36:04','2019-07-20 11:36:04'),(13,NULL,NULL,3,'2019-07-20 11:36:04','2019-07-20 11:36:04'),(14,NULL,NULL,1,'2019-07-20 14:41:48','2019-07-20 14:41:48'),(15,NULL,NULL,1,'2019-07-20 14:41:48','2019-07-20 14:41:48'),(16,NULL,NULL,1,'2019-07-20 14:41:48','2019-07-20 14:41:48'),(17,NULL,NULL,1,'2019-07-20 15:08:00','2019-07-20 15:08:00'),(18,NULL,NULL,1,'2019-07-20 15:30:35','2019-07-20 15:30:35'),(19,NULL,NULL,1,'2019-07-20 15:30:35','2019-07-20 15:30:35'),(20,NULL,NULL,1,'2019-07-20 15:41:49','2019-07-20 15:41:49'),(21,NULL,NULL,1,'2019-07-20 15:41:49','2019-07-20 15:41:49'),(22,NULL,NULL,1,'2019-07-20 16:27:58','2019-07-20 16:27:58'),(23,NULL,NULL,1,'2019-07-20 16:27:58','2019-07-20 16:27:58'),(24,NULL,NULL,1,'2019-07-20 16:28:54','2019-07-20 16:28:54'),(25,NULL,NULL,1,'2019-07-20 16:28:54','2019-07-20 16:28:54'),(26,NULL,NULL,1,'2019-07-20 16:36:25','2019-07-20 16:36:25'),(27,NULL,NULL,1,'2019-07-20 16:36:25','2019-07-20 16:36:25'),(28,NULL,NULL,1,'2019-07-20 16:36:31','2019-07-20 16:36:31'),(29,NULL,NULL,1,'2019-07-20 16:36:31','2019-07-20 16:36:31'),(30,NULL,NULL,1,'2019-07-20 16:40:59','2019-07-20 16:40:59'),(31,NULL,NULL,1,'2019-07-20 16:40:59','2019-07-20 16:40:59'),(32,NULL,NULL,1,'2019-07-20 16:48:34','2019-07-20 16:48:34'),(33,NULL,NULL,1,'2019-07-20 16:48:34','2019-07-20 16:48:34'),(34,NULL,NULL,1,'2019-07-20 16:49:45','2019-07-20 16:49:45'),(35,NULL,NULL,1,'2019-07-20 16:49:45','2019-07-20 16:49:45'),(36,NULL,NULL,1,'2019-07-20 16:50:35','2019-07-20 16:50:35'),(37,NULL,NULL,1,'2019-07-20 16:50:35','2019-07-20 16:50:35'),(38,NULL,NULL,1,'2019-07-20 16:52:28','2019-07-20 16:52:28'),(39,NULL,NULL,1,'2019-07-20 16:52:28','2019-07-20 16:52:28'),(40,NULL,NULL,1,'2019-07-20 16:52:56','2019-07-20 16:52:56'),(41,NULL,NULL,1,'2019-07-20 16:52:56','2019-07-20 16:52:56'),(42,NULL,NULL,1,'2019-07-20 16:54:55','2019-07-20 16:54:55'),(43,NULL,NULL,1,'2019-07-20 16:54:55','2019-07-20 16:54:55'),(44,NULL,NULL,1,'2019-07-20 17:04:05','2019-07-20 17:04:05'),(45,NULL,NULL,1,'2019-07-20 17:04:05','2019-07-20 17:04:05'),(46,NULL,NULL,1,'2019-07-20 17:05:41','2019-07-20 17:05:41'),(47,NULL,NULL,1,'2019-07-20 17:05:41','2019-07-20 17:05:41'),(48,NULL,NULL,1,'2019-07-20 17:08:55','2019-07-20 17:08:55'),(49,NULL,NULL,1,'2019-07-20 17:08:55','2019-07-20 17:08:55'),(50,NULL,NULL,1,'2019-07-20 17:11:19','2019-07-20 17:11:19'),(51,NULL,NULL,1,'2019-07-20 17:11:19','2019-07-20 17:11:19'),(52,NULL,NULL,1,'2019-07-20 17:16:28','2019-07-20 17:16:28'),(53,NULL,NULL,1,'2019-07-20 17:16:28','2019-07-20 17:16:28'),(54,NULL,NULL,1,'2019-07-21 12:52:36','2019-07-21 12:52:36'),(55,NULL,NULL,1,'2019-07-21 12:52:36','2019-07-21 12:52:36'),(56,NULL,NULL,1,'2019-07-21 12:52:37','2019-07-21 12:52:37'),(57,NULL,NULL,1,'2019-07-21 13:01:51','2019-07-21 13:01:51'),(58,NULL,NULL,1,'2019-07-21 13:01:51','2019-07-21 13:01:51'),(59,NULL,NULL,1,'2019-07-21 13:01:51','2019-07-21 13:01:51'),(60,NULL,NULL,1,'2019-07-21 13:36:34','2019-07-21 13:36:34'),(61,NULL,NULL,1,'2019-07-21 13:36:35','2019-07-21 13:36:35'),(62,NULL,NULL,1,'2019-07-21 13:36:35','2019-07-21 13:36:35'),(63,NULL,NULL,1,'2019-07-21 13:39:08','2019-07-21 13:39:08'),(64,NULL,NULL,1,'2019-07-21 13:39:08','2019-07-21 13:39:08'),(65,NULL,NULL,1,'2019-07-21 13:39:08','2019-07-21 13:39:08'),(66,NULL,NULL,1,'2019-07-22 09:57:57','2019-07-22 09:57:57'),(67,NULL,NULL,1,'2019-07-22 09:57:57','2019-07-22 09:57:57'),(68,NULL,NULL,1,'2019-07-22 09:57:57','2019-07-22 09:57:57'),(69,NULL,NULL,1,'2019-07-22 09:57:57','2019-07-22 09:57:57'),(70,NULL,NULL,1,'2019-07-22 10:40:46','2019-07-22 10:40:46'),(71,NULL,NULL,1,'2019-07-22 10:40:46','2019-07-22 10:40:46'),(72,NULL,NULL,1,'2019-07-22 10:40:46','2019-07-22 10:40:46'),(73,NULL,NULL,5,'2019-07-23 11:12:50','2019-07-23 11:12:50'),(74,NULL,NULL,1,'2019-07-23 12:32:13','2019-07-23 12:32:13'),(75,NULL,NULL,1,'2019-07-23 12:32:13','2019-07-23 12:32:13'),(76,NULL,NULL,2,'2019-07-23 12:32:13','2019-07-23 12:32:13'),(77,NULL,NULL,1,'2019-07-24 14:44:34','2019-07-24 14:44:34'),(78,NULL,NULL,1,'2019-07-24 14:44:34','2019-07-24 14:44:34'),(79,NULL,NULL,1,'2019-07-24 14:44:34','2019-07-24 14:44:34'),(80,NULL,1,1,'2019-08-18 13:48:52','2019-08-18 13:48:52'),(81,NULL,33,1,'2019-08-18 13:48:52','2019-08-18 13:48:52'),(82,NULL,3,1,'2019-08-18 13:48:52','2019-08-18 13:48:52'),(83,NULL,6,1,'2019-08-18 13:48:52','2019-08-18 13:48:52'),(84,NULL,37,1,'2019-08-18 13:48:52','2019-08-18 13:48:52'),(85,NULL,35,1,'2019-08-18 13:48:52','2019-08-18 13:48:52'),(86,NULL,39,1,'2019-08-18 13:48:52','2019-08-18 13:48:52'),(87,NULL,45,1,'2019-08-18 13:48:52','2019-08-18 13:48:52'),(88,NULL,46,1,'2019-08-18 13:48:52','2019-08-18 13:48:52'),(89,NULL,52,1,'2019-08-18 13:48:52','2019-08-18 13:48:52'),(90,NULL,35,1,'2019-08-19 11:45:16','2019-08-19 11:45:16');
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `billing_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_postalcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_name_on_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_discount` int(11) NOT NULL DEFAULT '0',
  `billing_discount_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_subtotal` int(11) NOT NULL,
  `billing_tax` int(11) NOT NULL,
  `billing_total` int(11) NOT NULL,
  `payment_gateway` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stripe',
  `shipped` tinyint(1) NOT NULL DEFAULT '0',
  `error` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,'Hello World','Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.','<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','pages/page1.jpg','hello-world','Yar Meta Description','Keyword1, Keyword2','ACTIVE','2019-07-17 06:04:46','2019-07-17 06:04:46');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('mmkumr.ping@gmail.com','$2y$10$d1NW52KgqbPqSRuchPDO.e0HRl1OO/GlMErzLAD2RKdipm/RgMbb2','2019-07-24 06:34:24');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `permission_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `permission_groups` WRITE;
/*!40000 ALTER TABLE `permission_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_groups` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(1,3),(2,1),(2,3),(3,1),(4,1),(5,1),(6,1),(6,3),(7,1),(7,3),(8,1),(8,3),(9,1),(9,3),(10,1),(11,1),(11,3),(12,1),(12,3),(13,1),(13,3),(14,1),(14,3),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(22,3),(23,1),(24,1),(25,1),(26,1),(26,3),(27,1),(27,3),(28,1),(28,3),(29,1),(29,3),(30,1),(31,1),(31,3),(32,1),(32,3),(33,1),(33,3),(34,1),(34,3),(35,1),(36,1),(36,3),(37,1),(37,3),(38,1),(38,3),(39,1),(39,3),(40,1),(41,1),(41,3),(42,1),(42,3),(43,1),(43,3),(44,1),(44,3),(45,1),(46,1),(46,3),(47,1),(47,3),(48,1),(48,3),(49,1),(49,3),(50,1),(51,1),(51,3),(52,1),(52,3),(53,1),(53,3),(54,1),(54,3),(55,1),(56,1),(56,3),(57,1),(57,3),(58,1),(58,3),(59,1),(59,3),(60,1),(61,1),(61,3),(62,1),(62,3),(63,1),(63,3),(64,1),(64,3),(65,1),(65,3),(66,1),(67,1),(68,1),(69,1),(70,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2019-07-17 06:04:41','2019-07-17 06:04:41',NULL),(2,'browse_bread',NULL,'2019-07-17 06:04:41','2019-07-17 06:04:41',NULL),(3,'browse_database',NULL,'2019-07-17 06:04:41','2019-07-17 06:04:41',NULL),(4,'browse_media',NULL,'2019-07-17 06:04:41','2019-07-17 06:04:41',NULL),(5,'browse_compass',NULL,'2019-07-17 06:04:41','2019-07-17 06:04:41',NULL),(6,'browse_menus','menus','2019-07-17 06:04:41','2019-07-17 06:04:41',NULL),(7,'read_menus','menus','2019-07-17 06:04:41','2019-07-17 06:04:41',NULL),(8,'edit_menus','menus','2019-07-17 06:04:41','2019-07-17 06:04:41',NULL),(9,'add_menus','menus','2019-07-17 06:04:41','2019-07-17 06:04:41',NULL),(10,'delete_menus','menus','2019-07-17 06:04:41','2019-07-17 06:04:41',NULL),(11,'browse_pages','pages','2019-07-17 06:04:41','2019-07-17 06:04:41',NULL),(12,'read_pages','pages','2019-07-17 06:04:41','2019-07-17 06:04:41',NULL),(13,'edit_pages','pages','2019-07-17 06:04:41','2019-07-17 06:04:41',NULL),(14,'add_pages','pages','2019-07-17 06:04:41','2019-07-17 06:04:41',NULL),(15,'delete_pages','pages','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(16,'browse_roles','roles','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(17,'read_roles','roles','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(18,'edit_roles','roles','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(19,'add_roles','roles','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(20,'delete_roles','roles','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(21,'browse_users','users','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(22,'read_users','users','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(23,'edit_users','users','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(24,'add_users','users','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(25,'delete_users','users','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(26,'browse_posts','posts','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(27,'read_posts','posts','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(28,'edit_posts','posts','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(29,'add_posts','posts','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(30,'delete_posts','posts','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(31,'browse_categories','categories','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(32,'read_categories','categories','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(33,'edit_categories','categories','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(34,'add_categories','categories','2019-07-17 06:04:42','2019-07-17 06:04:42',NULL),(35,'delete_categories','categories','2019-07-17 06:04:43','2019-07-17 06:04:43',NULL),(36,'browse_settings','settings','2019-07-17 06:04:43','2019-07-17 06:04:43',NULL),(37,'read_settings','settings','2019-07-17 06:04:43','2019-07-17 06:04:43',NULL),(38,'edit_settings','settings','2019-07-17 06:04:43','2019-07-17 06:04:43',NULL),(39,'add_settings','settings','2019-07-17 06:04:43','2019-07-17 06:04:43',NULL),(40,'delete_settings','settings','2019-07-17 06:04:43','2019-07-17 06:04:43',NULL),(41,'browse_products','products','2019-07-17 06:04:51','2019-07-17 06:04:51',NULL),(42,'read_products','products','2019-07-17 06:04:51','2019-07-17 06:04:51',NULL),(43,'edit_products','products','2019-07-17 06:04:51','2019-07-17 06:04:51',NULL),(44,'add_products','products','2019-07-17 06:04:52','2019-07-17 06:04:52',NULL),(45,'delete_products','products','2019-07-17 06:04:52','2019-07-17 06:04:52',NULL),(46,'browse_coupons','coupons','2019-07-17 06:04:52','2019-07-17 06:04:52',NULL),(47,'read_coupons','coupons','2019-07-17 06:04:52','2019-07-17 06:04:52',NULL),(48,'edit_coupons','coupons','2019-07-17 06:04:52','2019-07-17 06:04:52',NULL),(49,'add_coupons','coupons','2019-07-17 06:04:52','2019-07-17 06:04:52',NULL),(50,'delete_coupons','coupons','2019-07-17 06:04:52','2019-07-17 06:04:52',NULL),(51,'browse_category','category','2019-07-17 06:04:52','2019-07-17 06:04:52',NULL),(52,'read_category','category','2019-07-17 06:04:52','2019-07-17 06:04:52',NULL),(53,'edit_category','category','2019-07-17 06:04:52','2019-07-17 06:04:52',NULL),(54,'add_category','category','2019-07-17 06:04:52','2019-07-17 06:04:52',NULL),(55,'delete_category','category','2019-07-17 06:04:52','2019-07-17 06:04:52',NULL),(56,'browse_category-product','category-product','2019-07-17 06:04:52','2019-07-17 06:04:52',NULL),(57,'read_category-product','category-product','2019-07-17 06:04:52','2019-07-17 06:04:52',NULL),(58,'edit_category-product','category-product','2019-07-17 06:04:53','2019-07-17 06:04:53',NULL),(59,'add_category-product','category-product','2019-07-17 06:04:53','2019-07-17 06:04:53',NULL),(60,'delete_category-product','category-product','2019-07-17 06:04:53','2019-07-17 06:04:53',NULL),(61,'browse_orders','orders','2019-07-17 06:04:53','2019-07-17 06:04:53',NULL),(62,'read_orders','orders','2019-07-17 06:04:53','2019-07-17 06:04:53',NULL),(63,'edit_orders','orders','2019-07-17 06:04:53','2019-07-17 06:04:53',NULL),(64,'add_orders','orders','2019-07-17 06:04:53','2019-07-17 06:04:53',NULL),(65,'delete_orders','orders','2019-07-17 06:04:53','2019-07-17 06:04:53',NULL),(66,'browse_subscribe','subscribe','2019-07-17 06:28:57','2019-07-17 06:28:57',NULL),(67,'read_subscribe','subscribe','2019-07-17 06:28:57','2019-07-17 06:28:57',NULL),(68,'edit_subscribe','subscribe','2019-07-17 06:28:57','2019-07-17 06:28:57',NULL),(69,'add_subscribe','subscribe','2019-07-17 06:28:57','2019-07-17 06:28:57',NULL),(70,'delete_subscribe','subscribe','2019-07-17 06:28:57','2019-07-17 06:28:57',NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,0,NULL,'Lorem Ipsum Post',NULL,'This is the excerpt for the Lorem Ipsum Post','<p>This is the body of the lorem ipsum post</p>','posts/post1.jpg','lorem-ipsum-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2019-07-17 06:04:46','2019-07-17 06:04:46'),(2,0,NULL,'My Sample Post',NULL,'This is the excerpt for the sample Post','<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>','posts/post2.jpg','my-sample-post','Meta Description for sample post','keyword1, keyword2, keyword3','PUBLISHED',0,'2019-07-17 06:04:46','2019-07-17 06:04:46'),(3,0,NULL,'Latest Post',NULL,'This is the excerpt for the latest post','<p>This is the body for the latest post</p>','posts/post3.jpg','latest-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2019-07-17 06:04:46','2019-07-17 06:04:46'),(4,0,NULL,'Yarr Post',NULL,'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.','<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>','posts/post4.jpg','yarr-post','this be a meta descript','keyword1, keyword2, keyword3','PUBLISHED',0,'2019-07-17 06:04:46','2019-07-17 06:04:46');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `quantity` int(10) unsigned NOT NULL DEFAULT '10',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_name_unique` (`name`),
  UNIQUE KEY `products_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Marigold(Gendu)','marigold',NULL,0,'Marigolds are used as color edging along flower beds and walkways. It was believed that marigolds repelled insects. The plant makes an excellent companion plant in hanging baskets and planters.',1,9,'products/August2019/gFs3I2vDqocSGl1dXMMD.jpeg','[\"products\\/August2019\\/jDMlaaCGByBcxytpwDq5.jpg\",\"products\\/August2019\\/xC2bnyO9hSv9CXf8fEP7.jpg\"]','2019-08-03 10:22:00','2019-08-18 21:32:33'),(3,'Gladiolus','gladiolus',NULL,0,'The Gladiolus flower signifies remembrance. It also expresses infatuation, telling the receiver that he or she pierces the heart. It also stands for strength of character, faithfulness and honor.',0,9,'products/August2019/Z2zuoyjriuXr2dtwxRdW.jpg','[\"products\\/August2019\\/T5JHnUG2m6mZvL3di2kt.jpg\",\"products\\/August2019\\/mbqG95J3O3itggru18e0.jpg\"]','2019-08-04 08:46:00','2019-08-18 13:49:02'),(4,'Tube rose(Rajanigandha)','tube-rose',NULL,0,'The Tuberose does not bear any relation to the rose, but its name is said to derive from the plants slender stem from which grows a tube resembling rootstock. This stem often grows 3 feet (91 cm) high and bears flowers of a pink-cream shade, each with six sword-shaped petals.',0,10,'products/August2019/hRrIkmoECilWYbHSk9B4.jpg','[\"products\\/August2019\\/kpj1CcOecaxSomKCs4d0.jpg\",\"products\\/August2019\\/BFHbzipGXoAPiHucdL4k.jpg\"]','2019-08-05 20:05:00','2019-08-05 20:05:00'),(6,'Marigold Garland(Gendu Mala)','marigold-garland',NULL,0,'Marigold garlands can be used for decorating your house or for worshiping, etc.',0,9,'products/August2019/hmjqDtXqAczFarsrQJZj.jpg','[\"products\\/August2019\\/rB0NHHvgjEzd00JyLAcp.jpg\"]','2019-08-05 20:35:00','2019-08-18 13:49:02'),(9,'Rose(Golap)','rose',NULL,0,'When growing in the garden, roses should be planted between November and February. If you are growing in a pot, they can be planted at any time. Roses need to be fed regularly and the amount of feeding will depend on the kind of soil they are planted in. Pruning is also important and should be done after between mid-February and mid-March during a sustained frost-free period.',0,10,'products/August2019/h8UVoRCeRZx53fPoGvxn.jpg','[\"products\\/August2019\\/Oncp9n93IeV1lfCkiihq.jpg\"]','2019-08-09 18:00:00','2019-08-09 12:32:00'),(10,'Flat bouquet','flat-bouquet',NULL,0,'This is a bouquet of different kinds of flowers.',0,10,'products/August2019/K8BYfZKAGuvNZWacp6IA.jpg','[\"products\\/August2019\\/jSoDsP8cITdw9wIchJvD.jpg\"]','2019-08-09 18:52:00','2019-08-09 18:52:00'),(11,'Pot bouquet','pot-bouquet',NULL,0,'This is a pot bouquet of different kinds of flowers.',0,10,'products/August2019/lOMsqmxLYw4oG2WtBPwh.jpg','[\"products\\/August2019\\/52zEaYmATPlx63sfb09t.jpg\",\"products\\/August2019\\/NWDItX2ACX2T0LPcydTb.jpg\"]','2019-08-09 19:04:00','2019-08-09 13:41:27'),(13,'Cone bouquet','cone-bouquet',NULL,0,'This is a cone bouquet of different kinds of flowers.',1,10,'products/August2019/ae36x5epXQFR3Ih6TFe3.jpg','[\"products\\/August2019\\/zIIrRvIu1lza8Rm7rCNw.jpg\"]','2019-08-09 19:19:00','2019-08-09 13:51:00'),(33,'Bananas','bananas',NULL,0,'Bananas are one of the most widely consumed fruits in the world for good reason. Eating them could help lower blood pressure and reduce the risks of cancer and asthma.',0,9,'products/August2019/4svh6eufwvRWjp8OZGzb.jpg','[\"products\\/August2019\\/YL7b68ljEWh86c0chzPw.jpg\",\"products\\/August2019\\/CddHnMcJSliavo1fTbqz.jpg\"]','2019-08-16 17:59:00','2019-08-18 13:49:01'),(34,'Apple','apple',NULL,0,'A collection of research studies suggests that apples may well be one of the most healthy foods for you to include in your daily diet. Let\'s take a look at the studies and the possible health benefits suggested by them: improving neurological health, preventing dementia, reducing your risk of stroke, lowering levels of bad cholesterol, reducing your risk of diabetes, etc.',0,10,'products/August2019/sIMDGXzjIiIb3quWGYHV.jpg','[\"products\\/August2019\\/6bvt3WXOIaa2Cmoap2IG.jpg\",\"products\\/August2019\\/wRVLWQDliUwud9qyGeSQ.jpg\"]','2019-08-16 18:09:00','2019-08-16 13:04:00'),(35,'Pomegranate','pomegranate',NULL,0,'The pomegranate arils are also very sweet, with one cup containing 24 grams of sugar and 144 calories. Test-tube studies have shown that they can reduce inflammatory activity in the digestive tract, as well as in breast cancer and colon cancer cells.',1,8,'products/August2019/3DdVWZATgbX6Ob7vHoD2.jpg','[\"products\\/August2019\\/av7tSVB7sO5vJxjKlLIQ.jpg\",\"products\\/August2019\\/YcF3kkBsvUmOOstDZ9Uv.jpg\"]','2019-08-18 07:39:00','2019-08-19 11:45:27'),(36,'Watermelon','watermelon',NULL,0,'Despite the popular belief that watermelon is just water and sugar, watermelon is actually a nutrient dense food. It provides high levels of vitamins, minerals, and antioxidants and just a small number of calories.',1,10,'products/August2019/dd6t5SlPn96QQPAhdAL2.jpg','[\"products\\/August2019\\/bfEeW5ZBADYe12oTcife.jpg\",\"products\\/August2019\\/MVUiqQmzNJacaAinfDxp.jpg\"]','2019-08-18 07:56:00','2019-08-18 21:30:20'),(37,'Kiwi','kiwi',NULL,0,'The kiwifruit, native to northern China, first arrived in New Zealand at the turn of the 20th century; it was then known as the Chinese Gooseberry. Benifits of kiwi are reduced risk of heart disease, diabetes, cancer, Healthful looking skin, Better sleep, Heart health, Kidney stones, Lowering blood pressure, Prevents constipation.',0,9,'products/August2019/0ekOXbudTvkzZx8rqLwZ.jpg','[\"products\\/August2019\\/PQmlimN902bd65INFELO.jpg\",\"products\\/August2019\\/dvzGznN2qkB4Co4DZE2j.jpg\"]','2019-08-18 08:04:00','2019-08-18 13:49:02'),(38,'Papaya','papaya',NULL,0,'The nutrients found in papaya are thought to have a range of health benefits. They may help in Age-related, macular degeneration, Asthma prevention, Cancer prevention, Bone health, Diabetes, Digestion, Heart disease, Inflammation, Skin and healing Hair health',0,10,'products/August2019/N0I77jUUs6dSh6zMjw0h.jpg','[\"products\\/August2019\\/UNeWYm9QdLq9yRhVu82A.jpg\",\"products\\/August2019\\/IdPfHn91OloNJ6Ftc749.JPG\"]','2019-08-18 08:16:00','2019-08-18 08:16:00'),(39,'Muskmelon','muskmelon',NULL,0,'Muskmelon\'s juicy sweetness is a satisfying substitute for high-calorie snacks and desserts. Muskmelons are also abundant in vitamin C, one arm of the now-famous disease-fighting antioxidant trio.',0,9,'products/August2019/lufBX6MCvLOnWNWE0Joa.jpg','[\"products\\/August2019\\/ZC3KeWN1iRry1LBbzaSi.jpg\",\"products\\/August2019\\/xekDa77Kqkh2LI80BV8u.jpg\"]','2019-08-18 08:26:00','2019-08-18 13:49:03'),(40,'Avacado','avacado',NULL,0,'Avocados are a stone fruit with a creamy texture that grow in warm climates. Their potential health benefits include improving digestion, decreasing risk of depression, and protection against cancer.',0,10,'products/August2019/94i6oMKhBG5TDw7GGcjZ.jpg','[\"products\\/August2019\\/cUMZbIyIaQKpQqg81Gy9.JPG\",\"products\\/August2019\\/TsBoY7pi2Z8gHJoLT6Xl.JPG\"]','2019-08-18 08:33:00','2019-08-18 08:33:00'),(41,'Mosambi','mosambi',NULL,0,'Mosambi is somewhat similar to a lemon in appearance, but it has a sweeter taste similar to that of an orange. Health Benefits Of Mosambi are relieves constipation, prevents scurvy peptic, ulcers, respiratory problems, Improves the Immune system, Anti-Cancer Properties, urinary disorders, treatment of sunstroke And dehydration, beneficial For Pregnant Women, treatment of Jaundice, beneficial for asthma, relief from tonsillitis',0,10,'products/August2019/wq8E1HACy1qvB7VRlQRG.jpg','[\"products\\/August2019\\/iFohwH8JsE6qs0fz1wdV.jpg\",\"products\\/August2019\\/MrqLF5HarXZjLFrz98hv.jpg\"]','2019-08-18 08:34:00','2019-08-18 08:34:00'),(42,'Oranges','oranges',NULL,0,'Orange fruit benefits for health are takes care of your cardiovascular system, controls blood pressure, prevents cancer , anti-inflammatory properties, eye health, prevents kidney disease, beneficial for diabetics, improves immunity, prevents stomach ulcers, beneficial in Pregnancy, improves sperm quality, anti-ageing benefits, bye bye acne and blackheads, treatment of oily skin',0,10,'products/August2019/k5shjjbPU5xmRS2PlOFI.jpg','[\"products\\/August2019\\/n3cjaYS9q7ATurPq7Ahk.jpg\",\"products\\/August2019\\/ZznKWcO2i19RhA0bTC0U.jpg\"]','2019-08-18 09:00:00','2019-08-18 09:00:00'),(43,'Pear','pear',NULL,0,'Health benefits of pear are fruit mental Health, Antioxidants, Vitamin K, Cancer, Macular Degeneration, Heart health, Anti-inflammatory, Diabetes, Bone Health, hair(Nourishes, Scalp, Hair Roots, Follicles), Treats Dandruff.',0,10,'products/August2019/hs8SNu0BQIqd4KU1xlBb.jpg','[\"products\\/August2019\\/WAetBqtl2oAHdkI9NtgJ.jpg\",\"products\\/August2019\\/idreYwZSToqEdKaesr56.jpg\"]','2019-08-18 09:03:00','2019-08-18 09:03:00'),(44,'Guava','guava',NULL,0,'Health Benefits of Guava are Antioxidant Properties, Controls Diabetes, Regulates Blood Pressure, Improves Thyroid Health, Fights Scurvy.',1,10,'products/August2019/VkVbZ6HABIGIXHVo5esP.jpg','[\"products\\/August2019\\/UlDLS0NbRZAIAwh6yT3g.jpg\",\"products\\/August2019\\/r6CydtuSqhBaouR9ADvO.jpg\"]','2019-08-18 10:16:00','2019-08-18 21:29:53'),(45,'Sapota','sapota',NULL,0,'Health benifits of sapota are it is one of the high-calorie fruits; 100 g provides 83 calories (almost same as that of calories in sweet potato, and banana).The fruit is rich in antioxidant polyphenolic compound tannin.Sapote contains a good amount of antioxidant vitamins like vitamin-C (24.5% of recommended daily intake per 100 g of fruit), and vitamin A. Fresh ripe sapota is a good source of minerals like potassium, copper, iron and vitamins like folate, niacin and pantothenic acid.',0,9,'products/August2019/6MFCwl9jgo7NeZ7JcTaL.png','[\"products\\/August2019\\/9Vnr43MTU09gJCuk4XBR.jpg\"]','2019-08-18 10:26:00','2019-08-18 13:49:03'),(46,'Grapes','grapes',NULL,0,'Health benifits of Grapes are Cancer, growth of tumors, Heart health, Blood pressure, Constipation, Allergies, Diabetic neuropathy and retinopathy, Eye health, Acne, Alzheimer\'s disease, blood glucose control, osteoarthritis, boosting the immune system',0,9,'products/August2019/TvmbToViVsLEXUbSGezD.jpg','[\"products\\/August2019\\/HRJFuRWUhrHKBA1x2hHT.JPG\"]','2019-08-18 10:40:00','2019-08-18 13:49:03'),(47,'Mango','mango',NULL,0,'Health benefits of Mango fruit      Mango fruit is rich in pre-biotic dietary fiber, vitamins, minerals, and poly-phenolic flavonoid antioxidant compounds.      According to new research study, mango fruit has been found to protect from colon, breast, leukemia and prostate cancers. Several trial studies suggest that polyphenolic antioxidant compounds in mango are known to offer protection against breast and colon cancers.      Mango fruit is an excellent source of Vitamin-A and flavonoids like β-carotene, α-carotene, and β-cryptoxanthin. 100 g of fresh fruit provides 765 IU or 25% of recommended daily levels of vitamin-A. Together; these compounds have been known to have antioxidant properties and are essential for vision.      Vitamin-A also required for maintaining healthy mucosa and skin. Consumption of natural fruits rich in carotenes is known to protect from lung and oral cavity cancers.      Fresh mango is a good source of potassium. 100 g fruit provides 156 mg of potassium while just 2 mg of sodium. Potassium is an important component of cell and body fluids that helps controlling heart rate and blood pressure.      It is also an excellent source of vitamin-B6 (pyridoxine), vitamin-C and vitamin-E. Consumption of foods rich in vitamin-C helps the body develop resistance against infectious agents as well as scavenge harmful oxygen-free radicals. Vitamin B-6 or pyridoxine required for GABA hormone production within the brain.      It also controls homocysteine levels within the blood, which may otherwise be harmful to blood vessels resulting in coronary artery disease (CAD), and stroke.      Further, it composes moderate amounts of copper. Copper is a co-factor for many vital enzymes, including cytochrome c-oxidase and superoxide dismutase (other minerals function as co-factors for this enzyme are manganese and zinc). Copper also required for the production of red blood cells.      Additionally, mango peel is also rich in phytonutrients, such as the pigment antioxidants like carotenoids and polyphenols.',1,10,'products/August2019/IfvSoiMcgBZ6EB9hHUNU.jpg','[\"products\\/August2019\\/pehClWZFcKXICwTZVxzY.jpg\",\"products\\/August2019\\/uuVHiRkQCuNjZAxLodvF.jpg\"]','2019-08-18 10:45:00','2019-08-18 21:31:00'),(50,'Pineapple','pineapple',NULL,0,'Health Benefits of Pineapple are Rich in Antioxidants, Boosts Immunity, Treats Sinus, Prevents Cancer, Reduces Inflammation, Reduces Arthritis Pain.',0,10,'products/August2019/Ua3bix6vqDdJu06Yyle4.jpg','[\"products\\/August2019\\/1FjDL5lbjyITV9plIb7i.jpg\",\"products\\/August2019\\/NB2bDXgJZqPi16Hi4sEi.jpg\"]','2019-08-18 17:45:00','2019-08-18 12:17:27'),(51,'Jackfruit','jackfruit',NULL,0,'Health benifits of jackfruit Fights wrinkles, Helps to get a glowing complexion, Flawless skin, High in protein, Promotes hair growth, Vitamin A, Immunity, Energy, Prevents cancer, Maintains blood pressure, Improves digestion, Prevents colon cancer, Improves eyesight, Skin health and ageing, Asthma, Bone health, Anemia, Regulates blood sugar levels, Keeps thyroid healthy, Supports bowel regularity, Helps prevent night blindness, Lowers risk of heart disease, Ulcers',0,10,'products/August2019/6wwwOGFjqDgsKuctqErn.jpg','[\"products\\/August2019\\/4W5Irei5DRSiOBjVZLCE.jpg\",\"products\\/August2019\\/26SoNgAx14psfuELaxds.jpg\"]','2019-08-18 18:00:00','2019-08-18 18:00:00'),(52,'Peach','peach',NULL,0,'Health benifits of peach are Cardiovascular Benefits, Anti-Cancer, Eye Health, Detoxifies Your System, Stress Reliever, Dental Health, Weight Loss, Removes Dead Cells, Anti-Aging Benefits, Great Moisturizer, UV Protection, Prevents Hair Loss, Scalp Cleanser',1,9,'products/August2019/tz9E9bz0B9fJn5la9AI8.jpg','[\"products\\/August2019\\/r2FYXFCd8z4o21qrkwPv.jpg\",\"products\\/August2019\\/Fb4L2vj6NfI1aspODbCe.jpg\"]','2019-08-18 18:02:00','2019-08-18 13:49:00');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2019-07-17 06:04:41','2019-07-17 06:04:41'),(2,'user','Normal User','2019-07-17 06:04:41','2019-07-17 06:04:41'),(3,'adminweb','Admin Web','2019-07-17 06:04:51','2019-07-17 06:04:51');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Site Title','','text',1,'Site'),(2,'site.description','Site Description','Site Description','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID','','','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','Voyager','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)','','','text',1,'Admin'),(11,'site.stock_threshold','Stock Threshold','5','','text',6,'Site');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscribe_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `subscribe` WRITE;
/*!40000 ALTER TABLE `subscribe` DISABLE KEYS */;
INSERT INTO `subscribe` VALUES (1,'Amit Patro','amit.patro400@gmail.com','2019-08-18 14:00:14','2019-08-18 14:00:14'),(2,'Vegifruit','vegifruitcare@gmail.com','2019-08-18 14:09:04','2019-08-18 14:09:04');
/*!40000 ALTER TABLE `subscribe` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'data_types','display_name_singular',1,'pt','Post','2019-07-17 06:04:46','2019-07-17 06:04:46'),(2,'data_types','display_name_singular',2,'pt','Página','2019-07-17 06:04:46','2019-07-17 06:04:46'),(3,'data_types','display_name_singular',3,'pt','Utilizador','2019-07-17 06:04:46','2019-07-17 06:04:46'),(4,'data_types','display_name_singular',4,'pt','Categoria','2019-07-17 06:04:46','2019-07-17 06:04:46'),(5,'data_types','display_name_singular',5,'pt','Menu','2019-07-17 06:04:46','2019-07-17 06:04:46'),(6,'data_types','display_name_singular',6,'pt','Função','2019-07-17 06:04:46','2019-07-17 06:04:46'),(7,'data_types','display_name_plural',1,'pt','Posts','2019-07-17 06:04:46','2019-07-17 06:04:46'),(8,'data_types','display_name_plural',2,'pt','Páginas','2019-07-17 06:04:46','2019-07-17 06:04:46'),(9,'data_types','display_name_plural',3,'pt','Utilizadores','2019-07-17 06:04:46','2019-07-17 06:04:46'),(10,'data_types','display_name_plural',4,'pt','Categorias','2019-07-17 06:04:46','2019-07-17 06:04:46'),(11,'data_types','display_name_plural',5,'pt','Menus','2019-07-17 06:04:47','2019-07-17 06:04:47'),(12,'data_types','display_name_plural',6,'pt','Funções','2019-07-17 06:04:47','2019-07-17 06:04:47'),(13,'categories','slug',1,'pt','categoria-1','2019-07-17 06:04:47','2019-07-17 06:04:47'),(14,'categories','name',1,'pt','Categoria 1','2019-07-17 06:04:47','2019-07-17 06:04:47'),(15,'categories','slug',2,'pt','categoria-2','2019-07-17 06:04:47','2019-07-17 06:04:47'),(16,'categories','name',2,'pt','Categoria 2','2019-07-17 06:04:47','2019-07-17 06:04:47'),(17,'pages','title',1,'pt','Olá Mundo','2019-07-17 06:04:47','2019-07-17 06:04:47'),(18,'pages','slug',1,'pt','ola-mundo','2019-07-17 06:04:47','2019-07-17 06:04:47'),(19,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2019-07-17 06:04:47','2019-07-17 06:04:47'),(20,'menu_items','title',1,'pt','Painel de Controle','2019-07-17 06:04:47','2019-07-17 06:04:47'),(21,'menu_items','title',2,'pt','Media','2019-07-17 06:04:47','2019-07-17 06:04:47'),(22,'menu_items','title',3,'pt','Publicações','2019-07-17 06:04:47','2019-07-17 06:04:47'),(23,'menu_items','title',4,'pt','Utilizadores','2019-07-17 06:04:47','2019-07-17 06:04:47'),(24,'menu_items','title',5,'pt','Categorias','2019-07-17 06:04:47','2019-07-17 06:04:47'),(25,'menu_items','title',6,'pt','Páginas','2019-07-17 06:04:47','2019-07-17 06:04:47'),(26,'menu_items','title',7,'pt','Funções','2019-07-17 06:04:47','2019-07-17 06:04:47'),(27,'menu_items','title',8,'pt','Ferramentas','2019-07-17 06:04:47','2019-07-17 06:04:47'),(28,'menu_items','title',9,'pt','Menus','2019-07-17 06:04:47','2019-07-17 06:04:47'),(29,'menu_items','title',10,'pt','Base de dados','2019-07-17 06:04:47','2019-07-17 06:04:47'),(30,'menu_items','title',12,'pt','Configurações','2019-07-17 06:04:47','2019-07-17 06:04:47');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.jpg',
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.jpg',
  `phone` bigint(20) unsigned DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin_code` int(10) unsigned DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wallet` int(10) unsigned DEFAULT '0',
  `referred` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'users/default.jpg',1,'Admin','vegifruit@admin.com','users/default.jpg',NULL,NULL,NULL,NULL,NULL,'$2y$10$UBP6yf4M3EUZ0CxTdahbnek1re8jBInvHFIPfoLLb6KvCZMP0/Jja',0,0,'INIR7IoB9cLtEiNscOHxaw470HE9upiV7cut2pk0tmbgqngWUPP07StjLGao',NULL,'2019-07-17 06:04:46','2019-07-17 06:04:46'),(4,'users/mmkumr.ping@gmail.com.jpg',2,'Mukesh Kumar','mmkumr.ping@gmail.com','users/default.jpg',8337908779,'Co-operative colony lane 3rd','Berhampur','Orissa',760004,'$2y$10$MHetZXIwuZoPOK6DPzKXNeBnxqr1GB4RguTlBGHjF4RSLoSSEuy9O',0,0,NULL,NULL,'2019-07-25 13:49:38','2019-07-25 13:49:38');
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

