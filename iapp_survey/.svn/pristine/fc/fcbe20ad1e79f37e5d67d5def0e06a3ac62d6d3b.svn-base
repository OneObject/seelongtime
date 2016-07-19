
package com.longtime.app.ixin.mgr.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.longtime.ajy.support.service.WxCpAgentService;
import com.longtime.app.ixin.api.WeiXinAPIHelper;
import com.longtime.app.ixin.mgr.channel.model.ChannelEntity;
import com.longtime.app.ixin.mgr.channel.service.ChannelService;
import com.longtime.app.ixin.mgr.model.ActivityInfo;
import com.longtime.app.ixin.mgr.model.AutoResponseRule;
import com.longtime.app.ixin.mgr.model.CustomMenu;
import com.longtime.app.ixin.mgr.model.RewardActivity;
import com.longtime.app.ixin.mgr.model.TokenInfo;
import com.longtime.app.ixin.mgr.service.AutoResponseRuleService;
import com.longtime.app.ixin.mgr.service.CustomMenuService;
import com.longtime.app.ixin.mgr.service.IActivityService;
import com.longtime.app.ixin.mgr.service.IRewardService;
import com.longtime.app.ixin.mgr.service.ITokenService;
import com.longtime.app.ixin.mgr.vote.service.VoteService;
import com.longtime.app.ixin.mgr.vote.vo.VoteVO;
import com.longtime.app.ixin.vo.CustomMenuVO;
import com.longtime.app.util.Constant;
import com.longtime.common.utils.HtmlUtils;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;


/**
 * 爱微站菜单管理
 * @author liuxl
 * @date 2013年12月12日17:42:55
 */

@Controller
@RequestMapping("/mgr/ixin/custommenu/")
public class CustomMenuController {
	private static final Logger logger = LoggerFactory.getLogger(CustomMenuController.class);

	@Resource
	private CustomMenuService customMenuService;
	
	@Resource
	private ITokenService iTokenService;
	
	@Resource(name="activityService")
	private IActivityService activityService;
	
	@Resource(name="voteService")
	private VoteService voteService;
	
	@Resource(name="rewardService")
	private IRewardService rewardService;
	
	@Resource(name="autoResponseRuleService")
    private AutoResponseRuleService autoResponseRuleService;
	
	@Resource
	private ChannelService channelService;
	
	@RequestMapping("/relasecustommenu")
    @ResponseBody
	public ModelMap relaseCustommenu(HttpServletRequest req, ModelMap model) throws Exception {
	    String domain = LoginSessionHelper.getCurrentDomain(req);
	    String menuData = customMenuService.getMenuData(domain);
	    logger.debug(menuData);
	    
	    TokenInfo tokenInfo = iTokenService.doQueryOrInsertToken(domain);
	    
	    if(tokenInfo.isWXQY() && "0".equals(tokenInfo.getAgentid())){
	    	String msg = "企业小助手内不允许通过接口发布自定义菜单，请去微信企业号平台内配置！";
    		model.put("message", msg);
    		return model;
	    }
	    
	    if(StringUtils.isBlank(menuData)){
	    	if(tokenInfo.isWXQY()){
	    		boolean rs = WxCpAgentService.menuDelete(domain);
	    		String msg = "删除菜单成功！";
	    		if(!rs){
	    			msg = "删除菜单失败，请重新尝试！";
	    		}
	    		model.put("message", msg);
	    		return model;
	    	} else {
	    		String msg = WeiXinAPIHelper.deleteMenu(tokenInfo.getAppId(), tokenInfo.getAppSecret());
		    	model.put("message", msg);
		    	return model;
	    	}
	    }
	    
	    if(tokenInfo.isWXQY()){
	    	boolean rs = WxCpAgentService.menuCreate(menuData, domain);
	    	String msg = "发布菜单成功！";
    		if(!rs){
    			msg = "发布菜单失败，请检查菜单配置后重新尝试！";
    		}
    		model.put("message", msg);
    		return model;
	    }else {
	    	JSONObject demoJson = WeiXinAPIHelper.createMenu(tokenInfo.getAppId(), tokenInfo.getAppSecret(), menuData);
		    boolean ret = false;
		    if(null == demoJson){
	            model.put("message", "发布菜单失败！");
	            return model;
		    }
		    
		    ret = ("0".equals(demoJson.get("errcode")) || 0 == demoJson.getInteger("errcode"));
		    model.put("flag", ret);
		    if(ret){
		        model.put("message", "发布菜单成功！");
//		        model.put("message", demoJson.getString("errmsg"));
		    } else{
		        model.put("message", "错误代码："+demoJson.get("errcode")+"，错误信息："+demoJson.getString("errmsg"));
		    }
		    return model;
	    }
	}
	
	@RequestMapping("/deletemenu")
    @ResponseBody
	public ModelMap deleteMenu(HttpServletRequest req, ModelMap model) throws Exception {
	    customMenuService.removeTree();
	    
        String ret = WeiXinAPIHelper.deleteMenu(Constant.APPID, Constant.APPSECRET);
	    
	    model.put("message", ret);
	    return model;
	}

