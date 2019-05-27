package com.dopaming.www.admin.complain;

import java.util.List;

import com.dopaming.www.admin.boardlist.BoardListVO;
import com.dopaming.www.common.Paging;

public interface ComplainService {

	// 공지 등록
	void complain_insert(ComplainVO vo);
	
	// 게시판 목록 출력
	List<ComplainVO> complain_selectlist(ComplainVO vo);
	
	// 공지 페이징 건수 출력
	int complain_selectlist_cnt(ComplainVO vo);
}