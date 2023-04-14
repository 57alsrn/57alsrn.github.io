package com.demo.controller;

import org.apache.maven.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

    @RequestMapping("/pd_list.do")
    String notice(Model model){
        //model.addAttribute("li", service.Select(vo));
        return "pdList";
    }


}
