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
        }
        System.out.println(loginRst);
        //response.getWriter().println(loginRst);


        return loginRst;
    }
//    //메인페이지 조회
//    @ResponseBody
//    @RequestMapping(value="/list.do")
//    public HashMap<String, Object> refundList(Model model, @RequestParam Map<String, Object> paramMap,
//                                              HttpServletRequest request,
//                                              HttpServletResponse response,
//                                              HttpSession session)
//            throws Exception {
//
//        logger.info("+ Start " + className + ".initComnCod");
//
////				  	  String loginID = (String) session.getAttribute("loginId");
////					  String sname = (String)paramMap.get("sname");
////					  String stDate =  (String)paramMap.get("stDate");
////					  String edDate =  (String)paramMap.get("edDate");
////
////
//        String id = (String)paramMap.get("id");
//        paramMap.put("id", id);
//
//
//        logger.info("   - paramMap ssss  : " + paramMap);
//
//
//        List<MainVo> MainVo = MainService.list(paramMap);
//
//        HashMap<String, Object> map = new HashMap<String, Object>();
//        map.put("MainVo", MainVo);
//
//
//
//        model.addAttribute("MainVo", MainVo);
//
//        logger.info("+ End " + className + ".initComnCod");
//        System.out.println(MainVo);
//        System.out.println(map);
//        return map;
//
//    }


}
