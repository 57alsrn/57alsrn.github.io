package com.spring.mg.reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDaoImpl implements ReplyDao{

	@Autowired
	private SqlSessionTemplate  mybatis;

	@Override
	public List<ReplyVo> list(ReplyVo vo) {
		
		return mybatis.selectList("reply-mapping.R_LIST", vo);
	}

	@Override
	public void insert(ReplyVo vo) {
		mybatis.insert("reply-mapping.R_INSERT", vo);
		
	}

	@Override
	public void modify(ReplyVo vo) {
		mybatis.update("reply-mapping.R_MODIFY", vo);
		
	}

	@Override
	public void delete(ReplyVo vo) {
		mybatis.delete("reply-mapping.R_DELETE", vo);
		
	}
	
	

}
