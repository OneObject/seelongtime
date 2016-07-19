package com.longtime.ajy.model;

import java.math.BigDecimal;
import java.text.NumberFormat;

import org.apache.commons.lang3.math.NumberUtils;

import com.longtime.common.model.BaseEntity;

public class ReadRate extends BaseEntity<String>{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

    private String id;

    private String domain;
    
    private String orgname;
    
    private String orgid;
    
    private Long complete;
      
    private Long total;
    
    private Long createtime;
    
    
    
    public String getPercent(){
    	String s = String.valueOf(getTop());
    	return (s+"%");
    }
    
    
    public int getTop(){
    	BigDecimal c = new BigDecimal(getComplete());
    	BigDecimal t = new BigDecimal(getTotal());
    	BigDecimal p = c.divide(t, 2, BigDecimal.ROUND_HALF_EVEN);
    	return p.multiply(new BigDecimal(100)).intValue();
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

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getOrgid() {
		return orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}

	public Long getComplete() {
		return complete;
	}

	public void setComplete(Long complete) {
		this.complete = complete;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	public Long getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Long createtime) {
		this.createtime = createtime;
	}
	
}
