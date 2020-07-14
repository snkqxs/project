/*
SQLyog Ultimate v10.00 Beta1
MySQL - 8.0.13 : Database - sysadmin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sysadmin` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `sysadmin`;

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `css` varchar(30) DEFAULT NULL,
  `href` varchar(1000) DEFAULT NULL,
  `type` tinyint(1) NOT NULL,
  `permission` varchar(50) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`parentId`,`name`,`css`,`href`,`type`,`permission`,`sort`) values (1,0,'用户管理','fa-users','',1,'',1),(2,1,'用户查询','fa-user','/api/getPage?pageName=user/user-list',1,'',2),(3,2,'查询','','',2,'sys:user:query',100),(4,2,'新增','','',2,'sys:user:add',100),(5,2,'删除',NULL,NULL,2,'sys:user:del',100),(6,1,'修改密码','fa-pencil-square-o','/api/getPage?pageName=user/user-change-password',1,'sys:user:password',4),(7,0,'系统设置','fa-gears','',1,'',5),(8,7,'菜单','fa-cog','/api/getPage?pageName=permission/permission-list',1,'',6),(9,8,'查询','','',2,'sys:menu:query',100),(10,8,'新增','','',2,'sys:menu:add',100),(11,8,'删除','','',2,'sys:menu:del',100),(12,7,'角色','fa-user-secret','/api/getPage?pageName=role/role-list',1,'',7),(13,12,'查询','','',2,'sys:role:query',100),(14,12,'新增','','',2,'sys:role:add',100),(15,12,'删除','','',2,'sys:role:del',100),(16,0,'文件管理','fa-folder-open','/api/getPage?pageName=file/file-list',1,'',8),(17,16,'查询','','',2,'sys:file:query',100),(18,16,'删除','','',2,'sys:file:del',100),(19,0,'数据源监控','fa-eye','druid/index.html',1,'',9),(20,0,'接口swagger','fa-file-pdf-o','swagger-ui.html',1,'',10),(21,0,'代码生成','fa-wrench','/api/getPage?pageName=generate/edit',1,'generate:edit',11),(22,0,'日志查询','fa-reorder','/api/getPage?pageName=log/log-list',1,'sys:log:query',13),(23,8,'修改',NULL,NULL,2,'sys:menu:edit',100),(24,12,'修改',NULL,NULL,2,'sys:role:edit',100),(25,2,'修改',NULL,NULL,2,'sys:user:edit',100);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`description`,`createTime`,`updateTime`) values (1,'ADMIN','管理员','2017-05-01 13:25:39','2019-06-04 02:25:13'),(2,'USER','普通用户','2017-08-01 21:47:31','2019-05-30 09:08:24'),(3,'TEACHER','','2019-03-27 02:10:23','2019-05-23 07:48:01'),(4,'test','test','2019-04-29 02:16:48','2019-05-22 09:51:26');

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `roleId` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`permissionId`),
  KEY `fk_sysrolepermission_permissionId` (`permissionId`),
  CONSTRAINT `fk_permission_roleId` FOREIGN KEY (`roleId`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sysrolepermission_permissionId` FOREIGN KEY (`permissionId`) REFERENCES `sys_permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`roleId`,`permissionId`) values
(1,1),(2,1),(3,1),(4,1),(1,2),(2,2),(3,2),(4,2),(1,3),(2,3),(3,3),(4,3),(1,4),(3,4),(4,4),(1,5),(2,5),(3,5),(4,5),(1,6),(2,6),(3,6),(4,6),(1,7),(3,7),(4,7),(1,8),(3,8),(4,8),(1,9),(3,9),(4,9),(1,10),(3,10),(4,10),(1,11),(3,11),(4,11),(1,12),(3,12),(4,12),(1,13),(3,13),(4,13),(1,14),(3,14),(4,14),(1,15),(3,15),(4,15),(3,16),(4,16),(3,17),(4,17),(3,18),(4,18),(1,19),(3,19),(4,19),(1,20),(2,20),(3,20),(4,20),(1,21),(2,21),(3,21),(4,21),(3,22),(4,22),(1,23),(3,23),(4,23),(1,24),(3,24),(4,24),(1,25),(2,25),(3,25),(4,25);

/*Table structure for table `sys_role_user` */

DROP TABLE IF EXISTS `sys_role_user`;

CREATE TABLE `sys_role_user` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `fk_roleId` (`roleId`),
  CONSTRAINT `fk_roleId` FOREIGN KEY (`roleId`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sys_role_user` */

insert  into `sys_role_user`(`userId`,`roleId`) values (1,1),(2,1),(18,2),(27,2),(28,2),(29,2),(30,2),(41,2),(3,3),(26,3),(32,3);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `headImgUrl` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `telephone` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`username`,`password`,`nickname`,`headImgUrl`,`phone`,`telephone`,`email`,`birthday`,`sex`,`status`,`createTime`,`updateTime`)
 values
 (1,'admin','$2a$10$4lt8EJ9UEqOUoG27oNsnvOSnH2oSUjvtEg3/V4ofN81EYrtzeRxHu','管理员',NULL,NULL,'158784879852','12@qq.com',NULL,NULL,1,'2019-04-08 00:20:51','2019-04-08 00:20:51'),
 (2,'user','$2a$10$ILWAB4ZOoRr2pXqarliI6uAuL7Q/7dAMTpWO9p7dyVSHHO7zQMTeW','用户',NULL,NULL,'1111111111','11@qq.com','2019-03-30',NULL,1,'2019-04-09 06:44:50','2020-07-13 06:02:46'),
 (18,'user1','96e79218965eb72c92a549dd5a330112','111',NULL,NULL,'123455432123','134@qq.com','2019-05-12',NULL,1,'2019-05-14 04:44:22','2019-05-14 04:44:22'),
 (26,'user2','96e79218965eb72c92a549dd5a330112','user2',NULL,NULL,'09876567890','aa@QQ.com','2019-05-12',NULL,1,'2019-05-15 02:22:21','2019-05-21 00:57:14'),(27,'user3','96e79218965eb72c92a549dd5a330112','user3',NULL,NULL,'44366758876586578','bb@qq.com','2019-05-14',NULL,1,'2019-05-15 02:23:51','2019-05-15 02:23:51'),
 (28,'user4','96e79218965eb72c92a549dd5a330112','user4',NULL,NULL,'2143323543456876','cc@qq.com','2019-04-30',NULL,1,'2019-05-15 02:24:22','2019-05-15 02:24:22'),(29,'user5','96e79218965eb72c92a549dd5a330112','user5',NULL,NULL,'1221344234565','dd@qq.com','2018-12-03',NULL,1,'2019-05-15 02:24:49','2019-05-15 02:24:49'),
 (30,'user6','96e79218965eb72c92a549dd5a330112','user6',NULL,NULL,'123213215135453','ee@qq.coom','2019-05-15',NULL,1,'2019-05-15 02:25:16','2019-05-21 03:08:26'),(32,'user7','96e79218965eb72c92a549dd5a330112','user7',NULL,NULL,'21345457980765','tt@qq.com','2019-05-20',NULL,1,'2019-05-15 06:16:32','2019-05-21 03:08:37'),
 (41,'user67','96e79218965eb72c92a549dd5a330112','user67',NULL,NULL,'123456324568','asdsa@qq.com','2019-05-14',NULL,1,'2019-05-16 08:39:11','2019-05-16 08:39:11'),
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
