package com.longtime.app.ixin.vo;

import java.util.List;

import com.longtime.app.ixin.mgr.model.AutoResponseRule;

public class AutoResponseRuleVO {
    private String id;
    private String domain;
    private String name;
    private List<String> keywords;
    private int responseAll = AutoResponseRule.RESPONSE_ALL_NO;
    private List<String> matterIds;
    private String creater;
    private Long createTime;
    private String updater;
    private Long updateTime;
    private String type;
    private String content;
    private int matchAll = AutoResponseRule.MATCH_ALL_NO;
    
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
    public List<String> getKeywords() {
        return keywords;
    }
    public void setKeywords(List<String> keywords) {
        this.keywords = keywords;
    }
    public String getCreater() {
        return creater;
    }
    public void setCreater(String creater) {
        this.creater = creater;
    }
    public String getUpdater() {
        return updater;
    }
    public void setUpdater(String updater) {
        this.updater = updater;
    }
    public Long getCreateTime() {
        return createTime;
    }
    public void setCreateTime(Long createTime) {
        this.createTime = createTime;
    }
    public Long getUpdateTime() {
        return updateTime;
    }
    public void setUpdateTime(Long updateTime) {
        this.updateTime = updateTime;
    }
    public List<String> getMatterIds() {
        return matterIds;
    }
    public void setMatterIds(List<String> matterIds) {
        this.matterIds = matterIds;
    }
    public int getResponseAll() {
        return responseAll;
    }
    public void setResponseAll(int responseAll) {
        this.responseAll = responseAll;
    }
    public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getMatchAll() {
        return matchAll;
    }
    public void setMatchAll(int matchAll) {
        this.matchAll = matchAll;
    }
}
