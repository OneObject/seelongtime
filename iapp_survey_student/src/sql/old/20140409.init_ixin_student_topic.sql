-- ----------------------------
-- Table 话题
-- ---------------------------
CREATE TABLE `ixin_student_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_bin NOT NULL,
  `uname` varchar(255) COLLATE utf8_bin NOT NULL,
  `content` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8_bin NOT NULL,
  `isdel` int(10) unsigned zerofill DEFAULT NULL,
  `creator` 		varchar(255) DEFAULT NULL,
  `updater` 		varchar(255) DEFAULT NULL,
  `createtime` 		bigint 		DEFAULT NULL DEFAULT 0,
  `updatetime` 		bigint 		DEFAULT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;;

