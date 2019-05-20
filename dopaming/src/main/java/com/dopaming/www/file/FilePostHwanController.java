/**
 * 
 */
package com.dopaming.www.file;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author User
 *
 */
@Controller
public class FilePostHwanController {
	@RequestMapping(value = "/filepost", method = RequestMethod.GET)
	public String hwan(Locale locale, Model model) {
		
		return "hwan/file_post_hwan";
	}	
}
