package com.demo.controller;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class TestController {

    // Set logger
    private final Logger logger = LogManager.getLogger(this.getClass());

    @RequestMapping("/test.do")
    public String test(){
        return "views/test";
    }
    @RequestMapping("/testSubmit.do")
    public String testSubmit(HttpServletRequest req, @RequestParam Map<String, Object> param,
                             Model model){

        logger.info("req = "+ req + "\n param = " + param );
        String sId = req.getParameter("sId");
        String sPwd = req.getParameter("sPwd");
        param.put("sId", sId);

        param.put("sPwd", sPwd);

        System.out.println(param);
        model.addAttribute("param", param);

        return "views/test";
    }


}
