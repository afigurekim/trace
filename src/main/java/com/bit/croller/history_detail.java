package com.bit.croller;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.bit.domain.Historic_site_detailVO;
import com.bit.domain.Historic_site_imageVO;

public class history_detail {
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

    
	public void historydetail(String contentid,String contenttypeid, Integer bno) throws Exception{
   
      
        System.out.println("--------------------------------------공통정보---------------------------------------디테일");
        
        StringBuilder urlBuilder2= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=p35TFUbXxOZ9aFN5PNJViAlwJp7rAns7%2BCrYHNE2Vs7%2FgEIqi91p5mNQOA7kHXI%2Fz%2F3LPcg4piPKihlOFvrxYw%3D%3D&contentTypeId=12&contentId=294439&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y");
        StringBuilder urlBuilder3= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey=p35TFUbXxOZ9aFN5PNJViAlwJp7rAns7%2BCrYHNE2Vs7%2FgEIqi91p5mNQOA7kHXI%2Fz%2F3LPcg4piPKihlOFvrxYw%3D%3D&contentTypeId="+contenttypeid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&contentId="+contentid+"&imageYN=Y");
        StringBuilder urlBuilder4= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=p35TFUbXxOZ9aFN5PNJViAlwJp7rAns7%2BCrYHNE2Vs7%2FgEIqi91p5mNQOA7kHXI%2Fz%2F3LPcg4piPKihlOFvrxYw%3D%3D&contentTypeId="+contenttypeid+"&contentId="+contentid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y&listYN=Y");
       
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
        String img[]=sb3.toString().split("<originimgurl>");
        for(int j=1;j<img.length;j++) {
        	index=img[j].indexOf("</originimgurl>");
        	img[j]=img[j].substring(0, index);
            System.out.println(img[j]);
            Historic_site_imageVO im=new Historic_site_imageVO();	
            im.setFullname(img[j]);
            im.setImage_num(j);
        }
        System.out.println("-----------------------------------------유적지 정보끝");
   
       
        
        
        
        }
}
     
    
