package com.longtime.app.ixin.mgr.fodder.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.longtime.app.ixin.mgr.channel.model.ChannelResourceEntity;
import com.longtime.app.ixin.mgr.channel.model.ChannelResourceVo;
import com.longtime.app.ixin.mgr.channel.service.ChannelResourceService;
import com.longtime.app.ixin.mgr.fodder.model.FodderEntity;
import com.longtime.app.ixin.mgr.fodder.model.SourceFileEntity;
import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;
import com.longtime.app.ixin.mgr.model.MessageRecordVO;
import com.longtime.app.ixin.mgr.model.TokenInfo;
import com.longtime.app.ixin.mgr.service.ITokenService;
import com.longtime.app.ixin.mgr.service.MessageRecordService;
import com.longtime.app.ixin.mgr.service.StudyService;
import com.longtime.app.ixin.mgr.utils.Constants;
import com.longtime.app.util.PageUtil;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;
import com.myctu.platform.utils.NumberUtils;

@Controller("fodderController")
@RequestMapping("/mgr/fodder")
public class FodderController {
	@Resource(name = "fodderService")
	private FodderService fodderService;

	@Resource
	private ITokenService tokenService;

	@Resource
	private MessageRecordService messageRecordService ;
	
	@Resource
	private StudyService studyService;
	
	@Resource
	private ChannelResourceService channelResourceService;
	
	@RequestMapping("index")
	public String index() {
		return "mgr/ixin/fodder/index";
	}

	@RequestMapping("groupmessage")
	public String groupmessage(HttpServletRequest request, ModelMap model) {
		String id = request.getParameter("id");
		String tocp = request.getParameter("tocp");
		FodderVO fodderVO = new FodderVO();
		String domain = LoginSessionHelper.getCurrentDomain(request);
		TokenInfo tokenInfo = tokenService.getTokenInfoByDomain(domain);
		if (StringUtils.isNotBlank(id)) {
			// 得到素材
			fodderVO = this.fodderService.getFodderVOById(id);
		}
		model.put("foddervo", fodderVO);
		if (fodderVO != null && fodderVO.getId() != null) {
			model.put("id", fodderVO.getId());
		}
		model.put("tokenInfo", tokenInfo);
//		if((FosunAPIHelper.isDingTalkDomain(domain) && "1".equals(tocp)) || (tokenInfo != null && tokenInfo.isWXQY())){
//			model.put("tocp", tocp);
//			return "mgr/ixin/groupmessage/addcp";
//		}
		return "mgr/ixin/groupmessage/add";
	}
	
	@RequestMapping("messagelist")
	public String messagelist(HttpServletRequest request, ModelMap model) {
		int currPage = NumberUtils.toInt(request.getParameter("currPage"), NumberUtils.INTEGER_ONE);
		Page page = new Page(currPage, 3);
		String domain = LoginSessionHelper.getCurrentDomain(request);
		int totalPage = messageRecordService.count(domain);
		page.setTotal_size(totalPage);
		List<MessageRecordVO> list =  messageRecordService.list(domain,page);
		
		if (CollectionUtils.isEmpty(list)) {
			return "mgr/ixin/groupmessage/list";
		}
		for (MessageRecordVO record : list) {
			if(record.getContentType() == 0){
				record.setIds(record.getFids().split(","));
				List<FodderEntity> fodders = this.fodderService.list(record.getIds());
				record.setList(fodders);
			}
		}
		model.put("list", list);
		model.put("pager", page);
		return "mgr/ixin/groupmessage/list";
	}

	@RequestMapping("add")
	public String add(HttpServletRequest request, ModelMap model) {
		Map<String, String> result = fodderService.getRequiredParams();
		String columnId = request.getParameter("columnId");
		String id = request.getParameter("id");
		if (StringUtils.isBlank(columnId)) {
			columnId = request.getParameter("columnType");
		}

		String type = request.getParameter("restype");
		String channelid = request.getParameter("channelid");

		model.put("channelid", channelid);
		model.put("type", type);
		model.put("columnId", columnId);
		model.put("result", result);
		model.put("id", id);
		return "mgr/ixin/fodder/add";
	}

