package com.longtime.app.base.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.base.model.JobLevelEntity;
import com.longtime.app.base.model.JobLevelEntityVo;
import com.longtime.app.base.service.JobLevelService;
import com.longtime.common.utils.LoginSessionHelper;

import net.sf.json.JSONArray;

@Repository
@RequestMapping("/base/admin/joblevel/")
public class JobLevelController {
	
	private static final Logger logger = LoggerFactory.getLogger(JobLevelController.class);
	
	@Resource
	private JobLevelService jobLevelService;
	
	
	
	@RequestMapping("/index")
     public String joblevel(HttpServletRequest request,ModelMap model){
		
		String id=request.getParameter("id");
		//根
		String rootId = getJobLevelRootId(request);
		
		String domain=LoginSessionHelper.getCurrentDomain(request);
		
		JobLevelEntity jobLevelEntity=this.jobLevelService.getRoot(rootId);
		
		if(jobLevelEntity==null){
			this.jobLevelService.initTree(rootId, domain);
			jobLevelEntity=this.jobLevelService.getRoot(rootId);
		}
		
		List<JobLevelEntityVo> jobLevelEntityVos=this.jobLevelService.getJobLevelEntityVos(rootId,id,domain);
		
        JSONArray array = JSONArray.fromObject(jobLevelEntityVos);
		
		model.put("tree", array.toString());
    	return "base/admin/joblevel/joblevel";
     }
	/**
	 * 得到详情
	 * @param request
	 * @return
	 */
	@RequestMapping(value="detail",method=RequestMethod.POST)
	@ResponseBody
	public JobLevelEntity detail(HttpServletRequest request){
		String id=request.getParameter("treeId");
		if(StringUtils.isBlank(id)){
			id=getJobLevelRootId(request);
		}
		
		JobLevelEntity jobLevelEntity=this.jobLevelService.get(id);
		
		jobLevelEntity.setLeaf(jobLevelEntity.isLeaf());
		
		jobLevelEntity.setChildren(null);
		
		return jobLevelEntity;
	}
	
	@RequestMapping(value="insert",method=RequestMethod.POST)
	@ResponseBody
	public ModelMap insert(HttpServletRequest request,ModelMap model){
		String name = request.getParameter("name");
		String remark = request.getParameter("remark");
		String parentId = request.getParameter("parentId");
		String domain=LoginSessionHelper.getCurrentDomain(request);
		
		boolean isUniqueness = this.jobLevelService.judge(parentId, name, domain);
		if (!isUniqueness) {
		 	model.put("flag", false);
	        model.put("message", "添加失败，同一目录下的职称名称必须唯一 ！");
	        return model;
		}
		
		JobLevelEntity jobLevelEntity=new JobLevelEntity();
		jobLevelEntity.setName(name);
		jobLevelEntity.setRemark(remark);
		jobLevelEntity.setDomain(domain);
		this.jobLevelService.insert(jobLevelEntity,parentId);
		
		model.put("id", jobLevelEntity.getId());
        model.put("flag", true);
        model.put("message", "添加成功 ！");
	    
        return model;
		
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
    @ResponseBody
    public ModelMap update(HttpServletRequest request,ModelMap model){
		String jobLevelId = request.getParameter("update_parentId");
		String name = request.getParameter("name");
		String remark = request.getParameter("remark");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		
		JobLevelEntity jobLevelEntity = this.jobLevelService.get(jobLevelId);
		
		if (StringUtils.isNotEmpty(jobLevelEntity.getParentId()) && StringUtils.isNotBlank(name) && !name.equals(jobLevelEntity.getName())) {
			boolean isUniqueness = this.jobLevelService.judge(jobLevelEntity.getParentId(), name, domain);
			if(!isUniqueness){
				model.put("flag", false);
	            model.put("message", "修改失败，同一目录下的职称名称必须唯一 ！！");
	            return model;
			}
		}

        if(jobLevelEntity.isSystemType()){
            model.put("flag", false);
            model.put("message", "该节点类型为系统节点，不能修改！");
            model.put("id",jobLevelEntity);
            return model;
        }
		
		jobLevelEntity.setName(name);
		jobLevelEntity.setRemark(remark);
		
		this.jobLevelService.update(jobLevelEntity);

        model.put("flag", true);
        model.put("message", "修改成功！");
        model.put("id",jobLevelId);
		return model;
	}
	
	@RequestMapping("/delete")
    @ResponseBody
    public ModelMap delete(HttpServletRequest request ,ModelMap model){
		//要删除的id
		String jobLevelId = request.getParameter("delete_id");
		
		//父节点id
		String parentId = request.getParameter("delete_parentId");
		
		//判断是否有子节点
		JobLevelEntity jobLevelEntity=this.jobLevelService.get(jobLevelId);
		
		jobLevelEntity.setIsdel(1);
		
		if(!jobLevelEntity.isLeaf() || jobLevelEntity.isSystemType()){
            model.put("flag", false);
            model.put("message", "该节点类型为父节点或系统节点，不能删除！");
            model.put("id",jobLevelId);
            return model;
		}
        jobLevelService.remove(jobLevelId);
        model.put("flag", true);
        model.put("message", "删除成功！");
        model.put("id", parentId);
        return model;
	}
	
	@RequestMapping(value="getJobLevels")
	@ResponseBody
	public JSONArray getJobLevels(HttpServletRequest request,ModelMap model){
		String id = request.getParameter("treeId");
		String rootId = getJobLevelRootId(request);
		String domain=LoginSessionHelper.getCurrentDomain(request);
		List<JobLevelEntityVo> list=this.jobLevelService.getJobLevelEntityVos(rootId,id,domain);
		
		JSONArray array = JSONArray.fromObject(list);
		
		model.put("jobLevelTree", array.toString());
		
		return array;
	}
	
	
	@RequestMapping(value="judge_uniqueness")
	@ResponseBody
	public boolean judge(HttpServletRequest request,ModelMap model){
		
		return false;
	}
	public static String getJobLevelRootId(HttpServletRequest req) {
		return String.format("joblevel_%s", LoginSessionHelper.getCurrentDomain(req));
	}
}
