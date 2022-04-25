-- MySQL dump 10.13  Distrib 5.6.50, for Linux (x86_64)
--
-- Host: localhost    Database: svnadmin
-- ------------------------------------------------------
-- Server version	5.6.50-log

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
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `admin_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `admin_user_name` varchar(45) NOT NULL COMMENT '用户名',
  `admin_user_password` varchar(45) NOT NULL COMMENT '用户密码',
  `admin_user_phone` char(11) DEFAULT NULL COMMENT '用户手机号',
  `admin_user_email` varchar(45) DEFAULT NULL COMMENT '用户邮箱',
  `admin_user_salt` varchar(45) NOT NULL COMMENT '盐值',
  PRIMARY KEY (`admin_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理系统用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `black_token`
--

DROP TABLE IF EXISTS `black_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `black_token` (
  `token_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'tokenid',
  `token` varchar(200) NOT NULL COMMENT 'token内容',
  `start_time` varchar(45) NOT NULL COMMENT 'token的生效时间',
  `end_time` varchar(45) NOT NULL COMMENT 'token的失效时间',
  `insert_time` varchar(45) NOT NULL COMMENT '注销时间',
  PRIMARY KEY (`token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='黑名单token 意思为用户注销后尚未达到过期时间的token将会被加入此黑名单 通过定时的主动扫描来去除过期的token 达到注销即安全的目的';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `black_token`
--

LOCK TABLES `black_token` WRITE;
/*!40000 ALTER TABLE `black_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `black_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `log_type_name` varchar(200) NOT NULL COMMENT '日志类型',
  `log_content` varchar(5000) NOT NULL COMMENT '日志内容',
  `log_add_user_name` varchar(200) NOT NULL COMMENT '操作人',
  `log_add_time` varchar(45) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `svn_groups`
--

DROP TABLE IF EXISTS `svn_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `svn_groups` (
  `svn_group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分组id',
  `svn_group_name` varchar(200) NOT NULL COMMENT '分组名称',
  `include_user_count` int(11) NOT NULL,
  `include_group_count` int(11) NOT NULL,
  `svn_group_note` varchar(1000) DEFAULT NULL COMMENT '分组备注信息',
  PRIMARY KEY (`svn_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SVN分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `svn_groups`
--

LOCK TABLES `svn_groups` WRITE;
/*!40000 ALTER TABLE `svn_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `svn_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `svn_reps`
--

DROP TABLE IF EXISTS `svn_reps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `svn_reps` (
  `rep_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库id',
  `rep_name` varchar(1000) NOT NULL COMMENT '仓库名称',
  `rep_size` double DEFAULT NULL COMMENT '仓库体积',
  `rep_note` varchar(1000) DEFAULT NULL COMMENT '仓库备注',
  `rep_rev` int(11) DEFAULT NULL COMMENT '仓库修订版本',
  `rep_uuid` varchar(45) DEFAULT NULL COMMENT '仓库UUID',
  PRIMARY KEY (`rep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `svn_reps`
--

LOCK TABLES `svn_reps` WRITE;
/*!40000 ALTER TABLE `svn_reps` DISABLE KEYS */;
/*!40000 ALTER TABLE `svn_reps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `svn_users`
--

DROP TABLE IF EXISTS `svn_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `svn_users` (
  `svn_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `svn_user_name` varchar(200) NOT NULL COMMENT '用户名',
  `svn_user_pass` varchar(200) NOT NULL COMMENT '用户密码',
  `svn_user_status` int(1) NOT NULL COMMENT '用户启用状态\n0 禁用\n1 启用',
  `svn_user_note` varchar(1000) DEFAULT NULL COMMENT '用户备注信息',
  PRIMARY KEY (`svn_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='svn用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `svn_users`
--

LOCK TABLES `svn_users` WRITE;
/*!40000 ALTER TABLE `svn_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `svn_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification_code`
--

DROP TABLE IF EXISTS `verification_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verification_code` (
  `code_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(45) NOT NULL COMMENT '每次验证码请求的唯一标识',
  `code` varchar(45) NOT NULL COMMENT '验证码',
  `start_time` varchar(45) NOT NULL COMMENT '有效开始时间',
  `end_time` varchar(45) NOT NULL COMMENT '失效时间',
  `insert_time` varchar(45) NOT NULL COMMENT '插入时间',
  PRIMARY KEY (`code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='验证码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification_code`
--

LOCK TABLES `verification_code` WRITE;
/*!40000 ALTER TABLE `verification_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `verification_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'svnadmin'
--

--
-- Dumping routines for database 'svnadmin'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-23 15:07:58
