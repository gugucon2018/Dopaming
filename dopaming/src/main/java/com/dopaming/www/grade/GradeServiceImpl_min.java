package com.dopaming.www.grade;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dopaming.www.login.*;

@Service("gradeService")
public class GradeServiceImpl_min implements Gradeservice_min {
	
	//Autowired가 UserDAO 자체를 가져오는것(DAO에 repository로 연결해줬다)
	//@Autowired private UserDAOSpring userDAO;
	@Autowired private GradeDAOMybatis_min mambersDAO;

	//관리자 - 회원관리 - 등급관리 - 등급List
	@Override
	public List<GradeVO_min> getClassList(GradeVO_min vo){
		System.out.println("getClassList");
		return mambersDAO.getClassList(vo);
	}
	
//	public List<MembersVO_min> getUserList(){
//		return mambersDAO.getUserList();
//	}
//
//	@Override
//	public Integer userCount() {
//		// TODO Auto-generated method stub
//		return mambersDAO.userCount();
//	}
//
//	@Override
//	public List<Map<String, Object>> getUserMap(MembersVO_min vo) {
//		// TODO Auto-generated method stub
//		return mambersDAO.getUserMap(vo);
//	}
}
