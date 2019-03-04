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
	@RequestMapping(value = "/{lang}/mypage", method = RequestMethod.GET)
	public String mypage(Model model, HttpSession session, @PathVariable String lang) throws Exception {
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
	// /jimdel POST방식 접근 -> 찜목록 항목 삭제 (비동기통신)
	@ResponseBody
	@RequestMapping(value="/jimdel", method = RequestMethod.POST)
	public void jimadd(int jno) throws Exception{
		logger.info(jno+"");
		service.deleteSiteMember(jno);
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
	@RequestMapping(value = "/{lang}/mycomment", method = RequestMethod.GET)
	public String mycomment(Model model, HttpSession session, @PathVariable String lang) throws Exception {
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
	@RequestMapping(value = "/{lang}/myinfo", method = RequestMethod.GET)
	public String myinfoget(Model model, HttpSession session, @PathVariable String lang) throws Exception {
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
		logger.info(lang);
		return "mypage/myinfo";
	}
	// /myinfo POST방식 접근 -> 정보 수정 성공 페이지
	@RequestMapping(value = "/myinfo", method = RequestMethod.POST)
	public String myinfopost(MemberVO member) throws Exception {
		logger.info(member.toString());
		service.updateMember(member);
		return "mypage/myupdate";
	}
	@RequestMapping(value = "/{lang}/myinfo", method = RequestMethod.POST)
	public String myinfopost(MemberVO member, @PathVariable String lang) throws Exception {
		logger.info(member.toString()+" : "+lang);
		service.updateMember(member);
		return "mypage/myupdate";
	}
	
}