package com.dopaming.www.login;

public interface MemberService {
	// 로그인
	public MemberVO login(MemberVO vo);

	// 아이디 체크
	public String valueCheckId(String value);
	
	//비밀번호 체크
	public String valueCheckPW(String value);
	
	//회원가입
	public void register(MemberVO vo) throws Exception;
}
