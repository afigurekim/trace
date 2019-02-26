package com.bit.controller;

import java.io.IOException;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
	  
	 // ���̹����̵�� ���� URL�� �����ϱ� ���Ͽ� naverLoginBOŬ������ getAuthorizationUrl�޼ҵ� ȣ�� 
	  String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	  System.out.println("���̹�:" + naverAuthUrl); //���̹� 
	  model.addAttribute("url", naverAuthUrl); 
	 
	  return "login"; 
	  }
	 

	  // ���̹� �α��� ������ callbackȣ�� �޼ҵ�
	
	 @RequestMapping(value = "/callback", method = { RequestMethod.GET,RequestMethod.POST }) 
	  public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException { 
	  System.out.println("����� callback");
	  OAuth2AccessToken oauthToken; oauthToken = naverLoginBO.getAccessToken(session, code, state);
	  // �α��� ����� ������ �о�´�. 
	  apiResult = naverLoginBO.getUserProfile(oauthToken);
	  System.out.println("result" + apiResult); 
	  int index=apiResult.indexOf("id");
	  System.out.println(index);
	  int index2=apiResult.lastIndexOf("age");
	  System.out.println(index2);
	  String name= apiResult.substring(index+5,index2-3);
	  System.out.println(name);
	  session.setAttribute("login_id2", name); 

	  return "Main"; 
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

		return "/Main/Main";
	}
	
	//���̵� ã��

	@ResponseBody
	@RequestMapping(value="/find_id", method=RequestMethod.POST)
	public String find_id(String sname,String semail,Model model) {
		System.out.println(sname);
		System.out.println(semail);
		String fi = service.find_id(sname, semail);
		return fi;
	}
	
	//��й�ȣ ã��
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
			System.out.println(fpw+"��");
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
