package com.dopaming.www.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
	
@Service("FileServiceHwan")
public class FileServiceImpl_Hwan implements FileService_Hwan{
	@Autowired
	private FileDAOMybatis_Hwan dao;

	@Override
	public void board_file_upload(FileBoardVO_Hwan bvo, FileUploadVO_Hwan fvo) {
		// TODO Auto-generated method stub
		dao.board_insert_hwan(bvo, fvo);
	}


}
