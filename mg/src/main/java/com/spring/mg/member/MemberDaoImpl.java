package com.spring.mg.member;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSessionTemplate  mybatis;
	
	@Override
	public void insert(MemberVo vo) {
		
		// 패스워드 암호화
		vo.setPwd(BCrypt.hashpw(vo.getPwd(),BCrypt.gensalt() ));
		mybatis.insert("member-mapping.INSERT", vo);
		
	}

	// 회원 검색
	@Override
	public List<MemberVo> list(MemberVo vo) {
		
		return mybatis.selectList("member-mapping.SELECT", vo);
	}

	@Override
	public String idCk(MemberVo vo) {
		
		String str ; 
		MemberVo	k = mybatis.selectOne("member-mapping.IDCK", vo);
		if (k == null) {
			str = "T" ;   // 중복이 없는 입력 가능한 값
		}else{
			str = "F" ;  // 중복된 값.
		}
		return str;
				
	}
	// 로그인
	@Override
	public String login(MemberVo vo) {
		String str= "";
		/*
		 * // 리턴되는 아이디가 있어야 pwd가 리턴되기 때문에 아이디의 존재 여부를 먼저 확인한 후 pwd를 비교할 수 있음 
		 * // sql 쿼리문은 id, pwd 모두 불러오는 쿼리가 아닌 id의 존재 여부만 확인할 수 있도록 함 
		 * // 이후 평문 pwd와 암호화 pwd를 비교할 수  있도록 (BCrypt.checkpw(vo.getPwd(), k.getPwd()) 메소드 사용 
		 * // vo.getPwd() -> 사용자가 입력한 평문 pwd값
		 * // k.getPwd() -> DB에 아이디가 존재하는지 확인하면서 함께 리턴된 암호화된 pwd값 
		 * // 즉, pwd의 값은 DB에서 비교하는 것이 아니고 dao에서 비교함
		 * 
		 */		
		MemberVo k = mybatis.selectOne("member-mapping.IDCK", vo);
		if(k == null) {
			// 로그인 실패
			str = "F";
			System.out.println("로그인 실패" + k);
		}else {
			System.out.println("==>(1)"+vo.getPwd());
			System.out.println("==>(2)"+k.getPwd());
			if(BCrypt.checkpw(vo.getPwd(), k.getPwd())) {
				// 로그인 성공
				str = vo.getId();
				System.out.println("T");
			}else {
				// 로그인 실패
				str = "F";
				System.out.println("F");
			}
		}
		return str;
	}

	@Override
	public  void delete(MemberVo vo) {
		mybatis.delete("member-mapping.DELETE", vo);
		
	}	
	
}
