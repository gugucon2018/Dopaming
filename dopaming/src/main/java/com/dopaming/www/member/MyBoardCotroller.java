package com.dopaming.www.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dopaming.www.common.Paging;

@Controller
@RequestMapping(value="/mypage")
public class MyBoardCotroller {
	
	@Autowired
	private MyBoardService service;
	
	//마이페이지(내가 받은 자료)
	@RequestMapping(value ="/myDown", method = RequestMethod.GET )
	public String getDownList(MyBoardVO vo, Paging paging, Model model, HttpSession session) {
		//세션에서 아이디정보값 가져오기
		String id = (String)session.getAttribute("Id");
		vo.setMember_id(id);
		
		//페이징 처리
		//페이지번호 파라미터
		if(paging.getPage() == 0) {
			paging.setPage(1);
		}
		
		//시작/마지막 레코드 번호
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		
		//전체건수
		paging.setTotalRecord(service.getDownCount(vo));
		
		model.addAttribute("paging",paging);
		model.addAttribute("list",service.getDownList(vo));
		return "mypage_hong/mydown";
	}
}
