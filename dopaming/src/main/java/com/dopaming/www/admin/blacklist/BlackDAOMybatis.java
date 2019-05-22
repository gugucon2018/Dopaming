package com.dopaming.www.admin.blacklist;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dopaming.www.admin.grade.GradeVO_min;

@Repository
public class BlackDAOMybatis {
	@Autowired SqlSessionTemplate mybatis;
	
	//블랙리스트 출력
	public List<BlackListVO> getBlackList(BlackListVO vo){
		return mybatis.selectList("BlackListMinDAO.getblackList",vo);
	}
	
	public int blackListCount(BlackListVO vo) {
		return mybatis.selectOne("BlackListMinDAO.blackListCount",vo);
	}
}
