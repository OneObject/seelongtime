package com.longtime.app.mobile.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.news.adapter.MsgAdapter;
import com.longtime.app.news.service.NewsService;
import com.longtime.app.news.vo.DetailMsg;
import com.longtime.app.news.vo.NewsResultVO;
import com.longtime.app.news.vo.NewsVO;
import com.longtime.app.remind.model.Remind;
import com.longtime.app.remind.service.RemindService;

@Controller
@RequestMapping("/news/")
public class NewsController {
	
	@Resource(name="newsService")
	private NewsService newsService;
	
	
	@Resource(name="remindService")
	private RemindService remindService;

	@RequestMapping("detail")
	public String detailNews(HttpServletRequest request,ModelMap model){
		String id = request.getParameter("id");
		System.out.println(id);
		String type = request.getParameter("type");
		
		if(type.equals("msg")){//消息
			Remind remind =  remindService.loadById(id);
			model.put("msg", remind);
		}else if(type.equals("news")){//新闻
			NewsVO newsVO = newsService.getNewsById(id);
			DetailMsg msg = MsgAdapter.getMsg(newsVO);
			model.put("msg", msg);
		}
		
		return "news/mobile/news";
	}
	
	@RequestMapping("newsList")
	@ResponseBody
	public JSONObject newsList(@RequestParam(value="domain",required=false)String domain){
		
		if(StringUtils.isBlank(domain)){
			domain = "all";
		}
		NewsResultVO result = newsService.getAll(domain);
		
		return JSONObject.fromObject(result);
	}
}
