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
import com.bit.domain.Historic_siteVO;
import com.bit.domain.Nearby_attractionVO;
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
		return "thema/All_thema";
	}
	@RequestMapping(value = "/thema/read", method = RequestMethod.GET)
	public String detail(@RequestParam("bno") int bno,Model model,Criteria cri) {
		
		
			try {
				System.out.println("앙무띠");

				model.addAttribute("read",service.readThema(bno));
				model.addAttribute("read_detail",service.readThema_detail(bno));
				List<Historic_siteVO> imglist=service.readThemaImage(bno);
				model.addAttribute("region_image",imglist);
				List<Nearby_attractionVO> list = service.foodlist(bno);
				model.addAttribute("food_list",list);
				int foodCount = service.foodcount(bno);
				model.addAttribute("food_count",foodCount);
				model.addAttribute("reply_count",service.reply_count(bno));
				//cri.setPage(foodpage);
				//model.addAttribute("foodlist",service.foodlist(cri,bno));
				
				//PageMaker pageMaker = new PageMaker();
				//pageMaker.setCri(cri);
				//System.out.println(service.foodcount(bno));
				//pageMaker.setTotalCount(service.foodcount(bno));
				//model.addAttribute("pageMaker",pageMaker);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		return "thema/readThema";
	}
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
