package com.dopaming.www.admin.complain;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dopaming.www.admin.boardlist.BoardListVO;
import com.dopaming.www.common.Paging;

@Repository
public class ComplainDAOMybatis {

	@Autowired
	SqlSessionTemplate mybatis;
	
	//신고 입력
	public void complain_insert(ComplainVO vo) { //조건 값이 들어오면
		System.out.println("고객센터 입력 실행");
		//매퍼실행
		mybatis.insert("ComplainDAO.complain_insert",vo);
	}
	
	//고객센터 목록 출력
	public List<ComplainVO> complain_selectlist(ComplainVO vo) {
		System.out.println("고객센터 목록 실행");
		// 매핑실행과 동시에 결과값을 List<ComplainVO>에 받아온다.
		return mybatis.selectList("ComplainDAO.complain_selectlist", vo);
	}
	
	//페이징 건수 
	public int complain_selectlist_cnt(ComplainVO vo) {
		return mybatis.selectOne("ComplainDAO.complain_selectlist_cnt", vo);
	}


}
