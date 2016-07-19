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
/*
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('课程评论','comment','4',0,0,'1','1',1,0,3,0);
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('赞','praise','4',0,0,'1','1',1,0,1,0);
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('课程学习','study','4',0,0,'1','1',1,0,5,0);
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('每日登录','login','1',0,1,'1','1',1,0,0,0);
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('微信绑定','bind','0',0,0,'1','1',10,0,1,0);
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('活动报名','activityapply','4',0,0,'1','1',0,0,1,0);
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('活动签到','activitysignin','4',0,1,'1','1',1,0,1,0);
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('用户投票','vote','4',0,0,'1','1',1,0,1,0);
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('学生考试','examination','4',0,0,'1','1',1,0,1,0);
--INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('查看课程','lookcourses','4',0,0,'1','0',0,0,0,0);--
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('查看活动','lookactivity','4',0,0,'1','1',0,0,1,0);
INSERT INTO credit_rule(ruleName,action,cycleType,cycleTime,rewardNum,rewardType,norepeat,credit,experience,resourceRewardNum,vers) VALUES('发布问题','releasequestion','1',0,3,'1','1',0,0,0,0);
 */


update credit_rule set cycleType='4',cycleTime=0,rewardNum=0,rewardType='1',norepeat='1',credit=1,experience=0,resourceRewardNum=3,vers=0 where action='comment';
update credit_rule set cycleType='4',cycleTime=0,rewardNum=0,rewardType='1',norepeat='1',credit=1,experience=0,resourceRewardNum=1,vers=0 where action='praise';
update credit_rule set cycleType='4',cycleTime=0,rewardNum=0,rewardType='1',norepeat='1',credit=1,experience=0,resourceRewardNum=5,vers=0 where action='study';
update credit_rule set cycleType='1',cycleTime=0,rewardNum=1,rewardType='1',norepeat='1',credit=1,experience=0,resourceRewardNum=0,vers=0 where action='login';
update credit_rule set cycleType='0',cycleTime=0,rewardNum=0,rewardType='1',norepeat='1',credit=10,experience=0,resourceRewardNum=1,vers=0 where action='bind';
update credit_rule set cycleType='4',cycleTime=0,rewardNum=0,rewardType='1',norepeat='1',credit=0,experience=0,resourceRewardNum=1,vers=0 where action='activityapply';
update credit_rule set cycleType='4',cycleTime=0,rewardNum=1,rewardType='1',norepeat='1',credit=1,experience=0,resourceRewardNum=1,vers=0 where action='activitysignin';
update credit_rule set cycleType='4',cycleTime=0,rewardNum=0,rewardType='1',norepeat='1',credit=1,experience=0,resourceRewardNum=1,vers=0 where action='vote';
update credit_rule set cycleType='4',cycleTime=0,rewardNum=0,rewardType='1',norepeat='1',credit=1,experience=0,resourceRewardNum=1,vers=0 where action='examination';
update credit_rule set cycleType='1',cycleTime=0,rewardNum=3,rewardType='1',norepeat='1',credit=0,experience=0,resourceRewardNum=0,vers=0 where action='releasequestion';

delete from credit_rule where action='lookcourses';
delete from credit_rule where action='lookactivity';