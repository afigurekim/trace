<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>지역별 유적지 정보</title>
    <link href="../../../resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../../resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../../resources/css/pe-icons.css" rel="stylesheet">
    <link href="../../../resources/css/prettyPhoto.css" rel="stylesheet">
    <link href="../../../resources/css/animate.css" rel="stylesheet">
    <link href="../../../resources/css/style.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <script src="../../../resources/js/jquery.js"></script>
    <link rel="shortcut icon" href="../../../resources/imgs/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../../../resources/imgs/ico/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../../../resources/imgs/ico/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../../../resources/imgs/ico/images/ico/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon-precomposed" href="../../../resources/imgs/ico/apple-touch-icon-57x57.png">
 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85e0cc19a20ba6c0287ea1beb32633e7"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   
 	<script src="../../../resources/js/bootstrap.min.js"></script>
    <script src="../../../resources/js/jquery.prettyPhoto.js"></script>
    <script src="../../../resources/js/plugins.js"></script>
    <script src="../../../resources/js/init.js"></script>

   <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
   <style>
   .rating-stars ul {
  list-style-type:none;
  padding:0;
  
  -moz-user-select:none;
  -webkit-user-select:none;
}
.rating-stars ul > li.star {
  display:inline-block;
  
}

/* Idle State of the stars */
.rating-stars ul > li.star > i.fa {
  font-size:2.5em; /* Change the size of the stars */
  color:#ccc; /* Color on idle state */
}

/* Hover state of the stars */
.rating-stars ul > li.star.hover > i.fa {
  color:#FFCC36;
}

