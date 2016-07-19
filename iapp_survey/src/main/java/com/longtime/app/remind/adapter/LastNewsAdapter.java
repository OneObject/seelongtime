package com.longtime.app.remind.adapter;

import java.util.List;

import net.sf.json.JSONObject;

import com.longtime.app.remind.model.Remind;

public class LastNewsAdapter {

	public static JSONObject getJSONObject(List<Remind> list) {
		JSONObject jsonObject = new JSONObject();
		if(list == null || list.size()<=0){
			jsonObject.put("success", true);
			jsonObject.put("code", 0);
			jsonObject.put("msgstr", "没有数据");
			jsonObject.put("remindObj", null);
		}else{
			jsonObject.put("success", true);
			jsonObject.put("code", 1);
			jsonObject.put("msgstr", "");
			jsonObject.put("remindObj", list.get(0));
		}
		return jsonObject;
	}

}
