package com.dopaming.www.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("payService")
public class PayServiceImpl_min implements Payservice_min {
	
	//Autowired가 UserDAO 자체를 가져오는것(DAO에 repository로 연결해줬다)
	//@Autowired private UserDAOSpring userDAO;
	@Autowired private PayDAOMybatis_min mambersDAO;

	//
	@Override
	public void insertPay(PayVO_min vo){
		mambersDAO.insertPay(vo);
	}
}
