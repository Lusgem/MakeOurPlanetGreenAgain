-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: monblog
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.16.04.2

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add user',4,'add_user'),(10,'Can change user',4,'change_user'),(11,'Can delete user',4,'delete_user'),(12,'Can view user',4,'view_user'),(13,'Can add group',2,'add_group'),(14,'Can change group',2,'change_group'),(15,'Can delete group',2,'delete_group'),(16,'Can view group',2,'view_group'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add financeur',7,'add_financeur'),(26,'Can change financeur',7,'change_financeur'),(27,'Can delete financeur',7,'delete_financeur'),(28,'Can view financeur',7,'view_financeur'),(29,'Can add copyright',8,'add_copyright'),(30,'Can change copyright',8,'change_copyright'),(31,'Can delete copyright',8,'delete_copyright'),(32,'Can view copyright',8,'view_copyright'),(33,'Can add projet',9,'add_projet'),(34,'Can change projet',9,'change_projet'),(35,'Can delete projet',9,'delete_projet'),(36,'Can view projet',9,'view_projet'),(37,'Can add expert',10,'add_expert'),(38,'Can change expert',10,'change_expert'),(39,'Can delete expert',10,'delete_expert'),(40,'Can view expert',10,'view_expert'),(41,'Can add commentaire',11,'add_commentaire'),(42,'Can change commentaire',11,'change_commentaire'),(43,'Can delete commentaire',11,'delete_commentaire'),(44,'Can view commentaire',11,'view_commentaire'),(45,'Can add paiement',12,'add_paiement'),(46,'Can change paiement',12,'change_paiement'),(47,'Can delete paiement',12,'delete_paiement'),(48,'Can view paiement',12,'view_paiement');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$pPIOk7xhJnXx$YjYSMxcm5bJLoeAyM7YtKokZlT60H+jVNX0nMDhMJh0=','2019-11-29 10:46:57.794135',1,'etudiant','','','romanepoirier0@gmail.com',1,1,'2019-11-29 10:33:28.226657'),(2,'pbkdf2_sha256$150000$7awQguvGIcxY$AD1IqJUcUCFelZqI/FlrhHVEAFaTzXgv3eeJDhLkeEY=','2020-01-21 09:54:52.306353',1,'admin','','','',1,1,'2020-01-17 10:52:58.103449'),(3,'pbkdf2_sha256$150000$MjCKZ4Njvw4E$c/+/PyMsaKnBrD+/+cVKItemoVIxbRnC1ck3AgZvUg8=','2020-01-21 09:07:37.357809',0,'user_test','Toto','Tutu','',0,1,'2020-01-18 16:52:02.000000'),(4,'pbkdf2_sha256$150000$8cqqwjVKoznm$T3mC7ptcYfacOGd5xAx6xFS3bgTQBuoH7JFU+kSFGok=','2020-01-21 09:25:31.674802',0,'user_test2','Jean','Paul','',0,1,'2020-01-18 16:59:38.000000'),(5,'pbkdf2_sha256$150000$wkOk7yZKscCf$TQTMmswjwMkoKs/UAuj7ex5gVOw94m6uLAnXEyqRtgY=','2020-01-18 18:34:44.064053',0,'cocolch','','','cocolch@test.fr',0,1,'2020-01-18 18:34:43.848330'),(6,'pbkdf2_sha256$150000$WCVdoLGSGw2I$VLgOH+oIPlHbJ1vN7dlEzRlzH0tRpp0LHJRIXv3BeWo=','2020-01-18 19:11:41.371498',0,'cocoelcham','coco','lechameau','cocoelcham@test.fr',0,1,'2020-01-18 19:11:41.161618');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copyright_copyright`
--

