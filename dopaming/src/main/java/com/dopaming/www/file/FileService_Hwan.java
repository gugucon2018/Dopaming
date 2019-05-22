package com.dopaming.www.file;

public interface FileService_Hwan {
	
	//파일 업로드
	public void file_upload(FileUploadVO_Hwan vo);
	
	//게시판 업로드
	public void board_upload(FileBoardVO_Hwan vo);
	
	//파일 view 조회
	public FileBoardVO_Hwan board_select();
	
	//파일 다운로드
	public FileDownloadVO_Hwan file_download(FileDownloadVO_Hwan vo);
	
}
