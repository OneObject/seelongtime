package com.longtime.app.admin.chapter.dao.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.admin.chapter.dao.ChapterDao;
import com.longtime.app.admin.chapter.model.Chapter;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("chapterDao")
public class ChapterDaoImpl extends  BaseDAOImpl<Chapter, String> implements ChapterDao{

}
