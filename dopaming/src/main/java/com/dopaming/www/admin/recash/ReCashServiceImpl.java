package com.dopaming.www.admin.recash;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;



@Service("ReCashService")
public class ReCashServiceImpl implements ReCashService {
	
	@Autowired 
	private ReCashDAO dao;

	@Override
	public int recashCount_admin(ReCashVO vo) {
		return dao.recashCount_admin(vo);
	}

	@Override
	public List<ReCashVO> recashList_admin(ReCashVO vo) {
		return dao.recashList_admin(vo);
	}
	
	@Override
	public void recashing(ReCashVO vo) {
		dao.recashing(vo);
	}
}
