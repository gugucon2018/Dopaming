package com.dopaming.www.member;

import java.util.List;

public interface MyBoardService {
	//내가 받은 자료 조회
	public List<MyBoardVO> getDownList(MyBoardVO vo);
	//건수 조회
	public Integer getDownCount(MyBoardVO vo);
}
