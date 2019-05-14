package com.yedam.www.min;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOMybatis {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public void adminlogin(MembersVO vo) {
		System.out.println("mybatis adminlogin실행");
		mybatis.insert("BoardDAO.insertBoardProcedure",vo);
	}
}
