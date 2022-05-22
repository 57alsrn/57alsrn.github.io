package com.spring.presentation;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mg.product.ProductVo;
import com.spring.mg.reply.ReplyService;
import com.spring.mg.reply.ReplyVo;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService service;
	
	
	// 댓글 작성
	@RequestMapping(value = "/pd_reply.do")
	public String posttWirte(ReplyVo vo, HttpServletRequest request, ProductVo Pvo) throws Exception {
		
		
		service.write(vo);
		
		return "redirect:/pd_detail.do?pcode=" + vo.getPcode();
	}
	
	@RequestMapping("/pd_reply_delete.do")
	public String posttDelete(ReplyVo vo) {
		service.delete(vo);
		System.out.println(" 로딩" + vo);
		return "redirect:/pd_detail.do?pcode=" + vo.getPcode();
	}
	
}
