package com.dopaming.www.login;

import java.sql.Date;

public class MemberVO {
	private String member_id;
	private String member_password;
	private String member_email;
	private String check_passowrd;
	private Date member_date;
	private String approval_status;
	private String approval_key;
	
	//비밀번호 확인
	public boolean isPwEqualToCheckPw() {
		return member_password.equals(check_passowrd);
	}
	
	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}

	public String getCheck_passowrd() {
		return check_passowrd;
	}

	public void setCheck_passowrd(String check_passowrd) {
		this.check_passowrd = check_passowrd;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}	
	
	public Date getMember_date() {
		return member_date;
	}

	public void setMember_date(Date member_date) {
		this.member_date = member_date;
	}
	
	public String getApproval_status() {
		return approval_status;
	}

	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}

	public String getApproval_key() {
		return approval_key;
	}

	public void setApproval_key(String approval_key) {
		this.approval_key = approval_key;
	}

	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", member_password=" + member_password + ", member_email="
				+ member_email + "]";
	}

	
}
