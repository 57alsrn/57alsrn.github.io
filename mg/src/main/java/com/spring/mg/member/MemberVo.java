package com.spring.mg.member;

import lombok.Data;

@Data
public class MemberVo {

	private String  id ;
	private String  pwd   ;
	private String  name   ;
	private String  tel     ;
	private String  postcode  ;
	private String  roadAddress  ;
	private String  detailAddress  ;
	private String  extraAddress   ;
	private String userID; //게시글 회원ID = 게시글 작성자
	
	private String  ch1 ;
	private String  ch2 ;
	
}
