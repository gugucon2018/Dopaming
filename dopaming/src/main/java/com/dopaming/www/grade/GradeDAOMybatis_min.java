package com.dopaming.www.grade;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dopaming.www.grade.GradeVO_min;
import com.dopaming.www.login.*;;

@Repository
public class GradeDAOMybatis_min {
	@Autowired SqlSessionTemplate mybatis;

	// 관리자 - 회원관리 - 등급관리 - 등급select
	//전체조회
	public List<GradeVO_min> getClassList(){
		System.out.println("GradeMinDAO");
		return mybatis.selectList("GradeMinDAO.classList");
	}
}
