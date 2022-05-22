package com.spring.mg.product;



import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVo {

	  private int pcode;
	  private String title;
	  private String pname;  
	  private int price;
	  private int quantity;
	  private int shipping;
	  
	  
	  // 실제 이미지 파일 
	  private MultipartFile   imgFile; 	  
	  private String img; // 테이블 이미지 이름
	  private String imgtype;
	  private int imgsize;
	  private Date rdate;
	  private String userID;
	  private String detail;
	  private int wnum;
	  // 검색추가
	  private String ch1;
	  private String ch2;
	
}
