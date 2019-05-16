package com.dopaming.www.login;

import java.util.List;
import java.util.Map;

import com.dopaming.www.login.MembersVO;;

public interface Adminservice_min {
	
	//CRUD 기능의 메소드 구현
	//회원 등록
	MembersVO getMembers(MembersVO vo);
//	List<MembersVO_min> getUserList();
//	public Integer userCount();
//	public List<Map<String,Object>> getUserMap(MembersVO_min vo);
}
