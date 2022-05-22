package com.spring.mg.product;

import java.util.List;

public interface ProductDao {

	void insert(ProductVo vo);
	List<ProductVo> Select(ProductVo vo);
	ProductVo detail(ProductVo vo); // 상세보기
	ProductVo modify(ProductVo vo);
	void  delete(ProductVo vo);
	void  updateFile(ProductVo vo);
	void  update(ProductVo vo);
}
