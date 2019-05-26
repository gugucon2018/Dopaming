package com.dopaming.www.file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class FileController_Hwan {
	private static final Logger logger = LoggerFactory.getLogger(FileController_Hwan.class);
	
	
	@Autowired
	FileService_Hwan service;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/fileUploadForm_Hwan", method = RequestMethod.GET)
	public String upload_hwan(Locale locale, Model model) {	
		
		return "hwan/upload_hwan";
	}	

	@RequestMapping(value = "/request_upload", method = RequestMethod.POST)
	public String requestUpload_hwan(
			MultipartHttpServletRequest request,
			FileBoardVO_Hwan bvo) throws IllegalStateException, IOException {				
		List<MultipartFile> files = request.getFiles("fileName");		
		String filePath=request.getSession().getServletContext().getRealPath("/resources/upload");
		File file = new File(filePath);
		List<FileUploadVO_Hwan> fvolist = new ArrayList<FileUploadVO_Hwan>();
		FileUploadVO_Hwan fvo;
		for(int i=0;i<files.size();i++) {
			System.out.println(files.get(i).getOriginalFilename()+"업로드");
			//파일 업로드 소스 여기에 삽입
			file = new File(filePath,files.get(i).getOriginalFilename());
			files.get(i).transferTo(file);
			fvo=new FileUploadVO_Hwan();
			fvo.setFileName(file.getName());
			fvo.setFileStorage((double)file.length()/1024/1024);			
			fvolist.add(fvo);
		}	
		service.board_file_upload(bvo,fvolist);
	
		return "hwan/file_post_hwan";
	}	

	@RequestMapping(value = "/download_hwan", method = RequestMethod.GET)
	public String download_hwan(Locale locale, Model model) {
		return "hwan/download_hwan";
	}	
	
	@RequestMapping(value = "/filepost", method = RequestMethod.GET)
	public String filepost_hwan(FilePostVO_Hwan fpvo, Model model ) {
		model.addAttribute("filePost",service.select_post_hwan(fpvo));		
		System.out.println(fpvo.getBoard_no()+" 게시판 번호");
		return "hwan/file_post_hwan";
	}	
}
