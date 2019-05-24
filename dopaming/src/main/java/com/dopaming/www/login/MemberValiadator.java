package com.dopaming.www.login;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * 스프링 유효성 체크
 * */
public class MemberValiadator implements Validator {
	
    //이메일 정규표현식
	private static final String emailRegExp =
            "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
            "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	
	private Pattern pattern;
    
	public MemberValiadator() {
		pattern = Pattern.compile(emailRegExp);
	}
    
	@Override
	public boolean supports(Class<?> clazz) {
		return MemberVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object object, Errors errors) {
		MemberVO member = (MemberVO) object;
		
		//기본 오류 검사
		//해당필드값이 null인지만 체크함
		//형식 - ValidationUtils.rejectIfEmptyOrWhitespace(errors, field, errorCode, defaultMessage)
				
		//비밀번호 검사
		if(member.getMember_password() == null || member.getMember_password().trim().isEmpty()) {
			errors.rejectValue("member_password","required", "필수정보(비밀번호)입니다.");
		}else {
			if(!member.isPwEqualToCheckPw()) {
				errors.rejectValue("check_passowrd","nomatch", "비밀번호가 일치하지 않습니다.");
			}
		}
		//이메일 필드값이 null이고 객체가 비어있다면
		if(member.getMember_email() == null || member.getMember_email().trim().isEmpty()) {
			errors.rejectValue("member_email","required", "필수정보(이메일)입니다.");
		}else {	//비어있지 않다면
			Matcher matcher = pattern.matcher(member.getMember_email());
			if(!matcher.matches()) { //정규표현식과 매칭이 되지 않으면
				errors.rejectValue("member_email", "bad", "올바르지 않는 형식입니다.");
			}
		}
		
		//기본 오류 검사
		//해당필드값이 null인지만 체크함
		//형식 - ValidationUtils.rejectIfEmptyOrWhitespace(errors, field, errorCode, defaultMessage)
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_id", "required", "필수 정보(아이디)입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "check_passowrd", "required", "필수 정보(비밀번호 확인)입니다.");
	}

}
