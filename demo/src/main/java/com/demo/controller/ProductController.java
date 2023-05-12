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
    String pdList(Model model, @RequestParam Map<String, Object> paramMap) throws Exception{
        //model.addAttribute("li", service.Select(vo));
        model.addAttribute("li", productService.productList(paramMap));
        return "pdList";
    }



    // 배송 지시서 리스트값 가져오기
//    @RequestMapping("deliveryBuyerList.do")
//    public String deliveryBuyerList(Model model, @RequestParam Map<String, Object> paramMap
//                                    ) throws Exception {
//
//        int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
//        int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
//        int pageIndex = (currentPage - 1) * pageSize; //페이지 시작  row번호
//
//        paramMap.put("pageIndex", pageIndex);
//        paramMap.put("pageSize", pageSize);
//
//        List<DeliveryBuyerModel> deliveryBuyerList = deliveryBuyerService.deliveryBuyerList(paramMap);
//        model.addAttribute("deliveryBuyerList", deliveryBuyerList);
//
//        // 목록 수 추출해서 보내기 int
//        int totalCnt =  deliveryBuyerService.deliveryBuyerListCnt(paramMap);
//
//        model.addAttribute("totalCnt", totalCnt);
//        model.addAttribute("pageSize", pageSize);
//        model.addAttribute("currentPage",pageIndex);
//
//        logger.info("+ End " + className + ".deliveryBuyerList");
//
//        return "/ship/deliveryBuyerList";
//
//    }



}
