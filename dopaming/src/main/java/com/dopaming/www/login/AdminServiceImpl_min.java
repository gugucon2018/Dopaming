package com.dopaming.www.login;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dopaming.www.login.*;

@Service("userService")
public class AdminServiceImpl_min implements Adminservice_min {
	
	//Autowired가 UserDAO 자체를 가져오는것(DAO에 repository로 연결해줬다)
	//@Autowired private UserDAOSpring userDAO;
	@Autowired private AdminDAOMybatis_min mambersDAO;

	public MembersVO_min getMembers(MembersVO_min vo) {
		return mambersDAO.getMembers(vo);
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
