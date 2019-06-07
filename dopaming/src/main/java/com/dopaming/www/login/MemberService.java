package com.dopaming.www.login;

import javax.servlet.http.HttpServletResponse;

public interface MemberService {
	//로그인
	public MemberVO login(MemberVO vo);

	//아이디 체크
	public String valueCheckId(String value);
	
	//비밀번호 체크
	public String valueCheckPW(String value);
	
	//아이디 중복 검사
	public void check_id(String id,HttpServletResponse response) throws Exception;
	
	//이메일 중복 검사
	public void check_email(String email, HttpServletResponse response) throws Exception;
	
	//회원가입
	public int register(MemberVO vo, HttpServletResponse response) throws Exception;
	
	//인증키 생성
	public String create_key() throws Exception;
	
	//이메일 발송
	public void send_mail(MemberVO vo, String type) throws Exception;
	
	//회원 인증
	public void approval_memeber(MemberVO vo, HttpServletResponse response) throws Exception;

	//비밀번호 변경
	public void find_pw(HttpServletResponse response, MemberVO member) throws Exception;
}
