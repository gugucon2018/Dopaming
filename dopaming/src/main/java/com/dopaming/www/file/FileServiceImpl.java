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
	public List<FileVO> getFileList() {
		System.out.println("getFileList");
		return dao.getFileList();
	}

	@Override
	public int getFileCount(FileVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
