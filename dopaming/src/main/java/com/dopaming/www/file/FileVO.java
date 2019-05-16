package com.dopaming.www.file;

import java.sql.Date;

public class FileVO {
	private String file_name;
	private int file_no;
	private int acorn;
	private int upload_storage;
	private Date upload_date;
	private String member_id;
	private int upload_count;
	
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public int getAcorn() {
		return acorn;
	}
	public void setAcorn(int acorn) {
		this.acorn = acorn;
	}
	public int getUpload_storage() {
		return upload_storage;
	}
	public void setUpload_storage(int upload_storage) {
		this.upload_storage = upload_storage;
	}
	public Date getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getUpload_count() {
		return upload_count;
	}
	public void setUpload_count(int upload_count) {
		this.upload_count = upload_count;
	}
	
}
