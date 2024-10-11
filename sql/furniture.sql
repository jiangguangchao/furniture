-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: furniture
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `code` varchar(32) NOT NULL COMMENT '行政区划代码',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `pCode` char(12) DEFAULT NULL COMMENT '父级行政区划代码',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES ('411723','平舆县','-1'),('411723001','古槐街道','411723'),('411723002','清河街道','411723'),('411723003','东皇街道','411723'),('411723101','杨埠镇','411723'),('411723102','东和店镇','411723'),('411723103','庙湾镇','411723'),('411723103001','庙湾村委','411723103'),('411723103201','龙王庙村委','411723103'),('411723103202','大卢村委','411723103'),('411723103203','里湾村委','411723103'),('411723103204','大杨村委','411723103'),('411723103205','念张村委','411723103'),('411723103206','郑楼村委','411723103'),('411723103207','代关庙村委','411723103'),('411723103208','余楼村委','411723103'),('411723103209','八里夏村委','411723103'),('411723103210','李寨村委','411723103'),('411723103211','冯庄村委','411723103'),('411723103212','黑田村委','411723103'),('411723103213','赵庄村委','411723103'),('411723104','射桥镇','411723'),('411723105','西洋店镇','411723'),('411723106','阳城镇','411723'),('411723107','郭楼镇','411723'),('411723108','李屯镇','411723'),('411723109','万金店镇','411723'),('411723201','高杨店乡','411723'),('411723202','十宇路乡','411723'),('411723204','万家乡','411723'),('411723205','玉皇庙乡','411723');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;

--
-- Table structure for table `furniture_category`
--

DROP TABLE IF EXISTS `furniture_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `furniture_category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '类别编号',
  `category` varchar(255) NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `furniture_category`
--

/*!40000 ALTER TABLE `furniture_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `furniture_category` ENABLE KEYS */;

--
-- Table structure for table `furniture_order`
--

DROP TABLE IF EXISTS `furniture_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `furniture_order` (
  `id` varchar(32) NOT NULL,
  `total_money` decimal(7,2) NOT NULL COMMENT '总金额',
  `paid_money` decimal(7,2) NOT NULL COMMENT '已支付金额',
  `order_status` varchar(8) NOT NULL DEFAULT '0' COMMENT '0-未开始 1-待配送 2-配送中 3-已配送 5-已完成 10-已取消',
  `order_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `order_user` varchar(64) NOT NULL COMMENT '下单人',
  `phone_number` varchar(64) NOT NULL COMMENT '下单人联系电话',
  `district` varchar(32) NOT NULL COMMENT '区县',
  `town` varchar(32) NOT NULL COMMENT '乡镇',
  `village` varchar(32) NOT NULL COMMENT '村委',
  `dui` smallint DEFAULT NULL COMMENT '几队',
  `sub_village` varchar(32) DEFAULT NULL COMMENT '村庄',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(32) NOT NULL COMMENT '创建人',
  `remark` text COMMENT '备注',
  `payment_status` varchar(8) NOT NULL COMMENT '支付状态',
  `delivery_status` varchar(8) NOT NULL COMMENT '配送状态',
  `include_custom` varchar(8) NOT NULL COMMENT '是否包含定做家具',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `furniture_order`
--

