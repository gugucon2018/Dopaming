package com.dopaming.www;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dopaming.www.login.MemberVO;
import com.dopaming.www.msg.MsgService;
import com.dopaming.www.msg.MsgVO;

@Controller
public class MsgController {
	
	@Autowired
	MsgService service;

//Receive
	
	//받은 쪽지 전체 목록
	@RequestMapping(value="/msg", method=RequestMethod.GET)
	@ResponseBody
	public List<MsgVO> receiveAll(Model model, HttpSession session, MemberVO memberVO, MsgVO vo) {
		memberVO = (MemberVO) session.getAttribute("memberSession");
		vo.setReceiver_id(memberVO.getMember_id());		
		return service.all_receive_list(vo);
	}
	
	//받는쪽지 보낸이 그룹
	@RequestMapping(value="/msg_sender_r", method=RequestMethod.GET)
	@ResponseBody
	public List<MsgVO> receiveSender(Model model, HttpSession session, MemberVO memberVO, MsgVO vo) {
		memberVO = (MemberVO) session.getAttribute("memberSession");
		vo.setReceiver_id(memberVO.getMember_id());
		String id = service.sender_receive(vo);
		vo.setSender_id(id);
		return service.sender_receive_list(vo);
	}
		
	//읽지않은 쪽지 목록
	@RequestMapping(value="/msg_unselect", method=RequestMethod.GET)
	@ResponseBody
		public List<MsgVO> unSelect(Model model, HttpSession session, MemberVO memberVO, MsgVO vo) {
		memberVO = (MemberVO) session.getAttribute("memberSession");
		vo.setReceiver_id(memberVO.getMember_id());
		return service.unselect_receive_list(vo);
	}
		
	//읽지않은 쪽지 수
	@RequestMapping(value="/cnt", method=RequestMethod.GET)
	@ResponseBody
	public MsgVO receiveCnt(Model model, HttpSession session, MemberVO memberVO, MsgVO vo) {
		memberVO = (MemberVO) session.getAttribute("memberSession");
		vo.setReceiver_id(memberVO.getMember_id());
		vo.setCnt(service.unselect_receive_cnt(vo));
		return vo;
	}
	
	//받은쪽지함에서 보관함으로 이동 전 상태 체크
	@RequestMapping(value="/msg_checking", method=RequestMethod.GET)
	@ResponseBody
	public List<MsgVO> checking(Model model, HttpSession session, MsgVO vo) {
		return service.check_keeping(vo);
	}
		
	//받은쪽지함에서 보관함으로 이동 
	@RequestMapping(value="/msg_keeping", method=RequestMethod.GET)
	@ResponseBody
	public MsgVO receive_keeping(MsgVO vo) {
		service.receive_keeping(vo);
		return vo;
	}
	
	//받은 쪽지 확인상태 변경
	@RequestMapping(value="/msg_changing", method=RequestMethod.GET)
	@ResponseBody
	public MsgVO changing(MsgVO vo) {
		service.changing(vo);
		return vo;
	}

	//받은 쪽지 내용 확인하기
	@RequestMapping(value="/msg_select", method=RequestMethod.GET)
	@ResponseBody
	public MsgVO receiveSelect(MsgVO vo) {
		return service.select_receive(vo);
	}
	
	//받은 쪽지함에서 휴지통으로 이동
	@RequestMapping(value="/msg_traching_r", method=RequestMethod.GET)
	@ResponseBody
	public MsgVO receiveTrashing(MsgVO vo) {
		service.receive_trashing(vo);
		return vo;
	}
	
	
//Sent
	
	//보낸 쪽지 전체 목록
	@RequestMapping(value="/msg", method=RequestMethod.POST)
	@ResponseBody
	public List<MsgVO> sentAll(Model model, HttpSession session, MemberVO memberVO, MsgVO vo) {
		memberVO = (MemberVO) session.getAttribute("memberSession");
		vo.setSender_id(memberVO.getMember_id());
		return service.all_sent_list(vo);
	}
	
	//보낸쪽지 받은이 그룹
	@RequestMapping(value="/msg_receiver", method=RequestMethod.GET)
	@ResponseBody
	public List<MsgVO> receiverSent(Model model, HttpSession session, MemberVO memberVO, MsgVO vo) {
		memberVO = (MemberVO) session.getAttribute("memberSession");
		vo.setSender_id(memberVO.getMember_id());
		String id = service.receiver_sent(vo);
		vo.setReceiver_id(id);
		return service.receiver_sent_list(vo);
	}
	
