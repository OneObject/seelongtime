package com.longtime.ajy.mweb.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.longtime.ajy.model.IndexEntityVO;
import com.longtime.ajy.mweb.service.DiyIndexService;


@Controller("mDiyIndexController")
@RequestMapping("/m/site")
public class MDiyIndexController extends MBaseController {

	private static Logger logger = LoggerFactory.getLogger(MDiyIndexController.class);
	
	@Resource(name="diyIndexService")
	private DiyIndexService diyIndexService;
	
	@RequestMapping("/index/{id}")
	public String detal(@PathVariable("id") String id,HttpServletRequest request, ModelMap map){
		IndexEntityVO vo = this.diyIndexService.findById(id);
		map.put("vo", vo);
		if(id.equals("ff808081529f97640152a4c8ba27151e")){
			return "m/site/newindex";
		}
		return "m/site/index";
	}

	

}
