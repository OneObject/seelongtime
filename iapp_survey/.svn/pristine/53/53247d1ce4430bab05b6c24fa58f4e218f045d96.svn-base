package com.longtime.app.base.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.longtime.ajy.support.bean.Step;
import com.longtime.app.base.model.AttachmentEntity;
import com.longtime.app.base.model.Authorize;
import com.longtime.app.base.model.ResourceEntity;
import com.longtime.app.base.service.AttachmentService;
import com.longtime.app.base.service.ResourceService;
import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.step.model.StepRelation;
import com.longtime.app.step.service.StepRelationService;
import com.longtime.app.util.Constants;
import com.longtime.app.util.PageUtil;
import com.longtime.app.util.PathUtil;
import com.longtime.common.utils.HtmlUtils;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;
import com.longtime.common.utils.Sort;

@Controller
@RequestMapping("/base/admin/resource/")
public class ResourceController {
      
	@Resource(name="resourceService")
	private ResourceService resourceService;
	
	@Resource(name="attachmentService")
	private AttachmentService attachmentService;
	
	@Resource
	private FodderService fodderService;
	
	@Resource
	private StepRelationService stepRelationService;
	
	private static int EXT_RESOURCE_STEP = 3;
	/**
     * 管理
     * @param req
     * @param model
     * @return
     */
    @RequestMapping("resource")
    public String itemblank(HttpServletRequest req, ModelMap model) {
        return "base/admin/ext/resource";
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
		query.addSort(new Sort("releasetime",Sort.ORDER_DES));
		if(StringUtils.isNotBlank(searchContent)){
			query.addFilterLike("title", "%"+searchContent+"%");
		}
		ResultSet<ResourceEntity> rs = this.resourceService.list(query, page);
	
		model.put("page", rs.getPage());
		model.put("list",rs.getItems() );
		
		return "base/admin/ext/list";
	}
	
	/**
	 * 第一步
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("step1")
	public String step1(HttpServletRequest request, ModelMap modelMap) {
		Map<String, String> map = fodderService.getRequiredParams();
		String uptoken = map.get("uploadToken");
		String id = request.getParameter("id");
		if (StringUtils.isNotBlank(id)) {
			ResourceEntity entity = this.resourceService.get(id);
			AttachmentEntity attach = attachmentService.get(entity.getResid());
			modelMap.put("attach", attach);
			modelMap.put("entity", entity);
			modelMap.put("id", id);
		}
		modelMap.put("stepStatus",
				getStepStatus(id, LoginSessionHelper.getCurrentDomain(request)));
		modelMap.put("uptoken", uptoken);
		return "base/admin/ext/step1";
	}
	
	
	/**
     * 接收文件上传
     * @param req
     * @param model
     * @return
     */
    @RequestMapping(value="savefiles", method=RequestMethod.POST)
    @ResponseBody
    public ModelMap saveFiles(HttpServletRequest request, ModelMap model) {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest.getFile("file");
        if(null == file){
            model.put("flag", false);
            model.put("message", "没有选择文件！");
            return model;
        }
        

        String originalFilename = HtmlUtils.getAvailableString(file.getOriginalFilename());
        String suffix = "";
        String id ="";
        suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
       try {
           //保存文件
        	
           String relativePath = String.format("%s%s/%s",Constants.IMPORT_EXT_FILE_PATH,System.currentTimeMillis(),file.getOriginalFilename());
           @SuppressWarnings("deprecation")
			String path = String.format("%s%s",
				request.getRealPath("/"),relativePath);
           			path = PathUtil.getProperPath(path);
            
            File d = new File(path);
            if(d.isDirectory() && !d.exists()){
                d.mkdirs();
            }
            
            FileUtils.copyInputStreamToFile(file.getInputStream(),new File(path));
            AttachmentEntity entity = new AttachmentEntity();
            entity.setIsdel(0);
            entity.setModule("ext");
            entity.setName(originalFilename);
            entity.setPath(relativePath);
            entity.setSuffix(suffix);
            entity.setSize(file.getSize());
            id = this.attachmentService.insert(entity);
        } catch (Exception e) {
            model.put("flag", false);
           model.put("message", "上传课件过程中出现异常！");
            return model;
        }

        model.put("id", id);
        model.put("flag", true);
        model.put("message", "上传成功！");
        return model;
    }
    
