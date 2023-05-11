package com.demo.controller;


import com.demo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class ProductController {

    @Autowired
    ProductService productService;

    @RequestMapping("/pd_list.do")
    String notice(Model model, @RequestParam Map<String, Object> paramMap) throws Exception{
        //model.addAttribute("li", service.Select(vo));
        model.addAttribute("li", productService.productList(paramMap));
        return "pdList";
    }



}
