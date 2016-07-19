package com.longtime.ajy.api.vo;

import java.math.BigDecimal;

import com.longtime.ajy.model.Course;
import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CourseListVo extends Course {

    private static Logger     logger           = LoggerFactory.getLogger(CourseListVo.class);

    private static final long serialVersionUID = 1L;

    public CourseListVo(){

    }

    public CourseListVo(Course course){
        try {
            if(course.getLength()==null){
                course.setLength(new BigDecimal(0)); // fix org.apache.commons.beanutils.ConversionException: No value specified
            }
            BeanUtils.copyProperties(this, course);
        } catch (Exception e) {
            logger.error("form course copy properties to courselistvo due to error.", e);
        }
    }

    public int commentnum = 0; // 评论数

    public int likenum = 0;   // 赞数

    public int getCommentnum() {
        return commentnum;
    }

    public void setCommentnum(int commentnum) {
        this.commentnum = commentnum;
    }

    public int getLikenum() {
        return likenum;
    }

    public void setLikenum(int likenum) {
        this.likenum = likenum;
    }

    public static void main(String[] args) {
        
        Course course = new Course();
        
        CourseListVo v = new CourseListVo(course);
        
    }
}
