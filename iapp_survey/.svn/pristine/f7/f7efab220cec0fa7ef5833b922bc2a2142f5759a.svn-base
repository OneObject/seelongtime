/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-16 - 下午1:31:52
 */
package com.longtime.app.base.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.googlecode.genericdao.search.Filter;
import com.longtime.app.base.controller.vo.OrganizationVo;
import com.longtime.app.base.model.Authorize;
import com.longtime.app.base.model.BaseGroup;
import com.longtime.app.base.model.JobLevelEntityVo;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.AuthorizeService;
import com.longtime.app.base.service.JobLevelService;
import com.longtime.app.base.service.OrganizationService;
import com.longtime.app.base.service.UserGroupService;
import com.longtime.app.base.service.UserService;
import com.longtime.app.ixin.mgr.model.ActivityInfo;
import com.longtime.app.ixin.mgr.service.IActivityService;
import com.longtime.app.util.PageUtil;
import com.longtime.common.utils.HtmlUtils;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.QueryFilter;
import com.longtime.common.utils.ResultSet;
import com.longtime.common.utils.Sort;
import com.longtime.common.utils.Sort.Order;

import net.sf.json.JSONArray;

/**
 * @since 2013-9-16
 * @author liuxl
 * 
 */
@Controller("authorizenew")
@RequestMapping("/base/admin/authorize/")
public class AuthorizeController {
	
	@Resource
	private AuthorizeService authorizeService;
	
    @Resource
    private UserService userService;
    
    @Resource
    private OrganizationService organizationService;
    
    @Resource
    private JobLevelService jobLevelService;
    
    @Resource(name="activityService")
    private IActivityService activityService;
    
    @Resource
    private UserGroupService userGroupService;
    
	
    /**
     * 考试授权列表主页
     */
    @RequestMapping("authorize")
    public String examination(HttpServletRequest req,ModelMap model){
        String rcategory = req.getParameter("rcategory");
        String rid = req.getParameter("rid");
        String scategory = req.getParameter("scategory");

       if(Integer.parseInt(rcategory) == Authorize.R_CATEGORY_ACTIVITY){
        	ActivityInfo activityInfo = this.activityService.getActivityById(rid);
        	model.put("entity", activityInfo);
            model.put("className", "活动");
            model.put("name", activityInfo.getName());
        }
        
        model.put("rcategory", rcategory);
        model.put("rid", rid);
        model.put("scategory", scategory);
        
        return "base/admin/authorize/authorize";
    }
    
