package com.demo.controller;

import com.demo.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    // Set logger
    private final Logger logger = LogManager.getLogger(this.getClass());

    // Get class name for logger
    private final String className = this.getClass().toString();

    // 메인페이지 로딩
    @RequestMapping("/")
    public String Index() {


        return "index";
    }
    // 로그인 성공시
    @RequestMapping("/main.do")
    public String Main(){
        return "../System/main";
    }

    //아이디 중복체크
    @ResponseBody
    @RequestMapping("/idChk.do")
    public HashMap<String, Object> idChk( @RequestParam Map<String, Object> paramMap
                                             ) throws Exception {
        String idChk = (String)paramMap.get("idChk");
        paramMap.put("idChk", idChk);
        logger.info("   - paramMap ssss  : " + paramMap);

        List<?> idChklist = userService.idChk(paramMap);

        HashMap<String, Object> map = new HashMap<>();
        map.put("idChklist", idChklist);

        System.out.println(map);

        return map;
    }

    //회원가입
    @ResponseBody
    @RequestMapping("/regUser.do")
    public int regUser( @RequestParam Map<String, Object> paramMap
    ) throws Exception {

        logger.info("   - paramMap ssss  : " + paramMap);

        int rst = userService.userReg(paramMap);

        System.out.println("insert 결과 >>>>>>>>" + rst);

        return rst;
    }

    //로그인
    @ResponseBody
    @RequestMapping("/login.do")
    public HashMap<String, Object>
     login(@RequestParam Map<String, Object> paramMap
                                         , HttpSession session
                                         , HttpServletResponse response
                                          , HttpServletRequest request
    ) throws Exception {
        session = request.getSession();
        HashMap<String, Object> loginRst = userService.login(paramMap);
        if(loginRst != null){
            session.setAttribute("id", loginRst);
            session.setAttribute("admin", loginRst.get("ADMIN"));
        }
        System.out.println(loginRst);
        //response.getWriter().println(loginRst);


        return loginRst;
    }

    //로그아웃
    @RequestMapping("/logout.do")
    String logout(HttpServletRequest request) throws Exception {
        HttpSession  session = request.getSession();
        // 세션 제거
        session.invalidate();
        return "index";
    }


}
