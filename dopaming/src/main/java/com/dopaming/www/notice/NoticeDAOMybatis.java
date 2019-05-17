package com.dopaming.www.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class NoticeDAOMybatis {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public void notice_insert(NoticeVO vo) {
		System.out.println("공지사항 입력 실행");
		mybatis.insert("NoticeDAO.notice_insert",vo);
	                                           //DTO(VO)에 순서대로 인서트 시킨다.
	}

}
