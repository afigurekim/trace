package com.bit.controller;

import java.util.ArrayList;
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
import com.bit.domain.Historic_site_detailVO;
import com.bit.domain.Nearby_attractionVO;
import com.bit.domain.PageMaker;
import com.bit.service.BoardService;
import com.bit.util.Translate;

@Controller
public class PeriodController {
	@Inject
	private BoardService service;
	private Translate tr=new Translate();

	@RequestMapping(value = "/period", method = RequestMethod.GET)
	public String default_all_period(Criteria cri,Locale locale, Model model) {
		try {
			System.out.println("기무띠");
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
	@RequestMapping(value = "/{lang}/period", method = RequestMethod.GET)
	public String all_period(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			System.out.println("기무띠");
			List<Historic_siteVO> list = service.periodlistAll(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang,list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);

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
	@RequestMapping(value = "/period/read", method = RequestMethod.GET)
	public String default_detail(@RequestParam("bno") int bno,Model model,Criteria cri) {
		
		
			try {
				Historic_siteVO read = service.readPeriod(bno);
				model.addAttribute("read",read);
				Historic_site_detailVO detail = service.readRegion_detail(bno);
				detail.setDetail(detail.getDetail().replaceAll("&lt;br /&gt;","<br>"));
				detail.setDetail(detail.getDetail().replaceAll("&lt;br&gt;","<br>"));
				detail.setInfo_center(detail.getInfo_center().replaceAll("&lt;br /&gt;", "<br>"));
				detail.setInfo_center(detail.getInfo_center().replaceAll("&lt;br&gt;", "<br>"));
				detail.setExp_guide(detail.getExp_guide().replaceAll("&lt;br /&gt;","<br>"));
				detail.setExp_guide(detail.getExp_guide().replaceAll("&lt;br&gt;","<br>"));
				detail.setExpage_range(detail.getExp_guide().replaceAll("&lt;br /&gt;","<br>"));
				detail.setExpage_range(detail.getExp_guide().replaceAll("&lt;br&gt;","<br>"));
				detail.setUse_time(detail.getUse_time().replaceAll("&lt;br /&gt;","<br>"));
				detail.setUse_time(detail.getUse_time().replaceAll("&lt;br&gt;","<br>"));
				detail.setRest_day(detail.getRest_day().replaceAll("&lt;br /&gt;","<br>"));
				detail.setRest_day(detail.getRest_day().replaceAll("&lt;br&gt;","<br>"));
				detail.setRest_day(detail.getRest_day().replaceAll("&lt;br&gt;","<br>"));

				
				model.addAttribute("read_detail",detail);
				List<Historic_siteVO> imglist=service.readPeriodImage(bno);
				model.addAttribute("region_image",imglist);
				List<Nearby_attractionVO> list = service.foodlist(bno);
				model.addAttribute("food_list",list);
				int foodCount = service.foodcount(bno);
				//model.addAttribute("food_count",foodCount);
				model.addAttribute("reply_count",service.reply_count(bno));
				//cri.setPage(foodpage);
				//model.addAttribute("foodlist",service.foodlist(cri,bno));
				
				//PageMaker pageMaker = new PageMaker();
				//pageMaker.setCri(cri);
				//System.out.println(service.foodcount(bno));
				//pageMaker.setTotalCount(service.foodcount(bno));
				//model.addAttribute("pageMaker",pageMaker);
				Double latlng=Double.parseDouble(read.getLatitude())+Double.parseDouble(read.getLongitude());
				//double main_latlng=Double.parseDouble(latlng);
				System.out.println(latlng);
				String arr[]= read.getAddress().split(" ");
				List<Historic_siteVO> near_historic = service.nearHistoric(latlng,bno,arr[0]);
				/*List<Historic_siteVO> near_historic= new ArrayList<Historic_siteVO>();
				for(int i=0;i<near.size();i++) {
					if(near.get(i).getAddress().indexOf(arr[0])!=-1) {
						near_historic.add(near.get(i));
					}
				}*/
				// like CONCAT('%',#{keyword},'%')

				for(int i=0;i<near_historic.size();i++) {
					System.out.println(near_historic.get(i).getSite_name());
				}
				model.addAttribute("near_historic",near_historic);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		return "period/readPeriod";
	}
	@RequestMapping(value = "/{lang}/period/read", method = RequestMethod.GET)
	public String detail(@RequestParam("bno") int bno,Model model,Criteria cri,@PathVariable String lang) {
		
		
			try {

				Historic_siteVO read=service.readPeriod(bno);

				Double latlng=Double.parseDouble(read.getLatitude())+Double.parseDouble(read.getLongitude());
				//double main_latlng=Double.parseDouble(latlng);
				System.out.println(latlng);
				String arr[]= read.getAddress().split(" ");
				List<Historic_siteVO> near_historic = service.nearHistoric(latlng,bno,arr[0]);
				/*List<Historic_siteVO> near_historic= new ArrayList<Historic_siteVO>();
				for(int i=0;i<near.size();i++) {
					if(near.get(i).getAddress().indexOf(arr[0])!=-1) {
						near_historic.add(near.get(i));
					}
				}*/
				read.setSite_name(tr.translate(lang, read.getSite_name(),"region"));
				read.setAddress(tr.translate(lang, read.getAddress(), "region"));
				read.setPeriod(tr.translate(lang, read.getPeriod(), "region"));
				read.setThema(tr.translate(lang, read.getThema(), "region"));
				model.addAttribute("read",read);
				Historic_site_detailVO read_detail=service.readPeriod_detail(bno);
				read_detail.setDetail(read_detail.getDetail().replaceAll("&lt;br /&gt;","<br>"));
				read_detail.setDetail(read_detail.getDetail().replaceAll("&lt;br&gt;","<br>"));
				read_detail.setInfo_center(read_detail.getInfo_center().replaceAll("&lt;br /&gt;", "<br>"));
				read_detail.setInfo_center(read_detail.getInfo_center().replaceAll("&lt;br&gt;", "<br>"));
				read_detail.setExp_guide(read_detail.getExp_guide().replaceAll("&lt;br /&gt;","<br>"));
				read_detail.setExp_guide(read_detail.getExp_guide().replaceAll("&lt;br&gt;","<br>"));
				read_detail.setExpage_range(read_detail.getExp_guide().replaceAll("&lt;br /&gt;","<br>"));
				read_detail.setExpage_range(read_detail.getExp_guide().replaceAll("&lt;br&gt;","<br>"));
				read_detail.setUse_time(read_detail.getUse_time().replaceAll("&lt;br /&gt;","<br>"));
				read_detail.setUse_time(read_detail.getUse_time().replaceAll("&lt;br&gt;","<br>"));
				read_detail.setRest_day(read_detail.getRest_day().replaceAll("&lt;br /&gt;","<br>"));
				read_detail.setRest_day(read_detail.getRest_day().replaceAll("&lt;br&gt;","<br>"));
				if(lang!="kor") {
					read_detail.setDetail(tr.translate(lang, read_detail.getDetail(), "region"));
					read_detail.setInfo_center(tr.translate(lang, read_detail.getInfo_center(), "region"));
					read_detail.setRest_day(tr.translate(lang, read_detail.getRest_day(), "region"));
					read_detail.setCarriage(tr.translate(lang, read_detail.getCarriage(), "region"));
					read_detail.setPet(tr.translate(lang, read_detail.getPet(),"region"));
					read_detail.setPark(tr.translate(lang, read_detail.getPark(),"region"));
					read_detail.setCredit_card(tr.translate(lang, read_detail.getCredit_card(), "region"));
					read_detail.setExp_guide(tr.translate(lang, read_detail.getExp_guide(), "region"));
					read_detail.setExpage_range(tr.translate(lang, read_detail.getExpage_range(), "region"));
					read_detail.setUse_time(tr.translate(lang, read_detail.getUse_time(), "region"));
				}
				model.addAttribute("read_detail",read_detail);
				List<Historic_siteVO> imglist=service.readPeriodImage(bno);
				model.addAttribute("region_image",imglist);
				List<Nearby_attractionVO> list = service.foodlist(bno);
				model.addAttribute("food_list",list);
				int foodCount = service.foodcount(bno);
				//model.addAttribute("food_count",foodCount);
				model.addAttribute("reply_count",service.reply_count(bno));
				//cri.setPage(foodpage);
				//model.addAttribute("foodlist",service.foodlist(cri,bno));
				
				//PageMaker pageMaker = new PageMaker();
				//pageMaker.setCri(cri);
				//System.out.println(service.foodcount(bno));
				//pageMaker.setTotalCount(service.foodcount(bno));
				
				
				//model.addAttribute("pageMaker",pageMaker);




				for(int i=0;i<near_historic.size();i++) {
					System.out.println(near_historic.get(i).getAddress());
					near_historic.get(i).setSite_name(tr.translate(lang, near_historic.get(i).getSite_name(), "historic"));
					System.out.println(near_historic.get(i).getSite_name());
				}
				model.addAttribute("near_historic",near_historic);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		return "period/readPeriod";
	}
	
	@ResponseBody
	@RequestMapping(value = "/period/attraction_read", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>>  default_attraction_detail(@RequestParam("bno") int bno, int rno,Model model,Criteria cri) {
		ResponseEntity<Map<String,Object>> entity= null;

		
			try {
				Map<String,Object> map = new HashMap<String,Object>();
				Nearby_attractionVO read_attraction = service.read_attraction(bno, rno);
				read_attraction.setAttraction_detail(read_attraction.getAttraction_detail().replaceAll("&lt;br&gt;","\n"));
				read_attraction.setAttraction_detail(read_attraction.getAttraction_detail().replaceAll("&lt;br /&gt;","\n"));
				read_attraction.setAttraction_detail(read_attraction.getAttraction_detail().replaceAll("&amp;lsquo;",""));
				read_attraction.setAttraction_detail(read_attraction.getAttraction_detail().replaceAll("&amp;rsquo;",""));
				read_attraction.setAttraction_detail(read_attraction.getAttraction_detail().replaceAll("&quot;",""));
				System.out.println(read_attraction.getAttraction_detail());
				
				map.put("read_attraction", read_attraction);
				
			
				//model.addAttribute("read_attraction",service.read_attraction(bno, rno));
				List<Nearby_attractionVO> imglist=service.attraction_image(bno,rno);
				
				for(int i=0;i<imglist.size();i++) {
					if(imglist.get(i).getFullname().indexOf("http")!=-1) {
					
						imglist.get(i).setFullname(imglist.get(i).getFullname().substring(imglist.get(i).getFullname().indexOf("http")));
						
					}
				}
				map.put("food_image", imglist);
				//model.addAttribute("food_image",imglist);
				entity= new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);

				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				e.printStackTrace();
				entity=new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
			}
			
		
			return entity;

	}
	@ResponseBody
	@RequestMapping(value = "/{lang}/period/attraction_read", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>>  attraction_detail(@PathVariable String lang,@RequestParam("bno") int bno, int rno,Model model,Criteria cri) {
		ResponseEntity<Map<String,Object>> entity= null;

		
			try {
				Map<String,Object> map = new HashMap<String,Object>();
				Nearby_attractionVO read_attraction = service.read_attraction(bno, rno);
				read_attraction.setAttraction_detail(read_attraction.getAttraction_detail().replaceAll("&lt;br&gt;","\n"));
				read_attraction.setAttraction_detail(read_attraction.getAttraction_detail().replaceAll("&lt;br /&gt;","\n"));
				read_attraction.setAttraction_detail(read_attraction.getAttraction_detail().replaceAll("&amp;lsquo;",""));
				read_attraction.setAttraction_detail(read_attraction.getAttraction_detail().replaceAll("&amp;rsquo;",""));
				read_attraction.setAttraction_detail(read_attraction.getAttraction_detail().replaceAll("&quot;",""));
				if(lang!="kor") {
					read_attraction.setAddress(tr.translate(lang, read_attraction.getAddress(), "region"));
					read_attraction.setAttraction_name(tr.translate(lang, read_attraction.getAttraction_detail(), "region"));
					read_attraction.setAttraction_detail(tr.translate(lang, read_attraction.getAttraction_detail(), "region"));
					
				}
				map.put("read_attraction", read_attraction);
				
			
				//model.addAttribute("read_attraction",service.read_attraction(bno, rno));
				List<Nearby_attractionVO> imglist=service.attraction_image(bno,rno);
				
				for(int i=0;i<imglist.size();i++) {
					if(imglist.get(i).getFullname().indexOf("http")!=-1) {
					
						imglist.get(i).setFullname(imglist.get(i).getFullname().substring(imglist.get(i).getFullname().indexOf("http")));
						
					}
				}
				map.put("food_image", imglist);
				//model.addAttribute("food_image",imglist);
				entity= new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);

				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				e.printStackTrace();
				entity=new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
			}
			
		
			return entity;

	}
	@RequestMapping(value = "/period/josun", method = RequestMethod.GET)
	public String default_josun(Criteria cri,Locale locale, Model model) {
		try {
			System.out.println("앙무띠");
			model.addAttribute("list",service.josunlist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.jousncount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "period/period_josun";
	}
	@RequestMapping(value = "/{lang}/period/josun", method = RequestMethod.GET)
	public String default_josun(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			System.out.println("앙무띠");
			List<Historic_siteVO> list=service.josunlist(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang, list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.jousncount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "period/period_josun";
	}
	
	
	@RequestMapping(value = "/period/korea", method = RequestMethod.GET)
	public String default_korea(Criteria cri,Locale locale, Model model) {
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
		return "period/period_korea";
	}
	@RequestMapping(value = "/{lang}/period/korea", method = RequestMethod.GET)
	public String default_korea(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			List<Historic_siteVO> list= service.korealist(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang, list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.koreacount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "period/period_korea";
	}
	@RequestMapping(value = "/period/hyundae", method = RequestMethod.GET)
	public String default_hyundae(Criteria cri,Locale locale, Model model) {
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
		return "period/period_hyundae";
	}
	@RequestMapping(value = "/{lang}/period/hyundae", method = RequestMethod.GET)
	public String hyundae(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			List<Historic_siteVO> list = service.hyundaelist(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang, list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.hyundaecount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "period/period_hyundae";
	}
	
	@RequestMapping(value = "/period/sunsa", method = RequestMethod.GET)
	public String default_sunsa(Criteria cri, Locale locale, Model model) {
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
		return "period/period_sunsa";
	}
	@RequestMapping(value = "/{lang}/period/sunsa", method = RequestMethod.GET)
	public String default_sunsa(Criteria cri, Locale locale, Model model,@PathVariable String lang) {
		try {
			List<Historic_siteVO> list = service.sunsalist(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang, list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.sunsacount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "period/period_sunsa";
	}
	
	@RequestMapping(value = "/period/samgook", method = RequestMethod.GET)
	public String default_samgook(Criteria cri,Locale locale, Model model) {
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
		return "period/period_samgook";
	}
	@RequestMapping(value = "/{lang}/period/samgook", method = RequestMethod.GET)
	public String samgook(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			List<Historic_siteVO> list=service.samgooklist(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang, list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.hyundaecount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "period/period_samgook";
	}
}
