package com.spring.presentation;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mg.member.MemberService;
import com.spring.mg.member.MemberVo;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;

	@RequestMapping("/index.do")
	String main() {
		return "index.jsp";
	}
	
	// 아이디 중복 체크
	@RequestMapping("/idCk.do")
	void idCk(MemberVo vo, HttpServletResponse response) throws Exception {

		PrintWriter out = response.getWriter();
		String m = service.idCk(vo);

		if (m.equals("F")) {
			out.println(1); // 아이디 중복
		} else {
			out.println(0); // 입력가능 ID
		}
	}
	
	@RequestMapping("/member_form.do")
	String memberForm() {
		return "/member/member_form.jsp";
	}
	
	// 회원 가입
	@RequestMapping("/member_formOk.do")
	String member_formOk(MemberVo  vo, HttpServletRequest request)
			throws Exception {
		
				service.insert(vo);
				
				return "/login/login_form.jsp";	
				
	}
	// 로그인
	
	// 리턴되는 아이디가 있어야 pwd가 리턴되기 때문에 아이디의 존재 여부를 먼저 확인한 후 pwd를 비교할 수 있음 
	// sql 쿼리문은 id, pwd 모두 불러오는 쿼리가 아닌 id의 존재 여부만 확인할 수 있도록 함
	// 이후 평문 pwd와 암호화 pwd를 비교할 수 있도록 (BCrypt.checkpw(vo.getPwd(), k.getPwd()) 메소드 사용
	// vo.getPwd() -> 사용자가 입력한 평문 pwd값  k.getPwd() -> DB에 아이디가 존재하는지 확인하면서 함께 리턴된 암호화된 pwd값
	// 즉, pwd의 값은 DB에서 비교하는 것이 아니고 dao에서 비교함
	@RequestMapping("/login_formOk.do")
	void login_formOK(MemberVo vo, HttpServletResponse response,
			HttpServletRequest request)
			throws Exception {

				HttpSession session = request.getSession();
				PrintWriter out = response.getWriter();
		
				String m = service.login(vo);
		
				if (m.equals("F")) {
		
					out.println(0); // 로그인 실패
				} else {
					session.setAttribute("session", m);
					System.out.println(m + " 확인");
					out.println(1); // 로그인 성공
				}
	}

	@RequestMapping("/logout.do")
	String logout(HttpServletRequest request) throws Exception {
		HttpSession  session = request.getSession();
        // 세션 제거
		session.invalidate();
		return "/index.jsp";
	}

	
	@RequestMapping("/member_list.do")
	String member_list(MemberVo vo, Model model) throws Exception {

		model.addAttribute("li", service.list(vo));
		return "/member/member_list.jsp";
	}
	@RequestMapping("/delete.do")
	String delete(MemberVo vo, Model model) {
		service.delete(vo);
		return "/member_list.do";
		
	}
}