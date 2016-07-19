package com.longtime.app.remind.adapter;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.longtime.app.remind.model.Remind;

public class RemindListAdapter {

	public static JSONObject getJSONObject(List<Remind> list) {
		JSONObject jsonObject = new JSONObject();
		if(list == null || list.size()<=0){
			jsonObject.put("success", true);
			jsonObject.put("msgstr", "暂无数据");
			jsonObject.put("code", 0);
			jsonObject.put("remindList", null);
		}else{
			jsonObject.put("success", true);
			jsonObject.put("msgstr", "");
			jsonObject.put("code", 1);
			jsonObject.put("remindList", JSONArray.fromObject(list));
		}
		return jsonObject;
	}

}
