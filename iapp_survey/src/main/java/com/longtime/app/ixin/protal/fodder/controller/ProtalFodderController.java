package com.longtime.app.ixin.protal.fodder.controller;

import com.longtime.app.config.Constants;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;

@Controller("protalFodderController")
@RequestMapping("/protal/fodder")
public class ProtalFodderController {
	@Resource(name = "fodderService")
	private FodderService fodderService;

	@RequestMapping("detail")
	public String fodderDetail(@RequestParam("id")String id, HttpServletRequest request, ModelMap model){
		//根据素材Id查询素材信息
	    String preview = request.getParameter("preview");
	    
	    if(StringUtils.isBlank(preview)){
    	    String fdomain=request.getParameter("fdomain");
    	    fdomain=StringUtils.trimToEmpty(fdomain);
    	    return String.format("redirect:%s/m/ixin/fodder/detail.xhtml?id=%s&fdomain=%s", Constants.STUDENT_WEB_ROOT,id,fdomain);
    	    
	    }
		FodderVO vo = fodderService.getFodderVOById(id);
		if(vo != null && StringUtils.isNotBlank(vo.getGotoUrl())){
			String url = vo.getGotoUrl().trim();
			Pattern pattern = Pattern.compile("^(http://|https://)",Pattern.CASE_INSENSITIVE);
			Matcher matcher = pattern.matcher(url);
			if(!matcher.find()){
				url = String.format("http://%s", url);
			}
			return String.format("redirect:%s",url);
		}
		
		model.put("vo", vo);
		return "protal/fodder/detail";
	}
	
}