	@RequestMapping(value="detailgroup",method=RequestMethod.POST)
    public String detailgroup(HttpServletRequest request,ModelMap model){
    	String domain=LoginSessionHelper.getCurrentDomain(request);
    	String scategoryStr=request.getParameter("scategory");
    	int scategory = NumberUtils.toInt(scategoryStr, -1);
    	
    	 if(scategory == Authorize.S_CATEGORY_USER){
    		 return "base/admin/authorize/userlist"; 
    		 
    	 }else if(scategory==Authorize.S_CATEGORY_ORG){
    		 
    		 List<OrganizationVo> list = new ArrayList<OrganizationVo>();
             organizationService.getlistToJson2(list,null, request);
             
             JSONArray array = JSONArray.fromObject(list);
             model.put("idstr", array.toString());
             
    		 return "base/admin/authorize/orgdetail";
    	 }else if(scategory==Authorize.S_CATEGORY_JOBLEVEL){
    		 
    		 List<JobLevelEntityVo> jobLevelEntityVos=this.jobLevelService.getJobLevelEntityVos(getJobLevelRootId(request),new String[]{}, domain);
             JSONArray array=JSONArray.fromObject(jobLevelEntityVos);
             
             model.put("joblevelstr",array.toString());
    		 return "base/admin/authorize/jobleveldetail";
    	 }
    	return "base/admin/authorize/blank";
    }
    
    
    
    
    /**
     * 授权信息列表
     */
    @RequestMapping(value="detail", method=RequestMethod.POST)
    public String list(HttpServletRequest req,@RequestParam(value="domain",required=false)String domain,ModelMap model){
        domain = LoginSessionHelper.getCurrentDomain(req);
        String rcategoryStr = req.getParameter("rcategory");
        String rid = req.getParameter("rid");
        String scategoryStr = req.getParameter("scategory");
        String orderField = req.getParameter("orderField");
        String orderDirection = req.getParameter("orderDirection");
        
        if(StringUtils.isBlank(rcategoryStr) || StringUtils.isBlank(rid)){
            return "base/admin/authorize/blank";
        }

        int scategory = NumberUtils.toInt(scategoryStr, -1);
        int rcategory = NumberUtils.toInt(rcategoryStr, -1);
        
        List<String> sidList = authorizeService.getSids(rcategory, rid, scategory);
        
        if(scategory == Authorize.S_CATEGORY_USER){
            QueryCondition query = new QueryCondition();
            query.addFilter("id", sidList, Filter.OP_IN);
            query.addFilterEqual("domain", LoginSessionHelper.getCurrentDomain(req));
            query.addFilterEqual("isDel", User.ISDEL_NO);

            if(StringUtils.isNotBlank(orderField) && StringUtils.isNotBlank(orderDirection)){
                model.put("orderField", orderField);
                model.put("orderDirection", orderDirection);
                if(orderDirection.equals("_asc")){
                    query.addSort(new Sort(orderField, Sort.ORDER_ASC));
                } else{
                    query.addSort(new Sort(orderField, Sort.ORDER_DES));
                }
            } else{
                query.addSort(new Sort("createTime", Sort.ORDER_DES));
                model.put("orderField", "createTime");
                model.put("orderDirection", "_desc");
            }
            
            Page page = PageUtil.getPage(req);
            ResultSet<User> res = userService.list(query, page);
            
            model.put("genderMap", User.GENDER_MAP);
            model.put("certTypeMap", User.CERTIFICATE_TYPE_MAP);
            
            if(res==null || null==res.getItems() || 0==res.getItems().size()){
                model.put("page", page);
                return "base/admin/authorize/userlist";
            }
            
            model.put("list", res.getItems());
            model.put("page", res.getPage());

            return "base/admin/authorize/userlist";
        } else if(scategory == Authorize.S_CATEGORY_ORG){
            String[] ids = sidList.toArray(new String[]{});
            List<OrganizationVo> list = new ArrayList<OrganizationVo>();
            
            organizationService.getlistToJson2(list, ids, req);
            JSONArray array = JSONArray.fromObject(list);
            
            model.put("idstr", array.toString());
            return "base/admin/authorize/orgdetail";
        }else if(scategory==Authorize.S_CATEGORY_JOBLEVEL){
        	String[] ids=sidList.toArray(new String[]{});
        	List<JobLevelEntityVo> jobLevelEntityVos=this.jobLevelService.getJobLevelEntityVos(getJobLevelRootId(req), ids, domain);
            JSONArray array=JSONArray.fromObject(jobLevelEntityVos);
            
            model.put("joblevelstr",array.toString());
            return "base/admin/authorize/jobleveldetail";
        }else if(scategory==Authorize.S_CATEGORY_GROUP){
        	
        	int currentpage=NumberUtils.toInt(req.getParameter("currentpage"),Page.CURRENTPAGE_DEFAULT);
        	
        	int pagesize=NumberUtils.toInt(req.getParameter("pagesize"),Page.PAGESIZE_DEFAULT);
        	
        	String pageFn=req.getParameter("pageFn");
        	
        	Page page=new Page(currentpage,pagesize);
        	
        	QueryCondition queryCondition=new QueryCondition();
        	
        	queryCondition.addFilter("id", sidList, Filter.OP_IN);
        	queryCondition.addFilterEqual("domain", LoginSessionHelper.getCurrentDomain(req));
        	queryCondition.addFilterEqual("isdel",BaseGroup.ISDEL_NO);
        	queryCondition.addFilterEqual("type",BaseGroup.COMMON_TYPE);
        	queryCondition.addSort(new Sort("createtime",Order.ASC));
        	
        	
        	ResultSet<BaseGroup> rs=this.userGroupService.list(queryCondition, page);
        	
        	if(rs!=null && rs.getItems()!=null && rs.getItems().size()>0){
        		model.put("list",rs.getItems());
        		model.put("page",rs.getPage());
        	}else {
				model.put("list",Lists.newArrayList());
				model.put("page",page);
			}
        	
        	model.put("pageFn",pageFn);
        	
        	return "base/admin/authorize/grouplist";
        	
        }
        
        return "base/admin/authorize/blank";
    }
    
