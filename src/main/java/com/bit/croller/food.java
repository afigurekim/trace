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

public class food {
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
	public static void main(String args[])throws Exception{
		food f= new food();
		f.food_list("127.0226983297","37.6368246468");
	}
    public void food_list(String latitude2,String longitude2) throws IOException {
    	

        System.out.println("-------------------------------------------------------------------------------음식점");
        StringBuilder urlBuilder5= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=nilE%2Bgxdo0tHLffsEZzqOB0JH62Q%2BCbWzvqvyLKZz108cgqvmXVMtZx2c0d1GJFZlIAxaKusc9d%2BYzOTHYOhkQ%3D%3D&contentTypeId=39&mapX="+latitude2+"&mapY="+longitude2+"&radius=5000&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1\n");
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
       System.out.println(arr3.length+"렝쓰으");
        for(int j=1;j<arr3.length;j++) {
        index=arr3[j].indexOf("</addr1>");
        String addr1=arr3[j].substring(7, index);
        System.out.println(addr1);
        
        index=arr3[j].indexOf("<contentid>");
        index2=arr3[j].indexOf("</contentid>");
        contentid=arr3[j].substring(index+11, index2);
        System.out.println(contentid);
        index=arr3[j].indexOf("<title>");
        index2=arr3[j].indexOf("</title>");
        String title=arr3[j].substring(index+7, index2);
        System.out.println(title);
        
        
        rd5.close();
        conn5.disconnect();
        
        StringBuilder urlBuilder6= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=dRHdUyuSxdOfoAJW28aN5obeuGP8MF5CnlnCVAFGjz82X8H9RHXff%2FAZNSHOlsDxrm788R60muPdspT5TaPCjw%3D%3D&contentTypeId=39&contentId="+contentid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y\n");

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
        for(int q=1;q<arr4.length;q++) {
        index=arr4[q].indexOf("<mapx>");
        System.out.println(index+"인덱스에요");
        index2=arr4[q].indexOf("</mapx>");
        String mapx=arr4[q].substring(index+6, index2);
        index=arr4[q].indexOf("<mapy>");
        index2=arr4[q].indexOf("</mapy>");
        String mapy=arr4[q].substring(index+6, index2);
        System.out.println(mapx);
        System.out.println(mapy);
        index=arr4[q].indexOf("<overview>");
        index2=arr4[q].indexOf("</overview>");
        String overview=arr4[q].substring(index+10, index2);
        System.out.println(overview);
        index=arr4[q].indexOf("<tel>");
        index2=arr4[q].indexOf("</tel>");
        
        
        StringBuilder urlBuilder7= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=dRHdUyuSxdOfoAJW28aN5obeuGP8MF5CnlnCVAFGjz82X8H9RHXff%2FAZNSHOlsDxrm788R60muPdspT5TaPCjw%3D%3D&contentTypeId=39&contentId="+contentid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y");
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
        System.out.println(creditcardfood);
        index=sb7.toString().indexOf("<firstmenu>");
        index2=sb7.toString().indexOf("</firstmenu>");
        firstmenu=sb7.substring(index+11, index2);
        System.out.println(firstmenu);
        index=sb7.toString().indexOf("<infocenterfood>");
        index2=sb7.toString().indexOf("</infocenterfood>");
        infocenterfood=sb7.substring(index+16, index2);
        System.out.println(infocenterfood);
        if(sb7.toString().indexOf("<packing>")!=-1) {
	        index=sb7.toString().indexOf("<packing>");
	        index2=sb7.toString().indexOf("</packing>");
	        packing=sb7.substring(index+9, index2);
        }
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
        
        
        
        StringBuilder urlBuilder8= new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey=dRHdUyuSxdOfoAJW28aN5obeuGP8MF5CnlnCVAFGjz82X8H9RHXff%2FAZNSHOlsDxrm788R60muPdspT5TaPCjw%3D%3D&contentTypeId=39&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&contentId="+contentid+"&imageYN=N\n");
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
	        }
        }
        System.out.println("-------------------------음식점종료");

        }
        }
    }
}