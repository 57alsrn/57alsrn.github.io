package com.spring.mg.reply;

import java.util.List;

public interface ReplyDao {

	// 댓글 조회
	List<ReplyVo> list(ReplyVo vo);

	// 댓글 조회
	void  insert(ReplyVo vo);

	// 댓글 수정
	void  modify(ReplyVo vo);

	// 댓글 삭제
	void  delete(ReplyVo vo);
	
}
