package com.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface NoticeMapper {
    public List<?> noticeList(Map<String, Object> paramMap)throws Exception ;

    public List<?> noticeSearch(Map<String, Object> paramMap)throws Exception ;

    public void noticeSubmit(Map<String, Object> paramMap)throws Exception ;

    public int noticeCnt(Map<String, Object> paramMap)throws Exception ;
}
