package com.demo.service;

import com.demo.dao.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductService {

    @Autowired
    ProductMapper productMapper;

    public List<?> productList(Map<String, Object> paramMap) throws Exception {
        return  productMapper.productList(paramMap);

    }


}
