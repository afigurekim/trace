package com.bit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

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
import com.bit.domain.Historic_siteVO;
import com.bit.domain.Nearby_attractionVO;
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
	public String detail(@RequestParam("bno") int bno,Model model,Criteria cri) {
		
		
			try {
				model.addAttribute("read",service.readRegion(bno));
				model.addAttribute("read_detail",service.readRegion_detail(bno));
				List<Historic_siteVO> imglist=service.readRegionImage(bno);
				model.addAttribute("region_image",imglist);
				
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
			
		
		return "/region/readRegion";
	}
	
	@ResponseBody
	@RequestMapping(value="/food/{bno}/{page}")
	public ResponseEntity<Map<String,Object>> detail(@PathVariable int bno,@PathVariable int page) throws Exception
	{
		ResponseEntity<Map<String,Object>> entity= null;
		try {
			System.out.println("bno"+bno);
			System.out.println("page"+page);
			Criteria cri = new Criteria();
			cri.setPage(page);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			Map<String,Object> map = new HashMap<String,Object>();
			List<Nearby_attractionVO> list = service.foodlist(cri, bno);
			int foodCount = service.foodcount(bno);
			pageMaker.setTotalCount(foodCount);
			System.out.println(foodCount);
			map.put("list", list);
			map.put("pageMaker", pageMaker);
			
			//return service.foodlist(cri,bno);
			
			entity= new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/region/attraction_read", method = RequestMethod.GET)
	public String attraction_detail(@RequestParam("bno") int bno, int rno,Model model,Criteria cri) {
		
		
			try {
				model.addAttribute("read_attraction",service.read_attraction(bno, rno));
				List<Nearby_attractionVO> imglist=service.attraction_image(bno,rno);
				
				for(int i=0;i<imglist.size();i++) {
					if(imglist.get(i).getFullname().indexOf("http")!=-1) {
						imglist.get(i).setFullname(imglist.get(i).getFullname().substring(imglist.get(i).getFullname().indexOf("http")));
					}
				}
				model.addAttribute("food_image",imglist);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		return "/region/read_Attraction";
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
	@RequestMapping(value = "/region/jeju", method = RequestMethod.GET)
	public String jeju(Criteria cri,Locale locale, Model model) {
		try {
			model.addAttribute("list",service.jejulist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.jejucount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/region/region_jeju";
	}
}

