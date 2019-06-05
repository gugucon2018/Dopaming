package com.dopaming.www;

import java.io.File;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dopaming.www.msg.MsgService;
import com.dopaming.www.msg.MsgVO;

@Controller
public class EmailController {

	@Autowired
	MsgService service;

	@Autowired
	public JavaMailSenderImpl mailSender;

	@RequestMapping(value = "/mail")
	public String sendMailInline(final MsgVO vo) {

	final MimeMessagePreparator preparator = new MimeMessagePreparator() { 

	@Override 
	public void prepare(MimeMessage mimeMessage) throws Exception { 
	final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
	helper.setFrom("dopaming<lldaybreakll@gmail.com>"); 
	helper.setTo("wlsgh2006@naver.com"); 
	helper.setSubject("[제목]메일전송 테스트"); 

	String contents = "<h1>dopaming입니다</h1>" + "<img src=\"cid:logo1.png\">"; 
	helper.setText(contents, true); 

	FileSystemResource file = new FileSystemResource(new File("C:/Users/User/git/Dopaming/dopaming/src/main/webapp/resources/images/logo1.png")); 
	helper.addInline("logo1.png", file); 

	} 

	}; 

	mailSender.send(preparator); 

	return "redirect:/"; 

	}
}