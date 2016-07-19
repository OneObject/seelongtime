package com.longtime.ajy.support.service;

import java.lang.reflect.Type;

import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.util.StringUtils;
import me.chanjar.weixin.common.util.json.GsonHelper;
import me.chanjar.weixin.cp.bean.WxCpMessage;
import me.chanjar.weixin.cp.bean.WxCpUser;
import me.chanjar.weixin.cp.util.json.WxCpGsonBuilder;

import com.google.gson.JsonArray;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;


/**
 * 
 * fixed gender bug
 * @since 2015-7-7
 * @author fangxinyuan
 * 
 */
public class FixWxCpUser extends WxCpUser{
	
	private Integer enable;
		
	
	public Integer getEnable() {
		return enable;
	}

	public void setEnable(Integer enable) {
		this.enable = enable;
	}

	static{
		WxCpGsonBuilder.INSTANCE.registerTypeAdapter(FixWxCpUser.class, new WxCpUserGsonAdapter());
	}

	private static final long serialVersionUID = -2782081334365301065L;

	@Override
	public String toJson() {
	    return WxCpGsonBuilder.INSTANCE.create().toJson(this);
	}
	
	
	static class WxCpUserGsonAdapter implements JsonDeserializer<FixWxCpUser>, JsonSerializer<FixWxCpUser> {

		  public FixWxCpUser deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
		      throws JsonParseException {
		    JsonObject o = json.getAsJsonObject();
		    FixWxCpUser user = new FixWxCpUser();
		    user.setUserId(GsonHelper.getString(o, "userid"));
		    user.setName(GsonHelper.getString(o, "name"));

		    if(o.get("department") != null) {
		      JsonArray departJsonArray = o.get("department").getAsJsonArray();
		      Integer[] departIds = new Integer[departJsonArray.size()];
		      int i = 0;
		      for (JsonElement jsonElement : departJsonArray) {
		        departIds[i++] = jsonElement.getAsInt();
		      }
		      user.setDepartIds(departIds);
		    }

		    user.setPosition(GsonHelper.getString(o, "position"));
		    user.setMobile(GsonHelper.getString(o, "mobile"));
		    Integer gender = GsonHelper.getInteger(o, "gender");
		    if (new Integer(1).equals(gender)) {
		      user.setGender("男");
		    } else if (new Integer(2).equals(gender)) {
		      user.setGender("女");
		    } else {
		      user.setGender("未知");
		    }
		    user.setTel(GsonHelper.getString(o, "tel"));
		    user.setEmail(GsonHelper.getString(o, "email"));
		    user.setWeiXinId(GsonHelper.getString(o, "weixinid"));
		    user.setAvatar(GsonHelper.getString(o, "avatar"));
		    user.setStatus(GsonHelper.getInteger(o, "status"));

		    if (GsonHelper.isNotNull(o.get("extattr"))) {
		      JsonArray attrJsonElements = o.get("extattr").getAsJsonObject().get("attrs").getAsJsonArray();
		      for (JsonElement attrJsonElement : attrJsonElements) {
		        WxCpUser.Attr attr = new WxCpUser.Attr(
		            GsonHelper.getString(attrJsonElement.getAsJsonObject(), "name"),
		            GsonHelper.getString(attrJsonElement.getAsJsonObject(), "value")
		        );
		        user.getExtAttrs().add(attr);
		      }
		    }
		    return user;
		  }

		  @Override
		  public JsonElement serialize(FixWxCpUser user, Type typeOfSrc, JsonSerializationContext context) {
		    JsonObject o = new JsonObject();
		    if (user.getUserId() != null) {
		      o.addProperty("userid", user.getUserId());
		    }
		    if (user.getName() != null) {
		      o.addProperty("name", user.getName());
		    }
		    if (user.getDepartIds() != null) {
		      JsonArray jsonArray = new JsonArray();
		      for (Integer departId : user.getDepartIds()) {
		        jsonArray.add(new JsonPrimitive(departId));
		      }
		      o.add("department", jsonArray);
		    }
		    if (user.getPosition() != null) {
		      o.addProperty("position", user.getPosition());
		    }
		    if (user.getMobile() != null) {
		      o.addProperty("mobile", user.getMobile());
		    }
		    if (user.getGender() != null) {
		    	int gender = 1;
		    	if("女".equals(user.getGender())){
		    		gender=2;
		    	}
		      o.addProperty("gender", gender);
		    }
		    if (user.getTel() != null) {
		      o.addProperty("tel", user.getTel());
		    }
		    if (user.getEmail() != null) {
		      o.addProperty("email", user.getEmail());
		    }
		    if (user.getWeiXinId() != null) {
		      o.addProperty("weixinid", user.getWeiXinId());
		    }
		    if (user.getAvatar() != null) {
		      o.addProperty("avatar", user.getAvatar());
		    }
		    if (user.getStatus() != null) {
		      o.addProperty("status", user.getStatus());
		    }
		    if(user.getEnable()!=null){
		    	o.addProperty("enable", user.getEnable().intValue());
		    }
		    
		    
		    if (user.getExtAttrs().size() > 0) {
		      JsonArray attrsJsonArray = new JsonArray();
		      for (WxCpUser.Attr attr : user.getExtAttrs()) {
		        JsonObject attrJson = new JsonObject();
		        attrJson.addProperty("name", attr.getName());
		        attrJson.addProperty("value", attr.getValue());
		        attrsJsonArray.add(attrJson);
		      }
		      JsonObject attrsJson = new JsonObject();
		      attrsJson.add("attrs", attrsJsonArray);
		      o.add("extattr", attrsJson);
		    }
		    return o;
		  }

		}

	public static void main(String[] args) {
		WxCpUser wxUser = new FixWxCpUser();
		
		wxUser.setGender("女");
		
		System.out.println(wxUser.toJson());
		
	}
}

 