package com.dopaming.www.admin.login;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAOMybatis_min {
	@Autowired SqlSessionTemplate mybatis;
	
	//로그인
	public MembersVO_min getMembers(MembersVO_min vo) {
		return mybatis.selectOne("LoginMinDAO.getMembers", vo);
	}
//	//전체조회
//	public List<MembersVO_min> getUserList(){
//		return mybatis.selectList("UserDAO.getUserList");
//	}
//	
//	//user인원수
//	public Integer userCount() {
//		return mybatis.selectOne("UserDAO.userCount");
//	}
//	
//	//user인원수를 map으로
//	public List<Map<String,Object>> getUserMap(MembersVO_min vo){
//		return mybatis.selectList("UserDAO.getUserMap",vo);
//	}
}
