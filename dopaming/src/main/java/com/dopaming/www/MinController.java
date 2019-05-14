package com.dopaming.www;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dopaming.www.login.*;

@Controller
public class MinController {
	
	private static final Logger logger = LoggerFactory.getLogger(MinController.class);
	
//	@Autowired
//	com.dopaming.www.login.Userservice service;
	
	//(관리자)회원관리 - 등급관리
	@RequestMapping(value= {"/classForm"}, method=RequestMethod.GET)
	public String classFrom() {
		return "min/adminclass_min";
	}
	//(관리자)회원관리 - 사용자관리
	@RequestMapping(value= {"/userForm"}, method=RequestMethod.GET)
	public String userFrom() {
		return "min/adminuser_min";
	}
	//(관리자)회원관리 - 업로드한 리스트 뷰
	@RequestMapping(value= {"/uploadlistForm"}, method=RequestMethod.GET)
	public String uploadlistFrom() {
		return "min/adminuploadlist_min";
	}
	//(관리자)로그인 폼
	@RequestMapping(value= {"/loginForm","/login"}, method=RequestMethod.GET)
	public String loginFrom() {
		return "min/adminlogin_min";
	}
		//로그인 처리
//		@RequestMapping(value="/login", method=RequestMethod.POST)
//		public String login(@ModelAttribute("user") MembersVO_min vo, 
//				HttpServletRequest request,HttpSession session,
//				HttpServletResponse response) throws IOException{
//			MembersVO_min user = service.getUser(vo);
//			if(user == null ){
//					PrintWriter out = response.getWriter();
//					out.println("<script>");
//					out.println("alert('id error');");
//					out.println("history.go(-1);"); //이전페이지로
//					out.println("</script>");
//				return "min/adminlogin_min";	
//			}
//			else {
//				session.setAttribute("id",user.getMember_id());
//				session.setAttribute("user",user);
//				return "redirect:boardList";
//			}
//		}
//		
//		//로그아웃 처리
//		@RequestMapping("/logout")
//		public String logout(HttpSession session) {
//			session.invalidate(); //세션무효화
//			return "login";
//		}
}
