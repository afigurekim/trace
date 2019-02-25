package com.bit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.domain.Criteria;
import com.bit.domain.MemberVO;
import com.bit.domain.PageMaker;
import com.bit.domain.ReplyVO;
import com.bit.service.MemberService;
@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);

	@Inject
	private MemberService service;
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {
		return "mypage";
	}
	@RequestMapping(value = "/mycomment", method = RequestMethod.GET)
	public String mycomment() {
		return "mycomment";
	}
	@RequestMapping(value = "/myreply/{user_id}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> mycommentListPage(@PathVariable("user_id") String user_id, @PathVariable("page") Integer page) {
		ResponseEntity<Map<String,Object>> entity = null;
		try {
			System.out.println(page);
			Criteria cri = new Criteria();
			cri.setPage(page);
			cri.setPerPageNum(10);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<ReplyVO> list = service.selectReplyMember(user_id, cri);
			
			map.put("list", list);
			int replyCount = service.countReplyMember(user_id);
			
			pageMaker.setTotalCount(replyCount);
			
			map.put("pageMaker", pageMaker);
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public String myinfoget(Model model) throws Exception {
		List<MemberVO> memberList = service.selectMember("mrhong1234");
		logger.info(memberList.toString());
		model.addAttribute("memberList", memberList);
		return "myinfo";
	}
	@RequestMapping(value = "/myinfo", method = RequestMethod.POST)
	public String myinfopost(MemberVO member) throws Exception {
		logger.info(member.toString());
		service.updateMember(member);
		return "myupdate";
	}
	
}
