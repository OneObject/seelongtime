package com.longtime.app.admin.chapter.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;

/**
 * 章节
 * @author liuxl
 * @date 2013-12-23 15:05:13
 */
@Entity
@Table(name = "study_courseware_chapter")
public class Chapter extends BaseModel<String>  {

    private static final long serialVersionUID = 4248300720885428700L;

    @Id
    @GeneratedValue(generator = "hibernate-uuid")
    @GenericGenerator(name = "hibernate-uuid", strategy = "uuid")
    @Column(length = 40)
    private String id;  //primary key

    @Column(name="parent_id")
    private String parentId;//父id
    
    @Column(name="courseware_id")
    private String coursewareId;//所属课件
    
    private String location;//章节路径
    
    private String content;//目录名称
    
    private String remark;
    
    private String chapterDTOidentifier;    //为了到数据库查找方便上一章节方便

    @Column(name="chapterDTOparent_id")
    private String chapterDTOparentId; //为了到数据库查找方便上一章节方便

    
    
    @Column(name="is_del")
    private String isDel = Chapter.IS_DEL_NO;    //删除标记：0.未删除；1.已删除
    /** 未删除 */
    public static String IS_DEL_NO = "0";
    /** 已删除 */
    public static String IS_DEL_YES = "1";
    
    private String creater;

    @Column(name="create_time")
    private long createTime;
    
    private String updater;

    @Column(name="update_time")
    private long updateTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getCoursewareId() {
        return coursewareId;
    }

    public void setCoursewareId(String coursewareId) {
        this.coursewareId = coursewareId;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getChapterDTOidentifier() {
        return chapterDTOidentifier;
    }

    public void setChapterDTOidentifier(String chapterDTOidentifier) {
        this.chapterDTOidentifier = chapterDTOidentifier;
    }

    public String getChapterDTOparentId() {
        return chapterDTOparentId;
    }

    public void setChapterDTOparentId(String chapterDTOparentId) {
        this.chapterDTOparentId = chapterDTOparentId;
    }

    public String getIsDel() {
        return isDel;
    }

    public void setIsDel(String isDel) {
        this.isDel = isDel;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }

    public long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(long createTime) {
        this.createTime = createTime;
    }

    public String getUpdater() {
        return updater;
    }

    public void setUpdater(String updater) {
        this.updater = updater;
    }

    public long getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(long updateTime) {
        this.updateTime = updateTime;
    }
    
    
   

}
