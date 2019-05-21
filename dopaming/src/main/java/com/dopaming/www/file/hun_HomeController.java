package com.dopaming.www.file;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class hun_HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(hun_HomeController.class);
	
	@Autowired
	FileService service;
	
	@RequestMapping(value = "/mdview", method = RequestMethod.GET)
	public String hwan(Model model,FileVO vo) {
		model.addAttribute("list", service.getFileList(vo));
		/*
		 * model.addAttribute("list", service.getFileList_k());
		 * model.addAttribute("list", service.getFileList_f());
		 */
		return "hun/mdview_hun";
	}
	
}
