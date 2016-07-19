package com.longtime.app.component.controller;

import com.longtime.app.base.controller.vo.OrganizationVo;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.OrganizationService;
import com.longtime.app.base.service.UserService;
import com.longtime.app.util.PageUtil;
import com.longtime.common.utils.*;
import net.sf.json.JSONArray;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/base/admin/comp")
public class DlgSupportController {
	
	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name = "organizationService")
	private OrganizationService organizationService;

	/**
     *弹出框内用户列表 
     */
    @RequestMapping(value="userlist", method=RequestMethod.POST)
    public String userList(HttpServletRequest req, ModelMap model){
        String username = HtmlUtils.getAvailableString(req, "username");
        String orgname = HtmlUtils.getAvailableString(req, "orgname");
        String userids = req.getParameter("userids");
        String domain = LoginSessionHelper.getCurrentDomain(req);

        String name = HtmlUtils.getAvailableString(req,"name");
        
        Page page = PageUtil.getPage(req);
        
        QueryCondition query = new QueryCondition();
        if(StringUtils.isNotBlank(username)){
            query.addFilterLike("username", "%"+username+"%");
        }
        if(StringUtils.isNotBlank(orgname)){
            query.addFilterLike("organization.name", "%"+orgname+"%");
        }
        if(StringUtils.isNotBlank(name)){
            query.addFilterLike("name", "%"+StringUtils.trimToEmpty(name)+"%");
        }
        query.addFilterEqual("isDel", User.ISDEL_NO);
        query.addFilterEqual("usertype", User.USER_TYPE_COMMON);
        query.addFilterEqual("domain", domain);

        query.addSort(new Sort("createTime", Sort.ORDER_DES));
        model.put("orderField", "createTime");
        model.put("orderDirection", "_desc");
        
        ResultSet<User> res = userService.list(query, page);
        
        model.put("list", res.getItems());
        model.put("page", res.getPage());
        model.put("userids", userids);
        
        return "base/admin/comp/userlist";
    }
    
    /**
	 * 组织树
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "orglist", method = RequestMethod.POST)
	@ResponseBody
	public String orglist(HttpServletRequest request, ModelMap model) {
		List<OrganizationVo> list = new ArrayList<OrganizationVo>();
		organizationService.getlistToJson2(list, null, request);

		JSONArray array = JSONArray.fromObject(list);

		return array.toString();
	}
}
