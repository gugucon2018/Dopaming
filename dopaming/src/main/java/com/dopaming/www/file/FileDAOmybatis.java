package com.dopaming.www.file;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class FileDAOmybatis {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public FileVO getFile(FileVO vo) {
		return mybatis.selectOne("FileDAO.getFile",vo);
	}
	
	public List<FileVO> getFileList(FileVO vo) {
		return mybatis.selectList("fileDAO.fileList",vo);
	}
	/*
	 * public List<FileVO> getFileList_k() { return
	 * mybatis.selectList("fileDAO.fileList"); } public List<FileVO> getFileList_f()
	 * { return mybatis.selectList("fileDAO.fileList"); }
	 */
	
	public Integer userCount() {
		return mybatis.selectOne("FileDAO.userCount");
	}
	
	/*
	 * public List<Map<String,Object>> getUserMap(FileVO vo) { return
	 * mybatis.selectList("UserDAO.getFileMap", vo); }
	 */
}
