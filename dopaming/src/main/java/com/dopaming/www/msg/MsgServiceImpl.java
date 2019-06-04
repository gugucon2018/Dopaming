package com.dopaming.www.msg;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("MsgService")
public class MsgServiceImpl implements MsgService{
	
	@Autowired
	private MsgDAO dao;
	
	@Override
	public List<MsgVO> list_receive_all(MsgVO vo) {
		return dao.list_receive_all(vo);
	}
	
	@Override
	public List<MsgVO> list_sent_all(MsgVO vo) {
		return dao.list_sent_all(vo);
	}
	
	@Override
	public int unselect_receive_cnt(MsgVO vo) {
		return dao.unselect_receive_cnt(vo);
	}
	
	@Override
	public void keeping(MsgVO vo) {
		dao.keeping(vo);
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
	public void sending_write(MsgVO vo) {
		dao.sending_write(vo);
	}
}
