package com.longtime.app.base.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.base.model.IndexEntity;
import com.longtime.app.base.model.IndexEntityVO;
import com.longtime.app.base.model.IndexModuleEntity;
import com.longtime.app.base.service.DiyIndexModuleService;
import com.longtime.app.base.service.DiyIndexService;
import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.util.PageUtil;
import com.longtime.common.utils.HtmlUtils;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;
import com.longtime.common.utils.Sort;

@Controller
@RequestMapping("/base/admin/diyindex/")
public class DiyIndexController {
      
	@Resource 
	private DiyIndexModuleService diyIndexModuleService;
	
	@Resource 
	private DiyIndexService diyIndexService;
	
	@Resource(name="fodderService")
	private FodderService fodderService;

	
	/**
     * 管理
     * @param req
     * @param model
     * @return
     */
    @RequestMapping("index")
    public String itemblank(HttpServletRequest req, ModelMap model) {
        return "base/admin/diyindex/index";
    }

    /**
     * 搜索
     * @param req
     * @param model
     * @return
     */
	@RequestMapping(value="list", method=RequestMethod.POST)
	public String list(HttpServletRequest req,ModelMap model){
        Page page = PageUtil.getPage(req);
        
        String domain = LoginSessionHelper.getCurrentDomain(req);
       

        String searchContent = HtmlUtils.getAvailableString(req, "searchContent");

		QueryCondition query = new QueryCondition();
		query.addFilterEqual("domain", domain);
		query.addFilterEqual("isdel", 0);
		query.addSort(new Sort("createtime",Sort.ORDER_DES));
		if(StringUtils.isNotBlank(searchContent)){
			query.addFilterLike("name", "%"+searchContent+"%");
		}
		
		ResultSet<IndexEntity> rs = this.diyIndexService.list(query, page);
	
		model.put("page", rs.getPage());
		model.put("list",rs.getItems());
		
		return "base/admin/diyindex/list";
	}
	
	/**
	 * 第一步
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("edit")
	public String step1(HttpServletRequest request, ModelMap model) {
		String id = request.getParameter("id");
		if (StringUtils.isNotBlank(id)) {
			IndexEntity entity = this.diyIndexService.get(id);
			IndexEntityVO vo = new IndexEntityVO();
			vo.setId(entity.getId());
			vo.setCover(entity.getCover());
			vo.setFileid(entity.getFileid());
			vo.setName(entity.getName());
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("indexid", id);
			List<IndexModuleEntity> list = this.diyIndexModuleService.list(map);
			vo.setModels(list);
			model.put("vo", vo);
		}
		
		
		model.put("result", fodderService.getRequiredParams());
		return "base/admin/diyindex/editdiyindex";
	}
	
	
	@RequestMapping("save")
	@ResponseBody
	public String save(@RequestBody IndexEntityVO vo,HttpServletRequest request){
		String id = vo.getId();
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String uid = LoginSessionHelper.getCurrentUserId(request);
		if (StringUtils.isNotBlank(id)) {
			IndexEntity entity = this.diyIndexService.get(id);
			entity.setCover(vo.getCover());
			entity.setFileid(vo.getFileid());
			entity.setName(vo.getName());
			entity.setModifytime(System.currentTimeMillis());
			entity.setModifyuid(uid);
			entity.setDomain(domain);
			this.diyIndexService.update(entity);
			this.diyIndexModuleService.deleteByIndexId(id);
			for (IndexModuleEntity module : vo.getModels()) {
				module.setIndexid(id);
				this.diyIndexModuleService.insert(module);
			}
		}else{
			IndexEntity entity = new IndexEntity();
			entity.setCover(vo.getCover());
			entity.setFileid(vo.getFileid());
			entity.setName(vo.getName());
			entity.setDomain(domain);
			entity.setCreatetime(System.currentTimeMillis());
			entity.setCreateuid(uid);
			id = this.diyIndexService.insert(entity);
			for (IndexModuleEntity module : vo.getModels()) {
				module.setIndexid(id);
				this.diyIndexModuleService.insert(module);
			}
			
		}
	
		
		return "success";
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public String delete(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		IndexEntity entity = this.diyIndexService.get(id);
			entity.setIsdel(1);
		this.diyIndexService.update(entity);
		this.diyIndexModuleService.deleteByIndexId(id);
		return id;
		
	}
	

	
}
