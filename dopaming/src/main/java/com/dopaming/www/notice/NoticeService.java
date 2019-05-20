package com.dopaming.www.notice;

import java.util.List;

public interface NoticeService {

	// 공지 등록
	void notice_insert(NoticeVO vo);
	
	//공지 단건 출력
	NoticeVO notice_select(NoticeVO vo);

	// 공지 목록 출력
	List<NoticeVO> notice_selectlist();
	

}