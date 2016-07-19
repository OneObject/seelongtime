CREATE TABLE IF NOT EXISTS credit_rule (
	id mediumint(8) unsigned NOT NULL auto_increment, 
	ruleName VARCHAR(50) NOT NULL default '',
	action VARCHAR(50) NOT NULL default '',
	cycleType varchar(2) NOT NULL default '0',
	cycleTime int ,
	rewardNum int ,
	rewardType varchar(2) NOT NULL ,
	norepeat varchar(2) NOT NULL ,
	credit BIGINT NOT NULL,
	experience BIGINT NOT NULL,
	resourceRewardNum int,
	vers int(4) unsigned zerofill NOT NULL,
	PRIMARY KEY(id)
)ENGINE = InnoDB DEFAULT   CHARSET=UTF8; 


CREATE TABLE IF NOT EXISTS credit_log (
	id mediumint(8) unsigned NOT NULL auto_increment, 
	uid VARCHAR(50) NOT NULL default '',
	ruleid mediumint(8) NOT NULL default '0',
	action varchar(40) NOT NULL ,
	rulename varchar(40) NOT NULL,
	total int NOT NULL ,
	cycleNum int NOT NULL ,
	credit BIGINT NOT NULL default '0',
	experience BIGINT NOT NULL default '0',
	startTime BIGINT default '0',
	dateLine BIGINT NOT NULL,
	rewardType varchar(2) NOT NULL , 
	appids varchar(1000) NOT NULL default '',
	userids varchar(1000) NOT NULL default '',
	infoids varchar(1000) NOT NULL default '',
	normal_rule int NOT NULL default '1',
	PRIMARY KEY(id)
)ENGINE = InnoDB DEFAULT   CHARSET=UTF8; 

CREATE TABLE IF NOT EXISTS user_credit_total (
	uid VARCHAR(50) NOT NULL default '',
	credit BIGINT NOT NULL default '0',
	experience BIGINT NOT NULL default '0',
	startTime BIGINT default '0',
	ext1 BIGINT default '0',
	ext2 BIGINT default '0',
	updatetime BIGINT NOT NULL,
	PRIMARY KEY(uid)
)ENGINE = InnoDB DEFAULT   CHARSET=UTF8; 

CREATE TABLE credit_resource (
  id varchar(50) NOT NULL,
  uid varchar(50) NOT NULL default '',
  ruleid varchar(50) NOT NULL default '',
  resourceid varchar(50) NOT NULL default '',
  resourceNum int(11) NOT NULL,
  resourceType varchar(2) NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS credit_log_detail (
  id varchar(50) NOT NULL,
  uid varchar(50) NOT NULL default '',
  ruleid varchar(50) NOT NULL,
  resourceid varchar(50) NOT NULL default '',
  vers int(4) unsigned zerofill NOT NULL,
  createDate datetime NOT NULL,
  status int(2) NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


/*
 * 插入奖励规则
 * action 积分事件 如study comment等
 * cycleType 周期类型 '0'一次性,'1'每天,'2'整点,'3'间隔分钟,'4'不限周期,'5'每月
 * cycleTime 间隔时间
 * rewardNum 奖励次数
 * norepeat 去重类型 0 无需去重   1需要去重
 * resourceRewardNum 同一资源可重复获得积分次数
 * type 0 域规则 1 系统规则
 */
--INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain,type) VALUES('课程评论','comment','4',0,0,'1','1',1,0,3,0,'',1);--
