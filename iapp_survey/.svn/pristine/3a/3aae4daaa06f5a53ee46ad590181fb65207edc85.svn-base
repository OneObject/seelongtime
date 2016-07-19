package com.longtime.app.ixin.model.vote;

import com.google.common.base.Joiner;
import com.longtime.common.protocol.MapSerializable;
import com.myctu.platform.protocol.ExtMapUtils;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;

public class VoteEventModel implements MapSerializable{
	private static final long serialVersionUID = -529520448165584491L;
	
	private String room_format = "vote_%s";
	public String getRoom(){
		return String.format(room_format, this.id);
	}
	
	private String id;
	
	private String qid;
	
	private String[] option;
	
	private long timestamp = System.currentTimeMillis();
	

	@Override
	public Map<String, Object> toMap() {
		Map<String,Object> map = new HashMap<String, Object>(2);
		ExtMapUtils.addIfNotNull(map, "id", id);
		ExtMapUtils.addIfNotNull(map, "qid", qid);
		ExtMapUtils.addIfNotNull(map, "timestamp", timestamp);
		ExtMapUtils.addIfNotNull(map, "option", Joiner.on(",").skipNulls().join(option==null? new String[0]:option));
		return map;
	}

	@Override
	public void fromMap(Map<String, Object> in) {
		this.id = ExtMapUtils.getString(in, "id");
		this.qid = ExtMapUtils.getString(in, "qid");
		String tmp = ExtMapUtils.getString(in,"option");
		if(StringUtils.isNotBlank(tmp)){
			this.option = tmp.split(",");
		}
		if(in.containsKey("timestamp")){
			this.timestamp = ExtMapUtils.getLong(in, "timestamp");
		}
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String[] getOption() {
		return option;
	}

	public void setOption(String[] option) {
		this.option = option;
	}
	
	public String getQid() {
		return qid;
	}

	public void setQid(String qid) {
		this.qid = qid;
	}

	public long getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}

	@Override
	public String toString() {
		return String.format("VoteEventModel [room_format=%s, id=%s, qid=%s, option=%s, timestamp=%s]",
			room_format,
			id,
			qid,
			Arrays.toString(option),
			timestamp);
	}

	public static void main(String[] args) {
		VoteEventModel  event = new VoteEventModel();
		
		event.setId("test");
		event.setOption(new String[]{"1","2"});
		
		Map<String,Object> map = event.toMap();
		System.out.println(map);
		event = new VoteEventModel();
		event.fromMap(map);
		
		System.out.println(event);
	}
	

}
