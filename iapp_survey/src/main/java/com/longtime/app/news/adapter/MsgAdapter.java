package com.longtime.app.news.adapter;

import com.longtime.app.news.vo.DetailMsg;
import com.longtime.app.news.vo.NewsVO;

public class MsgAdapter {
	

	public static DetailMsg getMsg(NewsVO newsVO){
		DetailMsg msgObj = new DetailMsg();
		msgObj.setTitle(newsVO.getTitle());
		msgObj.setContent(newsVO.getContent());
		msgObj.setDatelineFormat(newsVO.getTime());
		msgObj.setId(newsVO.getId());
		msgObj.setImgUrl(newsVO.getThumbnail_url());
		return msgObj;
	}
}
