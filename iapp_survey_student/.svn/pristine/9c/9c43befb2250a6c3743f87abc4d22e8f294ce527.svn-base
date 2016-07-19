/**
 * 
 */
package com.longtime.ajy.model;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import com.longtime.common.model.BaseEntity;

/**
 * 课件实体
 */
public class Courseware extends BaseEntity<String>{

	private static final long serialVersionUID = 891714725334300078L;

	/**
     * 主键
     */
    private String id ;//主键
    
    private String domain;//域
    
    private String app ;//组织代码
    
    /*
     * 业务相关
     */
    private String name;// 课件名称 
    private String path;// 文件路径 
    private String type;//文件格式 
    
    private BigDecimal size;// 文件大小 
    private BigDecimal length;//课件总时间长
    private String remark;// 备注 
    
    private String start_page;//起始页面
    
    private String filemanager_id;//课件路径

    private String item_path;//课件路径
    
    /*课件是否是scrom标准类型
     *  1:scrom标准 0：非scrom标准
     * */
    private String ware_type;

    private String isdel = ISDEL_NO ;//是否删除
    
    private String status;//状态标识
    
    private String creater;

    private long create_time;
    
    private String updater;

    private long update_time;

    /** 未删除 */
    public static String ISDEL_NO = "0";
    /** 已删除 */
    public static String ISDEL_YES = "1";
    
    public static String WARETYPE_SCROM = "1";
    public static String WARETYPE_NOSCORM = "2";
    public static Map<String, String> wareTypeMap = new HashMap<String, String>();
    static {
        wareTypeMap.put(WARETYPE_SCROM, "scrom标准");
        wareTypeMap.put(WARETYPE_NOSCORM, "非scrom标准");
    }
    
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
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public BigDecimal getSize() {
		return size;
	}
	public void setSize(BigDecimal size) {
		this.size = size;
	}
	public BigDecimal getLength() {
		return length;
	}
	public void setLength(BigDecimal length) {
		this.length = length;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getStart_page() {
		return start_page;
	}
	public void setStart_page(String start_page) {
		this.start_page = start_page;
	}
	public String getFilemanager_id() {
		return filemanager_id;
	}
	public void setFilemanager_id(String filemanager_id) {
		this.filemanager_id = filemanager_id;
	}
	public String getItem_path() {
		return item_path;
	}
	public void setItem_path(String item_path) {
		this.item_path = item_path;
	}
	public String getWare_type() {
		return ware_type;
	}
	public void setWare_type(String ware_type) {
		this.ware_type = ware_type;
	}
	public String getIsdel() {
		return isdel;
	}
	public void setIsdel(String isdel) {
		this.isdel = isdel;
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
