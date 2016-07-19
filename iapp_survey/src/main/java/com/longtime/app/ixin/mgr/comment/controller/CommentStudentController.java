package com.longtime.app.ixin.mgr.comment.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.admin.iask.service.AnswerService;
import com.longtime.app.iask.model.AnswerEntity;
import com.longtime.app.ixin.mgr.comment.model.CommentStudentVo;
import com.longtime.app.ixin.mgr.comment.service.CommentStudentNService;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;

@Controller
@RequestMapping("mgr/comment")
public class CommentStudentController {
	
	@Resource
	private CommentStudentNService commentStudentNService;
	
	@Resource
	private AnswerService baseAnswerService;
	
   
	@RequestMapping("commentindex")
   public String commentindex(HttpServletRequest request,ModelMap model){
        String resid=request.getParameter("resid");
		String restype=request.getParameter("restype");
		
		model.put("resid",resid);
		model.put("restype",restype);
	   return "mgr/comment/commentindex";
   }
	
	@RequestMapping("commentlist")
	public String commentlist(HttpServletRequest request,ModelMap model){
		
        String domain=LoginSessionHelper.getCurrentDomain(request);
		
		String searchval=request.getParameter("searchval");
		
		String resid=request.getParameter("resid");
		
		String restype=request.getParameter("restype");
		
		int currPage=getCurrpage(request);
		
		int totalSize=this.commentStudentNService.gettotal(Integer.valueOf(restype), domain, resid, searchval);
		
		int pagesize=10;
		
		Page page = new Page();
		page.setCurrent_page(currPage);
		page.setTotal_size(totalSize);
		page.setPage_size(pagesize);
		model.put("pager", page);
		
		List<CommentStudentVo> list=this.commentStudentNService.getlist(domain, resid, searchval, page, Integer.valueOf(restype));
		model.put("list",list);
		
		
		
		return "mgr/comment/commentlist";
	}
	
	@RequestMapping("commentdel")
	@ResponseBody
	public boolean commentdel(HttpServletRequest request,ModelMap model){
		String id=request.getParameter("id");
		
		String restype=request.getParameter("restype");
		String resid=request.getParameter("resid");
		if(StringUtils.isBlank(id)){
			return false;
		}
		try {
			if(Integer.valueOf(restype)==3){
			AnswerEntity answerEntity=this.baseAnswerService.getEntity(resid);
			if(answerEntity!=null){
				answerEntity.setComment_num(answerEntity.getComment_num()-1);
				this.baseAnswerService.updateAnswerEntity(answerEntity);
			}
			}
			this.commentStudentNService.del(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	
	@RequestMapping("batchdelcomment")
	@ResponseBody
	public boolean batchdelcomment(HttpServletRequest request,ModelMap model){
		
		String id=request.getParameter("ids");
		
		String restype=request.getParameter("restype");
		
		String resid=request.getParameter("resid");
		
		String[] ids=id.split(",");
		
		if(ids.length<=0){
			return false;
		}
		
		try {
			if(Integer.valueOf(restype)==3){
				AnswerEntity answerEntity=this.baseAnswerService.getEntity(resid);
				if(answerEntity!=null){
					answerEntity.setComment_num(answerEntity.getComment_num()-ids.length);
					this.baseAnswerService.updateAnswerEntity(answerEntity);
				}
			}
			this.commentStudentNService.batchdelcomment(ids);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	private int getCurrpage(HttpServletRequest request) {
		String currpage = request.getParameter("currPage");
		return NumberUtils.toInt(currpage, 1);
		
	}
}
