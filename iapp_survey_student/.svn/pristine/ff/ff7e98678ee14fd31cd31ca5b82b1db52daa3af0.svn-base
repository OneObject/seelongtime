package com.longtime.ajy.student.web;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/widget")
public class WidgetController {
    
    
    @RequestMapping("/vote/result/{id:[a-z0-9A-Z-]+}")
    public String voteResult(@PathVariable("id") String id,HttpServletRequest request){
        request.setAttribute("id", id);
        String v = request.getParameter("v");
        return "enn".equals(v)? "/widget/vote_result_enn":"/widget/vote_result";
    }

}
