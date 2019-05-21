package com.dopaming.www.grade;

import java.util.List;
import java.util.Map;

import com.dopaming.www.login.MembersVO_min;;

public interface Gradeservice_min {

	//관리자 - 회원관리 - 등급관리 - 등급List
	List<GradeVO_min> getClassList(GradeVO_min vo);
	
	//
	
}
