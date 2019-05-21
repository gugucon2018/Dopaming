package com.dopaming.www.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO dao;
	
	@Override
	public MemberVO login(MemberVO vo) {
		return dao.login(vo);
	}

	@Override
	public String valueCheckId(String value) {
		return dao.valueCheckId(value);
	}
	
	@Override
	public String valueCheckPW(String value) {
		return dao.valueCheckPW(value);
	}
}
