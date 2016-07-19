package com.longtime.app.admin.chapter.service;

import com.longtime.app.admin.chapter.model.Chapter;
import com.longtime.common.service.BaseService;

public interface ChapterService extends BaseService<Chapter, String>{
    /**
     * 
     * 功能描述：找到章节发父id
     * @author:houbiao,he
     * @create:Mar 30, 2009  4:03:31 PM
     * @update:Mar 30, 2009  4:03:31 PM
     * @param coursewareId
     * @param parent_id
     * @param identifier
     * @return
     * @throws DAOException
     */
    public Chapter loadParent( String coursewareId, String parentId  );
}
