package com.dopaming.www.file;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("fileService")
public class FileServiceImpl implements FileService {

	@Autowired
	FileDAOmybatis dao;
	
	@Override
	public void insertFile(FileVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateFile(FileVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFile(FileVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public FileVO getFile(FileVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FileVO> getFileList(FileVO vo) {
		System.out.println("getFileList");
		return dao.getFileList(vo);
	}
	@Override 
	public int fileList_cnt() {
		return dao.fileList_cnt();
	}
	/*
	 * @Override public List<FileVO> getFileList_k() {
	 * System.out.println("getFileList_k"); return dao.getFileList_k(); }
	 * 
	 * @Override public List<FileVO> getFileList_f() {
	 * System.out.println("getFileList_f"); return dao.getFileList_f(); }
	 */

	@Override
	public int getFileCount(FileVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
