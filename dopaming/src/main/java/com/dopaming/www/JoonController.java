package com.dopaming.www;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.ServletException;
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

import com.dopaming.www.admin.boardlist.BoardListService;
import com.dopaming.www.admin.boardlist.BoardListVO;
import com.dopaming.www.common.Paging;
import com.dopaming.www.notice.NoticeService;
import com.dopaming.www.notice.NoticeVO;

@Controller
public class JoonController {

	private static final Logger logger = LoggerFactory.getLogger(JoonController.class);

	@Autowired NoticeService service;
	@Autowired BoardListService BoardList_service;

	// 공지 등록 뷰연결
	@RequestMapping(value = "/notice_insert", method = RequestMethod.GET)
	public String notice_insert(Locale locale, Model model) {
		return "admin/admin_joon/notice_insert_joon";
	}

	// 공지 등록 입력값 받아와서 넘겨주기
	@RequestMapping(value = "/notice_insert", method = RequestMethod.POST) // 뷰에서 notice_insert의 값이 보내어지면
	public String notice_insert(NoticeVO vo, Model model, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws IOException {
		//vo를 불러온다
		service.notice_insert(vo);
		
		if (vo == null) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('id error');");
			out.println("history.go(-1);"); // 이전페이지로
			out.println("</script>");
			return "admin/admin_joon/notice_insert_joon";
		} else {
			// 돌아갈 화면
			return "redirect:/notice_selectlist";
		}
	}

	// 공지 목록 출력값 받아오기
	@RequestMapping("/notice_selectlist")
	public String notice_selectlist(Model model, Paging paging, NoticeVO vo) {

		// 페이징 처리
		paging.setPageUnit(5); // 개당 출력건수
		// 시작페이지 설정
		if (paging.getPage() == 0) {
			paging.setPage(1);
		}
		// 돌려주는 값(전체레코드)이 페이징vo에 셋팅이된다.
		paging.setTotalRecord(service.notice_selectlist_cnt());
		// db에서 받은 정보로 페이지마다 시작/마지막 레코드 번호
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		// 페이징 VO의 데이터를 paging으로 담아둔다.
		model.addAttribute("paging", paging);
		// 돌려 받은 값들을 list에 받아둔다.
		model.addAttribute("list", service.notice_selectlist(vo));
		return "admin/admin_joon/notice_selectlist_joon";
	}

	// 공지사항 뷰
	@RequestMapping(value = "/notice_select") // 뷰에서 notice_select의 값이 보내어지면
	public String notice_select(NoticeVO vo, Model model, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws IOException {
		service.notice_select(vo);

		// 돌려 받은 값들을 notice에 받아둔다.
		model.addAttribute("notice", service.notice_select(vo));
		// 돌아가는 페이지
		return "admin/admin_joon/notice_select_joon";
	}

	// 공지 단건 삭제
	@RequestMapping("/notice_delete")
	public String notice_delete(NoticeVO vo) {
		service.notice_delete(vo);
		return "redirect:notice_selectlist";
	}

	// 선택 삭제
	@RequestMapping("/notice_deletelist")
	public String notice_deletelist(NoticeVO vo, HttpServletRequest request) throws ServletException, IOException {
		// jsp에서 배열값 받는 함수
		String[] td_checkbox = request.getParameterValues("td_checkbox");
		// 받은 배열을 푼다
		for (String n : td_checkbox) {
			try {
				// string를 int로 바꾼뒤 dao로 하나씩 넘긴다.
				vo.setNotice_no(Integer.parseInt(n));
				service.notice_delete(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:notice_selectlist";
	}

	//수정폼으로 이동하기
	@RequestMapping(value = "/notice_update_form", method = RequestMethod.GET) public
	  String notice_update(NoticeVO vo, Model model) { 
		
		//JSP에서 넘어온값(VO)를 다시 수정폼화면에 뿌리기위해서 모델에 notice로 담아둔다.
		model.addAttribute("notice", vo);
		//돌아갈 페이지
		return "admin/admin_joon/notice_update_joon"; 
		}
	
	//공지사항 수정하기
		@RequestMapping(value = "/notice_update", method = RequestMethod.POST) // 뷰에서 notice_update의 값이 보내어지면
		public String notice_update(NoticeVO vo, Model model,   
				HttpServletResponse response) throws IOException {
			
			System.out.println(vo);

			//service의 notice_update를 실행시킨다.
			service.notice_update(vo);
			if (vo == null) {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('id error');");
				out.println("history.go(-1);"); // 이전페이지로
				out.println("</script>");
				return "admin/admin_joon/notice_update_joon";
			} else {
				// 돌아갈 화면
				return "redirect:notice_selectlist";
			}
		}
		
	//게시판 목록 연결
		
		@RequestMapping("/boardList")
		public String boardList(Model model, Paging paging, BoardListVO vo) {

			// 페이징 처리
			paging.setPageUnit(5); // 개당 출력건수
			// 시작페이지 설정
			if (paging.getPage() == 0) {
				paging.setPage(1);
			}
			// 돌려주는 값(전체레코드)이 페이징vo에 셋팅이된다.
			paging.setTotalRecord(BoardList_service.boardList_select_cnt());
			// db에서 받은 정보로 페이지마다 시작/마지막 레코드 번호
			vo.setFirst(paging.getFirst());
			vo.setLast(paging.getLast());
			// 페이징 VO의 데이터를 paging으로 담아둔다.
			model.addAttribute("paging", paging);
			// 돌려 받은 값들을 list에 받아둔다.
			model.addAttribute("list", BoardList_service.boardList_select(vo));
			return "admin/admin_joon/boardList_joon";
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
