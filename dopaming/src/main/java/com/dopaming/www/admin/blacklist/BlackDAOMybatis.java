package com.dopaming.www.admin.blacklist;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dopaming.www.admin.grade.GradeVO_min;

@Repository
public class BlackDAOMybatis {
	@Autowired SqlSessionTemplate mybatis;
	
	//블랙회원 출력
	public List<BlackListVO> getBlackList(BlackListVO vo){
		return mybatis.selectList("BlackListMinDAO.getblackList",vo);
	}
	//블랙회원 카운트
	public int blackListCount(BlackListVO vo) {
		return mybatis.selectOne("BlackListMinDAO.blackListCount",vo);
	}
	//블랙회원에서 삭제
	public void blackListDelete(BlackListVO vo) {
		mybatis.delete("BlackListMinDAO.blackListDelete",vo);
	}
	
	//일반회원 출력
	public List<BlackListVO> getNormalList(BlackListVO vo){
		return mybatis.selectList("BlackListMinDAO.getnormalList",vo);
	}
}
