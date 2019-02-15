package com.bit.croller;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import java.io.BufferedReader;
import java.io.IOException;

public class food_image {
    /**
     * @param args
     * @throws IOException
     */
    /**
     * @param args
     * @throws IOException
     */
    /**
     * @param args
     * @throws IOException
     */
    /**
     * @param args
     * @throws IOException
     */
    /**
     * @param args
     * @throws IOException
     */
    public static void main(String[] args) throws IOException {
    	String history_name;
    	String detail;
    	String latitude;
    	String longitude;
    	String address;
    	String contentid;
    	String contenttypeid;
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
        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=nilE%2Bgxdo0tHLffsEZzqOB0JH62Q%2BCbWzvqvyLKZz108cgqvmXVMtZx2c0d1GJFZlIAxaKusc9d%2BYzOTHYOhkQ%3D%3D&contentTypeId=12&areaCode=1&sigunguCode=&cat1=A02&cat2=A0201&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1"); /*URL*/
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
        System.out.println("--------------------------------------공통정보---------------------------------------디테일");
        
        StringBuilder urlBuilder2= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=nilE%2Bgxdo0tHLffsEZzqOB0JH62Q%2BCbWzvqvyLKZz108cgqvmXVMtZx2c0d1GJFZlIAxaKusc9d%2BYzOTHYOhkQ%3D%3D&contentTypeId="+contenttypeid+"&contentId="+contentid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y");
        StringBuilder urlBuilder3= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey=nilE%2Bgxdo0tHLffsEZzqOB0JH62Q%2BCbWzvqvyLKZz108cgqvmXVMtZx2c0d1GJFZlIAxaKusc9d%2BYzOTHYOhkQ%3D%3D&contentTypeId="+contenttypeid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&contentId="+contentid+"&imageYN=Y");
        StringBuilder urlBuilder4= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=nilE%2Bgxdo0tHLffsEZzqOB0JH62Q%2BCbWzvqvyLKZz108cgqvmXVMtZx2c0d1GJFZlIAxaKusc9d%2BYzOTHYOhkQ%3D%3D&contentTypeId="+contenttypeid+"&contentId="+contentid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y&listYN=Y");
       
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
       
        index=sb4.indexOf("<infocenter>");
        index2=sb4.indexOf("</infocenter>");
        infocenter=sb4.substring(index+12, index2);
        
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
        
        System.out.println(expagerange);
        System.out.println(expguide);
        System.out.println(park);
        System.out.println(usetime);
        System.out.println(creditcard);
        System.out.println(restday);
        System.out.println(infocenter);
        System.out.println(pet);
        System.out.println(carriage);
        String img[]=sb3.toString().split("<originimgurl>");
        for(int j=1;j<img.length;j++) {
        	index=img[j].indexOf("</originimgurl>");
        	img[j]=img[j].substring(0, index);
            System.out.println(img[j]);

        }
        
        System.out.println(history_name);
        System.out.println(detail);
        System.out.println(longitude);
        System.out.println(latitude);
        System.out.println(address);
        System.out.println("-------------------------------------------------------------------------------음식점");
        StringBuilder urlBuilder5= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=nilE%2Bgxdo0tHLffsEZzqOB0JH62Q%2BCbWzvqvyLKZz108cgqvmXVMtZx2c0d1GJFZlIAxaKusc9d%2BYzOTHYOhkQ%3D%3D&contentTypeId=39&mapX="+latitude+"&mapY="+longitude+"&radius=5000&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1\n");
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
        String arr3[]=sb5.toString().split("<item>");
        index=arr3[1].indexOf("</addr1>");
        String addr1=arr3[1].substring(7, index);
        System.out.println(addr1);
        index=arr3[1].indexOf("<contentid>");
        index2=arr3[1].indexOf("</contentid>");
        contentid=arr3[1].substring(index+11, index2);
        index=arr3[1].indexOf("<title>");
        index2=arr3[1].indexOf("</title>");
        String title=arr3[1].substring(index+7, index2);
        System.out.println(title);
        rd5.close();
        conn5.disconnect();
        
        StringBuilder urlBuilder6= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=nilE%2Bgxdo0tHLffsEZzqOB0JH62Q%2BCbWzvqvyLKZz108cgqvmXVMtZx2c0d1GJFZlIAxaKusc9d%2BYzOTHYOhkQ%3D%3D&contentTypeId=39&contentId="+contentid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y\n");

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
        String arr4[]=sb6.toString().split("<item>");
        index=arr4[1].indexOf("<mapx>");
        index2=arr4[1].indexOf("</mapx>");
        String mapx=arr4[1].substring(index+6, index2);
        index=arr4[1].indexOf("<mapy>");
        index2=arr4[1].indexOf("</mapy>");
        String mapy=arr4[1].substring(index+6, index2);
        System.out.println(mapx);
        System.out.println(mapy);
        index=arr4[1].indexOf("<overview>");
        index2=arr4[1].indexOf("</overview>");
        String overview=arr4[1].substring(index+10, index2);
        System.out.println(overview);
        index=arr4[1].indexOf("<tel>");
        index2=arr4[1].indexOf("</tel>");
        
        
        StringBuilder urlBuilder7= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=nilE%2Bgxdo0tHLffsEZzqOB0JH62Q%2BCbWzvqvyLKZz108cgqvmXVMtZx2c0d1GJFZlIAxaKusc9d%2BYzOTHYOhkQ%3D%3D&contentTypeId=39&contentId=1953272&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y");
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
        System.out.println(sb7.toString());
        index=sb7.toString().indexOf("<chkcreditcardfood>");
        index2=sb7.toString().indexOf("</chkcreditcardfood>");
        creditcardfood=sb7.substring(index+19,index2);
        System.out.println(creditcardfood);
        index=sb7.toString().indexOf("<firstmenu>");
        index2=sb7.toString().indexOf("</firstmenu>");
        firstmenu=sb7.substring(index+11, index2);
        System.out.println(firstmenu);
        index=sb7.toString().indexOf("<infocenterfood>");
        index2=sb7.toString().indexOf("</infocenterfood>");
        infocenterfood=sb7.substring(index+16, index2);
        System.out.println(infocenterfood);
        index=sb7.toString().indexOf("<packing>");
        index2=sb7.toString().indexOf("</packing>");
        packing=sb7.substring(index+9, index2);
        System.out.println(packing);
        index=sb7.toString().indexOf("<parkingfood>");
        index2=sb7.toString().indexOf("</parkingfood>");
        parkingfood=sb7.substring(index+13, index2);
        index=sb7.toString().indexOf("<reservationfood>");
        index2=sb7.toString().indexOf("</reservationfood>");
        reservationfood=sb7.substring(index+17, index2);
        System.out.println(reservationfood);
        index=sb7.toString().indexOf("<smoking>");
        index2=sb7.toString().indexOf("</smoking>");
        smoking=sb7.substring(index+9, index2);
        System.out.println(smoking);
        index=sb7.toString().indexOf("<restdatefood>");
        index2=sb7.toString().indexOf("</restdatefood>");
        restdatefood=sb7.substring(index+14, index2);
        System.out.println(restdatefood);
        index=sb7.toString().indexOf("<treatmenu>");
        index2=sb7.toString().indexOf("</treatmenu>");
        treatmenu=sb7.substring(index+11, index2);
        System.out.println(treatmenu);
        
        /*StringBuilder urlBuilder8= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey=nilE%2Bgxdo0tHLffsEZzqOB0JH62Q%2BCbWzvqvyLKZz108cgqvmXVMtZx2c0d1GJFZlIAxaKusc9d%2BYzOTHYOhkQ%3D%3D&contentTypeId=39&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&contentId="+contentid+"&imageYN=N");
        URL url8= new URL(urlBuilder8.toString());
        BufferedReader rd8;

        HttpURLConnection conn8 = (HttpURLConnection) url8.openConnection();
        
        if(conn8.getResponseCode() >= 200 && conn8.getResponseCode() <= 300) {
            rd8 = new BufferedReader(new InputStreamReader(conn8.getInputStream()));
        } else {
            rd8 = new BufferedReader(new InputStreamReader(conn8.getErrorStream()));
        }
        
        StringBuilder sb8= new StringBuilder();
        String line8;
        while((line8=rd8.readLine())!=null) {
        	sb8.append(line8);
        }*/
        
        }
     
    }
}