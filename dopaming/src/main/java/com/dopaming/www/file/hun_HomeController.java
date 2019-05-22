package com.dopaming.www.file;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dopaming.www.common.Paging;

/**
 * Handles requests for the application home page.
 */
@Controller
public class hun_HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(hun_HomeController.class);
	
	@Autowired
	FileService service;
	
	@RequestMapping(value = "/mdview", method = RequestMethod.GET)
	public String hwan(Model model,FileVO vo, Paging paging) {
		model.addAttribute("list", service.getFileList(vo));
		model.addAttribute("small", vo.getCategory_small());
		model.addAttribute("big", vo.getCategory_big());
		// 페이징 처리
				paging.setPageUnit(10); // 개당 출력건수
				// 시작페이지 설정
				if (paging.getPage() == 0) {
					paging.setPage(1);
				}
				// 돌려주는 값(전체레코드)이 페이징vo에 셋팅이된다.
				paging.setTotalRecord(service.fileList_cnt());
				// db에서 받은 정보로 페이지마다 시작/마지막 레코드 번호
				vo.setFirst(paging.getFirst());
				vo.setLast(paging.getLast());
				// 페이징 VO의 데이터를 paging으로 담아둔다.
				model.addAttribute("paging", paging);
				// 돌려 받은 값들을 list에 받아둔다.
				model.addAttribute("list", service.getFileList(vo));
		return "hun/mdview_hun";
	}
}
