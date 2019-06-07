package com.dopaming.www.msg;

import java.util.List;

public interface MsgService {

//Receive
	
	//list_receive_all
	public List<MsgVO> all_receive_list(MsgVO vo);
		
	//unselect_receive_list
	public List<MsgVO> unselect_receive_list(MsgVO vo);
	
	//unselect_receive_cnt
	public int unselect_receive_cnt(MsgVO vo);
	
	//check_keeping
	public List<MsgVO> check_keeping(MsgVO vo);
	
	//receive_keeping
	public void receive_keeping(MsgVO vo);
	
	//msg_changing
	public void changing(MsgVO vo);
	
	//select_receive
	public MsgVO select_receive(MsgVO vo);
	
	//receive_trashing
	public void receive_trashing(MsgVO vo);
	
	

//Sent
	
	//list_sent_all
	public List<MsgVO> all_sent_list(MsgVO vo);
	
	//sent_trashing
	public void sent_trashing(MsgVO vo);
	

	
//Write	
	
	//write_no
	public int write_no(MsgVO vo);
	
	//sending_write
	public void sending_write(MsgVO vo);
	
	
	
//Keep
	
	//list_keep_all
	public List<MsgVO> all_keep_list(MsgVO vo);
	
	//keep_returning
	public void keep_returning(MsgVO vo);
	
	
	
}