package com.dopaming.www.login;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dopaming.www.encryption.EgovFileScrty;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	//로그인 처리
	@RequestMapping(value = "/loginA",method = RequestMethod.POST)
	public String login(MemberVO memberVO
						, HttpSession session) {
		//값 받아오기
		String id = memberVO.getMember_id();
		String pass = memberVO.getMember_password(); 
		
		
		//기존 login이란 세션 값이 존재한다면
		if(session.getAttribute("memberSession") != null) {
			session.removeAttribute("memberSession"); //기존값 제거
		}
		
		if(memberVO == null || id == null || id.isEmpty() || pass == null || pass.isEmpty()) { //로그인 실패
			session.setAttribute("error", "로그인 실패 했습니다.");
		}else if( id.equals("admin")) {
			session.setAttribute("error", "관리자로 로그인할 수 없습니다.");
		}else { //로그인 성공
			if(id.equals(service.valueCheckId(id)))
			{
				// 여기서 암호화된 비밀번호를 비교해서 맞으면 로그인패스한다 (암호화된비번 = 암호화된비번 비교)
				try {
					pass = EgovFileScrty.encryptPassword(pass, id);
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				memberVO.setMember_password(pass);
				if(pass.equals(service.valueCheckPW(id))){
					try {
						memberVO = service.login(memberVO);
					} catch (Exception e) {
						e.printStackTrace();
					}
					if(!memberVO.getApproval_status().equals("true")) { //이메일 인증을 하지 않은 경우
						session.setAttribute("error", "이메일 인증 후 로그인 해주세요.");
					}else {
						// 세션 등록
						session.setAttribute("memberSession", memberVO);					
						session.setAttribute("Id", memberVO.getMember_id()); 
						session.setAttribute("Pass", memberVO.getMember_password());	 
						session.setAttribute("message", id + "님, 로그인 되었습니다.");
					}
				}else { //비밀번호 일치하지 않으면
					System.out.println("해당 아이디==========="+ memberVO.getMember_id() +" 암호화된 비번 확인" + memberVO.getMember_password());
					session.setAttribute("error", "비밀번호가 일치하지 않습니다.");
				}
			}else { //아이디가 존재하지 않으면
				session.setAttribute("error", "아이디가 존재하지 않습니다.");
			}
		}
		return "redirect:/";
	}
	
	//로그아웃 처리
	@RequestMapping(value = "/logoutA", method = RequestMethod.GET)
	public String logout(HttpSession session) {			
		session.removeAttribute("Id");	//세션 아이디 제거
		session.removeAttribute("Pass");//세션 비번 제거 
		session.removeAttribute("memberSession");	//세션 제거
		session.setAttribute("message", "로그아웃 되었습니다.");
		session.invalidate();		
		return "redirect:/"; 
	}

	//아이디 중복 검사(AJAX)
	@RequestMapping(value = "/check_id", method = RequestMethod.POST)
	@ResponseBody
	public void check_id(@RequestParam("id") String id, HttpServletResponse response) throws Exception {
		service.check_id(id, response);
	}
	
	//이메일 중복 검사(AJAX)
	@RequestMapping(value = "/check_email", method = RequestMethod.POST)
	@ResponseBody
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception {
		service.check_email(email, response);
	}
	
	//회원가입 페이지
	@RequestMapping(value ="/register", method = RequestMethod.GET )
	public String registerForm() {
		return "hong/register";
	}
	
	//회원가입 처리(비밀번호 암호화는 Impl에서 했음)
	@RequestMapping(value="/register", method = RequestMethod.POST )
	public String register(@ModelAttribute MemberVO vo,RedirectAttributes rttr, HttpServletResponse response) throws Exception {
		
		rttr.addFlashAttribute("result", service.register(vo, response));
		
		return "redirect:/";
	}
	
	//회원 인증
	@RequestMapping(value = "/approval_member", method = RequestMethod.POST)
	public void approval_memeber(@ModelAttribute MemberVO vo, HttpServletResponse response) throws Exception {
		service.approval_memeber(vo, response);
	}
	
	//비밀번호 찾기
	@RequestMapping(value = "/find_pw/{member_email}", method = RequestMethod.GET)
	@ResponseBody
	public void find_pw(@ModelAttribute MemberVO member, HttpServletResponse response, @PathVariable("member_email")String member_email) throws Exception{
		member.setMember_email(member_email);
		service.find_pw(response, member);
	}
}
