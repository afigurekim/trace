package com.bit.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.domain.Historic_siteVO;
import com.bit.domain.Historic_site_detailVO;
import com.bit.domain.Historic_site_imageVO;
import com.bit.domain.Nearby_attractionVO;
import com.bit.persistence.Historic_siteDAO;

@Controller
public class Historic_addController {
	//nilE%2Bgxdo0tHLffsEZzqOB0JH62Q%2BCbWzvqvyLKZz108cgqvmXVMtZx2c0d1GJFZlIAxaKusc9d%2BYzOTHYOhkQ%3D%3D
	//dRHdUyuSxdOfoAJW28aN5obeuGP8MF5CnlnCVAFGjz82X8H9RHXff%2FAZNSHOlsDxrm788R60muPdspT5TaPCjw%3D%3D
	//58c9zeZcCAKF1cwMbo1bo46Lc6kVEs83id5skkstk9lgNwcodJlGoypZwmZl5TQu66OQ9r0ynjXqRdZMcBZSOA%3D%3D
	//p35TFUbXxOZ9aFN5PNJViAlwJp7rAns7%2BCrYHNE2Vs7%2FgEIqi91p5mNQOA7kHXI%2Fz%2F3LPcg4piPKihlOFvrxYw%3D%3D
	//EeCFhukHh79xQCHczQD0n4rnAP8u8VEZBk9Ptn%2FBL8EHoQhHhZi4nEjrPryhc8Wlnz8AXj2oXfwKGlcLY37a6A%3D%3D
	//o8hqR6%2FKeUTPdvwLF0gzcR%2FJhkHYk%2FR9FagVCUivrAP3plEVY2i7HKzSngfBnnwI3kPktRal5nW%2BLFF37N%2BXNA%3D%3D
	//dYBcRW%2B1LweF8T8Zs05cOy2Fkc5bBq8ZccFV9fkR6UVcHRQ%2BGNJKCeWK1%2FtR34RK30%2Bmow12pld6f4HxKvRCMA%3D%3D
	//kls8RufZ%2B2idSOYWC4H8j0pnW996K49NjZAS3m1%2BWnbCkfTG1Y26B8bc5LPYd5mWMsZFMGBpR8dz8wVG%2BzuQ4Q%3D%3D
	//5JRCxIV3VwzyC2aFzOWF4l3jJGwfkHM2w8JwHa5wIlVjgnWcrHr7%2FyCa8YLO5YLsM9xG2rw9kcUxl%2BZoeEGLvQ%3D%3D
	//CphYLaAO5pr0%2FXpqoKEH58zlgZNnkkrYpNJWhl19kMQkb6c5e%2Fn8Sd1AyivmSrmOvEGJgd7iUV%2BmZtFLm5aJ6A%3D%3D
	@Inject
	private Historic_siteDAO dao;
	private int count=0;
	String serviceKey="";
    int sido_count=1;
    int page_count=1;
	@RequestMapping("/historic/{sido}/{pagenum}/{start}")
	@Transactional
	public void Main_historic(@PathVariable int sido,@PathVariable int pagenum,@PathVariable int start)throws Exception{
		historic(sido,pagenum,start);
	}
	
