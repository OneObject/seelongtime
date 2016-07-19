/*参与记录-人员id+活动id*/
CREATE INDEX index_ixin_user_vote ON ixin_user_vote(base_uid,activityId);

/*调研活动问题回答人数-调研活动id*/
CREATE INDEX index_ixin_vote_statistics_question ON ixin_vote_statistics_question(voteactivityid);

/*调研活动问题选项选择人数-调研活动id*/
CREATE INDEX index_ixin_vote_statistics_option ON ixin_vote_statistics_option(voteactivityid);

/*调研答题结果-人员+调研活动*/
drop index index_ixin_vote_action_detail on ixin_vote_action_detail;
CREATE INDEX index_ixin_vote_action_detail ON ixin_vote_action_detail(voteactivityid,uid);

/*人员职级-用户id*/
CREATE INDEX index_iapp_base_user_joblevel ON iapp_base_user_joblevel(userid);

/*标签关联资源表-资源id*/
CREATE INDEX index_base_label_relation ON base_label_relation(rid);

