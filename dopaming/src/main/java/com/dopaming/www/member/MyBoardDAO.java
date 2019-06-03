package com.dopaming.www.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyBoardDAO {

	//SqlSessionTemplate객체가 모든 JDBC처리를 대신 해줌
	@Autowired
	SqlSessionTemplate mybatis;
	
	//내가 받은 자료 조회
	public List<MyBoardVO> getDownList(MyBoardVO vo){
		System.out.println("===> Mybatis로  getDownList() 기능 처리");
		return mybatis.selectList("MyBoardDAO.getDownList",vo);
	}
	
	//건수 조회
	public Integer getDownCount(MyBoardVO vo) {
		System.out.println("===> Mybatis로 getDownCount() 기능 처리");
		return mybatis.selectOne("MyBoardDAO.getDownCount", vo);
	}
}
