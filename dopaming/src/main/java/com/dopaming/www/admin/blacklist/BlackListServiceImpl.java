package com.dopaming.www.admin.blacklist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dopaming.www.admin.grade.GradeVO_min;

@Service("blackListService")
public class BlackListServiceImpl implements BlackListservice {
	
	@Autowired private BlackDAOMybatis blacklistDAO;

	//블랙회원 출력 + 검색
	@Override
	public List<BlackListVO> getBlackList(BlackListVO vo) {
		return blacklistDAO.getBlackList(vo);
	}
	
	//블랙회원 카운트
	@Override
	public int blackListCount(BlackListVO vo) {
		return blacklistDAO.blackListCount(vo);
	}

	//블랙회원에서 삭제
	@Override
	public void blackListDelete(BlackListVO vo) {
		blacklistDAO.blackListDelete(vo);
	}
}
