<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type='text/css' href="../resources/css/list.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.js"></script>
  <script type="text/javascript" src="/resources/js/upload.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85e0cc19a20ba6c0287ea1beb32633e7"></script>

<style>
body{
    font-family: 'Noto Sans Kr','Nanum Gothic','Malgun gothic',Dotum,arial,sans-serif;
}ul{
margin-bottom:-5px;
}
#inner1{
	padding-top:6px;
	padding-bottom:16px;
}

.hschDetail_tit{
	position: relative;
    margin-bottom: 30px;
    border-top: 2px solid #535a75;
    border-bottom: 1px solid #535a75;
    padding: 15px 0;
    text-align: center;	
}
.hschDeatil_tit>p{
    color: #555;
    text-align: center;
    font-weight: 400;
}
.hschDetail_tit>strong{
	olor: #000;
    font-size: 21px;
    font-weight: 600;
}
.hschDetail_info>.hschDi_img{
    width: 48.5%;
    height: auto;
    vertical-align: middle;
    max-height: 100%;
    max-width: 100%;
	background: #ddd;
    text-align: center;
}
.hschDetail_info>div{
	position: relative;
    float: left;
    width: 48.5%;
}
.hschDetail_info>.hschDi_info{
    float: left;
    width: 48.5%;
    table-layout: fixed;
    border-collapse: collapse;
    border-top: 1px solid #535a75;
    border-bottom: 1px solid #535a75;
    margin-left: 3%;
    font-size: 15px;
    color: #555;
    font-weight: 300;
    line-height: 1.5;
}
.hschDi_info>tbody>tr>th{
	text-align:left;
}
.hschDi_info>tbody>tr:first-child{
	border-top:0;
}
.hschDi_info>tbody>tr{
    border-top: 1px solid #d5d5db;
}
tbody>tr>td{
padding: 31px 10px 31px 2px;
}

.hschDetail_con{
    margin-top: 30px;
    padding: 30px 27px;
    background: #f8f8f9;
}
.hschDetail_con>p:last-child{
	margin-bottom:0;
}
.hschDetail_con>p{
	text-align:justify;
	font-size:15px;
	line-height:30px;
	
}
.pagination2{
    padding-left: 0;
    border-radius: 4px;
   list-style-type: none;
    
}
.pagination2>li:first-child>a{
	margin-left: 0;
    border-top-left-radius: 4px;
    border-bottom-left-radius: 4px;
    
}
.pagination2>li>a{
	position: relative;
    float: left;
    padding: 6px 12px;
    margin-left: -1px;
    line-height: 1.42857143;
    color: #337ab7;
    text-decoration: none;
    background-color: #fff;
    border: 1px solid #ddd;
    margin-top:-30px;
    margin-bottom:30px;
}
.pagination2>.active>a{
	z-index: 3;
    color: #fff;
    cursor: default;
    background-color: #337ab7;
    border-color: #337ab7;
    
}
#mapwrap{position:relative;overflow:hidden;}
.category, .category *{margin:0;padding:0;color:#000;}   
.category {position:absolute;overflow:hidden;top:10px;left:10px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
.category li{list-style:none;float:left;width:50px;height:50px;padding-top:5px;cursor:pointer;} 
.category .ico_coffee {background-position:-10px 0;}  
.category .ico_store {background-position:-10px -36px;}   
.category .ico_carpark {background-position:-10px -72px;} 

.wrap {left: 0;bottom: 40px;width: 288px;height: 132px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
   
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
</style>
 
<script type="text/javascript">
$(function(){
	var ctx = document.getElementById("myChart");
	var myChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: ["1점","2점","3점","4점","5점"],
	    datasets: [{
	      label: '',
	      data: [20,10,50,40,70],
	      backgroundColor: [
	        'rgba(255, 99, 132, 0.2)',
	        'rgba(54, 162, 235, 0.2)',
	        'rgba(255, 206, 86, 0.2)',
	        'rgba(75, 192, 192, 0.2)',
	        'rgba(153, 102, 255, 0.2)',
	        'rgba(255, 159, 64, 0.2)',
	        'rgba(255, 99, 132, 0.2)',
	        'rgba(54, 162, 235, 0.2)',
	        'rgba(255, 206, 86, 0.2)',
	        'rgba(75, 192, 192, 0.2)',
	        'rgba(153, 102, 255, 0.2)'
	      ],
	      borderColor: [
	        'rgba(255,99,132,1)',
	        'rgba(54, 162, 235, 1)',
	        'rgba(255, 206, 86, 1)',
	        'rgba(75, 192, 192, 1)',
	        'rgba(153, 102, 255, 1)',
	        'rgba(255, 159, 64, 1)',
	        'rgba(255,99,132,1)',
	        'rgba(54, 162, 235, 1)',
	        'rgba(255, 206, 86, 1)',
	        'rgba(75, 192, 192, 1)',
	        'rgba(153, 102, 255, 1)'
	
	      ],
	      borderWidth: 1
	    }]
	  },
	  options: {
		  legend:{
			  display:false,
			  labels:{
				  boxWidth:0,
			  }
		  },
	    responsive: false,
	    scales: {
	      xAxes: [{
	        ticks: {
	         
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          beginAtZero: true
	        }
	      }]
	      
	    }
	  }
	});

});


