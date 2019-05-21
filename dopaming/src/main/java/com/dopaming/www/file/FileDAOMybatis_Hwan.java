package com.dopaming.www.file;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAOMybatis_Hwan {
	@Autowired
	SqlSessionTemplate mybatis;
	
	//파일 등록
	public void file_insert_hwan(FileUploadVO_Hwan vo) {
		System.out.println("파일 등록 성공");
		mybatis.insert("FileDAOHwan.");
	}
}
