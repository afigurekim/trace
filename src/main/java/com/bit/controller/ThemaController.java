package com.bit.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.domain.Criteria;
import com.bit.domain.Historic_siteVO;
import com.bit.domain.Historic_site_detailVO;
import com.bit.domain.Nearby_attractionVO;
import com.bit.domain.PageMaker;
import com.bit.service.BoardService;
import com.bit.util.Translate;

@Controller
public class ThemaController {
	@Inject
	private BoardService service;
	private Translate tr=new Translate();

	@RequestMapping(value = "/thema", method = RequestMethod.GET)
	public String default_all_period(Criteria cri,Locale locale, Model model) {
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
	@RequestMapping(value = "{lang}/thema", method = RequestMethod.GET)
	public String all_period(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			
			List<Historic_siteVO> list = service.themalistAll(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang,list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.regionAllcount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "thema/All_thema";
	}
	
	@RequestMapping(value = "/thema/read", method = RequestMethod.GET)
	public String default_detail(@RequestParam("bno") int bno,Model model,Criteria cri) {
		
		
			try {
				System.out.println("앙무띠");

				Historic_siteVO read= service.readThema(bno);
				model.addAttribute("read",read);
				
				
				Historic_site_detailVO detail = service.readThema_detail(bno);
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
				
				
				model.addAttribute("read_detail",detail);	
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
				}
*/
				for(int i=0;i<near_historic.size();i++) {
					System.out.println(near_historic.get(i).getAddress());
				}
				model.addAttribute("near_historic",near_historic);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		return "thema/readThema";
	}
	
	@RequestMapping(value = "/{lang}/thema/read", method = RequestMethod.GET)
	public String detail(@RequestParam("bno") int bno,Model model,Criteria cri,@PathVariable String lang) {
		
		
			try {
				System.out.println("앙무띠");

				Historic_siteVO read=service.readThema(bno);
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
				Historic_site_detailVO read_detail=service.readThema_detail(bno);
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

				for(int i=0;i<near_historic.size();i++) {
					System.out.println(near_historic.get(i).getAddress());
					near_historic.get(i).setSite_name(tr.translate(lang, near_historic.get(i).getSite_name(), "historic"));
				}
				model.addAttribute("near_historic",near_historic);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		return "thema/readThema";
	}
	
	@RequestMapping(value = "/thema/study", method = RequestMethod.GET)
	public String default_study(Criteria cri,Locale locale, Model model) {
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
	@RequestMapping(value = "/{lang}/thema/study", method = RequestMethod.GET)
	public String study(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			List<Historic_siteVO> list=service.studylist(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang, list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);
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
	public String default_date(Criteria cri,Locale locale, Model model) {
		System.out.println("테마별 데이트");
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
	
	@RequestMapping(value = "/{lang}/thema/date", method = RequestMethod.GET)
	public String date(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			List<Historic_siteVO> list= service.datelist(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang, list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);
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
	public String default_family(Criteria cri,Locale locale, Model model) {
		System.out.println("테마별 가족");
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
	
	@RequestMapping(value = "/{lang}/thema/family", method = RequestMethod.GET)
	public String family(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			
			List<Historic_siteVO> list=service.familylist(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang, list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);
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
	
	@RequestMapping(value = "/thema/religion", method = RequestMethod.GET)
	public String default_religion(Criteria cri,Locale locale, Model model) {
		System.out.println("테마별 가족");
		try {
			model.addAttribute("list",service.religionlist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.religioncount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/thema/thema_religion";
	}
	
	@RequestMapping(value = "/{lang}/thema/religion", method = RequestMethod.GET)
	public String religion(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			
			List<Historic_siteVO> list=service.religionlist(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang, list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.religioncount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/thema/thema_religion";
	}
}
