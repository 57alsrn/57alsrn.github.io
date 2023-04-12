package com.demo.service;


import com.demo.dao.UserMapper;
import com.demo.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {

    @Autowired
    UserMapper userMapper;

    public UserService(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public List<UserVo> regUser(Map<String, Object> paramMap) throws Exception {
        return  userMapper.regUser(paramMap);

    }
    // 중복체크
    public List<?>  idChk(Map<String, Object> paramMap) throws Exception {
        return  userMapper.idChk(paramMap);

    }
    // 회원가입
    public int userReg(Map<String, Object> paramMap) throws Exception {

        return userMapper.userReg(paramMap);

    }
    // 로그인
    public HashMap<String, Object> login(Map<String, Object> paramMap) throws Exception {

        return userMapper.login(paramMap);

    }

    //로그인 날짜 업데이트
    public int loginUpdate(Map<String, Object> paramMap) throws Exception{
        return userMapper.loginUpdate(paramMap);
    }


}
