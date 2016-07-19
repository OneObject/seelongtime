-- ----------------------------
-- Table 登录账户
-- ---------------------------


CREATE TABLE `base_review` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `sid` varchar(255) COLLATE utf8_bin NOT NULL,
  `uid` varchar(255) COLLATE utf8_bin NOT NULL,
  `type` varchar(255) COLLATE utf8_bin NOT NULL,
  `dateCreated` bigint(20) DEFAULT NULL,
  `userCreated` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dateLastModified` bigint(20) DEFAULT NULL,
  `userLastModified` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `base_tag` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `dateCreated` bigint(20) DEFAULT NULL,
  `userCreated` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dateLastModified` bigint(20) DEFAULT NULL,
  `userLastModified` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `base_answer` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `question_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contentNoHtml` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `author_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `agree_num` int(11) DEFAULT '0',
  `disagree_num` int(11) DEFAULT '0',
  `comment_num` int(11) DEFAULT NULL,
  `is_best_answer` int(11) DEFAULT '0',
  `view` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dateCreated` bigint(20) DEFAULT NULL,
  `userCreated` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dateLastModified` bigint(20) DEFAULT NULL,
  `userLastModified` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `base_question` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `supplement` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `supplementNoHtml` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `author_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `answer_num` int(11) DEFAULT NULL,
  `comment_num` int(11) DEFAULT NULL,
  `is_set_best_answer` int(11) DEFAULT NULL,
  `dateCreated` bigint(20) DEFAULT NULL,
  `userCreated` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dateLastModified` bigint(20) DEFAULT NULL,
  `userLastModified` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `base_questiontags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `questionid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tagsid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



