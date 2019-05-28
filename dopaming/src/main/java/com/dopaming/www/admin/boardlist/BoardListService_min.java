package com.dopaming.www.admin.boardlist;

import java.util.List;

import com.dopaming.www.common.Paging;

public interface BoardListService_min {

	// 관리자 -  회원관리  - 업로드만 리스트 뷰
	List<BoardListVO_min> getuploadList(BoardListVO_min vo);
	
	// 관리자 -  회원관리  - 업로드만 리스트 뷰 건수
	public int uploadListCount(BoardListVO_min vo);
}