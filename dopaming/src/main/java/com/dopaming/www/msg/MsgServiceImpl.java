package com.dopaming.www.msg;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("MsgService")
public class MsgServiceImpl implements MsgService{
	
	@Autowired
	private MsgDAO dao;

//Receive
	
	@Override
	public List<MsgVO> all_receive_list(MsgVO vo) {
		return dao.all_receive_list(vo);
	}
		
	@Override
	public List<MsgVO> unselect_receive_list(MsgVO vo) {
		return dao.unselect_receive_list(vo);
	}
	
	@Override
	public int unselect_receive_cnt(MsgVO vo) {
		return dao.unselect_receive_cnt(vo);
	}
	
	@Override
	public List<MsgVO> check_keeping(MsgVO vo) {
		return dao.check_keeping(vo);
	}
	
	
	@Override
	public void receive_keeping(MsgVO vo) {
		dao.receive_keeping(vo);
	}
	
	@Override
	public void changing(MsgVO vo) {
		dao.changing(vo);
	}
	
	@Override
	public MsgVO select_receive(MsgVO vo) {
		return dao.select_receive(vo);
	}
		
	@Override
	public void receive_trashing(MsgVO vo) {
		dao.receive_trashing(vo);
	}

	
	
//Sent
	
	@Override
	public List<MsgVO> all_sent_list(MsgVO vo) {
		return dao.all_sent_list(vo);
	}
	
	@Override
	public void sent_trashing(MsgVO vo) {
		dao.sent_trashing(vo);
	}
	

	
//Write
	
	@Override
	public int write_no(MsgVO vo) {
		return dao.write_no(vo);
	}
	
	@Override
	public void sending_write(MsgVO vo) {
		dao.sending_write(vo);
	}
	
	
	
//Keep
	
	@Override
	public List<MsgVO> all_keep_list(MsgVO vo) {
		return dao.all_keep_list(vo);
	}
	
	@Override
	public void keep_returning(MsgVO vo) {
		dao.keep_returning(vo);
	}
	
	@Override
	public void keep_trashing(MsgVO vo) {
		dao.keep_trashing(vo);
	}
}
