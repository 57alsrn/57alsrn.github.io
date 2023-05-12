package com.demo.service;

import com.demo.dao.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class NoticeService {

    @Autowired
    NoticeMapper noticeMapper;

    public List<?> noticeList(Map<String, Object> paramMap) throws Exception {
        return  noticeMapper.noticeList(paramMap);

    }

    // 페이징처리
    public int noticeListCnt(Map<String, Object> paramMap) throws Exception {
        return  noticeMapper.noticeListCnt(paramMap);

    }
    public void noticeSubmit(Map<String, Object> paramMap) throws Exception {
         noticeMapper.noticeSubmit(paramMap);

    }

}
