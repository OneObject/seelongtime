package com.longtime.app.remind.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.remind.adapter.LastNewsAdapter;
import com.longtime.app.remind.adapter.NoticeAdapter;
import com.longtime.app.remind.adapter.RemindListAdapter;
import com.longtime.app.remind.model.RefreshRecode;
import com.longtime.app.remind.model.Remind;
import com.longtime.app.remind.service.RefreshRecodeService;
import com.longtime.app.remind.service.RemindService;
import com.longtime.app.remind.service.RemindTypeService;
import com.longtime.app.util.JsonEntity;
import com.longtime.common.spring.MessageUtils;
import com.myctu.platform.gateway.agent.query.CriteriaDTO;
import com.myctu.platform.gateway.agent.query.OrderDTO;
import com.myctu.platform.gateway.agent.query.QueryDTO;
import com.myctu.platform.repository.engine.domain.query.Page;
import com.myctu.platform.repository.engine.domain.query.ResultSet;

/**
 * 消息[提醒]
 * @author chenkf
 *
 */
@Controller
@RequestMapping(value="/remind/")
public class RemindController {
	
	@Resource(name="remindService")
	private RemindService remindService;
	@Resource(name="refreshRecodeService")
	private RefreshRecodeService refreshRecodeService;
	
	@Resource(name="remindTypeService")
	private RemindTypeService remindTypeService;

	/**
	 * 是否有通知
	 * 针对移动端[接口访问处理]
	 * @return JSONObject 处理结果返回
	 */
	@RequestMapping("hasNotice")
	@ResponseBody
	public JSONObject hasNotice4Mobile(HttpServletRequest request){
		JSONObject object = null;
		List<Remind> remindList = null;
		try{
			String uid = request.getParameter("uid");
			String domain = request.getParameter("domain");
			QueryDTO query = new QueryDTO();
			query.addCriteria(CriteriaDTO.where("domain").is(domain).and("uid").is(uid));
			List<RefreshRecode> rrList = refreshRecodeService.list(query.toMap());
			query = new QueryDTO();
			query.sort().on("dateline", OrderDTO.DESCENDING);
			if(rrList == null || rrList.size() == 0){
				query.addCriteria(CriteriaDTO.where("domain").in(domain,"all").and("release").is(Remind.IS_RELEASE));
			}else{
				query.addCriteria(CriteriaDTO.where("domain").in(domain,"all").and("release").is(Remind.IS_RELEASE).and("dateline").gt(rrList.get(0).getDateline()));
			}
			
			remindList = remindService.list(query.toMap());
			object = NoticeAdapter.getJSONObject(remindList);
		}catch(Exception e){
			e.printStackTrace();
			object = NoticeAdapter.getErrorJSONObject();
		}
		
		return object;
	}
	
	/**
	 * 最新资讯[为移动端服务，提供接口]
	 * @param request
	 * @return
	 */
	@RequestMapping("getLastNews")
	@ResponseBody
	public JSONObject latestNews(HttpServletRequest request){
		String domain = request.getParameter("domain");
		String type = request.getParameter("type");
		if(StringUtils.isBlank(domain)){
			domain = "all";
		}
		if(StringUtils.isBlank(type)){
			type = "1";
		}
		QueryDTO query = new QueryDTO();
		query.sort().on("dateline", OrderDTO.DESCENDING);
		query.addCriteria(CriteriaDTO.where("domain").in(domain,"all").and("type").is(Integer.valueOf(type)).and("release").is(Remind.IS_RELEASE));
		//query.skip(0).limit(1);
		List<Remind> list = remindService.list(query.toMap());
		return LastNewsAdapter.getJSONObject(list);
	}
	
