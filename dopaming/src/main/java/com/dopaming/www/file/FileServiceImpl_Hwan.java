package com.dopaming.www.file;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
	
@Service("FileServiceHwan")
public class FileServiceImpl_Hwan implements FileService_Hwan{
	@Autowired
	private FileDAOMybatis_Hwan dao;
	/*
	 * @Override public void board_insert_hwan(FileBoardVO_Hwan bvo) { // TODO
	 * Auto-generated method stub dao.board_insert_hwan(bvo); }
	 * 
	 * @Override public void file_insert_hwan(FileUploadVO_Hwan fvo) { // TODO
	 * Auto-generated method stub dao.file_insert_hwan(fvo); }
	 */		

	@Override
	public void board_file_upload(FileBoardVO_Hwan bvo, List<FileUploadVO_Hwan> fvolist) {
		// TODO Auto-generated method stub
		dao.board_insert_hwan(bvo);
		for(int i=0;i<fvolist.size();i++) {
			FileUploadVO_Hwan fvo = fvolist.get(i);
			fvo.setGroupNo(bvo.getBoardNo());
			fvo.setMemberId(bvo.getMemberId());
			dao.file_insert_hwan(fvo);
		}
	}
}