	public void historic(int sido,int pagenum,int start) throws Exception{
		if(count==0) {
			serviceKey="nilE%2Bgxdo0tHLffsEZzqOB0JH62Q%2BCbWzvqvyLKZz108cgqvmXVMtZx2c0d1GJFZlIAxaKusc9d%2BYzOTHYOhkQ%3D%3D";
		}else if(count==1) {
			serviceKey="58c9zeZcCAKF1cwMbo1bo46Lc6kVEs83id5skkstk9lgNwcodJlGoypZwmZl5TQu66OQ9r0ynjXqRdZMcBZSOA%3D%3D";
		}else if(count==2) {
			serviceKey="5JRCxIV3VwzyC2aFzOWF4l3jJGwfkHM2w8JwHa5wIlVjgnWcrHr7%2FyCa8YLO5YLsM9xG2rw9kcUxl%2BZoeEGLvQ%3D%3D";
		}else if(count==3) {
			serviceKey="p35TFUbXxOZ9aFN5PNJViAlwJp7rAns7%2BCrYHNE2Vs7%2FgEIqi91p5mNQOA7kHXI%2Fz%2F3LPcg4piPKihlOFvrxYw%3D%3D";
		}else if(count==4) {
			serviceKey="o8hqR6%2FKeUTPdvwLF0gzcR%2FJhkHYk%2FR9FagVCUivrAP3plEVY2i7HKzSngfBnnwI3kPktRal5nW%2BLFF37N%2BXNA%3D%3D";
		}else if(count==5) {
			serviceKey="kls8RufZ%2B2idSOYWC4H8j0pnW996K49NjZAS3m1%2BWnbCkfTG1Y26B8bc5LPYd5mWMsZFMGBpR8dz8wVG%2BzuQ4Q%3D%3D";
		}else if(count==6) {
			serviceKey="CphYLaAO5pr0%2FXpqoKEH58zlgZNnkkrYpNJWhl19kMQkb6c5e%2Fn8Sd1AyivmSrmOvEGJgd7iUV%2BmZtFLm5aJ6A%3D%3D";
		}else if(count==7) {
			serviceKey="dRHdUyuSxdOfoAJW28aN5obeuGP8MF5CnlnCVAFGjz82X8H9RHXff%2FAZNSHOlsDxrm788R60muPdspT5TaPCjw%3D%3D";
		}else if(count==8) {
			serviceKey="dYBcRW%2B1LweF8T8Zs05cOy2Fkc5bBq8ZccFV9fkR6UVcHRQ%2BGNJKCeWK1%2FtR34RK30%2Bmow12pld6f4HxKvRCMA%3D%3D";
		}
		System.out.println("count들어갑니다"+count);
		System.out.println("sido 들어갑니다"+sido);
		System.out.println("pagenum 들어갑니다"+pagenum);
		System.out.println("sido_Count 들어갑니다"+sido_count);
		System.out.println("page_Count 들어갑니다"+page_count);
		String history_name;
    	String latitude;
    	String longitude;
    	String address;
    	String contentid;
    	String contenttypeid;
    	String firstimage = "";
	      int vocount=0;
	
	    
    	int index;
    	int index2;
        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="+serviceKey+"&contentTypeId=12&areaCode="+sido+"&sigunguCode=&cat1=A02&cat2=A0201&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo="+pagenum); /*URL*/
        
        
        URL url = new URL(urlBuilder.toString());
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
       
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;

        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        List<Historic_siteVO> list= dao.history_list();
 	   List<Nearby_attractionVO> list4=dao.food_list();
 	   List<Nearby_attractionVO> list5=dao.room_list();

 	   int vocount2=list4.size();
 	   int vocount3=list5.size();
        vocount=list.size();
      
        StringBuilder sb = new StringBuilder();
        String line;
        
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        System.out.println(sb.toString());
        rd.close();
        conn.disconnect();
        String arr[]=new String[1000];
       
        arr=sb.toString().split("<item>");
        
        for(int i=1;i<arr.length;i++) {
        	System.out.println("----------------------------------------시작----------");
         if(arr[i].indexOf("<firstimage>")!=-1) {
     	       index=arr[i].indexOf("<firstimage>");
     	       index2=arr[i].indexOf("</firstimage>");
     	       firstimage=arr[i].substring(index+12,index2);
          }else if(arr[i].indexOf("<firstimage2>")!=-1) {
        	  index=arr[i].indexOf("<firstimage2>");
    	       index2=arr[i].indexOf("</firstimage2>");
    	       firstimage=arr[i].substring(index+13,index2);
          }else {
        	  firstimage="";
          }
        	
        index=arr[i].indexOf("<contentid>");
        index2=arr[i].indexOf("</contentid>");
        contentid=arr[i].substring(index+11, index2);
        
        index=arr[i].indexOf("<contenttypeid>");
        index2=arr[i].indexOf("</contenttypeid>");
        contenttypeid=arr[i].substring(index+15, index2);
        
        index=arr[i].indexOf("</addr1");
        address=arr[i].substring(7, index);
       
        index=arr[i].indexOf("<mapx>");
        index2=arr[i].indexOf("</mapx>");
        latitude=arr[i].substring(index+6, index2);
        
        index=arr[i].indexOf("<mapy>");
        index2=arr[i].indexOf("</mapy>");
        longitude=arr[i].substring(index+6,index2);
        
        index=arr[i].indexOf("<title>");
        index2=arr[i].indexOf("</title>");
        history_name=arr[i].substring(index+7, index2);
      
        System.out.println(contentid);
        System.out.println(contenttypeid);
        System.out.println(address);
        System.out.println(latitude);
        System.out.println(longitude);
        System.out.println(history_name);
	    	try {
	    		 Historic_siteVO vo=new Historic_siteVO();
	    		    vo.setFirst_image(firstimage);
	    	        vo.setSite_name(history_name);
	    	        vo.setContent_id(contentid);
	    	        vo.setContent_typeid(contenttypeid);
	    	        vo.setLatitude(latitude);
	    	        vo.setLongitude(longitude);
	    	        vo.setAddress(address);
	    	       
	    	        if(firstimage!="") {
	    	        	dao.history(vo);
	    	        }
	    	        
	    			
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
  
        }
       List<Historic_siteVO> list2= dao.history_list();
       System.out.println(start);
       if(start==1) {
    	   System.out.println("유적지 카운트에요!!!"+list2.size());
	      for(int i=0;i<list2.size();i++) {
	    	   System.out.println("여기는 history detail  데이터 작업중");
	    	   System.out.println(list2.get(i).getBno());
	    	   System.out.println(list2.get(i).getFirst_image());
	    	   System.out.println(list2.get(i).getContent_id());
	    	   System.out.println(list2.get(i).getContent_typeid());
	    	   System.out.println(list2.get(i).getLatitude());
	    	   System.out.println(list2.get(i).getLongitude());
	    	   System.out.println(list2.get(i).getPeriod());
	    	   System.out.println(list2.get(i).getAddress());
	    	   System.out.println(list2.get(i).getSite_name());
	    	   System.out.println(list2.get(i).getThema());
	    	   historydetail(list2.get(i).getContent_id(),list2.get(i).getContent_typeid(),list2.get(i).getBno());
	
	       }
       }else {
    	   System.out.println("유적지 카운트2에요!!"+vocount);
    	   for(int i=vocount;i<list2.size();i++) {
	    	   System.out.println("여기는 history detail  데이터 작업중");
	    	   System.out.println(list2.get(i).getBno());
	    	   System.out.println(list2.get(i).getFirst_image());
	    	   System.out.println(list2.get(i).getContent_id());
	    	   System.out.println(list2.get(i).getContent_typeid());
	    	   System.out.println(list2.get(i).getLatitude());
	    	   System.out.println(list2.get(i).getLongitude());
	    	   System.out.println(list2.get(i).getPeriod());
	    	   System.out.println(list2.get(i).getAddress());
	    	   System.out.println(list2.get(i).getSite_name());
	    	   System.out.println(list2.get(i).getThema());
	    	   historydetail(list2.get(i).getContent_id(),list2.get(i).getContent_typeid(),list2.get(i).getBno());
	
	       }
       }
	   if(start==1) {
		   for(int i=0;i<list2.size();i++) {
			   food_list(list2.get(i).getLatitude(),list2.get(i).getLongitude(),list2.get(i).getBno());
		   }
	   }else {
		   for(int i=vocount;i<list2.size();i++) {
			   food_list(list2.get(i).getLatitude(),list2.get(i).getLongitude(),list2.get(i).getBno());
		   }
	   }
       System.out.println("음식점 리스트 끝");
	     if(start==1){
	     	for(int i=0;i<list2.size();i++) {
    	   		room_list(list2.get(i).getLatitude(),list2.get(i).getLongitude(),list2.get(i).getBno());
       		}
       	}else{
	       	 for(int i=vocount;i<list2.size();i++) {
				   room_list(list2.get(i).getLatitude(),list2.get(i).getLongitude(),list2.get(i).getBno());
			   }
       	}
	     System.out.println("룸 리스트 끝");
      
	   if(start==1) {
		   for(int i=0;i<list2.size();i++) {
			   
			   history_image(list2.get(i).getBno(),list2.get(i).getContent_id(),list2.get(i).getContent_typeid());
		   }
	   }else {
		   for(int i=vocount;i<list2.size();i++) {
			   history_image(list2.get(i).getBno(),list2.get(i).getContent_id(),list2.get(i).getContent_typeid());
		   }
	   }
	   System.out.println("이미지 작업중 first_image");
	   
	   List<Nearby_attractionVO> list3=dao.food_list();
	   if(start==1){
		   for(int i=0;i<list3.size();i++) {
			   food_image(list3.get(i).getContent_id(),list3.get(i).getBno(),list3.get(i).getAttraction_name());
		   }
	   }else{
	   		 for(int i=vocount2;i<list3.size();i++) {
			   food_image(list3.get(i).getContent_id(),list3.get(i).getBno(),list3.get(i).getAttraction_name());
		   }
	   }
	  
	   System.out.println("음식점 이미지 끝");
	   List<Nearby_attractionVO> list6=dao.room_list();

	   if(start==1){
		   System.out.println("룸이미지 왜안되닝;;");
	      for(int i=0;i<list6.size();i++) {
	    	  System.out.println("룸이미지 작업들어간다");
	    	  room_image(list6.get(i).getContent_id(),list6.get(i).getBno(),list6.get(i).getAttraction_name());
	      }
	   }else{
		  
	    	  System.out.println("룸이미지 작업들어간다");

	   	  for(int i=vocount3;i<list6.size();i++) {
	    	  room_image(list6.get(i).getContent_id(),list6.get(i).getBno(),list6.get(i).getAttraction_name());
	      }
	   }
	   System.out.println("룸이미지 끝");
	   System.out.println("시도 이동");
	   sido_count++;
	   if(sido_count==3) {
		   count++;
	   }
	   if(sido_count==6) {
		   count++;
	   }
	   if(sido_count==9) {
		   sido_count=31;
	   }
	   if(sido_count==33) {
		   count++;
	   }
	   if(sido_count==36) {
		   count++;
	   }
	  

	   if(sido_count>39) {
		   sido_count=1;
		   page_count++;
	   }

	   if(count<=5) {
		   System.out.println("기무쓰띠");
	   historic(sido_count,page_count,2);
	   }
    
       
	}
	String detail;
	String latitude;
	String longitude;
	String carriage;
	String infocenter;
	String restday ="";
	String creditcard;
	String pet;
	String expguide;
	String expagerange = "";
	String park;
	String usetime;
	String homepage;
	String firstmenu;
	String infocenterfood;
	String kidsfacility;
	String opentimefood;
	String parkingfood;
	String reservationfood;
	String restdatefood;
	String smoking;
	String treatmenu;
	String packing;
	String creditcardfood;
	int index;
	int index2;

	@Transactional
	public void historydetail(String contentid,String contenttypeid,Integer bno) throws Exception{
   
      
        System.out.println("--------------------------------------공통정보---------------------------------------디테일");
        
        StringBuilder urlBuilder2= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+serviceKey+"&contentTypeId="+contenttypeid+"&contentId="+contentid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y");
        StringBuilder urlBuilder4= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey="+serviceKey+"&contentTypeId="+contenttypeid+"&contentId="+contentid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y&listYN=Y");
       
        URL url2= new URL(urlBuilder2.toString());
        URL url4= new URL(urlBuilder4.toString());
        BufferedReader rd2;
        BufferedReader rd4;

        HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
        HttpURLConnection conn4 = (HttpURLConnection) url4.openConnection();

        conn2.setRequestMethod("GET");
        conn2.setRequestProperty("Content-type", "application/json"); 
        
     
        conn4.setRequestMethod("GET");
        conn4.setRequestProperty("Content-type", "application/json"); 
        if(conn2.getResponseCode() >= 200 && conn2.getResponseCode() <= 300) {
            rd2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
        } else {
            rd2 = new BufferedReader(new InputStreamReader(conn2.getErrorStream()));
        }

        
        
        if(conn4.getResponseCode() >= 200 && conn4.getResponseCode() <= 300) {
            rd4 = new BufferedReader(new InputStreamReader(conn4.getInputStream()));
        } else {
            rd4 = new BufferedReader(new InputStreamReader(conn4.getErrorStream()));
        }
        
        StringBuilder sb2= new StringBuilder();

        StringBuilder sb4= new StringBuilder();
        String line2;
        String line4;
        while((line2=rd2.readLine())!=null) {
        	sb2.append(line2);
        }
        
        System.out.println(sb2.toString());
       
        
        while((line4=rd4.readLine())!=null) {
        	sb4.append(line4);
        }
        System.out.println(sb4.toString());
        rd2.close();
        conn2.disconnect();
  
        rd4.close();
        conn4.disconnect();
      
        index=sb2.indexOf("<overview>");
        
        index2=sb2.indexOf("</overview>");
        detail=sb2.substring(index+10,index2);
        detail.replaceAll("<br>", "\n");
        detail.replaceAll("<br /><br /><br />", "\n");

        detail.replaceAll("<br />", "\n");

        index=sb4.indexOf("<chkbabycarriage>");
        index2=sb4.indexOf("</chkbabycarriage>");
        carriage=sb4.substring(index+17,index2);
       
        if(sb4.indexOf("<infocenter>")!=-1) {
	        index=sb4.indexOf("<infocenter>");
	        index2=sb4.indexOf("</infocenter>");
	        infocenter=sb4.substring(index+12, index2);
        }
        infocenter.replaceAll("<br />","\n");
        index=sb4.indexOf("<chkpet>");
        index2=sb4.indexOf("</chkpet>");
        pet=sb4.substring(index+8, index2);
        
        if(sb4.indexOf("<restdate>")!=-1) {
	        index=sb4.indexOf("<restdate>");
	        index2=sb4.indexOf("</restdate>");
	        restday=sb4.substring(index+10, index2);
        }
        restday.replaceAll("<br>","\n");
        index=sb4.indexOf("<chkcreditcard>");
        index2=sb4.indexOf("</chkcreditcard>");
        creditcard=sb4.substring(index+15, index2);
       
        if(sb4.indexOf("<expagerange>")!=-1) {
	        index=sb4.indexOf("<expagerange>");
	        index2=sb4.indexOf("</expagerange>");
	        expagerange=sb4.substring(index+13,index2);
        }
        index=sb4.indexOf("<expguide>");
        index2=sb4.indexOf("</expguide>");
        expguide=sb4.substring(index+10,index2);
        expguide.replaceAll("<br>;","\n");
        expguide.replaceAll("<br />;","\n");

        index=sb4.indexOf("<parking>");
        index2=sb4.indexOf("</parking>");
        park=sb4.substring(index+9, index2);
        
        index=sb4.indexOf("<usetime>");
        index2=sb4.indexOf("</usetime>");
        usetime=sb4.substring(index+9, index2);
        usetime.replaceAll("<br>", "\n");
        usetime.replaceAll("<br />", "\n");
        System.out.println(detail);
        System.out.println(expagerange);
        System.out.println(expguide);
        System.out.println(park);
        System.out.println(usetime);
        System.out.println(creditcard);
        System.out.println(restday);
        System.out.println(infocenter);
        System.out.println(pet);
        System.out.println(carriage);
        Historic_site_detailVO vo=new Historic_site_detailVO();
        vo.setDetail(detail);
        vo.setCarriage(carriage);
        vo.setInfo_center(infocenter);
        vo.setRest_day(restday);
        vo.setCredit_card(creditcard);
        vo.setPet(pet);
        vo.setExp_guide(expguide);
        vo.setExpage_range(expagerange);
        vo.setPark(park);
        vo.setUse_time(usetime);
        vo.setBno(bno);
       dao.history_detail(vo);
       
   
      
	}
	
	
	public void history_image(Integer bno,String contentid,String contenttypeid) throws Exception {
		StringBuilder urlBuilder3= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey="+serviceKey+"&contentTypeId="+contenttypeid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&contentId="+contentid+"&imageYN=Y");

