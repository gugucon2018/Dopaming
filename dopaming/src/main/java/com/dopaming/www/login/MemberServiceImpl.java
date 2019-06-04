package com.dopaming.www.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dopaming.www.encryption.EgovFileScrty;

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

	@Override
	public void register(MemberVO vo) throws Exception {
		String email = vo.getMember_email();
		String id = vo.getMember_id();
		//회원가입시 비밀번호 암호화처리
		String enpassword = EgovFileScrty.encryptPassword(vo.getMember_password(), vo.getMember_id());
		vo.setMember_password(enpassword);
		
		if(email.equals(dao.valueCheckEmail(email))) {
			throw new AlreadyExistingEmailException(vo.getMember_email() + "is is duplicate email.");
		}
		if(id.equals(dao.valueCheckId(id))) {
			throw new AlreadyExistingIdException(vo.getMember_id() + " is duplicate id.");
		}
		dao.register(vo);
	}
}
