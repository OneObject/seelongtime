package com.longtime.app.ixin.mgr.controller;

import org.apache.commons.lang3.BooleanUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang3.StringUtils;
import org.omg.CosNaming.NamingContextPackage.NotEmpty;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.longtime.app.base.model.TenantConfig;
import com.longtime.app.base.service.TenantConfigService;
import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;
import com.longtime.app.ixin.mgr.model.AutoResponseRule;
import com.longtime.app.ixin.mgr.service.AutoResponseRuleService;
import com.longtime.common.utils.HtmlUtils;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;

/**
 * 素材管理
 * 
 * @author longtime
 */
@Controller("powerController")
@RequestMapping("/mgr/ixin/power/")
public class AutoResponseRuleController {
	private static final Logger logger = LoggerFactory
			.getLogger(AutoResponseRuleController.class);

	@Resource(name = "autoResponseRuleService")
	private AutoResponseRuleService autoResponseRuleService;
	
	@Resource
	private TenantConfigService tenantConfigService;

	@Resource
	private FodderService fodderService;

	@RequestMapping("index")
	public String index(HttpServletRequest req, ModelMap model) {
		// int pageNO = 1;
		// int pageSize = 100;
		// List<AutoResponseRuleVO> list =
		// autoResponseRuleService.getAutoResponseRuleVOList(LoginSessionHelper.getCurrentDomain(req),
		// pageNO, pageSize);

		// model.put("list", list);
		String domain=LoginSessionHelper.getCurrentDomain(req);
		Map<String, String> map = fodderService.getRequiredParams();
		TenantConfig tenantConfig=tenantConfigService.getByDomain(domain);
		model.put("tenantConfig",tenantConfig);
		model.put("a", req.getParameter("a"));
		model.put("map", map);
		return "mgr/ixin/power/index";
	}

