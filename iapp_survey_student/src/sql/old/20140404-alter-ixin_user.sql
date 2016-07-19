--ixin_user--
ALTER table ixin_user ADD `company` varchar(255) DEFAULT NULL;

--报名签到记录表添加student端四个字段--
ALTER table ixin_activity_apply_list add `creator` varchar(32) DEFAULT NULL;
ALTER table ixin_activity_apply_list add `updater` varchar(32) DEFAULT NULL;
ALTER table ixin_activity_apply_list add `createtime` bigint 	 DEFAULT NULL DEFAULT 0;
ALTER table ixin_activity_apply_list add `updatetime` bigint 	 DEFAULT NULL DEFAULT 0;