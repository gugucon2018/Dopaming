package com.dopaming.www.file;

public class FileBoardVO_Hwan {
	
	//게시글번호
	private int boardNo;
	//게시글제목
	private String boardTitle;
	//회원아이디
	private String memberId;
	//카테고리 대제목
	private String categoryBig;
	//카테고리 소제목
	private String categorySmall;
	//게시글 내용
	private String boardContent;
	//게시글 이미지
	private String boardImg;
	//게시글 아콘 => null값 허용
	private String boardAcorn;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getCategoryBig() {
		return categoryBig;
	}
	public void setCategoryBig(String categoryBig) {
		this.categoryBig = categoryBig;
	}
	public String getCategorySmall() {
		return categorySmall;
	}
	public void setCategorySmall(String categorySmall) {
		this.categorySmall = categorySmall;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardImg() {
		return boardImg;
	}
	public void setBoardImg(String boardImg) {
		this.boardImg = boardImg;
	}
	public String getBoardAcorn() {
		return boardAcorn;
	}
	public void setBoardAcorn(String boardAcorn) {
		this.boardAcorn = boardAcorn;
	}	
}
