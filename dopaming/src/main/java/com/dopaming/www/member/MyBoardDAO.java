package com.dopaming.www.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyBoardDAO {

	//SqlSessionTemplate객체가 모든 JDBC처리를 대신 해줌
	@Autowired
	SqlSessionTemplate mybatis;
	
	//내가 받은 자료 조회
	public List<MyBoardVO> getDownList(MyBoardVO vo){
		System.out.println("===> Mybatis로  getDownList() 기능 처리");
		return mybatis.selectList("MyBoardDAO.getDownList", vo);
	}
	
	//건수 조회(내가 받은 자료)
	public Integer getDownCount(MyBoardVO vo) {
		System.out.println("===> Mybatis로 getDownCount() 기능 처리");
		return mybatis.selectOne("MyBoardDAO.getDownCount", vo);
	}
	
	//업로드 관리
	public List<FileUploadVO> getUploadList(FileUploadVO vo){
		System.out.println("===> Mybatis로 getUploadList() 기능 처리");
		return mybatis.selectList("MyBoardDAO.getUploadList", vo);
	}
	
	//건수 조회(업로드 관리)
	public Integer getUploadCount(FileUploadVO vo) {
		System.out.println("===> Mybatis로 getDownCount() 기능 처리");
		return mybatis.selectOne("MyBoardDAO.getDownCount", vo);
	}
	
	//게시글 삭제
	public void deleteBoard(FileUploadVO vo) {
		System.out.println("===> Mybatis로 deleteBoard() 기능 처리");
		mybatis.delete("MyBoardDAO.deleteBoard",vo);
	}
	
	//업로드 파일 삭제
	public void deleteUpload(FileUploadVO vo) {
		System.out.println("===> Mybatis로 deleteUpload() 기능 처리");
		mybatis.delete("MyBoardDAO.deleteUpload", vo);
	}
	
	//댓글 삭제
	public void deleteComments(FileUploadVO vo) {
		System.out.println("===> Mybatis로 deleteComments() 기능 처리");
		mybatis.delete("MyBoardDAO.deleteComments", vo);
	}
}
