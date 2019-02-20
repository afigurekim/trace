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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.domain.Criteria;
import com.bit.domain.Historic_siteVO;
import com.bit.domain.Nearby_attractionVO;
import com.bit.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Inject
	private BoardService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		try {
			//model.addAttribute("periodlist",service.MainPeriod());
			//model.addAttribute("themalist",service.MainThema());
			model.addAttribute("locationlist",service.MainLocation());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "Main";
	}
	@ResponseBody
	@RequestMapping(value="/starValue",method=RequestMethod.POST)
	public int starValue(int star,String id,int bno) {
		int su=0;
		try {
			su=service.star_check(bno, id);
			if(su==0) {
				service.star_insert(star, id,bno);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return su;
	}
	@ResponseBody
	@RequestMapping(value = "/mainimage", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> mainimage(Locale locale, Model model) {
		
		ResponseEntity<Map<String,Object>> entity= null;
		try {
			
			Map<String,Object> map = new HashMap<String,Object>();
			Criteria cri = new Criteria();
			cri.setPerPageNum(89);
			
			List<Historic_siteVO> list=service.periodlistAll(cri);

			map.put("list", list);
			
			//return service.foodlist(cri,bno);
			
			entity= new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	
	
	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public String intro(Locale locale, Model model) {
		
		return "intro";
	}
	
	
	@RequestMapping(value="/getAttach")
		@ResponseBody
		public List<String> getAttach()throws Exception{
		return service.getAttach();
	}
	
	
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		
		return "login";
	}
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model) {
		return "mypage";
	}
	@RequestMapping(value = "/order_deliver", method = RequestMethod.GET)
	public String order_deliver(Locale locale, Model model) {
		return "order_deliver";
	}
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(Locale locale, Model model) {
		return "cart";
	}
	@RequestMapping(value = "/interest", method = RequestMethod.GET)
	public String interest(Locale locale, Model model) {
		return "interest";
	}
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(Locale locale, Model model) {
		return "notice";
	}
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String qna(Locale locale, Model model) {
		return "qna";
	}
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq(Locale locale, Model model) {
		return "faq";
	}
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review(Locale locale, Model model) {
		return "review";
	}
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String event(Locale locale, Model model) {
		return "event";
	}
	@RequestMapping(value = "/PostSearch", method = RequestMethod.GET)
	public String PostSearch(Locale locale, Model model) {
		return "PostSearch";
	}
	
}
