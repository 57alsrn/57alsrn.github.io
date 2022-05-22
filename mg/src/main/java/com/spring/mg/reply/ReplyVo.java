package com.spring.mg.reply;

import java.util.Date;

import lombok.Data;

/*create table reply(
"userID" nvarchar2(30) not null,
"pcode" number(6,0) not null,
"bno" number(10,0) primary key,
"content" nvarchar2(1000) not null,
"rdate" date);

alter table reply
add CONSTRAINT fk_pcode FOREIGN key("pcode")
REFERENCES product(pcode) on delete CASCADE;

alter table reply
add CONSTRAINT fk_userID FOREIGN key("userID")
REFERENCES member(id) on delete CASCADE;*/

@Data
public class ReplyVo {

	private int bno;
	private int pcode;
	private String userID;
	private String content;
	private Date rdate;
}
