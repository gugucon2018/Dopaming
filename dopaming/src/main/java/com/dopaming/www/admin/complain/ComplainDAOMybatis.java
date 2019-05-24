package com.dopaming.www.admin.complain;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dopaming.www.common.Paging;

@Repository
public class ComplainDAOMybatis {

	@Autowired
	SqlSessionTemplate mybatis;
	
	//신고 입력
	public void complain_insert(ComplainVO vo) { //조건 값이 들어오면
		System.out.println("고객센터 입력 실행");
		//매퍼실행
		mybatis.insert("ComplainDAO.complain_insert",vo);
	}
	


}
