package com.dopaming.www.login;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

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
	public void check_id(String id, HttpServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
		out.println(dao.check_id(id));
		out.close();
	}

	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
		out.println(dao.check_email(email));
		out.close();
	}
	
	@Override
	public String create_key() throws Exception {
		String key = "";
		Random rd = new Random();
		
		for(int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}
	
	@Override
	public int register(MemberVO vo, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String email = vo.getMember_email();
		String id = vo.getMember_id();
		
		//회원가입시 비밀번호 암호화처리
		String enpassword = EgovFileScrty.encryptPassword(vo.getMember_password(), vo.getMember_id());
		vo.setMember_password(enpassword);
		
		if(dao.check_id(id) == 1) {
			out.println("<script>");
			out.println("alert('동일한 아이디가 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		}else if(dao.check_email(email) == 1) {
			out.println("<script>");
			out.println("alert('동일한 이메일이 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		}else {
			//인증키 설정
			vo.setApproval_key(create_key());
			dao.register(vo);
			return 1;
		}
	}
}
