package com.dopaming.www.login;

public interface MemberService {
	// 로그인
	public MemberVO login(MemberVO vo);

	// 아이디 체크
	public String valueCheckId(String value);
}
