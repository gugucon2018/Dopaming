package com.dopaming.www.admin.blacklist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dopaming.www.admin.grade.GradeVO_min;

@Service("blackListService")
public class BlackListServiceImpl implements BlackListservice {
	
	@Autowired private BlackDAOMybatis blacklistDAO;

	@Override
	public List<BlackListVO> getBlackList(BlackListVO vo) {
		return blacklistDAO.getBlackList(vo);
	}

	@Override
	public int blackListCount(BlackListVO vo) {
		return blacklistDAO.blackListCount(vo);
	}
}