	//받은 쪽지 내용 확인하기
	@RequestMapping(value="/msg_select_s", method=RequestMethod.GET)
	@ResponseBody
	public MsgVO sentSelect(MsgVO vo) {
		return service.select_sent(vo);
	}
	
	//보낸 쪽지함에서 휴지통으로 이동
	@RequestMapping(value="msg_traching_s", method=RequestMethod.GET)
	@ResponseBody
	public MsgVO sentTrashing(MsgVO vo) {
		service.sent_trashing(vo);
		return vo;
	}
	

	
//Write
	
	//쪽지 보내기
	@RequestMapping(value="/msg", method=RequestMethod.PUT, headers = {"Content-type=application/json"})
	@ResponseBody
	public MsgVO sending(Model model, HttpSession session, MemberVO memberVO, @RequestBody MsgVO vo) {
		memberVO = (MemberVO) session.getAttribute("memberSession");
		vo.setSender_id(memberVO.getMember_id());
		String no = String.valueOf(service.write_no(vo));
		vo.setMessage_no(no);
		service.sending_write(vo);
		return vo;
	}
	
	
	
//Keep
	
	//쪽지 보관함 전체 목록
	@RequestMapping(value="/msg", method=RequestMethod.PATCH)
	@ResponseBody
	public List<MsgVO> keepAll(Model model, HttpSession session, MemberVO memberVO, MsgVO vo) {
		memberVO = (MemberVO) session.getAttribute("memberSession");
		vo.setReceiver_id(memberVO.getMember_id());
		return service.all_keep_list(vo);
	}
	
	//보관함 보낸이 그룹
	@RequestMapping(value="/msg_sender_k", method=RequestMethod.GET)
	@ResponseBody
	public List<MsgVO> keepSender(Model model, HttpSession session, MemberVO memberVO, MsgVO vo) {
		memberVO = (MemberVO) session.getAttribute("memberSession");
		vo.setReceiver_id(memberVO.getMember_id());
		String id = service.sender_receive(vo);
		vo.setSender_id(id);
		return service.sender_keep_list(vo);
	}
	
	//보관함 이전으로 복원
	@RequestMapping(value="/msg_returning_k", method=RequestMethod.GET)
	@ResponseBody
	public MsgVO keepReturning(MsgVO vo) {
		service.keep_returning(vo);
		return vo;
	}
	
	//보관함에서 휴지통으로 이동
	@RequestMapping(value="msg_traching_k", method=RequestMethod.GET)
	@ResponseBody
	public MsgVO keepTrashing(MsgVO vo) {
		service.keep_trashing(vo);
		return vo;
	}
	
	

//Trash
	
	//휴지통 전체 목록
	//쪽지 보관함 전체 목록
	@RequestMapping(value="/msg", method=RequestMethod.DELETE)
	@ResponseBody
	public List<MsgVO> trashAll(Model model, HttpSession session, MemberVO memberVO, MsgVO vo) {
		memberVO = (MemberVO) session.getAttribute("memberSession");
		vo.setReceiver_id(memberVO.getMember_id());
		return service.all_trash_list(vo);
	}
	
	//휴지통 보낸이 그룹
	@RequestMapping(value="/msg_sender_t", method=RequestMethod.GET)
	@ResponseBody
	public List<MsgVO> trashSender(Model model, HttpSession session, MemberVO memberVO, MsgVO vo) {
		memberVO = (MemberVO) session.getAttribute("memberSession");
		vo.setReceiver_id(memberVO.getMember_id());
		String id = service.sender_receive(vo);
		vo.setSender_id(id);
		return service.sender_trash_list(vo);
	}
	
	//보관함 이전으로 복원
	@RequestMapping(value="/msg_returning_t", method=RequestMethod.GET)
	@ResponseBody
	public MsgVO trashReturning(MsgVO vo) {
		service.trash_returning(vo);
		return vo;
	}
	
	//휴지통비우기
	@RequestMapping(value="/msg_delete", method=RequestMethod.GET)
	@ResponseBody
	public MsgVO delete(MsgVO vo) {
		service.delete(vo);
		return vo;
	}
}