/*$(function(){

getfoodList(1);
getroomList(1);	
function getfoodList(foodpage){
	
	var bno=${read.bno};
	$.getJSON("/food/"+${read.bno}+"/"+foodpage,function(data){
		console.log(data.list.length);

		var str="";

		for(var i=0;i<data.list.length;i++){
			str+="<li><div class='listimg'><a href='/region/attraction_read?bno="+data.list[i].bno+"&rno="+data.list[i].rno+"'><img src="+data.list[i].first_image+"></a></div><div class='additem'><p class='gname'>"+data.list[i].attraction_name+"</p><p class='gname_pre' style='text-overflow:elipsis;'>"+data.list[i].address+"</p></div></li>";

		}
		$(".listman").html(str);
		if(data.list.length>=1){
			printPaging(data.pageMaker);
		}
		
	});

	
	$("#food").on("click","li a",function(event){
		event.preventDefault();
		foodpage=$(this).attr("href");
		getfoodList(foodpage);
		
	});
	
}
function getroomList(roompage){
	var bno=${read.bno};
	$.getJSON("/room/"+${read.bno}+"/"+roompage,function(data){
		console.log(data.list.length);
		var str="";

		for(var i=0;i<data.list.length;i++){
			str+="<li><div class='listimg'><a href='/region/attraction_read?bno="+data.list[i].bno+"&rno="+data.list[i].rno+"'><img src="+data.list[i].first_image+"></a></div><div class='additem'><p class='gname'>"+data.list[i].attraction_name+"</p><p class='gname_pre' style='text-overflow:elipsis;'>"+data.list[i].address+"</p></div></li>";

		}
		$(".listman2").html(str);
		if(data.list.length>=1){
			printPaging2(data.pageMaker);
		}
		
	});


	$("#room").on("click","li a",function(event){
		event.preventDefault();
		roompage=$(this).attr("href");
		getroomList(roompage);
		
	});
	
	
}


function printPaging(pageMaker){
	var str="";
	if(pageMaker.prev){
		str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
	}
	
	for(var i=pageMaker.startPage, len =pageMaker.endPage; i<=len;i++){
		var strClass=pageMaker.cri.page == i?'class=active':'';
		str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
	}
	
	if(pageMaker.next){
		str+= "<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
	}
	$('#food').html(str);

}

function printPaging2(pageMaker){
	var str="";
	if(pageMaker.prev){
		str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
	}
	
	for(var i=pageMaker.startPage, len =pageMaker.endPage; i<=len;i++){
		var strClass=pageMaker.cri.page == i?'class=active':'';
		str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
	}
	
	if(pageMaker.next){
		str+= "<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
	}
	$('#room').html(str);

}

});
*/

</script>
</head>
<body>
<%@include file="../Header.jsp" %>

