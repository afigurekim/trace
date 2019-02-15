package com.bit.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.domain.BoardVO;
import com.bit.domain.Criteria;
import com.bit.domain.PageMaker;
import com.bit.service.BoardService;

@Controller
public class PeriodController {
	@Inject
	private BoardService service;
	
	@RequestMapping(value = "/period", method = RequestMethod.GET)
	public String all_period(Criteria cri,Locale locale, Model model) {
		try {
			
			model.addAttribute("list",service.periodlistAll(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.periodAllcount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/period/All_period";
	}
	/*
	@RequestMapping(value = "/period/read", method = RequestMethod.GET)
	public String detail(@RequestParam("bno") int bno,Model model) {
		
		try {
			model.addAttribute(service.readPeriod(bno));
			
			List<BoardVO> imglist=service.readPeriodImage(bno);
			String imglist2[] =new String[4];
			for(int i=0;i<imglist.size();i++) {
				imglist2[i]=imglist.get(i).getFullName().replace("s_", "");
						System.out.println(imglist2[i]);
			}
			model.addAttribute("imglist",imglist2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/period/readPeriod";
	}*/
	
	@RequestMapping(value = "/period/josun", method = RequestMethod.GET)
	public String josun(Criteria cri,Locale locale, Model model) {
		try {
			model.addAttribute("list",service.josunlist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.jousncount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/period/period_josun";
	}
	@RequestMapping(value = "/period/korea", method = RequestMethod.GET)
	public String korea(Criteria cri,Locale locale, Model model) {
		try {
			model.addAttribute("list",service.korealist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.koreacount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/period/period_korea";
	}
	
	@RequestMapping(value = "/period/hyundae", method = RequestMethod.GET)
	public String hyundae(Criteria cri,Locale locale, Model model) {
		try {
			model.addAttribute("list",service.hyundaelist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.hyundaecount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/period/period_hyundae";
	}
	
	@RequestMapping(value = "/period/sunsa", method = RequestMethod.GET)
	public String sunsa(Criteria cri, Locale locale, Model model) {
		try {
			model.addAttribute("list",service.sunsalist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.sunsacount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/period/period_sunsa";
	}
	
	@RequestMapping(value = "/period/samgook", method = RequestMethod.GET)
	public String samgook(Criteria cri,Locale locale, Model model) {
		try {
			model.addAttribute("list",service.samgooklist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.hyundaecount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/period/period_samgook";
	}
}
