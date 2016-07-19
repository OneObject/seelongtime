package com.longtime.ajy.api.controller;

import com.longtime.ajy.api.protocol.MessagePacket;
import com.longtime.ajy.api.vo.QuestionVO;
import com.longtime.ajy.api.vo.VoteVO;
import com.longtime.ajy.mweb.model.VoteEntity;
import com.longtime.ajy.mweb.service.VoteService;
import com.longtime.ajy.mweb.web.MBaseController;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api/vote")
public class VoteApiController extends MBaseController{

	 @Resource(name = "voteService")
	 private VoteService voteService;
	       
	  
	 @RequestMapping("result")
	 @ResponseBody
	 public MessagePacket voteOptionList(HttpServletRequest request ,ModelMap modelMap){
	    String voteId = request.getParameter("id");
	    VoteEntity vote = this.voteService.findOne(voteId);
	    if(null==vote){
	        return MessagePacket.newSuccess(null);
	    }
	    List<QuestionVO> list=this.voteService.queryListOption(voteId);
	    VoteVO vo = new VoteVO();
	    vo.setId(vote.getId());
	    vo.setTitle(vote.getTitle());
	    vo.setQuestions(list);
	    return MessagePacket.newSuccess(vo);
	 }
	 
	 @RequestMapping("toVote")
	 @ResponseBody
	 public String toVote(HttpServletRequest request ,ModelMap modelMap){
		 
	   return "/widget/toupiao";
	 }
	       
}

