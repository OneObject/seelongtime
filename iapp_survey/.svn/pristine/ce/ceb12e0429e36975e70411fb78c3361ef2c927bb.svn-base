package com.longtime.app.ixin.mgr.model;


public class CustomMenu {
    public static final String root_id = "723fed54-5791-4e7c-986a-dc20cc124ecb";
    
    private String id;
    private String domain;
    private String name;
    private int type = CustomMenu.MENU_TYPE_CLICK;
    private String keycode;
    private String linkurl;
    private String refoptionname; //关联功能模块或特定实体（如某个活动／投票）的名称

    /** 以下字段为左右值无限分类法属性 */
    private String parentId;    
    private int depth;      // 深度
    private int isLeaf = CustomMenu.IS_LEAF_YES;  //是否是叶节点
    private Integer leftWeight = 0 ;
    private Integer rightWeight = 0;
    
    private int isdel = CustomMenu.IS_DEL_NO;
    private String creater;
    private Long createTime;
    private String updater;
    private Long updateTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }


    public String getKeycode() {
        return keycode;
    }

    public void setKeycode(String keycode) {
        this.keycode = keycode;
    }


    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public int getDepth() {
        return depth;
    }

    public void setDepth(int depth) {
        this.depth = depth;
    }

    public int getIsLeaf() {
        if(this.rightWeight-this.leftWeight == 1){
            return CustomMenu.IS_LEAF_YES;
        }
        return CustomMenu.IS_LEAF_NO;
    }
    
    public boolean isLeaf(){
        return this.getIsLeaf() == CustomMenu.IS_LEAF_YES;
    }

    public void setIsLeaf(int isLeaf) {
        this.isLeaf = isLeaf;
    }

    public Integer getLeftWeight() {
        return leftWeight;
    }

    public void setLeftWeight(Integer leftWeight) {
        this.leftWeight = leftWeight;
    }

    public Integer getRightWeight() {
        return rightWeight;
    }

    public void setRightWeight(Integer rightWeight) {
        this.rightWeight = rightWeight;
    }

    public int getIsdel() {
        return isdel;
    }

    public void setIsdel(int isdel) {
        this.isdel = isdel;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }

    public Long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Long createTime) {
        this.createTime = createTime;
    }

    public String getUpdater() {
        return updater;
    }

    public void setUpdater(String updater) {
        this.updater = updater;
    }

    public Long getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Long updateTime) {
        this.updateTime = updateTime;
    }

    public String getLinkurl() {
        return linkurl;
    }

    public void setLinkurl(String linkurl) {
        this.linkurl = linkurl;
    }
    
    public String getRefoptionname() {
		return refoptionname;
	}

	public void setRefoptionname(String refoptionname) {
		this.refoptionname = refoptionname;
	}



	/** 未删除 */
    public static int IS_DEL_NO = 0;
    /** 已删除 */
    public static int IS_DEL_YES = 1;
    
    /** 内容－事件 */
    public static int MENU_TYPE_CLICK = 0;
    /** 链接 */
    public static int MENU_TYPE_VIEW = 1;
    /**内容－链接*/
    public static int MENU_TYPE_CONTENT_VIEW = 2;
    
    /** 不是叶子节点 */
    public static int IS_LEAF_NO = 0;
    /** 是叶子节点 */
    public static int IS_LEAF_YES = 1;
}
