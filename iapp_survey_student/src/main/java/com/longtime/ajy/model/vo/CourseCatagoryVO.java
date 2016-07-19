package com.longtime.ajy.model.vo;


import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.Lists;
import com.longtime.ajy.model.CourseCategory;


public class CourseCatagoryVO extends CourseCategory {
    private static final long serialVersionUID = 4476610471351402406L;
    
    private static Logger logger = LoggerFactory.getLogger(CourseCatagoryVO.class);
    private List<CourseCatagoryVO> childrens = Lists.newArrayList();
    

    public List<CourseCatagoryVO> getChildrens() {
        return childrens;
    }

    public void addChildren(CourseCatagoryVO children){
        this.childrens.add(children);
    }
    
	public CourseCatagoryVO(){
        
    }
    
    public CourseCatagoryVO(CourseCategory root){
        try {
            BeanUtils.copyProperties(this, root);
        } catch (Exception e) {
            logger.error(String.format("bean copy due to fail. soucebean=[%s]", root),e);
        }
    }   
    public CourseCatagoryVO(CourseCategory root,List<CourseCategory> list){
        try {
            BeanUtils.copyProperties(this, root);
        } catch (Exception e) {
            logger.error(String.format("bean copy due to fail. soucebean=[%s]", root),e);
        }
        
        for (CourseCategory courseCategory : list) {
            
            if(this.getId().equals(courseCategory.getParent_id())){
                
                CourseCatagoryVO children = new CourseCatagoryVO(courseCategory, list);
                this.addChildren(children);
            }
        }
    }   
    
    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE, false)
            .concat(String.format("@hashCode=%s", this.hashCode()));
    }
    
    public static void main(String[] args) {
        CourseCategory r = new CourseCategory();
        r.setId("1");
        
        CourseCategory l_1 = new CourseCategory();
        l_1.setId("1_1");
        l_1.setParent_id("1");
        CourseCategory l_2 = new CourseCategory();
        l_2.setId("1_2");
        l_2.setParent_id("1");
        
        
        CourseCategory l_1_1 = new CourseCategory();
        l_1_1.setId("1_1_1");
        l_1_1.setParent_id("1_1");
        CourseCategory l_1_2 = new CourseCategory();
        l_1_2.setId("1_1_2");
        l_1_2.setParent_id("1_1");
        
        
        
        List<CourseCategory> list = Lists.newArrayList(l_1,l_2,l_1_1,l_1_2);
      
        CourseCatagoryVO vo = new CourseCatagoryVO(r,list);
        
        System.out.println(vo);
        
        
    }
    
}
