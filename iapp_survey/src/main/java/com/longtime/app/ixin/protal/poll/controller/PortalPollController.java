package com.longtime.app.ixin.protal.poll.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.ixin.mgr.pull.service.PollService;
import com.longtime.app.ixin.protal.poll.vo.QuestionVO;
import com.longtime.app.ixin.protal.poll.vo.VoteVO;

/**
 * 学员端投票功能
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/protal/poll/")
public class PortalPollController {

	@Resource
	private PollService pollService;
	
	@RequestMapping("detail")
	public String detail(HttpServletRequest request,ModelMap model){
		String openId = request.getParameter("openId");
		if(StringUtils.isBlank(openId)){
			openId = "ajy";
		}
		String voteId = request.getParameter("voteId");
		VoteVO vo = pollService.getVoteVO(voteId);
		//根据openId,voteId查询是否存在记录
		if(vo == null){
			return "mgr/ixin/matter/error";
		}
		if(pollService.checkExits(openId,vo.getVoteId())){
			return "forward:result.xhtml?voteId="+vo.getVoteId();
		}
		model.put("vo", vo);
		return "protal/poll/detail";
	}
	
	@RequestMapping("save")
	@ResponseBody
	public String save(HttpServletRequest request){
		String voteId = request.getParameter("voteId");
		//String currentQuestionId = request.getParameter("currentQuestionId");
		String selectOptId = request.getParameter("selectOptId");
		String openId = request.getParameter("openId");
		//当保存之后，需要记录每个投票活动的投票次数
		pollService.updateVoteUserNum(voteId);
		
		//2.用户选择的选型的投票数目+1
		pollService.updateOptionVoteNum(selectOptId);
		//3.向用户投票表中添加一条记录
		pollService.addToUserVote(voteId,openId);
		return "success";
	}
	
	@RequestMapping("result")
	public String result(HttpServletRequest request,ModelMap model){
		String voteId = request.getParameter("voteId");
		VoteVO vo = pollService.getVoteVOByVoteId(voteId);
		model.put("vo", vo);
		return "protal/poll/result";
	}
}
