package com.dopaming.www.admin.boardlist;

public class BoardListVO {
	int board_no;
	String member_id;
	String board_title;
	String category_big;
	String category_small;
	int board_acorn;
	int rn;
	
	//페이징하기위한 첫,마지막번호
	private int first;
	private int last;
		
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getCategory_big() {
		return category_big;
	}
	public void setCategory_big(String category_big) {
		this.category_big = category_big;
	}
	public String getCategory_small() {
		return category_small;
	}
	public void setCategory_small(String category_small) {
		this.category_small = category_small;
	}
	public int getBoard_acorn() {
		return board_acorn;
	}
	public void setBoard_acorn(int board_acorn) {
		this.board_acorn = board_acorn;
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
			
}
