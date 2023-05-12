package com.demo.controller;

import com.demo.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class NoticeController {

    @Autowired
    NoticeService noticeService;


    @RequestMapping("/notice.do")
    String notice(Model model, @RequestParam Map<String, Object> paramMap) throws Exception {
        model.addAttribute("li", noticeService.noticeList(paramMap));
        return "notice";
    }

    @RequestMapping("/noticeCnt.do")
    String noticeCnt(Model model, @RequestParam Map<String, Object> paramMap) throws Exception {
        model.addAttribute("cnt", noticeService.noticeListCnt(paramMap));
        System.out.println(model);
        return "notice";
    }

    @RequestMapping("/noticeReg.do")
    String noticeReg(@RequestParam Map<String, Object> paramMap, Model model, HttpServletRequest request){
        //model.addAttribute("li", service.Select(vo));

        return "noticeReg";
    }

    @RequestMapping("/noticeSubmit.do")
    String noticeSubmit(@RequestParam Map<String, Object> paramMap, HttpSession session, Model model, HttpServletRequest request) throws Exception{
        //model.addAttribute("li", service.Select(vo));

        System.out.println(paramMap);
        noticeService.noticeSubmit(paramMap);
        return "redirect:notice.do";
    }



}