/* Selected state of the stars */
.rating-stars ul > li.star.selected > i.fa {
  color:#FF912C;
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
   
.listimg>a{
	text-deocration:none;
}
.listimg>a>img{
	width:255px;
	height:170px;

}
.additem .gname{
	display: block;
    overflow: hidden;
    padding: 3px 0px;
    border-top-width: 1px;
    border-top-style: solid;
    border-top-color: rgb(221,221,221);
    color: black;
    font-size: 11px;
    line-height: 13px;
    text-indent: 5px;
    background-color: rgb(248,248,248);
    font-weight: bold;
}
.additem .gname_pre{
	display: block;
    overflow: hidden;
    padding: 3px 0px;
    border-top-width: 1px;
    border-top-style: solid;
    border-top-color: rgb(221,221,221);
    color: black;
    font-size: 11px;
    line-height: 13px;
    text-indent: 5px;
    background-color: rgb(248,248,248);
}

   </style>
<script>
$(function(){

	/* 1. Visualizing things on Hover - See next part for action on click */
	  $('#stars li').on('mouseover', function(){
	    var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on
	   
	    // Now highlight all the stars that's not after the current hovered star
	    $(this).parent().children('li.star').each(function(e){
	      if (e < onStar) {
	        $(this).addClass('hover');
	      }
	      else {
	        $(this).removeClass('hover');
	      }
	    });
	    
	  }).on('mouseout', function(){
	    $(this).parent().children('li.star').each(function(e){
	      $(this).removeClass('hover');
	    });
	  });
	  
	  
	  /* 2. Action to perform on click */
	  $('#stars li').on('click', function(){
	    var onStar = parseInt($(this).data('value'), 10); // The star currently selected
	    var stars = $(this).parent().children('li.star');
	    
	    for (i = 0; i < stars.length; i++) {
	      $(stars[i]).removeClass('selected');
	    }
	    
	    for (i = 0; i < onStar; i++) {
	      $(stars[i]).addClass('selected');
	    }
	    
	    // JUST RESPONSE (Not needed)
	    var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
	   var bn=${read.bno};
	   var user_id;
	   if("${login_id}"!=""){
		   user_id="${login_id}";
	   }else if("${login_id2}"!=""){
		   user_id="${login_id2}";
	   }else{
		   alert("로그인 후 이용이 가능합니다");
		   return;
	   }
	    $.ajax({
	    	url:"/starValue",
	    	type:'post',
	    	data:{
	    		star:ratingValue,
	    		id:user_id,
	    		bno:bn,
	    	},
	    	success:function(data){
	    		if(data==0){
	    			alert("등록되었습니다");
	    		}else{
	    			alert("이미 등록하셨습니다");
	    		}
	    	}
	    	
	    });
	  });
	 var dataset=new Array();
	 var data1=0;
	 var data2=0;
	 var data3=0;
	 var data4=0;
	 var data5=0;
	  $.ajax({
	    	url:"/readChartList/"+${read.bno},
	    	type:'get',
	    	async:false,
	    	data:{},
	    	success:function(data){
	    		for(var i=0;i<data.list.length;i++){
	    			if(data.list[i].star==1){
	    				data1++;
	    			}else if(data.list[i].star==2){
	    				data2++;
	    			}else if(data.list[i].star==3){
	    				data3++;
	    			}else if(data.list[i].star==4){
	    				data4++;
	    			}else if(data.list[i].star==5){
	    				data5++;
	    			}
	    		}
	    	}
	    	
	    });

	var ctx = document.getElementById("myChart");
	var myChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: ["1점","2점","3점","4점","5점"],
	    datasets: [{
	      label: '',
	      data: [data1,data2,data3,data4,data5],
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

	var windowWidth = $( window ).width();

	$(window).resize(function(){
		 windowWidth = $( window ).width();
	
	
	$("#first_image").height($(".overlay").width()/1.5);
	$("img[name=full_image]").height($(".overlay").width()/1.5);

	});

	
	$(".box-success").click(function(){
		
	});

	$("img[name=full_image]").height($(".overlay").width()/1.5);


/*for(var i=0;i<$("img[name=full_image]").length;i++){

	$("img[name=full_image]").height($(".overlay").width()/1.5);
}
*/var windowWidth = $( window ).width();
	$(window).resize(function(){
	 windowWidth = $( window ).width();
	console.log("윈도우 크기"+windowWidth);
	if(windowWidth<=620){
		//$("img[name=modal_food]").width(windowWidth-50);
	}
	});
	if(windowWidth<=620){
		//$("img[name=modal_food]").width(windowWidth-50);
	}
	
	$("#jimbtn").click(function(e){
		e.preventDefault();
		
		var bno=${read.bno};
		var user_id;
		if("${login_id}"!=""){
			user_id="${login_id}";
		}else if("${login_id2}"!=""){
			user_id="${login_id2}";
		}else{
			alert("로그인 후 이용이 가능합니다");
			return;
		}
		
		$.ajax({
		  url:"/jimadd",
		  type:'post',
		  data:{
		  	user_id:user_id,
		  	bno:bno,
		  },
		  success:function(data){
		  	if(data==0){
		  		alert("찜목록에 추가되었습니다");
		  	}else{
		  		alert("이 장소는 이미 추가하셨습니다");
		  	}
		  }	
		});
	});
});

</script>
</head><!--/head-->
<body>
<%@include file="../Header.jsp" %>

    <div id="content-wrapper" style="margin-top:70px;">
        <section id="blog" class="white">
            <div class="container">            
            <div class="gap"></div>
                <div class="row">
                    <aside class="col-sm-4 col-sm-push-8"> 

                        <div class="widget categories">
                            <h3 class="widget-title">유적지 정보</h3>
                            <div class="row">
                                
                                <div class="col-sm-6">
                                    <ul class="arrow">
                                        <li>${read.site_name}</li>
                                        <li>${read.address}</li>
                                    </ul>
                                </div>
                            </div>                     
                        </div><!--/.categories-->
                        <div class="widget tags">
                            <h3 class="widget-title">사용자 별점</h3>
                            <div id="canvas" style="width:1280px; margin:auto;">
								<canvas id="myChart"style="float:left; margin-top:10px;margin-left:21px; width:400px;height:200px;"></canvas>
							</div>
                        </div><!--/.tags-->
						<section class='rating-widget'>
							<div class='rating-stars text-center' >
							    <ul id='stars' style="margin-top:60px;"> 
							      <li class='star' title='Poor' data-value='1'>
							        <i class='fa fa-star fa-fw'></i>
							      </li>
							      <li class='star' title='Fair' data-value='2'>
							        <i class='fa fa-star fa-fw'></i>
							      </li>
							      <li class='star' title='Good' data-value='3'>
							        <i class='fa fa-star fa-fw'></i>
							      </li>
							      <li class='star' title='Excellent' data-value='4'>
							        <i class='fa fa-star fa-fw'></i>
							      </li>
							      <li class='star' title='WOW!!!' data-value='5'>
							        <i class='fa fa-star fa-fw'></i>
							      </li>
							    </ul>
							    <form>
								    <button id="jimbtn" type="button" class="btn btn-primary" style="margin-bottom:18px;">찜하기</button>
							    </form>
							  </div>
						</section>
                    </aside>        
                    <div class="col-sm-8 col-sm-pull-4">
                        <div class="blog">
                            <div class="blog-item">
                                <div class="blog-featured-image">
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
							 <img src="${read.first_image}" class="img-responsive img-blog" id="first_image" style="">                
							</a>				     
						</div>
						<c:forEach items="${region_image}"  var="img_list" begin="0" varStatus="status">
						 	<div class="item">
									<a href="#" onclick="dirImg('1636095');" title="사진을 클릭하시면 크게 확인하실 수 있습니다." style="line-height: 301px;">
									 <img  src="${img_list.fullname}" class="img-responsive img-blog" id="full_image"  name="full_image" >   
									           
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
                                    
                  <div class="overlay">
                         <a class="preview btn btn-outlined btn-primary" href="blog-item.html" rel="prettyPhoto"><i class="fa fa-link"></i></a>
                  </div>
                 </div> 
                 <div class="blog-content">
                     <h3 class="main-title">${read.site_name}</h3>
                     
                     <p class="lead">${read_detail.detail}</p>
                     <hr>

                     <script type="text/javascript">
					 if("${read_detail.info_center}"!=""){
						document.write("<p>문의 및 안내 : <br> ${read_detail.info_center} </p>");				
					            }
					if("${read_detail.exp_guide}"!=""){
						document.write("<p>체험 안내 : <br> ${read_detail.exp_guide} </p>");
					}
					if("${read_detail.expage_range}"!=""){
						document.write("<p>체험 연령 : ${read_detail.expage_range} </p>");
					}
					if("${read_detail.rest_day}"!=""){
						document.write("<p>쉬는 날 : ${read_detail.rest_day} </p>");
					}
					if("${read_detail.use_time}"!=""){
						document.write("<p>이용시간 : <br> ${read_detail.use_time} </p>");
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

   <hr>
<div id="mapwrap"> 
   <!-- 지도가 표시될 div -->
   <div id="map" style="width:100%;height:500px;"></div>
   <!-- 지도 위에 표시될 마커 카테고리 -->
   <div class="category">
       <ul>
           <li id="coffeeMenu" onclick="changeMarker('coffee')">
           <img src="../../../resources/imgs/음식.png" style="width:50px;height:25px;">
               <span class="ico_comm ico_coffee"></span>
               음식점
           </li>
           <li id="storeMenu" onclick="changeMarker('store')">
            <img src="../../../resources/imgs/숙소.png" style="width:50px;height:25px;">
            
                <span class="ico_comm ico_store"></span>
          숙박
            </li>
            
        </ul>
    </div>
</div>
                           
<hr>

<div id="comments">
  <div id="comments-list">
   <ul class="timeline" style="margin-top:10px;">
		<li class="time-label" id="repliesDiv" style="margin-bottom:30px;list-style-type:none; margin-left:-39px; font-size:20px; font-weight:700; height:30px;"><span class="bg-green">
		<i class="fa fa-comments bg-blue"></i>
		댓글</span>${reply_count}</li>
	</ul>
	<div class="text-center">
		<ul id="pagination" class="pagination pagination-sm no-margin">
		</ul>
	</div>
	<div class="row">
		<div class="col-md-12">
		
		<div class="box box-success">
			<div class="box-header">
				<h3 class="box-title">댓글 등록</h3>
			</div>
			<div class="box-body">
	
					<script type="text/javascript">
					
					if("${login_id}"!=""){
						document.write("<input class='form-control' type='text' placeholder='글쓴이' id='newReplyWriter' value=${login_id} readonly>");
					}else if("${login_id2}"!=""){
						document.write("<input class='form-control' type='text' placeholder='글쓴이' id='newReplyWriter' value=${login_id2} readonly>");
	
					}else{
						document.write("<input class='form-control' type='text' placeholder='글쓴이' id='newReplyWriter' readonly>");
					}
					</script> 
					<div style="margin-top:15px; margin-bottom:15px;">
					<textarea rows="8"  id="newReplyText" class="form-control" placeholder="내용"></textarea> 
					</div>
			</div>
			
		<div class="box-footer">
			<button type="submit" class="btn btn-primary btn-outlined" id="replyAddBtn">등록</button>
		</div>
		</div>
		
		</div>
	</div>                           
       	</div>
    </div>
</div>

        </div>
    </div><!--/.col-md-8-->
</div><!--/.row-->
    </div>
</section><!--/#blog-->
</div>

    <%@include file="../Footer.jsp" %>
    <div id="modifyModal" class="modal modal-primary fade" role="dialog">
	<div class="modal-dialog">
		
		<div class="modal-content" style="margin-top:300px;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body" data-rno>
				<p><input type="text" id="replytext" class="form-control"></p>
			</div>
			<div class="modal-footer">
			
				<button type="button" class="btn btn-info" id="replyModBtn">수정</button>
				<button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<div id="modifyModal2" class="modal modal-primary fade" role="dialog">
	<div class="modal-dialog">
		
		<div class="modal-content" style="margin-top:300px;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body">
				<div class="">
				<img src="#"   id="food_image_modal" name="modal_food" style="width:100%;">
				</div>
				<p id="food_address" style="margin-top:20px;  border-top:1px solid gray;"></p>
				<p id="food_contact" style="border-bottom:1px solid gray;"></p>
				
				<p id="food_detail_modal" style="margin-top:20px; font-size:13px;"></p>
				
				</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}} style="list-style-type:none;">
	<div class="well">
	<div class="media-heading">{{replyer}}
	&nbsp;<small><i class="fa fa-clock-o"></i> {{prettifyDate reg_date}}</small>
	</div>
	<div class="timeline-body">{{reply_text}} </div>
		<a class="pull-right btn btn-primary btn-outlined" id="modify_modal"
		data-toggle="modal" data-target="#modifyModal">Modify</a>
	
		
</div>
<hr>
</li>
{{/each}}

</script>


<script type="text/javascript">

var coffeePositions2=new Array();
var storePositions2=new Array();
var str="";
var i=0;

if(window.location.href.indexOf("eng")!=-1){
	$.ajax({
		url:"/eng/food/"+"${read.bno}",
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
		url:"/eng/room/"+"${read.bno}",
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
}else if(window.location.href.indexOf("ch")!=-1){
	$.ajax({
		url:"/ch/food/"+"${read.bno}",
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
		url:"/ch/room/"+"${read.bno}",
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
}else{
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
}

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
var foodimage="../../../resources/imgs/음식.png";
var roomimage="../../../resources/imgs/숙소.png";
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
     	//alert(content2);
        var str=content2.indexOf("<a href");
        var str2=content2.indexOf("<img src");
        var str3=content2.substring(str+16,str2-2);
        console.log(str3);
        if(window.location.href.indexOf("eng")!=-1){
        	$.ajax({
            	url:"/eng/region"+str3,
            	async: false,
            	success:function(data){
            		
    	        		for(var i=0;i<data.food_image.length;i++){
    	        			console.log(data.food_image[i]);
    	                   
    						
    	        		}
            	   		$("#food_image_modal").attr("src",data.read_attraction.first_image);

    	        		$(".modal-title").text(data.read_attraction.attraction_name);
    	        		$("#food_address").text(data.read_attraction.address);
    	        		$("#food_contact").text(data.read_attraction.tel);
    	        		$("#food_detail_modal").text(data.read_attraction.attraction_detail);
     					console.log(data.read_attraction.attraction_detail);
    	        		$("#modifyModal2").modal();  
    	        		 
            	}
            });
        }else if(window.location.href.indexOf("china")!=-1){
        	$.ajax({
            	url:"/china/region"+str3,
            	async: false,
            	success:function(data){
            		
    	        		for(var i=0;i<data.food_image.length;i++){
    	        			console.log(data.food_image[i]);
    	                   
    						
    	        		}
            	   		$("#food_image_modal").attr("src",data.read_attraction.first_image);

    	        		$(".modal-title").text(data.read_attraction.attraction_name);
    	        		$("#food_address").text(data.read_attraction.address);
    	        		$("#food_contact").text(data.read_attraction.tel);
    	        		$("#food_detail_modal").text(data.read_attraction.attraction_detail);
     					console.log(data.read_attraction.attraction_detail);
    	        		$("#modifyModal2").modal();  
    	        		 
            	}
            });
        }else{
	        $.ajax({
	        	url:"/region"+str3,
	        	async: false,
	        	success:function(data){
	        		
		        		for(var i=0;i<data.food_image.length;i++){
		        			console.log(data.food_image[i]);
		                   
							
		        		}
	        	   		$("#food_image_modal").attr("src",data.read_attraction.first_image);
	
		        		$(".modal-title").text(data.read_attraction.attraction_name);
		        		$("#food_address").text(data.read_attraction.address);
		        		$("#food_contact").text(data.read_attraction.tel);
		        		$("#food_detail_modal").text(data.read_attraction.attraction_detail);
	 					console.log(data.read_attraction.attraction_detail);
		        		$("#modifyModal2").modal();  
		        		console.log($("img[name=modal_food]").width()+"width");
						//$("img[name=modal_food]").height($("#food_image_modal").width()/1.5);

		        		 
	        	}
	        });
        }
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
var clickcount=0;
var bno=${read.bno};
var replyPage=1
$(function(){
	getPage('/replies/'+bno+"/"+1);

});
function getPage(pageInfo){
$.ajax({
	url:pageInfo,
	async: false,
	type:'get',
	success:function(data){
		console.log("+댓글 갯수+"+data.list.length);
		var str="";

		printData(data.list,$("#repliesDiv"),$("#template"));
		printPaging(data.pageMaker,$(".pagination"));
		$("#modifyModal").modal('hide');
		$("#replycntSmall").html("[ " +data.pageMaker.totalCount +" ]");
	}
});
}
Handlebars.registerHelper("prettifyDate",function(timeValue){
	var dateObj= new Date(timeValue);
	var year= dateObj.getFullYear();
	var month = dateObj.getMonth()+1;
	var date= dateObj.getDate();
	return year+"/"+month+"/"+date;

});

var printData= function(replyArr,target,templateObject){
	var template= Handlebars.compile(templateObject.html());
	var html=template(replyArr);
	$(".replyLi").remove();
	target.after(html);
	for(var i=0;i<replyArr.length;i++){
		if(replyArr[i].replyer !="${login_id2}" && replyArr[i].replyer !="${login_id}")
		{
			$("#modify_modal").hide();

		}
	}
}
var printPaging= function(pageMaker,target){
	
	var str="";
	if(pageMaker.prev){
		str+= "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
	}
	for(var i=pageMaker.startPage,len=pageMaker.endPage;i<=len;i++)
		{
		var strClass= pageMaker.cri.page==i?'class=active':'';
		str+="<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
		}
	if(pageMaker.next){
		str+="<li><a href='"+(pageMaker.endPage +1)+"'> >> </a></li>";
	}
	target.html(str);
};
/*$("#repliesDiv").on("click",function(){
clickcount+=1;
alert("hi");
	if(clickcount==1){
		if($(".timeline li").size() >1){
	
		$(".replyLi").show();
		$(".pagination").show();

		return;
		}

	getPage("/replies/"+bno+"/1");
	
	}else if(clickcount==2){

		if($(".replyLi").show()){
			$(".replyLi").hide();
			$(".pagination").hide();
		};
		clickcount=0;
	}
});	
*/

$(".pagination").on("click","li a",function(event){
	event.preventDefault();
	replyPage =$(this).attr("href");
	getPage("/replies/"+bno+"/"+replyPage);
});

$(".timeline").on("click",".replyLi",function(event){
	
	var reply=$(this);
	
	$("#replytext").val(reply.find('.timeline-body').text());
	$(".modal-title").html(reply.attr("data-rno"));
});

$("#replyAddBtn").on("click",function(){
	
	var replyerObj = $("#newReplyWriter");
	var replytextObj = $("#newReplyText");
	var replyer = replyerObj.val();
	var replytext= replytextObj.val();
	if(replyer==""){
		alert("로그인 후 이용이 가능합니다");
		return;
	}
	if(replytext==""){
		alert("댓글을 입력해주세요");
		return;
	}
	$.ajax({
		type:'post',
		url:'/replies/',
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"},
		dataType:'text',
		processData:false,
		data: JSON.stringify({bno:bno,replyer:replyer,reply_text:replytext}),
		success:function(result){
			console.log("result: "+result);
			if(result == 'SUCCESS'){
				alert("등록 되었습니다.");
				replyPage=1;
				getPage("/replies/"+bno+"/"+replyPage);
				replyerObj.val("");
				replytextObj.val("");
			}
		
		}});
});

$("#replyModBtn").on("click",function(){
	
	var rno = $(".modal-title").html();
	var replytext=$("#replytext").val();
	
	$.ajax({
		type:'put',
		url:'/replies/'+rno,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"PUT"},
		dataType:'text',
		processData:false,
		data: JSON.stringify({reply_text:replytext}),
		success:function(result){
			console.log("result: "+result);
			if(result == 'SUCCESS'){
				alert("수정 되었습니다.");
				getPage("/replies/"+bno+"/"+replyPage);
				
			}
		
		}});
});


$("#replyDelBtn").on("click",function(){
	
	var rno = $(".modal-title").html();
	var replytext=$("#replytext").val();
	
	$.ajax({
		type:'delete',
		url:'/replies/'+rno,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"DELETE"},
		dataType:'text',
		processData:false,
		success:function(result){
			console.log("result: "+result);
			if(result == 'SUCCESS'){
				alert("삭제 되었습니다.");
				getPage("/replies/"+bno+"/"+replyPage);
				
			}
		
		}});
});

$(function(){
	$("#first_image").height($(".overlay").width()/1.5);
	$("#full_image").height($(".overlay").width()/1.5);
});

</script>
   
</body>
</html>