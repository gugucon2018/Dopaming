package com.dopaming.www.admin.recash;

import java.util.List;
import java.util.Map;

public interface ReCashservice {
	
	//CRUD 기능의 메소드 구현
	//차트 상세 조회
	ReCashVO getChart(ReCashVO vo);
	
	//차트 목록 조회
	List<ReCashVO> getChartList(ReCashVO vo);
	
	public int chartList_cnt(ReCashVO vo);
	
	
	public List<Map<String, Object>> getChartMember(ReCashVO vo);

}
