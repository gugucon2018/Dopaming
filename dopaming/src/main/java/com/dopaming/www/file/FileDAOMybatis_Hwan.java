package com.dopaming.www.file;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAOMybatis_Hwan {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public void board_insert_hwan(FileBoardVO_Hwan bvo) {
		System.out.println("게시글 등록 성공");
		mybatis.insert("FileDAOHwan.board_insert_hwan", bvo);
	}
	
	public void file_insert_hwan(FileUploadVO_Hwan fvo) {
		System.out.println("파일 등록 성공");
		mybatis.insert("FileDAOHwan.file_insert_hwan" , fvo);
	}	
	
	public FilePostVO_Hwan select_post_hwan(FilePostVO_Hwan fpvo) {
		System.out.println("게시글 조회 성공");
		return mybatis.selectOne("FileDAOHwan.filePost_hwan", fpvo);
	}
}
