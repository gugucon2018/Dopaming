package com.yedam.www.min;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class minController {
	
	@Autowired
	Membersservice service;
	
	//로그인 폼
	@RequestMapping(value= {"/Adminlogin","/Adminlogin_min"}, method=RequestMethod.GET)
	public String loginFrom() {
		return "admin/adminlogin_min";
	}
	//로그인 처리
	@RequestMapping(value="/Adminlogin_min", method=RequestMethod.POST)
	public String login(@ModelAttribute("user") MembersVO vo, 
			HttpServletRequest request,HttpSession session,
			HttpServletResponse response) throws IOException{
		MembersVO user = service.getMembers(vo);
		if(user == null ){
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('id error');");
				out.println("history.go(-1);"); //이전페이지로
				out.println("</script>");
			return "admin/adminlogin_min";	
		}
		else {
			session.setAttribute("id",user.getMember_id());
			session.setAttribute("user",user);
			return "redirect:boardList";
		}
	}
	
	//로그아웃 처리
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); //세션무효화
		return "adminlogin_min";
	}
}
