package com.longtime.app.ixin.protal.vote.controller;

import javax.servlet.http.HttpServletRequest;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.longtime.app.ixin.mgr.vote.service.VoteService;
import com.longtime.app.ixin.mgr.vote.vo.VoteVO;

@Controller
@RequestMapping("/protal/vote")
public class ProtalVoteController {
	
	@Resource(name="voteService")
	private VoteService voteService;

	@RequestMapping("participate")
	public String participate(
			@RequestParam("voteId") String voteId,
			ModelMap model,HttpServletRequest request) {
		
		String openId = request.getParameter("openId");
		/*VoteVO vo = voteService.getVoteVOById(voteId);
		model.put("vo", vo);
		//已经结束
		if(vo.getEndTime()<System.currentTimeMillis()){
			model.put("end", "end");
		}
		boolean exists = voteService.checkUserIsParticipate(voteId,openId);
		if(!exists){
			return "protal/vote/participate";
		}*/
		return "forward:result.xhtml";
		
	}
	@RequestMapping("result")
	public String result(@RequestParam("voteId")String voteId,ModelMap model){
		VoteVO vo = voteService.getVoteVOById(voteId);
		model.put("vo", vo);
		return "protal/vote/result";
	}
	
	@RequestMapping("save")
	@ResponseBody
	public String userVote(@RequestParam("selectOptId") String oId,
			@RequestParam("currentQuestionId") String qId,
			@RequestParam("voteId") String voteId,HttpServletRequest request){
		
		String openId = request.getParameter("openId");
		
		boolean success = true;//voteService.saveUserVote(oId,qId,voteId,openId);
		return success?"success":"error";
	}
}
