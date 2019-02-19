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
<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=ac75ebf7-25c5-474a-be2a-b845ccf8e3bb"></script>
  <script type="text/javascript" src="/resources/js/upload.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style>
body{
    font-family: 'Noto Sans Kr','Nanum Gothic','Malgun gothic',Dotum,arial,sans-serif;
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

.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
 
<script type="text/javascript">

function abc(){

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

}

var latitude=0;
var longitude=0;

</script>
</head>
<body onload="abc()">
<%@include file="../Header.jsp" %>

<div id="wrap">
	<div class="content">
		<div class="hschDetail_tit">
		<strong>${read_attraction.attraction_name}</strong>
		</div>
		
		<div class="hschDetail_info">
			<div class="hschDi_img" style="height:397px;">
			<div class="container" style="width:100%; margin:0;padding:0; height:1000px;">
				  <div id="myCarousel" class="carousel slide" data-ride="carousel">
				    <!-- Indicators -->
				    <ol class="carousel-indicators">
				   		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				    
				      <c:forEach items="${food_image}" var="img_list" begin="1" varStatus="status">
					      <li data-target="#myCarousel" data-slide-to="${status.index}"></li>
					      
				      </c:forEach>
				       
				    </ol>
				
				    <!-- Wrapper for slides -->
				    <div class="carousel-inner">
				      <div class="item active">
							<a href="#" onclick="dirImg('1636095');" title="사진을 클릭하시면 크게 확인하실 수 있습니다." style="line-height: 301px;">
							 <img  src="${read_attraction.first_image}" style="width:100%;height:397px;">                
							</a>				     
						</div>
						<c:forEach items="${food_image}"  var="img_list" begin="1" varStatus="status">
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
					       <th scope="row">음식점 이름</th>
					       <td>${read_attraction.attraction_name}</td>
				       </tr>                             
				       <tr>
				           <th scope="row">소재지</th>
				           <td>${read_attraction.address}</td>
				       </tr>
				       <tr>
				       		<th scope="row">홈페이지</th>
				       		<td>${read_attraction.homepage}</td>
				       </tr>
				      
				        <tr>
				       		<th scope="row">전화번호</th>
				       		<td>${read_attraction.tel}</td>
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
              	<p>${read_attraction.attraction_detail}</p>
                
              </div>
       
                
         <div style="border-bottom: 1px solid #535a75; margin-top:30px;"></div>
         



	</div>
</div>
<%@include file="../MainFooter.jsp" %>
</body>
</html>