    @RequestMapping(value="savejoblevel")
    @ResponseBody
    public ModelMap savejoblevel(HttpServletRequest request,ModelMap model){
    	 String joblevelstr = request.getParameter("joblevelstr");
         
         String rcategoryStr = request.getParameter("rcategory");
         String rid = request.getParameter("rid");
         String scategoryStr = request.getParameter("scategory");
         
         if(StringUtils.isBlank(rcategoryStr) || StringUtils.isBlank(rid) || StringUtils.isBlank(scategoryStr)){
             model.put("message", "参数不能为空");
             model.put("flag", false);
             return model;
         }
         
         int scategory = NumberUtils.toInt(scategoryStr, -1);
         int rcategory = NumberUtils.toInt(rcategoryStr, -1);

         boolean ret = authorizeService.deleteGroup(rcategory, rid, scategory);
         
         if(!ret){
             model.put("message", "操作失败！");
             model.put("flag", false);
             return model;
         }
         
         String[] sids = joblevelstr.split(",");
         for(String id: sids){
             if(StringUtils.isBlank(id)){
                 continue;
             }
             
             Authorize auth = new Authorize();
             auth.setRcategory(rcategory);
             auth.setRid(rid);
             auth.setScategory(scategory);
             auth.setSid(id);
             auth.setDomain(LoginSessionHelper.getCurrentDomain(request));
             authorizeService.insert(auth);
         }
         
         model.put("message", "职级授权成功！");
         model.put("flag", true);
         return model;
    }
    
    
    

    @RequestMapping(value="saveorgauth")
    @ResponseBody
    public ModelMap saveOrgAuth(HttpServletRequest req,HttpServletResponse pon, ModelMap model) throws IOException {
        String idstr = req.getParameter("idstr");
        
        String rcategoryStr = req.getParameter("rcategory");
        String rid = req.getParameter("rid");
        String scategoryStr = req.getParameter("scategory");
        
        if(StringUtils.isBlank(rcategoryStr) || StringUtils.isBlank(rid) || StringUtils.isBlank(scategoryStr)){
            model.put("message", "参数不能为空");
            model.put("flag", false);
            return model;
        }
        
        int scategory = NumberUtils.toInt(scategoryStr, -1);
        int rcategory = NumberUtils.toInt(rcategoryStr, -1);

        boolean ret = authorizeService.deleteGroup(rcategory, rid, scategory);
        
        if(!ret){
            model.put("message", "操作失败！");
            model.put("flag", false);
            return model;
        }
        
        String[] sids = idstr.split(",");
        for(String id: sids){
            if(StringUtils.isBlank(id)){
                continue;
            }
            
            Authorize auth = new Authorize();
            auth.setRcategory(rcategory);
            auth.setRid(rid);
            auth.setScategory(scategory);
            auth.setSid(id);
            auth.setDomain(LoginSessionHelper.getCurrentDomain(req));
            authorizeService.insert(auth);
        }
        
        model.put("message", "组织授权成功！");
        model.put("flag", true);
        return model;
    }
    
    @RequestMapping(value="choosegroup",method=RequestMethod.POST)
    public String choosegroup(HttpServletRequest request,ModelMap model){
    	String rcategoryStr=request.getParameter("rcategory");
    	String rid=request.getParameter("rid");
    	String scategoryStr=request.getParameter("scategory");
    	String searchcontent=HtmlUtils.getAvailableString(request,"searchcontent");
    	String pageFn=request.getParameter("pageFn");
    	
    	int currentpage=NumberUtils.toInt("currentpage",Page.CURRENTPAGE_DEFAULT);
    	int pagesize=NumberUtils.toInt("pagesize",Page.PAGESIZE_DEFAULT);
    	
    	Page page=new Page(currentpage,pagesize);
    	
    	if(StringUtils.isBlank(rcategoryStr) || StringUtils.isBlank(rid) || StringUtils.isBlank(scategoryStr)){
    		model.put("page",page);
    		return "base/admin/authorize/choosegrouplist";
    	}
    	
    	 int rcategory = NumberUtils.toInt(rcategoryStr, -1);
         int scategory = NumberUtils.toInt(scategoryStr, -1);
         List<String> sidList = authorizeService.getSids(rcategory, rid, scategory);
         
         QueryCondition query = new QueryCondition();
         query.addFilter("id", sidList, Filter.OP_NOT_IN);
         query.addFilterEqual("domain", LoginSessionHelper.getCurrentDomain(request));
         
         if(StringUtils.isNotBlank(searchcontent)){
        	 query.addFilterLike("name","%"+searchcontent+"%");
         }
         
         query.addFilterEqual("isdel",BaseGroup.ISDEL_NO);
        // query.addFilterEqual("type",BaseGroup.COMMON_TYPE);
         
         query.addSort(new Sort("createtime",Order.ASC));
         
         ResultSet<BaseGroup> rs=this.userGroupService.list(query, page);
    	
         if(rs!=null && rs.getItems()!=null && rs.getItems().size()>0){
        	 model.put("list",rs.getItems());
        	 model.put("page",rs.getPage());
         }else {
			model.put("list",Lists.newArrayList());
			model.put("page",page);
		}
         
         model.put("pageFn",pageFn);
    	
    	
    	return "base/admin/authorize/choosegrouplist";
    }
    
