-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: sixseven
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Current Database: `sixseven`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sixseven` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sixseven`;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `datetime` datetime NOT NULL,
  `text` text NOT NULL,
  `img_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` VALUES (2,'belly','2023-06-15 20:22:28','一表用三代，人走表还在。','assets/img/800_800_28B5F5B15775FEB6D7F13F4CF1A3A8FF59B648B79E6D272Fmp.png'),(3,'belly','2023-06-15 23:11:43','一表人才','assets/img/800_800_28B5F5B15775FEB6D7F13F4CF1A3A8FF59B648B79E6D272Fmp.png');
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `datetime` datetime NOT NULL,
  `message` varchar(255) NOT NULL,
  `member_id` int(11) NOT NULL,
  `announcement_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (2,'jack','2023-06-15 20:26:45','6',5,2),(3,'jack','2023-06-15 20:55:22','你人真好',5,2),(4,'jack','2023-06-15 23:13:08','我是学生，送我！希望你不要不识好歹',5,3),(5,'king','2023-06-15 23:14:00','我是学生，送我！希望你不要不识好歹',4,3),(7,'belly','2023-06-19 20:57:48','hello',2,2);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cowry`
--

DROP TABLE IF EXISTS `cowry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cowry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `img_path` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `status` tinyint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cowry`
--

LOCK TABLES `cowry` WRITE;
/*!40000 ALTER TABLE `cowry` DISABLE KEYS */;
INSERT INTO `cowry` VALUES (1,'MackBook',1199.00,'assets/img/F94A50F90147F827D72F70FC1C90A104.png.webp',100,0,1),(2,'HuaWei',99.00,'assets/img/800_800_391F78057B02534E33860A555B5D66B4mp.webp',100,0,1),(3,'MatePad',99.00,'assets/img/428_428_2406A21ABDF8E318A3BBAAF8C2ADF050mp.png',100,0,1),(5,'Mac',1299.00,'assets/img/store-card-13-mac-nav-202203.png',100,0,1),(6,'Mate 30 RS保时捷设计',499.00,'assets/img/800_800_2F5E87BCA193BD487F2BEF1C396A65F69384C8D9B2DE0B8Fmp.png',100,0,2),(7,'Mate 30 RS',888.00,'assets/img/800_800_3F2DBA93088E337403F70A88956883E586C4B514B56D5399mp.png',100,0,2),(9,'p40',99.00,'assets/images/product-image/2023/6/17/46d86ca7-57f2-4e5d-8e75-c78adec27141_1687011779085_800_800_650BD1B06632E267C1A0E6FD975B1C4ED9D91ABF9DBD1C24mp.png',99,1,2),(10,'n10',199.00,'assets/images/product-image/2023/6/18/4751495d-992a-4c9c-af26-eb00326326e7_1687064130286_800_800_391F78057B02534E33860A555B5D66B4mp.webp',99,1,3),(11,'iphone13',1299.00,'assets/images/product-image/2023/6/18/1ab9d70b-d2b5-4071-90d2-e35569d5ec0b_1687064442918_iphone-card-40-iphone12-202209.jfif',88,12,4),(12,'配件',99.00,'assets/images/product-image/2023/6/21/925cbf68-c3b6-4dc7-9baf-16fc26f348d5_1687282702213_store-card-13-accessories-nav-202209.png',100,0,2),(13,'AirPods',299.00,'assets/images/product-image/2023/6/21/974200d6-95f2-47ec-b84e-d83bcf199832_1687283273087_store-card-13-airpods-nav-202209.png',100,0,2),(14,'huawei',499.00,'assets/images/product-image/2023/6/21/2179d578-fd55-422e-9bfa-de66c5554ef1_1687283457225_800_800_391F78057B02534E33860A555B5D66B4mp.webp',100,0,3),(15,'ihone',199.00,'assets/images/product-image/2023/6/21/f5d13388-1459-4906-b639-580ff13f909b_1687283492087_iphone-card-40-iphone14-202209.jfif',100,0,4),(16,'我是电脑',1199.00,'assets/images/product-image/2023/6/21/24ec58ef-74a6-4530-949e-fd710732d903_1687283560287_800_800_489E4F53219E6909E7A7F49FABA605D6C60C0B53F1DA152Amp.png',100,0,5),(17,'我也是电脑',2199.00,'assets/images/product-image/2023/6/21/099d01c9-afe9-493f-ae0e-de26254be93c_1687283626786_800_800_0586DDD43A796BB8F9DCE0CF38A3C248212C18CA891A2AB9mp.png',100,0,5),(18,'小配件',99.00,'assets/images/product-image/2023/6/21/a10c399a-8bb5-43de-9a85-2baca5adc20f_1687283728907_MX4M2.jfif',100,0,6),(19,'保温杯',89.00,'assets/images/product-image/2023/6/21/6e3822ba-b28b-4f53-96d8-9d01e606d2af_1687283832439_HNNF2.jfif',100,0,6),(20,'Name',99.00,'assets/images/product-image/2023/6/21/b6472557-84a5-4e12-b319-105a1130f22c_1687283937927_store-card-50-holiday-gift-wrap-202211.jfif',100,0,6),(21,'Name',199.00,'assets/images/product-image/2023/6/21/5daee799-d024-4990-9594-9aad81729525_1687284471863_MQDT3.jfif',99,1,6);
/*!40000 ALTER TABLE `cowry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `status` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (2,'belly','fcea920f7412b5da7be0cf42b8c93759','belly@qq.com',1),(4,'king','fcea920f7412b5da7be0cf42b8c93759','king@qq.com',0),(5,'jack','fcea920f7412b5da7be0cf42b8c93759','jack@qq.com',0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` varchar(64) NOT NULL,
  `datetime` datetime NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('16871917085392','2023-06-20 00:21:49',797.00,2,2),('16871937926442','2023-06-20 00:56:33',598.00,1,2),('16871980712064','2023-06-20 02:07:51',2392.00,1,4);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `count` int(11) NOT NULL,
  `total_price` decimal(11,2) NOT NULL,
  `order_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,'n10',199.00,1,199.00,'16871917085392'),(2,'iphone13',299.00,2,598.00,'16871917085392'),(3,'iphone13',299.00,2,598.00,'16871937926442'),(4,'iphone13',299.00,8,2392.00,'16871980712064');
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-21  2:36:23
