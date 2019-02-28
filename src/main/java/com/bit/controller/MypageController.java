package com.bit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.domain.Criteria;
import com.bit.domain.MemberSiteVO;
import com.bit.domain.MemberVO;
import com.bit.domain.PageMaker;
import com.bit.domain.ReplyVO;
import com.bit.service.MemberService;
@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@Inject
	private MemberService service;
	// /mypage GET방식 접근 -> 찜목록 페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Model model, HttpSession session) throws Exception {
//		String temp = "mrhong1234";
//		session.setAttribute("login_id2", temp);
		Object session_id = session.getAttribute("login_id");
		if(session_id==null || session_id=="") { 
			session_id = session.getAttribute("login_id2");
			if(session_id==null || session_id=="") { return "redirect:login"; }
		}
		String user_id = session_id.toString();
		logger.info("user_id : "+user_id);
		List<MemberSiteVO> mysiteList = service.selectSiteMember(user_id);
		logger.info(mysiteList.toString());
		model.addAttribute("mysiteList", mysiteList);
		return "mypage/mypage";
	}
	// /mypage POST방식 접근 -> 찜목록 항목 삭제 페이지
	@RequestMapping(value="/mypage", method = RequestMethod.POST)
	public String mysitedel(@RequestParam("jno") int jno) throws Exception {
		logger.info(jno+"");
		service.deleteSiteMember(jno);
		return "mypage/mysite";
	}
	// /jimadd POST방식 접근 -> 찜목록 항목 추가
	@ResponseBody
	@RequestMapping(value="/jimadd", method = RequestMethod.POST)
	public int jimadd(int bno, String user_id){
		int su = 0;
		MemberSiteVO membersite = new MemberSiteVO();
		logger.info(bno+" : "+user_id);
		membersite.setBno(bno);
		membersite.setUser_id("'"+user_id+"'");
		try {
			su=service.checkSiteMember(membersite);
			if(su==0) {
				service.insertSiteMember(membersite);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return su;
	}
	// /mycomment GET방식 접근 -> 내 댓글 페이지
	@RequestMapping(value = "/mycomment", method = RequestMethod.GET)
	public String mycomment(Model model, HttpSession session) throws Exception {
		Object session_id = session.getAttribute("login_id");
		if(session_id==null || session_id=="") { 
			session_id = session.getAttribute("login_id2");
			if(session_id==null || session_id=="") { return "redirect:login"; }
		}
		String user_id = session_id.toString();
		logger.info("user_id : "+user_id);
		List<ReplyVO> mycommentList = service.selectReplyMember(user_id);
		logger.info(mycommentList.toString());
		model.addAttribute("mycommentList", mycommentList);
		return "mypage/mycomment";
	}
	// 댓글 페이지 페이징 처리 하려다 망한 코드
//	@RequestMapping(value = "/myreply/{user_id}/{page}", method = RequestMethod.GET)
//	public ResponseEntity<Map<String,Object>> mycommentListPage(@PathVariable("user_id") String user_id, @PathVariable("page") Integer page) {
//		ResponseEntity<Map<String,Object>> entity = null;
//		try {
//			System.out.println(page);
//			Criteria cri = new Criteria();
//			cri.setPage(page);
//			cri.setPerPageNum(10);
//			PageMaker pageMaker = new PageMaker();
//			pageMaker.setCri(cri);
//			
//			Map<String, Object> map = new HashMap<String, Object>();
//			List<ReplyVO> list = service.selectReplyMember(user_id, cri);
//			
//			map.put("list", list);
//			int replyCount = service.countReplyMember(user_id);
//			
//			pageMaker.setTotalCount(replyCount);
//			
//			map.put("pageMaker", pageMaker);
//			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
//		}
//		logger.info(entity.toString());
//		return entity;
//	}
	// /myinfo GET방식 접근 -> 내 정보 수정 페이지
	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public String myinfoget(Model model, HttpSession session) throws Exception {
		Object session_id = session.getAttribute("login_id");
		if(session_id==null || session_id=="") { 
			session_id = session.getAttribute("login_id2");
			if(session_id==null || session_id=="") { 
				return "redirect:login"; 
			} else {
				return "mypage/myinfo_sns";
			}
		}
		String user_id = session_id.toString();
		logger.info("user_id : "+user_id);
		List<MemberVO> memberList = service.selectMember(user_id);
		logger.info(memberList.toString());
		model.addAttribute("memberList", memberList);
		return "mypage/myinfo";
	}
	// /myinfo POST방식 접근 -> 정보 수정 성공 페이지
	@RequestMapping(value = "/myinfo", method = RequestMethod.POST)
	public String myinfopost(MemberVO member) throws Exception {
		logger.info(member.toString());
		service.updateMember(member);
		return "mypage/myupdate";
	}
	
}