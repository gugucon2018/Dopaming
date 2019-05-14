package com.yedam.www.min;

import java.util.List;
import java.util.Map;

import com.yedam.www.min.MembersVO;

public interface Membersservice {
	
	//CRUD 기능의 메소드 구현
	//회원 등록
	MembersVO getMembers(MembersVO vo);
	List<MembersVO> getMembersList();
	public Integer MembersCount();
	public List<Map<String,Object>> getMembersMap(MembersVO vo);
}