    /**
     * 选择授权用户
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value="chooseuser", method=RequestMethod.POST)
    public String chooseUser(HttpServletRequest req, ModelMap model){
        String rcategoryStr = req.getParameter("rcategory");
        String rid = req.getParameter("rid");
        String scategoryStr = req.getParameter("scategory");
        String username = HtmlUtils.getAvailableString(req, "username");
        String name = HtmlUtils.getAvailableString(req,"name");
        String orgname = HtmlUtils.getAvailableString(req, "orgname");
        String label = HtmlUtils.getAvailableString(req,"label");
        String gender = req.getParameter("gender");
        String userids = req.getParameter("userids");
        String orderField = req.getParameter("orderField");
        String orderDirection = req.getParameter("orderDirection");
        
        Page page = PageUtil.getPage(req);
        
        if(StringUtils.isBlank(rcategoryStr) || StringUtils.isBlank(rid) || StringUtils.isBlank(scategoryStr)){
            model.put("page", page);
            
            return "base/admin/authorize/chooseuserlist";
        }

        int rcategory = NumberUtils.toInt(rcategoryStr, -1);
        int scategory = NumberUtils.toInt(scategoryStr, -1);
        List<String> sidList = authorizeService.getSids(rcategory, rid, scategory);


        QueryCondition query = new QueryCondition();
        query.addFilter("id", sidList, Filter.OP_NOT_IN);
        query.addFilterEqual("domain", LoginSessionHelper.getCurrentDomain(req));

        if(StringUtils.isNotBlank(gender)){
            query.addFilterEqual("gender", gender);
        }
        if(StringUtils.isNotBlank(username)){
            query.addFilterLike("username", "%"+username+"%");
        }
        if(StringUtils.isNotBlank(name)) {
            query.addFilterLike("name", "%" + StringUtils.trim(name) + "%");
        }
        if(StringUtils.isNotBlank(orgname)){
            query.addFilterLike("organization.name", "%"+orgname+"%");
        }
        if(StringUtils.isNotBlank(label)){
        		query.addFilterLike("labels", String.format("%%%s%%", label));
        }
        
        query.addFilterEqual("isDel", User.ISDEL_NO);

        if(StringUtils.isNotBlank(orderField) && StringUtils.isNotBlank(orderDirection)){
            model.put("orderField", orderField);
            model.put("orderDirection", orderDirection);
            if(orderDirection.equals("_asc")){
                query.addSort(new Sort(orderField, Sort.ORDER_ASC));
            } else{
                query.addSort(new Sort(orderField, Sort.ORDER_DES));
            }
        } else{
            query.addSort(new Sort("createTime", Sort.ORDER_DES));
            model.put("orderField", "createTime");
            model.put("orderDirection", "_desc");
        }
        query.addFilterEqual("usertype", User.USER_TYPE_COMMON);
        ResultSet<User> res = userService.list(query, page);
        
        model.put("genderMap", User.GENDER_MAP);
        
        model.put("list", res.getItems());
        model.put("page", res.getPage());
        model.put("userids", userids);
        
        return "base/admin/authorize/chooseuserlist";
    }
    
    @RequestMapping("/delete")
    @ResponseBody
    public ModelMap delete(HttpServletRequest req, ModelMap model){
        String rcategoryStr = req.getParameter("rcategory");
        String rid = req.getParameter("rid");
        String scategoryStr = req.getParameter("scategory");
        String[] ids = req.getParameterValues("ids");

        int sucNO = 0;
        
        if(StringUtils.isBlank(rcategoryStr) || StringUtils.isBlank(rid) || StringUtils.isBlank(scategoryStr)){
            model.put("message", "删除失败，传入的信息有误！");
            model.put("flag", false);
            return model;
        }

        if(ArrayUtils.isEmpty(ids)){
            model.put("message", "删除失败，没有选择要删除的授权！");
            model.put("flag", false);
            return model;
        }
        
        for (String id : ids) {
            if(StringUtils.isNotBlank(id)){
                QueryCondition query = new QueryCondition();
                query.addFilterEqual("rcategory", rcategoryStr);
                query.addFilterEqual("rid", rid);
                query.addFilterEqual("scategory", scategoryStr);
                query.addFilterEqual("sid", id);
                
                ResultSet<Authorize> res = authorizeService.list(query);
                
                if(res!=null && null!=res.getItems() && 0!=res.getItems().size()){
                    authorizeService.delete(res.getItems().get(0));
                    sucNO++;
                }
            }
        }

        model.put("flag", true);
        model.put("message", "成功删除"+sucNO+"条授权信息！");
        return model;
    }
    
    @RequestMapping("/doadd")
    @ResponseBody
    public ModelMap doAdd(HttpServletRequest req, ModelMap model){
        String rcategoryStr = req.getParameter("rcategory");
        String rid = req.getParameter("rid");
        String scategoryStr = req.getParameter("scategory");
        
        if(StringUtils.isBlank(rcategoryStr) || StringUtils.isBlank(rid) || StringUtils.isBlank(scategoryStr)){
            model.put("message", "参数不能为空");
            model.put("flag", false);
            return model;
        }

        int scategory = NumberUtils.toInt(scategoryStr, -1);
        int rcategory = NumberUtils.toInt(rcategoryStr, -1);
        
        if(scategory == Authorize.S_CATEGORY_USER){
            String userids = req.getParameter("userids");
            if(StringUtils.isBlank(userids)){
                model.put("message", "授权失败，没有用户被授权！");
                model.put("flag", false);
                return model;
            }
            
            String[] ids = userids.split(",");
            if(ArrayUtils.isEmpty(ids)){
                model.put("message", "授权失败，没有用户被授权！");
                model.put("flag", false);
                return model;
            }
            
            for(String id: ids){
                if(StringUtils.isNotBlank(id)){
                    Authorize auth = new Authorize();
                    auth.setRcategory(rcategory);
                    auth.setRid(rid);
                    auth.setScategory(scategory);
                    auth.setSid(id);
                    auth.setDomain(LoginSessionHelper.getCurrentDomain(req));
                    authorizeService.insert(auth);
                }
            }
        } else if(scategory == Authorize.S_CATEGORY_ORG){
            String orgids = req.getParameter("orgids");
            String[] ids = orgids.split(",");
            for(String id: ids){
                Authorize auth = new Authorize();
                auth.setRcategory(rcategory);
                auth.setRid(rid);
                auth.setScategory(scategory);
                auth.setSid(id);
                auth.setDomain(LoginSessionHelper.getCurrentDomain(req));
                authorizeService.insert(auth);
            }
        }else if(scategory==Authorize.S_CATEGORY_GROUP){
        	String groupids=req.getParameter("groupids");
        	  if(StringUtils.isBlank(groupids)){
                  model.put("message", "授权失败，没有用户组被授权！");
                  model.put("flag", false);
                  return model;
              }
              
              String[] ids = groupids.split(",");
              if(ArrayUtils.isEmpty(ids)){
                  model.put("message", "授权失败，没有用户组被授权！");
                  model.put("flag", false);
                  return model;
              }
              
              for(String id: ids){
                  if(StringUtils.isNotBlank(id)){
                      Authorize auth = new Authorize();
                      auth.setRcategory(rcategory);
                      auth.setRid(rid);
                      auth.setScategory(scategory);
                      auth.setSid(id);
                      auth.setDomain(LoginSessionHelper.getCurrentDomain(req));
                      authorizeService.insert(auth);
                  }
              }
        }

        model.put("message", "授权成功！");
        model.put("flag", true);
        return model;
    }
    

	@RequestMapping("authorizegroup")
	public String authorizeGroup(HttpServletRequest request,ModelMap model){
		String ids=request.getParameter("ids");
		String rcategory=request.getParameter("rcategory");
		String scategory=request.getParameter("scategory");
		model.put("biaoji","piliang");
		model.put("ids",ids);
		model.put("rcategory",rcategory);
		model.put("scategory", scategory);
		if("2".equals(rcategory)){
			
			return "mgr/course/authorize";
			
		}else{
			
			return "mgr/itest/exam/authorize";
			
		}
	}
	
	private ResultSet<Authorize> getAuthorizes(String[] sids,int scategory,int rcategory,String domain){
		 QueryCondition conditions=new QueryCondition();
		 
		 conditions.addFilterEqual("domain",domain);
		 conditions.addFilterEqual("rcategory",rcategory);
		 conditions.addFilterEqual("scategory", scategory);
		 conditions.addFilter(new QueryFilter("sid",sids,Filter.OP_IN));
		 
		 ResultSet<Authorize> rs=this.authorizeService.list(conditions);
		 
		 return rs;
	}
	
	private void insertAuthorize(String sid,int rcategory,int scategory,String domain,String rid){
		 Authorize auth = new Authorize();
         auth.setRcategory(rcategory);
         auth.setRid(rid);
         auth.setScategory(scategory);
         auth.setSid(sid);
         auth.setDomain(domain);
        this.authorizeService.insert(auth);
	}
	
	private boolean authorize(String idstr,int scategory,int rcategory,String domain,String[] rids){
		 if(StringUtils.isBlank(idstr)){
			 return false;
		 }
		 
		 String[] ids=idstr.split(",");
		 if(ArrayUtils.isEmpty(ids)){
			 return false;
		 }
		 
		 ResultSet<Authorize> rs=getAuthorizes(ids,scategory,rcategory,domain);
         
		 List<Authorize> authorizes=Lists.newArrayList();
		 
		 if(rs!=null && rs.getItems()!=null && rs.getItems().size()>0){
			 authorizes=rs.getItems();
		 }
		 for(String id:ids){
			 
			 List<Authorize> list=Lists.newArrayList();
			 if(authorizes.size()>0){
				//得到用户授权的列表
				 for(Authorize authorize:authorizes){
					 if(authorize.getSid().equals(id)){
						list.add(authorize); 
					 }
				 }
			 }
			 if(list.size()>0){
				 //循环判断课程是否授权给该用户
				 for(String ridstr:rids){
					 boolean flag=false;
					 for(Authorize authorize:list){
						 if(authorize.getRid().equals(ridstr)){
							 flag=true;
							 break;
						 }
					 }
					 //课程没有授权过
					 if(!flag){
						 insertAuthorize(id, rcategory, scategory, domain, ridstr);
					 }
				 }
			 }else{
				 for(String ridstr:rids){
					 insertAuthorize(id, rcategory, scategory, domain, ridstr);
				 }
			 }

		 }
		return true;
	}
	
	@RequestMapping("authorizes")
	@ResponseBody
	public boolean authorizes(HttpServletRequest request){
		String rid=request.getParameter("ids");
		String scategoryStr=request.getParameter("scategory");
		String rcategoryStr=request.getParameter("rcategory");
		String domain=LoginSessionHelper.getCurrentDomain(request);
		 
		if(StringUtils.isBlank(rid) || StringUtils.isBlank(scategoryStr) || StringUtils.isBlank(scategoryStr)){
			return false;
		}
		
		int scategory = NumberUtils.toInt(scategoryStr, -1);
        int rcategory = NumberUtils.toInt(rcategoryStr, -1);
		//待授权资源数组
		String[] rids=rid.split(",");
		
		if(ArrayUtils.isEmpty(rids)){
			return false;
		}
		
		if(scategory == Authorize.S_CATEGORY_USER){//用户授权
			//得到要授权的用户id
			 String useridStr = request.getParameter("userids");
			 
			 return authorize(useridStr, scategory, rcategory, domain, rids);
			 
		}else if(scategory==Authorize.S_CATEGORY_ORG){//组织授权
			 String orgidStr = request.getParameter("orgids");
			 
			 return authorize(orgidStr, scategory, rcategory, domain, rids);

		}else if(scategory==Authorize.S_CATEGORY_JOBLEVEL){//职级授权
			
			String joblevelStr=request.getParameter("joblevels");
			
			return authorize(joblevelStr, scategory, rcategory, domain, rids);
			
		}else if(scategory==Authorize.S_CATEGORY_DOMAIN){//域授权
			
		}
		return false;
	}
    
    
    private String getJobLevelRootId(HttpServletRequest req) {
		return JobLevelController.getJobLevelRootId(req);
	}
}


