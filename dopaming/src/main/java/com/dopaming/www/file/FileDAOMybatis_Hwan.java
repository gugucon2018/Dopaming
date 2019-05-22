package com.dopaming.www.file;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAOMybatis_Hwan {
	@Autowired
	SqlSessionTemplate mybatis;
	
	//게시글 등록
	public void board_insert_hwan(FileBoardVO_Hwan vo) {
		System.out.println("게시글 등록 성공");
		mybatis.insert("FileDAOHwan.board_insert_hwan", vo);
	}
	//파일 등록
	public void file_insert_hwan(FileUploadVO_Hwan vo) {
		System.out.println("파일 등록 성공");
		mybatis.insert("FileDAOHwan.file_insert_hwan", vo);
	}	
}