    /**
	 * 添加课程信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "savestep1", method = RequestMethod.POST)
	@ResponseBody
	public String savestep1(HttpServletRequest request) {

		String id = request.getParameter("id");
		String resid = request.getParameter("resid");
		String title = request.getParameter("title");
		String remark = request.getParameter("remark");
		String cover = request.getParameter("cover");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		if (StringUtils.isBlank(id)) {
			ResourceEntity entity = new ResourceEntity();
			if (StringUtils.isNotBlank(cover)) {
				entity.setCover(cover);
			}
			if (StringUtils.isNotBlank(remark)) {
				entity.setRemark(remark);
			}
			entity.setCreatetime(System.currentTimeMillis());
			entity.setResid(resid);
			entity.setTitle(title);
			entity.setIsdel(0);
			entity.setDomain(domain);
			id = this.resourceService.insert(entity);
		}else{
			ResourceEntity entity = this.resourceService.get(id);
			if (StringUtils.isNotBlank(cover)) {
				entity.setCover(cover);
			}
			if (StringUtils.isNotBlank(remark)) {
				entity.setRemark(remark);
			}
			entity.setModifytime(System.currentTimeMillis());
			entity.setResid(resid);
			entity.setTitle(title);
			this.resourceService.update(entity);
		}

		completeStep(1, id,LoginSessionHelper.getCurrentDomain(request));
		return id;
	}
	
	@RequestMapping(value = "savestep2", method = RequestMethod.POST)
	@ResponseBody
	public String savestep2(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		String openstatus = request.getParameter("openstatus");
		ResourceEntity entity = this.resourceService.get(id);
		entity.setOpenstatus(Integer.valueOf(openstatus));
		this.resourceService.update(entity);
		completeStep(2, id,LoginSessionHelper.getCurrentDomain(request));
		return id;
		
	}
	
	@RequestMapping(value = "savestep3", method = RequestMethod.POST)
	@ResponseBody
	public String savestep3(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		String release = request.getParameter("release");
		ResourceEntity entity = this.resourceService.get(id);
		entity.setReleasestatus(Integer.valueOf(release));
		if ("1".equals(release)) {
			entity.setReleasetime(System.currentTimeMillis());
		}
		this.resourceService.update(entity);
		completeStep(3, id,LoginSessionHelper.getCurrentDomain(request));
		return id;
		
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public String delete(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		ResourceEntity entity = this.resourceService.get(id);
			entity.setIsdel(1);
		this.resourceService.update(entity);
		completeStep(3, id,LoginSessionHelper.getCurrentDomain(request));
		return id;
		
	}
	
	/**
	 * 第二步
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("step2")
	public String step2(HttpServletRequest request, ModelMap model) {
		String id = request.getParameter("id");
		if (StringUtils.isBlank(id)) {
			return "redirect:step1.xhtml";
		}
		ResourceEntity entity = this.resourceService.get(id);
		model.put("entity", entity);
		model.put("rid", id);
		model.put("rcategory", Authorize.R_EXT_RESOURCE);
		model.put("scategory", Authorize.S_CATEGORY_USER);
		model.put("domain", LoginSessionHelper.getCurrentDomain(request));
		model.put("id", id);
		model.put("stepStatus",getStepStatus(id, LoginSessionHelper.getCurrentDomain(request)));
		return "base/admin/ext/step2";
	}
	
	/**
	 * 第三步
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("step3")
	public String step3(HttpServletRequest request, ModelMap model) {
		String id = request.getParameter("id");
		if (StringUtils.isBlank(id)) {
			return "redirect:step1.xhtml";
		}

		ResourceEntity entity = this.resourceService.get(id);
		model.put("id", entity.getId());
		model.put("stepStatus",
				getStepStatus(id, LoginSessionHelper.getCurrentDomain(request)));
		return "base/admin/ext/step3";
	}

	
	
	private Map<String, Boolean> getStepStatus(String sid, String domain) {
		StepRelation stepRelation = this.stepRelationService.findBySid(sid,
				StepRelation.TYPE_EXT_RESOURCE, domain);
		if (stepRelation == null) {
			return new HashMap<String, Boolean>();
		}
		int value = stepRelation.getStep();
		Map<String, Boolean> stepStatus = new HashMap<String, Boolean>();
		Step step = Step.from(value);
		for (int i = 1; i <= EXT_RESOURCE_STEP; i++) {
			stepStatus.put(String.valueOf(i), step.isDo(i));
		}
		stepStatus.put("all", step.idDoAll(EXT_RESOURCE_STEP));
		return stepStatus;
	}
	
	private boolean completeStep(int step, String sid, String domain) {
		this.stepRelationService.completeStep(step, sid, domain,
				StepRelation.TYPE_EXT_RESOURCE);
		return true;
	}
	
}
