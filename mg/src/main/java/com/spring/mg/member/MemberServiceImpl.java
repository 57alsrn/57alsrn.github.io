package com.spring.mg.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao  dao;
	
	@Override
	public void insert(MemberVo vo) {
		dao.insert(vo);
		
	}

	@Override
	public List<MemberVo> list(MemberVo vo) {
		return dao.list(vo);
	}

	@Override
	public String idCk(MemberVo vo) {

		return dao.idCk(vo);
	}

	// 로그인
	@Override
	public String login(MemberVo vo) {
		return dao.login(vo);
	}

	@Override
	public void delete(MemberVo vo) {
		 dao.delete(vo);
	}

}
