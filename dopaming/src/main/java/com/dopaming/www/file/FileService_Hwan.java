package com.dopaming.www.file;

import java.util.List;

public interface FileService_Hwan {
	
	/*
	 * //게시글 업로드 public void board_insert_hwan(FileBoardVO_Hwan bvo);
	 * 
	 * //파일 업로드 public void file_insert_hwan(FileUploadVO_Hwan fvo);
	 */
	
	public void board_file_upload(FileBoardVO_Hwan bvo, List<FileUploadVO_Hwan> fvolist);
}
