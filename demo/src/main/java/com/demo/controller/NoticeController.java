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
    public String notice(Model model,@RequestParam Map<String, Object> paramMap) throws Exception {

        model.addAttribute("li", noticeService.noticeList(paramMap));

        return "notice/notice";
    }

    @RequestMapping("/noticeList.do")
    public String noticeList(Model model, @RequestParam Map<String, Object> paramMap) throws Exception {

//        int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
//        int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
//        int pageIndex = (currentPage - 1)*pageSize; //페이지 시작  row번호
//
//        paramMap.put("pageIndex", pageIndex);
//        paramMap.put("pageSize", pageSize);
//        int totalCnt =  noticeService.noticeCnt(paramMap);
        System.out.println(paramMap);
        model.addAttribute("li", noticeService.noticeList(paramMap));
        System.out.println(model);
        return "notice/notice";
    }
    //공지검색
    @RequestMapping("/noticeSearch.do")
    public String noticeSearch(@RequestParam Map<String, Object> paramMap, Model model, HttpServletRequest request)throws Exception{

        model.addAttribute("li", noticeService.noticeSearch(paramMap));
        return "notice/notice";
    }

    @RequestMapping("/noticeReg.do")
    public String noticeReg(@RequestParam Map<String, Object> paramMap, Model model, HttpServletRequest request){
        //model.addAttribute("li", service.Select(vo));

        return "notice/noticeReg";
    }

    @RequestMapping("/noticeSubmit.do")
    public String noticeSubmit(@RequestParam Map<String, Object> paramMap, HttpSession session, Model model, HttpServletRequest request) throws Exception{
        //model.addAttribute("li", service.Select(vo));

        System.out.println(paramMap);
        noticeService.noticeSubmit(paramMap);
        return "redirect:notice.do";
    }



}