	@RequestMapping("/index")
	public String tree(HttpServletRequest req, ModelMap model) throws Exception {
	    CustomMenu root = customMenuService.getRoot();
	    if(null == root){
	        customMenuService.initTree();
	        root = customMenuService.getRoot();
	    }
	    String domain = LoginSessionHelper.getCurrentDomain(req);
	    CustomMenu customMenu = customMenuService.getByDomain(domain);
	    if(null == customMenu){
	        customMenuService.initDomainNode(domain, LoginSessionHelper.getCurrentUserId(req));
	    }
//        for (Field fe  : customMenu.getClass().getDeclaredFields()) {
//            System.out.println(fe.get(customMenu));
//        };
	    
		String id = req.getParameter("id");
		
		List<CustomMenuVO> list = new ArrayList<CustomMenuVO>();
		
		customMenuService.getlistToJson1(list, id, LoginSessionHelper.getCurrentDomain(req));
		JSONArray array = JSONArray.fromObject(list);
		int second = 0;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getpId().equals(list.get(0).getId())) {
				second++;
			}
		}
		model.put("second", second);
		model.put("rootId", list.get(0).getId());
		model.put("listCustom", list);
		model.put("tree", array.toString());
		model.put("domainNodeId", customMenuService.getByDomain(domain).getId());
		return "mgr/ixin/custommenu/index";
	}
	
	@RequestMapping("getcustommenutree")
    @ResponseBody
	public JSONArray getCategoryTree(HttpServletRequest req, ModelMap model) throws Exception {
        String id = req.getParameter("treeId");
        String type = req.getParameter("type");
        String[] orgs;
        List<CustomMenuVO> list = new ArrayList<CustomMenuVO>();
        if("1".equals(type)){//单选
            customMenuService.getlistToJson1(list,id, LoginSessionHelper.getCurrentDomain(req));
        }
        else{
            orgs = id.split(",");
            if(id==null||id==""){
                //这里要修改为domainCode
                orgs = new String[]{CustomMenu.root_id};
            }
            customMenuService.getlistToJson1(list, orgs, LoginSessionHelper.getCurrentDomain(req));
        }
        JSONArray array = JSONArray.fromObject(list);
        
        model.put("tree", array.toString());
        return array;
    }

	@RequestMapping("/insert")
    @ResponseBody
	public ModelMap insert(HttpServletRequest req, ModelMap model) throws IllegalArgumentException, IllegalAccessException {
	    String parentId = req.getParameter("parentId");
		String name = HtmlUtils.getAvailableString(req, "name");
		String type = req.getParameter("type");
		String url = req.getParameter("url");
		String contentType = req.getParameter("add_contentType");
		String content = req.getParameter("add_content");
		String contentName = req.getParameter("add_contentName");
		
		
		if(StringUtils.isNotBlank(name)){
			String keycode = "";
			String linkUrl = "";
			int menuType = CustomMenu.MENU_TYPE_CLICK;
			if(String.valueOf(CustomMenu.MENU_TYPE_VIEW).equals(type)){
		    	menuType = CustomMenu.MENU_TYPE_VIEW;
		    	linkUrl = url;
		    } else {
		    	if("url".equals(contentType)){
		    		menuType = CustomMenu.MENU_TYPE_CONTENT_VIEW;
			    	linkUrl = content;
		    	} else {
		    		menuType = CustomMenu.MENU_TYPE_CLICK;
		    		keycode = content;
		    	}
		    }
			
		    CustomMenu node = new CustomMenu();
		    node.setId(UUID.randomUUID().toString().replace("-", ""));
		    node.setDomain(LoginSessionHelper.getCurrentDomain(req));
		    node.setName(name);
	    	node.setType(menuType);
	    	node.setKeycode(keycode);
	    	node.setLinkurl(linkUrl);
	    	node.setRefoptionname(contentName);
		    node.setCreater(LoginSessionHelper.getCurrentUserId(req));
	        
		    customMenuService.insert(node, parentId);
		    
		    logger.debug("inser new node:[{}]", node);
		    
		    model.put("id", node.getId());
	        model.put("flag", true);
	        model.put("message", "添加成功！");
	        return model;
		}
		model.put("id", parentId);
        model.put("flag", false);
        model.put("message", "添加失败！");
		return model;
		
	}

	@RequestMapping("/delete")
	@ResponseBody
	public ModelMap delete(HttpServletRequest req,ModelMap model) {
		//要删除的id
		String perId = req.getParameter("delete_id");
		//父节点id
		String parentId = req.getParameter("delete_parentId");
		
		CustomMenu customMenu = customMenuService.get(perId);

        /**
         * 前台已经限制，安全起见，此处再进行判断
         */
		if((!customMenu.isLeaf())){
//	        return "redirect:/mgr/custommenu/customMenu.xhtml?id="+perId;
            model.put("flag", false);
            model.put("message", "该节点类型为父节点，不能删除！");
	        model.put("id", perId);
	        return model;
		}
		
		customMenuService.remove(perId);
        model.put("flag", true);
        model.put("message", "删除成功！");
        model.put("id", parentId);
        return model;
//		return "redirect:/mgr/custommenu/customMenu.xhtml?id="+parentId;
	}
	
	@RequestMapping("/update")
    @ResponseBody
	public ModelMap update(HttpServletRequest req, ModelMap model) {
		String perId = req.getParameter("update_parentId");
		
        String name = HtmlUtils.getAvailableString(req, "name");
        String type = req.getParameter("type");
        String url = req.getParameter("url");
        
        String contentType = req.getParameter("update_contentType");
		String content = req.getParameter("update_content");
		String contentName = req.getParameter("update_contentName");
        
		
        CustomMenu customMenu = customMenuService.get(perId);
        
        /*if(customMenu.isSystemType()){
            model.put("flag", false);
            model.put("message", "该节点类型为系统节点，不能修改！");
            model.put("id", perId);
            return model;
        }*/
        
		String keycode = "";
		String linkUrl = "";
		int menuType = CustomMenu.MENU_TYPE_CLICK;
		if(String.valueOf(CustomMenu.MENU_TYPE_VIEW).equals(type)){
	    	menuType = CustomMenu.MENU_TYPE_VIEW;
	    	linkUrl = url;
	    } else {
	    	if("url".equals(contentType)){
	    		menuType = CustomMenu.MENU_TYPE_CONTENT_VIEW;
		    	linkUrl = content;
	    	} else {
	    		menuType = CustomMenu.MENU_TYPE_CLICK;
	    		keycode = content;
	    	}
	    }
        
		if(StringUtils.isNotBlank(name)){
		    customMenu.setName(name);
		    customMenu.setType(menuType);
		    customMenu.setKeycode(keycode);
		    customMenu.setLinkurl(linkUrl);
		    customMenu.setRefoptionname(contentName);
		    customMenuService.update(customMenu);
		}

		model.put("flag", true);
        model.put("message", "修改成功！");
        model.put("id", perId);
        return model;
//		return "redirect:/mgr/custommenu/customMenu.xhtml?id="+perId;
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public ModelMap detail(HttpServletRequest req,ModelMap model) {
		String perId = req.getParameter("treeId");
		
		CustomMenu customMenu = customMenuService.get(perId);
		int childCount = customMenuService.getChildCount(perId);
		
		model.put("childCount", childCount);
		model.put("node", customMenu);
		model.put("method", "detail");
		return model;
	}
	
	@RequestMapping("/choosecontent")
	public String chooseContent(HttpServletRequest req,ModelMap model) {
		String type = req.getParameter("contentType");
		int currPage = NumberUtils.toInt(req.getParameter("page"), 1);
		int pageSize = NumberUtils.toInt(req.getParameter("max"), 10);
		String domain = LoginSessionHelper.getCurrentDomain(req);
		
		int totalSize = 0;
		Page pager = new Page(currPage, pageSize);
		
		switch (type) {
		case "1"://系统功能
			//页面静态列表
			break;
		case "2"://活动
			List<ActivityInfo> activitys = activityService.getActivityListHasKey(domain, currPage,pageSize);
			totalSize = activityService.getActivityCountHasKey(domain);
			model.put("list", activitys);
			pager.setTotal_size(totalSize);
			break;
		case "3"://投票
			List<VoteVO> votes = voteService.queryByPageHasKey(pageSize,currPage,domain);
			totalSize = voteService.getVoteTotalSizeHasKey(domain);
			pager.setTotal_size(totalSize);
			model.put("list", votes);
			break;
		case "4"://抽奖
			List<RewardActivity> rewards = rewardService.getRewardByDomainHasKey(domain, currPage,pageSize);
			totalSize = rewardService.getRewardCountHasKey(domain);
			System.out.println(totalSize);
			pager.setTotal_size(totalSize);
			model.put("list", rewards);
			break;
		case "5"://自定义关键字
	        List<AutoResponseRule> rules = autoResponseRuleService.getAutoResponseRuleList(domain, currPage, pageSize);
	        for(AutoResponseRule rule : rules){
	        	String[] keys = rule.getKeywords().split(",");
	        	if(keys != null && keys.length >0 ){
	        		rule.setKeywords(keys[0]);
	        	}
	        }
	        totalSize = autoResponseRuleService.getAutoResponseRuleCount(domain);
	        pager.setTotal_size(totalSize);
	        model.put("list", rules);
			break;
		case "6"://栏目
			List<ChannelEntity> channelEntities=this.channelService.getChannelList(domain, currPage,pageSize);
			totalSize=this.channelService.getTotalNum(domain);
			pager.setTotal_size(totalSize);
			model.put("list",channelEntities);
			break;
		default:
			break;
		}
				
		model.put("type", type);
		model.put("pager", pager);
		return "mgr/ixin/custommenu/list";
	}
}

