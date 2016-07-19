package com.longtime.app.api.http.version;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.mobile.model.Mobile;
import com.longtime.app.mobile.service.MobileService;

@Controller
@RequestMapping("/api/mobile/version/")
public class MobileVersionController {

	@Resource(name = "mobileService")
	private MobileService mobileService;
	
	@RequestMapping("checkforupdate")
	@ResponseBody
	public JSONObject checkForUpdate(HttpServletRequest request){
		String device = request.getParameter("device");
		String version = request.getParameter("version");
		String requestType = request.getParameter("requestType");
		
		Mobile currentVersion = mobileService.findCurrentVersion(device, version);
		if(currentVersion == null){
			return getResult(false,"版本号不存在","-1",requestType);
		}
		
		List<Mobile> versions = this.mobileService.list(device);
		if(CollectionUtils.isEmpty(versions)){
			String msg = String.format("未找到版本信息，［device:%s］",device);
			return getResult(false, msg, "-1",requestType);
		}
		Mobile newestVersion = versions.get(0);
		JSONObject result = checkVersion(currentVersion,newestVersion);
		result.put("success", ""+true);
		result.put("requestType",requestType);
		return result;
	}

	private JSONObject getResult(boolean success,String msg,String code, String requestType){
		JSONObject result = new JSONObject();
		result.put("success", ""+success);
		result.put("msg", msg);
		result.put("code", code);
		result.put("requestType", requestType);
		return result;
	}
	
	private JSONObject checkVersion(Mobile currentVersion, Mobile newestVersion) {
		JSONObject result = new JSONObject();
		if(newestVersion.getVersion().equals(currentVersion.getVersion())){
			result.put("code", "0"); //不需更新
		}else{
			result.put("version", newestVersion.getVersion());
			result.put("currVersion", currentVersion.getVersion());
			if(currentVersion.getCanUser().equals("0")){
				result.put("code", "2"); //强制更新
			}else{
				result.put("code", "1"); //建议更新
			}
			String msg = String.format("您当前的版本是：%s,最新版本是：%s,请进行更新。", currentVersion.getVersion(),newestVersion.getVersion());
			result.put("msg", msg);
			result.put("downloadAppUrl", newestVersion.getDownloadPath());
		}
		return result;
	}
	
}
