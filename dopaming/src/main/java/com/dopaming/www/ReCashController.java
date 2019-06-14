package com.dopaming.www;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dopaming.www.admin.recash.ReCashServiceImpl;

@Controller
public class ReCashController {
	
	@Autowired
	ReCashServiceImpl service;
	
	@RequestMapping(value ="/admin/test", method = RequestMethod.GET )
	public String test() {
		return "admin/admin_ho/test";
	}

}
