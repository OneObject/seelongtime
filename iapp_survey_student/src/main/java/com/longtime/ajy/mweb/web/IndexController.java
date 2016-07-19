package com.longtime.ajy.mweb.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("mIndexController")
@RequestMapping("/m")
public class IndexController extends MBaseController{

    private static Logger  logger = LoggerFactory.getLogger(IndexController.class);


    @RequestMapping("index")
    public String test(HttpServletRequest request, HttpServletResponse response) {

      logger.debug("current user uid=[{}] domain=[{}]",this.getCurrentUid(request),this.getCurrentDomain(request));

        return "m/index";
    }

}
