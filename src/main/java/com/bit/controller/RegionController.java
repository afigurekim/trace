package com.bit.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
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
	@RequestMapping(value="/region/main",method=RequestMethod.GET)
	public String main_region() {
		
		return "/region/region_main";
	}
	@RequestMapping(value="/region/main/{state}",method=RequestMethod.GET)
	public String main_region_jeju(@PathVariable String state) {
		
		return "/region/video";
	}
	@RequestMapping(value = "/region/all", method = RequestMethod.GET)
	public String all_period(Criteria cri,Locale locale, Model model) {
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
	
	@RequestMapping(value = "/region/read", method = RequestMethod.GET)
	public String detail(@RequestParam("bno") int bno,Model model,Criteria cri) {
		
		
			try {
				model.addAttribute("read",service.readRegion(bno));
				model.addAttribute("read_detail",service.readRegion_detail(bno));
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
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		return "/region/readRegion";
	}
	
	@ResponseBody
	@RequestMapping(value="/food/{bno}")
	public ResponseEntity<Map<String,Object>> food_list(@PathVariable int bno) throws Exception
	{
		System.out.println("컴온");
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
	@ResponseBody
	@RequestMapping(value="/room/{bno}")
	public ResponseEntity<Map<String,Object>> room_list(@PathVariable int bno) throws Exception
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

