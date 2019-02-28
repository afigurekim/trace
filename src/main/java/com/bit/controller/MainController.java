package com.bit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.bit.domain.Criteria;
import com.bit.domain.Historic_siteVO;
import com.bit.domain.Historic_site_starVO;
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

	
	@Autowired
	SessionLocaleResolver localeResolver;
	
	@Autowired
	MessageSource messageSource;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String default_main(Locale locale, Model model,HttpServletRequest request) {
		try {
			logger.info("welecome foottrace {} ",locale);
			logger.info("session Locale is {} ",localeResolver.resolveLocale(request));
			
			logger.info("site.title:{}",messageSource.getMessage("site.title", null,"default text",locale));
			logger.info("site.count :{}",messageSource.getMessage("site.count", new String[] {"첫번째"},"default text",locale));
			//logger.info("not.exist 기본값 없음 : {}",messageSource.getMessage("not.exist", null,locale));
			//model.addAttribute("periodlist",service.MainPeriod());
			//model.addAttribute("themalist",service.MainThema());
			//model.addAttribute("locationlist",service.MainLocation());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("main test...");
		return "/Main/Main";
	}
	@RequestMapping(value = "/{state}", method = RequestMethod.GET)
	public String main(Locale locale, Model model,HttpServletRequest request,@PathVariable String state) {
		try {
			System.out.println(state);
			logger.info("welecome foottrace {} ",locale);
			logger.info("session Locale is {} ",localeResolver.resolveLocale(request));
			
			logger.info("site.title:{}",messageSource.getMessage("site.title", null,"default text",locale));
			logger.info("site.count :{}",messageSource.getMessage("site.count", new String[] {"첫번째"},"default text",locale));
			//logger.info("not.exist 기본값 없음 : {}",messageSource.getMessage("not.exist", null,locale));
			//model.addAttribute("periodlist",service.MainPeriod());
			//model.addAttribute("themalist",service.MainThema());
			model.addAttribute("locationlist",service.MainLocation());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("main test...");
		return "/Main/Main";
	}
	@ResponseBody
	@RequestMapping(value="/starValue",method=RequestMethod.POST)
	public int starValue(int star,String id,int bno) {
		int su=0;
		Historic_site_starVO vo = new Historic_site_starVO();
		vo.setBno(bno);
		vo.setUser_id(id);
		vo.setStar(star);
		try {
			su=service.star_check(bno, id);
			if(su==0) {
				service.star_insert(vo);
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
			cri.setPerPageNum(125);
			
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
	public String intro() {
		return "intro-new";
	}
	
	
	@RequestMapping(value="/getAttach")
		@ResponseBody
		public List<String> getAttach()throws Exception{
		return service.getAttach();
	}
	
	
	

	
	
	
}
