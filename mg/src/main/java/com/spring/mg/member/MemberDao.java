package com.spring.mg.member;

import java.util.List;

public interface MemberDao {

	void insert(MemberVo vo);

	List<MemberVo> list(MemberVo vo);

	String idCk(MemberVo vo);
	String login(MemberVo vo);
	void delete(MemberVo vo);
}
