package com.longtime.app.ixin.protal.topic.controller;


import org.apache.commons.lang3.math.NumberUtils;

import com.google.common.collect.Maps;
import com.longtime.app.ixin.mgr.topic.model.CommentEntity;
import com.longtime.app.ixin.mgr.topic.model.TopicEntity;
import com.longtime.app.ixin.mgr.topic.service.CommentService;
import com.longtime.app.ixin.mgr.topic.service.TopicService;
import com.longtime.app.ixin.mgr.topic.service.impl.CommentServiceImpl.WallMessgae;
import com.longtime.common.comet.Comet4jMessageOperator;
import com.longtime.common.comet.Message;
import com.longtime.common.comet.MsgNotifer;
import com.longtime.common.spring.SpringContextUtil;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/protal/topic")
public class TopicWallController {
	
	
//	private Comet4jMessageOperator  comet4jMessageOperator;
	
//	@Resource
	private MsgNotifer msgNotifer;
	
	@Resource(name="topicCommentService")
	private CommentService commentService;
	
	@Resource(name="topicService")
	private TopicService topicService;
	
	@RequestMapping("wall/{topicId}")
	public String index(HttpServletRequest request,HttpServletResponse response,@PathVariable(value="topicId")String topicId){
		
//		if(null==comet4jMessageOperator){
//			comet4jMessageOperator = (Comet4jMessageOperator) SpringContextUtil.getBean("comet4jMessageOperator");
//		}
		String channel = topicId;
//		if(null!=comet4jMessageOperator){
//			comet4jMessageOperator.registChannel(channel);
//		}
		String tag = request.getParameter("v");
		
		request.setAttribute("channel", channel);
		
		String numstr = request.getParameter("num");
		
		int num = NumberUtils.toInt(numstr, 50);
			
		List<CommentEntity> list = commentService.queryInWallCommentListByTopicId(num, 1, topicId);
		
		request.setAttribute("comments", list);
		
		
		// 获取话题信息
		TopicEntity  topic  = topicService.getTopicEntityById(topicId);
		
		request.setAttribute("topic", topic);
		
		if("enn".equalsIgnoreCase(tag)){
			return "protal/wall/index_enn";
		}
		
		return "3".equals(tag) ? "protal/wall/index_v3" : "2".equals(tag) ? "protal/wall/index_v2" : "protal/wall/index" ;
	}
	
	
	
	@RequestMapping("wall/test")
	public String test(HttpServletRequest request){
		
		String channel = request.getParameter("channel");
		
		String msg = request.getParameter("msg");
		
		String action = request.getParameter("action");
		
		Map<String,String> data = Maps.newHashMap();
		
		data.put("msg", msg);
		data.put("action", action);
	
		
		request.setAttribute("channel", channel);
		
		
		WallMessgae wallMessage = new WallMessgae();
		
		wallMessage.setId(String.valueOf(System.currentTimeMillis()));
		wallMessage.setTid(channel);
		wallMessage.setContent("test"+System.currentTimeMillis());
		wallMessage.setOpenId("11");
		wallMessage.setUname("test");
		
		Message  message = new Message();
		message.setChannel(channel);
		message.setData(wallMessage);
		msgNotifer.send(message);
		
		return "protal/wall/test";
	}

}
