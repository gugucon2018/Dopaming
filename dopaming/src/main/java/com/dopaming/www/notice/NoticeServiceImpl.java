package com.dopaming.www.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("NoticeService") //서비스 등록
public class NoticeServiceImpl implements NoticeService {

	/*
	 * @Autowired//인젝션//DAO부르는것 BoardDAO dao;
	 */	
	
	@Autowired NoticeDAOMybatis dao;
			
	@Override//DAO를 불러쓰는것
	public void notice_insert(NoticeVO vo) {
		//around AOP 트랜잭션처리
		dao.notice_insert(vo);
		//commit
	}
}
