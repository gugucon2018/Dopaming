package com.dopaming.www.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("FileServiceHwan")
public class FileServiceImpl_Hwan implements FileService_Hwan{
	@Autowired
	private FileDAOMybatis_Hwan dao;

	//파일 업로드
	@Override
	public void file_upload(FileUploadVO_Hwan vo) {
		// TODO Auto-generated method stub
		dao.file_insert_hwan(vo);
	}

	//게시글 업로드
	@Override
	public void board_upload(FileBoardVO_Hwan vo) {
		// TODO Auto-generated method stub
		dao.board_insert_hwan(vo);
	}

	@Override
	public FileBoardVO_Hwan board_select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FileDownloadVO_Hwan file_download(FileDownloadVO_Hwan vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
