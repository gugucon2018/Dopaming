package com.dopaming.www.login;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.HtmlEmail;
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
	public void send_mail(MemberVO vo) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		final String username = "rlfls54@gmail.com"; 
		final String password = "bqocuxhcktjkwlyp"; 

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "rlfls54@gmail.com";
		String fromName = "관리자";
		String subject = "";
		String msg = "";
		
		
		// 회원가입 메일 내용
		subject = "Dopaming 회원가입 인증 메일입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += vo.getMember_id() + "님 회원가입을 환영합니다.</h3>";
		msg += "<div style='font-size: 130%'>";
		msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
		msg += "<form method='post' action='http://dopaming.com:80/dopaming/approval_member'>";
		msg += "<input type='hidden' name='member_email' value='" + vo.getMember_email() + "'>";
		msg += "<input type='hidden' name='approval_key' value='" + vo.getApproval_key() + "'>";
		msg += "<input type='submit' value='인증'></form><br/></div>";
		
		// 받는 사람 E-Mail 주소
		String mail = vo.getMember_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthenticator(new DefaultAuthenticator(username, password));
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
			System.out.println("Sent message successfully....");
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
			throw new RuntimeException(e);
		}
		
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
			//인증 메일 발송
			send_mail(vo);
			return 1;
		}
	}

	@Override
	public void approval_memeber(MemberVO vo, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (dao.approval_memeber(vo) == 0) { // 이메일 인증에 실패하였을 경우
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else { // 이메일 인증을 성공하였을 경우
			out.println("<script>");
			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
			out.println("location.href='http://192.168.0.68:80/dopaming/';");
			out.println("</script>");
			out.close();
		}
		
	}
}
