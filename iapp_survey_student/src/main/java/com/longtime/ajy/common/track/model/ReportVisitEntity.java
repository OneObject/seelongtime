package com.longtime.ajy.common.track.model;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;

import com.longtime.common.model.Entity;
import com.longtime.common.utils.DateUtils;

import freemarker.cache.StrongCacheStorage;


public class ReportVisitEntity implements Entity<String>{


    /**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	private String id;
    
    private String model; 
    
    private String domain;
    
    private Long value;
    
    private String unit;
    
    private String time;
    
    private Long timestamp;
    
    private Long createtime;
    
    private String rid;
    
    
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public Long getValue() {
		return value;
	}

	public void setValue(Long value) {
		this.value = value;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Long getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Long timestamp) {
		this.timestamp = timestamp;
	}

	public Long getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Long createtime) {
		this.createtime = createtime;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	
	public static class Builder{
		
		public static ReportVisitEntity  build(UserTrackModel userTrackModel){
			
			if(null==userTrackModel){
				return null;
			}
			
			String model = null; 
			switch (userTrackModel.getModel()) {
				case "fodder":
					model="fodder_detail_pv";
					break;
				case "course":
					model="course_detail_pv";
					break;
				case "question":
                    model="question_detail_pv";
                    break;
				default:
					return null;
			}
			
			if(StringUtils.isBlank(model)){
				return null;
			}
			ReportVisitEntity entity = new ReportVisitEntity();
			entity.setDomain(userTrackModel.getDomain());
			entity.setTimestamp(DateUtils.getTodayStartTime());
			entity.setTime(new DateTime(DateUtils.getTodayStartTime()).toString("yyyyMMdd"));
			entity.setModel(model);
			if (StringUtils.isNotBlank(userTrackModel.getRid())) {
				entity.setRid(userTrackModel.getRid());
			}
			entity.setUnit("day");
			return entity;
		}
		
		
	}
	
	
	
	


}
