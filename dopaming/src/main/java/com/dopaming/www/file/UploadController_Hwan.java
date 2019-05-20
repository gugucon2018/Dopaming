package com.dopaming.www.file;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UploadController_Hwan {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController_Hwan.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/upload_hwan", method = RequestMethod.GET)
	public String hwan(Locale locale, Model model) {
		
		return "hwan/upload_hwan";
	}	
}