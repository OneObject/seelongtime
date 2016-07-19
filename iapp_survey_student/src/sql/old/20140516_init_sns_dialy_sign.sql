-- ----------------------------
-- Table structure for sns_dialy_sign
-- ----------------------------
DROP TABLE IF EXISTS `sns_dialy_sign`;
CREATE TABLE `sns_daily_sign` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(40) COLLATE utf8_bin NOT NULL,
  `uname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `domain` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `context` text COLLATE utf8_bin,
  `credit` int(11) DEFAULT NULL,
  `device` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('每日签到','dailysign','1',0,1,'1','1',1,0,0,0);
