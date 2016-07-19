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
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('课程评论','comment','4',0,0,'1','0',0,0,0,0);
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('赞','praise','4',0,0,'1','0',0,0,0,0);
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('课程学习','study','4',0,0,'1','0',0,0,0,0);
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('每日登录','login','4',0,0,'1','0',0,0,0,0);
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('微信绑定','bind','0',0,0,'1','0',0,0,0,0);
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('活动报名','activityapply','4',0,0,'1','0',0,0,0,0);
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('活动签到','activitysignin','4',0,0,'1','0',0,0,0,0);
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('用户投票','vote','4',0,0,'1','0',0,0,0,0);
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('学生考试','examination','4',0,0,'1','0',0,0,0,0);
--INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('查看课程','lookcourses','4',0,0,'1','0',0,0,0,0);--
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('查看活动','lookactivity','4',0,0,'1','0',0,0,0,0);
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('发布问题','releasequestion','4',0,0,'1','0',0,0,0,0);


/*
 * 插入域奖励规则
 * action 积分事件 如study comment等
 * cycleType 周期类型 '0'一次性,'1'每天,'2'整点,'3'间隔分钟,'4'不限周期,'5'每月
 * cycleTime 间隔时间
 * rewardNum 奖励次数
 * norepeat 去重类型 0 无需去重   1需要去重
 * resourceRewardNum 同一资源可重复获得积分次数
 * type 0 域规则 1 系统规则
 */

--滇红--
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('5','4',0,0,'1','0',0,0,0,0,'dihon');
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('6','4',0,0,'1','0',0,0,0,0,'dihon');
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('7','4',0,0,'1','0',5,0,0,0,'dihon');
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('8','4',0,0,'1','0',0,0,0,0,'dihon');
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('9','0',0,0,'1','0',100,0,0,0,'dihon');
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('10','4',0,0,'1','0',0,0,0,0,'dihon');
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('11','4',0,0,'1','0',5,0,0,0,'dihon');
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('12','4',0,1,'1','0',10,0,0,0,'dihon');
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('13','4',0,0,'1','0',30,0,0,0,'dihon');
--INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('14','4',0,0,'1','0',0,0,0,0,'dihon');--
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('15','4',0,0,'1','0',0,0,0,0,'dihon');
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('16','4',0,0,'1','0',0,0,0,0,'dihon');


--ajy--
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('5','4',0,0,'1','0',1,0,0,0,'ajy');
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('6','4',0,0,'1','0',1,0,0,0,'ajy');
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('7','4',0,0,'1','0',1,0,0,0,'ajy');
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('8','4',0,0,'1','0',1,0,0,0,'ajy');
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('9','0',0,0,'1','0',1,0,0,0,'ajy');
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('10','4',0,0,'1','0',1,0,0,0,'ajy');
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('11','4',0,0,'1','0',1,0,0,0,'ajy');
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('12','4',0,1,'1','0',1,0,0,0,'ajy');
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('13','4',0,0,'1','0',1,0,0,0,'ajy');
--INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('14','4',0,0,'1','0',1,0,0,0,'ajy');--
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('15','4',0,0,'1','0',1,0,0,0,'ajy');
INSERT INTO domain_credit_rule(ruleid,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers,domain) VALUES('16','4',0,0,'1','0',1,0,0,0,'ajy');
