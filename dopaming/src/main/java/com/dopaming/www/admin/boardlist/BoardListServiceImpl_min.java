package com.dopaming.www.admin.boardlist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dopaming.www.common.Paging;


@Service //서비스 등록
public class BoardListServiceImpl_min implements BoardListService_min {

	@Autowired BoardListDAOMybatis_min dao;
	
	@Override
	public List<BoardListVO_min> getuploadList(BoardListVO_min vo) {
		return dao.getuploadList(vo);
	}

	@Override
	public int uploadListCount(BoardListVO_min vo) {
		return dao.uploadListcount(vo);
	}
	
	
}
