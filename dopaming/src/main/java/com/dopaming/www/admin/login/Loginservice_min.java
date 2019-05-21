package com.dopaming.www.admin.login;

import java.util.List;
import java.util.Map;

import com.dopaming.www.admin.login.MembersVO_min;
import com.dopaming.www.grade.GradeVO_min;;

public interface Loginservice_min {
	
	//CRUD 기능의 메소드 구현
	//로그인
	MembersVO_min getMembers(MembersVO_min vo);
//	List<MembersVO_min> getUserList();
//	public Integer userCount();
//	public List<Map<String,Object>> getUserMap(MembersVO_min vo);
}
