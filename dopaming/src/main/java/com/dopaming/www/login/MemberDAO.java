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
		System.out.println("===> Mybatis로  valueCheckId() 기능 처리");
		return mybatis.selectOne("MemberDAO.valueCheckId", value);
	}
	
	//비밀번호 체크
	public String valueCheckPW(String value) {
		System.out.println("===> Mybatis로  valueCheckPW() 기능 처리");
		return mybatis.selectOne("MemberDAO.valueCheckPW", value);		
	}
	
	//이메일 체크
	public String valueCheckEmail(String value) {
		System.out.println("===> Mybatis로  valueCheckPW() 기능 처리");
		return mybatis.selectOne("MemberDAO.valueCheckEmail", value);
	}
	
	//아이디 중복 검사
	public int check_id(String id) {
		System.out.println("===> Mybatis로  check_id() 기능 처리");
		return mybatis.selectOne("MemberDAO.check_id", id);
	}
	
	//이메일 중복 검사
	public int check_email(String email) {
		System.out.println("===> Mybatis로  check_email() 기능 처리");
		return mybatis.selectOne("MemberDAO.check_email", email);
	}
	
	//회원가입
	public int register(MemberVO vo) {
		System.out.println("===> Mybatis로  register() 기능 처리");
		return mybatis.insert("MemberDAO.register",vo);
	}
}

