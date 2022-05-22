package com.spring.mg.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class ProductDaoImpl implements ProductDao{

	@Autowired
	private SqlSessionTemplate  mybatis;
	
	@Override
	public void insert(ProductVo vo) {
		mybatis.insert("product-mapping.PDINSERT", vo);
		
	}

	@Override
	public List<ProductVo> Select(ProductVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("product-mapping.PDSELECT", vo);
	}

	@Override
	public ProductVo detail(ProductVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("product-mapping.DETAIL", vo);
	}

	@Override
	public ProductVo modify(ProductVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("product-mapping.PDCONTENT", vo);
	}

	@Override
	public void delete(ProductVo vo) {
		mybatis.delete("product-mapping.PDDELETE", vo);
		
	}

	@Override
	public void updateFile(ProductVo vo) {
		mybatis.update("product-mapping.PDUPDATEFILE", vo);

		
	}

	@Override
	public void update(ProductVo vo) {
		mybatis.update("product-mapping.PDUPDATE", vo);
		
	}

}
