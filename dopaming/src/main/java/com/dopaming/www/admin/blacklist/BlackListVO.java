package com.dopaming.www.admin.blacklist;

import java.sql.Date;

public class BlackListVO {

	private String member_id;
	private String member_email;
	private Date list_date;
	private String user_list;
	//private String searchCondition;
	//private String searchKeyword;
	//페이징하기위한 첫,마지막번호
	private int first;
	private int last;
	
	//public String getSearchCondition() {
	//	return searchCondition;
	//}
	//public void setSearchCondition(String searchCondition) {
	//	this.searchCondition = searchCondition;
	//}
	//public String getSearchKeyword() {
	//	return searchKeyword;
	//}
	//public void setSearchKeyword(String searchKeyword) {
	//	this.searchKeyword = searchKeyword;
	//}
	
	
	public String getMember_id() {
		return member_id;
	}
	public String getUser_list() {
		return user_list;
	}
	public void setUser_list(String user_list) {
		this.user_list = user_list;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public Date getList_date() {
		return list_date;
	}
	public void setList_date(Date list_date) {
		this.list_date = list_date;
	}
	
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	@Override
	public String toString() {
		return "BlackListVO [member_id=" + member_id + ", member_email=" + member_email + ", list_date=" + list_date
				+ "]";
	}
	
}
