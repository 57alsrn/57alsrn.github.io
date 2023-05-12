package com.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProductMapper {
    public List<?> productList(Map<String, Object> paramMap)throws Exception ;

    public void productSubmit(Map<String, Object> paramMap)throws Exception ;
}
