package com.dopaming.www.file;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FileController_Hwan {
	private static final Logger logger = LoggerFactory.getLogger(FileController_Hwan.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/upload_hwan", method = RequestMethod.GET)
	public String upload_hwan(Locale locale, Model model) {
		
		return "hwan/upload_hwan";
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
