package com.dopaming.www.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	//로그인 처리
	@RequestMapping(value = "/loginA",method = RequestMethod.POST)
	public String login(MemberVO memberVO
						, HttpSession session
						, Model model) {
		//값 받아오기
		String id = memberVO.getMember_id();
		String pass = memberVO.getMember_password(); 
		System.out.println(id + ":" + pass);
		//기존 login이란 세션 값이 존재한다면
		if(session.getAttribute("memberSession") != null) {
			session.removeAttribute("memberSession"); //기존값 제거
		}
		
		if(memberVO == null || id == null || id.isEmpty() || pass == null || pass.isEmpty()) { //로그인 실패
			session.setAttribute("error", "로그인 실패 했습니다.");
		}else if( id.equals("admin")) {
			session.setAttribute("error", "관리자로 로그인할 수 없습니다.");
		}else { //로그인 성공
			memberVO = service.login(memberVO);
			// 세션 등록
			session.setAttribute("memberSession", memberVO);
			
			session.setAttribute("Id", memberVO.getMember_id()); 
			session.setAttribute("Pass", memberVO.getMember_password());
			 
			session.setAttribute("message", id + "님, 로그인 되었습니다.");			
		}
		
		return "redirect:/";
	}
	
	//로그아웃 처리
	@RequestMapping(value = "/logoutA", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("memberSession");	//세션 제거
		session.setAttribute("message", "로그아웃 되었습니다.");
		return "redirect:/"; 
	}

}
