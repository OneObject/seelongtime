package com.longtime.app.base.model;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import com.longtime.common.model.BaseModel;

@Entity
@Table(name="ixin_feed_back")
public class FeedBack extends BaseModel<String>  {
	
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;
	
	private String domain;
	
	private String uid;
	
	private String name;
	
	private long createTime;
	
	private String context;
	
	private int type ;
	
	private int status;
	
	@Column(length=1000)
	private String keyword;//关键字

	
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getCreateTime() {
		return createTime;
	}

	public void setCreateTime(long createTime) {
		this.createTime = createTime;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

    
    public String getKeyword() {
        return keyword;
    }

    
    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
	
	

}
