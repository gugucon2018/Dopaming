package com.dopaming.www.admin.login;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dopaming.www.grade.GradeDAOMybatis_min;
import com.dopaming.www.grade.GradeVO_min;

@Service("userService")
public class LoginServiceImpl_min implements Loginservice_min {
	
	//Autowired가 UserDAO 자체를 가져오는것(DAO에 repository로 연결해줬다)
	//@Autowired private UserDAOSpring userDAO;
	@Autowired private LoginDAOMybatis_min mambersDAO;
	
	//로그인
	public MembersVO_min getMembers(MembersVO_min vo) {
		return mambersDAO.getMembers(vo);
	}
}
