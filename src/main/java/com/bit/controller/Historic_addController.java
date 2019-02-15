package com.bit.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.domain.Historic_siteVO;
import com.bit.domain.Historic_site_detailVO;
import com.bit.domain.Historic_site_imageVO;
import com.bit.domain.Nearby_attractionVO;
import com.bit.persistence.HISTORIC_SITE_DAO;

@Controller
public class Historic_addController {

	@Inject
	private HISTORIC_SITE_DAO dao;
	
	@RequestMapping("/historic/{sido}/{pagenum}/{national}")
	@Transactional
	public void historic(@PathVariable int sido,@PathVariable int pagenum,@PathVariable String national) throws Exception{
		
		String history_name;
    	String latitude;
    	String longitude;
    	String address;
    	String contentid;
    	String contenttypeid;
    	int index;
    	int index2;
        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/"+national+"Service/areaBasedList?ServiceKey=EeCFhukHh79xQCHczQD0n4rnAP8u8VEZBk9Ptn%2FBL8EHoQhHhZi4nEjrPryhc8Wlnz8AXj2oXfwKGlcLY37a6A%3D%3D&contentTypeId=12&areaCode="+sido+"&sigunguCode=&cat1=A02&cat2=A0201&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo="+pagenum); /*URL*/
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
        
      
        StringBuilder sb = new StringBuilder();
        String line;
        
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        String arr[]=new String[1000];
       
        arr=sb.toString().split("<item>");
        
        for(int i=1;i<arr.length;i++) {
        	System.out.println("----------------------------------------시작----------");
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
    	        vo.setSite_name(history_name);
    	        vo.setLatitude(latitude);
    	        vo.setLongitude(longitude);
    	        vo.setAddress(address);
    	        dao.history(vo);
    	        
    			historydetail(contentid,contenttypeid,vo.getBno());
    			food_list(latitude,longitude,vo.getBno());
    	        room_list(latitude,longitude,vo.getBno());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

      
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
        
        StringBuilder urlBuilder2= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=EeCFhukHh79xQCHczQD0n4rnAP8u8VEZBk9Ptn%2FBL8EHoQhHhZi4nEjrPryhc8Wlnz8AXj2oXfwKGlcLY37a6A%3D%3D&contentTypeId="+contenttypeid+"&contentId="+contentid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y");
        StringBuilder urlBuilder3= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey=EeCFhukHh79xQCHczQD0n4rnAP8u8VEZBk9Ptn%2FBL8EHoQhHhZi4nEjrPryhc8Wlnz8AXj2oXfwKGlcLY37a6A%3D%3D&contentTypeId="+contenttypeid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&contentId="+contentid+"&imageYN=Y");
        StringBuilder urlBuilder4= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=EeCFhukHh79xQCHczQD0n4rnAP8u8VEZBk9Ptn%2FBL8EHoQhHhZi4nEjrPryhc8Wlnz8AXj2oXfwKGlcLY37a6A%3D%3D&contentTypeId="+contenttypeid+"&contentId="+contentid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y&listYN=Y");
       
        URL url2= new URL(urlBuilder2.toString());
        URL url3= new URL(urlBuilder3.toString());
        URL url4= new URL(urlBuilder4.toString());
        BufferedReader rd2;
        BufferedReader rd3;
        BufferedReader rd4;

        HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
        HttpURLConnection conn3 = (HttpURLConnection) url3.openConnection();
        HttpURLConnection conn4 = (HttpURLConnection) url4.openConnection();

        conn2.setRequestMethod("GET");
        conn2.setRequestProperty("Content-type", "application/json"); 
        
        conn3.setRequestMethod("GET");
        conn3.setRequestProperty("Content-type", "application/json"); 
        
        conn4.setRequestMethod("GET");
        conn4.setRequestProperty("Content-type", "application/json"); 
        if(conn2.getResponseCode() >= 200 && conn2.getResponseCode() <= 300) {
            rd2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
        } else {
            rd2 = new BufferedReader(new InputStreamReader(conn2.getErrorStream()));
        }
        if(conn3.getResponseCode() >= 200 && conn3.getResponseCode() <= 300) {
            rd3 = new BufferedReader(new InputStreamReader(conn3.getInputStream()));
        } else {
            rd3 = new BufferedReader(new InputStreamReader(conn3.getErrorStream()));
        }
        
        
        if(conn4.getResponseCode() >= 200 && conn4.getResponseCode() <= 300) {
            rd4 = new BufferedReader(new InputStreamReader(conn4.getInputStream()));
        } else {
            rd4 = new BufferedReader(new InputStreamReader(conn4.getErrorStream()));
        }
        
        StringBuilder sb2= new StringBuilder();
        StringBuilder sb3= new StringBuilder();

        StringBuilder sb4= new StringBuilder();
        String line2;
        String line3;
        String line4;
        while((line2=rd2.readLine())!=null) {
        	sb2.append(line2);
        }
        System.out.println(sb2.toString());
        while((line3=rd3.readLine())!=null) {
        	sb3.append(line3);
        }
        
        while((line4=rd4.readLine())!=null) {
        	sb4.append(line4);
        }
        rd2.close();
        conn2.disconnect();
        rd3.close();
        conn3.disconnect();
        rd4.close();
        conn4.disconnect();
        String firstimage="";
        if(sb2.toString().indexOf("<firstimage>")!=-1) {
	        index=sb2.indexOf("<firstimage>");
	        index2=sb2.indexOf("</firstimage>");
	        firstimage=sb2.substring(index+12,index2);
	        System.out.println(firstimage);
        }
        index=sb2.indexOf("<overview>");
        index2=sb2.indexOf("</overview>");
        detail=sb2.substring(index+10,index2);
        
        index=sb4.indexOf("<chkbabycarriage>");
        index2=sb4.indexOf("</chkbabycarriage>");
        carriage=sb4.substring(index+17,index2);
       
        if(sb4.indexOf("<infocenter>")!=-1) {
	        index=sb4.indexOf("<infocenter>");
	        index2=sb4.indexOf("</infocenter>");
	        infocenter=sb4.substring(index+12, index2);
        }
        index=sb4.indexOf("<chkpet>");
        index2=sb4.indexOf("</chkpet>");
        pet=sb4.substring(index+8, index2);
        
        if(sb4.indexOf("<restdate>")!=-1) {
	        index=sb4.indexOf("<restdate>");
	        index2=sb4.indexOf("</restdate>");
	        restday=sb4.substring(index+10, index2);
        }
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
        
        index=sb4.indexOf("<parking>");
        index2=sb4.indexOf("</parking>");
        park=sb4.substring(index+9, index2);
        
        index=sb4.indexOf("<usetime>");
        index2=sb4.indexOf("</usetime>");
        usetime=sb4.substring(index+9, index2);
        
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
        Historic_site_imageVO im2=new Historic_site_imageVO();	
        im2.setBno(bno);
        im2.setFullname(firstimage);
        im2.setSite_type("유적지");
        im2.setImage_num(0);
        dao.history_image(im2);
        if(sb3.toString().indexOf("<originalimgurl>")!=-1) {
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
            dao.history_image(im);
        }
        }
        System.out.println("-----------------------------------------유적지 정보끝");
   
      
        }
	
	String history_name;
	String address;
	String contentid;
	String contenttypeid;
	
	public void food_detail(String contentid,Nearby_attractionVO vo,Integer bno)throws Exception{
		StringBuilder urlBuilder6= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=EeCFhukHh79xQCHczQD0n4rnAP8u8VEZBk9Ptn%2FBL8EHoQhHhZi4nEjrPryhc8Wlnz8AXj2oXfwKGlcLY37a6A%3D%3D&contentTypeId=39&contentId="+contentid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y\n");

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
        System.out.println(vo.getAttraction_name());
        System.out.println(vo.getAttraction_type());
        System.out.println(vo.getBno());
        System.out.println(vo.getAddress());
        System.out.println(vo.getLatitude());
        System.out.println(vo.getLongitude());
        System.out.println(vo.getAttraction_detail());
        System.out.println(vo.getTel());
        System.out.println(vo.getHomepage());
        dao.food(vo);
        
       /* StringBuilder urlBuilder7= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=58c9zeZcCAKF1cwMbo1bo46Lc6kVEs83id5skkstk9lgNwcodJlGoypZwmZl5TQu66OQ9r0ynjXqRdZMcBZSOA%3D%3D&contentTypeId=39&contentId="+contentid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y");
        URL url7= new URL(urlBuilder7.toString());
        BufferedReader rd7;

        HttpURLConnection conn7 = (HttpURLConnection) url7.openConnection();
        
        if(conn7.getResponseCode() >= 200 && conn7.getResponseCode() <= 300) {
            rd7 = new BufferedReader(new InputStreamReader(conn7.getInputStream()));
        } else {
            rd7 = new BufferedReader(new InputStreamReader(conn7.getErrorStream()));
        }
        
        StringBuilder sb7= new StringBuilder();
        String line7;
        while((line7=rd7.readLine())!=null) {
        	sb7.append(line7);
        }
        
       index=sb7.toString().indexOf("<chkcreditcardfood>");
        index2=sb7.toString().indexOf("</chkcreditcardfood>");
        creditcardfood=sb7.substring(index+19,index2);
        index=sb7.toString().indexOf("<firstmenu>");
        index2=sb7.toString().indexOf("</firstmenu>");
        firstmenu=sb7.substring(index+11, index2);
        index=sb7.toString().indexOf("<infocenterfood>");
        index2=sb7.toString().indexOf("</infocenterfood>");
        infocenterfood=sb7.substring(index+16, index2);
        if(sb7.toString().indexOf("<packing>")!=-1) {
	        index=sb7.toString().indexOf("<packing>");
	        index2=sb7.toString().indexOf("</packing>");
	        packing=sb7.substring(index+9, index2);
        }
        if(sb7.toString().indexOf("<parkingfood>")!=-1) {
	        index=sb7.toString().indexOf("<parkingfood>");
	        index2=sb7.toString().indexOf("</parkingfood>");
	        parkingfood=sb7.substring(index+13, index2);
	     }
        if(sb7.toString().indexOf("<reservationfood>")!=-1) {
        	index=sb7.toString().indexOf("<reservationfood>");
        	index2=sb7.toString().indexOf("</reservationfood>");
        	reservationfood=sb7.substring(index+17, index2);
        }
        index=sb7.toString().indexOf("<smoking>");
        index2=sb7.toString().indexOf("</smoking>");
        smoking=sb7.substring(index+9, index2);
        if(sb7.toString().indexOf("<restdatefood>")!=-1) {
        	index=sb7.toString().indexOf("<restdatefood>");
        	index2=sb7.toString().indexOf("</restdatefood>");
        	restdatefood=sb7.substring(index+14, index2);
        }
        index=sb7.toString().indexOf("<treatmenu>");
        index2=sb7.toString().indexOf("</treatmenu>");
        treatmenu=sb7.substring(index+11, index2);
       Nearby_attraction_foodVO vo2=new Nearby_attraction_foodVO();
        vo2.setRno(rno);
        vo2.setAttraction_detail(overview);
        vo2.setLatitude(mapx);
        vo2.setLongitude(mapy);
        vo2.setTel(tel);
        vo2.setChkcredit_card(creditcardfood);
        vo2.setFirst_menu(firstmenu);
        vo2.setInfo_center(infocenterfood);
        vo2.setPacking(packing);
        vo2.setParking(parkingfood);
        vo2.setReservation(reservationfood);
        vo2.setSmoking(smoking);
        vo2.setRest_date(restdatefood);
        vo2.setTreat_menu(treatmenu);
        vo2.setHomepage(homepage);
        System.out.println(vo2.getRno());
        System.out.println(vo2.getAttraction_detail());
        System.out.println(vo2.getLatitude());
        System.out.println(vo2.getLongitude());
        System.out.println(vo2.getTel());
        System.out.println(vo2.getHomepage());
        System.out.println(vo2.getChkcredit_card());
        System.out.println(vo2.getFirst_menu());
        System.out.println(vo2.getInfo_center());
        System.out.println(vo2.getPacking());
        System.out.println(vo2.getParking());
        System.out.println(vo2.getReservation());
        System.out.println(vo2.getSmoking());
        System.out.println(vo2.getRest_date());
        System.out.println(vo2.getTreat_menu());
        try {
			dao.food_detail(vo2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
        StringBuilder urlBuilder8= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey=EeCFhukHh79xQCHczQD0n4rnAP8u8VEZBk9Ptn%2FBL8EHoQhHhZi4nEjrPryhc8Wlnz8AXj2oXfwKGlcLY37a6A%3D%3D&contentTypeId=39&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&contentId="+contentid+"&imageYN=N\n");
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
        
        Historic_site_imageVO im2=new Historic_site_imageVO();
        im2.setBno(bno);
        im2.setFullname(firstimage);
        im2.setImage_num(0);
        im2.setSite_type("음식");
        dao.history_image(im2);
        if(sb8.toString().indexOf("<originimgurl>")!=-1) {
	        String arr6[]=sb8.toString().split("<originimgurl>");
	        for(int k=1;k<arr6.length;k++) {
		        index=arr6[k].indexOf("</originimgurl>");
		        String foodimage=arr6[k].substring(0, index);
		        System.out.println(foodimage);
		        Historic_site_imageVO im=new Historic_site_imageVO();
		        im.setBno(bno);
		        im.setFullname(foodimage);
		        im.setImage_num(k);
		        im.setSite_type("음식");
		        dao.history_image(im);
	        }
        }
        System.out.println("-------------------------음식점종료");

        }
        
	}
	@Transactional
    public void food_list(String latitude,String longitude,Integer bno) throws IOException {
    	

        System.out.println("-------------------------------------------------------------------------------음식점");
        StringBuilder urlBuilder5= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=EeCFhukHh79xQCHczQD0n4rnAP8u8VEZBk9Ptn%2FBL8EHoQhHhZi4nEjrPryhc8Wlnz8AXj2oXfwKGlcLY37a6A%3D%3D&contentTypeId=39&mapX="+latitude+"&mapY="+longitude+"&radius=2000&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1\n");
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
    	StringBuilder urlBuilder9= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=EeCFhukHh79xQCHczQD0n4rnAP8u8VEZBk9Ptn%2FBL8EHoQhHhZi4nEjrPryhc8Wlnz8AXj2oXfwKGlcLY37a6A%3D%3D&contentTypeId=32&mapX="+latitude+"&mapY="+longitude+"&radius=3000&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1");
        URL url9= new URL(urlBuilder9.toString());
        BufferedReader rd9;

        HttpURLConnection conn9 = (HttpURLConnection) url9.openConnection();
        
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
    	vo.setAddress(addr);
    	vo.setAttraction_name(title);
    	vo.setAttraction_type("숙박");
    	vo.setBno(bno);
    	
    	System.out.println("숙박 디테일 ----------------------------------------------");
    	
    	StringBuilder urlBuilder10= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=EeCFhukHh79xQCHczQD0n4rnAP8u8VEZBk9Ptn%2FBL8EHoQhHhZi4nEjrPryhc8Wlnz8AXj2oXfwKGlcLY37a6A%3D%3D&contentTypeId=32&contentId="+contentid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y\r\n");
        URL url10= new URL(urlBuilder10.toString());
        BufferedReader rd10;

        HttpURLConnection conn10 = (HttpURLConnection) url10.openConnection();
        String detail;
        String mapx;
        String mapy;

        if(conn10.getResponseCode() >= 200 && conn10.getResponseCode() <= 300) {
            rd10 = new BufferedReader(new InputStreamReader(conn10.getInputStream()));
        } else {
            rd10= new BufferedReader(new InputStreamReader(conn10.getErrorStream()));
        }
        System.out.println("--------------------------------------------------룸공통");
        StringBuilder sb10= new StringBuilder();
        String line10;
        while((line10=rd10.readLine())!=null) {
        	sb10.append(line10);
        }
        String homepage = "";
        String tel = "";
        String firstimage="";
        String arr7[]=sb10.toString().split("<item>");
        for(int j=1;j<arr7.length;j++) {
        if(arr7[j].indexOf("<firstimage>")!=-1) {
        	index=arr7[j].indexOf("<firstimage>");
        	index2=arr7[j].indexOf("</firstimage>");
        	firstimage=arr7[j].substring(index+12, index2);
        }
        index=arr7[j].indexOf("<overview>");
        index2=arr7[j].indexOf("</overview>");
        detail=arr7[j].substring(index+10, index2);
        System.out.println(detail);
        index=arr7[j].indexOf("<mapx>");
        index2=arr7[j].indexOf("</mapx>");
        mapx=arr7[j].substring(index+6,index2);
        System.out.println(mapx);
        index=arr7[j].indexOf("<mapy>");
        index2=arr7[j].indexOf("</mapy>");
        mapy=arr7[j].substring(index+6,index2);
        System.out.println(mapy);
        if(arr7[j].indexOf("<homepage>")!=-1) {
        	index=arr7[j].indexOf("<homepage>");
	    	index2=arr7[j].indexOf("</homepage>");
	    	homepage=arr7[j].substring(index+10, index2);
        }
        if(arr7[j].indexOf("<tel>")!=-1) {
	        index=arr7[j].indexOf("<tel>");
	        index2=arr7[j].indexOf("</tel>");
	        tel=arr7[j].substring(index+5, index2);
        }
        vo.setHomepage(homepage);
        vo.setTel(tel);
        vo.setAttraction_detail(detail);
        vo.setLatitude(latitude);
        vo.setLongitude(longitude);
        dao.food(vo);

        Historic_site_imageVO im2=new Historic_site_imageVO();
        im2.setBno(bno);
        im2.setFullname(firstimage);
        im2.setImage_num(0);
        im2.setSite_type("숙박");
        dao.history_image(im2);
        	}
    	}
        
    }
    public void room_detail(String contentid)throws Exception{
        String tel;
        String homepage;
        String accom_count;
        String barbeque;
        String check_in;
        String check_out;
        String cooking;
        String food_place;
        String info_center;
        String parking;
        String pickup;
        String reservation;
        String reservation_url;
        String room_count;
        String sub_facility;
        

    	StringBuilder urlBuilder11= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=EeCFhukHh79xQCHczQD0n4rnAP8u8VEZBk9Ptn%2FBL8EHoQhHhZi4nEjrPryhc8Wlnz8AXj2oXfwKGlcLY37a6A%3D%3D&contentTypeId=32&contentId="+contentid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y\r\n" + 
    			"");
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
        int index;
        int index2;
        index=arr8[1].indexOf("</accomcountlodging>");
        accom_count=arr8[1].substring(19,index);
        System.out.println(accom_count);
    }
	
}
