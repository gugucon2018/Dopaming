package com.dopaming.www.file;

import java.util.List;

public interface FileService {
	
	//글 등록
	void insertFile(FileVO vo);
	
	// 글 수정
	void updateFile(FileVO vo);
	
	// 글 삭제
	void deleteFile(FileVO vo);

		// 파일 상세 조회
	FileVO getFile(FileVO vo);

		// 파일 목록 조회
	List<FileVO> getFileList();
		
	public int getFileCount(FileVO vo);


}
