package com.longtime.app.oplog.listener;

import java.util.Map;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.longtime.common.protocol.MapSerializable;
import com.myctu.platform.protocol.event.PlatformEvent;
import com.myctu.platform.utils.MapUtils;

public class OpLogOperationEvent  extends PlatformEvent implements MapSerializable{


	private static final long serialVersionUID = 4556639374916500576L;


	public OpLogOperationEvent() {
		super();
	}
	
	public OpLogOperationEvent(String sid,int type,int action,String domain) {
		super();
		this.sid = sid;
		this.type = type;
		this.action = action;
		this.domain = domain;
	}

	public OpLogOperationEvent(Integer source, String domain) {
		super(source, domain);
	}

	protected String sid;
	
	protected int type;
	
	protected int action;
	
	protected String domain;
	
	
	@Override
	public Map<String, Object> toMap() {
		Map<String, Object> m = super.toMap();
		m.put("sid",this.sid);
		m.put("type",this.type);
		m.put("action",this.action);
		m.put("domain",this.domain);
		return m;
	}

	@Override
	public void fromMap(Map<String, Object> in) {
		super.fromMap(in);
		this.sid = MapUtils.getString(in, "sid");
		this.type = MapUtils.getIntValue(in, "type");
		this.action = MapUtils.getIntValue(in, "action");
		this.domain = MapUtils.getString(in, "domain");
	}
	
	
	
	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getAction() {
		return action;
	}

	public void setAction(int action) {
		this.action = action;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE, false)
			.concat(String.format("@hashCode=%s", this.hashCode()));
	}
	
	public static void main(String[] args) {
		System.err.println(1);
	}
}
