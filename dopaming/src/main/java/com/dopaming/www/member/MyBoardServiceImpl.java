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
		return dao.getDownCount(vo);
	}

	@Override
	public List<FileUploadVO> getUploadList(FileUploadVO vo) {
		return dao.getUploadList(vo);
	}

	@Override
	public Integer getUploadCount(FileUploadVO vo) {
		return dao.getUploadCount(vo);
	}

}
