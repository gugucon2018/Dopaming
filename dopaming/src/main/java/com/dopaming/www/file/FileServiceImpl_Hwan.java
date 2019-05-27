package com.dopaming.www.file;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
	
@Service("FileServiceHwan")
public class FileServiceImpl_Hwan implements FileService_Hwan{
	@Autowired
	private FileDAOMybatis_Hwan dao;

	//파일 업로드
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

	//게시글 열람
	@Override
	public FilePostVO_Hwan select_post_hwan(FilePostVO_Hwan fpvo) {
		// TODO Auto-generated method stub		
		return dao.select_post_hwan(fpvo);
	}

	//게시글 파일 리스트 열람
	@Override
	public List<FilePostVO_Hwan> select_post_fileList(FilePostVO_Hwan fpvo) {
		// TODO Auto-generated method stub		
		return dao.select_post_fileList(fpvo);
	}

	//게시글에 게시글 리스트 열람
	@Override
	public List<FilePostVO_Hwan> select_board_boardList(FilePostVO_Hwan fpvo) {
		// TODO Auto-generated method stub		
		return dao.select_board_boardList(fpvo);
	}

	//게시글 페이징
	@Override
	public int board_Paging() {
		// TODO Auto-generated method stub		
		return dao.board_Paging();
	}		
}
