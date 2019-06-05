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
	
	//받은 쪽지 전체 목록
	@RequestMapping(value="/msg", method=RequestMethod.GET)
	@ResponseBody
	public List<MsgVO> receiveAll(Model model, HttpSession session, MemberVO memberVO, MsgVO vo) {
		memberVO = (MemberVO) session.getAttribute("memberSession");
		System.out.println("아직 로그인 되지 않았습니다!");
		vo.setReceiver_id(memberVO.getMember_id());
		return service.list_receive_all(vo);
	}
	
	//보낸 쪽지 전체 목록
	@RequestMapping(value="/msg", method=RequestMethod.POST)
	@ResponseBody
	public List<MsgVO> sentAll(Model model, HttpSession session, MemberVO memberVO, MsgVO vo) {
		memberVO = (MemberVO) session.getAttribute("memberSession");
		vo.setSender_id(memberVO.getMember_id());
		return service.list_sent_all(vo);
	}
	
	//확인하지 않은 받은 쪽지 수 확인
	@RequestMapping(value="/cnt", method=RequestMethod.GET)
	@ResponseBody
	public MsgVO receiveCnt(Model model, HttpSession session, MemberVO memberVO, MsgVO vo) {
		memberVO = (MemberVO) session.getAttribute("memberSession");
		vo.setReceiver_id(memberVO.getMember_id());
		vo.setCnt(service.unselect_receive_cnt(vo));
		return vo;
	}
	
	//보관함으로 보낼 쪽지 선택
	@RequestMapping(value="/msg_keeping", method=RequestMethod.GET)
	@ResponseBody
	public MsgVO keeping(MsgVO vo) {
		service.keeping(vo);
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
	
	//쪽지 보내기
	@RequestMapping(value="/msg", method=RequestMethod.PUT, headers = {"Content-type=application/json"})
	@ResponseBody
	public MsgVO sending(Model model, HttpSession session, MemberVO memberVO, @RequestBody MsgVO vo) {
		memberVO = (MemberVO) session.getAttribute("memberSession");
		vo.setSender_id(memberVO.getMember_id());
		service.sending_write(vo);
		return vo;
	}
}
