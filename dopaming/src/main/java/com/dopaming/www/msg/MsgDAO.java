package com.dopaming.www.msg;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MsgDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	//받은 쪽지 전체 목록
	public List<MsgVO> list_receive_all(MsgVO vo) {
		return mybatis.selectList("MsgDAO.list_receive_all",vo);
	}
	
	//보낸 쪽지 전체 목록
	public List<MsgVO> list_sent_all(MsgVO vo) {
		return mybatis.selectList("MsgDAO.list_sent_all",vo);
	}
	
	//확인하지 않은 받은 쪽지 수
	public int unselect_receive_cnt(MsgVO vo) {
		return mybatis.selectOne("MsgDAO.unselect_receive_cnt",vo);
	}
	
	//보관함으로 보낼 쪽지 선택
	public void keeping(MsgVO vo) {
		mybatis.insert("MsgDAO.keeping",vo);
	}
	
	//받은 쪽지 확인상태 변경
	public void changing(MsgVO vo) {
		mybatis.insert("MsgDAO.changing",vo);
	}
	
	//받은 쪽지 내용 확인하기
	public MsgVO select_receive(MsgVO vo) {
		return mybatis.selectOne("MsgDAO.select_receive", vo);
	}
	
	//쪽지 보내기
	public void sending_write(MsgVO vo) {
		mybatis.insert("MsgDAO.sending_write",vo);
	}
	
}