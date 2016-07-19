package com.longtime.app.admin.chapter.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.longtime.app.admin.chapter.dao.ChapterDao;
import com.longtime.app.admin.chapter.model.Chapter;
import com.longtime.app.admin.chapter.service.ChapterService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service("chapterService")
public class ChapterServiceImpl extends BaseService4HImpl<Chapter, String> implements ChapterService{
    
    @Resource
    private ChapterDao chapterDao;
    
    @Override
    public BaseDAO<Chapter, String> getDAO() {
        return chapterDao;
    }

    @Override
    public Chapter loadParent(String coursewareId, String parentId ) {
        if( StringUtils.isBlank(parentId) ){
            return  null;
        }
        
        Map<String, Object> query = new HashMap<String, Object>();
        query.put("parentId", parentId);
        query.put("coursewareId", coursewareId);

        List<Chapter> list = this.list(query);
        return  list.isEmpty()?null:(Chapter)list.get(0);
    }

}