DROP TABLE IF EXISTS `copyright_copyright`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `copyright_copyright` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copyright_copyright`
--

LOCK TABLES `copyright_copyright` WRITE;
/*!40000 ALTER TABLE `copyright_copyright` DISABLE KEYS */;
INSERT INTO `copyright_copyright` VALUES (1,'copyright1','type1'),(2,'copyright2','type1'),(3,'copyright3','type1');
/*!40000 ALTER TABLE `copyright_copyright` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-01-18 10:16:54.385199','1','Copyright object (1)',1,'[{\"added\": {}}]',8,2),(2,'2020-01-18 10:17:00.501582','1','Projet object (1)',1,'[{\"added\": {}}]',9,2),(3,'2020-01-18 10:42:17.111664','1','Projet object (1)',2,'[]',9,2),(4,'2020-01-18 10:42:23.024956','1','Projet object (1)',2,'[]',9,2),(5,'2020-01-18 10:50:09.872443','2','Copyright object (2)',1,'[{\"added\": {}}]',8,2),(6,'2020-01-18 10:50:14.824417','2','Projet object (2)',1,'[{\"added\": {}}]',9,2),(7,'2020-01-18 11:03:53.082424','2','Projet object (2)',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',9,2),(8,'2020-01-18 11:04:30.225153','2','Projet object (2)',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',9,2),(9,'2020-01-18 11:08:03.208089','2','Projet object (2)',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',9,2),(10,'2020-01-18 11:09:01.911147','2','Projet object (2)',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',9,2),(11,'2020-01-18 11:09:27.931518','2','Projet object (2)',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',9,2),(12,'2020-01-18 11:10:01.827205','2','Projet object (2)',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',9,2),(13,'2020-01-18 14:13:02.881865','3','Copyright object (3)',1,'[{\"added\": {}}]',8,2),(14,'2020-01-18 14:13:13.312796','3','Projet object (3)',1,'[{\"added\": {}}]',9,2),(15,'2020-01-18 16:23:00.171453','3','Projet object (3)',2,'[]',9,2),(16,'2020-01-18 16:52:03.017762','3','user_test',1,'[{\"added\": {}}]',4,2),(17,'2020-01-18 16:52:27.529826','3','user_test',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',4,2),(18,'2020-01-18 16:52:46.702072','2','Projet object (2)',2,'[{\"changed\": {\"fields\": [\"membres\"]}}]',9,2),(19,'2020-01-18 16:59:38.177150','4','user_test2',1,'[{\"added\": {}}]',4,2),(20,'2020-01-18 16:59:55.823965','4','user_test2',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',4,2),(21,'2020-01-18 17:00:07.877577','2','Projet object (2)',2,'[{\"changed\": {\"fields\": [\"membres\"]}}]',9,2),(22,'2020-01-18 18:36:28.183922','2','Projet object (2)',2,'[{\"changed\": {\"fields\": [\"membres\"]}}]',9,2),(23,'2020-01-18 18:37:01.929289','2','Projet object (2)',2,'[{\"changed\": {\"fields\": [\"membres\"]}}]',9,2),(24,'2020-01-18 18:37:15.487278','2','Projet object (2)',2,'[{\"changed\": {\"fields\": [\"membres\"]}}]',9,2),(25,'2020-01-18 18:37:31.505125','2','Projet object (2)',2,'[{\"changed\": {\"fields\": [\"membres\"]}}]',9,2),(26,'2020-01-18 19:12:09.115351','2','Projet object (2)',2,'[{\"changed\": {\"fields\": [\"membres\"]}}]',9,2),(27,'2020-01-19 17:28:14.902780','4','Projet object (4)',1,'[{\"added\": {}}]',9,2),(28,'2020-01-20 10:47:53.204109','7','Projet object (7)',1,'[{\"added\": {}}]',9,2),(29,'2020-01-20 10:48:43.741780','8','Projet object (8)',1,'[{\"added\": {}}]',9,2),(30,'2020-01-20 12:21:50.754480','9','Projet object (9)',1,'[{\"added\": {}}]',9,2),(31,'2020-01-20 12:22:22.895338','10','Projet object (10)',1,'[{\"added\": {}}]',9,2),(32,'2020-01-20 14:41:13.294403','10','Projet object (10)',2,'[{\"changed\": {\"fields\": [\"financement\"]}}]',9,2),(33,'2020-01-20 15:22:47.723610','9','Projet object (9)',2,'[{\"changed\": {\"fields\": [\"financement\"]}}]',9,2),(34,'2020-01-20 16:11:05.666616','1','Commentaire object (1)',1,'[{\"added\": {}}]',11,2),(35,'2020-01-20 16:25:49.107634','2','Commentaire object (2)',1,'[{\"added\": {}}]',11,2),(36,'2020-01-20 16:34:39.372725','2','Projet object (2)',2,'[{\"changed\": {\"fields\": [\"financement\"]}}]',9,2),(37,'2020-01-20 19:10:41.769951','1','Expert object (1)',1,'[{\"added\": {}}]',10,2),(38,'2020-01-20 19:13:42.766785','2','Projet object (2)',2,'[{\"changed\": {\"fields\": [\"experts\"]}}]',9,2),(39,'2020-01-20 19:39:46.603522','1','Expert object (1)',2,'[{\"changed\": {\"fields\": [\"validated_projects\"]}}]',10,2),(40,'2020-01-20 19:53:22.823394','2','Expert object (2)',1,'[{\"added\": {}}]',10,2),(41,'2020-01-20 19:57:40.419237','3','Expert object (3)',1,'[{\"added\": {}}]',10,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'copyright','copyright'),(10,'expert','expert'),(7,'financeurs','financeur'),(12,'financeurs','paiement'),(11,'plateforme','commentaire'),(9,'projet','projet'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-29 10:31:17.132011'),(2,'auth','0001_initial','2019-11-29 10:31:17.270522'),(3,'admin','0001_initial','2019-11-29 10:31:17.594218'),(4,'admin','0002_logentry_remove_auto_add','2019-11-29 10:31:17.676066'),(5,'admin','0003_logentry_add_action_flag_choices','2019-11-29 10:31:17.693008'),(6,'contenttypes','0002_remove_content_type_name','2019-11-29 10:31:17.750173'),(7,'auth','0002_alter_permission_name_max_length','2019-11-29 10:31:17.791020'),(8,'auth','0003_alter_user_email_max_length','2019-11-29 10:31:17.834220'),(9,'auth','0004_alter_user_username_opts','2019-11-29 10:31:17.854625'),(10,'auth','0005_alter_user_last_login_null','2019-11-29 10:31:17.895177'),(11,'auth','0006_require_contenttypes_0002','2019-11-29 10:31:17.898901'),(12,'auth','0007_alter_validators_add_error_messages','2019-11-29 10:31:17.914553'),(13,'auth','0008_alter_user_username_max_length','2019-11-29 10:31:17.948917'),(14,'auth','0009_alter_user_last_name_max_length','2019-11-29 10:31:17.983461'),(15,'auth','0010_alter_group_name_max_length','2019-11-29 10:31:18.028718'),(16,'auth','0011_update_proxy_permissions','2019-11-29 10:31:18.047329'),(17,'sessions','0001_initial','2019-11-29 10:31:18.066762'),(18,'copyright','0001_initial','2019-12-04 10:12:34.620587'),(19,'expert','0001_initial','2019-12-04 10:12:34.668276'),(20,'projet','0001_initial','2019-12-04 10:12:34.807953'),(21,'financeurs','0001_initial','2019-12-04 10:12:35.052629'),(22,'financeurs','0002_auto_20200117_1402','2020-01-17 14:02:35.593325'),(23,'projet','0002_projet_publication_date','2020-01-18 10:41:44.839982'),(24,'projet','0003_auto_20200118_1108','2020-01-18 11:08:39.278117'),(25,'projet','0004_auto_20200118_1415','2020-01-18 14:15:18.048268'),(26,'projet','0005_auto_20200118_1709','2020-01-18 17:09:18.189766'),(27,'projet','0006_auto_20200119_1708','2020-01-19 17:08:30.360703'),(28,'projet','0007_auto_20200119_1723','2020-01-19 17:23:25.688088'),(29,'projet','0008_auto_20200119_1727','2020-01-19 17:27:58.265518'),(30,'plateforme','0001_initial','2020-01-19 17:51:47.933683'),(31,'plateforme','0002_auto_20200118_2324','2020-01-19 18:00:22.423510'),(32,'plateforme','0003_delete_comment','2020-01-19 18:00:22.437628'),(33,'plateforme','0004_comment','2020-01-19 18:00:22.485873'),(34,'plateforme','0005_delete_comment','2020-01-19 18:00:22.563419'),(35,'plateforme','0006_commentaire','2020-01-19 18:00:22.600153'),(36,'projet','0009_projet_financement','2020-01-20 14:32:46.904199'),(37,'plateforme','0007_commentaire_publication_date','2020-01-20 16:31:01.717558'),(38,'expert','0002_auto_20200120_1910','2020-01-20 19:10:16.996726'),(39,'expert','0003_auto_20200120_1911','2020-01-20 19:11:11.213073'),(40,'projet','0010_projet_experts','2020-01-20 19:13:07.535122'),(41,'projet','0011_remove_projet_experts','2020-01-20 19:30:00.196264'),(42,'expert','0004_expert_validated_projects','2020-01-20 19:30:00.218131'),(43,'financeurs','0003_auto_20200121_0158','2020-01-21 09:36:06.901181');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('fthwbyjcpzt1e4ugzh4baomh5ix9pa39','NzhhZDE4NjA3YTQ1M2E4ZWM3ZWM4ZDg0MTgyMWM5N2YxNDA1ZDQ5Nzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Mzc4MDYzZWE4MTYwOTI1YzA0YzNlM2U2YjhmMzJhZDhlMWIzYjQyIn0=','2020-02-04 09:45:48.199660'),('rl96ahyc1m40s8pb4x8pm3i14t4rtve3','NzhhZDE4NjA3YTQ1M2E4ZWM3ZWM4ZDg0MTgyMWM5N2YxNDA1ZDQ5Nzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Mzc4MDYzZWE4MTYwOTI1YzA0YzNlM2U2YjhmMzJhZDhlMWIzYjQyIn0=','2020-02-01 19:12:04.004107'),('ujfc77y22ltkovuno6ylv96txhbalncr','MTM2NGU3OTczMmVjMGNmN2JjYzgxMzU3OTY4NDk3MDI4NzgyNjZlYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI0MDE0YmUzODliMDEwMTI4MTliYjcyNDhiNTdhMDJiMWE3ODY3ODI1In0=','2019-12-13 10:46:57.796636'),('v7mxvp4t04mi1ffisfxz7aadvyfx5vo4','NzhhZDE4NjA3YTQ1M2E4ZWM3ZWM4ZDg0MTgyMWM5N2YxNDA1ZDQ5Nzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Mzc4MDYzZWE4MTYwOTI1YzA0YzNlM2U2YjhmMzJhZDhlMWIzYjQyIn0=','2020-02-04 09:54:52.307959');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expert_expert`
--

