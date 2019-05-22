package com.dopaming.www.file;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping(value = "/upload_view", method = RequestMethod.GET)
	public String upload_hwan(Locale locale, Model model) {	
		
		return "hwan/upload_hwan";
	}	
	@RequestMapping(value = "/board_file_upload", method = RequestMethod.POST)
	public String board_file_upload(FileBoardVO_Hwan bvo, FileUploadVO_Hwan fvo,
			HttpServletRequest request, HttpSession session,
			HttpServletResponse response) {
		
		service.board_upload(bvo);
		if(fvo!=null)
		service.file_upload(fvo);
		
		return "hwan/file_post_hwan";
	}

	@RequestMapping(value = "/request_upload", method = RequestMethod.GET)
	public String requestUpload_hwan(MultipartHttpServletRequest mtfRequest) {	
		List<MultipartFile> fileList=mtfRequest.getFiles("file");
		String path ="./resources/images/";
		for(MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename();//원본 파일명
			long fileSize=mf.getSize();//파일 사이즈
			System.out.println("originalFileName : "+originFileName);//원본 파일명 출력 
			System.out.println("fileSize : "+fileSize);//파일 사이즈 출력
			String safeFile = path+System.currentTimeMillis()+originFileName;
			try {
				mf.transferTo(new File(safeFile));
			} catch(IllegalStateException e) {
				e.printStackTrace();
			} catch(IOException e) {
				e.printStackTrace();
			}
		}		
		return "hwan/file_post_hwan";
	}	
	
	@RequestMapping(value = "/download_hwan", method = RequestMethod.GET)
	public String download_hwan(Locale locale, Model model) {
		return "hwan/download_hwan";
	}	
	
	@RequestMapping(value = "/filepost", method = RequestMethod.GET)
	public String filepost_hwan(Locale locale, Model model) {
		
		return "hwan/file_post_hwan";
	}	
}