	/**
	 * 消息列表
	 * @param request
	 * @return
	 */
	@RequestMapping("remindList")
	@ResponseBody
	public JSONObject remindList(HttpServletRequest request){
		String domain = request.getParameter("domain");
		String type = request.getParameter("type");
		String uid = request.getParameter("uid");
		if(StringUtils.isBlank(domain)){
			domain = "all";
		}
		if(StringUtils.isBlank(type)){
			type = "1";
		}
		QueryDTO query = new QueryDTO();
		query.sort().on("dateline", OrderDTO.DESCENDING);
		query.addCriteria(CriteriaDTO.where("domain").in(domain,"all").and("type").is(Integer.valueOf(type)).and("release").is(Remind.IS_RELEASE));
		List<Remind> list = remindService.list(query.toMap());
		//插入最后一次更新时间
		query = new QueryDTO();
		query.addCriteria(CriteriaDTO.where("domain").is(domain).and("uid").is(uid));
		RefreshRecode rr = null;
		List<RefreshRecode> rrList = refreshRecodeService.list(query.toMap());
		if(list!=null && list.size()>0){
			if(rrList!=null && rrList.size()>0){
				rr = rrList.get(0);
				rr.setDateline(list.get(0).getDateline());
				refreshRecodeService.update(rr);
			}else{
				rr = new RefreshRecode();
				rr.setDateline(list.get(0).getDateline());
				rr.setDomain(domain);
				rr.setUid(uid);
				refreshRecodeService.add(rr);
			}
		}
		
		return RemindListAdapter.getJSONObject(list);
		
	}
	
	////////////////以上是为移动端访问-------------------
	/**
	 * 跳转到添加页面
	 * @return JSP页面
	 */
	@RequestMapping("toadd")
	public String toAdd(ModelMap model){
		Map<String,String> map = remindTypeService.getTypes();
		model.put("map", map);
		return "remind/add";
	}
	
	/**
	 * 添加
	 * @return
	 */
	@RequestMapping("add")
	@ResponseBody
	public JSONObject add(Remind remind){
		JsonEntity jsonEntity = null;
		if(null != remind){
			jsonEntity = new JsonEntity();
			jsonEntity.setCallbackType("closeCurrent");
			jsonEntity.setNavTabId("remind_list");
			remind.setDateline(System.currentTimeMillis());
			remindService.add(remind);
		}else{
			jsonEntity = new JsonEntity("300");
			jsonEntity.setMessage(MessageUtils.getMessage("error.add.0"));
			return JSONObject.fromObject(jsonEntity);
		}
	
		return JSONObject.fromObject(jsonEntity);
	}
	/**
	 * 列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("list")
	public String listRemind(HttpServletRequest request,ModelMap model){
		String pageNum = request.getParameter("pageNum");
		String numPerPage = request.getParameter("numPerPage");
		
		Page page = new Page();
		
		if(StringUtils.isNotBlank(pageNum)){
			page.setCurrent_page(Integer.valueOf(pageNum));
		}
		if(StringUtils.isNotBlank(numPerPage)){
			page.setPage_size(Integer.valueOf(numPerPage));
		}
		QueryDTO query = new QueryDTO();
		query.sort().on("dateline", OrderDTO.DESCENDING);
		ResultSet<Remind> rs = remindService.listByPage(query.toMap(), page);
		Map<String,String> map = remindTypeService.getTypes();
		model.put("map", map);
		model.put("rs", rs);
		return "remind/list";
	}
	
	/**
	 * 删除
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public JSONObject del(@RequestParam(value="id",required=true)String id){
		remindService.delById(id);
		JsonEntity jsonEntity = new JsonEntity();
		return JSONObject.fromObject(jsonEntity);
	}
	/**
	 * 发布
	 * @param id
	 * @return
	 */
	@RequestMapping("release")
	@ResponseBody
	public JSONObject release(@RequestParam(value="id",required=true)String id,@RequestParam(value="do",required=true) String mdo){
		Remind r = remindService.loadById(id);
		if(mdo.equals("goto")){//发布
			r.setRelease(Remind.IS_RELEASE);
		}else if(mdo.equals("cancle")){//取消
			r.setRelease(Remind.NO_RELEASE);
		}
		remindService.update(r);
		JsonEntity jsonEntity = new JsonEntity();
		return JSONObject.fromObject(jsonEntity);
	}
	
	
	/**
	 * 测试try catch return 
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println(testReturn(null));
	}
	
	/**
	 * 测试try catch return 
	 * @param args
	 */
	private static String testReturn(String str){
		try{
			if(str == null){
				throw new Exception("error");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("return success");
		return str;
	}
	
}
