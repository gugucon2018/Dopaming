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

import com.dopaming.www.common.Paging;

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
	public String requestUpload_hwan(MultipartHttpServletRequest request, FileBoardVO_Hwan bvo)
			throws IllegalStateException, IOException {
		List<MultipartFile> files = request.getFiles("fileName");
		String filePath = request.getSession().getServletContext().getRealPath("/resources/upload");
		File file = new File(filePath);
		List<FileUploadVO_Hwan> fvolist = new ArrayList<FileUploadVO_Hwan>();
		FileUploadVO_Hwan fvo;
		for (int i = 0; i < files.size(); i++) {
			System.out.println(files.get(i).getOriginalFilename() + "업로드");
			// 파일 업로드 소스 여기에 삽입
			file = new File(filePath, files.get(i).getOriginalFilename());
			files.get(i).transferTo(file);
			fvo = new FileUploadVO_Hwan();
			fvo.setFileName(file.getName());
			fvo.setFileStorage((double) file.length() / 1024 / 1024);
			fvolist.add(fvo);
		}
		service.board_file_upload(bvo, fvolist);

		return "hwan/file_post_hwan";
	}

	@RequestMapping(value = "/download_hwan", method = RequestMethod.GET)
	public String download_hwan(Locale locale, Model model) {
		return "hwan/download_hwan";
	}

	@RequestMapping(value = "/filepost", method = RequestMethod.GET)
	public String filepost_hwan(FilePostVO_Hwan fpvo, Model model, Paging paging) {
		model.addAttribute("filePost", service.select_post_hwan(fpvo));
		model.addAttribute("Board_FileList", service.select_post_fileList(fpvo));		

		// 페이징 처리
		paging.setPageUnit(5); // 개당 출력건수
		// 시작페이지 설정
		if (paging.getPage() == 0) {
			paging.setPage(1);
		}
		// 돌려주는 값(전체레코드)이 페이징vo에 셋팅이된다.
		paging.setTotalRecord(service.board_Paging());
		// db에서 받은 정보로 페이지마다 시작/마지막 레코드 번호
		fpvo.setFirst(paging.getFirst());
		fpvo.setLast(paging.getLast());
		// 페이징 VO의 데이터를 paging으로 담아둔다.
		model.addAttribute("paging", paging);
		// 돌려 받은 값들을 list에 받아둔다.

		model.addAttribute("Board_List_Hwan", service.select_board_boardList(fpvo));
		System.out.println(fpvo.getBoard_no() + " 게시판 번호");
		return "hwan/file_post_hwan";
	}
}
