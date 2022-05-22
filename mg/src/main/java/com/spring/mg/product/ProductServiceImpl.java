package com.spring.mg.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao dao;
	
	@Override
	public void insert(ProductVo vo) {
		dao.insert(vo);
		
	}

	@Override
	public List<ProductVo> Select(ProductVo vo) {
		// TODO Auto-generated method stub
		return dao.Select(vo);
	}

	@Override
	public ProductVo detail(ProductVo vo) { // 상세보기 
		// TODO Auto-generated method stub
		return dao.detail(vo);
	}

	@Override
	public ProductVo modify(ProductVo vo) {
		// TODO Auto-generated method stub
		return dao.modify(vo);
	}

	@Override
	public void delete(ProductVo vo) {
		// TODO Auto-generated method stub
		dao.delete(vo);
	}

	@Override
	public void updateFile(ProductVo vo) {
		dao.updateFile(vo);
		
	}

	@Override
	public void update(ProductVo vo) {

		dao.update(vo);
	}

}
