package com.dopaming.www.admin.complain;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dopaming.www.common.Paging;


@Service("ComplainService") //서비스 등록
public class ComplainServiceImpl implements ComplainService {

	//인젝션//NoticeDAOMybatis(DAO)부르는것 
	@Autowired ComplainDAOMybatis dao;
	
	//공지 입력
	@Override//상속받는것
	public void complain_insert(ComplainVO vo) {
		//around AOP 트랜잭션처리
		dao.complain_insert(vo); 
		//commit
	}
	
}
