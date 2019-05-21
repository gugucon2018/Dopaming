package com.dopaming.www.file;

import java.sql.Date;

public class FileUploadVO_Hwan {
	//파일번호
	private int fileNo;
	//그룹번호 ==> null값 허용
	private int groupNo;
	//회원아이디(업로드)
	private String memberId;
	//파일명
	private String fileName;
	//파일확장자
	private String fileType;
	//파일용량(MB)
	private int fileStorage;
	//업로드날짜
	private Date uploadDate;
	
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public int getFileStorage() {
		return fileStorage;
	}
	public void setFileStorage(int fileStorage) {
		this.fileStorage = fileStorage;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}	
}