	       URL url3= new URL(urlBuilder3.toString());
	       
	       BufferedReader rd3;

	       HttpURLConnection conn3 = (HttpURLConnection) url3.openConnection();

	       conn3.setRequestMethod("GET");
	       conn3.setRequestProperty("Content-type", "application/json"); 
	       
	       if(conn3.getResponseCode() >= 200 && conn3.getResponseCode() <= 300) {
	           rd3 = new BufferedReader(new InputStreamReader(conn3.getInputStream()));
	       } else {
	           rd3 = new BufferedReader(new InputStreamReader(conn3.getErrorStream()));
	       }
	       StringBuilder sb3= new StringBuilder();
	        String line3;

	       while((line3=rd3.readLine())!=null) {
	       	sb3.append(line3);
	       }
	       rd3.close();
	       conn3.disconnect();
	       
	      
	        if(sb3.toString().indexOf("<originimgurl>")!=-1) {
	        String img[]=sb3.toString().split("<originimgurl>");
	        for(int j=1;j<img.length;j++) {
	        	index=img[j].indexOf("</originimgurl>");
	        	img[j]=img[j].substring(0, index);
	            System.out.println(img[j]);
	            Historic_site_imageVO im=new Historic_site_imageVO();	
	            im.setFullname(img[j]);
	            im.setImage_num(j);
	            im.setBno(bno);
	            im.setSite_type("유적지");          
	            if(img[j]!="") {
	            	dao.history_image(im);
	            }
	        }
	        
	        
	}
	
	}
	
	public void food_detail(String contentid,Nearby_attractionVO vo,Integer bno)throws Exception{
		StringBuilder urlBuilder6= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+serviceKey+"&contentTypeId=39&contentId="+contentid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y\n");

        URL url6= new URL(urlBuilder6.toString());
        BufferedReader rd6;

        HttpURLConnection conn6 = (HttpURLConnection) url6.openConnection();
        
        if(conn6.getResponseCode() >= 200 && conn6.getResponseCode() <= 300) {
            rd6 = new BufferedReader(new InputStreamReader(conn6.getInputStream()));
        } else {
            rd6 = new BufferedReader(new InputStreamReader(conn6.getErrorStream()));
        }
        
        StringBuilder sb6= new StringBuilder();
        String line6;
        while((line6=rd6.readLine())!=null) {
        	sb6.append(line6);
        }
        System.out.println(sb6.toString());
        String firstimage="";
        String arr4[]=sb6.toString().split("<item>");
        for(int q=1;q<arr4.length;q++) {
        if(arr4[q].indexOf("<firstimage>")!=-1) {
        	index=arr4[q].indexOf("<firstimage>");
        	index2=arr4[q].indexOf("</firstimage>");
        	firstimage=arr4[q].substring(index+12, index2);
        }else if(arr4[q].indexOf("<firstimage2>")!=-1) {
        	index=arr4[q].indexOf("<firstimage2>");
        	index2=arr4[q].indexOf("</firstimage2>");
        	firstimage=arr4[q].substring(index+13, index2);
        }
        index=arr4[q].indexOf("<mapx>");
        index2=arr4[q].indexOf("</mapx>");
        String mapx=arr4[q].substring(index+6, index2);
        index=arr4[q].indexOf("<mapy>");
        index2=arr4[q].indexOf("</mapy>");
        String mapy=arr4[q].substring(index+6, index2);
        index=arr4[q].indexOf("<overview>");
        index2=arr4[q].indexOf("</overview>");
        String overview=arr4[q].substring(index+10, index2);
        overview.replaceAll("<br>", "");
        overview.replaceAll("<br />;", "");
        index=arr4[q].indexOf("<tel>");
        index2=arr4[q].indexOf("</tel>");
        String tel=arr4[q].substring(index+5, index2);
        if(arr4[q].indexOf("<homepage>")!=-1) {
        	index=arr4[q].indexOf("<homepage>");
        	index2=arr4[q].indexOf("</homepage>");
        	homepage=arr4[q].substring(index+10, index2);
        	System.out.println(homepage);
        } 
  
       
        vo.setLatitude(mapx);
        vo.setLongitude(mapy);
        vo.setAttraction_detail(overview);
        vo.setTel(tel);
        vo.setHomepage(homepage);
        vo.setFirst_image(firstimage);
        System.out.println(vo.getAttraction_name());
        System.out.println(vo.getAttraction_type());
        System.out.println(vo.getBno());
        System.out.println(vo.getAddress());
        System.out.println(vo.getLatitude());
        System.out.println(vo.getLongitude());
        System.out.println(vo.getAttraction_detail());
        System.out.println(vo.getTel());
        System.out.println(vo.getHomepage());
        if(firstimage!="") {
        	dao.food(vo);
        }
        
        List<Nearby_attractionVO> list=dao.food_list();
      
        for(int j=0;j<list.size();j++) {
        	System.out.println("여기는 음식점 데이터 작업중입니다");
        	System.out.println(list.get(j).getBno());
        	System.out.println(list.get(j).getContent_id());
        	System.out.println(list.get(j).getAttraction_type());
        	System.out.println(list.get(j).getAttraction_name());
        	System.out.println(list.get(j).getAttraction_detail());
        	System.out.println(list.get(j).getLatitude());
        	System.out.println(list.get(j).getLongitude());
        	System.out.println(list.get(j).getHomepage());
        	System.out.println(list.get(j).getAddress());
        	System.out.println(list.get(j).getTel());
        }

        }
        
	}
	public void food_image(String contentid,Integer bno,String name)throws Exception{
		 StringBuilder urlBuilder8= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey="+serviceKey+"&contentTypeId=39&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&contentId="+contentid+"&imageYN=N\n");
	        URL url8= new URL(urlBuilder8.toString());
	        BufferedReader rd8;

	        HttpURLConnection conn8 = (HttpURLConnection) url8.openConnection();
	        
	        if(conn8.getResponseCode() >= 200 && conn8.getResponseCode() <= 300) {
	            rd8 = new BufferedReader(new InputStreamReader(conn8.getInputStream()));
	        } else {
	            rd8= new BufferedReader(new InputStreamReader(conn8.getErrorStream()));
	        }
	        
	        StringBuilder sb8= new StringBuilder();
	        String line8;
	        while((line8=rd8.readLine())!=null) {
	        	sb8.append(line8);
	        }
	        
	       
	        
	        if(sb8.toString().indexOf("<originimgurl>")!=-1) {
		        String arr6[]=sb8.toString().split("<originimgurl>");
		        for(int k=1;k<arr6.length;k++) {
			        index=arr6[k].indexOf("</originimgurl>");
			        String foodimage=arr6[k].substring(0, index);
			        System.out.println(foodimage);
			        Historic_site_imageVO im=new Historic_site_imageVO();
			        im.setBno(bno);
			        im.setFullname(name+foodimage);
			        im.setImage_num(k);
			        im.setSite_type("음식");
			        if(foodimage!="") {
			        	dao.history_image(im);	
			        }
			        
		        }
	        }
	}
	@Transactional
    public void food_list(String latitude,String longitude,Integer bno) throws IOException {
    	
		String contentid="";
        System.out.println("-------------------------------------------------------------------------------음식점");
        StringBuilder urlBuilder5= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey="+serviceKey+"&contentTypeId=39&mapX="+latitude+"&mapY="+longitude+"&radius=3000&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=20&pageNo=1\n");
        URL url5= new URL(urlBuilder5.toString());
        BufferedReader rd5;

        HttpURLConnection conn5 = (HttpURLConnection) url5.openConnection();
        
        if(conn5.getResponseCode() >= 200 && conn5.getResponseCode() <= 300) {
            rd5 = new BufferedReader(new InputStreamReader(conn5.getInputStream()));
        } else {
            rd5 = new BufferedReader(new InputStreamReader(conn5.getErrorStream()));
        }
        
        StringBuilder sb5= new StringBuilder();
        String line5;
        while((line5=rd5.readLine())!=null) {
        	sb5.append(line5);
        }
        System.out.println(sb5.toString());
        String arr3[]=sb5.toString().split("<item>");
        for(int j=1;j<arr3.length;j++) {
        index=arr3[j].indexOf("</addr1>");
        String addr1=arr3[j].substring(7, index);
        
        index=arr3[j].indexOf("<contentid>");
        index2=arr3[j].indexOf("</contentid>");
        contentid=arr3[j].substring(index+11, index2);
        index=arr3[j].indexOf("<title>");
        index2=arr3[j].indexOf("</title>");
        String title=arr3[j].substring(index+7, index2);
        Nearby_attractionVO vo= new Nearby_attractionVO();
        
        vo.setContent_id(contentid);
        vo.setAttraction_name(title);
        vo.setAddress(addr1);
        vo.setAttraction_type("음식");
        vo.setBno(bno);
       
        try {
			//dao.food(vo);
        	food_detail(contentid,vo,bno);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        rd5.close();
        conn5.disconnect();
        
        }
       }
	@Transactional
    public void room_list(String latitude,String longitude,Integer bno) throws Exception{
    	StringBuilder urlBuilder9= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey="+serviceKey+"&contentTypeId=32&mapX="+latitude+"&mapY="+longitude+"&radius=3000&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=20&pageNo=1");
        URL url9= new URL(urlBuilder9.toString());
        BufferedReader rd9;

        HttpURLConnection conn9 = (HttpURLConnection) url9.openConnection();
        String first_image="";
        String addr;
        String contentid;
        String title;
        if(conn9.getResponseCode() >= 200 && conn9.getResponseCode() <= 300) {
            rd9 = new BufferedReader(new InputStreamReader(conn9.getInputStream()));
        } else {
            rd9 = new BufferedReader(new InputStreamReader(conn9.getErrorStream()));
        }
        System.out.println("--------------------------------------------------룸리스트");
        StringBuilder sb9= new StringBuilder();
        String line9;
        while((line9=rd9.readLine())!=null) {
        	sb9.append(line9);
        }
    	String arr6[]=sb9.toString().split("<item>");
    	int index;
    	int index2;
    	for(int i=1;i<arr6.length;i++) {
    	if(arr6[i].indexOf("<firstimage>")!=-1) {
    		index=arr6[i].indexOf("<firstimage>");
    		index2=arr6[i].indexOf("</firstimage>");
    		first_image=arr6[i].substring(index+12, index2);
    	}else if(arr6[i].indexOf("<firstimage2>")!=-1) {
    		index=arr6[i].indexOf("<firstimage2>");
    		index2=arr6[i].indexOf("</firstimage2>");
    		first_image=arr6[i].substring(index+13, index2);
    	}else {
    		first_image="";
    	}
    	index=arr6[i].indexOf("</addr1>");
    	addr=arr6[i].substring(7,index);
    	System.out.println(addr);
    	index=arr6[i].indexOf("<contentid>");
    	index2=arr6[i].indexOf("</contentid>");
    	contentid=arr6[i].substring(index+11, index2);
    	System.out.println(contentid);
    	index=arr6[i].indexOf("<title>");
    	index2=arr6[i].indexOf("</title>");
    	title=arr6[i].substring(index+7, index2);
    	System.out.println(title);
    	Nearby_attractionVO vo = new Nearby_attractionVO();
    	vo.setContent_id(contentid);
    	vo.setFirst_image(first_image);
    	vo.setAddress(addr);
    	vo.setAttraction_name(title);
    	vo.setAttraction_type("숙박");
    	vo.setBno(bno);
    	
    	System.out.println("숙박 디테일 ----------------------------------------------");
    	  try {
  			//dao.food(vo);
          	room_detail(contentid,vo);

  		} catch (Exception e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
    	   rd9.close();
           conn9.disconnect();
    	}
	}
    public void room_image(String contentid,int bno,String name) throws Exception{
    	StringBuilder urlBuilder8= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey="+serviceKey+"&contentTypeId=32&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&contentId="+contentid+"&imageYN=Y");
        URL url8= new URL(urlBuilder8.toString());
        BufferedReader rd8;

        System.out.println("룸이미지 작업중..............................................");
        HttpURLConnection conn8 = (HttpURLConnection) url8.openConnection();
        
        if(conn8.getResponseCode() >= 200 && conn8.getResponseCode() <= 300) {
            rd8 = new BufferedReader(new InputStreamReader(conn8.getInputStream()));
        } else {
            rd8= new BufferedReader(new InputStreamReader(conn8.getErrorStream()));
        }
        
        StringBuilder sb8= new StringBuilder();
        String line8;
        while((line8=rd8.readLine())!=null) {
        	sb8.append(line8);
        }
        

        
        if(sb8.toString().indexOf("<originimgurl>")!=-1) {
	        String arr6[]=sb8.toString().split("<originimgurl>");
	        for(int k=1;k<arr6.length;k++) {
		        index=arr6[k].indexOf("</originimgurl>");
		        String roomimage=arr6[k].substring(0, index);
		        System.out.println(roomimage);
		        Historic_site_imageVO im=new Historic_site_imageVO();
		        im.setBno(bno);
		        im.setFullname(name+roomimage);
		        im.setImage_num(k);
		        im.setSite_type("숙박");
		        System.out.println(bno);
		        System.out.println(name+roomimage);
		        System.out.println(k);
		        System.out.println("숙박");
		        if(roomimage!="") {
		        	dao.history_image(im);
		        }
	        }
        }else {
        
        
	        StringBuilder urlBuilder9= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey="+serviceKey+"&contentTypeId=32&contentId="+contentid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y");
	        URL url9= new URL(urlBuilder9.toString());
	        BufferedReader rd9;
	
	        HttpURLConnection conn9 = (HttpURLConnection) url9.openConnection();
	        
	        if(conn9.getResponseCode() >= 200 && conn9.getResponseCode() <= 300) {
	            rd9 = new BufferedReader(new InputStreamReader(conn9.getInputStream()));
	        } else {
	            rd9= new BufferedReader(new InputStreamReader(conn9.getErrorStream()));
	        }
	        
	        StringBuilder sb9= new StringBuilder();
	        String line9;
	        while((line9=rd9.readLine())!=null) {
	        	sb9.append(line9);
	        }
	        String arr7[]=sb9.toString().split("<item>");
	        for(int i=1;i<arr7.length;i++) {
		        Historic_site_imageVO im=new Historic_site_imageVO();

	        	if(arr7[i].indexOf("<roomimg1>")!=-1) {
	        		index=arr7[i].indexOf("<roomimg1>");
	        		index2=arr7[i].indexOf("</roomimg1>");
	        		String roomimage=arr7[i].substring(index+10,index2);
	        		im.setBno(bno);
	        		im.setFullname(name+roomimage);
	        		im.setImage_num(i);
	        		im.setSite_type("숙박");
	        		 System.out.println(bno);
	  		        System.out.println(name+roomimage);
	  		        System.out.println(i);
	  		        System.out.println("숙박");
			        if(roomimage!="") {
			        	dao.history_image(im);
			        }

	        	}else if(arr7[i].indexOf("<roomimg2>")!=-1) {
	        		index=arr7[i].indexOf("<roomimg2>");
	        		index2=arr7[i].indexOf("</roomimg2>");
	        		String roomimage=arr7[i].substring(index+10,index2);
	        		im.setBno(bno);
	        		im.setFullname(name+roomimage);
	        		im.setImage_num(i);
	        		im.setSite_type("숙박");
	        		
	        		System.out.println(bno);
	  		        System.out.println(name+roomimage);
	  		        System.out.println(i);
	  		        System.out.println("숙박");
		  		      if(roomimage!="") {
				        	dao.history_image(im);
				        }
	        	}else if(arr7[i].indexOf("<roomimg3>")!=-1) {
	        		index=arr7[i].indexOf("<roomimg3>");
	        		index2=arr7[i].indexOf("</roomimg3>");
	        		String roomimage=arr7[i].substring(index+10,index2);
	        		im.setBno(bno);
	        		im.setFullname(name+roomimage);
	        		im.setImage_num(i);
	        		im.setSite_type("숙박");
	        		  System.out.println(bno);
	  		        System.out.println(name+roomimage);
	  		        System.out.println(i);
	  		        System.out.println("숙박");
		  		      if(roomimage!="") {
				        	dao.history_image(im);
				        }
	        	}
	        }
        }
            
   }
    public void room_detail(String contentid,Nearby_attractionVO vo)throws Exception{
     

    	StringBuilder urlBuilder11= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+serviceKey+"&contentTypeId=32&contentId="+contentid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y");
        URL url11= new URL(urlBuilder11.toString());
        BufferedReader rd11;

        HttpURLConnection conn11 = (HttpURLConnection) url11.openConnection();
       
        if(conn11.getResponseCode() >= 200 && conn11.getResponseCode() <= 300) {
            rd11 = new BufferedReader(new InputStreamReader(conn11.getInputStream()));
        } else {
            rd11= new BufferedReader(new InputStreamReader(conn11.getErrorStream()));
        }
        System.out.println("--------------------------------------------------룸디테일");
        StringBuilder sb11= new StringBuilder();
        String line11;
        while((line11=rd11.readLine())!=null) {
        	sb11.append(line11);
        }
        System.out.println(sb11.toString());
        String arr8[]=sb11.toString().split("<item>");
        for(int q=1;q<arr8.length;q++) {
         
            index=arr8[q].indexOf("<mapx>");
            index2=arr8[q].indexOf("</mapx>");
            String mapx=arr8[q].substring(index+6, index2);
            index=arr8[q].indexOf("<mapy>");
            index2=arr8[q].indexOf("</mapy>");
            String mapy=arr8[q].substring(index+6, index2);
            index=arr8[q].indexOf("<overview>");
            index2=arr8[q].indexOf("</overview>");
            String overview=arr8[q].substring(index+10, index2);
            overview.replaceAll("<br>", "");
            overview.replaceAll("<br />", "");
            index=arr8[q].indexOf("<tel>");
            index2=arr8[q].indexOf("</tel>");
            String tel=arr8[q].substring(index+5, index2);
            if(arr8[q].indexOf("<homepage>")!=-1) {
            	index=arr8[q].indexOf("<homepage>");
            	index2=arr8[q].indexOf("</homepage>");
            	homepage=arr8[q].substring(index+10, index2);
            	System.out.println(homepage);
            } 
      
           
            vo.setLatitude(mapx);
            vo.setLongitude(mapy);
            vo.setAttraction_detail(overview);
            vo.setTel(tel);
            vo.setHomepage(homepage);
            System.out.println(vo.getFirst_image());
            System.out.println(vo.getAttraction_name());
            System.out.println(vo.getAttraction_type());
            System.out.println(vo.getBno());
            System.out.println(vo.getAddress());
            System.out.println(vo.getLatitude());
            System.out.println(vo.getLongitude());
            System.out.println(vo.getAttraction_detail());
            System.out.println(vo.getTel());
            System.out.println(vo.getHomepage());
            if(vo.getFirst_image()!="") {
            	dao.food(vo);
            }
            
            List<Nearby_attractionVO> list=dao.food_list();
          
            for(int j=0;j<list.size();j++) {
            	System.out.println("여기는 숙소 데이터 작업중입니다");
            	System.out.println(list.get(j).getBno());
            	System.out.println(list.get(j).getContent_id());
            	System.out.println(list.get(j).getAttraction_type());
            	System.out.println(list.get(j).getAttraction_name());
            	System.out.println(list.get(j).getAttraction_detail());
            	System.out.println(list.get(j).getLatitude());
            	System.out.println(list.get(j).getLongitude());
            	System.out.println(list.get(j).getHomepage());
            	System.out.println(list.get(j).getAddress());
            	System.out.println(list.get(j).getTel());
            }

            }
    
    }
	
}
