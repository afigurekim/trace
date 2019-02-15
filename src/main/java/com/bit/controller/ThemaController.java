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
public class ThemaController {
	@Inject
	private BoardService service;
	
	@RequestMapping(value = "/thema", method = RequestMethod.GET)
	public String all_period(Criteria cri,Locale locale, Model model) {
		try {
			
			model.addAttribute("list",service.themalistAll(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.periodAllcount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/thema/All_thema";
	}
/*	
	@RequestMapping(value = "/thema/read", method = RequestMethod.GET)
	public String detail(@RequestParam("bno") int bno,Model model) {
		
		try {
			model.addAttribute(service.readThema(bno));
			
			List<BoardVO> imglist=service.readThemaImage(bno);
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
		return "/thema/readthema";
	}*/
	@RequestMapping(value = "/thema/study", method = RequestMethod.GET)
	public String study(Criteria cri,Locale locale, Model model) {
		try {
			model.addAttribute("list",service.studylist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.studycount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/thema/thema_study";
	}

	@RequestMapping(value = "/thema/date", method = RequestMethod.GET)
	public String date(Criteria cri,Locale locale, Model model) {
		try {
			model.addAttribute("list",service.datelist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.datecount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/thema/thema_date";
	}
	
	@RequestMapping(value = "/thema/family", method = RequestMethod.GET)
	public String family(Criteria cri,Locale locale, Model model) {
		try {
			model.addAttribute("list",service.familylist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.familycount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/thema/thema_family";
	}
}
