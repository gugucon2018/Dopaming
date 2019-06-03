package com.dopaming.www.member;

import java.util.List;

public interface MyBoardService {
	//내가 받은 자료 조회
	public List<MyBoardVO> getDownList(MyBoardVO vo);
	//건수 조회(내가 받은 자료)
	public Integer getDownCount(MyBoardVO vo);
	//업로드 관리
	public List<FileUploadVO> getUploadList(FileUploadVO vo);
	//건수 조회(업로드 관리)
	public Integer getUploadCount(FileUploadVO vo);
	//게시물 삭제
	public void deleteBoard(FileUploadVO vo);
}
