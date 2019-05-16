package com.dopaming.www.login;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dopaming.www.login.*;;

@Repository
public class AdminDAOMybatis_min {
	@Autowired SqlSessionTemplate mybatis;
	
	//단건조회
	public MembersVO getMembers(MembersVO vo) {
		return mybatis.selectOne("MembersDAO.getMembers", vo);
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
