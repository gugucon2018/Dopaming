package com.dopaming.www.file;

import java.util.List;

public interface FileService_Hwan {
	
	public void board_file_upload(FileBoardVO_Hwan bvo, List<FileUploadVO_Hwan> fvolist);
	
	public FilePostVO_Hwan select_post_hwan(FilePostVO_Hwan fpvo);
	
	public List<FilePostVO_Hwan> select_post_fileList(FilePostVO_Hwan fpvo);
	
	public List<FilePostVO_Hwan> select_board_boardList(FilePostVO_Hwan fpvo);
	
	public int board_Paging();
}
