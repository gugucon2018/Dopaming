package com.dopaming.www.file;

import java.sql.Date;

public class FileVO {
	private String file_name;
	private int file_no;
	private int file_storage;
	private String file_type;
	private Date upload_date;
	private String member_id;
	
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
	
	public int getFile_storage() {
		return file_storage;
	}
	public void setFile_storage(int file_storage) {
		this.file_storage = file_storage;
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
	
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}
	@Override
	public String toString() {
		return "FileVO [file_name=" + file_name + ", file_no=" + file_no + ", file_storage=" + file_storage
				+ ", file_type=" + file_type + ", upload_date=" + upload_date + ", member_id=" + member_id + "]";
	}
	
	
}
