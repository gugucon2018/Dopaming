package com.dopaming.www.login;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	//SqlSessionTemplate객체가 모든 JDBC처리를 대신 해줌
	@Autowired
	SqlSessionTemplate mybatis;
	
	//로그인
	public MemberVO login(MemberVO vo) {
		System.out.println("===> Mybatis로  login() 기능 처리");
		return (MemberVO) mybatis.selectOne("MemberDAO.login", vo);
	}
	
	//아이디 체크
	public String valueCheckId(String value) {
		return mybatis.selectOne("MemberDAO.valueCheckId", value);
	}
	
	//비밀번호 체크
	public String valueCheckPW(String value) {
		return mybatis.selectOne("MemberDAO.valueCheckPW", value);		
	}
}

