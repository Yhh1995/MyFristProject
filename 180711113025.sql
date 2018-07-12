/*
MySQL Backup
Source Server Version: 5.7.22
Source Database: test2
Date: 2018/7/11 11:30:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bookinfo`
-- ----------------------------
DROP TABLE IF EXISTS `bookinfo`;
CREATE TABLE `bookinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `btitle` varchar(20) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  `bread` int(11) NOT NULL,
  `bcommet` int(11) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `booktest_heroinfo`
-- ----------------------------
DROP TABLE IF EXISTS `booktest_heroinfo`;
CREATE TABLE `booktest_heroinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hname` varchar(10) NOT NULL,
  `hgender` tinyint(1) NOT NULL,
  `hcontent` varchar(1000) NOT NULL,
  `isdelete` tinyint(1) NOT NULL,
  `book_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booktest_heroinfo_book_id_5b7795e475c2d6de_fk_bookinfo_id` (`book_id`),
  CONSTRAINT `booktest_heroinfo_book_id_5b7795e475c2d6de_fk_bookinfo_id` FOREIGN KEY (`book_id`) REFERENCES `bookinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
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
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1','Can add log entry','1','add_logentry'), ('2','Can change log entry','1','change_logentry'), ('3','Can delete log entry','1','delete_logentry'), ('4','Can add permission','2','add_permission'), ('5','Can change permission','2','change_permission'), ('6','Can delete permission','2','delete_permission'), ('7','Can add group','3','add_group'), ('8','Can change group','3','change_group'), ('9','Can delete group','3','delete_group'), ('10','Can add user','4','add_user'), ('11','Can change user','4','change_user'), ('12','Can delete user','4','delete_user'), ('13','Can add content type','5','add_contenttype'), ('14','Can change content type','5','change_contenttype'), ('15','Can delete content type','5','delete_contenttype'), ('16','Can add session','6','add_session'), ('17','Can change session','6','change_session'), ('18','Can delete session','6','delete_session'), ('19','Can add book info','7','add_bookinfo'), ('20','Can change book info','7','change_bookinfo'), ('21','Can delete book info','7','delete_bookinfo'), ('22','Can add hero info','8','add_heroinfo'), ('23','Can change hero info','8','change_heroinfo'), ('24','Can delete hero info','8','delete_heroinfo');
INSERT INTO `bookinfo` VALUES ('1','射雕英雄传','1980-05-01 00:00:00.000000','12','34','0'), ('2','天龙八部','1986-07-24 00:00:00.000000','36','40','1'), ('3','笑傲江湖','1995-12-24 00:00:00.000000','20','80','1'), ('4','雪山飞狐','1987-11-11 00:00:00.000000','58','24','0'), ('5','','1990-01-01 00:00:00.000000','0','0','0'), ('6','123','1997-02-02 00:00:00.000000','0','0','0');
INSERT INTO `booktest_heroinfo` VALUES ('1','郭靖','1','降龙十八掌','0','1'), ('2','黄蓉','0','打狗棍法','0','1'), ('3','黄药师','1','弹指神通','0','1'), ('4','欧阳锋','1','蛤蟆功','0','1'), ('5','梅超风','0','九阴白骨爪','0','1'), ('6','乔峰','1','降龙十八掌','0','2'), ('7','段誉','1','六脉神剑','0','2'), ('8','虚竹','1','天山六阳掌','0','2'), ('9','王语嫣','0','神仙姐姐','0','2'), ('10','令狐冲','1','独孤九剑','0','3'), ('11','任盈盈','0','弹琴','0','3'), ('12','岳不群','1','华山剑法','0','3'), ('13','东方不败','0','葵花宝典','0','3'), ('14','胡斐','1','胡家刀法','0','4'), ('15','苗若兰','0','黄衣','0','4'), ('16','程灵素','0','医术','0','4'), ('17','袁紫衣','0','六合拳','0','4');
INSERT INTO `django_content_type` VALUES ('1','admin','logentry'), ('3','auth','group'), ('2','auth','permission'), ('4','auth','user'), ('7','booktest','bookinfo'), ('8','booktest','heroinfo'), ('5','contenttypes','contenttype'), ('6','sessions','session');
INSERT INTO `django_migrations` VALUES ('1','contenttypes','0001_initial','2018-06-25 05:26:54.030109'), ('2','auth','0001_initial','2018-06-25 05:26:55.462957'), ('3','admin','0001_initial','2018-06-25 05:26:55.821641'), ('4','contenttypes','0002_remove_content_type_name','2018-06-25 05:26:55.990546'), ('5','auth','0002_alter_permission_name_max_length','2018-06-25 05:26:56.061994'), ('6','auth','0003_alter_user_email_max_length','2018-06-25 05:26:56.150122'), ('7','auth','0004_alter_user_username_opts','2018-06-25 05:26:56.185523'), ('8','auth','0005_alter_user_last_login_null','2018-06-25 05:26:56.293096'), ('9','auth','0006_require_contenttypes_0002','2018-06-25 05:26:56.298205'), ('10','booktest','0001_initial','2018-06-25 05:26:56.491353'), ('11','sessions','0001_initial','2018-06-25 05:26:56.553246');
INSERT INTO `django_session` VALUES ('fiulzy52p0m834h69gezrvxrcunzuqd8','MTNkZDE5YTU2YTBjMDAyYjBkYWQzNDFkYzRlODc0ZDExYTU3MjdmYzp7Im15bmFtZSI6ImhhaGEiLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2018-07-20 09:42:48.832934');