	@RequestMapping(value = "select", method = RequestMethod.POST)
	public String select(HttpServletRequest req, ModelMap model) {

		String domain = LoginSessionHelper.getCurrentDomain(req);
		Boolean add = BooleanUtils.toBoolean(req.getParameter("add"));
		String matterIds = req.getParameter("matterIds");
		Boolean multi = BooleanUtils.toBooleanObject(req.getParameter("multi"));
		int currPage = NumberUtils.toInt(req.getParameter("page"), 1);
		int pageSize = NumberUtils.toInt(req.getParameter("max"), 6);

		String title = req.getParameter("title");// 查询条件
		int totalSize = 0;
		List<FodderVO> list  = null;

		if(StringUtils.isBlank(title)) {
			totalSize = fodderService.getFodderTotalSize(domain);

			list = fodderService.getFodderByPage(pageSize, currPage, domain);
		}else{
			totalSize = fodderService.getFodderTotalSize(domain,StringUtils.trim(title));
			list = fodderService.getFodderByPageWithSerch(pageSize,currPage,domain,StringUtils.trim(title));
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

		return "mgr/ixin/fodder/select";
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
	 * 向url中附加参数
	 * 
	 * @param strURL
	 * @param key
	 * @param value
	 * @return
	 */
	private String addQueryString(String strURL, String key, String value) {
		if(StringUtils.isBlank(strURL)){
			return "";
		}
		String url = strURL;
		String[] arrSplit = strURL.split("[?]");
		if (arrSplit.length > 1) {
			String paramStr = arrSplit[1];
			if(!paramStr.contains(key)){
				url = String.format("%s&%s=%s", url, key, value);
			} 
		} else {
			url = String.format("%s?%s=%s", strURL, key, value);
		}
		return url;
	}
	
	@RequestMapping("save")
	@ResponseBody
	public Map<String, String> save(@RequestBody FodderVO vo,
			HttpServletRequest request) {
		String id = vo.getId();
		String baseId = vo.getBaseId();
		if (StringUtils.isBlank(baseId)) {
			baseId = UUID.randomUUID().toString().replaceAll("-", "");
			vo.setBaseId(baseId);
		}
		String url = vo.getGotoUrl();
		if(StringUtils.isNotBlank(url)){//原文链接加fdomain
			String requestUrl = request.getRequestURL().toString();
			String contextPath = request.getContextPath();
			String domainUrl = requestUrl.split(contextPath)[0] + "/";
			if(url.indexOf(domainUrl) == 0){//域名相同
				url = addQueryString(url, "fdomain", LoginSessionHelper.getCurrentDomain(request));
				vo.setGotoUrl(url);
			}
		}
		
		if (vo.getIsNotDraft() == Constants.MESSAGE_IS_DRAFT) {// 草稿数据
			if (StringUtils.isBlank(id)) {
				// 添加草稿
				id = UUID.randomUUID().toString().replaceAll("-", "");
				vo.setId(id);
				vo = fodderVOHandler(vo, request, true);
				fodderService.saveOrUpdateFodderDraft(vo, true);
			} else {
				// 修改草稿
				vo = fodderVOHandler(vo, request, false);
				fodderService.saveOrUpdateFodderDraft(vo, false);
			}
		} else {
			// 正式数据
			if (StringUtils.isNotBlank(vo.getColumnId())) {
				// 向栏目中间表添加数据,中间表的含义是代表学习与通知公告同素材表的对应关系
				// 保存栏目信息
				String columnType = vo.getColumnId();// 这里前期设计失误，在这里于纠正
				String domain = LoginSessionHelper.getCurrentDomain(request);
				String cId = vo.getExt();
				if (!vo.getColumnId().equals("respNews")
						&& StringUtils.isBlank(cId)) {
					fodderService.saveColumnInfo(columnType, baseId, domain);// 保存栏目信息
				}
				if (vo.getColumnId().equals("respNews")) {
					fodderService.saveAttResp(baseId, "fodder", domain);
				}

			}
			// 直接添加正式数据
			// 查询是否存在对应记录
			boolean isExist = fodderService.checkExist(vo.getBaseId());
			if (isExist) {
				vo = fodderVOHandler(vo, request, false);
				fodderService.updateFodder(vo);// 修改正式数据
			} else {
				vo = fodderVOHandler(vo, request, true);
				fodderService.saveFodder(vo);// 保存正式数据
			}

			// 删除草稿中对应记录
			fodderService.delFodderDraft(vo.getId());

		}
		Map<String, String> result = new HashMap<String, String>();
		result.put("id", id);
		result.put("baseId", baseId);

		return result;
	}

	/**
	 * 处理类
	 * 
	 * @param vo
	 * @param request
	 * @return
	 */
	private FodderVO fodderVOHandler(FodderVO vo, HttpServletRequest request,
			boolean isNew) {
		long time = System.currentTimeMillis();
		if (isNew) {
			vo.setCreateUid(LoginSessionHelper.getCurrentUserId(request));
			vo.setCreateTime(time);
			vo.setDomain(LoginSessionHelper.getCurrentDomain(request));
		}
		if (StringUtils.isNotBlank(vo.getContent())) {
			vo.setContent(HtmlUtils.htmlEscape(vo.getContent()));
		}
		vo.setModifyUid(LoginSessionHelper.getCurrentUserId(request));
		vo.setModifyTime(time);

		return vo;
	}

	@RequestMapping("savesourcefile")
	@ResponseBody
	public String saveSourceFile(@RequestBody SourceFileEntity file,
			HttpServletRequest request) {
		String id = fodderService.saveSourceFile(file,
				LoginSessionHelper.getCurrentDomain(request));
		return id;
	}

	@RequestMapping("delsourcefile")
	@ResponseBody
	public String delSourceFile(@RequestParam("fileId") String id) {
		fodderService.delSourceFile(id);
		return "success";
	}

	@RequestMapping("del")
	@ResponseBody
	public Map<String,String> del(@RequestParam("id") String id) {
		
		/**
		 * 判断素材是否被课程占用，不允许删除，并提示占用素材的课程名
		 */
		
		QueryCondition query = new  QueryCondition();
		query.addFilterEqual("resId", id);
		query.addFilterEqual("isdel", 0);
		Map<String,String> map = new HashMap<String, String>();
//		ResultSet<Course> res = courseService.list(query);
//		List<Course> list = res.getItems();
//		if(list!=null && !list.isEmpty()){
//			map.put("state", "defeated");
//			map.put("course", list.get(0).getName());
//		}else{
//			map.put("state", "success");
//			fodderService.del(id);
//			studyService.delByFodderId(id);
//			channelResourceService.deleteByresourceid(id);
//		}
		
		return map;
	}

	@RequestMapping("update")
	public String update(@RequestParam("id") String id,
			HttpServletRequest request, ModelMap model) {
		Map<String, String> result = fodderService.getRequiredParams();
		model.put("result", result);
		FodderVO vo = fodderService.getFodderVOById(id);
		// Pattern p = Pattern.compile("\\s*|\t|\r|\n");
		// Matcher m = p.matcher(vo.getContent());
		// vo.setContent( m.replaceAll(""));
		// vo.setContent(vo.getContent().replace("\"","\'"));
		String columnId = request.getParameter("columnId");
		String cId = request.getParameter("cId");
		model.put("cId", cId);
		model.put("columnId", columnId);
		model.put("vo", vo);
		return "mgr/ixin/fodder/update";
	}

	// 素材草稿操作start
	@RequestMapping("draffindex")
	public String draffIndex() {

		return "mgr/ixin/fodder/draffindex";
	}

	@RequestMapping("deldraff")
	@ResponseBody
	public String draffDel(@RequestParam("id") String id) {
		fodderService.delFodderDraft(id);
		return "success";
	}

	// 编辑草稿
	@RequestMapping("editdraff")
	public String editDraff(@RequestParam("id") String id, ModelMap model) {
		Map<String, String> result = fodderService.getRequiredParams();
		model.put("result", result);
		FodderVO vo = fodderService.getFodderVOByDraffId(id);
		model.put("vo", vo);
		return "mgr/ixin/fodder/draffedit";
	}

	// 素材草稿操作end
	@RequestMapping("gettoken")
	@ResponseBody
	public String gettoken() {
		Map<String, String> map = fodderService.getRequiredParams();

		return map.get("uploadToken");
	}

	@RequestMapping("saveattresp")
	@ResponseBody
	public String saveAttResp(HttpServletRequest request,
			@RequestParam("content") String content,
			@RequestParam("type") String type) {
		fodderService.saveAttResp(content, type,
				LoginSessionHelper.getCurrentDomain(request));
		return "success";
	}

	@RequestMapping(value = "fodderlist", method = RequestMethod.POST)
	@ResponseBody
	public List<ChannelResourceVo> fodderlist(HttpServletRequest request) {
		String currentpage = request.getParameter("currentpage");
		String pagesize = request.getParameter("pagesize");
		String param = request.getParameter("param");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		List<ChannelResourceVo> channelResourceVos = Lists.newArrayList();

		int totalsize = this.fodderService.getFodderTotalSize(domain, param);
		System.err.println(totalsize);
		Page page = new Page(NumberUtils.toInt(currentpage, 1),
				NumberUtils.toInt(pagesize, Page.PAGESIZE_DEFAULT));
		page.setTotal_size(totalsize);

		List<FodderEntity> fodderEntities = this.fodderService.fodderList(
				NumberUtils.toInt(pagesize, Page.PAGESIZE_DEFAULT),
				NumberUtils.toInt(currentpage, 1), domain, param);
		

		if (fodderEntities != null && fodderEntities.size() > 0) {
			for (FodderEntity fodderEntity : fodderEntities) {
				ChannelResourceVo channelResourceVo = new ChannelResourceVo();

				channelResourceVo.setCover(fodderEntity.getCoverPath());
				channelResourceVo.setCreatetime(fodderEntity.getCreateTime());
				channelResourceVo.setPager(page);
				channelResourceVo.setRemark(fodderEntity.getSummary());
				channelResourceVo.setResourceid(fodderEntity.getId());
				channelResourceVo.setTitle(fodderEntity.getTitle());
				channelResourceVo.setType(ChannelResourceEntity.SUCAI_RESTYPE);

				channelResourceVos.add(channelResourceVo);
			}
		}
		return channelResourceVos;
	}

	/**
	 * 课件列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "fodderwarelist", method = RequestMethod.POST)
	@ResponseBody
	public ResultSet<FodderEntity> fodderwarelist(HttpServletRequest request) {
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String search = request.getParameter("search");
		Page page = PageUtil.getPage(request);
		List<FodderEntity> fodderEntities = this.fodderService.fodderList(
				page.getPage_size(), page.getCurrent_page(), domain, search);
		int totalsize = this.fodderService.getFodderTotalSize(domain, search);
		page.setTotal_size(totalsize);
		ResultSet<FodderEntity> rs = new ResultSet<FodderEntity>();
		rs.setItems(fodderEntities);
		rs.setPage(page);
		return rs;
	}

}