	/**
	 * 添加
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "doadd")
	@ResponseBody
	public ModelMap add(HttpServletRequest req, ModelMap model) {
		String name = HtmlUtils.getAvailableString(req, "ruleName");
		String keywords = HtmlUtils.getAvailableString(req, "keywords");
		while (keywords.indexOf("，") >= 0) {
			keywords = keywords.replace("，", ",");
		}
		while (keywords.indexOf(",,") >= 0) {
			keywords = keywords.replace(",,", ",");
		}
		if (keywords.startsWith(",")) {
			keywords = keywords.substring(1, keywords.length());
		}
		if (keywords.endsWith(",")) {
			keywords = keywords.substring(0, keywords.length() - 1);
		}

		if (StringUtils.isBlank(name) || StringUtils.isBlank(keywords)) {
			model.put("flag", false);
			model.put("message", "添加失败！");
			return model;
		}

		if (keywords.endsWith(",")) {
			keywords = keywords.substring(0, keywords.length() - 1);
		}
		String responseAll = req.getParameter("responseAll");
		String matchAll = req.getParameter("matchAll");
		String matterIds = req.getParameter("matterIds");
		String type = req.getParameter("type");
		String content = req.getParameter("content");

		AutoResponseRule entity = new AutoResponseRule();
		entity.setDomain(LoginSessionHelper.getCurrentDomain(req));
		entity.setName(name);
		entity.setKeywords(keywords);
		entity.setMatchAll(NumberUtils.toInt(matchAll,
				AutoResponseRule.MATCH_ALL_NO));
		entity.setResponseAll(NumberUtils.toInt(responseAll,
				AutoResponseRule.RESPONSE_ALL_NO));
		entity.setCreater(LoginSessionHelper.getCurrentUserId(req));
		if (AutoResponseRule.TYPE_TEXT.equals(type)) {
			entity.setContent(content);
			entity.setMatterIds("");
		} else if (AutoResponseRule.TYPE_NEWS.equals(type)) {
			entity.setContent("");
			entity.setMatterIds(matterIds);
		}
		entity.setType(type);

		autoResponseRuleService.addAutoResponseRule(entity);

		model.put("flag", true);
		model.put("message", "添加成功！");
		return model;
	}

	/**
	 * 更新
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("doupdate")
	@ResponseBody
	public ModelMap update(HttpServletRequest req, ModelMap model) {
		String id = req.getParameter("id");
		if (StringUtils.isBlank(id)) {
			model.put("flag", false);
			model.put("message", "编辑失败！");
			return model;
		}
		String name = HtmlUtils.getAvailableString(req, "ruleName");
		String keywords = HtmlUtils.getAvailableString(req, "keywords");

		while (keywords.indexOf(",,") >= 0) {
			keywords = keywords.replace(",,", ",");
		}
		if (keywords.startsWith(",")) {
			keywords = keywords.substring(1, keywords.length());
		}
		if (keywords.endsWith(",")) {
			keywords = keywords.substring(0, keywords.length() - 1);
		}
		if (StringUtils.isBlank(name) || StringUtils.isBlank(keywords)) {
			model.put("flag", false);
			model.put("message", "编辑失败！");
			return model;
		}

		String matterIds = req.getParameter("matterIds");
		String responseAll = req.getParameter("responseAll");
		String matchAll = req.getParameter("matchAll");
		String type = req.getParameter("type");
		String content = req.getParameter("content");

		AutoResponseRule entity = autoResponseRuleService
				.getAutoResponseRuleById(id);
		entity.setName(name);
		entity.setKeywords(keywords);
		entity.setMatchAll(NumberUtils.toInt(matchAll,
				AutoResponseRule.MATCH_ALL_NO));
		entity.setResponseAll(NumberUtils.toInt(responseAll,
				AutoResponseRule.RESPONSE_ALL_NO));
		entity.setUpdater(LoginSessionHelper.getCurrentUserId(req));
		entity.setType(type);
		if (AutoResponseRule.TYPE_TEXT.equals(type)) {
			entity.setContent(content);
			entity.setMatterIds("");
		} else if (AutoResponseRule.TYPE_NEWS.equals(type)) {
			entity.setContent("");
			entity.setMatterIds(matterIds);
		}

		autoResponseRuleService.updateAutoResponseRule(entity);

		model.put("flag", true);
		model.put("message", "编辑成功！");
		return model;
	}

	/**
	 * 查询
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "appendmatters", method = RequestMethod.POST)
	public String appendMatters(HttpServletRequest req, ModelMap model) {
		String matterIds = req.getParameter("matterIds");

		List<FodderVO> list = autoResponseRuleService.getFodderByIds(matterIds);
		model.put("sum", list.size());
		model.put("list", list);
		return "mgr/ixin/power/appendmatters";
	}

	/**
	 * 查询
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "listmatters", method = RequestMethod.POST)
	public String listMatters(HttpServletRequest req, ModelMap model) {
		Boolean add = BooleanUtils.toBoolean(req.getParameter("add"));// 显示创建素材
		String matterIds = req.getParameter("matterIds");
		Boolean multi = BooleanUtils.toBooleanObject(req.getParameter("multi"));
		int totalSize=0;
		int currPage = NumberUtils.toInt(req.getParameter("page"), 1);
		int pageSize = NumberUtils.toInt(req.getParameter("max"), 6);
		String search = req.getParameter("search");
		List<FodderVO> list = new ArrayList<FodderVO>();
		if( !(search==null || search.isEmpty())){
		 list= fodderService.getFodderByPageWithSerch(pageSize, currPage,LoginSessionHelper.getCurrentDomain(req),search);
		 totalSize=fodderService.getTitalSizeWithSearch(LoginSessionHelper.getCurrentDomain(req), search);
		}else{
			totalSize = fodderService.getFodderTotalSize(LoginSessionHelper
					.getCurrentDomain(req));
			list=fodderService.getFodderByPage(pageSize, currPage, LoginSessionHelper.getCurrentDomain(req));
		}
		model.put("list", list);
		model.put("matterIds", matterIds);
		model.put("multi", multi);
		model.put("add", add);
		putPageToModel(model, currPage, totalSize, pageSize);
		Map<String, Boolean> idsMap = Maps.newHashMap();
		if (StringUtils.isNotBlank(matterIds)) {
			String[] arrayIds = matterIds.split(",");
			if (null != arrayIds && arrayIds.length > 0) {
				for (String id : arrayIds) {
					idsMap.put(id, true);
				}
			}
		}
		model.put("idsMap", idsMap);

		return "mgr/ixin/power/listmatters";
	}

	private void putPageToModel(ModelMap model, int currPage, int totalSize,
			int pageSize) {
		Page page = new Page();
		page.setCurrent_page(currPage);
		page.setTotal_size(totalSize);
		page.setPage_size(pageSize);
		model.put("pager", page);
	}

	/**
	 * to增加
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("add")
	public String toadd(HttpServletRequest req, ModelMap model) {
		return "mgr/ixin/power/add";
	}

	/**
	 * to更新
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("update")
	public String toupdate(HttpServletRequest req, ModelMap model) {
		String id = req.getParameter("id");
		if (StringUtils.isBlank(id)) {
			return "redirect:/mgr/ixin/power/index.xhtml";
		}

		AutoResponseRule entity = autoResponseRuleService
				.getAutoResponseRuleById(id);
		if (null == entity) {
			return "redirect:/mgr/ixin/power/index.xhtml";
		}

		String matterIds = entity.getMatterIds();
		List<FodderVO> list = autoResponseRuleService.getFodderByIds(matterIds);
		model.put("sum", list.size());
		model.put("list", list);
		model.put("entity", entity);
		return "mgr/ixin/power/update";
	}

	/**
	 * 详情
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("detail")
	public String detail(HttpServletRequest req, ModelMap model) {
		String id = req.getParameter("id");
		if (StringUtils.isBlank(id)) {
			return "redirect:/mgr/ixin/power/index.xhtml";
		}

		AutoResponseRule entity = autoResponseRuleService
				.getAutoResponseRuleById(id);
		if (null == entity) {
			return "redirect:/mgr/ixin/power/index.xhtml";
		}

		String matterIds = entity.getMatterIds();
		List<FodderVO> list = autoResponseRuleService.getFodderByIds(matterIds);

		model.put("option", "detail");
		model.put("list", list);
		model.put("entity", entity);
		return "mgr/ixin/power/detail";
	}

	/**
	 * 删除
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap delete(HttpServletRequest req, ModelMap model) {
		String id = req.getParameter("id");

		if (StringUtils.isBlank(id)) {
			model.put("flag", false);
			model.put("message", "删除失败，没有传入ID！");
			return model;
		}

		AutoResponseRule entity = autoResponseRuleService
				.getAutoResponseRuleById(id);
		if (null == entity) {
			model.put("flag", false);
			model.put("message", "删除失败，没有找到对象！");
			return model;
		}
		entity.setIsdel(AutoResponseRule.IS_DEL_YES);
		autoResponseRuleService.updateAutoResponseRule(entity);

		model.put("flag", true);
		model.put("message", "删除成功！");
		return model;
	}

	@RequestMapping("delattresp")
	@ResponseBody
	public String delAttResp(@RequestParam("attId") String attId) {
		fodderService.delAttResp(attId);
		return "success";
	}
}
