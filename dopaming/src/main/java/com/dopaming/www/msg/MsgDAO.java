package com.dopaming.www.msg;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MsgDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;

//Receive
	
	//받은 쪽지 전체 목록
	public List<MsgVO> all_receive_list(MsgVO vo) {
		return mybatis.selectList("MsgDAO.all_receive_list",vo);
	}
		
	//읽지않은 쪽지 목록
	public List<MsgVO> unselect_receive_list(MsgVO vo) {
		return mybatis.selectList("MsgDAO.unselect_receive_list",vo);
	}
	
	//읽지않은 쪽지 수
	public int unselect_receive_cnt(MsgVO vo) {
		return mybatis.selectOne("MsgDAO.unselect_receive_cnt",vo);
	}
	
	//받은쪽지함에서 보관함으로 이동 전 상태 체크
	public List<MsgVO> check_keeping(MsgVO vo) {
		return mybatis.selectList("MsgDAO.check_keeping",vo);
	}
	
	//받은쪽지함에서 보관함으로 이동
	public void receive_keeping(MsgVO vo) {
		mybatis.insert("MsgDAO.receive_keeping",vo);
	}
	
	//받은 쪽지 확인상태 변경
	public void changing(MsgVO vo) {
		mybatis.insert("MsgDAO.changing",vo);
	}
	
	//받은 쪽지 내용 확인하기
	public MsgVO select_receive(MsgVO vo) {
		return mybatis.selectOne("MsgDAO.select_receive", vo);
	}
	
	//받은 쪽지함에서 휴지통으로 이동
	public void receive_trashing(MsgVO vo) {
		mybatis.insert("MsgDAO.receive_trashing",vo);
	}
	
	

//Sent
	
	//보낸 쪽지 전체 목록
	public List<MsgVO> all_sent_list(MsgVO vo) {
		return mybatis.selectList("MsgDAO.all_sent_list",vo);
	}
	
	//보낸 쪽지함에서 휴지통으로 이동
	public void sent_trashing(MsgVO vo) {
		mybatis.insert("MsgDAO.sent_trashing",vo);
	}
	

	
//Write
	
	//전송 쪽지 번호 부여
	public int write_no(MsgVO vo) {
		return mybatis.selectOne("MsgDAO.write_no",vo);
	}
	
	//쪽지 보내기
	public void sending_write(MsgVO vo) {
		mybatis.insert("MsgDAO.sending_write",vo);
	}

	
	
//Keep
	
	//쪽지 보관함 전체 목록
	public List<MsgVO> all_keep_list(MsgVO vo) {
		return mybatis.selectList("MsgDAO.all_keep_list",vo);
	}
	
	//받은쪽지함에서 보관함으로 이동
	public void keep_returning(MsgVO vo) {
		mybatis.insert("MsgDAO.keep_returning",vo);
	}
	
	//보관함에서 휴지통으로 이동
	public void keep_trashing(MsgVO vo) {
		mybatis.insert("MsgDAO.keep_trashing",vo);
	}
	
	
	
}