<div id="wrap">
	<div class="content">
		<div class="hschDetail_tit">
		<strong>${read.site_name}</strong>
		</div>
		
		<div class="hschDetail_info">
			<div class="hschDi_img" style="height:397px;">
			<div class="container" style="width:100%; margin:0;padding:0; height:1000px;">
				  <div id="myCarousel" class="carousel slide" data-ride="carousel">
				    <!-- Indicators -->
				    <ol class="carousel-indicators">
				   		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				    
				      <c:forEach items="${region_image}" var="img_list" begin="0" varStatus="status">
					      <li data-target="#myCarousel" data-slide-to="${status.index}"></li>
					      
				      </c:forEach>
				    </ol>
				
				    <!-- Wrapper for slides -->
				    <div class="carousel-inner">
				      <div class="item active">
							<a href="#" onclick="dirImg('1636095');" title="사진을 클릭하시면 크게 확인하실 수 있습니다." style="line-height: 301px;">
							 <img  src="${read.first_image}" style="width:100%;height:397px;">                
							</a>				     
						</div>
						<c:forEach items="${region_image}"  var="img_list" begin="0" varStatus="status">
						 	<div class="item">
									<a href="#" onclick="dirImg('1636095');" title="사진을 클릭하시면 크게 확인하실 수 있습니다." style="line-height: 301px;">
									 <img  src="${img_list.fullname}" style="width:100%;height:397px;">                
									</a>				     
								</div>
						</c:forEach>
						
				     
				    </div>
				
				    <!-- Left and right controls -->
				    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
				      <span class="glyphicon glyphicon-chevron-left"></span>
				      <span class="sr-only">Previous</span>
				    </a>
				    <a class="right carousel-control" href="#myCarousel" data-slide="next">
				      <span class="glyphicon glyphicon-chevron-right"></span>
				      <span class="sr-only">Next</span>
				    </a>
				  </div>
				</div>
	
			</div>
			
			<table class="hschDi_info">
				      <colgroup>
				        <col style="width:125px">
				        <col>
				       </colgroup>
				       <tbody>
				       <tr>
					       <th scope="row">유적지 이름</th>
					       <td>${read.site_name}</td>
				       </tr>                             
				       <tr>
				           <th scope="row">소재지</th>
				           <td>${read.address}</td>
				       </tr>
				       
				      
				       <tr>
				       		<th>사용자 별점</th>
				       		<td>
				       		<div id="canvas" style="width:1280px; margin:auto;">
								<canvas id="myChart"style="float:left; margin-top:10px;margin-left:21px; width:400px;height:200px;"></canvas>
							</div>
				       		</td>
				       </tr>      
				      </tbody>
				</table>
						
		</div>
		
		
		<div style="border-bottom: 1px solid #535a75; margin-top:30px;">
		<a href="#" style="border:1px solid black; float:right; margin-left:10px;text-decoration:none;" >찜하기</a>
			<p style="text-align:right; margin-right:10px;">리뷰평점<select>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
			<button type="button">등록</button>
		
		</p>
		</div>
			<div class="hschDetail_con" id="expDiv">
              	<p>${read_detail.detail}</p>
                
              </div>
           <div class="hschDetail_con" id="expDiv">
           
                <script type="text/javascript">
                if("${read_detail.info_center}"!=""){
					document.write("<p>문의 및 안내 : ${read_detail.info_center} </p>");				
                }
				if("${read_detail.exp_guide}"!=""){
					document.write("<p>체험 안내 : ${read_detail.exp_guide} </p>");
				}
				if("${read_detail.expage_range}"!=""){
					document.write("<p>체험 연령 : ${read_detail.expage_range} </p>");
				}
				if("${read_detail.rest_day}"!=""){
					document.write("<p>쉬는 날 : ${read_detail.rest_day} </p>");
				}
				if("${read_detail.use_time}"!=""){
					document.write("<p>이용시간 : ${read_detail.use_time} </p>");
				}
				if("${read_detail.park}"!=""){
					document.write("<p>주차 시설 : ${read_detail.park} </p>");
				}
				if("${read_detail.carriage}"!=""){
					document.write("<p>유모차 대여 여부 : ${read_detail.carriage} </p>");
				}
				if("${read_detail.pet}"!=""){
					document.write("<p>애완동물 동반 가능 여부 : ${read_detail.pet} </p>");
				}
				if("${read_detail.credit_card}"!=""){
					document.write("<p>신용카드 가능 여부 : ${read_detail.credit_card} </p>");
				}
					
                </script>
	 </div>
                
         <div style="border-bottom: 1px solid #535a75; margin-top:30px;"></div>
         	<div style="margin-top:30px">
         		<a href="#"><img src="../resources/imgs/문화재청.png"></a>
         		<a href="#"><img src="../resources/imgs/길찾기.png"></a>
         	</div>
		   <div style="border-bottom: 1px solid #535a75; margin-top:30px;"></div>
	
