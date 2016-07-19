package com.longtime.ajy.model;

import com.longtime.common.model.Entity;

public class CourseCategory implements Entity<String> {

    private static final long serialVersionUID = -3744182109644137393L;
 
    private String            id;

    private String            domain;

    private String            app;                                            // 组织代码

    private String            name;                                          // 权限名称

    private String            remark;                                        // 备注

    private String            parent_id;

    private int               depth;                                         // 深度

    private int               is_leaf          = CourseCategory.IS_LEAF_YES; // 是否是叶节点

    private Integer           left_weight      = 0;

    private Integer           right_weight     = 0;

    private int               system_type      = CourseCategory.IS_SYSTEM_NO; // 系统类型初始化数据为true 不能删除

    private int               is_del           = CourseCategory.IS_DEL_NO;   // 删除标记：0.未删除；1.已删除

    private String            status;                                         // 状态标识

    private String            creater;

    private Long              create_time      = 0L;

    private String            updater;

    private Long              update_time      = 0L;

    /** 未删除 */
    public static int         IS_DEL_NO        = 0;

    /** 已删除 */
    public static int         IS_DEL_YES       = 1;

    /** 不是叶子节点 */
    public static int         IS_LEAF_NO       = 0;

    /** 是叶子节点 */
    public static int         IS_LEAF_YES      = 1;

    /** 不是系统初始化数据 */
    public static int         IS_SYSTEM_NO     = 0;

    /** 是系统初始化数据 */
    public static int         IS_SYSTEM_YES    = 1;
    
    /**
     * courseNum
     */
    private int courseNum;


	public int getCourseNum() {
		return courseNum;
	}

	public void setCourseNum(int courseNum) {
		this.courseNum = courseNum;
	}

	@Override
    public String getId() {
        return this.id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getApp() {
        return app;
    }

    public void setApp(String app) {
        this.app = app;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getParent_id() {
        return parent_id;
    }

    public void setParent_id(String parent_id) {
        this.parent_id = parent_id;
    }

    public int getDepth() {
        return depth;
    }

    public void setDepth(int depth) {
        this.depth = depth;
    }

    public int getIs_leaf() {
        return is_leaf;
    }

    public void setIs_leaf(int is_leaf) {
        this.is_leaf = is_leaf;
    }

    public Integer getLeft_weight() {
        return left_weight;
    }

    public void setLeft_weight(Integer left_weight) {
        this.left_weight = left_weight;
    }

    public Integer getRight_weight() {
        return right_weight;
    }

    public void setRight_weight(Integer right_weight) {
        this.right_weight = right_weight;
    }

    public int getSystem_type() {
        return system_type;
    }

    public void setSystem_type(int system_type) {
        this.system_type = system_type;
    }

    public int getIs_del() {
        return is_del;
    }

    public void setIs_del(int is_del) {
        this.is_del = is_del;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }

    public long getCreate_time() {
        return create_time;
    }

    public void setCreate_time(long create_time) {
        this.create_time = create_time;
    }

    public String getUpdater() {
        return updater;
    }

    public void setUpdater(String updater) {
        this.updater = updater;
    }

    public long getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(long update_time) {
        this.update_time = update_time;
    }

}
