package com.dopaming.www.grade;

public class GradeVO_min {
	private String member_grade;
	private float grade_rate;
	private int max_upload;
	private String member_grade_kor; //듣급한글(ex.다이아몬드 도토리)
	
	public String getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}
	public float getGrade_rate() {
		return grade_rate;
	}
	public void setGrade_rate(float grade_rate) {
		this.grade_rate = grade_rate;
	}
	public int getMax_upload() {
		return max_upload;
	}
	public void setMax_upload(int max_upload) {
		this.max_upload = max_upload;
	}
	public String getMember_grade_kor() {
		return member_grade_kor;
	}
	public void setMember_grade_kor(String member_grade_kor) {
		this.member_grade_kor = member_grade_kor;
	}
}