<div id="mapwrap"> 
    <!-- 지도가 표시될 div -->
    <div id="map" style="width:100%;height:500px;"></div>
    <!-- 지도 위에 표시될 마커 카테고리 -->
    <div class="category">
        <ul>
            <li id="coffeeMenu" onclick="changeMarker('coffee')">
            <img src="../resources/imgs/음식.png" style="width:50px;height:25px;">
                <span class="ico_comm ico_coffee"></span>
                음식점
            </li>
            <li id="storeMenu" onclick="changeMarker('store')">
             <img src="../resources/imgs/숙소.png" style="width:50px;height:25px;">
            
                <span class="ico_comm ico_store"></span>
          숙박
            </li>
            
        </ul>
    </div>
</div>

	</div>
</div>

<script type="text/javascript">



var coffeePositions2=new Array();
var storePositions2=new Array();
var str="";
var i=0;


$.ajax({
	url:"/food/"+"${read.bno}",
	async: false,
	success:function(data){
		console.log(data.list.length);
		var str="";
		for(var i=0;i<data.list.length;i++){
			str+="<div class='listimg'><a href='/region/attraction_read?bno="+data.list[i].bno+"&rno="+data.list[i].rno+"'><img src="+data.list[i].first_image+"></a></div><div class='additem'><p class='gname'>"+data.list[i].attraction_name+"</p><p class='gname_pre' style='text-overflow:elipsis;'>"+data.list[i].address+"</p></div></li>";
			coffeePositions2.push({content:str,latlng:new daum.maps.LatLng(data.list[i].longitude,data.list[i].latitude)});
			str="";
		}
	}
});

$.ajax({
	url:"/room/"+"${read.bno}",
	async: false,
	success:function(data){
		console.log(data.list.length);
		var str="";
		for(var i=0;i<data.list.length;i++){
			str+="<div class='listimg'><a href='/region/attraction_read?bno="+data.list[i].bno+"&rno="+data.list[i].rno+"'><img src="+data.list[i].first_image+"></a></div><div class='additem'><p class='gname'>"+data.list[i].attraction_name+"</p><p class='gname_pre' style='text-overflow:elipsis;'>"+data.list[i].address+"</p></div></li>";
			storePositions2.push({content:str,latlng:new daum.maps.LatLng(data.list[i].longitude,data.list[i].latitude)});
			str="";
		}
	}
});
/*
$.getJSON("/food/"+${read.bno}+"/",function(data){
	console.log(data.list.length);

	var str="";

	for(var i=0;i<data.list.length;i++){
		str+="<div class='listimg'><a href='/region/attraction_read?bno="+data.list[i].bno+"&rno="+data.list[i].rno+"'><img src="+data.list[i].first_image+"></a></div><div class='additem'><p class='gname'>"+data.list[i].attraction_name+"</p><p class='gname_pre' style='text-overflow:elipsis;'>"+data.list[i].address+"</p></div></li>";
		coffeePositions2.push({content:str,latlng:new daum.maps.LatLng(data.list[i].longitude,data.list[i].latitude)});
		str="";
	}
	
});	*/

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: coffeePositions2[0].latlng, // 지도의 중심좌표 
        level: 8 // 지도의 확대 레벨 
    }; 

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


// 편의점 마커가 표시될 좌표 배열입니다
var storePositions = [
	{
		content:'<div>앙무띠</div>',
	    latlng:new daum.maps.LatLng(37.497535461505684, 127.02948149502778),

	}
    
];

// 주차장 마커가 표시될 좌표 배열입니다

var markerImageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
var foodimage="../resources/imgs/음식.png";
var roomimage="../resources/imgs/숙소.png";
    coffeeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
    storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다

    
createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다

changeMarker('coffee'); // 지도에 커피숍 마커가 보이도록 설정합니다    


// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
function createMarkerImage(src, size,imageOption) {
    var markerImage = new daum.maps.MarkerImage(src, size,imageOption);
    return markerImage;            
}

// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
function createMarker(position, image) {
    var marker = new daum.maps.Marker({
        position: position,
        image: image,
    });
    
    return marker;  
}   
   
// 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
function createCoffeeMarkers() {
    
    for (var i = 0; i < coffeePositions2.length; i++) {  
        
        var imageSize = new daum.maps.Size(40, 40),
        imageOption = {offset: new daum.maps.Point(10,0)};
          /*  imageOptions = {  
                spriteOrigin: new daum.maps.Point(10, 0),    
                spriteSize: new daum.maps.Size(36, 98)  
            }; */    
        
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(foodimage, imageSize,imageOption),   
            marker = createMarker(coffeePositions2[i].latlng, markerImage);  
        var infowindow=new daum.maps.InfoWindow({
        	content:coffeePositions2[i].content,
        });
        content2=coffeePositions2[i].content;
        // 생성된 마커를 커피숍 마커 배열에 추가합니다
       
        coffeeMarkers.push(marker);
       
        daum.maps.event.addListener(marker,'mouseover',makeOverListener(map,marker,infowindow));
        daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        daum.maps.event.addListener(marker, 'click', makeClickListener(map,marker,content2));
        
  
        
    }   
 
}
function makeClickListener(map, marker, content2) {
    return function() {
        var str=content2.indexOf("<a");
        var str2=content2.indexOf("<img");
        var str3=content2.substring(str+9,str2-2);
        window.location.href="http://localhost:8181"+str3;
    };
}


function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
function setCoffeeMarkers(map) {        
    for (var i = 0; i < coffeeMarkers.length; i++) {  
        coffeeMarkers[i].setMap(map);
    }        
}

// 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
function createStoreMarkers() {
    for (var i = 0; i < storePositions2.length; i++) {
        
        var imageSize = new daum.maps.Size(40, 40),
        imageOption = {offset: new daum.maps.Point(10,36)};

           /* imageOptions = {   
                spriteOrigin: new daum.maps.Point(10, 36),    
                spriteSize: new daum.maps.Size(36, 98)  
            };       
     */
        var markerImage = createMarkerImage(roomimage, imageSize, imageOption),    
            marker = createMarker(storePositions2[i].latlng, markerImage);  
        
        var infowindow=new daum.maps.InfoWindow({
        	content:storePositions2[i].content
        });
        content3=storePositions2[i].content;
        // 생성된 마커를 커피숍 마커 배열에 추가합니다
        storeMarkers.push(marker);
        daum.maps.event.addListener(marker,'mouseover',makeOverListener(map,marker,infowindow));
        daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        daum.maps.event.addListener(marker, 'click', makeClickListener(map,marker,content3));

    }        
}

// 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
function setStoreMarkers(map) {        
    for (var i = 0; i < storeMarkers.length; i++) {  
        storeMarkers[i].setMap(map);
    }        
}


// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
function changeMarker(type){
    var coffeeMenu = document.getElementById('coffeeMenu');
    var storeMenu = document.getElementById('storeMenu');
    
    // 커피숍 카테고리가 클릭됐을 때
    if (type === 'coffee') {
    
        // 커피숍 카테고리를 선택된 스타일로 변경하고
        coffeeMenu.className = 'menu_selected';
        
        // 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
        storeMenu.className = '';
        
        // 커피숍 마커들만 지도에 표시하도록 설정합니다
        setCoffeeMarkers(map);
        setStoreMarkers(null);
        
    } else if (type === 'store') { // 편의점 카테고리가 클릭됐을 때
    
        // 편의점 카테고리를 선택된 스타일로 변경하고
        coffeeMenu.className = '';
        storeMenu.className = 'menu_selected';
        
        // 편의점 마커들만 지도에 표시하도록 설정합니다
        setCoffeeMarkers(null);
        setStoreMarkers(map);
        
    }   
} 




</script>
<%@include file="../MainFooter.jsp" %>
</body>
</html>