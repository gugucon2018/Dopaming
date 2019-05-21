package com.dopaming.www.file;

import java.sql.Date;

public class FileDownloadVO_Hwan {
	//null값 전부 허용하지 않음
	//다운로드번호 
	private int downloadNo;
	//결제날짜
	private Date downloadDate;
	//회원아이디(다운)
	private String memberId;
	//다운로드아콘
	private int downloadAcorn;
	//파일번호
	private int fileNo;
	
	public int getDownloadNo() {
		return downloadNo;
	}
	public void setDownloadNo(int downloadNo) {
		this.downloadNo = downloadNo;
	}
	public Date getDownloadDate() {
		return downloadDate;
	}
	public void setDownloadDate(Date downloadDate) {
		this.downloadDate = downloadDate;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getDownloadAcorn() {
		return downloadAcorn;
	}
	public void setDownloadAcorn(int downloadAcorn) {
		this.downloadAcorn = downloadAcorn;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}	
}