DROP TABLE IF EXISTS `expert_expert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expert_expert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `karma` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `utilisateur_id` (`utilisateur_id`),
  CONSTRAINT `expert_expert_utilisateur_id_cda731e8_fk_auth_user_id` FOREIGN KEY (`utilisateur_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expert_expert`
--

LOCK TABLES `expert_expert` WRITE;
/*!40000 ALTER TABLE `expert_expert` DISABLE KEYS */;
INSERT INTO `expert_expert` VALUES (1,25,4),(2,10,2),(3,100,6);
/*!40000 ALTER TABLE `expert_expert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expert_expert_validated_projects`
--

DROP TABLE IF EXISTS `expert_expert_validated_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expert_expert_validated_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expert_id` int(11) NOT NULL,
  `projet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `expert_expert_validated__expert_id_projet_id_59ec9ef2_uniq` (`expert_id`,`projet_id`),
  KEY `expert_expert_valida_projet_id_2fa36424_fk_projet_pr` (`projet_id`),
  CONSTRAINT `expert_expert_valida_expert_id_2be7a518_fk_expert_ex` FOREIGN KEY (`expert_id`) REFERENCES `expert_expert` (`id`),
  CONSTRAINT `expert_expert_valida_projet_id_2fa36424_fk_projet_pr` FOREIGN KEY (`projet_id`) REFERENCES `projet_projet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expert_expert_validated_projects`
