package com.dopaming.www;

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

import com.dopaming.www.main.MainService_hun;
import com.dopaming.www.main.MainVO_hun;

	/**
	 * Handles requests for the application home page.
	 */
	@Controller
	public class MainController {
		
		private static final Logger logger = LoggerFactory.getLogger(MainController.class);
		
		@Autowired
		MainService_hun service;
		/**
		 * Simply selects the home view to render by returning its name.
		 */
		@RequestMapping(value = "/", method = RequestMethod.GET)
		public String home(Locale locale, Model model,MainVO_hun vo) {
			logger.info("Welcome home! The client locale is {}.", locale);
			
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			
			String formattedDate = dateFormat.format(date);
			
			model.addAttribute("serverTime", formattedDate );
			model.addAttribute("list",service.getMainList(vo));
			
			return "main/main";
		}
		
			
		
}
