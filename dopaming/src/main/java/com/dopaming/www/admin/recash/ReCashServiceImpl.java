package com.dopaming.www.admin.recash;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dopaming.www.file.FileVO;


@Service("ReCashService")
public class ReCashServiceImpl implements ReCashservice {
	
	@Autowired 
	private ReCashDAO dao;
	
	@Override
	public ReCashVO getChart(ReCashVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReCashVO> getChartList(ReCashVO vo) {
		// TODO Auto-generated method stub
		System.out.println("getChartList");
		return dao.getChartList(vo);
	}

	@Override
	public int chartList_cnt(ReCashVO vo) {
		// TODO Auto-generated method stub
		return dao.chartList_cnt(vo);
	}

	
	@Override
	public List<Map<String, Object>> getChartMember(ReCashVO vo){
		return dao.getChartMember(vo);
	}
	
}
