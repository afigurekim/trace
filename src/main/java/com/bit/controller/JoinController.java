package com.bit.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.domain.MemberVO;
import com.bit.service.MemberService;

@Controller
public class JoinController {

private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Inject
	private MemberService service;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String default_joinget(Locale locale, Model model) {
		
		return "join";
	}
	@RequestMapping(value = "/{lang}/join", method = RequestMethod.GET)
	public String joinget(Locale locale, Model model,@PathVariable String lang) {
		
		return "join";
	}
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String default_joinpost(MemberVO member, RedirectAttributes rttr,Model model) throws Exception {
		logger.info("회원가입 등록");
		logger.info(member.toString());
		System.out.println(member.toString());
		System.out.println("회원가입좀하자");
		service.emailAuth(member.getEmail());
		service.insertMember(member);
		
		return "joinsuccess";
	}
	@RequestMapping(value = "/{lang}/join", method = RequestMethod.POST)
	public String joinpost(MemberVO member, RedirectAttributes rttr,Model model,@PathVariable String lang) throws Exception {
		logger.info("회원가입 등록");
		logger.info(member.toString());
		System.out.println(member.toString());
		System.out.println("회원가입좀하자");
		service.emailAuth(member.getEmail());
		service.insertMember(member);
		
		return "joinsuccess";
	}
	@RequestMapping(value="/checkid",method=RequestMethod.GET)
	public @ResponseBody int checkId(String sid)throws Exception{
		return service.checkId(sid);
	}
	@RequestMapping(value="/emailcheck",method=RequestMethod.GET)
	public @ResponseBody int emailcheck(String semail)throws Exception{
	
		return service.emailCheck(semail);
	}
	@RequestMapping(value="/emailauth/{email:.+}",method=RequestMethod.GET)
	public String checkEmail(@PathVariable String email)throws Exception{
		System.out.println(email);
		service.emailAuthCheck(email);
		return "emailsuccess";
		
	}
	
	
}
