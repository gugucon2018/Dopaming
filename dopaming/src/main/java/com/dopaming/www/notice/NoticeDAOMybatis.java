package com.dopaming.www.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




@Repository
public class NoticeDAOMybatis {

	@Autowired
	SqlSessionTemplate mybatis;
	
	//공지사항 입력 실행
	public void notice_insert(NoticeVO vo) {
		System.out.println("공지사항 입력 실행");
		mybatis.insert("NoticeDAO.notice_insert",vo);
	                                           //DTO(VO)에 순서대로 인서트 시킨다.
	}
	
	//공지사항 목록 출력
	public List<NoticeVO> notice_select(NoticeVO vo) {
		System.out.println("공지사항 목록 실행");
		return mybatis.selectList("NoticeDAO.notice_select",vo);
	}
	
	//페이징 건수 
		public int notice_select_cnt(NoticeVO vo) {
			return mybatis.selectOne("NoticeDAO.notice_select_cnt", vo);
		}

}
