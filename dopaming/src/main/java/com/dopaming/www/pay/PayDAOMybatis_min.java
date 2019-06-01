package com.dopaming.www.pay;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PayDAOMybatis_min {
	@Autowired SqlSessionTemplate mybatis;

	//관리자 - 회원관리 - 등급관리 - 등급List
	public void insertPay(PayVO_min vo){
		mybatis.insert("PayDAO.payInsert",vo);
	}
}
