-- ----------------------------
-- Table 登录账户
-- ---------------------------
create table `base_account`(
  `id`				bigint 		NOT NULL auto_increment,
  `account`			varchar(50) 	NOT NULL,
  `pwd`          	varchar(255) 	NOT NULL COMMENT '加密后密码',
  `type`            int(2) 		NOT NULL DEFAULT 0 COMMENT '0:邮箱 1：手机 3：xxx',
  `uid` 			varchar(40) NOT NULL,
  `domainid` 		varchar(40) NOT NULL  COMMENT '租户id',
  `status`          int(2) 		NOT NULL DEFAULT 0 COMMENT '0可用 1禁用',
  `creator` 		varchar(32) DEFAULT NULL,
  `updater` 		varchar(32) DEFAULT NULL,
  `createtime` 		bigint 		DEFAULT NULL DEFAULT 0,
  `updatetime` 		bigint 		DEFAULT NULL DEFAULT 0,
  `lastlogintime` 	bigint 		DEFAULT NULL DEFAULT 0,
  `loginnum` 		bigint 		DEFAULT NULL DEFAULT 0,
  
  PRIMARY key(`id`),
  INDEX `idx_base_account_account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;;


-- ----------------------------
-- Table 租户课程分配关系（非公开课程）
-- ---------------------------
create table `study_course_auth`(
  `id`				bigint 			NOT NULL auto_increment,
  `domainid`		varchar(40) 	NOT NULL COMMENT '租户id',
  `courseid`        varchar(40) 	NOT NULL COMMENT '课程id',
  `type`        	int(2) 			NOT NULL DEFAULT 0 COMMENT '分配方式。 1：授权 2，购买 3，分享',
  `expiretime`      bigint 			NOT NULL DEFAULT 0 COMMENT '过期时间',
  `fromid`        	varchar(40)		DEFAULT NULL COMMENT '来源id，一般为domainid 运营商为-1',  
  `fromname`        varchar(255)	DEFAULT NULL COMMENT '来源名称', 
  `remark`        	varchar(255)	DEFAULT NULL COMMENT '描述',  
  `creator` 		varchar(32) 	DEFAULT NULL,
  `updater` 		varchar(32) 	DEFAULT NULL,
  `createtime` 		bigint 			DEFAULT NULL DEFAULT 0,
  `updatetime` 		bigint 			DEFAULT NULL DEFAULT 0,  
  PRIMARY key(`id`),
  INDEX `idx_study_course_auth_domainid` (`domainid`),
  INDEX `idx_study_course_auth_courseid` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;;

-- ----------------------------
-- Table 课程学习主
-- ---------------------------
create table `study_course_trace`(
  `id`				varchar(40) 	NOT NULL ,
  `user_id`			varchar(40) 	NOT NULL COMMENT '',
  `course_id`        varchar(40) 	NOT NULL COMMENT '',
  `domain`        	varchar(40) 	NOT NULL COMMENT '',
  `percent`        	varchar(40) 	DEFAULT '' COMMENT '',
  `start_date`      bigint 			DEFAULT 0 COMMENT '',
  `end_date`      	bigint 			DEFAULT 0 COMMENT '',
  `exit_status`        	varchar(40)	DEFAULT NULL COMMENT '',  
  `lesson_mode`        varchar(40)	DEFAULT NULL COMMENT '', 
  `lesson_status`       varchar(40)	DEFAULT NULL COMMENT '',  
  `study_total_time`    varchar(40)	DEFAULT '00:00:00' COMMENT '', 
  `total_time_sec`      bigint 		DEFAULT 0 COMMENT '',
  `last_score`      DECIMAL(5, 2) 	DEFAULT 0 COMMENT '',
  `test_score`      DECIMAL(5, 2) 	DEFAULT 0 COMMENT '',
  `max_score`      DECIMAL(5, 2) 	DEFAULT 0 COMMENT '',  
  `creator` 		varchar(32) 	DEFAULT NULL,
  `updater` 		varchar(32) 	DEFAULT NULL,
  `createtime` 		bigint 			DEFAULT NULL DEFAULT 0,
  `updatetime` 		bigint 			DEFAULT NULL DEFAULT 0,  
  PRIMARY key(`id`),
  INDEX `idx_study_course_trace_userid` (`user_id`),
  INDEX `idx_study_course_trace_courseid` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;;

-- ----------------------------
-- Table 用户课程关系
-- ---------------------------
create table `study_user_course`(
  `id`			varchar(40) 	NOT NULL ,
  `uid`			varchar(40) 	NOT NULL COMMENT '',
  `cid`         varchar(40) 	NOT NULL COMMENT '',
  `domain`      varchar(40) 	NOT NULL COMMENT '',
  `expiretime` 	bigint 			DEFAULT NULL DEFAULT 0,
  PRIMARY key(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;;


-- ----------------------------
-- 课程分类－系列课程－课程视图
-- ---------------------------
create VIEW series_course_view
AS
select sp.id,sp.`name`,sp.cover,sp.descript,sp.createtime,sp.supportmobile,sp.openstate,sp.released,sp.domain,spc.categoryid,'10' as type from study_package sp
left JOIN study_package_category spc on sp.id = spc.packageid
where sp.isdel='0' 
union 
select sc.id,sc.`name`,sc.cover,sc.descript,sc.createtime,sc.supportmobile,sc.openstate,sc.released,sc.domainid as domain,sc.categoryid,'1' as type from study_course sc
where sc.isdel='0' and  sc.id not in(select courseid from study_package_course);

-- ----------------------------
-- 授权展开视图，记录资源和用户授权关系
-- ---------------------------
create view v_authorize
AS
select au.id,au.rcategory,au.rid,au.scategory,au.domain,au.sid as uid from iapp_base_authorize au
where scategory='1'
UNION
select au.id,au.rcategory,au.rid,au.scategory,au.domain,u.id as uid from iapp_base_authorize au
left join iapp_base_user u on au.sid=u.oid
where scategory='2'
UNION
select au.id,au.rcategory,au.rid,au.scategory,au.domain,u.id as uid from iapp_base_authorize au
left join iapp_base_user u on au.sid=u.domain
where scategory='3'