/*!40000 ALTER TABLE `furniture_order` DISABLE KEYS */;
INSERT INTO `furniture_order` VALUES ('20240918161051',2100.00,0.00,'1','2024-09-18 00:00:00','111279','111','411723','411723103','411723103001',1,'2','2024-09-18 16:10:52','admin','3','0','0','N');
/*!40000 ALTER TABLE `furniture_order` ENABLE KEYS */;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (1,'furniture_order','家具订单',NULL,NULL,'FurnitureOrder','crud','element-plus','com.ruoyi.jgc','order','furnitureOrder','家具订单','ruoyi','0','/','{\"parentMenuId\":2000}','admin','2024-09-18 14:49:28','','2024-09-18 15:06:48',NULL),(2,'districts','',NULL,NULL,'Districts','crud','','com.ruoyi.system','system','districts',NULL,'ruoyi','0','/',NULL,'admin','2024-09-18 14:50:46','',NULL,NULL),(3,'furniture_category','',NULL,NULL,'FurnitureCategory','crud','','com.ruoyi.system','system','category',NULL,'ruoyi','0','/',NULL,'admin','2024-09-18 14:50:46','',NULL,NULL),(4,'order_delivery_record','订单配送记录',NULL,NULL,'OrderDeliveryRecord','crud','element-plus','com.ruoyi.jgc','order','deliveryRecord','配送记录','ruoyi','0','/','{\"parentMenuId\":\"2000\"}','admin','2024-09-18 14:50:46','','2024-09-19 14:16:20',NULL),(6,'payment_record','支付记录表',NULL,NULL,'PaymentRecord','crud','element-plus','com.ruoyi.jgc','order','paymentRecord','支付记录','ruoyi','0','/','{\"parentMenuId\":\"2000\"}','admin','2024-09-18 14:50:46','','2024-09-19 14:16:09',NULL),(7,'work_record','工作记录表',NULL,NULL,'WorkRecord','crud','element-plus','com.ruoyi.jgc','work','workRecord','工作记录','jgc','0','/','{\"parentMenuId\":2026}','admin','2024-09-18 14:50:46','','2024-09-20 16:49:45',NULL),(8,'order_furniture','订单中家具',NULL,NULL,'OrderFurniture','crud','element-plus','com.ruoyi.jgc','order','orderFurniture','订单中家具','ruoyi','0','/','{\"parentMenuId\":\"\"}','admin','2024-09-18 15:14:14','','2024-09-19 14:17:55',NULL),(9,'order_statistics','订单统计表',NULL,NULL,'OrderStatistics','crud','element-plus','com.ruoyi.system','statistics','orderStatistics','订单统计','jgc','0','/','{\"parentMenuId\":2033}','admin','2024-09-29 10:26:44','','2024-09-29 11:34:40',NULL),(10,'purchase_order','进货单',NULL,NULL,'PurchaseOrder','crud','element-plus','com.ruoyi.jgc','purchase','purchaseOrder','进货单','jgc','0','/','{\"parentMenuId\":2034}','admin','2024-09-29 10:26:44','','2024-09-29 11:34:55',NULL),(11,'todos','待办事项',NULL,NULL,'Todos','crud','element-plus','com.ruoyi.jgc','order','todos','待办事项','jgc','0','/','{\"parentMenuId\":\"2000\"}','admin','2024-09-29 10:26:44','','2024-09-29 11:30:57',NULL),(12,'upload_file','',NULL,NULL,'UploadFile','crud','','com.ruoyi.system','system','file',NULL,'ruoyi','0','/',NULL,'admin','2024-09-29 10:26:44','',NULL,NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb3 COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (1,1,'id',NULL,'varchar(32)','String','id','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-09-18 14:49:28','','2024-09-18 15:06:48'),(2,1,'total_money','总金额','decimal(7,2)','BigDecimal','totalMoney','0','0','1','1','1','1','1','EQ','input','',2,'admin','2024-09-18 14:49:28','','2024-09-18 15:06:48'),(3,1,'paid_money','已支付金额','decimal(7,2)','BigDecimal','paidMoney','0','0','1','1','1','1','1','EQ','input','',3,'admin','2024-09-18 14:49:28','','2024-09-18 15:06:48'),(4,1,'order_status','0-未开始 1-待配送 2-配送中 3-已配送 5-已完成 10-已取消','varchar(8)','String','orderStatus','0','0','1','1','1','1','1','EQ','radio','',4,'admin','2024-09-18 14:49:28','','2024-09-18 15:06:48'),(5,1,'order_time','下单时间','datetime','Date','orderTime','0','0','1','1','1','1','1','EQ','datetime','',5,'admin','2024-09-18 14:49:28','','2024-09-18 15:06:48'),(6,1,'order_user','下单人','varchar(64)','String','orderUser','0','0','1','1','1','1','1','EQ','input','',6,'admin','2024-09-18 14:49:28','','2024-09-18 15:06:48'),(7,1,'phone_number','下单人联系电话','varchar(64)','String','phoneNumber','0','0','1','1','1','1','1','EQ','input','',7,'admin','2024-09-18 14:49:28','','2024-09-18 15:06:48'),(8,1,'district','区县','varchar(32)','String','district','0','0','1','1','1','1','1','EQ','input','',8,'admin','2024-09-18 14:49:28','','2024-09-18 15:06:48'),(9,1,'town','乡镇','varchar(32)','String','town','0','0','1','1','1','1','1','EQ','input','',9,'admin','2024-09-18 14:49:28','','2024-09-18 15:06:48'),(10,1,'village','村委','varchar(32)','String','village','0','0','1','1','1','1','1','EQ','input','',10,'admin','2024-09-18 14:49:28','','2024-09-18 15:06:48'),(11,1,'dui','几队','smallint','Long','dui','0','0','0','1','1','1','1','EQ','input','',11,'admin','2024-09-18 14:49:28','','2024-09-18 15:06:48'),(12,1,'sub_village','村庄','varchar(32)','String','subVillage','0','0','0','1','1','1','1','EQ','input','',12,'admin','2024-09-18 14:49:28','','2024-09-18 15:06:48'),(13,1,'create_time','创建时间','datetime','Date','createTime','0','0','1','1',NULL,NULL,NULL,'EQ','datetime','',13,'admin','2024-09-18 14:49:28','','2024-09-18 15:06:48'),(14,1,'create_user','创建人','varchar(32)','String','createUser','0','0','1','1','1','1','1','EQ','input','',14,'admin','2024-09-18 14:49:28','','2024-09-18 15:06:48'),(15,1,'remark','备注','text','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',15,'admin','2024-09-18 14:49:28','','2024-09-18 15:06:48'),(16,2,'code','行政区划代码','varchar(32)','String','code','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-09-18 14:50:46','',NULL),(17,2,'name','名称','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-09-18 14:50:46','',NULL),(18,2,'pCode','父级行政区划代码','char(12)','String','pCode','0','0','0','1','1','1','1','EQ','input','',3,'admin','2024-09-18 14:50:46','',NULL),(19,3,'id','类别编号','int','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-09-18 14:50:46','',NULL),(20,3,'category','类别名称','varchar(255)','String','category','0','0','1','1','1','1','1','EQ','input','',2,'admin','2024-09-18 14:50:46','',NULL),(21,4,'id','配送编号','int','Long','id','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:20'),(22,4,'order_id','订单号','varchar(32)','String','orderId','0','0','1','0','0','1','1','EQ','input','',2,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:20'),(23,4,'delivery_time','配送时间','datetime','Date','deliveryTime','0','0','1','1','1','1','1','EQ','datetime','',3,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:20'),(24,4,'delivery_status','配送状态','varchar(64)','String','deliveryStatus','0','0','1','1','1','1','1','EQ','radio','delivery_status',4,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:20'),(25,4,'create_by','创建者','varchar(64)','String','createBy','0','0','0','0',NULL,'1',NULL,'EQ','input','',5,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:20'),(26,4,'create_time','创建时间','datetime','Date','createTime','0','0','0','0',NULL,'1',NULL,'EQ','datetime','',6,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:20'),(27,4,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','0','1','1',NULL,'EQ','input','',7,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:20'),(28,4,'update_time','更新时间','datetime','Date','updateTime','0','0','0','0','1','1',NULL,'EQ','datetime','',8,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:20'),(29,4,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',9,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:20'),(43,6,'id','支付记录编号','int','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:09'),(44,6,'order_id','订单编号','varchar(32)','String','orderId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:09'),(45,6,'payment_time','支付时间','datetime','Date','paymentTime','0','0','1','1','1','1','1','EQ','datetime','',3,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:09'),(46,6,'payment_method','支付方式','varchar(20)','String','paymentMethod','0','0','1','1','1','1','1','EQ','input','',4,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:09'),(47,6,'payment_amount','支付金额','decimal(10,2)','BigDecimal','paymentAmount','0','0','1','1','1','1','1','EQ','input','',5,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:09'),(48,6,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,'1',NULL,'EQ','input','',6,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:09'),(49,6,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,'1',NULL,'EQ','datetime','',7,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:09'),(50,6,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1','1',NULL,'EQ','input','',8,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:10'),(51,6,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1','1',NULL,'EQ','datetime','',9,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:10'),(52,6,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',10,'admin','2024-09-18 14:50:46','','2024-09-19 14:16:10'),(53,7,'id','记录编号','int','Long','id','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-09-18 14:50:46','','2024-09-20 16:49:45'),(54,7,'worker_id','员工编号','bigint','Long','workerId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2024-09-18 14:50:46','','2024-09-20 16:49:45'),(55,7,'work_date','工作日期','date','Date','workDate','0','0','1','1','1','1','1','BETWEEN','datetime','',3,'admin','2024-09-18 14:50:46','','2024-09-20 16:49:45'),(56,7,'work_period','工作时间段','varchar(64)','String','workPeriod','0','0','0','1','1','1','1','EQ','select','work_period',4,'admin','2024-09-18 14:50:46','','2024-09-20 16:49:45'),(57,7,'delivery_time','配送时间','time','Date','deliveryTime','0','0','0','1','1','1','0','EQ','datetime','',5,'admin','2024-09-18 14:50:46','','2024-09-20 16:49:45'),(58,7,'order_id','订单编号','varchar(32)','String','orderId','0','0','0','1','1','1','1','EQ','input','',6,'admin','2024-09-18 14:50:46','','2024-09-20 16:49:45'),(59,7,'salary','报酬','decimal(5,2)','BigDecimal','salary','0','0','1','1','1','1','1','EQ','input','',7,'admin','2024-09-18 14:50:46','','2024-09-20 16:49:45'),(60,7,'overtime_pay','加班费','decimal(5,2)','BigDecimal','overtimePay','0','0','1','1','1','1','1','EQ','input','',8,'admin','2024-09-18 14:50:46','','2024-09-20 16:49:45'),(61,7,'create_by','创建者','varchar(64)','String','createBy','0','0','0','0',NULL,'0',NULL,'EQ','input','',9,'admin','2024-09-18 14:50:46','','2024-09-20 16:49:45'),(62,7,'create_time','创建时间','datetime','Date','createTime','0','0','0','0',NULL,NULL,NULL,'EQ','datetime','',10,'admin','2024-09-18 14:50:46','','2024-09-20 16:49:45'),(63,7,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','0','1',NULL,NULL,'EQ','input','',11,'admin','2024-09-18 14:50:46','','2024-09-20 16:49:45'),(64,7,'update_time','更新时间','datetime','Date','updateTime','0','0','0','0','1',NULL,NULL,'EQ','datetime','',12,'admin','2024-09-18 14:50:46','','2024-09-20 16:49:45'),(65,7,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',13,'admin','2024-09-18 14:50:46','','2024-09-20 16:49:45'),(66,8,'id',NULL,'int','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-09-18 15:14:14','','2024-09-19 14:17:55'),(67,8,'order_id','订单号','int','Long','orderId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2024-09-18 15:14:14','','2024-09-19 14:17:55'),(68,8,'category','家具类别','varchar(255)','String','category','0','0','1','1','1','1','1','EQ','select','fruniture_category',3,'admin','2024-09-18 15:14:14','','2024-09-19 14:17:55'),(69,8,'style','款式','varchar(255)','String','style','0','0','0','1','1','1','1','EQ','input','',4,'admin','2024-09-18 15:14:14','','2024-09-19 14:17:55'),(70,8,'material','材质','varchar(255)','String','material','0','0','0','1','1','1','1','EQ','select','furniture_material',5,'admin','2024-09-18 15:14:14','','2024-09-19 14:17:55'),(71,8,'size','尺寸','decimal(4,2)','BigDecimal','size','0','0','0','1','1','1','1','EQ','input','',6,'admin','2024-09-18 15:14:14','','2024-09-19 14:17:55'),(72,8,'bed_width','床宽','varchar(64)','String','bedWidth','0','0','0','1','1','1','1','EQ','select','bed_width',7,'admin','2024-09-18 15:14:14','','2024-09-19 14:17:55'),(73,8,'money','金额','decimal(7,2)','BigDecimal','money','0','0','0','1','1','1','1','EQ','input','',8,'admin','2024-09-18 15:14:14','','2024-09-19 14:17:55'),(74,8,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,'1',NULL,'EQ','input','',9,'admin','2024-09-18 15:14:14','','2024-09-19 14:17:55'),(75,8,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,'1',NULL,'EQ','datetime','',10,'admin','2024-09-18 15:14:14','','2024-09-19 14:17:55'),(76,8,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1','1',NULL,'EQ','input','',11,'admin','2024-09-18 15:14:14','','2024-09-19 14:17:55'),(77,8,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1','1',NULL,'EQ','datetime','',12,'admin','2024-09-18 15:14:14','','2024-09-19 14:17:55'),(78,8,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',13,'admin','2024-09-18 15:14:14','','2024-09-19 14:17:55'),(79,9,'id',NULL,'int','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-09-29 10:26:44','','2024-09-29 11:34:40'),(80,9,'statc_date','统计日期','varchar(8)','String','statcDate','0','0','1','1','1','1','1','EQ','input','',2,'admin','2024-09-29 10:26:44','','2024-09-29 11:34:40'),(81,9,'date_type','日期类型','varchar(8)','String','dateType','0','0','1','1','1','1','1','EQ','select','',3,'admin','2024-09-29 10:26:44','','2024-09-29 11:34:40'),(82,9,'data_type','数据类型','varchar(8)','String','dataType','0','0','1','1','1','1','1','EQ','select','',4,'admin','2024-09-29 10:26:44','','2024-09-29 11:34:40'),(83,9,'statc_value','统计值','int','Long','statcValue','0','0','1','1','1','1','0','EQ','input','',5,'admin','2024-09-29 10:26:44','','2024-09-29 11:34:40'),(84,10,'id','编号','int','Long','id','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-09-29 10:26:44','','2024-09-29 11:34:55'),(85,10,'supplier','供货方','varchar(64)','String','supplier','0','0','1','1','1','1','0','EQ','input','',2,'admin','2024-09-29 10:26:44','','2024-09-29 11:34:55'),(86,10,'purchase_date','日期','date','Date','purchaseDate','0','0','1','1','1','1','1','BETWEEN','datetime','',3,'admin','2024-09-29 10:26:44','','2024-09-29 11:34:55'),(87,10,'arrival_status','到货状态','varchar(8)','String','arrivalStatus','0','0','1','1','1','1','1','EQ','radio','purchase_arrival_status',4,'admin','2024-09-29 10:26:44','','2024-09-29 11:34:55'),(88,10,'phone','手机','varchar(32)','String','phone','0','0','0','1','1','1','0','EQ','input','',5,'admin','2024-09-29 10:26:44','','2024-09-29 11:34:55'),(89,10,'weichat','微信','varchar(64)','String','weichat','0','0','0','1','1','1','0','EQ','input','',6,'admin','2024-09-29 10:26:44','','2024-09-29 11:34:55'),(90,10,'order_list','货单','json','String','orderList','0','0','0','1','1','1','0','EQ',NULL,'',7,'admin','2024-09-29 10:26:44','','2024-09-29 11:34:55'),(91,10,'total_amount','总金额','decimal(10,2)','BigDecimal','totalAmount','0','0','0','1','1','1','0','EQ','input','',8,'admin','2024-09-29 10:26:44','','2024-09-29 11:34:55'),(92,10,'remarks','备注','varchar(1024)','String','remarks','0','0','0','1','1','1','0','EQ','textarea','',9,'admin','2024-09-29 10:26:44','','2024-09-29 11:34:55'),(93,11,'id','编号','int','Long','id','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-09-29 10:26:44','','2024-09-29 11:30:57'),(94,11,'title','标题','varchar(255)','String','title','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-09-29 10:26:44','','2024-09-29 11:30:57'),(95,11,'content','详细内容','varchar(1024)','String','content','0','0','0','1','1','1','0','EQ','editor','',3,'admin','2024-09-29 10:26:44','','2024-09-29 11:30:57'),(96,11,'status','状态','varchar(8)','String','status','0','0','1','1','1','1','1','EQ','radio','todo_status',4,'admin','2024-09-29 10:26:44','','2024-09-29 11:30:57'),(97,11,'priority','优先级','varchar(8)','String','priority','0','0','1','1','1','1','1','EQ','select','todo_priority',5,'admin','2024-09-29 10:26:44','','2024-09-29 11:30:57'),(98,11,'category','分类','varchar(8)','String','category','0','0','0','1','1','1','1','EQ','input','',6,'admin','2024-09-29 10:26:44','','2024-09-29 11:30:57'),(99,11,'user_name','联系人','varchar(64)','String','userName','0','0','0','1','1','1','0','LIKE','input','',7,'admin','2024-09-29 10:26:44','','2024-09-29 11:30:57'),(100,11,'phone','联系电话','varchar(16)','String','phone','0','0','0','1','1','1','0','EQ','input','',8,'admin','2024-09-29 10:26:44','','2024-09-29 11:30:57'),(101,11,'address','地址','varchar(255)','String','address','0','0','0','1','1','1','0','EQ','input','',9,'admin','2024-09-29 10:26:44','','2024-09-29 11:30:57'),(102,11,'order_id','关联订单号','bigint','Long','orderId','0','0','0','1','0','1','0','EQ','input','',10,'admin','2024-09-29 10:26:44','','2024-09-29 11:30:58'),(103,11,'create_by','创建者','varchar(64)','String','createBy','0','0','0','0',NULL,NULL,NULL,'EQ','input','',11,'admin','2024-09-29 10:26:44','','2024-09-29 11:30:58'),(104,11,'create_time','创建时间','datetime','Date','createTime','0','0','0','0',NULL,NULL,NULL,'EQ','datetime','',12,'admin','2024-09-29 10:26:44','','2024-09-29 11:30:58'),(105,11,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','0','0',NULL,NULL,'EQ','input','',13,'admin','2024-09-29 10:26:44','','2024-09-29 11:30:58'),(106,11,'update_time','更新时间','datetime','Date','updateTime','0','0','0','0','0',NULL,NULL,'EQ','datetime','',14,'admin','2024-09-29 10:26:44','','2024-09-29 11:30:58'),(107,11,'remark','备注','varchar(1024)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',15,'admin','2024-09-29 10:26:44','','2024-09-29 11:30:58'),(108,12,'id',NULL,'int','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-09-29 10:26:44','',NULL),(109,12,'association_id','关联id','bigint','Long','associationId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2024-09-29 10:26:44','',NULL),(110,12,'association_type','关联类型','varchar(8)','String','associationType','0','0','1','1','1','1','1','EQ','select','',3,'admin','2024-09-29 10:26:44','',NULL),(111,12,'file_type','文件类型','varchar(255)','String','fileType','0','0','1','1','1','1','1','EQ','select','',4,'admin','2024-09-29 10:26:44','',NULL),(112,12,'file_name','文件名','varchar(255)','String','fileName','0','0','1','1','1','1','1','LIKE','input','',5,'admin','2024-09-29 10:26:44','',NULL),(113,12,'file_path','文件路径','varchar(255)','String','filePath','0','0','1','1','1','1','1','EQ','input','',6,'admin','2024-09-29 10:26:44','',NULL),(114,12,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',7,'admin','2024-09-29 10:26:44','',NULL),(115,12,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',8,'admin','2024-09-29 10:26:44','',NULL);
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;

--
-- Table structure for table `order_delivery_record`
--

DROP TABLE IF EXISTS `order_delivery_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_delivery_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '配送编号',
  `order_id` varchar(32) NOT NULL COMMENT '订单号',
  `delivery_time` datetime NOT NULL COMMENT '配送时间',
  `delivery_status` varchar(64) NOT NULL COMMENT '配送状态',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `worker_id` bigint NOT NULL COMMENT '配送员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_delivery_record`
--

/*!40000 ALTER TABLE `order_delivery_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_delivery_record` ENABLE KEYS */;

--
-- Table structure for table `order_furniture`
--

DROP TABLE IF EXISTS `order_furniture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_furniture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) NOT NULL COMMENT '订单号',
  `category` varchar(255) NOT NULL COMMENT '家具类别',
  `style` varchar(255) DEFAULT NULL COMMENT '款式',
  `material` varchar(255) DEFAULT NULL COMMENT '材质',
  `size` decimal(4,2) DEFAULT NULL COMMENT '尺寸',
  `bed_width` varchar(64) DEFAULT NULL COMMENT '床宽',
  `money` decimal(7,2) DEFAULT NULL COMMENT '金额',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_furniture`
--

/*!40000 ALTER TABLE `order_furniture` DISABLE KEYS */;
INSERT INTO `order_furniture` VALUES (2,'20240918161051','0',NULL,'1',1.80,'2',2100.00,'admin','2024-09-21 09:33:58','admin','2024-09-21 09:40:07',NULL);
/*!40000 ALTER TABLE `order_furniture` ENABLE KEYS */;

--
-- Table structure for table `order_statistics`
--

DROP TABLE IF EXISTS `order_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_statistics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `statc_date` varchar(8) NOT NULL COMMENT '统计日期',
  `date_type` varchar(8) NOT NULL COMMENT '日期类型',
  `data_type` varchar(8) NOT NULL COMMENT '数据类型',
  `statc_value` int NOT NULL COMMENT '统计值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_statistics`
--

/*!40000 ALTER TABLE `order_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_statistics` ENABLE KEYS */;

--
-- Table structure for table `payment_record`
--

DROP TABLE IF EXISTS `payment_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '支付记录编号',
  `order_id` varchar(32) NOT NULL COMMENT '订单编号',
  `payment_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '支付时间',
  `payment_method` varchar(20) NOT NULL COMMENT '支付方式',
  `payment_amount` decimal(10,2) NOT NULL COMMENT '支付金额',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `association_type` varchar(8) DEFAULT NULL COMMENT '关联类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_record`
--

/*!40000 ALTER TABLE `payment_record` DISABLE KEYS */;
INSERT INTO `payment_record` VALUES (1,'1','2024-10-11 10:45:59','1',1000.00,'admin','2024-10-11 10:51:21','admin','2024-10-11 14:58:38','现金支付一千','PO');
/*!40000 ALTER TABLE `payment_record` ENABLE KEYS */;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_order` (
  `id` varchar(32) NOT NULL,
  `supplier` varchar(64) NOT NULL COMMENT '供货方',
  `purchase_date` date NOT NULL COMMENT '日期',
  `arrival_status` varchar(8) DEFAULT NULL COMMENT '到货状态',
  `phone` varchar(32) DEFAULT NULL COMMENT '手机',
  `weichat` varchar(64) DEFAULT NULL COMMENT '微信',
  `goods_list` json DEFAULT NULL COMMENT '货单',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '总金额',
  `remarks` varchar(1024) DEFAULT NULL,
  `paid_money` decimal(10,2) DEFAULT '0.00' COMMENT '已支付金额',
  `status` varchar(8) NOT NULL DEFAULT '0' COMMENT '进货单状态',
  `payment_status` varchar(8) NOT NULL DEFAULT '0' COMMENT '支付状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
INSERT INTO `purchase_order` VALUES ('1','张三9','2024-09-29','0','152222212',NULL,'[{\"name\": \"床\", \"quantity\": 2, \"unitPrice\": 1500}, {\"name\": \"沙发\", \"quantity\": 2, \"unitPrice\": 2000}]',1000.00,NULL,1000.00,'0','2');
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-09-18 14:43:08','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-09-18 14:43:08','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-09-18 14:43:09','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','false','Y','admin','2024-09-18 14:43:09','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-09-18 14:43:09','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-09-18 14:43:09','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb3 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','gm家具',0,'若依','15888888888','ry@qq.com','0','0','admin','2024-09-18 14:42:36','admin','2024-09-19 17:06:25');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'default' COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'admin' COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb3 COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-09-18 14:43:06','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-09-18 14:43:07','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-09-18 14:43:07','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-09-18 14:43:07','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-09-18 14:43:07','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-09-18 14:43:07','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-09-18 14:43:07','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-09-18 14:43:07','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-09-18 14:43:07','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-09-18 14:43:07','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-09-18 14:43:07','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-09-18 14:43:07','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-09-18 14:43:07','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-09-18 14:43:07','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-09-18 14:43:07','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-09-18 14:43:07','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-09-18 14:43:08','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-09-18 14:43:08','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-09-18 14:43:08','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-09-18 14:43:08','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-09-18 14:43:08','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-09-18 14:43:08','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-09-18 14:43:08','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-09-18 14:43:08','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-09-18 14:43:08','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-09-18 14:43:08','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-09-18 14:43:08','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-09-18 14:43:08','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-09-18 14:43:08','',NULL,'停用状态'),(31,1,'进行中','1','order_status',NULL,'default','N','0','admin','2024-09-10 16:12:29','',NULL,NULL),(34,4,'已完成','5','order_status',NULL,'default','N','0','admin','2024-09-10 16:13:29','',NULL,NULL),(35,5,'已取消','9','order_status',NULL,'default','N','0','admin','2024-09-10 16:13:43','',NULL,NULL),(36,0,'实木','1','furniture_material',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(37,1,'皮革','2','furniture_material',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(38,0,'布艺','3','furniture_material',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(39,0,'塑钢','4','furniture_material',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(40,0,'金属','5','furniture_material',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(41,0,'1米5','1','bed_width',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(42,1,'1米8','2','bed_width',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(43,2,'2米','3','bed_width',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(44,0,'未开始','0','record_delivery_status',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(45,1,'装车中','1','record_delivery_status',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(46,2,'运送中','2','record_delivery_status',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(47,3,'运送完成','3','record_delivery_status',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(48,1,'停用','0','worker_status',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(49,0,'启用','1','worker_status',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(50,0,'运送工','0','job_type',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(51,1,'搬运工','1','job_type',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(52,2,'技术工','2','job_type',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(53,0,'全天','0','work_period',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(54,1,'上午','1','work_period',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(55,2,'下午','2','work_period',NULL,'default','N','0','admin','2024-09-14 15:58:43','',NULL,NULL),(56,0,'现金','1','payment_method',NULL,'default','N','0','admin','2024-09-18 14:25:11','',NULL,NULL),(57,1,'支付宝','2','payment_method',NULL,'default','N','0','admin','2024-09-18 14:25:26','',NULL,NULL),(58,2,'微信','3','payment_method',NULL,'default','N','0','admin','2024-09-18 14:25:40','',NULL,NULL),(59,3,'其他','4','payment_method',NULL,'default','N','0','admin','2024-09-18 14:25:56','',NULL,NULL),(100,0,'床','0','fruniture_category',NULL,'default','N','0','admin','2024-09-18 17:07:47','',NULL,NULL),(101,1,'沙发','1','fruniture_category',NULL,'default','N','0','admin','2024-09-18 18:42:26','',NULL,NULL),(102,2,'餐桌','2','fruniture_category',NULL,'default','N','0','admin','2024-09-18 18:42:57','',NULL,NULL),(103,0,'未配送','0','order_delivery_status',NULL,'default','N','0','admin','2024-09-20 18:42:57','',NULL,NULL),(104,2,'部分配送','2','order_delivery_status',NULL,'default','N','0','admin','2024-09-20 18:42:57','',NULL,NULL),(105,3,'配送完成','3','order_delivery_status',NULL,'default','N','0','admin','2024-09-20 18:42:57','',NULL,NULL),(106,0,'未支付','0','order_payment_status',NULL,'default','N','0','admin','2024-09-20 18:42:57','',NULL,NULL),(107,1,'部分支付','1','order_payment_status',NULL,'default','N','0','admin','2024-09-20 18:42:57','',NULL,NULL),(108,2,'支付完成','2','order_payment_status',NULL,'default','N','0','admin','2024-09-20 11:45:24','',NULL,NULL),(109,1,'配送中','1','order_delivery_status',NULL,'default','N','0','admin','2024-09-20 16:19:57','',NULL,NULL),(110,0,'日统计','0','order_statc_date_type',NULL,'default','N','0','admin','2024-09-29 10:55:48','',NULL,NULL),(111,1,'月统计','1','order_statc_date_type',NULL,'default','N','0','admin','2024-09-29 10:56:17','',NULL,NULL),(112,2,'年统计','2','order_statc_date_type',NULL,'default','N','0','admin','2024-09-29 10:56:37','',NULL,NULL),(113,0,'订单总数','0','order_statc_data_type',NULL,'default','N','0','admin','2024-09-29 10:58:18','',NULL,NULL),(114,1,'订单总金额','1','order_statc_data_type',NULL,'default','N','0','admin','2024-09-29 10:58:43','',NULL,NULL),(115,2,'已支付总金额','2','order_statc_data_type',NULL,'default','N','0','admin','2024-09-29 10:59:03','',NULL,NULL),(116,0,'未到货','0','purchase_arrival_status',NULL,'default','N','0','admin','2024-09-29 11:03:27','',NULL,NULL),(117,1,'部分到货','1','purchase_arrival_status',NULL,'default','N','0','admin','2024-09-29 11:03:43','',NULL,NULL),(118,2,'全部到货','2','purchase_arrival_status',NULL,'default','N','0','admin','2024-09-29 11:03:59','',NULL,NULL),(119,0,'待办','0','todo_status',NULL,'default','N','0','admin','2024-09-29 11:19:44','',NULL,NULL),(120,1,'处理中','1','todo_status',NULL,'default','N','0','admin','2024-09-29 11:19:44','',NULL,NULL),(121,2,'已完成','2','todo_status',NULL,'default','N','0','admin','2024-09-29 11:19:44','',NULL,NULL),(122,3,'已取消','3','todo_status',NULL,'default','N','0','admin','2024-09-29 11:19:44','',NULL,NULL),(123,0,'普通','0','todo_priority',NULL,'default','N','0','admin','2024-09-29 11:20:40','',NULL,NULL),(124,1,'重要','1','todo_priority',NULL,'default','N','0','admin','2024-09-29 11:20:40','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb3 COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-09-18 14:43:06','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-09-18 14:43:06','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-09-18 14:43:06','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-09-18 14:43:06','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-09-18 14:43:06','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-09-18 14:43:06','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-09-18 14:43:06','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-09-18 14:43:06','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-09-18 14:43:06','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-09-18 14:43:06','',NULL,'登录状态列表'),(11,'订单状态','order_status','0','admin','2024-09-10 15:55:11','',NULL,NULL),(12,'家具类别','fruniture_category','0','admin','2024-09-14 09:27:23','',NULL,NULL),(13,'家具材质','furniture_material','0','admin','2024-09-14 15:53:23','',NULL,NULL),(14,'床宽','bed_width','0','admin','2024-09-14 15:53:23','',NULL,NULL),(15,'配送记录配送状态','record_delivery_status','0','admin','2024-09-14 15:53:23','',NULL,NULL),(16,'工人启用状态','worker_status','0','admin','2024-09-14 15:53:23','',NULL,NULL),(17,'工种','job_type','0','admin','2024-09-14 15:53:23','',NULL,NULL),(18,'工作时间段','work_period','0','admin','2024-09-18 11:53:23','',NULL,NULL),(19,'支付方式','payment_method','0','admin','2024-09-18 14:24:46','',NULL,NULL),(100,'订单总配送状态','order_delivery_status','0','admin','2024-09-20 14:24:46','',NULL,NULL),(101,'订单总支付状态','order_payment_status','0','admin','2024-09-20 14:24:46','',NULL,NULL),(102,'订单统计日期类型','order_statc_date_type','0','admin','2024-09-29 10:24:46','',NULL,NULL),(103,'订单统计数据类型','order_statc_data_type','0','admin','2024-09-29 10:24:46','',NULL,NULL),(104,'进货到货状态','purchase_arrival_status','0','admin','2024-09-29 10:24:46','',NULL,NULL),(105,'代办事项状态','todo_status','0',NULL,NULL,'',NULL,NULL),(106,'代办事项优先级','todo_priority','0',NULL,NULL,'',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-09-18 14:43:09','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-09-18 14:43:10','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-09-18 14:43:10','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb3 COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-09-18 14:46:35'),(101,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-18 14:46:38'),(102,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-09-18 14:57:45'),(103,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-18 14:57:50'),(104,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-09-18 15:01:27'),(105,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-18 15:01:31'),(106,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-09-18 15:13:19'),(107,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-18 15:13:22'),(108,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-09-18 15:30:29'),(109,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-18 15:30:32'),(110,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-09-18 16:10:23'),(111,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-18 16:10:27'),(112,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-18 18:41:13'),(113,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-19 10:46:37'),(114,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-09-19 11:00:39'),(115,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-19 11:00:43'),(116,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-19 11:41:31'),(117,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-19 14:13:56'),(118,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-19 16:56:06'),(119,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-19 18:04:24'),(120,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-09-19 18:10:21'),(121,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-09-19 18:10:25'),(122,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-19 18:10:29'),(123,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-20 16:40:43'),(124,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-21 09:30:17'),(125,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-25 09:50:48'),(126,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-25 11:05:43'),(127,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-25 14:46:27'),(128,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-25 15:17:53'),(129,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-09-25 15:48:55'),(130,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-25 15:48:57'),(131,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-25 15:48:57'),(132,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-09-25 15:49:52'),(133,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-25 15:49:53'),(134,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-09-25 15:53:56'),(135,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-25 15:53:59'),(136,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-25 17:13:09'),(137,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-26 14:17:02'),(138,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-26 15:43:26'),(139,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-26 17:09:17'),(140,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-27 16:04:16'),(141,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-09-27 16:31:46'),(142,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-27 16:31:48'),(143,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-29 10:26:03'),(144,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-29 11:28:52'),(145,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-29 14:16:09'),(146,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-29 14:51:29'),(147,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-09-29 15:23:19'),(148,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-29 15:23:19'),(149,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-09-29 15:23:24'),(150,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-29 15:23:26'),(151,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-29 16:13:29'),(152,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-09-29 16:13:29'),(153,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-30 10:40:38'),(154,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-10-08 14:30:30'),(155,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-10-08 15:49:04'),(156,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-10-08 16:30:49'),(157,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-10-08 17:22:39'),(158,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-10-08 17:24:20'),(159,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-10-09 10:15:38'),(160,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-10-09 10:42:56'),(161,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-10-09 10:43:06'),(162,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-10-09 14:32:53'),(163,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-10-09 17:13:47'),(164,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-10-09 19:10:46'),(165,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-10-10 10:54:28'),(166,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-10-10 14:13:01'),(167,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-10-10 16:34:25'),(168,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-10-10 18:06:49'),(169,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-10-10 19:06:35'),(170,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-10-11 10:05:00'),(171,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-10-11 14:39:29'),(172,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-10-11 15:43:02');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) DEFAULT '' COMMENT '路由名称',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2050 DEFAULT CHARSET=utf8mb3 COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'','',1,0,'M','0','0','','system','admin','2024-09-18 14:42:38','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'','',1,0,'M','0','0','','monitor','admin','2024-09-18 14:42:38','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2024-09-18 14:42:39','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'','',0,0,'M','0','0','','guide','admin','2024-09-18 14:42:39','',NULL,'若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2024-09-18 14:42:39','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2024-09-18 14:42:39','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-09-18 14:42:39','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2024-09-18 14:42:39','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2024-09-18 14:42:39','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2024-09-18 14:42:39','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2024-09-18 14:42:39','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2024-09-18 14:42:39','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2024-09-18 14:42:40','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2024-09-18 14:42:40','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2024-09-18 14:42:40','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-09-18 14:42:40','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2024-09-18 14:42:40','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-09-18 14:42:40','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-09-18 14:42:40','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2024-09-18 14:42:40','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2024-09-18 14:42:40','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-09-18 14:42:40','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-09-18 14:42:40','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-09-18 14:42:40','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2024-09-18 14:42:40','',NULL,''),(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2024-09-18 14:42:41','',NULL,''),(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2024-09-18 14:42:41','',NULL,''),(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2024-09-18 14:42:41','',NULL,''),(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2024-09-18 14:42:42','',NULL,''),(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2024-09-18 14:42:42','',NULL,''),(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-09-18 14:42:42','',NULL,''),(1007,'角色查询',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2024-09-18 14:42:42','',NULL,''),(1008,'角色新增',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2024-09-18 14:42:42','',NULL,''),(1009,'角色修改',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2024-09-18 14:42:42','',NULL,''),(1010,'角色删除',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2024-09-18 14:42:43','',NULL,''),(1011,'角色导出',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2024-09-18 14:42:43','',NULL,''),(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2024-09-18 14:42:44','',NULL,''),(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2024-09-18 14:42:45','',NULL,''),(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-09-18 14:42:45','',NULL,''),(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-09-18 14:42:45','',NULL,''),(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2024-09-18 14:42:45','',NULL,''),(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2024-09-18 14:42:46','',NULL,''),(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-09-18 14:42:46','',NULL,''),(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-09-18 14:42:46','',NULL,''),(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2024-09-18 14:42:47','',NULL,''),(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2024-09-18 14:42:47','',NULL,''),(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2024-09-18 14:42:47','',NULL,''),(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2024-09-18 14:42:47','',NULL,''),(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2024-09-18 14:42:55','',NULL,''),(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2024-09-18 14:42:55','',NULL,''),(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2024-09-18 14:42:55','',NULL,''),(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-09-18 14:42:55','',NULL,''),(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-09-18 14:42:55','',NULL,''),(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2024-09-18 14:42:56','',NULL,''),(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2024-09-18 14:42:56','',NULL,''),(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2024-09-18 14:42:56','',NULL,''),(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2024-09-18 14:42:56','',NULL,''),(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2024-09-18 14:42:56','',NULL,''),(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2024-09-18 14:42:56','',NULL,''),(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2024-09-18 14:42:56','',NULL,''),(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2024-09-18 14:42:56','',NULL,''),(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-09-18 14:42:56','',NULL,''),(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-09-18 14:42:56','',NULL,''),(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-09-18 14:42:56','',NULL,''),(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-09-18 14:42:56','',NULL,''),(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-09-18 14:42:56','',NULL,''),(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-09-18 14:42:56','',NULL,''),(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-09-18 14:42:57','',NULL,''),(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-09-18 14:42:57','',NULL,''),(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-09-18 14:42:57','',NULL,''),(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-09-18 14:42:57','',NULL,''),(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-09-18 14:42:57','',NULL,''),(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-09-18 14:42:57','',NULL,''),(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-09-18 14:42:57','',NULL,''),(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-09-18 14:42:57','',NULL,''),(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-09-18 14:42:57','',NULL,''),(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-09-18 14:42:57','',NULL,''),(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-09-18 14:42:57','',NULL,''),(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-09-18 14:42:57','',NULL,''),(1055,'生成查询',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-09-18 14:42:57','',NULL,''),(1056,'生成修改',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-09-18 14:42:58','',NULL,''),(1057,'生成删除',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-09-18 14:42:58','',NULL,''),(1058,'导入代码',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-09-18 14:42:58','',NULL,''),(1059,'预览代码',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-09-18 14:42:58','',NULL,''),(1060,'生成代码',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-09-18 14:42:58','',NULL,''),(2000,'订单',0,1,'order',NULL,NULL,'',1,0,'M','0','0',NULL,'clipboard','admin','2024-09-18 14:49:02','',NULL,''),(2001,'基础信息',0,5,'baseinfo',NULL,NULL,'',1,0,'M','0','0',NULL,'dict','admin','2024-09-18 14:51:37','',NULL,''),(2002,'家具订单',2000,1,'furnitureOrder','order/furnitureOrder/index',NULL,'',1,0,'C','0','0','order:furnitureOrder:list','#','admin','2024-09-18 14:55:05','',NULL,'家具订单菜单'),(2003,'家具订单查询',2002,1,'#','',NULL,'',1,0,'F','0','0','order:furnitureOrder:query','#','admin','2024-09-18 14:55:06','',NULL,''),(2004,'家具订单新增',2002,2,'#','',NULL,'',1,0,'F','0','0','order:furnitureOrder:add','#','admin','2024-09-18 14:55:06','',NULL,''),(2005,'家具订单修改',2002,3,'#','',NULL,'',1,0,'F','0','0','order:furnitureOrder:edit','#','admin','2024-09-18 14:55:06','',NULL,''),(2006,'家具订单删除',2002,4,'#','',NULL,'',1,0,'F','0','0','order:furnitureOrder:remove','#','admin','2024-09-18 14:55:06','',NULL,''),(2007,'家具订单导出',2002,5,'#','',NULL,'',1,0,'F','0','0','order:furnitureOrder:export','#','admin','2024-09-18 14:55:06','',NULL,''),(2008,'支付记录',2000,1,'paymentRecord','order/paymentRecord/index',NULL,'',1,0,'C','0','0','order:paymentRecord:list','#','admin','2024-09-18 15:01:16','',NULL,'支付记录菜单'),(2009,'支付记录查询',2008,1,'#','',NULL,'',1,0,'F','0','0','order:paymentRecord:query','#','admin','2024-09-18 15:01:17','',NULL,''),(2010,'支付记录新增',2008,2,'#','',NULL,'',1,0,'F','0','0','order:paymentRecord:add','#','admin','2024-09-18 15:01:17','',NULL,''),(2011,'支付记录修改',2008,3,'#','',NULL,'',1,0,'F','0','0','order:paymentRecord:edit','#','admin','2024-09-18 15:01:17','',NULL,''),(2012,'支付记录删除',2008,4,'#','',NULL,'',1,0,'F','0','0','order:paymentRecord:remove','#','admin','2024-09-18 15:01:17','',NULL,''),(2013,'支付记录导出',2008,5,'#','',NULL,'',1,0,'F','0','0','order:paymentRecord:export','#','admin','2024-09-18 15:01:17','',NULL,''),(2020,'订单中家具',2000,1,'orderFurniture','order/orderFurniture/index',NULL,'',1,0,'C','0','0','order:orderFurniture:list','#','admin','2024-09-18 15:27:22','',NULL,'订单中家具菜单'),(2021,'订单中家具查询',2020,1,'#','',NULL,'',1,0,'F','0','0','order:orderFurniture:query','#','admin','2024-09-18 15:27:31','',NULL,''),(2022,'订单中家具新增',2020,2,'#','',NULL,'',1,0,'F','0','0','order:orderFurniture:add','#','admin','2024-09-18 15:28:07','',NULL,''),(2023,'订单中家具修改',2020,3,'#','',NULL,'',1,0,'F','0','0','order:orderFurniture:edit','#','admin','2024-09-18 15:28:15','',NULL,''),(2024,'订单中家具删除',2020,4,'#','',NULL,'',1,0,'F','0','0','order:orderFurniture:remove','#','admin','2024-09-18 15:28:16','',NULL,''),(2025,'订单中家具导出',2020,5,'#','',NULL,'',1,0,'F','0','0','order:orderFurniture:export','#','admin','2024-09-18 15:28:17','',NULL,''),(2026,'工作记录',0,2,'work',NULL,NULL,'',1,0,'M','0','0',NULL,'date-range','admin','2024-09-20 16:47:54','',NULL,''),(2027,'工作记录',2026,1,'workRecord','work/workRecord/index',NULL,'',1,0,'C','0','0','work:workRecord:list','#','admin','2024-09-20 16:56:36','',NULL,'工作记录菜单'),(2028,'工作记录查询',2027,1,'#','',NULL,'',1,0,'F','0','0','work:workRecord:query','#','admin','2024-09-20 16:56:39','',NULL,''),(2029,'工作记录新增',2027,2,'#','',NULL,'',1,0,'F','0','0','work:workRecord:add','#','admin','2024-09-20 16:56:41','',NULL,''),(2030,'工作记录修改',2027,3,'#','',NULL,'',1,0,'F','0','0','work:workRecord:edit','#','admin','2024-09-20 16:56:42','',NULL,''),(2031,'工作记录删除',2027,4,'#','',NULL,'',1,0,'F','0','0','work:workRecord:remove','#','admin','2024-09-20 16:56:44','',NULL,''),(2032,'工作记录导出',2027,5,'#','',NULL,'',1,0,'F','0','0','work:workRecord:export','#','admin','2024-09-20 16:56:45','',NULL,''),(2033,'统计',0,4,'statistics',NULL,NULL,'',1,0,'M','0','0',NULL,'date-range','admin','2024-09-29 10:51:12','',NULL,''),(2034,'进货',0,4,'purchase',NULL,NULL,'',1,0,'M','0','0',NULL,'documentation','admin','2024-09-29 10:52:24','',NULL,''),(2035,'订单统计',2033,1,'orderStatistics','statistics/orderStatistics/index',NULL,'',1,0,'C','0','0','statistics:orderStatistics:list','#','admin','2024-09-29 11:41:52','',NULL,'订单统计菜单'),(2036,'订单统计查询',2035,1,'#','',NULL,'',1,0,'F','0','0','statistics:orderStatistics:query','#','admin','2024-09-29 11:41:52','',NULL,''),(2037,'订单统计导出',2035,5,'#','',NULL,'',1,0,'F','0','0','statistics:orderStatistics:export','#','admin','2024-09-29 11:41:52','',NULL,''),(2038,'进货单',2034,1,'purchaseOrder','purchase/purchaseOrder/index',NULL,'',1,0,'C','0','0','purchase:purchaseOrder:list','#','admin','2024-09-29 11:46:43','',NULL,'进货单菜单'),(2039,'进货单查询',2038,1,'#','',NULL,'',1,0,'F','0','0','purchase:purchaseOrder:query','#','admin','2024-09-29 11:46:43','',NULL,''),(2040,'进货单新增',2038,2,'#','',NULL,'',1,0,'F','0','0','purchase:purchaseOrder:add','#','admin','2024-09-29 11:46:43','',NULL,''),(2041,'进货单修改',2038,3,'#','',NULL,'',1,0,'F','0','0','purchase:purchaseOrder:edit','#','admin','2024-09-29 11:46:43','',NULL,''),(2042,'进货单删除',2038,4,'#','',NULL,'',1,0,'F','0','0','purchase:purchaseOrder:remove','#','admin','2024-09-29 11:46:43','',NULL,''),(2043,'进货单导出',2038,5,'#','',NULL,'',1,0,'F','0','0','purchase:purchaseOrder:export','#','admin','2024-09-29 11:46:43','',NULL,''),(2044,'待办事项',2000,1,'todos','order/todos/index',NULL,'',1,0,'C','0','0','order:todos:list','#','admin','2024-09-29 11:49:56','',NULL,'待办事项菜单'),(2045,'待办事项查询',2044,1,'#','',NULL,'',1,0,'F','0','0','order:todos:query','#','admin','2024-09-29 11:49:56','',NULL,''),(2046,'待办事项新增',2044,2,'#','',NULL,'',1,0,'F','0','0','order:todos:add','#','admin','2024-09-29 11:49:56','',NULL,''),(2047,'待办事项修改',2044,3,'#','',NULL,'',1,0,'F','0','0','order:todos:edit','#','admin','2024-09-29 11:49:56','',NULL,''),(2048,'待办事项删除',2044,4,'#','',NULL,'',1,0,'F','0','0','order:todos:remove','#','admin','2024-09-29 11:49:56','',NULL,''),(2049,'待办事项导出',2044,5,'#','',NULL,'',1,0,'F','0','0','order:todos:export','#','admin','2024-09-29 11:49:56','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',0xE696B0E78988E69CACE58685E5AEB9,'0','admin','2024-09-18 14:43:10','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',0xE7BBB4E68AA4E58685E5AEB9,'0','admin','2024-09-18 14:43:10','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb3 COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"order\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-18 14:49:02',180),(101,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"furniture_order\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-18 14:49:28',143),(102,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"furniture_category,order_delivery_record,order_furniture,payment_record,work_record,districts\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-18 14:50:46',266),(103,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"基础信息\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"baseinfo\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-18 14:51:37',25),(104,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"furnitureOrder\",\"className\":\"OrderFurniture\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":30,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单号\",\"columnId\":31,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"家具类别\",\"columnId\":32,\"columnName\":\"category\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Style\",\"columnComment\":\"款式\",\"columnId\":33,\"columnName\":\"style\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"style\",\"javaType\":\"String\",\"lis','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-18 14:53:20',67),(105,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"paymentRecord\",\"className\":\"PaymentRecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"支付记录编号\",\"columnId\":43,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单编号\",\"columnId\":44,\"columnName\":\"order_id\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PaymentTime\",\"columnComment\":\"支付时间\",\"columnId\":45,\"columnName\":\"payment_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"paymentTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PaymentMethod\",\"columnComment\":\"支付方式\",\"columnId\":46,\"columnName\":\"payment_method\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-18 14:56:54',48),(106,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"furnitureOrder\",\"className\":\"FurnitureOrder\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:49:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TotalMoney\",\"columnComment\":\"总金额\",\"columnId\":2,\"columnName\":\"total_money\",\"columnType\":\"decimal(7,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:49:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"totalMoney\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PaidMoney\",\"columnComment\":\"已支付金额\",\"columnId\":3,\"columnName\":\"paid_money\",\"columnType\":\"decimal(7,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:49:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"paidMoney\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderStatus\",\"columnComment\":\"0-未开始 1-待配送 2-配送中 3-已配送 5-已完成 10-已取消\",\"columnId\":4,\"columnName\":\"order_status\",\"columnType\":\"varchar(8)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:49:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-18 15:06:49',59),(107,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"orderFurniture\",\"className\":\"OrderFurniture\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":30,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 14:53:20\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单号\",\"columnId\":31,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 14:53:20\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"家具类别\",\"columnId\":32,\"columnName\":\"category\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 14:53:20\",\"usableColumn\":false},{\"capJavaField\":\"Style\",\"columnComment\":\"款式\",\"columnId\":33,\"columnName\":\"style\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-18 15:09:11',50),(108,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"orderFurniture\",\"className\":\"OrderFurniture\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":30,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 15:09:11\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单号\",\"columnId\":31,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 15:09:11\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"家具类别\",\"columnId\":32,\"columnName\":\"category\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 15:09:11\",\"usableColumn\":false},{\"capJavaField\":\"Style\",\"columnComment\":\"款式\",\"columnId\":33,\"columnName\":\"style\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-18 15:10:18',58),(109,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"orderFurniture\",\"className\":\"OrderFurniture\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":30,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 15:10:18\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单号\",\"columnId\":31,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 15:10:18\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"家具类别\",\"columnId\":32,\"columnName\":\"category\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 15:10:18\",\"usableColumn\":false},{\"capJavaField\":\"Style\",\"columnComment\":\"款式\",\"columnId\":33,\"columnName\":\"style\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-18 15:11:12',93),(110,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/5','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-18 15:11:33',27),(111,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"furniture_order\"}',NULL,0,NULL,'2024-09-18 15:11:40',104),(112,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"order_furniture\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-18 15:14:14',95),(113,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"orderFurniture\",\"className\":\"OrderFurniture\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":66,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 15:14:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单号\",\"columnId\":67,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 15:14:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"家具类别\",\"columnId\":68,\"columnName\":\"category\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 15:14:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Style\",\"columnComment\":\"款式\",\"columnId\":69,\"columnName\":\"style\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 15:14:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"style\",\"javaType\":\"String\",\"lis','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-18 15:18:21',53),(114,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"order_furniture\"}',NULL,0,NULL,'2024-09-18 15:18:46',58),(115,'家具订单',1,'com.ruoyi.jgc.controller.FurnitureOrderController.add()','POST',1,'admin','研发部门','/order/furnitureOrder','127.0.0.1','内网IP','{\"createTime\":\"2024-09-18 16:10:12\",\"createUser\":\"admin\",\"district\":\"411723\",\"dui\":1,\"id\":\"20240918161012\",\"orderStatus\":\"0\",\"orderTime\":\"2024-09-18\",\"orderUser\":\"123\",\"paidMoney\":100,\"params\":{},\"phoneNumber\":\"5641312\",\"remark\":\"1\",\"subVillage\":\"1\",\"totalMoney\":1000,\"town\":\"411723103\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'village\' doesn\'t have a default value\r\n### The error may exist in file [D:\\jgc\\project\\java\\ruoyi\\furniture\\ruoyi-admin\\target\\classes\\mapper\\order\\FurnitureOrderMapper.xml]\r\n### The error may involve com.ruoyi.jgc.mapper.FurnitureOrderMapper.insertFurnitureOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into furniture_order          ( id,             total_money,             paid_money,             order_status,             order_time,             order_user,             phone_number,             district,             town,                          dui,             sub_village,             create_time,             create_user,             remark )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'village\' doesn\'t have a default value\n; Field \'village\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'village\' doesn\'t have a default value','2024-09-18 16:10:12',328),(116,'家具订单',1,'com.ruoyi.jgc.controller.FurnitureOrderController.add()','POST',1,'admin','研发部门','/order/furnitureOrder','127.0.0.1','内网IP','{\"createTime\":\"2024-09-18 16:10:51\",\"createUser\":\"admin\",\"district\":\"411723\",\"dui\":1,\"id\":\"20240918161051\",\"orderStatus\":\"0\",\"orderTime\":\"2024-09-18\",\"orderUser\":\"111\",\"paidMoney\":100,\"params\":{},\"phoneNumber\":\"111\",\"remark\":\"3\",\"subVillage\":\"2\",\"totalMoney\":1000,\"town\":\"411723103\",\"village\":\"411723103001\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-18 16:10:51',12),(117,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"床\",\"dictSort\":0,\"dictType\":\"fruniture_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-18 17:07:47',112),(118,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"沙发\",\"dictSort\":1,\"dictType\":\"fruniture_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-18 18:42:26',29),(119,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"餐桌\",\"dictSort\":2,\"dictType\":\"fruniture_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-18 18:42:57',18),(120,'订单中家具',1,'com.ruoyi.jgc.controller.OrderFurnitureController.add()','POST',1,'admin','研发部门','/order/orderFurniture','127.0.0.1','内网IP','{\"bedWidth\":\"1\",\"category\":\"0\",\"createTime\":\"2024-09-19 10:47:19\",\"material\":\"1\",\"money\":1200,\"orderId\":20240918161051,\"params\":{},\"remark\":\"实木床\",\"size\":1.5}',NULL,1,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'order_id\' at row 1\r\n### The error may exist in file [D:\\jgc\\project\\java\\ruoyi\\furniture\\ruoyi-admin\\target\\classes\\mapper\\order\\OrderFurnitureMapper.xml]\r\n### The error may involve com.ruoyi.jgc.mapper.OrderFurnitureMapper.insertOrderFurniture-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into order_furniture          ( order_id,             category,                          material,             size,             bed_width,             money,                          create_time,                                       remark )           values ( ?,             ?,                          ?,             ?,             ?,             ?,                          ?,                                       ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'order_id\' at row 1\n; Data truncation: Out of range value for column \'order_id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'order_id\' at row 1','2024-09-19 10:47:19',90),(121,'订单中家具',1,'com.ruoyi.jgc.controller.OrderFurnitureController.add()','POST',1,'admin','研发部门','/order/orderFurniture','127.0.0.1','内网IP','{\"bedWidth\":\"1\",\"category\":\"0\",\"createTime\":\"2024-09-19 10:50:49\",\"id\":1,\"material\":\"1\",\"money\":1200,\"orderId\":\"20240918161051\",\"params\":{},\"remark\":\"实木床\",\"size\":1.5}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-19 10:50:50',89),(122,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"deliveryRecord\",\"className\":\"OrderDeliveryRecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"配送编号\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单号\",\"columnId\":22,\"columnName\":\"order_id\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeliveryTime\",\"columnComment\":\"配送时间\",\"columnId\":23,\"columnName\":\"delivery_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deliveryTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeliveryStatus\",\"columnComment\":\"配送状态\",\"columnId\":24,\"columnName\":\"delivery_status\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"delivery_status\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-19 11:04:29',358),(123,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"order_delivery_record\"}',NULL,0,NULL,'2024-09-19 11:04:49',489),(124,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"orderFurniture\",\"className\":\"OrderFurniture\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":66,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 15:14:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 15:18:21\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单号\",\"columnId\":67,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 15:14:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 15:18:21\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"家具类别\",\"columnId\":68,\"columnName\":\"category\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 15:14:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 15:18:21\",\"usableColumn\":false},{\"capJavaField\":\"Style\",\"columnComment\":\"款式\",\"columnId\":69,\"columnName\":\"style\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 15:14:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-19 14:15:12',126),(125,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"paymentRecord\",\"className\":\"PaymentRecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"支付记录编号\",\"columnId\":43,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 14:56:54\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单编号\",\"columnId\":44,\"columnName\":\"order_id\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 14:56:54\",\"usableColumn\":false},{\"capJavaField\":\"PaymentTime\",\"columnComment\":\"支付时间\",\"columnId\":45,\"columnName\":\"payment_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"paymentTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-09-18 14:56:54\",\"usableColumn\":false},{\"capJavaField\":\"PaymentMethod\",\"columnComment\":\"支付方式\",\"columnId\":46,\"columnName\":\"payment_method\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":f','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-19 14:16:10',80),(126,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"deliveryRecord\",\"className\":\"OrderDeliveryRecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"配送编号\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-09-19 11:04:29\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单号\",\"columnId\":22,\"columnName\":\"order_id\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-09-19 11:04:29\",\"usableColumn\":false},{\"capJavaField\":\"DeliveryTime\",\"columnComment\":\"配送时间\",\"columnId\":23,\"columnName\":\"delivery_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deliveryTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-09-19 11:04:29\",\"usableColumn\":false},{\"capJavaField\":\"DeliveryStatus\",\"columnComment\":\"配送状态\",\"columnId\":24,\"columnName\":\"delivery_status\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"delivery_status\",\"edit\":true,\"html','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-19 14:16:20',57),(127,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"orderFurniture\",\"className\":\"OrderFurniture\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":66,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 15:14:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-09-19 14:15:12\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单号\",\"columnId\":67,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 15:14:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-09-19 14:15:12\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"家具类别\",\"columnId\":68,\"columnName\":\"category\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 15:14:14\",\"dictType\":\"fruniture_category\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-09-19 14:15:12\",\"usableColumn\":false},{\"capJavaField\":\"Style\",\"columnComment\":\"款式\",\"columnId\":69,\"columnName\":\"style\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 15:14:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncre','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-19 14:17:55',77),(128,'岗位管理',1,'com.ruoyi.web.controller.system.SysPostController.add()','POST',1,'admin','研发部门','/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"deliveryman\",\"postId\":5,\"postName\":\"配送员\",\"postSort\":4,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-19 17:01:50',165),(129,'岗位管理',1,'com.ruoyi.web.controller.system.SysPostController.add()','POST',1,'admin','研发部门','/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"hamal\",\"postId\":6,\"postName\":\"搬运工\",\"postSort\":5,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-19 17:03:23',62),(130,'岗位管理',1,'com.ruoyi.web.controller.system.SysPostController.add()','POST',1,'admin','研发部门','/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"skillman\",\"postId\":7,\"postName\":\"维修技术工\",\"postSort\":6,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-19 17:04:19',34),(131,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/109','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-19 17:05:37',55),(132,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/108','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-19 17:05:41',30),(133,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/102','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-19 17:05:43',69),(134,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/107','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-19 17:05:47',31),(135,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/106','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-19 17:05:49',23),(136,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/104','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-19 17:05:53',27),(137,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"gm家具\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-19 17:06:25',35),(138,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:42:37\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"ry@163.com\",\"loginDate\":\"2024-09-19 16:56:06\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"postIds\":[1],\"remark\":\"管理员\",\"roleIds\":[1],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}',NULL,1,'不允许操作超级管理员用户','2024-09-19 17:07:39',4),(139,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"配送员-张三\",\"params\":{},\"phonenumber\":\"15036536985\",\"postIds\":[5],\"remark\":\"配送员\",\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"配送员-张三\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-19 17:17:38',328),(140,'配送记录',1,'com.ruoyi.jgc.controller.OrderDeliveryRecordController.add()','POST',1,'admin','gm家具','/order/deliveryRecord','127.0.0.1','内网IP','{\"createTime\":\"2024-09-19 18:14:24\",\"deliveryStatus\":\"0\",\"deliveryTime\":\"2024-09-19\",\"orderId\":\"20240918161051\",\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'worker_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\jgc\\project\\java\\ruoyi\\furniture\\ruoyi-admin\\target\\classes\\mapper\\order\\OrderDeliveryRecordMapper.xml]\r\n### The error may involve com.ruoyi.jgc.mapper.OrderDeliveryRecordMapper.insertOrderDeliveryRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into order_delivery_record          ( order_id,             delivery_time,             delivery_status,                          create_time )           values ( ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'worker_id\' doesn\'t have a default value\n; Field \'worker_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'worker_id\' doesn\'t have a default value','2024-09-19 18:14:25',441),(141,'配送记录',1,'com.ruoyi.jgc.controller.OrderDeliveryRecordController.add()','POST',1,'admin','gm家具','/order/deliveryRecord','127.0.0.1','内网IP','{\"createTime\":\"2024-09-19 18:14:40\",\"deliveryStatus\":\"0\",\"deliveryTime\":\"2024-09-19\",\"orderId\":\"20240918161051\",\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'worker_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\jgc\\project\\java\\ruoyi\\furniture\\ruoyi-admin\\target\\classes\\mapper\\order\\OrderDeliveryRecordMapper.xml]\r\n### The error may involve com.ruoyi.jgc.mapper.OrderDeliveryRecordMapper.insertOrderDeliveryRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into order_delivery_record          ( order_id,             delivery_time,             delivery_status,                          create_time )           values ( ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'worker_id\' doesn\'t have a default value\n; Field \'worker_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'worker_id\' doesn\'t have a default value','2024-09-19 18:14:40',9),(142,'配送记录',1,'com.ruoyi.jgc.controller.OrderDeliveryRecordController.add()','POST',1,'admin','gm家具','/order/deliveryRecord','127.0.0.1','内网IP','{\"createTime\":\"2024-09-19 18:24:41\",\"deliveryStatus\":\"0\",\"deliveryTime\":\"2024-09-19\",\"id\":1,\"orderId\":\"20240918161051\",\"params\":{},\"workerId\":100}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-19 18:24:41',68),(143,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','gm家具','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"workRecord\",\"className\":\"WorkRecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"记录编号\",\"columnId\":53,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"WorkerId\",\"columnComment\":\"员工编号\",\"columnId\":54,\"columnName\":\"worker_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"workerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"WorkDate\",\"columnComment\":\"工作日期\",\"columnId\":55,\"columnName\":\"work_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"workDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"WorkPeriod\",\"columnComment\":\"工作时间段\",\"columnId\":56,\"columnName\":\"work_period\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"work_period\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"j','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-20 16:46:53',164),(144,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','gm家具','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"工作记录\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"work\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-20 16:47:54',44),(145,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','gm家具','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"workRecord\",\"className\":\"WorkRecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"记录编号\",\"columnId\":53,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-09-20 16:46:53\",\"usableColumn\":false},{\"capJavaField\":\"WorkerId\",\"columnComment\":\"员工编号\",\"columnId\":54,\"columnName\":\"worker_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"workerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-09-20 16:46:53\",\"usableColumn\":false},{\"capJavaField\":\"WorkDate\",\"columnComment\":\"工作日期\",\"columnId\":55,\"columnName\":\"work_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"workDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"BETWEEN\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-09-20 16:46:53\",\"usableColumn\":false},{\"capJavaField\":\"WorkPeriod\",\"columnComment\":\"工作时间段\",\"columnId\":56,\"columnName\":\"work_period\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 14:50:46\",\"dictType\":\"work_period\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-20 16:49:45',83),(146,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','gm家具','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"work_record\"}',NULL,0,NULL,'2024-09-20 16:49:51',461),(147,'家具订单',2,'com.ruoyi.jgc.controller.FurnitureOrderController.edit()','PUT',1,'admin','gm家具','/order/furnitureOrder','127.0.0.1','内网IP','{\"createTime\":\"2024-09-18 16:10:52\",\"createUser\":\"admin\",\"deliveryStatus\":\"0\",\"district\":\"411723\",\"dui\":1,\"id\":\"20240918161051\",\"orderStatus\":\"9\",\"orderTime\":\"2024-09-18 00:00:00\",\"orderUser\":\"111\",\"paidMoney\":0,\"params\":{},\"paymentStatus\":\"0\",\"phoneNumber\":\"111\",\"remark\":\"3\",\"subVillage\":\"2\",\"totalMoney\":0,\"town\":\"411723103\",\"updateBy\":\"admin\",\"updateTime\":\"2024-09-21 09:33:04\",\"village\":\"411723103001\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-21 09:33:04',20),(148,'家具订单',2,'com.ruoyi.jgc.controller.FurnitureOrderController.edit()','PUT',1,'admin','gm家具','/order/furnitureOrder','127.0.0.1','内网IP','{\"createTime\":\"2024-09-18 16:10:52\",\"createUser\":\"admin\",\"deliveryStatus\":\"0\",\"district\":\"411723\",\"dui\":1,\"id\":\"20240918161051\",\"orderStatus\":\"1\",\"orderTime\":\"2024-09-18 00:00:00\",\"orderUser\":\"111\",\"paidMoney\":0,\"params\":{},\"paymentStatus\":\"0\",\"phoneNumber\":\"111\",\"remark\":\"3\",\"subVillage\":\"2\",\"totalMoney\":0,\"town\":\"411723103\",\"updateBy\":\"admin\",\"updateTime\":\"2024-09-21 09:33:16\",\"village\":\"411723103001\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-21 09:33:16',11),(149,'订单中家具',1,'com.ruoyi.jgc.controller.OrderFurnitureController.add()','POST',1,'admin','gm家具','/order/orderFurniture','127.0.0.1','内网IP','{\"bedWidth\":\"1\",\"category\":\"0\",\"createBy\":\"admin\",\"createTime\":\"2024-09-21 09:33:58\",\"id\":2,\"material\":\"1\",\"money\":1800,\"orderId\":\"20240918161051\",\"params\":{},\"size\":1.5}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-21 09:33:58',37),(150,'订单中家具',2,'com.ruoyi.jgc.controller.OrderFurnitureController.edit()','PUT',1,'admin','gm家具','/order/orderFurniture','127.0.0.1','内网IP','{\"bedWidth\":\"2\",\"category\":\"0\",\"createBy\":\"admin\",\"createTime\":\"2024-09-21 09:33:58\",\"id\":2,\"material\":\"1\",\"money\":2100,\"params\":{},\"size\":1.8,\"updateBy\":\"admin\",\"updateTime\":\"2024-09-21 09:40:06\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-21 09:40:06',45),(151,'家具订单',2,'com.ruoyi.jgc.controller.FurnitureOrderController.edit()','PUT',1,'admin','gm家具','/order/furnitureOrder','127.0.0.1','内网IP','{\"createTime\":\"2024-09-18 16:10:52\",\"createUser\":\"admin\",\"deliveryStatus\":\"0\",\"district\":\"411723\",\"dui\":1,\"id\":\"20240918161051\",\"orderStatus\":\"1\",\"orderTime\":\"2024-09-18 00:00:00\",\"orderUser\":\"1112\",\"paidMoney\":0,\"params\":{},\"paymentStatus\":\"0\",\"phoneNumber\":\"111\",\"remark\":\"3\",\"subVillage\":\"2\",\"totalMoney\":2100,\"town\":\"411723103\",\"updateBy\":\"admin\",\"updateTime\":\"2024-09-25 14:47:04\",\"village\":\"411723103001\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-25 14:47:04',49),(152,'家具订单',2,'com.ruoyi.jgc.controller.FurnitureOrderController.edit()','PUT',1,'admin','gm家具','/order/furnitureOrder','127.0.0.1','内网IP','{\"createTime\":\"2024-09-18 16:10:52\",\"createUser\":\"admin\",\"deliveryStatus\":\"0\",\"district\":\"411723\",\"dui\":1,\"id\":\"20240918161051\",\"orderStatus\":\"1\",\"orderTime\":\"2024-09-18 00:00:00\",\"orderUser\":\"1113\",\"paidMoney\":0,\"params\":{},\"paymentStatus\":\"0\",\"phoneNumber\":\"111\",\"remark\":\"3\",\"subVillage\":\"2\",\"totalMoney\":2100,\"town\":\"411723103\",\"updateBy\":\"admin\",\"updateTime\":\"2024-09-25 15:18:10\",\"village\":\"411723103001\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-25 15:18:10',45),(153,'家具订单',2,'com.ruoyi.jgc.controller.FurnitureOrderController.edit()','PUT',1,'admin','gm家具','/order/furnitureOrder','127.0.0.1','内网IP','{\"createTime\":\"2024-09-18 16:10:52\",\"createUser\":\"admin\",\"deliveryStatus\":\"0\",\"district\":\"411723\",\"dui\":1,\"id\":\"20240918161051\",\"orderStatus\":\"1\",\"orderTime\":\"2024-09-18 00:00:00\",\"orderUser\":\"11123\",\"paidMoney\":0,\"params\":{},\"paymentStatus\":\"0\",\"phoneNumber\":\"111\",\"remark\":\"3\",\"subVillage\":\"2\",\"totalMoney\":2100,\"town\":\"411723103\",\"updateBy\":\"admin\",\"updateTime\":\"2024-09-25 15:38:41\",\"village\":\"411723103001\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-25 15:38:41',333),(154,'家具订单',2,'com.ruoyi.jgc.controller.FurnitureOrderController.edit()','PUT',1,'admin','gm家具','/order/furnitureOrder','127.0.0.1','内网IP','{\"createTime\":\"2024-09-18 16:10:52\",\"createUser\":\"admin\",\"deliveryStatus\":\"0\",\"district\":\"411723\",\"dui\":1,\"id\":\"20240918161051\",\"orderStatus\":\"1\",\"orderTime\":\"2024-09-18 00:00:00\",\"orderUser\":\"11124\",\"paidMoney\":0,\"params\":{},\"paymentStatus\":\"0\",\"phoneNumber\":\"111\",\"remark\":\"3\",\"subVillage\":\"2\",\"totalMoney\":2100,\"town\":\"411723103\",\"updateBy\":\"admin\",\"updateTime\":\"2024-09-25 15:39:14\",\"village\":\"411723103001\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-25 15:39:14',12),(155,'家具订单',2,'com.ruoyi.jgc.controller.FurnitureOrderController.edit()','PUT',1,'admin','gm家具','/order/furnitureOrder','127.0.0.1','内网IP','{\"createTime\":\"2024-09-18 16:10:52\",\"createUser\":\"admin\",\"deliveryStatus\":\"0\",\"district\":\"411723\",\"dui\":1,\"id\":\"20240918161051\",\"orderStatus\":\"1\",\"orderTime\":\"2024-09-18 00:00:00\",\"orderUser\":\"11126\",\"paidMoney\":0,\"params\":{},\"paymentStatus\":\"0\",\"phoneNumber\":\"111\",\"remark\":\"3\",\"subVillage\":\"2\",\"totalMoney\":2100,\"town\":\"411723103\",\"updateBy\":\"admin\",\"updateTime\":\"2024-09-25 15:39:31\",\"village\":\"411723103001\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-25 15:39:31',14),(156,'家具订单',2,'com.ruoyi.jgc.controller.FurnitureOrderController.edit()','PUT',1,'admin','gm家具','/order/furnitureOrder','127.0.0.1','内网IP','{\"createTime\":\"2024-09-18 16:10:52\",\"createUser\":\"admin\",\"deliveryStatus\":\"0\",\"district\":\"411723\",\"dui\":1,\"id\":\"20240918161051\",\"orderStatus\":\"1\",\"orderTime\":\"2024-09-18 00:00:00\",\"orderUser\":\"11127\",\"paidMoney\":0,\"params\":{},\"paymentStatus\":\"0\",\"phoneNumber\":\"111\",\"remark\":\"3\",\"subVillage\":\"2\",\"totalMoney\":2100,\"town\":\"411723103\",\"updateBy\":\"admin\",\"updateTime\":\"2024-09-25 15:50:27\",\"village\":\"411723103001\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-25 15:50:27',124),(157,'家具订单',2,'com.ruoyi.jgc.controller.FurnitureOrderController.edit()','PUT',1,'admin','gm家具','/order/furnitureOrder','127.0.0.1','内网IP','{\"createTime\":\"2024-09-18 16:10:52\",\"createUser\":\"admin\",\"deliveryStatus\":\"0\",\"district\":\"411723\",\"dui\":1,\"id\":\"20240918161051\",\"orderStatus\":\"1\",\"orderTime\":\"2024-09-18 00:00:00\",\"orderUser\":\"111278\",\"paidMoney\":0,\"params\":{},\"paymentStatus\":\"0\",\"phoneNumber\":\"111\",\"remark\":\"3\",\"subVillage\":\"2\",\"totalMoney\":2100,\"town\":\"411723103\",\"updateBy\":\"admin\",\"updateTime\":\"2024-09-25 15:54:18\",\"village\":\"411723103001\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-25 15:54:18',258),(158,'家具订单',2,'com.ruoyi.jgc.controller.FurnitureOrderController.edit()','PUT',1,'admin','gm家具','/order/furnitureOrder','127.0.0.1','内网IP','{\"createTime\":\"2024-09-18 16:10:52\",\"createUser\":\"admin\",\"deliveryStatus\":\"0\",\"district\":\"411723\",\"dui\":1,\"id\":\"20240918161051\",\"orderStatus\":\"1\",\"orderTime\":\"2024-09-18 00:00:00\",\"orderUser\":\"111279\",\"paidMoney\":0,\"params\":{},\"paymentStatus\":\"0\",\"phoneNumber\":\"111\",\"remark\":\"3\",\"subVillage\":\"2\",\"totalMoney\":2100,\"town\":\"411723103\",\"updateBy\":\"admin\",\"updateTime\":\"2024-09-25 15:54:48\",\"village\":\"411723103001\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-25 15:54:48',182),(159,'家具订单',2,'com.ruoyi.jgc.controller.FurnitureOrderController.edit()','PUT',1,'admin','gm家具','/order/furnitureOrder','127.0.0.1','内网IP','{\"createTime\":\"2024-09-18 16:10:52\",\"createUser\":\"admin\",\"deliveryStatus\":\"0\",\"district\":\"411723\",\"dui\":1,\"id\":\"20240918161051\",\"orderStatus\":\"1\",\"orderTime\":\"2024-09-18 00:00:00\",\"orderUser\":\"111278\",\"paidMoney\":0,\"params\":{},\"paymentStatus\":\"0\",\"phoneNumber\":\"111\",\"remark\":\"3\",\"subVillage\":\"2\",\"totalMoney\":2100,\"town\":\"411723103\",\"updateBy\":\"admin\",\"updateTime\":\"2024-09-25 15:56:07\",\"village\":\"411723103001\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-25 15:56:07',61),(160,'家具订单',2,'com.ruoyi.jgc.controller.FurnitureOrderController.edit()','PUT',1,'admin','gm家具','/order/furnitureOrder','127.0.0.1','内网IP','{\"createTime\":\"2024-09-18 16:10:52\",\"createUser\":\"admin\",\"deliveryStatus\":\"0\",\"district\":\"411723\",\"dui\":1,\"id\":\"20240918161051\",\"orderStatus\":\"1\",\"orderTime\":\"2024-09-18 00:00:00\",\"orderUser\":\"111279\",\"paidMoney\":0,\"params\":{},\"paymentStatus\":\"0\",\"phoneNumber\":\"111\",\"remark\":\"3\",\"subVillage\":\"2\",\"totalMoney\":2100,\"town\":\"411723103\",\"updateBy\":\"admin\",\"updateTime\":\"2024-09-25 17:14:09\",\"village\":\"411723103001\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-25 17:14:09',24),(161,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','gm家具','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"upload_file,purchase_order,order_statistics,todos\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 10:26:44',317),(162,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','gm家具','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"purchaseOrder\",\"className\":\"PurchaseOrder\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":84,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Supplier\",\"columnComment\":\"供货方\",\"columnId\":85,\"columnName\":\"supplier\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"supplier\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PurchaseDate\",\"columnComment\":\"日期\",\"columnId\":86,\"columnName\":\"purchase_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"purchaseDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"BETWEEN\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ArrivalStatus\",\"columnComment\":\"到货状态\",\"columnId\":87,\"columnName\":\"arrival_status\",\"columnType\":\"varchar(8)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"ja','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 10:31:05',97),(163,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','gm家具','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"todos\",\"className\":\"Todos\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":93,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":94,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"详细内容\",\"columnId\":95,\"columnName\":\"content\",\"columnType\":\"varchar(1024)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"状态\",\"columnId\":96,\"columnName\":\"status\",\"columnType\":\"varchar(8)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"status\",\"javaType\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 10:35:16',99),(164,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','gm家具','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"orderStatistics\",\"className\":\"OrderStatistics\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":79,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StatcDate\",\"columnComment\":\"统计日期\",\"columnId\":80,\"columnName\":\"statc_date\",\"columnType\":\"varchar(8)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"statcDate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DateType\",\"columnComment\":\"日期类型\",\"columnId\":81,\"columnName\":\"date_type\",\"columnType\":\"varchar(8)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"dateType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DataType\",\"columnComment\":\"数据类型\",\"columnId\":82,\"columnName\":\"data_type\",\"columnType\":\"varchar(8)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"dataT','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 10:50:05',33),(165,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','gm家具','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"统计\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"statistics\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 10:51:12',36),(166,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','gm家具','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"进货\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"purchase\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 10:52:24',11),(167,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','gm家具','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"todos\",\"className\":\"Todos\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":93,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-09-29 10:35:16\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":94,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-09-29 10:35:16\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"详细内容\",\"columnId\":95,\"columnName\":\"content\",\"columnType\":\"varchar(1024)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-09-29 10:35:16\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"状态\",\"columnId\":96,\"columnName\":\"status\",\"columnType\":\"varchar(8)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"todo_status\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"is','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 11:30:36',112),(168,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','gm家具','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"todos\",\"className\":\"Todos\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":93,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-09-29 11:30:36\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":94,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-09-29 11:30:36\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"详细内容\",\"columnId\":95,\"columnName\":\"content\",\"columnType\":\"varchar(1024)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-09-29 11:30:36\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"状态\",\"columnId\":96,\"columnName\":\"status\",\"columnType\":\"varchar(8)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"todo_status\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"is','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 11:30:58',70),(169,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','gm家具','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"purchaseOrder\",\"className\":\"PurchaseOrder\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":84,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-09-29 10:31:05\",\"usableColumn\":false},{\"capJavaField\":\"Supplier\",\"columnComment\":\"供货方\",\"columnId\":85,\"columnName\":\"supplier\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"supplier\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-09-29 10:31:05\",\"usableColumn\":false},{\"capJavaField\":\"PurchaseDate\",\"columnComment\":\"日期\",\"columnId\":86,\"columnName\":\"purchase_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"purchaseDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"BETWEEN\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-09-29 10:31:05\",\"usableColumn\":false},{\"capJavaField\":\"ArrivalStatus\",\"columnComment\":\"到货状态\",\"columnId\":87,\"columnName\":\"arrival_status\",\"columnType\":\"varchar(8)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"purchase_arrival_status\",\"edit\":true,\"htmlT','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 11:32:14',45),(170,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','gm家具','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"orderStatistics\",\"className\":\"OrderStatistics\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":79,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-09-29 10:50:04\",\"usableColumn\":false},{\"capJavaField\":\"StatcDate\",\"columnComment\":\"统计日期\",\"columnId\":80,\"columnName\":\"statc_date\",\"columnType\":\"varchar(8)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"statcDate\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-09-29 10:50:04\",\"usableColumn\":false},{\"capJavaField\":\"DateType\",\"columnComment\":\"日期类型\",\"columnId\":81,\"columnName\":\"date_type\",\"columnType\":\"varchar(8)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"dateType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-09-29 10:50:04\",\"usableColumn\":false},{\"capJavaField\":\"DataType\",\"columnComment\":\"数据类型\",\"columnId\":82,\"columnName\":\"data_type\",\"columnType\":\"varchar(8)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 11:34:41',103),(171,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','gm家具','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"purchaseOrder\",\"className\":\"PurchaseOrder\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":84,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-09-29 11:32:14\",\"usableColumn\":false},{\"capJavaField\":\"Supplier\",\"columnComment\":\"供货方\",\"columnId\":85,\"columnName\":\"supplier\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"supplier\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-09-29 11:32:14\",\"usableColumn\":false},{\"capJavaField\":\"PurchaseDate\",\"columnComment\":\"日期\",\"columnId\":86,\"columnName\":\"purchase_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"purchaseDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"BETWEEN\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-09-29 11:32:14\",\"usableColumn\":false},{\"capJavaField\":\"ArrivalStatus\",\"columnComment\":\"到货状态\",\"columnId\":87,\"columnName\":\"arrival_status\",\"columnType\":\"varchar(8)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-29 10:26:44\",\"dictType\":\"purchase_arrival_status\",\"edit\":true,\"htmlT','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 11:34:55',53),(172,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','gm家具','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"order_statistics\"}',NULL,0,NULL,'2024-09-29 11:35:19',453),(173,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','gm家具','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"purchase_order\"}',NULL,0,NULL,'2024-09-29 11:43:01',122),(174,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','gm家具','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"todos\"}',NULL,0,NULL,'2024-09-29 11:43:17',106),(175,'进货单',1,'com.ruoyi.jgc.controller.PurchaseOrderController.add()','POST',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"arrivalStatus\":\"0\",\"id\":1,\"params\":{},\"phone\":\"152222212\",\"purchaseDate\":\"2024-09-29\",\"supplier\":\"张三\",\"totalAmount\":1000}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 16:00:31',63),(176,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"arrivalStatus\":\"0\",\"goodsList\":\"[{\\\"name\\\":\\\"床\\\",\\\"unitPrice\\\":1000,\\\"quantity\\\":1,\\\"totalPrice\\\":1000}]\",\"id\":1,\"params\":{},\"phone\":\"152222212\",\"purchaseDate\":\"2024-09-29\",\"supplier\":\"张三\",\"totalAmount\":1000}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 16:17:12',26),(177,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','gm家具','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"upload_file\"}',NULL,0,NULL,'2024-09-29 17:02:20',1656),(178,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"arrivalStatus\":\"0\",\"goodsList\":\"[{\\\"name\\\":\\\"床\\\",\\\"quantity\\\":1,\\\"unitPrice\\\":1000,\\\"totalPrice\\\":1000}]\",\"id\":1,\"params\":{},\"phone\":\"152222212\",\"purchaseDate\":\"2024-09-29\",\"supplier\":\"张三\",\"totalAmount\":1000}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-08 15:10:16',46),(179,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"arrivalStatus\":\"0\",\"goodsList\":\"[{\\\"name\\\":\\\"床\\\",\\\"quantity\\\":1,\\\"unitPrice\\\":1000,\\\"totalPrice\\\":1000}]\",\"id\":1,\"params\":{},\"phone\":\"152222212\",\"purchaseDate\":\"2024-09-29\",\"supplier\":\"张三\",\"totalAmount\":1000}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-08 15:54:57',23),(180,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"arrivalStatus\":\"0\",\"goodsList\":\"[{\\\"name\\\":\\\"床\\\",\\\"quantity\\\":1,\\\"unitPrice\\\":1000,\\\"totalPrice\\\":1000}]\",\"id\":1,\"params\":{},\"phone\":\"152222212\",\"purchaseDate\":\"2024-09-29\",\"supplier\":\"张三\",\"totalAmount\":1000,\"uploadFiles\":[{\"associationId\":\"1\",\"associationType\":\"PO\",\"id\":\"20241008155529A001\",\"params\":{}}]}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-08 15:55:36',31),(181,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"arrivalStatus\":\"0\",\"goodsList\":\"[{\\\"name\\\":\\\"床\\\",\\\"quantity\\\":1,\\\"unitPrice\\\":1000,\\\"totalPrice\\\":1000}]\",\"id\":1,\"params\":{},\"phone\":\"152222212\",\"purchaseDate\":\"2024-09-29\",\"supplier\":\"张三\",\"totalAmount\":1000,\"uploadFiles\":[{\"associationId\":\"1\",\"associationType\":\"PO\",\"id\":\"20241008163117A001\",\"params\":{}}]}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-08 16:32:51',55055),(182,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"arrivalStatus\":\"0\",\"goodsList\":\"[{\\\"name\\\":\\\"床\\\",\\\"quantity\\\":1,\\\"unitPrice\\\":1000,\\\"totalPrice\\\":1000}]\",\"id\":1,\"params\":{},\"phone\":\"152222212\",\"purchaseDate\":\"2024-09-29\",\"supplier\":\"张三\",\"totalAmount\":1000,\"uploadFiles\":[]}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-08 17:29:08',13430),(183,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"arrivalStatus\":\"0\",\"goodsList\":\"[{\\\"name\\\":\\\"床\\\",\\\"quantity\\\":1,\\\"unitPrice\\\":1000,\\\"totalPrice\\\":1000}]\",\"id\":1,\"params\":{},\"phone\":\"152222212\",\"purchaseDate\":\"2024-09-29\",\"supplier\":\"张三\",\"totalAmount\":1000,\"uploadFiles\":[]}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-08 17:29:39',4372),(184,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"arrivalStatus\":\"0\",\"goodsList\":\"[{\\\"name\\\":\\\"床\\\",\\\"quantity\\\":1,\\\"unitPrice\\\":1000,\\\"totalPrice\\\":1000}]\",\"id\":1,\"params\":{},\"phone\":\"152222212\",\"purchaseDate\":\"2024-09-29\",\"supplier\":\"张三\",\"totalAmount\":1000,\"uploadFiles\":[{\"associationId\":\"1\",\"associationType\":\"PO\",\"params\":{}},{\"associationId\":\"1\",\"associationType\":\"PO\",\"id\":\"20241008175506A001\",\"params\":{}}]}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-08 17:55:14',3808),(185,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"arrivalStatus\":\"0\",\"goodsList\":\"\\\"[{\\\\\\\"name\\\\\\\": \\\\\\\"床\\\\\\\", \\\\\\\"quantity\\\\\\\": 1, \\\\\\\"unitPrice\\\\\\\": 1000, \\\\\\\"totalPrice\\\\\\\": 1000}]\\\"\",\"id\":1,\"params\":{},\"phone\":\"152222212\",\"purchaseDate\":\"2024-09-29\",\"supplier\":\"张三1\",\"totalAmount\":1000,\"uploadFiles\":[]}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-10 14:49:56',134),(186,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"goodsList\":\"[{\\\"name\\\":\\\"床\\\",\\\"quantity\\\":1,\\\"unitPrice\\\":100},{\\\"name\\\":\\\"沙发\\\",\\\"unitPrice\\\":2000,\\\"quantity\\\":2}]\",\"id\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-10 15:58:42',31),(187,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"goodsList\":\"[{\\\"name\\\":\\\"床\\\",\\\"quantity\\\":1,\\\"unitPrice\\\":100},{\\\"name\\\":\\\"沙发\\\",\\\"quantity\\\":2,\\\"unitPrice\\\":2000},{\\\"name\\\":\\\"衣柜\\\",\\\"unitPrice\\\":1,\\\"quantity\\\":3500}]\",\"id\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-10 16:34:50',9),(188,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"arrivalStatus\":\"0\",\"goodsList\":\"\\\"[{\\\\\\\"name\\\\\\\": \\\\\\\"床\\\\\\\", \\\\\\\"quantity\\\\\\\": 1, \\\\\\\"unitPrice\\\\\\\": 100}, {\\\\\\\"name\\\\\\\": \\\\\\\"沙发\\\\\\\", \\\\\\\"quantity\\\\\\\": 2, \\\\\\\"unitPrice\\\\\\\": 2000}, {\\\\\\\"name\\\\\\\": \\\\\\\"衣柜\\\\\\\", \\\\\\\"quantity\\\\\\\": 3500, \\\\\\\"unitPrice\\\\\\\": 1}]\\\"\",\"id\":1,\"params\":{},\"phone\":\"152222212\",\"purchaseDate\":\"2024-09-29\",\"supplier\":\"张三2\",\"totalAmount\":1000,\"uploadFiles\":[]}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-10 16:36:51',9),(189,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"arrivalStatus\":\"0\",\"goodsList\":\"null\",\"id\":1,\"params\":{},\"phone\":\"152222212\",\"purchaseDate\":\"2024-09-29\",\"supplier\":\"张三3\",\"totalAmount\":1000,\"uploadFiles\":[]}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-10 16:53:09',8),(190,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"arrivalStatus\":\"0\",\"goodsList\":\"\\\"null\\\"\",\"id\":1,\"params\":{},\"phone\":\"152222212\",\"purchaseDate\":\"2024-09-29\",\"supplier\":\"张三4\",\"totalAmount\":1000,\"uploadFiles\":[]}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-10 17:00:09',8),(191,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"arrivalStatus\":\"0\",\"goodsList\":\"null\",\"id\":1,\"params\":{},\"phone\":\"152222212\",\"purchaseDate\":\"2024-09-29\",\"supplier\":\"张三5\",\"totalAmount\":1000,\"uploadFiles\":[]}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-10 17:00:44',7),(192,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"arrivalStatus\":\"0\",\"goodsList\":\"\\\"null\\\"\",\"id\":1,\"params\":{},\"phone\":\"152222212\",\"purchaseDate\":\"2024-09-29\",\"supplier\":\"张三6\",\"totalAmount\":1000,\"uploadFiles\":[]}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-10 17:01:21',10),(193,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"arrivalStatus\":\"0\",\"goodsList\":\"\\\"\\\\\\\"null\\\\\\\"\\\"\",\"id\":1,\"params\":{},\"phone\":\"152222212\",\"purchaseDate\":\"2024-09-29\",\"supplier\":\"张三7\",\"totalAmount\":1000,\"uploadFiles\":[]}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-10 17:01:35',32),(194,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"arrivalStatus\":\"0\",\"id\":1,\"params\":{},\"phone\":\"152222212\",\"purchaseDate\":\"2024-09-29\",\"supplier\":\"张三8\",\"totalAmount\":1000,\"uploadFiles\":[]}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-10 17:35:38',12),(195,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"goodsList\":\"[{\\\"name\\\":\\\"床\\\",\\\"unitPrice\\\":1500,\\\"quantity\\\":2}]\",\"id\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-10 17:37:45',9),(196,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"arrivalStatus\":\"0\",\"goodsList\":\"[{\\\"name\\\": \\\"床\\\", \\\"quantity\\\": 2, \\\"unitPrice\\\": 1500}]\",\"id\":1,\"params\":{},\"phone\":\"152222212\",\"purchaseDate\":\"2024-09-29\",\"supplier\":\"张三9\",\"totalAmount\":1000,\"uploadFiles\":[]}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-10 18:08:03',24),(197,'进货单',2,'com.ruoyi.jgc.controller.PurchaseOrderController.edit()','PUT',1,'admin','gm家具','/purchase/purchaseOrder','127.0.0.1','内网IP','{\"goodsList\":\"[{\\\"name\\\":\\\"床\\\",\\\"quantity\\\":2,\\\"unitPrice\\\":1500},{\\\"name\\\":\\\"沙发\\\",\\\"unitPrice\\\":2000,\\\"quantity\\\":2}]\",\"id\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-10 18:12:50',13),(198,'支付记录',1,'com.ruoyi.jgc.controller.PaymentRecordController.add()','POST',1,'admin','gm家具','/order/paymentRecord','127.0.0.1','内网IP','{\"associationType\":\"PO\",\"createBy\":\"admin\",\"id\":1,\"orderId\":\"1\",\"params\":{},\"paymentAmount\":1000,\"paymentMethod\":\"1\",\"paymentTime\":\"2024-10-11 10:45:59\",\"remark\":\"现金支付一千\"}',NULL,1,'','2024-10-11 10:51:21',67),(199,'支付记录',2,'com.ruoyi.jgc.controller.PaymentRecordController.edit()','PUT',1,'admin','gm家具','/order/paymentRecord','127.0.0.1','内网IP','{\"associationType\":\"PO\",\"createBy\":\"admin\",\"createTime\":\"2024-10-11 10:51:21\",\"id\":1,\"params\":{},\"paymentAmount\":1000,\"paymentMethod\":\"1\",\"paymentTime\":\"2024-10-11 10:45:59\",\"remark\":\"现金支付一千元\",\"updateBy\":\"admin\",\"updateTime\":\"2024-10-11 14:47:29\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-11 14:47:29',25),(200,'支付记录',2,'com.ruoyi.jgc.controller.PaymentRecordController.edit()','PUT',1,'admin','gm家具','/order/paymentRecord','127.0.0.1','内网IP','{\"associationType\":\"PO\",\"createBy\":\"admin\",\"createTime\":\"2024-10-11 10:51:21\",\"id\":1,\"params\":{},\"paymentAmount\":1000,\"paymentMethod\":\"1\",\"paymentTime\":\"2024-10-11 10:45:59\",\"remark\":\"现金支付一千\",\"updateBy\":\"admin\",\"updateTime\":\"2024-10-11 14:49:39\"}',NULL,1,'','2024-10-11 14:49:39',39),(201,'支付记录',2,'com.ruoyi.jgc.controller.PaymentRecordController.edit()','PUT',1,'admin','gm家具','/order/paymentRecord','127.0.0.1','内网IP','{\"associationType\":\"PO\",\"createBy\":\"admin\",\"createTime\":\"2024-10-11 10:51:21\",\"id\":1,\"orderId\":\"1\",\"params\":{},\"paymentAmount\":1000,\"paymentMethod\":\"1\",\"paymentTime\":\"2024-10-11 10:45:59\",\"remark\":\"现金支付一千\",\"updateBy\":\"admin\",\"updateTime\":\"2024-10-11 14:53:57\"}',NULL,1,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'id\', mode=IN, javaType=class java.lang.Long, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.lang.ClassCastException: java.lang.String cannot be cast to java.lang.Long','2024-10-11 14:53:57',44),(202,'支付记录',2,'com.ruoyi.jgc.controller.PaymentRecordController.edit()','PUT',1,'admin','gm家具','/order/paymentRecord','127.0.0.1','内网IP','{\"associationType\":\"PO\",\"createBy\":\"admin\",\"createTime\":\"2024-10-11 10:51:21\",\"id\":1,\"orderId\":\"1\",\"params\":{},\"paymentAmount\":1000,\"paymentMethod\":\"1\",\"paymentTime\":\"2024-10-11 10:45:59\",\"remark\":\"现金支付一千\",\"updateBy\":\"admin\",\"updateTime\":\"2024-10-11 14:58:13\"}',NULL,1,'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'id\', mode=IN, javaType=class java.lang.Long, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.lang.ClassCastException: java.lang.String cannot be cast to java.lang.Long','2024-10-11 14:58:13',22),(203,'支付记录',2,'com.ruoyi.jgc.controller.PaymentRecordController.edit()','PUT',1,'admin','gm家具','/order/paymentRecord','127.0.0.1','内网IP','{\"associationType\":\"PO\",\"createBy\":\"admin\",\"createTime\":\"2024-10-11 10:51:21\",\"id\":1,\"orderId\":\"1\",\"params\":{},\"paymentAmount\":1000,\"paymentMethod\":\"1\",\"paymentTime\":\"2024-10-11 10:45:59\",\"remark\":\"现金支付一千\",\"updateBy\":\"admin\",\"updateTime\":\"2024-10-11 14:58:38\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-10-11 14:58:38',62);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-09-18 14:42:37','',NULL,''),(2,'se','项目经理',2,'0','admin','2024-09-18 14:42:37','',NULL,''),(3,'hr','人力资源',3,'0','admin','2024-09-18 14:42:38','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-09-18 14:42:38','',NULL,''),(5,'deliveryman','配送员',4,'0','admin','2024-09-19 17:01:49','',NULL,NULL),(6,'hamal','搬运工',5,'0','admin','2024-09-19 17:03:23','',NULL,NULL),(7,'skillman','维修技术工',6,'0','admin','2024-09-19 17:04:19','',NULL,NULL);
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-09-18 14:42:38','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2024-09-18 14:42:38','',NULL,'普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `salary` decimal(5,2) DEFAULT '0.00' COMMENT '工资',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,100,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-10-11 15:43:03','admin','2024-09-18 14:42:37','','2024-10-11 15:43:02','管理员',0.00),(2,100,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-09-18 14:42:37','admin','2024-09-18 14:42:37','',NULL,'测试员',0.00),(100,100,'配送员-张三','配送员-张三','00','','15036536985','0','','$2a$10$LQJqQvbLyRfLGv5BKSGUxuPQtPlTUDfez6/rACqCRf/CROGxWP4.e','0','0','',NULL,'admin','2024-09-19 17:17:38','',NULL,'配送员',0.00);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2),(100,5);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(100,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;

--
-- Table structure for table `todos`
--

DROP TABLE IF EXISTS `todos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `todos` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` varchar(1024) DEFAULT NULL COMMENT '详细内容',
  `status` varchar(8) NOT NULL COMMENT '状态',
  `priority` varchar(8) DEFAULT NULL COMMENT '优先级',
  `category` varchar(8) DEFAULT NULL COMMENT '分类',
  `user_name` varchar(64) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `order_id` bigint DEFAULT NULL COMMENT '关联订单号',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todos`
--

/*!40000 ALTER TABLE `todos` DISABLE KEYS */;
/*!40000 ALTER TABLE `todos` ENABLE KEYS */;

--
-- Table structure for table `upload_file`
--

DROP TABLE IF EXISTS `upload_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file` (
  `id` varchar(32) NOT NULL,
  `association_id` varchar(64) DEFAULT NULL COMMENT '关联id',
  `association_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '关联类型',
  `file_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件类型',
  `file_name` varchar(255) NOT NULL COMMENT '文件名',
  `file_path` varchar(255) NOT NULL COMMENT '文件路径',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file`
--

/*!40000 ALTER TABLE `upload_file` DISABLE KEYS */;
INSERT INTO `upload_file` VALUES ('20241009113808A001','1','PO',NULL,'20241009113808A001.png','/profile/upload/2024/10/09/20241009113808A001.png','admin','2024-10-09 11:38:08');
/*!40000 ALTER TABLE `upload_file` ENABLE KEYS */;

--
-- Table structure for table `work_record`
--

DROP TABLE IF EXISTS `work_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `worker_id` bigint NOT NULL COMMENT '员工编号',
  `work_date` date NOT NULL COMMENT '工作日期',
  `work_period` varchar(64) DEFAULT NULL COMMENT '工作时间段',
  `delivery_time` time DEFAULT NULL COMMENT '配送时间',
  `order_id` varchar(32) DEFAULT NULL COMMENT '订单编号',
  `salary` decimal(5,2) NOT NULL COMMENT '报酬',
  `overtime_pay` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '加班费',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `delivery_id` int DEFAULT NULL COMMENT '配送编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_record`
--

/*!40000 ALTER TABLE `work_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_record` ENABLE KEYS */;

--
-- Dumping routines for database 'furniture'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-11 15:54:35
