package com.dopaming.www.msg;

import java.util.List;

public interface MsgService {
	
	//list_receive_all
	public List<MsgVO> list_receive_all(MsgVO vo);
	
	//list_sent_all
	public List<MsgVO> list_sent_all(MsgVO vo);
	
	//unselect_receive_cnt
	public int unselect_receive_cnt(MsgVO vo);
	
	//keep_msg
	public void keeping(MsgVO vo);
	
	//msg_changing
	public void changing(MsgVO vo);
	
	//select_receive
	public MsgVO select_receive(MsgVO vo);
		
	//sending_write
	public void sending_write(MsgVO vo);
}