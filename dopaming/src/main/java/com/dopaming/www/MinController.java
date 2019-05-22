package com.dopaming.www;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dopaming.www.admin.blacklist.BlackListVO;
import com.dopaming.www.admin.blacklist.BlackListservice;
import com.dopaming.www.admin.grade.GradeVO_min;
import com.dopaming.www.admin.grade.Gradeservice_min;
import com.dopaming.www.admin.login.Loginservice_min;
import com.dopaming.www.admin.login.MembersVO_min;
import com.dopaming.www.common.Paging;

@Controller
public class MinController {
	
	private static final Logger logger = LoggerFactory.getLogger(MinController.class);
	
	@Autowired
	Loginservice_min service;
	@Autowired
	Gradeservice_min service2;
	@Autowired
	BlackListservice service3;
	
	//(관리자)로그인 폼
		@RequestMapping(value= {"/loginForm"}, method=RequestMethod.GET)
		public String loginFrom() {
			return "admin/admin_min/adminlogin_min.empty";
		}
			//로그인 처리
			@RequestMapping(value="/login", method=RequestMethod.POST)
			public String login(@ModelAttribute("members") MembersVO_min vo, 
					HttpServletRequest request,HttpSession session,
					HttpServletResponse response) throws IOException{
				MembersVO_min member = service.getMembers(vo);
				if(member == null ){
						PrintWriter out = response.getWriter();
						out.println("<script>");
						out.println("alert('id error');");
						out.println("history.go(-1);"); //이전페이지로
						out.println("</script>");
					return "admin/admin_min/adminlogin_min.empty";	
				}
				else {
					session.setAttribute("member_id",member.getMember_id());
					session.setAttribute("member_password",member.getMember_password());
					session.setAttribute("member",member);
					//System.out.println(member); //세션값이 안들어오네
					return "admin/admin_min/adminmain_min";
				}
			}
			
			//로그아웃 처리
			@RequestMapping("/logout")
			public String logout(HttpSession session) {
				session.invalidate(); //세션무효화
				return "admin/admin_min/adminlogin_min.empty";
			}	
					
	
	//관리자 - 회원관리 - 등급관리 - 등급List
		@RequestMapping(value= {"/classForm"}, method=RequestMethod.GET)
		public String getClass(Model model, GradeVO_min vo, Paging paging) {
			paging.setPageUnit(5);
			// 페이지번호 파라미터
			if( paging.getPage() == 0) {
				paging.setPage(1); 
			}
			
			// 시작/마지막 레코드 번호
			vo.setFirst(paging.getFirst());
			vo.setLast(paging.getLast());
			
			//전체 건수
			paging.setTotalRecord(service2.classListCount(vo));
			
			//System.out.println("requestMapping"); //해당 메소드 이름 호출(getClassList가 적혀나옴)
			model.addAttribute("paging", paging );
			model.addAttribute("classList", service2.getClassList(vo));
			return "admin/admin_min/adminclass_min";
		}
		
	//관리자 - 회원관리 - 등급관리 - 등급수정
		@RequestMapping("/grade_update")
		public String grade_update(GradeVO_min vo,HttpServletRequest request) {
		String[] td_checkbox = request.getParameterValues("member_id");
			//	service.deleteBoard(vo);
			return "admin/admin_min/adminclass_min";
		}
		
		
		
	//관리자 - 회원관리 - 사용자관리
			@RequestMapping(value= {"/userForm"}, method=RequestMethod.GET)
			public String getClass(Model model, BlackListVO vo, Paging paging) {
				
				paging.setPageUnit(5);
				// 페이지번호 파라미터
				if( paging.getPage() == 0) {
					paging.setPage(1); 
				}
				
				// 시작/마지막 레코드 번호
				vo.setFirst(paging.getFirst());
				vo.setLast(paging.getLast());
				
				//전체 건수
				paging.setTotalRecord(service3.blackListCount(vo));
				model.addAttribute("blackList", service3.getBlackList(vo));
				model.addAttribute("paging", paging );
				return "admin/admin_min/adminuser_min";
			}
		
		
		
		
		
		
		
		
		
		
		
	//(유저)아콘결제페이지
	@RequestMapping(value= {"/acornForm"}, method=RequestMethod.GET)
	public String acornFrom() {
		return "min/useracorn_min";
	}
	
	//(관리자)회원관리 - 업로드한 리스트 뷰
	@RequestMapping(value= {"/uploadlistForm"}, method=RequestMethod.GET)
	public String uploadlistFrom() {
		return "admin/admin_min/adminuploadlist_min";
	}
}
