/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50619
 Source Host           : localhost
 Source Database       : iapp

 Target Server Type    : MySQL
 Target Server Version : 50619
 File Encoding         : utf-8

 Date: 06/08/2016 01:45:56 AM
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `acl_resource`
-- ----------------------------
DROP TABLE IF EXISTS `acl_resource`;
CREATE TABLE `acl_resource` (
  `id` bigint(20) NOT NULL,
  `isopen` int(11) DEFAULT '1',
  `name` varchar(255) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `urls` varchar(2000) DEFAULT NULL,
  `weight` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `acl_resource`
-- ----------------------------
BEGIN;
INSERT INTO `acl_resource` VALUES ('0', '1', '资源权限树', '-1', '0', null, '0'), ('130', '1', '调研管理', '0', '0', null, '130'), ('700', '1', '系统管理', '0', '0', null, '700'), ('710', '1', '用户管理', '700', '0', null, '710'), ('720', '1', '用户组管理', '700', '0', null, '720'), ('730', '1', '组织管理', '700', '0', null, '730'), ('740', '1', '职级管理', '700', '0', null, '740');
COMMIT;

-- ----------------------------
--  Table structure for `acl_resource_domain`
-- ----------------------------
DROP TABLE IF EXISTS `acl_resource_domain`;
CREATE TABLE `acl_resource_domain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) DEFAULT NULL,
  `resourceid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `acl_role`
-- ----------------------------
DROP TABLE IF EXISTS `acl_role`;
CREATE TABLE `acl_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `acl_role`
-- ----------------------------
BEGIN;
INSERT INTO `acl_role` VALUES ('1', '-1', 'test');
COMMIT;

-- ----------------------------
--  Table structure for `acl_role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `acl_role_resource`;
CREATE TABLE `acl_role_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resourceid` bigint(20) DEFAULT NULL,
  `roleid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `acl_role_resource`
-- ----------------------------
BEGIN;
INSERT INTO `acl_role_resource` VALUES ('1', '700', '1'), ('2', '710', '1'), ('3', '720', '1'), ('4', '730', '1'), ('5', '740', '1');
COMMIT;

-- ----------------------------
--  Table structure for `acl_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `acl_role_user`;
CREATE TABLE `acl_role_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(20) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `base_account`
-- ----------------------------
DROP TABLE IF EXISTS `base_account`;
CREATE TABLE `base_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `createtime` bigint(20) NOT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `domainid` varchar(255) DEFAULT NULL,
  `lastlogintime` bigint(20) NOT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `type` smallint(6) NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `updatetime` bigint(20) NOT NULL,
  `loginnum` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `base_account`
-- ----------------------------
BEGIN;
INSERT INTO `base_account` VALUES ('1', 'tmpadmin', '0', null, '-1', '1465321485480', '58dc1583de87eaa2', '0', '10', '0', null, '0', '4'), ('2', 'test', '1465231399843', '0', '-1', '0', '80b78757276d326d', '0', '2', '255d88d80f2b488a9428078174f57741', null, '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `base_comment`
-- ----------------------------
DROP TABLE IF EXISTS `base_comment`;
CREATE TABLE `base_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` int(11) DEFAULT NULL,
  `body` varchar(4000) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `header` text,
  `pid` varchar(255) DEFAULT NULL,
  `resid` varchar(36) DEFAULT NULL,
  `restype` int(11) DEFAULT NULL,
  `touid` varchar(36) DEFAULT NULL,
  `touname` varchar(255) DEFAULT NULL,
  `uid` varchar(36) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `updatetime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `base_domain_template`
-- ----------------------------
DROP TABLE IF EXISTS `base_domain_template`;
CREATE TABLE `base_domain_template` (
  `id` varchar(40) NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `isdel` varchar(255) DEFAULT NULL,
  `mid` varchar(255) DEFAULT NULL,
  `sid` varchar(255) DEFAULT NULL,
  `tid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `base_domain_template`
-- ----------------------------
BEGIN;
INSERT INTO `base_domain_template` VALUES ('luyebind', 'luye', '0', 'm.loginbind', null, '13'), ('luyelogin', 'luye', '0', 'm.login', null, '12'), ('syngentabind', 'syngenta', '0', 'm.loginbind', null, '11'), ('syngentaindex', 'syngenta', '0', 'm.h5.index', null, '9'), ('syngentalogin', 'syngenta', '0', 'm.login', null, '10');
COMMIT;

-- ----------------------------
--  Table structure for `base_email_send_log`
-- ----------------------------
DROP TABLE IF EXISTS `base_email_send_log`;
CREATE TABLE `base_email_send_log` (
  `id` varchar(36) NOT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `errmsg` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `no` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sendtime` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `templateid` varchar(255) DEFAULT NULL,
  `tosendtime` bigint(20) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `base_email_template`
-- ----------------------------
DROP TABLE IF EXISTS `base_email_template`;
CREATE TABLE `base_email_template` (
  `id` varchar(36) NOT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `base_email_template`
-- ----------------------------
BEGIN;
INSERT INTO `base_email_template` VALUES ('1', '欢迎使用爱加油系统！', '134422323222', 'ajy', '账号开通', '账号开通通知', '0');
COMMIT;

-- ----------------------------
--  Table structure for `base_feed`
-- ----------------------------
DROP TABLE IF EXISTS `base_feed`;
CREATE TABLE `base_feed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `appid` varchar(255) DEFAULT NULL,
  `body` text,
  `createtime` bigint(20) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `resid` varchar(255) DEFAULT NULL,
  `resname` varchar(255) DEFAULT NULL,
  `restype` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `updatetime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `base_module`
-- ----------------------------
DROP TABLE IF EXISTS `base_module`;
CREATE TABLE `base_module` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `base_notify_config`
-- ----------------------------
DROP TABLE IF EXISTS `base_notify_config`;
CREATE TABLE `base_notify_config` (
  `id` varchar(36) NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `open` tinyint(1) DEFAULT '0',
  `remaindperiod` int(11) DEFAULT '7',
  `type` varchar(255) DEFAULT NULL,
  `upperlimit` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `base_praise`
-- ----------------------------
DROP TABLE IF EXISTS `base_praise`;
CREATE TABLE `base_praise` (
  `id` varchar(255) NOT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `domain` varchar(36) DEFAULT NULL,
  `resid` varchar(36) DEFAULT NULL,
  `restype` int(11) DEFAULT NULL,
  `total` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `updatetime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `base_praise_history`
-- ----------------------------
DROP TABLE IF EXISTS `base_praise_history`;
CREATE TABLE `base_praise_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cancel` int(11) NOT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `domain` varchar(36) DEFAULT NULL,
  `resid` varchar(36) DEFAULT NULL,
  `restype` int(11) DEFAULT NULL,
  `uid` varchar(36) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `updatetime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `base_question`
-- ----------------------------
DROP TABLE IF EXISTS `base_question`;
CREATE TABLE `base_question` (
  `id` varchar(255) NOT NULL,
  `answer_num` int(11) NOT NULL,
  `author_id` varchar(255) DEFAULT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `collectnum` int(11) DEFAULT NULL,
  `comment_num` int(11) NOT NULL,
  `dateCreated` bigint(20) DEFAULT NULL,
  `dateLastModified` bigint(20) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `is_set_best_answer` int(11) NOT NULL,
  `oid` varchar(255) DEFAULT NULL,
  `praisenum` int(11) DEFAULT NULL,
  `recommend_aid` varchar(255) DEFAULT NULL,
  `recommend_timestamp` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `supplement` varchar(255) DEFAULT NULL,
  `supplementNoHtml` varchar(255) DEFAULT NULL,
  `taggroup` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `userCreated` varchar(255) DEFAULT NULL,
  `userLastModified` varchar(255) DEFAULT NULL,
  `visitnum` int(11) DEFAULT NULL,
  `week_pv` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `base_questiontags`
-- ----------------------------
DROP TABLE IF EXISTS `base_questiontags`;
CREATE TABLE `base_questiontags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `questionid` varchar(255) DEFAULT NULL,
  `tagsid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `base_report_appoint`
-- ----------------------------
DROP TABLE IF EXISTS `base_report_appoint`;
CREATE TABLE `base_report_appoint` (
  `id` varchar(36) NOT NULL,
  `category` int(11) NOT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `endtime` bigint(20) DEFAULT NULL,
  `errmsg` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `no` varchar(255) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `processnum` int(11) NOT NULL,
  `processtime` bigint(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `reportname` varchar(255) DEFAULT NULL,
  `resid` varchar(255) DEFAULT NULL,
  `starttime` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `base_style_template`
-- ----------------------------
DROP TABLE IF EXISTS `base_style_template`;
CREATE TABLE `base_style_template` (
  `id` varchar(40) NOT NULL,
  `sid` varchar(255) DEFAULT NULL,
  `tid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `base_system_style`
-- ----------------------------
DROP TABLE IF EXISTS `base_system_style`;
CREATE TABLE `base_system_style` (
  `id` varchar(40) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `base_system_style`
-- ----------------------------
BEGIN;
INSERT INTO `base_system_style` VALUES ('1', 'cover path', '默认风格', '说明', '0');
COMMIT;

-- ----------------------------
--  Table structure for `base_tag`
-- ----------------------------
DROP TABLE IF EXISTS `base_tag`;
CREATE TABLE `base_tag` (
  `id` varchar(40) NOT NULL,
  `dateCreated` bigint(20) DEFAULT '0',
  `dateLastModified` bigint(20) DEFAULT '0',
  `domain` varchar(255) DEFAULT NULL,
  `idx` int(11) DEFAULT NULL,
  `isopen` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `userCreated` varchar(255) DEFAULT NULL,
  `userLastModified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `base_template`
-- ----------------------------
DROP TABLE IF EXISTS `base_template`;
CREATE TABLE `base_template` (
  `id` varchar(40) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL,
  `isdel` int(11) NOT NULL,
  `mid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `view_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `base_tenant_config`
-- ----------------------------
DROP TABLE IF EXISTS `base_tenant_config`;
CREATE TABLE `base_tenant_config` (
  `id` varchar(36) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `color` varchar(32) DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `isautosyn` tinyint(1) DEFAULT '0',
  `isfoddershare` tinyint(1) DEFAULT '0',
  `isopen` tinyint(1) NOT NULL,
  `isreply` tinyint(1) NOT NULL,
  `login_prompt` varchar(1000) DEFAULT NULL,
  `openregister` tinyint(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `replycontent` varchar(255) DEFAULT NULL,
  `sendnotify` tinyint(1) DEFAULT '0',
  `setting` varchar(2000) DEFAULT NULL,
  `shownavigation` tinyint(1) NOT NULL,
  `syncfromwx` tinyint(1) DEFAULT '0',
  `updater` varchar(255) DEFAULT NULL,
  `updatetime` bigint(20) DEFAULT NULL,
  `upperlimit` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `demo_course_ext`
-- ----------------------------
DROP TABLE IF EXISTS `demo_course_ext`;
CREATE TABLE `demo_course_ext` (
  `id` varchar(50) NOT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `ext3` varchar(255) DEFAULT NULL,
  `ext4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `demo_org`
-- ----------------------------
DROP TABLE IF EXISTS `demo_org`;
CREATE TABLE `demo_org` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `demo_user`
-- ----------------------------
DROP TABLE IF EXISTS `demo_user`;
CREATE TABLE `demo_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2F74DCA74655DB7F` (`org_id`),
  CONSTRAINT `FK2F74DCA74655DB7F` FOREIGN KEY (`org_id`) REFERENCES `demo_org` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `iapp_base_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_attachment`;
CREATE TABLE `iapp_base_attachment` (
  `id` varchar(36) NOT NULL,
  `isdel` int(11) NOT NULL,
  `module` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `suffix` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `iapp_base_authorize`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_authorize`;
CREATE TABLE `iapp_base_authorize` (
  `id` varchar(36) NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `rcategory` int(11) DEFAULT NULL,
  `rid` varchar(255) DEFAULT NULL,
  `scategory` int(11) DEFAULT NULL,
  `sid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `iapp_base_ext_index`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_ext_index`;
CREATE TABLE `iapp_base_ext_index` (
  `id` varchar(36) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `createuid` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `fileid` varchar(255) DEFAULT NULL,
  `isdel` int(11) NOT NULL,
  `modifytime` bigint(20) DEFAULT NULL,
  `modifyuid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `iapp_base_ext_index_module`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_ext_index_module`;
CREATE TABLE `iapp_base_ext_index_module` (
  `id` varchar(36) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `fileid` varchar(255) DEFAULT NULL,
  `indexid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `iapp_base_ext_resource`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_ext_resource`;
CREATE TABLE `iapp_base_ext_resource` (
  `id` varchar(36) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `isdel` int(11) NOT NULL,
  `modifytime` bigint(20) DEFAULT NULL,
  `openstatus` int(11) NOT NULL,
  `releasestatus` int(11) NOT NULL,
  `releasetime` bigint(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `resid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `iapp_base_group`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_group`;
CREATE TABLE `iapp_base_group` (
  `id` varchar(36) NOT NULL,
  `createtime` bigint(20) NOT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `isdel` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `updatetime` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `iapp_base_group`
-- ----------------------------
BEGIN;
INSERT INTO `iapp_base_group` VALUES ('402881e75526549b01552658a13d0000', '1465227190582', null, '-1', '0', 'test', '0', null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `iapp_base_joblevel`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_joblevel`;
CREATE TABLE `iapp_base_joblevel` (
  `id` varchar(40) NOT NULL,
  `depth` int(11) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `isLeaf` tinyint(1) DEFAULT NULL,
  `system_type` int(11) DEFAULT NULL,
  `isdel` int(11) DEFAULT NULL,
  `left_weight` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `right_weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK235050AE5C1B5D77` (`parent_id`),
  CONSTRAINT `FK235050AE5C1B5D77` FOREIGN KEY (`parent_id`) REFERENCES `iapp_base_joblevel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `iapp_base_joblevel`
-- ----------------------------
BEGIN;
INSERT INTO `iapp_base_joblevel` VALUES ('82c1e607-23a4-4ac4-a790-7055b1e70ca3', '3', '-1', '0', '0', '1', '3', 'test21', 'f6e4e37e-0c94-4172-969e-94447852f79f', 'test21', '4'), ('f6e4e37e-0c94-4172-969e-94447852f79f', '2', '-1', '1', '0', '0', '2', 'test', 'joblevel_-1', '', '3'), ('joblevel_-1', '1', '-1', '0', '1', '0', '1', '????', null, null, '4');
COMMIT;

-- ----------------------------
--  Table structure for `iapp_base_module`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_module`;
CREATE TABLE `iapp_base_module` (
  `id` varchar(40) NOT NULL,
  `modulename` varchar(255) DEFAULT NULL,
  `urls` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `iapp_base_module`
-- ----------------------------
BEGIN;
INSERT INTO `iapp_base_module` VALUES ('097fbde37b4a4b8ab6a424be54a000bf', '话题', '/m/ixin/topic/*,/m/ixin/ntopic/*'), ('bfa4daec527d41c797b27f7c6003ace4', '投票', '/m/ixin/vote/*,');
COMMIT;

-- ----------------------------
--  Table structure for `iapp_base_module_config`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_module_config`;
CREATE TABLE `iapp_base_module_config` (
  `id` varchar(40) NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `isopen` tinyint(1) NOT NULL,
  `moduleid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `iapp_base_module_config`
-- ----------------------------
BEGIN;
INSERT INTO `iapp_base_module_config` VALUES ('2f8e030725f74878ba2a5b64c3f0719f', 'ajy', '0', '097fbde37b4a4b8ab6a424be54a000bf'), ('e3dfc4d5ac1c44768618669a0e6f317f', 'ajy', '1', 'bfa4daec527d41c797b27f7c6003ace4');
COMMIT;

-- ----------------------------
--  Table structure for `iapp_base_organization`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_organization`;
CREATE TABLE `iapp_base_organization` (
  `id` varchar(40) NOT NULL,
  `acronym` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `cpid` int(11) NOT NULL,
  `depth` int(11) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `domainCode` varchar(255) DEFAULT NULL,
  `faxes` varchar(255) DEFAULT NULL,
  `isLeaf` tinyint(1) DEFAULT NULL,
  `system_type` int(11) DEFAULT NULL,
  `isdel` int(11) DEFAULT NULL,
  `left_weight` int(11) DEFAULT NULL,
  `linkman` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `orders` int(11) DEFAULT '0',
  `org_from` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `phone1` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `right_weight` int(11) DEFAULT NULL,
  `synchronousstatus` int(11) DEFAULT '0',
  `synctype` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FKD28BB47AAE4CB160` (`parent_id`),
  CONSTRAINT `FKD28BB47AAE4CB160` FOREIGN KEY (`parent_id`) REFERENCES `iapp_base_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `iapp_base_organization`
-- ----------------------------
BEGIN;
INSERT INTO `iapp_base_organization` VALUES ('8ee94e76-d5ff-4e78-9b23-9074f2e047dc', null, null, null, null, null, '0', '3', '-1', null, null, '1', '0', '0', '3', null, 'test12', '0', '0', 'd37aa066-f753-4280-a11c-441af06ed6bb', null, null, null, null, '', '4', '0', '0'), ('c3dda2c6-3bbb-4822-9ef5-2f3182732b12', null, null, null, null, null, '0', '3', '-1', null, null, '0', '0', '1', '9', null, 'test31', '0', '0', 'dee4fdf1-9067-43ac-8005-588b6c158e3f', null, null, null, null, null, '10', '-2', '0'), ('d37aa066-f753-4280-a11c-441af06ed6bb', null, null, null, null, null, '0', '2', '-1', null, null, '0', '0', '0', '2', null, 'test', '0', '0', 'domain_-1', null, null, null, null, '', '5', '0', '0'), ('d5755a0e-3b59-4fbc-94af-57c1f05effcf', null, null, null, null, null, '0', '2', '-1', null, null, '1', '0', '0', '6', null, 'test21', '0', '0', 'domain_-1', null, null, null, null, 'test2', '7', '0', '0'), ('dee4fdf1-9067-43ac-8005-588b6c158e3f', null, null, null, null, null, '0', '2', '-1', null, null, '1', '0', '0', '8', null, 'test3', '0', '0', 'domain_-1', null, null, null, null, null, '9', '0', '0'), ('domain_-1', null, null, null, null, null, '0', '1', '-1', null, null, '0', '1', '0', '1', null, '????', '0', '0', null, null, null, null, null, null, '10', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `iapp_base_permission`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_permission`;
CREATE TABLE `iapp_base_permission` (
  `id` varchar(40) NOT NULL,
  `app` varchar(255) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `is_del` int(11) DEFAULT NULL,
  `is_leaf` int(11) DEFAULT NULL,
  `system_type` int(11) DEFAULT NULL,
  `left_weight` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `right_weight` int(11) DEFAULT NULL,
  `source_id` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3933B2D64E24BD3C` (`parent_id`),
  CONSTRAINT `FK3933B2D64E24BD3C` FOREIGN KEY (`parent_id`) REFERENCES `iapp_base_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `iapp_base_permission`
-- ----------------------------
BEGIN;
INSERT INTO `iapp_base_permission` VALUES ('6d52c9cb-309f-4ca8-b3be-f41f391bb4f9', null, '1', 'ajy', '0', '1', '0', '1', '根', null, null, '2', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `iapp_base_read_rate`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_read_rate`;
CREATE TABLE `iapp_base_read_rate` (
  `id` varchar(36) NOT NULL,
  `complete` bigint(20) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `orgid` varchar(255) DEFAULT NULL,
  `orgname` varchar(255) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `iapp_base_role`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_role`;
CREATE TABLE `iapp_base_role` (
  `id` varchar(40) NOT NULL,
  `role_code` varchar(255) DEFAULT NULL,
  `create_date` bigint(20) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `system_type` int(11) DEFAULT NULL,
  `isdel` int(11) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `lastModify_date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `iapp_base_role_per_union`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_role_per_union`;
CREATE TABLE `iapp_base_role_per_union` (
  `id` varchar(40) NOT NULL,
  `depth` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `per_id` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `iapp_base_tenant`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_tenant`;
CREATE TABLE `iapp_base_tenant` (
  `id` varchar(36) NOT NULL,
  `admin_account` varchar(255) DEFAULT NULL,
  `admin_pwd` varchar(255) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) NOT NULL,
  `isdel` int(11) DEFAULT '0',
  `logincover` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `iapp_base_tenant`
-- ----------------------------
BEGIN;
INSERT INTO `iapp_base_tenant` VALUES ('-1', 'tmpadmin', null, null, null, '1', '0', null, null, '运营商', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `iapp_base_user`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_user`;
CREATE TABLE `iapp_base_user` (
  `id` varchar(36) NOT NULL,
  `area` varchar(255) DEFAULT NULL,
  `attentionstatus` int(11) DEFAULT '0',
  `authority` tinyint(4) DEFAULT '0',
  `avatar` varchar(255) DEFAULT NULL,
  `batch` varchar(255) DEFAULT NULL,
  `birthday` bigint(11) DEFAULT '0',
  `boardtime` bigint(20) DEFAULT NULL,
  `category` int(11) DEFAULT '0',
  `certificatecode` varchar(255) DEFAULT NULL,
  `certificatetype` int(11) DEFAULT '1',
  `createtime` bigint(20) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `effictiveend` bigint(20) DEFAULT NULL,
  `effictivestart` bigint(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enable` int(11) DEFAULT '1',
  `firstoid` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT '1',
  `isdel` int(11) DEFAULT '0',
  `isbind` int(11) DEFAULT '0',
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `offertime` bigint(20) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `synchronousstatus` int(11) DEFAULT '0',
  `synctype` int(11) DEFAULT '0',
  `temporary_mobile` varchar(255) DEFAULT NULL,
  `temporary_email` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `unitinfo` varchar(255) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `updatetime` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `usertype` int(11) DEFAULT '0',
  `oid` varchar(40) DEFAULT NULL,
  `supoid` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC060EA1232E7AE5A` (`oid`),
  KEY `FKC060EA12FDC8A54C` (`supoid`),
  CONSTRAINT `FKC060EA1232E7AE5A` FOREIGN KEY (`oid`) REFERENCES `iapp_base_organization` (`id`),
  CONSTRAINT `FKC060EA12FDC8A54C` FOREIGN KEY (`supoid`) REFERENCES `iapp_base_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `iapp_base_user`
-- ----------------------------
BEGIN;
INSERT INTO `iapp_base_user` VALUES ('0', null, '0', '0', 'FrnqyvO20f1MChdZPaUmjbey6Yzq', null, '0', null, '0', null, '1', '0', null, '-1', null, null, '', '1', null, '1', '0', '0', '', 'test', '运营商临时账号', null, null, null, '0', '0', null, null, '2', null, '0', '1465319957306', 'tmpadmin', '0', null, null), ('255d88d80f2b488a9428078174f57741', null, '0', '0', null, null, '1465228800000', '0', '0', null, '1', '1465231399302', null, '-1', null, null, '', '1', null, '1', '1', '0', null, 'test', null, '0', null, null, '0', '1', null, null, '0', null, null, '1465231530977', 'test', '0', 'domain_-1', null), ('8b2487f42e834cad9c8cf07dd3470e9c', null, '0', '0', null, null, '1307376000000', '0', '0', null, '1', '1465231474687', null, '-1', null, null, 'q732@126.com', '1', null, '1', '1', '0', '13040669999', 'test2', 'rsess', '0', null, null, '0', '1', null, null, '0', null, null, '1465231569664', 'test2', '0', 'domain_-1', null);
COMMIT;

-- ----------------------------
--  Table structure for `iapp_base_user_joblevel`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_user_joblevel`;
CREATE TABLE `iapp_base_user_joblevel` (
  `id` varchar(36) NOT NULL,
  `joblevelid` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `iapp_base_user_joblevel`
-- ----------------------------
BEGIN;
INSERT INTO `iapp_base_user_joblevel` VALUES ('402881e7552680a701552698d9a20000', 'domain_-1', '255d88d80f2b488a9428078174f57741');
COMMIT;

-- ----------------------------
--  Table structure for `iapp_base_user_org`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_user_org`;
CREATE TABLE `iapp_base_user_org` (
  `id` varchar(36) NOT NULL,
  `oid` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `iapp_base_userrole`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_base_userrole`;
CREATE TABLE `iapp_base_userrole` (
  `id` varchar(40) NOT NULL,
  `isdel` int(11) DEFAULT NULL,
  `role_id` varchar(40) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK730F1188D2CBD657` (`role_id`),
  KEY `FK730F118877F69A37` (`user_id`),
  CONSTRAINT `FK730F118877F69A37` FOREIGN KEY (`user_id`) REFERENCES `iapp_base_user` (`id`),
  CONSTRAINT `FK730F1188D2CBD657` FOREIGN KEY (`role_id`) REFERENCES `iapp_base_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `iapp_group_relation`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_group_relation`;
CREATE TABLE `iapp_group_relation` (
  `id` varchar(36) NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `gid` varchar(255) DEFAULT NULL,
  `rid` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `iapp_group_relation`
-- ----------------------------
BEGIN;
INSERT INTO `iapp_group_relation` VALUES ('402881e75526549b01552658b7c60001', '-1', '402881e75526549b01552658a13d0000', '0', '0'), ('402881e75526549b01552658c9ce0002', '-1', '402881e75526549b01552658a13d0000', 'domain_-1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `iapp_group_rule`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_group_rule`;
CREATE TABLE `iapp_group_rule` (
  `id` varchar(36) NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `gid` varchar(255) DEFAULT NULL,
  `operation` int(11) NOT NULL,
  `property` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `value` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `iapp_group_rule_config`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_group_rule_config`;
CREATE TABLE `iapp_group_rule_config` (
  `id` varchar(36) NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `entityname` varchar(255) DEFAULT NULL,
  `propertyname` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `iapp_op_log`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_op_log`;
CREATE TABLE `iapp_op_log` (
  `id` varchar(36) NOT NULL,
  `action` int(11) NOT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `failnum` int(11) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sid` varchar(255) DEFAULT NULL,
  `sync` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `iapp_topic_config`
-- ----------------------------
DROP TABLE IF EXISTS `iapp_topic_config`;
CREATE TABLE `iapp_topic_config` (
  `id` varchar(36) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `descript` varchar(2000) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ixin_activity_person`
-- ----------------------------
DROP TABLE IF EXISTS `ixin_activity_person`;
CREATE TABLE `ixin_activity_person` (
  `id` varchar(36) NOT NULL,
  `activityid` varchar(255) DEFAULT NULL,
  `createtime` bigint(20) NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `updatetime` bigint(20) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `work` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ixin_feed_back`
-- ----------------------------
DROP TABLE IF EXISTS `ixin_feed_back`;
CREATE TABLE `ixin_feed_back` (
  `id` varchar(255) NOT NULL,
  `context` varchar(255) DEFAULT NULL,
  `createTime` bigint(20) NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `keyword` varchar(1000) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ixin_task`
-- ----------------------------
DROP TABLE IF EXISTS `ixin_task`;
CREATE TABLE `ixin_task` (
  `id` varchar(36) NOT NULL,
  `begintime` bigint(20) NOT NULL,
  `coverPath` varchar(255) DEFAULT NULL,
  `createtime` bigint(20) NOT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `endtime` bigint(20) NOT NULL,
  `informtask` int(11) NOT NULL,
  `isdel` int(11) NOT NULL,
  `isopen` int(11) DEFAULT '0',
  `score` float NOT NULL,
  `taskrequire` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `updatetime` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ixin_taskuser`
-- ----------------------------
DROP TABLE IF EXISTS `ixin_taskuser`;
CREATE TABLE `ixin_taskuser` (
  `id` varchar(36) NOT NULL,
  `attachment` int(11) NOT NULL,
  `attachmenturl` varchar(255) DEFAULT NULL,
  `begintime` bigint(20) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `createtime` bigint(20) NOT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `endtime` bigint(20) NOT NULL,
  `isdel` int(11) NOT NULL,
  `score` float NOT NULL,
  `status` int(11) NOT NULL,
  `taskid` varchar(255) DEFAULT NULL,
  `taskname` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `updatetime` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ixin_token`
-- ----------------------------
DROP TABLE IF EXISTS `ixin_token`;
CREATE TABLE `ixin_token` (
  `id` varchar(36) NOT NULL,
  `aeskey` varchar(255) DEFAULT NULL,
  `agentid` varchar(255) DEFAULT NULL,
  `appId` varchar(255) DEFAULT NULL,
  `appSecret` varchar(255) DEFAULT NULL,
  `authentication` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `domain_token` varchar(255) DEFAULT NULL,
  `isEnabled` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `oauth` tinyint(1) NOT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ixin_user_vote`
-- ----------------------------
DROP TABLE IF EXISTS `ixin_user_vote`;
CREATE TABLE `ixin_user_vote` (
  `userId` varchar(36) DEFAULT NULL,
  `voteId` varchar(32) NOT NULL,
  `timestamp` bigint(20) DEFAULT '0',
  `base_uid` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ixin_user_vote`
-- ----------------------------
BEGIN;
INSERT INTO `ixin_user_vote` VALUES ('', 'c3067dc6ceba4fcba1ed4dfedbe1c1d6', '1465318974166', '0');
COMMIT;

-- ----------------------------
--  Table structure for `ixin_vote`
-- ----------------------------
DROP TABLE IF EXISTS `ixin_vote`;
CREATE TABLE `ixin_vote` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `coverPath` varchar(255) DEFAULT NULL,
  `fileId` varchar(255) DEFAULT NULL,
  `startTime` bigint(20) DEFAULT NULL,
  `endTime` bigint(20) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `del` int(11) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `voteNum` int(11) DEFAULT NULL,
  `createTime` bigint(20) DEFAULT NULL,
  `surveyOrvote` int(2) DEFAULT '0',
  `weight` bigint(20) DEFAULT '0',
  `resultconfig` varchar(255) DEFAULT '{"statistics":1,"personoption":0}',
  `showinlist` int(11) DEFAULT '0',
  `isrelease` int(11) DEFAULT '0',
  `showresult` int(11) DEFAULT '0',
  `creator` varchar(255) DEFAULT NULL,
  `creatorName` varchar(255) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `updaterName` varchar(255) DEFAULT NULL,
  `updatetime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ixin_vote`
-- ----------------------------
BEGIN;
INSERT INTO `ixin_vote` VALUES ('95d1c2d4fee245198ca8b326e2ff4ece', 'test2', 'FrnqyvO20f1MChdZPaUmjbey6Yzq', 'b84d6962bc2c4757baf0249fc9e00c4f', '1465227120000', '1466695920000', 'dd', 'ddd', '', '0', '-1', '0', '1465227150579', '1', '1465227150579', null, '0', '0', '0', '0', '运营商临时账号', '0', '运营商临时账号', '1465317011239'), ('c3067dc6ceba4fcba1ed4dfedbe1c1d6', 'test', 'FrnqyvO20f1MChdZPaUmjbey6Yzq', 'b7355c716daf467381619eefa404e590', '1465226700000', '1467300300000', '', 'test', '', '0', '-1', '1', '1465227003158', '1', '1465227003158', null, '0', '0', '0', '0', '运营商临时账号', '0', '运营商临时账号', '1465317028353'), ('e01b3eb4fb644ec2bda14cfaefa8c36e', 'test', 'FrnqyvO20f1MChdZPaUmjbey6Yzq', 'b7355c716daf467381619eefa404e590', '1465226700000', '1467300300000', '', 'test', '', '0', '-1', '0', '1465226958752', '1', '1465226958752', null, '0', '0', '0', '0', '运营商临时账号', '0', '运营商临时账号', '1465317019310'), ('e0d8390348894d5a806e231edd56bdfc', 'testssss', '', '', '0', '0', '', '', '', '0', '-1', '0', '1465311618785', '1', '1465311618785', null, '0', '0', '0', '0', '运营商临时账号', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `ixin_vote_action_detail`
-- ----------------------------
DROP TABLE IF EXISTS `ixin_vote_action_detail`;
CREATE TABLE `ixin_vote_action_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voteid` varchar(255) CHARACTER SET utf8 NOT NULL,
  `uid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `openid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `questionid` varchar(255) COLLATE utf8_bin NOT NULL,
  `optionid` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120281 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `ixin_vote_action_detail`
-- ----------------------------
BEGIN;
INSERT INTO `ixin_vote_action_detail` VALUES ('120279', 'c3067dc6ceba4fcba1ed4dfedbe1c1d6', '0', '', 'fe334e8177e34fa9be994821f0d77369', 'd171c3b32983485da7aaa60f977d111c,99538ca02b8f4c25bbdae05285c9ac8f,', '-1'), ('120280', 'c3067dc6ceba4fcba1ed4dfedbe1c1d6', '0', '', '7ade6555bd1343b691794fd50f0a7486', 'af4a19081d844b0aa663ad31f4c20220,ae51235cecd94aada87bc3a56f72763d,', '-1');
COMMIT;

-- ----------------------------
--  Table structure for `ixin_vote_option`
-- ----------------------------
DROP TABLE IF EXISTS `ixin_vote_option`;
CREATE TABLE `ixin_vote_option` (
  `id` varchar(255) NOT NULL,
  `fileId` varchar(255) DEFAULT NULL,
  `coverPath` varchar(255) DEFAULT NULL,
  `title` varchar(2000) DEFAULT NULL,
  `voteNum` int(11) DEFAULT NULL,
  `voteQuestionId` varchar(255) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT '0',
  `openId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ixin_vote_option`
-- ----------------------------
BEGIN;
INSERT INTO `ixin_vote_option` VALUES ('1bf3aa3ab6c7459ea28cb67943aa08d1', '', '', '1', '0', 'b9e7fcb59c6b49c3893f6059c10b2d31', '', '1465227157777', null), ('311c0e18367448abaa7a9b771195f15b', '', '', '3', '0', '317b0859710d4d1ab0f073b2eda163e4', '', '1465227060066', null), ('633dd8d6fd7e46d2b06b35a9c97b24cd', null, null, '5', '0', 'aacb370d2b024a4dba8b50fe3634e13f', '', '1465227076108', null), ('75043f7f70ac4f92a66397ad17770c02', null, null, '1', '0', 'aacb370d2b024a4dba8b50fe3634e13f', '', '1465227076104', null), ('763e472ef148474dbecc2b4b5db57a15', '', '', '2', '0', '317b0859710d4d1ab0f073b2eda163e4', '', '1465227060060', null), ('76d1db22dec84124a8b6f57f1d08e32d', null, null, '2', '0', 'aacb370d2b024a4dba8b50fe3634e13f', '', '1465227076105', null), ('984bc97e93774f53b2b189e7234aa8c3', '', '', '1', '0', '317b0859710d4d1ab0f073b2eda163e4', '', '1465227060055', null), ('99538ca02b8f4c25bbdae05285c9ac8f', '', '', 'test', '1', 'fe334e8177e34fa9be994821f0d77369', '', '1465227028522', null), ('a52ebeda31a048d5823d73165daac2aa', null, null, '4', '0', 'aacb370d2b024a4dba8b50fe3634e13f', '', '1465227076107', null), ('ae51235cecd94aada87bc3a56f72763d', '', '', '2', '1', '7ade6555bd1343b691794fd50f0a7486', '', '1465227093776', null), ('af4a19081d844b0aa663ad31f4c20220', '', '', '1', '1', '7ade6555bd1343b691794fd50f0a7486', '', '1465227093770', null), ('d171c3b32983485da7aaa60f977d111c', 'adb5bc5e46c64a6b82e568f475aa2012', 'FrnqyvO20f1MChdZPaUmjbey6Yzq', 'test', '1', 'fe334e8177e34fa9be994821f0d77369', '', '1465227028486', null), ('e2babce62e26439db6ecd69a3f68dceb', null, null, '3', '0', 'aacb370d2b024a4dba8b50fe3634e13f', '', '1465227076106', null), ('e38c72fe2c6042c291e0fa9518b93514', '', '', '1', '0', 'b9e7fcb59c6b49c3893f6059c10b2d31', '', '1465227157783', null);
COMMIT;

-- ----------------------------
--  Table structure for `ixin_vote_question`
-- ----------------------------
DROP TABLE IF EXISTS `ixin_vote_question`;
CREATE TABLE `ixin_vote_question` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `voteId` varchar(255) DEFAULT NULL,
  `voteNum` int(11) DEFAULT NULL,
  `must` int(11) DEFAULT '1',
  `weight` bigint(20) DEFAULT '0',
  `timestamp` bigint(20) DEFAULT '0',
  `maxChooseNum` int(3) DEFAULT '0',
  `minChooseNum` int(3) DEFAULT '0',
  `domain` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `optionid` varchar(255) DEFAULT NULL,
  `questionid` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ixin_vote_question`
-- ----------------------------
BEGIN;
INSERT INTO `ixin_vote_question` VALUES ('317b0859710d4d1ab0f073b2eda163e4', 'test2', '2', 'c3067dc6ceba4fcba1ed4dfedbe1c1d6', '0', '1', '1465227060049', '1465227060050', '3', '2', null, null, null, null, null), ('7ade6555bd1343b691794fd50f0a7486', 'test6', '1', 'c3067dc6ceba4fcba1ed4dfedbe1c1d6', '1', '1', '1465227093765', '1465227093765', '0', '0', null, null, null, null, null), ('9279a2a0248c4f23bea53a678ab2eec6', '??', '5', 'c3067dc6ceba4fcba1ed4dfedbe1c1d6', '0', '0', '1465227084395', '1465227084395', '0', '0', null, null, null, null, null), ('aacb370d2b024a4dba8b50fe3634e13f', 'test4', '4', 'c3067dc6ceba4fcba1ed4dfedbe1c1d6', '0', '1', '1465227076090', '1465227076091', '0', '0', null, null, null, null, null), ('b9e7fcb59c6b49c3893f6059c10b2d31', 'test1', '1', '95d1c2d4fee245198ca8b326e2ff4ece', '0', '1', '1465227157767', '1465227157768', '0', '0', null, null, null, null, null), ('da58c36d980347a1b9b550e9918df1c9', 'test4', '3', 'c3067dc6ceba4fcba1ed4dfedbe1c1d6', '0', '0', '1465227070169', '1465227070169', '0', '0', null, null, null, null, null), ('fe334e8177e34fa9be994821f0d77369', 'test', '1', 'c3067dc6ceba4fcba1ed4dfedbe1c1d6', '1', '1', '1465227028478', '1465227028479', '0', '0', null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `report_visit_statistics`
-- ----------------------------
DROP TABLE IF EXISTS `report_visit_statistics`;
CREATE TABLE `report_visit_statistics` (
  `id` varchar(36) NOT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `rid` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `value` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_model` (`model`),
  KEY `idx_rid` (`rid`),
  KEY `idx_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sns_daily_sign`
-- ----------------------------
DROP TABLE IF EXISTS `sns_daily_sign`;
CREATE TABLE `sns_daily_sign` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(255) DEFAULT NULL,
  `credit` int(11) NOT NULL,
  `device` int(11) NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `timestamp` bigint(20) NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `study_course`
-- ----------------------------
DROP TABLE IF EXISTS `study_course`;
CREATE TABLE `study_course` (
  `id` varchar(40) NOT NULL,
  `app` varchar(40) DEFAULT NULL,
  `completepercent` decimal(19,2) DEFAULT NULL,
  `containvideo` int(11) DEFAULT '0',
  `no` varchar(255) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `creator` varchar(40) DEFAULT NULL,
  `descript` varchar(255) DEFAULT NULL,
  `domainid` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `isdel` int(11) DEFAULT NULL,
  `lecturername` varchar(255) DEFAULT NULL,
  `length` decimal(19,2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `openstate` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `released` int(11) DEFAULT NULL,
  `releasetime` bigint(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `resid` varchar(40) DEFAULT NULL,
  `restype` int(11) DEFAULT NULL,
  `score` int(11) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `startpage` varchar(255) DEFAULT NULL,
  `supportmobile` smallint(6) DEFAULT '0',
  `tid` varchar(255) DEFAULT NULL,
  `topindex` int(11) DEFAULT '0',
  `updatetime` bigint(20) DEFAULT NULL,
  `updater` varchar(40) DEFAULT NULL,
  `expiretime` bigint(20) DEFAULT NULL,
  `categoryid` varchar(40) DEFAULT NULL,
  `coursewareid` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE6DB6B516FEC30C6` (`categoryid`),
  KEY `FKE6DB6B515FB6133F` (`coursewareid`),
  CONSTRAINT `FKE6DB6B515FB6133F` FOREIGN KEY (`coursewareid`) REFERENCES `study_courseware` (`id`),
  CONSTRAINT `FKE6DB6B516FEC30C6` FOREIGN KEY (`categoryid`) REFERENCES `study_course_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `study_course_category`
-- ----------------------------
DROP TABLE IF EXISTS `study_course_category`;
CREATE TABLE `study_course_category` (
  `id` varchar(40) NOT NULL,
  `app` varchar(255) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `is_del` int(11) DEFAULT NULL,
  `is_leaf` int(11) DEFAULT NULL,
  `system_type` int(11) DEFAULT NULL,
  `left_weight` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `right_weight` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA571AE2C9E0B5EFD` (`parent_id`),
  CONSTRAINT `FKA571AE2C9E0B5EFD` FOREIGN KEY (`parent_id`) REFERENCES `study_course_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `study_course_category`
-- ----------------------------
BEGIN;
INSERT INTO `study_course_category` VALUES ('25e9ee4c-2e9d-4d6b-b639-3827ae98b18d', null, '1387163225000', null, '1', 'ajy', '0', '1', '1', '1', '根', null, null, '2', null, '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `study_course_filemanager`
-- ----------------------------
DROP TABLE IF EXISTS `study_course_filemanager`;
CREATE TABLE `study_course_filemanager` (
  `id` varchar(40) NOT NULL,
  `app` varchar(255) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `is_hidden` varchar(255) DEFAULT NULL,
  `isdel` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `relative_path` varchar(255) DEFAULT NULL,
  `save_name` varchar(255) DEFAULT NULL,
  `size` bigint(20) NOT NULL,
  `source_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `suffix` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `study_courseware`
-- ----------------------------
DROP TABLE IF EXISTS `study_courseware`;
CREATE TABLE `study_courseware` (
  `id` varchar(40) NOT NULL,
  `app` varchar(255) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `filemanager_id` varchar(255) DEFAULT NULL,
  `isdel` varchar(255) DEFAULT NULL,
  `item_path` varchar(255) DEFAULT NULL,
  `length` decimal(19,2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `size` decimal(19,2) DEFAULT NULL,
  `start_page` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `ware_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `study_courseware_chapter`
-- ----------------------------
DROP TABLE IF EXISTS `study_courseware_chapter`;
CREATE TABLE `study_courseware_chapter` (
  `id` varchar(40) NOT NULL,
  `chapterDTOidentifier` varchar(255) DEFAULT NULL,
  `chapterDTOparent_id` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `courseware_id` varchar(255) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `is_del` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `study_package`
-- ----------------------------
DROP TABLE IF EXISTS `study_package`;
CREATE TABLE `study_package` (
  `id` varchar(40) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT '0',
  `creator` varchar(40) DEFAULT NULL,
  `descript` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `expiretime` bigint(20) DEFAULT '-1',
  `isdel` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `openstate` int(11) DEFAULT '1',
  `released` int(11) DEFAULT '1',
  `releasetime` bigint(20) DEFAULT '0',
  `sort` bigint(20) DEFAULT '0',
  `supportmobile` smallint(6) DEFAULT '0',
  `topindex` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '0',
  `updater` varchar(40) DEFAULT NULL,
  `updatetime` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `study_package_category`
-- ----------------------------
DROP TABLE IF EXISTS `study_package_category`;
CREATE TABLE `study_package_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `categoryid` varchar(255) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT '0',
  `domain` varchar(255) DEFAULT NULL,
  `packageid` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `updater` varchar(40) DEFAULT NULL,
  `updatetime` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `study_package_course`
-- ----------------------------
DROP TABLE IF EXISTS `study_package_course`;
CREATE TABLE `study_package_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `courseid` varchar(255) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT '0',
  `creator` varchar(40) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `packageid` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `updater` varchar(40) DEFAULT NULL,
  `updatetime` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user_track`
-- ----------------------------
DROP TABLE IF EXISTS `user_track`;
CREATE TABLE `user_track` (
  `id` varchar(36) NOT NULL,
  `agent` varchar(2000) DEFAULT NULL,
  `device` int(11) DEFAULT '1',
  `domain` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `openId` varchar(255) DEFAULT NULL,
  `request_method` varchar(255) DEFAULT NULL,
  `rid` varchar(255) DEFAULT NULL,
  `sessionid` varchar(255) DEFAULT NULL,
  `time` bigint(20) DEFAULT '0',
  `uid` varchar(255) DEFAULT NULL,
  `url` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user_track`
-- ----------------------------
BEGIN;
INSERT INTO `user_track` VALUES ('10bb5651b62f4cbdb8ff74b79f5ab55f', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465316474185', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('143ef6c1d54648ac9df80de1fd9e72c7', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'C06CA5D6766DB9CA4E6982D6894C3F91', '1465314207536', '0', 'http://localhost:8080/student/user/avatar/0.xhtml?style=128x128'), ('1b06717d5118448ba408dc76b572dfda', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465310244596', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('1b6b4a8e098d4400b68b0ef4dfb4d258', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'C06CA5D6766DB9CA4E6982D6894C3F91', '1465314207479', '0', 'http://localhost:8080/student/index.xhtml'), ('1d3af52b88ed4c9f9ef1704552e6969e', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465317418588', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('1d9e447c7b60495289831f20826cb30a', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'DED3C3E93F68C54D8AD1FC6FD4ACDFA0', '1465313637920', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('1e6103dd6c29463783eadc83c3d6142f', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465317809463', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('1ec1e0c4a9df4e4f98bcc5efe51af86a', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465317304933', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('1f08113c1c9d47b4b70486f22cf043e5', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465317635943', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('25b882f95e4743f1bfa270b7cfe6e625', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'C06CA5D6766DB9CA4E6982D6894C3F91', '1465314270458', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('269f5a0054a44a3d99ca5fce474168ae', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465310261625', '0', 'http://localhost:8080/student/user/avatar/0.xhtml?style=128x128'), ('277a56ccd9534d028d022068495a88f5', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '87A1C78C739C8E0071041E03D3369FC8', '1465308888536', '0', 'http://localhost:8080/student/user/avatar/0.xhtml?style=128x128'), ('2bbddc3ead514dca987d8236b69aa239', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465310530548', '0', 'http://localhost:8080/student/user/center.xhtml'), ('2e2f94e155494c74baaf34a21911caf6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 'ajy', '0:0:0:0:0:0:0:1', null, '', 'get', null, '87A1C78C739C8E0071041E03D3369FC8', '1465308101765', null, 'http://localhost:8080/student/login.xhtml'), ('2ec1cce2fcb942048ec363994476a3cf', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465316999425', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('2fa7a6eff0a1451eadf922481fac30df', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465311515253', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('320c3d430a3d41bfa0c7fffead98c17e', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465310246150', '0', 'http://localhost:8080/student/index.xhtml'), ('322c46e73c0b412abe0c693088f88da2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '21A777E7E374474E6F0DD03B90E119B4', '1465321197568', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('32a6af59b0924235882de64db816d63c', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'post', null, '2B05D58588EF4B90A95559ADC0B918A0', '1465319930066', '0', 'http://localhost:8080/student/login.xhtml'), ('3624d67d352d4460af1c3f5eb86c4bcd', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 'ajy', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'C06CA5D6766DB9CA4E6982D6894C3F91', '1465314200347', null, 'http://localhost:8080/student/login.xhtml'), ('393050dfd73e481b8d3ac9dd41809e99', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465317760834', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('3a687df275074b9790a6c62c3392b3ee', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '87A1C78C739C8E0071041E03D3369FC8', '1465308914525', '0', 'http://localhost:8080/student/exam/me.xhtml'), ('3a9ac3bffddc4dc3b5bde5a0baedb0b9', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465310261338', '0', 'http://localhost:8080/student/index.xhtml'), ('3ae64f977d7d46229b19ddf28fc057f3', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '21A777E7E374474E6F0DD03B90E119B4', '1465321218577', '0', 'http://localhost:8080/student/user/center.xhtml'), ('3d9516e662b244288097f1971bb4cc54', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465314741561', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('402881e755269ef80155269f8fb90000', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465231839135', '0', 'http://localhost:8888/iapp/base/admin/user/usermanage.xhtml'), ('402881e755269ef80155269fcdba0001', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465231855029', '0', 'http://localhost:8888/iapp/base/admin/user/usermanage.xhtml'), ('402881e755269ef8015526a1174f0002', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465231939402', '0', 'http://localhost:8888/iapp/base/admin/user/usermanage.xhtml'), ('402881e755269ef8015526a11da50003', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465231941024', '0', 'http://localhost:8888/iapp/base/admin//acl/role/index.xhtml'), ('402881e755269ef8015526a122960004', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465231942290', '0', 'http://localhost:8888/iapp/base/admin/joblevel/index.xhtml'), ('402881e755269ef8015526a125ca0005', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465231943111', '0', 'http://localhost:8888/iapp/base/admin/organization/organization.xhtml'), ('402881e755269ef8015526a127420006', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'post', null, '3A4046E586602838A79B554754252076', '1465231943488', '0', 'http://localhost:8888/iapp/base/admin/organization/org_detail.xhtml'), ('402881e755269ef8015526a128900007', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465231943821', '0', 'http://localhost:8888/iapp/base/admin/usergroup/group.xhtml'), ('402881e755269ef8015526a12b240008', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465231944480', '0', 'http://localhost:8888/iapp/base/admin/user/usermanage.xhtml'), ('402881e755269ef8015526a12e4f0009', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465231945290', '0', 'http://localhost:8888/iapp/mgr/vote/index.xhtml?surveyOrvote=1'), ('402881e755269ef8015526a12f28000a', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465231945508', '0', 'http://localhost:8888/iapp/mgr/include/votelist.xhtml?currPage=1&surveyOrvote=1&search='), ('402881e755269ef8015526a50c64000b', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465232198752', '0', 'http://localhost:8888/iapp/mgr/vote/index.xhtml?surveyOrvote=1'), ('402881e755269ef8015526a50d58000c', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465232198997', '0', 'http://localhost:8888/iapp/mgr/include/votelist.xhtml?currPage=1&surveyOrvote=1&search='), ('402881e755269ef8015526a51444000d', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465232200768', '0', 'http://localhost:8888/iapp/base/admin/user/usermanage.xhtml'), ('402881e755269ef8015526a518d7000e', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465232201922', '0', 'http://localhost:8888/iapp/base/admin/organization/organization.xhtml'), ('402881e755269ef8015526a51a79000f', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'post', null, '3A4046E586602838A79B554754252076', '1465232202358', '0', 'http://localhost:8888/iapp/base/admin/organization/org_detail.xhtml'), ('402881e755269ef8015526a51be50010', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465232202721', '0', 'http://localhost:8888/iapp/base/admin/usergroup/group.xhtml'), ('402881e755269ef8015526a51e7d0011', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465232203380', '0', 'http://localhost:8888/iapp/base/admin/joblevel/index.xhtml'), ('402881e755269ef8015526a520cf0012', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465232203980', '0', 'http://localhost:8888/iapp/base/admin//acl/role/index.xhtml'), ('402881e755269ef8015526a53bbb0013', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465232210871', '0', 'http://localhost:8888/iapp/mgr/tomodify.xhtml'), ('402881e755269ef8015526a5c9170014', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', null, null, null, '', 'get', null, '3A4046E586602838A79B554754252076', '1465232247061', '-1', 'http://localhost:8888/iapp/mgr/logout.xhtml'), ('402881e755269ef8015526a5c92c0015', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '', null, null, '', 'get', null, 'F6B8BDCE9C5147BC5DBD994E75ED1FE4', '1465232247081', '-1', 'http://localhost:8888/iapp/mgr/login.xhtml'), ('402881e755269ef8015526a5e1090016', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'post', null, 'F6B8BDCE9C5147BC5DBD994E75ED1FE4', '1465232253191', '0', 'http://localhost:8888/iapp/mgr/login.xhtml'), ('402881e755269ef8015526a5e12d0017', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, 'F6B8BDCE9C5147BC5DBD994E75ED1FE4', '1465232253226', '0', 'http://localhost:8888/iapp/mgr/index.xhtml'), ('402881e755269ef8015526a73d0f0018', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, 'F6B8BDCE9C5147BC5DBD994E75ED1FE4', '1465232342283', '0', 'http://localhost:8888/iapp/mgr/index.xhtml'), ('402881e755269ef8015526a91bb50019', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, 'F6B8BDCE9C5147BC5DBD994E75ED1FE4', '1465232464819', '0', 'http://localhost:8888/iapp/mgr/index.xhtml'), ('402881e755269ef8015526a924ea001a', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, 'F6B8BDCE9C5147BC5DBD994E75ED1FE4', '1465232467175', '0', 'http://localhost:8888/iapp/mgr/vote/index.xhtml?surveyOrvote=1'), ('402881e755269ef8015526a92582001b', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, 'F6B8BDCE9C5147BC5DBD994E75ED1FE4', '1465232467326', '0', 'http://localhost:8888/iapp/mgr/include/votelist.xhtml?currPage=1&surveyOrvote=1&search='), ('402881e755269ef8015526a92f1a001c', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, 'F6B8BDCE9C5147BC5DBD994E75ED1FE4', '1465232469783', '0', 'http://localhost:8888/iapp/mgr/index.xhtml'), ('402881e75526addb015526ae798f0000', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, 'D90ADEC5AA93DFD64B4A4E8952CC1945', '1465232816492', '0', 'http://localhost:8888/iapp/mgr/index.xhtml'), ('402881e75526addb015526ae86fc0001', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, 'D90ADEC5AA93DFD64B4A4E8952CC1945', '1465232819959', '0', 'http://localhost:8888/iapp/mgr/vote/index.xhtml?surveyOrvote=1'), ('402881e75526addb015526ae88d10002', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, 'D90ADEC5AA93DFD64B4A4E8952CC1945', '1465232820431', '0', 'http://localhost:8888/iapp/mgr/include/votelist.xhtml?currPage=1&surveyOrvote=1&search='), ('402881e75526addb015526ae92430003', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, 'D90ADEC5AA93DFD64B4A4E8952CC1945', '1465232822845', '0', 'http://localhost:8888/iapp/base/admin/user/usermanage.xhtml'), ('402881e9552b56a301552b5770110000', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0EEC5192CF72CDB13F0C1F556A542641', '1465310998477', '0', 'http://localhost:8888/iapp/mgr/index.xhtml'), ('402881e9552b56a301552b577d1c0001', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0EEC5192CF72CDB13F0C1F556A542641', '1465311001879', '0', 'http://localhost:8888/iapp/mgr/vote/index.xhtml?surveyOrvote=1'), ('402881e9552b56a301552b57819d0002', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0EEC5192CF72CDB13F0C1F556A542641', '1465311003034', '0', 'http://localhost:8888/iapp/mgr/include/votelist.xhtml?currPage=1&surveyOrvote=1&search='), ('402881e9552b56a301552b5d86960003', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0EEC5192CF72CDB13F0C1F556A542641', '1465311397523', '0', 'http://localhost:8888/iapp/mgr/vote/update.xhtml?id=95d1c2d4fee245198ca8b326e2ff4ece'), ('402881e9552b56a301552b60b16a0004', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0EEC5192CF72CDB13F0C1F556A542641', '1465311605088', '0', 'http://localhost:8888/iapp/mgr/vote/index.xhtml?surveyOrvote=1'), ('402881e9552b56a301552b60b2760005', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0EEC5192CF72CDB13F0C1F556A542641', '1465311605362', '0', 'http://localhost:8888/iapp/mgr/include/votelist.xhtml?currPage=1&surveyOrvote=1&search='), ('402881e9552b56a301552b60b74d0006', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0EEC5192CF72CDB13F0C1F556A542641', '1465311606602', '0', 'http://localhost:8888/iapp/mgr/vote/add.xhtml'), ('402881e9552b56a301552b60e7190007', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'post', null, '0EEC5192CF72CDB13F0C1F556A542641', '1465311618838', '0', 'http://localhost:8888/iapp/mgr/vote/savestep1.xhtml'), ('402881e9552b56a301552b60e8fa0008', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0EEC5192CF72CDB13F0C1F556A542641', '1465311619319', '0', 'http://localhost:8888/iapp/mgr/vote/e0d8390348894d5a806e231edd56bdfc.xhtml'), ('402881e9552b56a301552b60eb710009', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0EEC5192CF72CDB13F0C1F556A542641', '1465311619950', '0', 'http://localhost:8888/iapp/mgr/include/votequestionlist.xhtml?voteId=e0d8390348894d5a806e231edd56bdfc'), ('402881e9552b56a301552b60f2db000a', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0EEC5192CF72CDB13F0C1F556A542641', '1465311621839', '0', 'http://localhost:8888/iapp/mgr/vote/index.xhtml?surveyOrvote=1'), ('402881e9552b56a301552b60f3c1000b', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0EEC5192CF72CDB13F0C1F556A542641', '1465311622076', '0', 'http://localhost:8888/iapp/mgr/include/votelist.xhtml?currPage=1&surveyOrvote=1&search='), ('402881e9552b56a301552b61e998000c', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0EEC5192CF72CDB13F0C1F556A542641', '1465311684982', '0', 'http://localhost:8888/iapp/mgr/vote/index.xhtml?surveyOrvote=1'), ('402881e9552b56a301552b61eaa6000d', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0EEC5192CF72CDB13F0C1F556A542641', '1465311685284', '0', 'http://localhost:8888/iapp/mgr/include/votelist.xhtml?currPage=1&surveyOrvote=1&search='), ('402881e9552b56a301552b64fad3000e', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0EEC5192CF72CDB13F0C1F556A542641', '1465311886032', '0', 'http://localhost:8888/iapp/mgr/vote/update.xhtml?id=e0d8390348894d5a806e231edd56bdfc'), ('402881e9552b56a301552b7ac3e4000f', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0EEC5192CF72CDB13F0C1F556A542641', '1465313313760', '0', 'http://localhost:8888/iapp/mgr/vote/update.xhtml?id=e01b3eb4fb644ec2bda14cfaefa8c36e'), ('402881e9552b56a301552b7b3a710010', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0EEC5192CF72CDB13F0C1F556A542641', '1465313344109', '0', 'http://localhost:8888/iapp/mgr/vote/update.xhtml?id=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('402881e9552b56a301552bb3134b0011', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0E78620E9BAE45E34B432F2B5C59BED3', '1465317004102', '0', 'http://localhost:8888/iapp/mgr/vote/index.xhtml?surveyOrvote=1'), ('402881e9552b56a301552bb3143a0012', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0E78620E9BAE45E34B432F2B5C59BED3', '1465317004344', '0', 'http://localhost:8888/iapp/mgr/include/votelist.xhtml?currPage=1&surveyOrvote=1&search='), ('402881e9552b56a301552bb3275a0013', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0E78620E9BAE45E34B432F2B5C59BED3', '1465317009240', '0', 'http://localhost:8888/iapp/mgr/vote/update.xhtml?id=95d1c2d4fee245198ca8b326e2ff4ece'), ('402881e9552b56a301552bb32f340014', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'post', null, '0E78620E9BAE45E34B432F2B5C59BED3', '1465317011249', '0', 'http://localhost:8888/iapp/mgr/vote/savestep1.xhtml'), ('402881e9552b56a301552bb32f570015', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0E78620E9BAE45E34B432F2B5C59BED3', '1465317011284', '0', 'http://localhost:8888/iapp/mgr/vote/95d1c2d4fee245198ca8b326e2ff4ece.xhtml'), ('402881e9552b56a301552bb330820016', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0E78620E9BAE45E34B432F2B5C59BED3', '1465317011584', '0', 'http://localhost:8888/iapp/mgr/include/votequestionlist.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('402881e9552b56a301552bb33bfb0017', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0E78620E9BAE45E34B432F2B5C59BED3', '1465317014520', '0', 'http://localhost:8888/iapp/mgr/vote/index.xhtml?surveyOrvote=1'), ('402881e9552b56a301552bb33cac0018', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0E78620E9BAE45E34B432F2B5C59BED3', '1465317014697', '0', 'http://localhost:8888/iapp/mgr/include/votelist.xhtml?currPage=1&surveyOrvote=1&search='), ('402881e9552b56a301552bb346a30019', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0E78620E9BAE45E34B432F2B5C59BED3', '1465317017248', '0', 'http://localhost:8888/iapp/mgr/vote/update.xhtml?id=e01b3eb4fb644ec2bda14cfaefa8c36e'), ('402881e9552b56a301552bb34eb6001a', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'post', null, '0E78620E9BAE45E34B432F2B5C59BED3', '1465317019316', '0', 'http://localhost:8888/iapp/mgr/vote/savestep1.xhtml'), ('402881e9552b56a301552bb34ed4001b', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0E78620E9BAE45E34B432F2B5C59BED3', '1465317019343', '0', 'http://localhost:8888/iapp/mgr/vote/e01b3eb4fb644ec2bda14cfaefa8c36e.xhtml'), ('402881e9552b56a301552bb34fbf001c', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0E78620E9BAE45E34B432F2B5C59BED3', '1465317019580', '0', 'http://localhost:8888/iapp/mgr/include/votequestionlist.xhtml?voteId=e01b3eb4fb644ec2bda14cfaefa8c36e'), ('402881e9552b56a301552bb35cd5001d', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0E78620E9BAE45E34B432F2B5C59BED3', '1465317022929', '0', 'http://localhost:8888/iapp/mgr/vote/index.xhtml?surveyOrvote=1'), ('402881e9552b56a301552bb35d6a001e', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0E78620E9BAE45E34B432F2B5C59BED3', '1465317023078', '0', 'http://localhost:8888/iapp/mgr/include/votelist.xhtml?currPage=1&surveyOrvote=1&search='), ('402881e9552b56a301552bb36b92001f', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0E78620E9BAE45E34B432F2B5C59BED3', '1465317026703', '0', 'http://localhost:8888/iapp/mgr/vote/update.xhtml?id=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('402881e9552b56a301552bb372080020', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'post', null, '0E78620E9BAE45E34B432F2B5C59BED3', '1465317028358', '0', 'http://localhost:8888/iapp/mgr/vote/savestep1.xhtml'), ('402881e9552b56a301552bb372220021', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0E78620E9BAE45E34B432F2B5C59BED3', '1465317028384', '0', 'http://localhost:8888/iapp/mgr/vote/c3067dc6ceba4fcba1ed4dfedbe1c1d6.xhtml'), ('402881e9552b56a301552bb373110022', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', null, null, '', 'get', null, '0E78620E9BAE45E34B432F2B5C59BED3', '1465317028620', '0', 'http://localhost:8888/iapp/mgr/include/votequestionlist.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('411825c1e25746108df12d8b71b54f55', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465310534331', '0', 'http://localhost:8080/student/user/center.xhtml'), ('4531b6892c1d47489fb6e74ba34ce809', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'AB0332A7A76741BC7A8C55FE5A2C9B71', '1465318961148', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('45513fc5c369492685828ce273834ef8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'DED3C3E93F68C54D8AD1FC6FD4ACDFA0', '1465313817003', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('48fbd3c38ffc43e4ba50e6fe4dfd733b', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465317719715', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('4d8e0a337e72414ea302b53f48d3256a', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '21A777E7E374474E6F0DD03B90E119B4', '1465321198258', '0', 'http://localhost:8080/student/user/center.xhtml'), ('4fd4e3b16d184aca85e69d6e16c9b0be', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465310544423', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('4fd8cf5e0af442ea882ce790378fa82b', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'AB0332A7A76741BC7A8C55FE5A2C9B71', '1465319830013', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('50fbd578bbf844e8831792eeedebe190', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'AB0332A7A76741BC7A8C55FE5A2C9B71', '1465319103984', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('520d448613854897b41f82509cb8952b', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465311580285', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('596f0aeaf6c146cc9596112c6224d0f1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'AB0332A7A76741BC7A8C55FE5A2C9B71', '1465318450432', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('5d79643f1e364e5ab7ce3e4d0dafa45d', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '21A777E7E374474E6F0DD03B90E119B4', '1465321485480', '0', 'http://localhost:8080/student/user/center.xhtml'), ('5f81a689240f42c0b62a9326df40dc88', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 'ajy', '0:0:0:0:0:0:0:1', null, '', 'get', null, '87A1C78C739C8E0071041E03D3369FC8', '1465308402213', null, 'http://localhost:8080/student/login.xhtml'), ('60da059f946742dfa5604eb8a1de28d5', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'C06CA5D6766DB9CA4E6982D6894C3F91', '1465314282430', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('6104fb6d752f465b8b477da5c6ea856d', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'C06CA5D6766DB9CA4E6982D6894C3F91', '1465314212671', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('6367cc69433d4ca59dd85ea1e387a74a', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'DED3C3E93F68C54D8AD1FC6FD4ACDFA0', '1465313748535', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('666ecc7c00104b84bf5d935874cd3750', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'C06CA5D6766DB9CA4E6982D6894C3F91', '1465314518323', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('68b4620285c540d4b6731de5703998c5', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465310246228', '0', 'http://localhost:8080/student/user/avatar/0.xhtml?style=128x128'), ('6921fa2080b842ad9f4aa9247abbeeb4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465314812656', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('6c313ad7458f41308c42158de04e6713', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465316430250', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('6d82ee7130444fd68d3acfce861154de', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'AB0332A7A76741BC7A8C55FE5A2C9B71', '1465318322649', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('6d83f80dd54c4b8dbcce74cc9d9dc632', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 'ajy', '0:0:0:0:0:0:0:1', null, '', 'post', null, '87A1C78C739C8E0071041E03D3369FC8', '1465308109336', null, 'http://localhost:8080/student/login.xhtml'), ('6e90850f78394a23a334ef862ba59561', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465310533161', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('72e8189a104048cfb5e516d0f9f3f1af', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465310263356', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('756f7095705c429ab8ea8e70c7452f0c', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '2B05D58588EF4B90A95559ADC0B918A0', '1465321012711', '0', 'http://localhost:8080/student/user/center.xhtml'), ('75cb9eb6d37c423584de692e64654686', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '2B05D58588EF4B90A95559ADC0B918A0', '1465319957330', '0', 'http://localhost:8080/student/user/center.xhtml'), ('760b847ce8224e379782f471f82fd857', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'C06CA5D6766DB9CA4E6982D6894C3F91', '1465314328897', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('79798948eb784da78736c38d6a4105d0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 'ajy', '0:0:0:0:0:0:0:1', null, '', 'get', null, '2B05D58588EF4B90A95559ADC0B918A0', '1465319926097', null, 'http://localhost:8080/student/login.xhtml'), ('7b27809c2aeb4754bc60d101248f1829', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465317511968', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('7cba57fcca9747248e03cdf0a69e2b54', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465314747833', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('7eff55fa331c4533b36cdf097d4d8b83', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465310287056', '0', 'http://localhost:8080/student/user/center.xhtml'), ('7f0617a8532a41368dd47a06033f6503', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465310425308', '0', 'http://localhost:8080/student/user/center.xhtml'), ('7fcb9c0df3e343199e44a6dfbc04d163', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '7D1AF43B53F4719C55A7CFDA443A756D', '1465314072522', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('80cfcc79ce864c4bbbede6c7e1098694', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'post', null, '87A1C78C739C8E0071041E03D3369FC8', '1465308886721', '0', 'http://localhost:8080/student/login.xhtml'), ('81271541397b4fbf92310c446e4e7b86', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465311341326', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('81a5ddd2afcb4aaf98a6148b4aa74d11', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '2B05D58588EF4B90A95559ADC0B918A0', '1465319930096', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('81e71c917bdf4d1ab701df42d61e181e', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '7D1AF43B53F4719C55A7CFDA443A756D', '1465314102765', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('8267d4cd5dda462bbfc3aa680faa97a2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465317684010', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('830118019a4946fd9364e772f1134019', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'DED3C3E93F68C54D8AD1FC6FD4ACDFA0', '1465313944227', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('836469f396fe41b0963053e54dd8a9f2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465315394940', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('8375a28152154a6682c3c2dbb9c7eae1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465309816702', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('83cb8cc7b98a4abfbe44ae6aa324e803', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465309913906', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('85bc26bb939a43b8b31f4c2a5277eb99', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'DED3C3E93F68C54D8AD1FC6FD4ACDFA0', '1465313945843', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('8d6f9e1ebe504099802af60b0f9a159d', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 'ajy', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'E9B583D6D56F815531FD2315024126E5', '1465319926089', null, 'http://localhost:8080/student/logout.xhtml'), ('9076ae7e1eb54d2c98a73b98cfc98986', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '7D1AF43B53F4719C55A7CFDA443A756D', '1465314178846', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('90f4c7745ac44d12abfceb633c2bd772', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'DED3C3E93F68C54D8AD1FC6FD4ACDFA0', '1465313823213', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('94ace34c4b9d4cc2b5fe0076c23fb82d', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465311534160', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('9d2cf387ccfc4dceac8a5a8cbd394a68', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'DED3C3E93F68C54D8AD1FC6FD4ACDFA0', '1465313819474', '0', 'http://localhost:8080/student/user/center.xhtml'), ('9da2243cb8b4417393e7bd457a821c02', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 'ajy', '0:0:0:0:0:0:0:1', null, '', 'get', null, '87A1C78C739C8E0071041E03D3369FC8', '1465308017605', null, 'http://localhost:8080/student/login.xhtml'), ('9df4370b25fd4ef9ae294529b323598f', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465317102799', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('a1af3c3772504f14867b3016d7cad320', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 'ajy', '0:0:0:0:0:0:0:1', null, '', 'post', null, '87A1C78C739C8E0071041E03D3369FC8', '1465308034152', null, 'http://localhost:8080/student/login.xhtml'), ('a202a400169b452586cb8bca89899e56', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '2B05D58588EF4B90A95559ADC0B918A0', '1465319947786', '0', 'http://localhost:8080/student/user/avatar.xhtml'), ('a26cc186801d4861827fcaba45c5f92c', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'E9B583D6D56F815531FD2315024126E5', '1465319912667', '0', 'http://localhost:8080/student/user/passindex.xhtml'), ('a2e332f4144f4245b45ddb25df1fd4e6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '2B05D58588EF4B90A95559ADC0B918A0', '1465319931746', '0', 'http://localhost:8080/student/user/center.xhtml'), ('a3d2700cff844079b94df46da0ea0a38', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '21A777E7E374474E6F0DD03B90E119B4', '1465321295939', '0', 'http://localhost:8080/student/user/center.xhtml'), ('a720ba60ee5c468dac70bad33d5c18a4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465317039714', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('a93b137d64424010bae43789b95f0b00', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 'ajy', '0:0:0:0:0:0:0:1', null, '', 'post', null, '87A1C78C739C8E0071041E03D3369FC8', '1465308505996', null, 'http://localhost:8080/student/login.xhtml'), ('a9800713b02f41d5acba1339e32ec726', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465311249216', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('b00ae1e5ade648f5b76d3e76195e7085', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'E9B583D6D56F815531FD2315024126E5', '1465319907147', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('b0e29e45eb5049e58b6e08d64925f2f9', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 'ajy', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'AB0332A7A76741BC7A8C55FE5A2C9B71', '1465319903990', null, 'http://localhost:8080/student/logout.xhtml'), ('b10610e35e8645f19d3e36a76f959a64', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'AB0332A7A76741BC7A8C55FE5A2C9B71', '1465319051495', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('b32293a88bdb46f291ac1c752f47195b', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'post', null, 'C06CA5D6766DB9CA4E6982D6894C3F91', '1465314207429', '0', 'http://localhost:8080/student/login.xhtml'), ('b6f94fcf90b5445e824e52f264b5afc4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 'ajy', '0:0:0:0:0:0:0:1', null, '', 'post', null, '87A1C78C739C8E0071041E03D3369FC8', '1465308672535', null, 'http://localhost:8080/student/login.xhtml'), ('b732611b79674a2cb5c70fb30ff1ed53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '2B05D58588EF4B90A95559ADC0B918A0', '1465319940599', '0', 'http://localhost:8080/student/user/center.xhtml'), ('b9c0300796044eba8f4496ab2537ac7a', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465310190634', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('bb1ac5b72f534627a4b83b5719f74791', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'post', null, 'E9B583D6D56F815531FD2315024126E5', '1465319906989', '0', 'http://localhost:8080/student/login.xhtml'), ('c098009ae3054720af82f7ce71313906', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 'ajy', '0:0:0:0:0:0:0:1', null, '', 'post', null, '87A1C78C739C8E0071041E03D3369FC8', '1465308881018', null, 'http://localhost:8080/student/login.xhtml'), ('c0c28937fb514633abd4324775367c20', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 'ajy', '0:0:0:0:0:0:0:1', null, '', 'post', null, '87A1C78C739C8E0071041E03D3369FC8', '1465308433854', null, 'http://localhost:8080/student/login.xhtml'), ('c1a1360fa44e4ac09e5abcc6736bbdc5', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465311708151', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('c5d6584103c948d3bf30d1a970d8d850', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '2B05D58588EF4B90A95559ADC0B918A0', '1465320979924', '0', 'http://localhost:8080/student/user/center.xhtml'), ('c78d0c3404c64983ab306d6a04586dbe', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'DED3C3E93F68C54D8AD1FC6FD4ACDFA0', '1465313678688', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('c932ab3e9bbd4126836481b0bceae501', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '21A777E7E374474E6F0DD03B90E119B4', '1465321418851', '0', 'http://localhost:8080/student/user/center.xhtml'), ('cd7851a27d7b41048f99b93b886eb5fb', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 'ajy', '0:0:0:0:0:0:0:1', null, '', 'post', null, '87A1C78C739C8E0071041E03D3369FC8', '1465308555981', null, 'http://localhost:8080/student/login.xhtml'), ('cf2cac48e5cb401c937d5c7e47d102d9', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'DED3C3E93F68C54D8AD1FC6FD4ACDFA0', '1465313706688', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('cf5cc34e9f61422ea0ddb0aca27895a5', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465317180711', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('d05f3176f1cc435bad46bbeec69e2ffb', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '7D1AF43B53F4719C55A7CFDA443A756D', '1465314106763', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('d11e88761c3641df97e53b639f6087b5', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '21A777E7E374474E6F0DD03B90E119B4', '1465321185046', '0', 'http://localhost:8080/student/user/center.xhtml'), ('d15401279b044a91a4af8c2ae387d4dc', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'DED3C3E93F68C54D8AD1FC6FD4ACDFA0', '1465313735566', '0', 'http://localhost:8080/student/survey/index.xhtml?title=test2'), ('d1fbb01500f74f219276fe637947e9cd', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'DED3C3E93F68C54D8AD1FC6FD4ACDFA0', '1465313820374', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('d409b459ddb549e3be92142240c18add', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'C06CA5D6766DB9CA4E6982D6894C3F91', '1465314218662', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('d4d351a513da4dcf9aef4f5413b02743', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'AB0332A7A76741BC7A8C55FE5A2C9B71', '1465318387380', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=c3067dc6ceba4fcba1ed4dfedbe1c1d6'), ('d7494f0621d8454aa7276764bdb7f8a9', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 'ajy', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'E9B583D6D56F815531FD2315024126E5', '1465319904015', null, 'http://localhost:8080/student/login.xhtml'), ('d9eb1a64068146569081a5cf6c9c3013', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'DED3C3E93F68C54D8AD1FC6FD4ACDFA0', '1465313724294', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('db2e25312e9c4674938bd5078fd4cc8e', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465310858006', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('e7c8aafdced442f9aa27fda5b8c00447', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'post', null, '2B05D58588EF4B90A95559ADC0B918A0', '1465319957316', '0', 'http://localhost:8080/student/user/edit.xhtml'), ('e81bdbde241e43de97cb6c7815f6e81e', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'AB0332A7A76741BC7A8C55FE5A2C9B71', '1465318976369', '0', 'http://localhost:8080/student/user/center.xhtml'), ('e8f7469b7121493580a74adacea34d5f', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '2B05D58588EF4B90A95559ADC0B918A0', '1465319945064', '0', 'http://localhost:8080/student/user/center.xhtml'), ('ecead926db7d4378a2a134067516839f', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465311497422', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('ee3d0c584dab420eb8871ea81a05b9aa', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'DED3C3E93F68C54D8AD1FC6FD4ACDFA0', '1465313730313', '0', 'http://localhost:8080/student/survey/index.xhtml?title=test2'), ('eec23d9275b34af6b9b578414a570ecb', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 'ajy', '0:0:0:0:0:0:0:1', null, '', 'get', null, '7D1AF43B53F4719C55A7CFDA443A756D', '1465314200310', null, 'http://localhost:8080/student/logout.xhtml'), ('ef3e5d5557bf4efa96926b1c2826490e', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465310193790', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('f08f359e0abb49a7932f7ab8dea9b0ea', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 'ajy', '0:0:0:0:0:0:0:1', null, '', 'post', null, '87A1C78C739C8E0071041E03D3369FC8', '1465308073785', null, 'http://localhost:8080/student/login.xhtml'), ('f0aba496193d44bb8b6b737d875dfa56', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465309990273', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('f204fced3a844f46828c27aeafcfd991', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, 'DED3C3E93F68C54D8AD1FC6FD4ACDFA0', '1465313741201', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('f3b6e5a6f51c4ae0bb2a72ca5135fad0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465310499557', '0', 'http://localhost:8080/student/user/center.xhtml'), ('f68d3ed49de24abcab9cb86fb50823c3', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '95759C8AA322DF33FE5476DC135BCE5B', '1465315725981', '0', 'http://localhost:8080/student/survey/attend.xhtml?voteId=95d1c2d4fee245198ca8b326e2ff4ece'), ('f7d4268ca90a4cd086d0ab5c1f175bf8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465310326854', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('f992977a87bf416d82d62c6a935c4d07', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465312226382', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('fc1091e8fdb74c8c8e2e90026aa0fb42', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'post', null, '2B05D58588EF4B90A95559ADC0B918A0', '1465319940581', '0', 'http://localhost:8080/student/user/edit.xhtml'), ('fe70579eeecc4c6abc5af477b10e8c2a', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465312125202', '0', 'http://localhost:8080/student/survey/index.xhtml'), ('fec6da4c07cb445e8ee1531624501980', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', '-1', '0:0:0:0:0:0:0:1', null, '', 'get', null, '8ED564EE198322D33ADD97310C08AA09', '1465309805830', '0', 'http://localhost:8080/student/exam/me.xhtml');
COMMIT;

-- ----------------------------
--  View structure for `v_authorize`
-- ----------------------------
DROP VIEW IF EXISTS `v_authorize`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_authorize` AS select `au`.`id` AS `id`,`au`.`rcategory` AS `rcategory`,`au`.`rid` AS `rid`,`au`.`scategory` AS `scategory`,`au`.`domain` AS `domain`,`au`.`sid` AS `uid` from `iapp_base_authorize` `au` where (`au`.`scategory` = '1') union select `au`.`id` AS `id`,`au`.`rcategory` AS `rcategory`,`au`.`rid` AS `rid`,`au`.`scategory` AS `scategory`,`au`.`domain` AS `domain`,`u`.`id` AS `uid` from (`iapp_base_authorize` `au` left join `iapp_base_user` `u` on((`au`.`sid` = `u`.`oid`))) where (`au`.`scategory` = '2') union select `au`.`id` AS `id`,`au`.`rcategory` AS `rcategory`,`au`.`rid` AS `rid`,`au`.`scategory` AS `scategory`,`au`.`domain` AS `domain`,`u`.`id` AS `uid` from (`iapp_base_authorize` `au` left join `iapp_base_user` `u` on((`au`.`sid` = `u`.`domain`))) where (`au`.`scategory` = '3');

SET FOREIGN_KEY_CHECKS = 1;
