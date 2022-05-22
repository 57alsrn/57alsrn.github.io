package com.spring.mg.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDao dao;
	
	@Override
	public List<ReplyVo> list(ReplyVo vo) {
		return dao.list(vo);
	}

	@Override
	public void write(ReplyVo vo) {
		dao.insert(vo);
		
	}

	@Override
	public void modify(ReplyVo vo) {
		dao.modify(vo);
		
	}

	@Override
	public void delete(ReplyVo vo) {
		dao.delete(vo);
		
	}

}
