package com.dopaming.www.file;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAOMybatis_Hwan {
	@Autowired
	SqlSessionTemplate mybatis;
	
	//게시글, 파일 등록 ==> 트랜잭션 롤백 가능
	public void board_insert_hwan(FileBoardVO_Hwan bvo,FileUploadVO_Hwan fvo) {
		System.out.println("게시글 등록 성공");
		mybatis.insert("FileDAOHwan.board_insert_hwan", bvo);
		mybatis.insert("FileDAOHwan.file_insert_hwan", fvo);
	}
}
