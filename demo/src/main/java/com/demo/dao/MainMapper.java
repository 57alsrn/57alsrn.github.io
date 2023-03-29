package com.demo.dao;

import com.demo.vo.MainVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface MainMapper {

	public List<MainVo> list(Map<String, Object> paramMap)throws Exception ;
}
