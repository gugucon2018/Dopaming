package com.dopaming.www.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("myBoardService")
public class MyBoardServiceImpl implements MyBoardService {

	@Autowired
	private MyBoardDAO dao;
	
	@Override
	public List<MyBoardVO> getDownList(MyBoardVO vo) {
		return dao.getDownList(vo);
	}

	@Override
	public Integer getDownCount(MyBoardVO vo) {
		// TODO Auto-generated method stub
		return dao.getDownCount(vo);
	}

}
