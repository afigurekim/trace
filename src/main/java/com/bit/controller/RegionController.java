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
import com.bit.domain.Historic_site_starVO;
import com.bit.domain.Nearby_attractionVO;
import com.bit.domain.PageMaker;
import com.bit.service.BoardService;
import com.bit.util.Translate;

@Controller
public class RegionController {
	@Inject
	private BoardService service;
	
	private Translate tr=new Translate();
	
	@RequestMapping(value="/region/main",method=RequestMethod.GET)
	public String default_main_region() {
		
		return "/region/region_main";
	}
	@RequestMapping(value="/{lang}/region/main",method=RequestMethod.GET)
	public String main_region(@PathVariable String lang) {
		
		return "/region/region_main";
	}
	
	@RequestMapping(value="/region/main/{state}",method=RequestMethod.GET)
	public String default_main_region_jeju(@PathVariable String state) {
		
		return "/region/video";
	}
	@RequestMapping(value="{lang}/region/main/{state}",method=RequestMethod.GET)
	public String main_region_jeju(@PathVariable String lang,@PathVariable String state) {
		
		return "/region/video";
	}
	@RequestMapping(value = "/region/all", method = RequestMethod.GET)
	public String default_all_period(Criteria cri,Locale locale, Model model) {
		try {
		
			
			List<Historic_siteVO> list=service.regionlistAll(cri);

				/*for(int i=0;i<list.size();i++) {
				 	String clientId = "l39_4PYuXcUlZNncALoX";//애플리케이션 클라이언트 아이디값";
			        String clientSecret = "G5LASR9tjF";//애플리케이션 클라이언트 시크릿값";
			        try {
			            String text = URLEncoder.encode(list.get(i).getSite_name(), "UTF-8");

			            String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
			            URL url = new URL(apiURL);
			            HttpURLConnection con = (HttpURLConnection)url.openConnection();
			            con.setRequestMethod("POST");
			            con.setRequestProperty("X-Naver-Client-Id", clientId);
			            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			            // post request
			            String postParams = "source=ko&target=en&text=" + text;


			            con.setDoOutput(true);
			            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			            wr.writeBytes(postParams);
			            wr.flush();
			            wr.close();
			            int responseCode = con.getResponseCode();
			            BufferedReader br;
			            if(responseCode==200) { // 정상 호출
			                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			            } else {  // 에러 발생
			                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			            }
			            String inputLine;
			            StringBuffer response = new StringBuffer();
			            while ((inputLine = br.readLine()) != null) {
			                response.append(inputLine);
			            }
			            br.close();
			            
			            
			            System.out.println(response.toString());
			            String a=response.substring(response.indexOf("translatedText")+16,response.length()-3);
			            String b[]=a.split(",");
			            
			            list.get(i).setSite_name(b[0].substring(1,b[0].length()-1));
			            
			            
			            String text2= URLEncoder.encode(list.get(i).getAddress(), "UTF-8");

			            HttpURLConnection con2 = (HttpURLConnection)url.openConnection();
			            con2.setRequestMethod("POST");
			            con2.setRequestProperty("X-Naver-Client-Id", clientId);
			            con2.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			            // post request
			            String postParams2 = "source=ko&target=en&text=" + text2;


			            con2.setDoOutput(true);
			            DataOutputStream wr2 = new DataOutputStream(con2.getOutputStream());
			            wr2.writeBytes(postParams2);
			            wr2.flush();
			            wr2.close();
			            int responseCode2 = con2.getResponseCode();
			            BufferedReader br2;
			            if(responseCode2==200) { // 정상 호출
			                br2 = new BufferedReader(new InputStreamReader(con2.getInputStream()));
			            } else {  // 에러 발생
			                br2 = new BufferedReader(new InputStreamReader(con2.getErrorStream()));
			            }
			            String inputLine2;
			            StringBuffer response2 = new StringBuffer();
			            while ((inputLine2 = br2.readLine()) != null) {
			                response2.append(inputLine2);
			            }
			            System.out.println(response2.toString());
			            br2.close();
			            a=response2.substring(response2.indexOf("translatedText")+17,response2.length()-4);
			    
			            
			            list.get(i).setAddress(a);
			           
			        } catch  (Exception e) {
			            System.out.println(e);
			        }
				}*/
		        model.addAttribute("list",list);
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
	@RequestMapping(value = "/{lang}/region/all", method = RequestMethod.GET)
	public String all_period(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			List<Historic_siteVO> list=service.regionlistAll(cri);
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
		return "/region/All_region";
	}
	
	@RequestMapping(value = "/region/read", method = RequestMethod.GET)
	public String default_detail(@RequestParam("bno") int bno,Model model,Criteria cri) {
		
		
			try {
				Historic_siteVO read=service.readRegion(bno);
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

				model.addAttribute("read_detail",detail);
				List<Historic_siteVO> imglist=service.readRegionImage(bno);
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
				List<Historic_siteVO> near = service.nearHistoric(latlng,bno);
				List<Historic_siteVO> near_historic= new ArrayList<Historic_siteVO>();
				for(int i=0;i<near.size();i++) {
					if(near.get(i).getAddress().indexOf(arr[0])!=-1) {
						near_historic.add(near.get(i));
					}
				}
			
				for(int i=0;i<near_historic.size();i++) {
					System.out.println(near_historic.get(i).getAddress());
				}
				model.addAttribute("near_historic",near_historic);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		return "/region/readRegion";
	}
	@RequestMapping(value = "/{lang}/region/read", method = RequestMethod.GET)
	public String detail(@RequestParam("bno") int bno,Model model,Criteria cri,@PathVariable String lang) {
		
		
			try {
			
				
				Historic_siteVO read=service.readRegion(bno);
				Double latlng=Double.parseDouble(read.getLatitude())+Double.parseDouble(read.getLongitude());
				//double main_latlng=Double.parseDouble(latlng);
				System.out.println(latlng);
				String arr[]= read.getAddress().split(" ");
				List<Historic_siteVO> near = service.nearHistoric(latlng,bno);
				List<Historic_siteVO> near_historic= new ArrayList<Historic_siteVO>();
				for(int i=0;i<near.size();i++) {
					if(near.get(i).getAddress().indexOf(arr[0])!=-1) {
						near_historic.add(near.get(i));
					}
				}
				read.setSite_name(tr.translate(lang, read.getSite_name(),"region"));
				read.setAddress(tr.translate(lang, read.getAddress(), "region"));
				model.addAttribute("read",read);
				Historic_site_detailVO read_detail=service.readRegion_detail(bno);
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
				List<Historic_siteVO> imglist=service.readRegionImage(bno);
				model.addAttribute("region_image",imglist);
				//List<Nearby_attractionVO> list = service.foodlist(bno);
				///model.addAttribute("food_list",list);
				//int foodCount = service.foodcount(bno);
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
				}
				model.addAttribute("near_historic",near_historic);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		return "/region/readRegion";
	}
	@ResponseBody
	@RequestMapping(value="/readChartList/{bno}")
	public ResponseEntity<Map<String,Object>> readChartList(@PathVariable int bno) throws Exception
	{
		
		System.out.println("컴다운");
		ResponseEntity<Map<String,Object>> entity= null;
		try {
			//System.out.println("bno"+bno);
			
			Map<String,Object> map = new HashMap<String,Object>();
			List<Historic_site_starVO> list=service.readChartList(bno);
		//	System.out.println(list.get(0).getStar()+" 평점");
			map.put("list", list);
			
			entity= new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/food/{bno}")
	public ResponseEntity<Map<String,Object>> default_food_list(@PathVariable int bno) throws Exception
	{
	
		System.out.println("컴다운");
		ResponseEntity<Map<String,Object>> entity= null;
		try {
			System.out.println("bno"+bno);
			
			Map<String,Object> map = new HashMap<String,Object>();
			List<Nearby_attractionVO> list = service.foodlist(bno);
		
			int foodCount = service.foodcount(bno);
			System.out.println(foodCount);
			map.put("list", list);
			
			//return service.foodlist(cri,bno);
			
			entity= new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	
	@RequestMapping(value="/{lang}/food/{bno}")
	public ResponseEntity<Map<String,Object>> food_list(@PathVariable int bno,@PathVariable String lang) throws Exception
	{
		
		System.out.println("컴다운");
		ResponseEntity<Map<String,Object>> entity= null;
		try {
			System.out.println("bno"+bno);
			
			Map<String,Object> map = new HashMap<String,Object>();
			List<Nearby_attractionVO> list = service.foodlist(bno);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setAttraction_name(tr.translate(lang, list.get(i).getAttraction_name(), "region"));
					list.get(i).setAddress(tr.translate(lang, list.get(i).getAddress(), "region"));
					//list.get(i).setAttraction_detail(tr.translate(lang, list.get(i).getAttraction_detail(), "region"));
				}
			}
			int foodCount = service.foodcount(bno);
			System.out.println(foodCount);
			map.put("list", list);
			
			//return service.foodlist(cri,bno);
			
			entity= new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@ResponseBody
	@RequestMapping(value="/room/{bno}")
	public ResponseEntity<Map<String,Object>> default_room_list(@PathVariable int bno) throws Exception
	{
		System.out.println("컴다운");
		ResponseEntity<Map<String,Object>> entity= null;
		try {
			System.out.println("bno"+bno);
			
			Map<String,Object> map = new HashMap<String,Object>();
			List<Nearby_attractionVO> list = service.roomlist(bno);
			
			int roomCount = service.roomcount(bno);
			System.out.println(roomCount);
			map.put("list", list);
			
			//return service.foodlist(cri,bno);
			
			entity= new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@ResponseBody
	@RequestMapping(value="/{lang}/room/{bno}")
	public ResponseEntity<Map<String,Object>> room_list(@PathVariable int bno,@PathVariable String lang) throws Exception
	{
		System.out.println("컴다운");
		ResponseEntity<Map<String,Object>> entity= null;
		try {
			System.out.println("bno"+bno);
			
			Map<String,Object> map = new HashMap<String,Object>();
			List<Nearby_attractionVO> list = service.roomlist(bno);
			
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setAttraction_name(tr.translate(lang, list.get(i).getAttraction_name(), "region"));
					list.get(i).setAddress(tr.translate(lang, list.get(i).getAddress(), "region"));
					//list.get(i).setAttraction_detail(tr.translate(lang, list.get(i).getAttraction_detail(), "region"));
				}
			}
			int roomCount = service.roomcount(bno);
			System.out.println(roomCount);
			map.put("list", list);
			
			//return service.foodlist(cri,bno);
			
			entity= new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/region/attraction_read", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>>  default_attraction_detail(@RequestParam("bno") int bno, int rno,Model model,Criteria cri) {
		ResponseEntity<Map<String,Object>> entity= null;

		
			try {
				Map<String,Object> map = new HashMap<String,Object>();
				Nearby_attractionVO read_attraction = service.read_attraction(bno, rno);
				read_attraction.setAttraction_detail(read_attraction.getAttraction_detail().replaceAll("&lt;br&gt;",""));
				read_attraction.setAttraction_detail(read_attraction.getAttraction_detail().replaceAll("&lt;br /&gt;",""));
				read_attraction.setAttraction_detail(read_attraction.getAttraction_detail().replaceAll("&amp;lsquo;",""));
				read_attraction.setAttraction_detail(read_attraction.getAttraction_detail().replaceAll("&amp;rsquo;",""));

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
	@RequestMapping(value = "/{lang}/region/attraction_read", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>>  attraction_detail(@PathVariable String lang,@RequestParam("bno") int bno, int rno,Model model,Criteria cri) {
		ResponseEntity<Map<String,Object>> entity= null;

		
			try {
				Map<String,Object> map = new HashMap<String,Object>();
				Nearby_attractionVO read_attraction = service.read_attraction(bno, rno);
				read_attraction.setAttraction_detail(read_attraction.getAttraction_detail().replaceAll("&lt;br&gt;",""));
				read_attraction.setAttraction_detail(read_attraction.getAttraction_detail().replaceAll("&lt;br /&gt;",""));
				if(lang!="kor") {
					read_attraction.setAddress(tr.translate(lang, read_attraction.getAddress(), "region"));
					read_attraction.setAttraction_name(tr.translate(lang, read_attraction.getAttraction_name(), "region"));
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
	@RequestMapping(value = "/region/seoul", method = RequestMethod.GET)
	public String default_seoul(Criteria cri,Locale locale, Model model) {
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
	@RequestMapping(value = "/{lang}/region/seoul", method = RequestMethod.GET)
	public String seoul(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			List<Historic_siteVO> list=service.seoullist(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang, list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.seoulcount());
			System.out.println(pageMaker.getTotalCount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/region/region_seoul";
	}	
	@RequestMapping(value = "/region/incheon", method = RequestMethod.GET)
	public String default_incheon(Criteria cri,Locale locale, Model model) {
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
	@RequestMapping(value = "/{lang}/region/incheon", method = RequestMethod.GET)
	public String incheon(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			
			List<Historic_siteVO> list=service.incheonlist(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang, list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);
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
	public String default_kyunggi(Criteria cri,Locale locale, Model model) {
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
	@RequestMapping(value = "/{lang}/region/kyunggi", method = RequestMethod.GET)
	public String kyunggi(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			List<Historic_siteVO> list=service.kyunggilist(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang, list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);			
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
	public String default_kangwon(Criteria cri,Locale locale, Model model) {
		try {
			model.addAttribute("list",service.kangwonlist(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.kangwoncount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/region/region_kangwon";
	}
	@RequestMapping(value = "/{lang}/region/kangwon", method = RequestMethod.GET)
	public String kangwon(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			
			List<Historic_siteVO> list=service.kangwonlist(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang, list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.kangwoncount());
			model.addAttribute("pageMaker",pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/region/region_kangwon";
	}
	@RequestMapping(value = "/region/chungchung", method = RequestMethod.GET)
	public String default_chungchung(Criteria cri,Locale locale, Model model) {
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
	@RequestMapping(value = "/{lang}/region/chungchung", method = RequestMethod.GET)
	public String chungchung(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			List<Historic_siteVO> list=service.chungchunglist(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang, list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);
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
	public String default_kyungsang(Criteria cri,Locale locale, Model model) {
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
	@RequestMapping(value = "/{lang}/region/kyungsang", method = RequestMethod.GET)
	public String kyungsang(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			List<Historic_siteVO> list=service.kyungsanglist(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang, list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);			
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
	public String default_junla(Criteria cri,Locale locale, Model model) {
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
	@RequestMapping(value = "/{lang}/region/junla", method = RequestMethod.GET)
	public String junla(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			List<Historic_siteVO> list=service.junlalist(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang, list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);		
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
	public String default_jeju(Criteria cri,Locale locale, Model model) {
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
	@RequestMapping(value = "/{lang}/region/jeju", method = RequestMethod.GET)
	public String jeju(Criteria cri,Locale locale, Model model,@PathVariable String lang) {
		try {
			List<Historic_siteVO> list=service.jejulist(cri);
			if(lang!="kor") {
				for(int i=0;i<list.size();i++) {
					list.get(i).setSite_name(tr.translate(lang, list.get(i).getSite_name(),"region"));
				}
			}
			model.addAttribute("list",list);		
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

