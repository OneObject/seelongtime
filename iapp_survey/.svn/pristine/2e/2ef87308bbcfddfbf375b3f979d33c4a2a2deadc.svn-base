package com.longtime.app.ixin.mgr.channel.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.admin.template.model.Template;
import com.longtime.app.admin.template.model.TemplateVO;
import com.longtime.app.admin.template.service.TemplateService;
import com.longtime.app.admin.template.util.TemplateHelper;
import com.longtime.app.ixin.mgr.channel.model.ChannelEntity;
import com.longtime.app.ixin.mgr.channel.service.ChannelResourceService;
import com.longtime.app.ixin.mgr.channel.service.ChannelService;
import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;

@Controller
@RequestMapping("/mgr/channel")
public class ChannelController {

	private static final Logger logger = LoggerFactory
			.getLogger(ChannelController.class);

	@Resource
	private ChannelService channelService;
	@Resource
	private ChannelResourceService channelResourceService;

	@Resource
	private FodderService fodderService;

	@Resource
	private TemplateService templateService;
	/**
	 * 栏目列表页
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "index")
	public String index(HttpServletRequest request, ModelMap model) {
		String restype = request.getParameter("restype");
		model.put("restype", restype);
		return "/mgr/channel/index";
	}

	@RequestMapping(value = "list")
	public String list(HttpServletRequest request, ModelMap model) {
		int currentpage = NumberUtils.toInt(
				request.getParameter("currentpage"), 1);
		String domain = LoginSessionHelper.getCurrentDomain(request);

		int pagesize = 10;

		List<ChannelEntity> list = this.channelService.getChannelList(domain,
				currentpage, pagesize);
		model.put("list", list);

		Page page = new Page(currentpage, pagesize);

		int total_size = this.channelService.getTotalNum(domain);
		page.setTotal_size(total_size);
		model.put("pager", page);
		return "/mgr/channel/list";
	}

	@RequestMapping(value = "channellist", method = RequestMethod.POST)
	@ResponseBody
	public List<ChannelEntity> channellist(HttpServletRequest request) {
		int currentpage = NumberUtils.toInt(
				request.getParameter("current_page"), Page.CURRENTPAGE_DEFAULT);

		int pagesize = NumberUtils.toInt(request.getParameter("page_size"),
				Page.PAGESIZE_DEFAULT);

		String domain = LoginSessionHelper.getCurrentDomain(request);

		List<ChannelEntity> list = this.channelService.getChannelList(domain,
				currentpage, pagesize);

		return list;
	}

	@RequestMapping(value = "toadd")
	public String toadd(HttpServletRequest  request,ModelMap modelMap) {
		Map<String, String> result = fodderService.getRequiredParams();
		
		String domain = LoginSessionHelper.getCurrentDomain(request);
		
		TemplateVO template = TemplateHelper.getTemplate(domain, "m.ixin.channelresource.nlist");
		
		List<Template> templates = templateService.listTemplateByMid("m.ixin.channelresource.nlist", domain);
		
		if(template != null){
			modelMap.put("type", template.getId());
		}else{
			modelMap.put("type", 1);
		}
		modelMap.put("templates", templates);
		modelMap.put("result", result);
		
		return "/mgr/channel/addchannel";
	}

	@RequestMapping(value = "addchannel", method = RequestMethod.POST)
	@ResponseBody
	public boolean addchannel(HttpServletRequest request) {
		String title = request.getParameter("title");
		String remark = request.getParameter("remark");
		String cover = request.getParameter("cover");
		String showType = request.getParameter("showType");
		String uid = LoginSessionHelper.getCurrentUserId(request);
		String domain = LoginSessionHelper.getCurrentDomain(request);
		if (StringUtils.isBlank(uid)) {
			logger.debug("uid can not be null");
			return false;
		}
		ChannelEntity entity = new ChannelEntity();
		entity.setId(IdGenerator.nextId32().toString());
		if (StringUtils.isNotBlank(title)) {
			entity.setTitle(title);
		} else {
			logger.debug("title can not be null");
			return false;
		}
		if (StringUtils.isNotBlank(remark)) {
			entity.setRemark(remark);
		} else {
			entity.setRemark("");
		} 
		entity.setCover(cover);		 
		entity.setCreator(uid);
		entity.setCreatetime(System.currentTimeMillis());
		entity.setDomain(domain);
		
		boolean success = channelService.save(entity) == 1;
		if (!success) {
			return false;
		}
		success = templateService.setSingleTemplate(domain,showType,entity.getId());
		if (!success) {
			return false;
		}
		return success;
	}

	/**
	 * 删除栏目
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "delchannel")
	@ResponseBody
	public boolean deleteById(HttpServletRequest request) {
		String id = request.getParameter("id");
		if (StringUtils.isBlank(id)) {
			logger.debug("id can not be null");
			return false;
		} else {
			int i = channelService.delete(id);
			if (i > 0) {
				int j = channelResourceService.deleteByChannelid(id);
				if (j <= 0) {
					return false;
				}
			}
		}

		return true;
	}

	@RequestMapping(value = "toupdate")
	public String toUpdate(HttpServletRequest request, ModelMap model) {

		String id = request.getParameter("id");
		String domain = LoginSessionHelper.getCurrentDomain(request);

		if (StringUtils.isBlank(id)) {
			return "redirect:index.xhtml";
		}
		Template template = templateService.getSingleTemplate(id);
		if (template!=null) {
			model.put("type", template.getId());
		}else{
			TemplateVO vo = TemplateHelper.getTemplate(domain, "m.ixin.channelresource.nlist");
			if(vo != null){
				model.put("type", vo.getId());
			}
		}
		List<Template> templates = templateService.listTemplateByMid("m.ixin.channelresource.nlist", domain);
		
		ChannelEntity channelEntity = this.channelService.getChannelEntity(id);
		Map<String, String> result = fodderService.getRequiredParams();
		model.put("result", result);
		model.put("templates", templates);
		model.put("channelEntity", channelEntity);

		return "mgr/channel/addchannel"; 
	}

	@RequestMapping(value = "update")
	@ResponseBody
	public boolean update(HttpServletRequest request) {
		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			return false;
		}

		String title = request.getParameter("title");
		String remark = request.getParameter("remark");
		String cover = request.getParameter("cover");
		String showType = request.getParameter("showType");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		ChannelEntity channelEntity = this.channelService.getChannelEntity(id);

		if (channelEntity != null) {
			channelEntity.setRemark(remark);
			channelEntity.setTitle(title);
			channelEntity.setCover(cover);
			channelEntity.setUpdatetime(System.currentTimeMillis());
			this.channelService.update(channelEntity);
			boolean success  = templateService.setSingleTemplate(domain,showType,channelEntity.getId());
			if (!success) {
				return false;
			}
		} else {
			return false;
		}

		return true;
	}

}
