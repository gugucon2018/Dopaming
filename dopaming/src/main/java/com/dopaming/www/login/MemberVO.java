package com.dopaming.www.login;

public class MemberVO {
	private String member_id;
	private String member_password;
	private String member_email;
	private boolean userCookie;
	
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

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public boolean isUserCookie() {
		return userCookie;
	}
	
	public void setUserCookie(boolean userCookie) {
		this.userCookie = userCookie;
	}

	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", member_password=" + member_password + ", member_email="
				+ member_email + "]";
	}

	
}
