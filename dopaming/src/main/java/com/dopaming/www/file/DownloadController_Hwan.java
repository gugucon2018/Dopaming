package com.dopaming.www.file;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DownloadController_Hwan {
	//private static final Logger logger = LoggerFactory.getLogger(DownloadController_Hwan.class);
	
	@RequestMapping(value = "/download_hwan", method = RequestMethod.GET)
	public String hwan(Locale locale, Model model) {
		return "hwan/download_hwan";
	}	
}
