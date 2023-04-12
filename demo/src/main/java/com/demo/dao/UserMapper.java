package com.demo.dao;

import com.demo.vo.UserVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface UserMapper {

    public List<UserVo> regUser(Map<String, Object> paramMap)throws Exception ;

    public  List<?> idChk(Map<String, Object> paramMap)throws Exception ;

    public int userReg(Map<String, Object> paramMap)throws Exception ;

    public HashMap<String, Object> login(Map<String, Object> paramMap)throws Exception ;
    public int loginUpdate(Map<String, Object> paramMap) throws Exception;

}