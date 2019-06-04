package com.dopaming.www.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dopaming.www.encryption.EgovFileScrty;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	//form태그에 Command객체로 넘겨주는 메소드
	//<form:form commandName="memberVO">이면 MemberVO객체를 리터
	@ModelAttribute("memberVO")
	protected Object formBack() {
		return new MemberVO();
	}
	
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
				// 여기서 암호화된 비밀번호를 확인한다 (암호화된비번 = 암호화된비번)
				try {
					pass = EgovFileScrty.encryptPassword(pass, id);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				memberVO.setMember_password(pass);
				if(pass.equals(service.valueCheckPW(id))){
					try {
						memberVO = service.login(memberVO);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					// 세션 등록
					session.setAttribute("memberSession", memberVO);					
					session.setAttribute("Id", memberVO.getMember_id()); 
					session.setAttribute("Pass", memberVO.getMember_password());
					 
					session.setAttribute("message", id + "님, 로그인 되었습니다.");
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
		return "redirect:/"; 
	}

	//회원가입 페이지
	@RequestMapping(value ="/register", method = RequestMethod.GET )
	public String registerForm() {
		return "hong/register";
	}
	
	//회원가입 처리
	@RequestMapping(value="/register", method = RequestMethod.POST )
	public String register(@ModelAttribute MemberVO vo, Errors errors) throws Exception {
		//유효성 검사
		new MemberValiadator().validate(vo, errors);
		
		if(errors.hasErrors()) {
			return "hong/register";
		}
		
		try {
			service.register(vo);			
		}catch (AlreadyExistingEmailException e) {
            errors.rejectValue("member_email", "duplicate", "이미 가입된 이메일입니다.");
            return "hong/register";
        } catch (AlreadyExistingIdException e) {
            errors.rejectValue("member_id", "duplicate", "이미 가입된 아이디입니다.");
            System.out.println(errors);
            return "hong/register";
        }

		return "redirect:/";
	}

}
