package com.longtime.app.image.service.impl;

import com.longtime.app.image.dao.ImageDao;
import com.longtime.app.image.model.ImageModel;
import com.longtime.app.image.service.ImageService;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Service;

@Service("imageService")
public class ImageServiceImpl implements ImageService {
	@Resource
	private ImageDao imageDao;

	public boolean save(String fileName, String realName, String suffix, long createtime) {
		return this.imageDao.save(fileName, realName, suffix, createtime);
	}

	public Map<String, Object> getById(String id) {
		return imageDao.fingById(id);
	}

    @Override
    public ImageModel get(String id) {
        
        Map<String,Object> entity = this.getById(id);
        
        if(null!=entity){
            ImageModel  image = new ImageModel();
            image.setId((String)entity.get("id"));
            image.setRealname((String)entity.get("realname"));
            image.setSuffix((String)entity.get("suffix"));
            image.setCreatetime((Long)entity.get("createtime"));
            return image;
        }
        return null;
    }
}
