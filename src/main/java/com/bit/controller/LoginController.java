package com.bit.controller;

import java.io.IOException;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.service.MemberService;
import com.bit.util.NaverLoginBO;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class LoginController {

	
	@Inject
	private MemberService service;

		
	  private NaverLoginBO naverLoginBO; 
	  private String apiResult =null;
	  
	  @Autowired
	  private void setNaverLoginBO(NaverLoginBO naverLoginBO) { 
	  this.naverLoginBO =naverLoginBO; 
	  }
	
	/*
	  @RequestMapping(value = "/login", method = RequestMethod.GET) 
	  public String login(Locale locale, Model model) { 
		  return "login"; 
	}
	 */

	  @RequestMapping(value = "/login", method = RequestMethod.GET) 
	  public String login(Locale locale,Model model, HttpSession session) {
	  
	 // 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 
	  String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	  System.out.println("네이버:" + naverAuthUrl); //네이버 
	  model.addAttribute("url", naverAuthUrl); 
	 
	  return "login"; 
	  }
	 

	  // 네이버 로그인 성공시 callback호출 메소드
	
	 @RequestMapping(value = "/callback", method = { RequestMethod.GET,RequestMethod.POST }) 
	  public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException { 
	  System.out.println("여기는 callback");
	  OAuth2AccessToken oauthToken; oauthToken = naverLoginBO.getAccessToken(session, code, state);
	  // 로그인 사용자 정보를 읽어온다. 
	  apiResult = naverLoginBO.getUserProfile(oauthToken);
	  System.out.println("result" + apiResult); 
	  // 네이버 api에서 가져온 사용자 정보를 JSON으로 변환
	  JSONParser jsonParser = new JSONParser();
	  JSONObject jsonobj = new JSONObject();
	  try {
		  	jsonobj = (JSONObject) jsonParser.parse(apiResult);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	  // response JSON 객체를 뽑아온 다음 그 안 id 객체 값을 string 변환
	  JSONObject response = (JSONObject) jsonobj.get("response");
	  String name = (String) response.get("id");
	  System.out.println(name);
	  session.setAttribute("login_id2", name); 

	  return "Main/Main";
	  }
	

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String sid, String spw, HttpSession session) {
		System.out.println(sid);
		System.out.println(spw);
		Integer ls = service.login(sid, spw);
		Integer return_count = 0;
		Integer ec = 0;
		System.out.println(ls);
		if (ls == 1) {
			ec = service.login_email_Check(sid);
			if (ec == 1) {
				return_count = 2;
				session.setAttribute("login_id", sid);

			} else {
				return_count = 1;
			}

		} else if (ls == 0) {
			return_count = 0;
		}

		return return_count.toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/kakao/login/{id}",method=RequestMethod.GET)
	public int kakao_login(@PathVariable String id,HttpSession session) {
		
		session.setAttribute("login_id2",id);
		
		return 1;
	}

	@RequestMapping(value = "success", method = RequestMethod.GET)
	public String success() {

		return "loginsuccess";

	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}
	
	//아이디 찾기

	@ResponseBody
	@RequestMapping(value="/find_id", method=RequestMethod.POST)
	public String find_id(String sname,String semail,Model model) {
		System.out.println(sname);
		System.out.println(semail);
		String fi = service.find_id(sname, semail);
		return fi;
	}
	
	//비밀번호 찾기
	@ResponseBody
	@RequestMapping(value="/find_pw",method=RequestMethod.POST)
	public String find_pw(String tname,String tid,String tphone,String temail) {
		System.out.println(tname);
		System.out.println(tid);
		System.out.println(tphone);

		System.out.println(temail);
		
		String fpw=service.find_pw(tid,tname, tphone, temail);
		System.out.println(fpw);
		if(fpw==null) {
			System.out.println(fpw+"널");
			fpw=null;
		}
		if(fpw!=null) {
			try {
				service.find_pw_email(fpw,temail);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return fpw;
	}
	
	
	@RequestMapping("/modal")
	public void modal() {
		
	}
}