package com.longtime.app.ixin.mgr.topic.controller;

import java.util.Arrays;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.ixin.mgr.topic.service.CommentService;

/**
 * 评论管理
 */
@Controller("topicCommentController")
@RequestMapping("/mgr/topiccomment")
public class CommentController {

	@Resource(name="topicCommentService")
	private CommentService commentService;
	
	@RequestMapping("index")
	public String index(@RequestParam("topicId")String topicId,ModelMap model){
		model.put("topicId", topicId);
		return "mgr/ixin/topic_comment/index";
	}
	
	@RequestMapping("shield")//屏蔽与解除屏蔽
	@ResponseBody
	public void shield(@RequestParam("id")String id,@RequestParam("shield") int shield){
		//改变评论的状态，是否屏蔽
		commentService.updateCommentShieldStatus(id,shield);
	}
	@RequestMapping("batchshield")//批量屏蔽与解除屏蔽
	@ResponseBody
	public boolean batchUpdateShield(@RequestParam("ids")String[] ids,@RequestParam("shield") int shield){
		System.out.println(ids);
		System.out.println(Arrays.toString(ids));
		//改变评论的状态，是否屏蔽
		this.commentService.batchUpdateShield(shield, ids);
		return true;
	}
	
	@RequestMapping("del")
	@ResponseBody
	public void del(@RequestParam("id")String id){
		commentService.deleteById(id);
	}
	
	
}
