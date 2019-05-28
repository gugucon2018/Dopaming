package com.dopaming.www.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAOMybatis_Hun {
	@Autowired
	SqlSessionTemplate mybatis;
}
