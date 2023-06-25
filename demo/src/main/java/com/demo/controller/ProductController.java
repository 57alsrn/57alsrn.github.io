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

    // 상품리스트 화면
    @RequestMapping("/pdList.do")
    String product(Model model, @RequestParam Map<String, Object> paramMap) throws Exception{
        //model.addAttribute("li", service.Select(vo));
        model.addAttribute("li", productService.productList(paramMap));
        return "product/pdList";
    }

    // 상품 등록화면
    @RequestMapping("/pdReg.do")
    String productReg(Model model, @RequestParam Map<String, Object> paramMap) throws Exception{
        //model.addAttribute("li", service.Select(vo));
        model.addAttribute("li", productService.productList(paramMap));
        return "product/pdReg";
    }

    // 상품등록

    @RequestMapping("/pdRegIns.do")
    String productRegIns(Model model, @RequestParam Map<String, Object> paramMap) throws Exception{
        System.out.println(paramMap);
        return "product/pdReg";
    }

}
