package com.dopaming.www;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dopaming.www.common.Paging;
import com.dopaming.www.notice.NoticeService;
import com.dopaming.www.notice.NoticeVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class JoonController {
	
	private static final Logger logger = LoggerFactory.getLogger(JoonController.class);
	
	@Autowired
	NoticeService service;
	
	
	//공지 등록 뷰연결
	@RequestMapping(value = "/notice_insert", method = RequestMethod.GET)
	public String notice_insert(Locale locale, Model model) {
		return "admin/admin_joon/notice_insert_joon";
	}
	
	//공지 등록 입력값 받아와서 넘겨주기
	@RequestMapping(value="/notice_insert", method=RequestMethod.POST)//뷰에서 notice_insert의 값이 보내어지면
	public String notice_insert(NoticeVO vo, 
			HttpServletRequest request,HttpSession session,
			HttpServletResponse response) throws IOException{
		service.notice_insert(vo);
		if(vo == null ){
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('id error');");
				out.println("history.go(-1);"); //이전페이지로
				out.println("</script>");
			return "admin/admin_joon/notice_insert_joon";	
		}
		else {
			session.setAttribute("notice_title",vo.getNotice_title());
			session.setAttribute("notice_content",vo.getNotice_title());
			return "admin/admin_joon/notice_selectlist_joon";
		}
	}
	
	//공지 목록 뷰 연결
	@RequestMapping(value = "/notice_selectlist", method = RequestMethod.GET)
	public String notice_selectlist(Locale locale, Model model) {
		return "admin/admin_joon/notice_selectlist_joon";
	}
	
	//공지 목록 출력값 받아오기
		@RequestMapping("/notice_selectlist")
		public String notice_selectlist(Model model, Paging paging, NoticeVO vo) {
			// 페이징 처리

			// 전체건수
			//paging.setTotalRecord(service.(vo));

			model.addAttribute("list", service.notice_select(vo));
			return "admin/admin_joon/notice_selectlist_joon";
		}
	
	@RequestMapping(value = "/notice_select", method = RequestMethod.GET)
	public String notice_select(Locale locale, Model model) {
		return "joon/notice_select_joon";
	}
	
	@RequestMapping(value = "/notice_update", method = RequestMethod.GET)
	public String notice_update(Locale locale, Model model) {
		return "joon/notice_update_joon";
	}
	@RequestMapping(value = "/claim_insert", method = RequestMethod.GET)
	public String claim_insert(Locale locale, Model model) {
		return "joon/claim_insert_joon";
	}
	
	@RequestMapping(value = "/claim_select", method = RequestMethod.GET)
	public String claim_select(Locale locale, Model model) {
		return "joon/claim_select_joon";
	}
	
	@RequestMapping(value = "/board_selectlist", method = RequestMethod.GET)
	public String board_selectlist(Locale locale, Model model) {
		return "joon/board_selectlist_joon";
	}
	
	@RequestMapping(value = "/claim_qna_selectlist", method = RequestMethod.GET)
	public String claim_qna_selectlist(Locale locale, Model model) {
		return "joon/claim_qna_selectlist_joon";
	}
	
	@RequestMapping(value = "/claim_report_selectlist", method = RequestMethod.GET)
	public String claim_report_selectlist(Locale locale, Model model) {
		return "joon/claim_report_selectlist_joon";
	}
	
	@RequestMapping(value = "/claim_suggest_selectlist", method = RequestMethod.GET)
	public String claim_suggest_selectlist(Locale locale, Model model) {
		return "joon/claim_suggest_selectlist_joon";
	}
}
