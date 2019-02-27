package com.bit.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class Translate {
	private int count=0;
	public String translate(String lang,String text2,String historic) {
		String clientId="";
		String clientSecret="";
		 String a="";
		/*if(historic=="region") {

			clientId="1qa7qQPSI27OLS7cC8Ag";
			clientSecret="9iEX8AnwD9";
		}else if(historic=="thema") {
			clientId="vDc8w6ciGtnzjwfa0u2g";
			clientSecret="F4ez4bZUsu";
		}else if(historic=="period") {
			clientId="rE9UszXyLSMMuzkiJbwD";
			clientSecret="4LnsT5l9zF";
		}*/
		 if(count==0) {
				clientId="1qa7qQPSI27OLS7cC8Ag";
				clientSecret="9iEX8AnwD9"; 
		 }else if(count==1) {
				clientId="vDc8w6ciGtnzjwfa0u2g";
				clientSecret="F4ez4bZUsu";
		 }else if(count==2) {
				clientId="vDc8w6ciGtnzjwfa0u2g";
				clientSecret="F4ez4bZUsu";
		 }else if(count==3) {
				clientId="rE9UszXyLSMMuzkiJbwD";
				clientSecret="4LnsT5l9zF";
		 }else if(count==4) {
				clientId="QQ20aHwUJRWldEFqvsqt";
				clientSecret="J87pxmwM8G";		 
		 }else if(count==5) {
				clientId="1qa7qQPSI27OLS7cC8Ag";
				clientSecret="9iEX8AnwD9";		 
		 }else if(count==6) {
			 clientId="l39_4PYuXcUlZNncALoX";
			 clientSecret="G5LASR9tjF";
		 }else if(count==7) {
			 clientId="KsDPZnNkM5vuO_UN87bC";
			 clientSecret="f9U6nvxuyr";
			
		 }
		 
		 
		//QQ20aHwUJRWldEFqvsqt
		//J87pxmwM8G
		//1qa7qQPSI27OLS7cC8Ag
		//9iEX8AnwD9
		//clientId = "l39_4PYuXcUlZNncALoX";//애플리케이션 클라이언트 아이디값";
        //clientSecret = "G5LASR9tjF";//애플리케이션 클라이언트 시크릿값";
		//clientId="KsDPZnNkM5vuO_UN87bC";
		//clientSecret="f9U6nvxuyr";
        String text="";
        try {
        	if(text2!="") {
            text = URLEncoder.encode(text2, "UTF-8");

            String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            // post request
            String target="";
            
            if(lang.indexOf("china")!=-1) {
            	target="zh-CN";
            }else if(lang.indexOf("eng")!=-1) {
            	target="en";
            }
            String postParams ="source=ko&target="+target+"&text="+text;



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
            a=response.substring(response.indexOf("translatedText")+17,response.length()-4);
            System.out.println(a+"a임");
            if(a.toString().indexOf("쿼리 한도")!=-1) {
            	count++;
            	if(count<8) {
            		translate(lang,text2,historic);
            	}else {
            		count=0;
            	}
            }
            
            //String b[]=a.split(",");
           // System.out.println(b[0]+"b0임");
            //text=(b[0].substring(1,b[0].length()-1));
            System.out.println(a.toString());
            
        	}
        
           
        } catch  (Exception e) {
            System.out.println(e);
            System.out.println("앙 쿼리한도찡");
        }
	
		return a.toString();
	}
}
