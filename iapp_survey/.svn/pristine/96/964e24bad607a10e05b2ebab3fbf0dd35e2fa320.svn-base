package com.longtime.app.remind.adapter;

import java.util.List;

import net.sf.json.JSONObject;

import com.longtime.app.remind.model.Remind;

public class NoticeAdapter {

	public static JSONObject getJSONObject(List<Remind> remindList) {
		JSONObject jsonObject = new JSONObject();
		if(remindList == null || remindList.isEmpty()){
			jsonObject.put("success", true);
			jsonObject.put("msgstr", "");
			jsonObject.put("code", 0);
		}else{
			jsonObject.put("success", true);
			jsonObject.put("msgstr", "");
			jsonObject.put("code", 1);
			jsonObject.put("count", remindList.size());
			jsonObject.put("remindObj", remindList.get(0));
		}
		return jsonObject;
	}

	public static JSONObject getErrorJSONObject() {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("success", false);
		jsonObject.put("msgstr", "服务器链接失败，请稍后重试！");
		return jsonObject;
	}

}
