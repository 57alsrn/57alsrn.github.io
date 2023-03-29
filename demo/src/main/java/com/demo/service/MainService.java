package com.demo.service;

import com.demo.dao.MainMapper;
import com.demo.vo.MainVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class MainService {
	
	@Autowired
	MainMapper MainMapper;
	
	public MainService(MainMapper MainMapper) {
		this.MainMapper = MainMapper;
	}
	
	public List<MainVo> list(Map<String, Object> paramMap) throws Exception {
		return  MainMapper.list(paramMap);
		
	}

}