--

LOCK TABLES `expert_expert_validated_projects` WRITE;
/*!40000 ALTER TABLE `expert_expert_validated_projects` DISABLE KEYS */;
INSERT INTO `expert_expert_validated_projects` VALUES (1,1,2),(5,1,9),(4,2,1),(2,2,2),(3,3,2);
/*!40000 ALTER TABLE `expert_expert_validated_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financeurs_financeur`
--

DROP TABLE IF EXISTS `financeurs_financeur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financeurs_financeur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `utilisateur_id` (`utilisateur_id`),
  CONSTRAINT `financeurs_financeur_utilisateur_id_d80955c8_fk_auth_user_id` FOREIGN KEY (`utilisateur_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financeurs_financeur`
--

LOCK TABLES `financeurs_financeur` WRITE;
/*!40000 ALTER TABLE `financeurs_financeur` DISABLE KEYS */;
INSERT INTO `financeurs_financeur` VALUES (1,4);
/*!40000 ALTER TABLE `financeurs_financeur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financeurs_financeur_paiments`
--

DROP TABLE IF EXISTS `financeurs_financeur_paiments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financeurs_financeur_paiments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `financeur_id` int(11) NOT NULL,
  `paiement_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `financeurs_financeur_pai_financeur_id_paiement_id_c186f0b8_uniq` (`financeur_id`,`paiement_id`),
  KEY `financeurs_financeur_paiement_id_ba689818_fk_financeur` (`paiement_id`),
  CONSTRAINT `financeurs_financeur_financeur_id_ff371be9_fk_financeur` FOREIGN KEY (`financeur_id`) REFERENCES `financeurs_financeur` (`id`),
  CONSTRAINT `financeurs_financeur_paiement_id_ba689818_fk_financeur` FOREIGN KEY (`paiement_id`) REFERENCES `financeurs_paiement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financeurs_financeur_paiments`
--

LOCK TABLES `financeurs_financeur_paiments` WRITE;
/*!40000 ALTER TABLE `financeurs_financeur_paiments` DISABLE KEYS */;
/*!40000 ALTER TABLE `financeurs_financeur_paiments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financeurs_financeur_projetsfinances`
--

DROP TABLE IF EXISTS `financeurs_financeur_projetsfinances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financeurs_financeur_projetsfinances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `financeur_id` int(11) NOT NULL,
  `projet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `financeurs_financeur_pro_financeur_id_projet_id_ec8d1850_uniq` (`financeur_id`,`projet_id`),
  KEY `financeurs_financeur_projet_id_78411391_fk_projet_pr` (`projet_id`),
  CONSTRAINT `financeurs_financeur_financeur_id_2544a2b3_fk_financeur` FOREIGN KEY (`financeur_id`) REFERENCES `financeurs_financeur` (`id`),
  CONSTRAINT `financeurs_financeur_projet_id_78411391_fk_projet_pr` FOREIGN KEY (`projet_id`) REFERENCES `projet_projet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financeurs_financeur_projetsfinances`
--

LOCK TABLES `financeurs_financeur_projetsfinances` WRITE;
/*!40000 ALTER TABLE `financeurs_financeur_projetsfinances` DISABLE KEYS */;
INSERT INTO `financeurs_financeur_projetsfinances` VALUES (1,1,4);
/*!40000 ALTER TABLE `financeurs_financeur_projetsfinances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financeurs_paiement`
--

DROP TABLE IF EXISTS `financeurs_paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financeurs_paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `date_paiement` datetime(6) NOT NULL,
  `montant` double NOT NULL,
  `projet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `financeurs_paiement_projet_id_f4f1db47_fk_projet_projet_id` (`projet_id`),
  CONSTRAINT `financeurs_paiement_projet_id_f4f1db47_fk_projet_projet_id` FOREIGN KEY (`projet_id`) REFERENCES `projet_projet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financeurs_paiement`
--

LOCK TABLES `financeurs_paiement` WRITE;
/*!40000 ALTER TABLE `financeurs_paiement` DISABLE KEYS */;
INSERT INTO `financeurs_paiement` VALUES (1,4,'2020-01-21 09:43:23.489628',2,4);
/*!40000 ALTER TABLE `financeurs_paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plateforme_commentaire`
--

DROP TABLE IF EXISTS `plateforme_commentaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plateforme_commentaire` (
  `auto_increment_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(2500) NOT NULL,
  `projet_id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `publication_date` datetime(6) NOT NULL,
  PRIMARY KEY (`auto_increment_id`),
  KEY `plateforme_commentaire_projet_id_f0602248_fk_projet_projet_id` (`projet_id`),
  KEY `plateforme_commentaire_utilisateur_id_57c0780d_fk_auth_user_id` (`utilisateur_id`),
  CONSTRAINT `plateforme_commentaire_projet_id_f0602248_fk_projet_projet_id` FOREIGN KEY (`projet_id`) REFERENCES `projet_projet` (`id`),
  CONSTRAINT `plateforme_commentaire_utilisateur_id_57c0780d_fk_auth_user_id` FOREIGN KEY (`utilisateur_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plateforme_commentaire`
--

LOCK TABLES `plateforme_commentaire` WRITE;
/*!40000 ALTER TABLE `plateforme_commentaire` DISABLE KEYS */;
INSERT INTO `plateforme_commentaire` VALUES (1,'c\'est trop cool',2,6,'2020-01-20 16:31:01.661484'),(2,'de la merde ce projet',2,4,'2020-01-20 16:31:01.661484'),(3,'yes',2,2,'2020-01-20 16:47:55.220240'),(4,'yes',2,2,'2020-01-20 16:48:52.488999'),(5,'coucou',2,2,'2020-01-20 16:50:42.705466'),(6,'hello\r\nbite',2,2,'2020-01-20 16:51:00.909070'),(7,'top',2,2,'2020-01-20 16:55:32.174278'),(8,'coucou\r\ncomment ça va',2,2,'2020-01-20 17:04:25.188150');
/*!40000 ALTER TABLE `plateforme_commentaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projet_projet`
--

DROP TABLE IF EXISTS `projet_projet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projet_projet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  `montant` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `copyright_id` int(11) DEFAULT NULL,
  `publication_date` datetime(6) NOT NULL,
  `financement` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `license_id` (`copyright_id`),
  CONSTRAINT `projet_projet_copyright_id_e04cf7f6_fk_copyright_copyright_id` FOREIGN KEY (`copyright_id`) REFERENCES `copyright_copyright` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projet_projet`
--

LOCK TABLES `projet_projet` WRITE;
/*!40000 ALTER TABLE `projet_projet` DISABLE KEYS */;
INSERT INTO `projet_projet` VALUES (1,'Projet1',1000,'blabla',1,'2020-01-18 10:41:44.000000',0),(2,'Superprojet',10,'a z e r t y u i o p q s d f g h j top cool trop bien yessssssssss blabla je suis une longue description pour voir si le texte est bien coupé au bout d\'un moment pour pas avoir une description trop longue sur la page qui liste les projets comprend tu ? donc j\'ajoute des mots pour testerrrrrrrrrrrrrrrrrrrrr',2,'2020-01-18 10:48:35.000000',1),(3,'blabla',5000,'hduflijlkkl,c fesutrfgli:lk',3,'2020-01-18 14:11:38.000000',0),(4,'ppppppppppp',2,'blabla',NULL,'2020-01-19 17:28:03.000000',2),(5,'',50,'projo',NULL,'2020-01-19 17:28:34.760289',0),(6,'mm',50,'mm',NULL,'2020-01-19 17:29:40.861582',0),(7,'projet12',1,'bite',NULL,'2020-01-20 10:47:36.000000',0),(8,'titi la pute',2,'titi du cul',NULL,'2020-01-20 10:48:21.000000',0),(9,'pp',2,'pp',NULL,'2020-01-20 12:21:37.000000',1),(10,'ppp',1000,'lsdlsk',NULL,'2020-01-20 12:22:11.000000',1000);
/*!40000 ALTER TABLE `projet_projet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projet_projet_membres`
--

DROP TABLE IF EXISTS `projet_projet_membres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projet_projet_membres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projet_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projet_projet_membres_projet_id_user_id_cd264998_uniq` (`projet_id`,`user_id`),
  KEY `projet_projet_membres_user_id_a15233d3_fk_auth_user_id` (`user_id`),
  CONSTRAINT `projet_projet_membres_projet_id_f7651270_fk_projet_projet_id` FOREIGN KEY (`projet_id`) REFERENCES `projet_projet` (`id`),
  CONSTRAINT `projet_projet_membres_user_id_a15233d3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projet_projet_membres`
--

LOCK TABLES `projet_projet_membres` WRITE;
/*!40000 ALTER TABLE `projet_projet_membres` DISABLE KEYS */;
INSERT INTO `projet_projet_membres` VALUES (1,1,1),(7,2,3),(8,2,4),(6,2,5),(9,2,6),(3,3,1),(10,4,6),(11,7,6),(12,8,6),(13,9,6),(14,10,6);
/*!40000 ALTER TABLE `projet_projet_membres` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-21 11:30:00
