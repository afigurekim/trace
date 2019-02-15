package com.bit.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.domain.Criteria;
import com.bit.domain.Historic_siteVO;
import com.bit.domain.PageMaker;
import com.bit.service.BoardService;

@Controller
public class RegionController {
	@Inject
	private BoardService service;
	
	@RequestMapping(value = "/region", method = RequestMethod.GET)
	public String all_period(Criteria cri,Locale locale, Model model) {
		try {
			
			
			
			model.addAttribute("list",service.regionlistAll(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.regionAllcount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/region/All_region";
	}
	
	@RequestMapping(value = "/region/read", method = RequestMethod.GET)
	public String detail(@RequestParam("bno") int bno,Model model) {
		
		
			try {
				model.addAttribute("read",service.readRegion(bno));
				model.addAttribute("read_detail",service.readRegion_detail(bno));
				List<Historic_siteVO> imglist=service.readRegionImage(bno);
				model.addAttribute("region_image",imglist);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		return "/region/readRegion";
	}
	
	@RequestMapping(value = "/region/seoul", method = RequestMethod.GET)
	public String seoul(Criteria cri,Locale locale, Model model) {
		try {
			model.addAttribute("list",service.seoullist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.seoulcount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/region/region_seoul";
	}
	
	@RequestMapping(value = "/region/incheon", method = RequestMethod.GET)
	public String incheon(Criteria cri,Locale locale, Model model) {
		try {
			model.addAttribute("list",service.incheonlist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.incheoncount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/region/region_incheon";
	}
	
	@RequestMapping(value = "/region/kyunggi", method = RequestMethod.GET)
	public String kyunggi(Criteria cri,Locale locale, Model model) {
		try {
			model.addAttribute("list",service.kyunggilist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.kyunggicount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/region/region_kyunggi";
	}
	
	@RequestMapping(value = "/region/kangwon", method = RequestMethod.GET)
	public String kangwon(Criteria cri,Locale locale, Model model) {
		try {
			model.addAttribute("list",service.kyunggilist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.kyunggicount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/region/region_kangwon";
	}
	@RequestMapping(value = "/region/chungchung", method = RequestMethod.GET)
	public String chungchung(Criteria cri,Locale locale, Model model) {
		try {
			model.addAttribute("list",service.chungchunglist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.chungchungcount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/region/region_chungchung";
	}
	@RequestMapping(value = "/region/kyungsang", method = RequestMethod.GET)
	public String kyungsang(Criteria cri,Locale locale, Model model) {
		try {
			model.addAttribute("list",service.kyungsanglist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.kyungsangcount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/region/region_kyungsang";
	}
	
	@RequestMapping(value = "/region/junla", method = RequestMethod.GET)
	public String junla(Criteria cri,Locale locale, Model model) {
		try {
			model.addAttribute("list",service.junlalist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.junlacount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/region/region_junla";
	}
}

