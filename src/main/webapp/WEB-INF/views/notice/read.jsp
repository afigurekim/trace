<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
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
    <script src="../../../resources/js/bootstrap.min.js"></script>
    <script src="../../../resources/js/jquery.prettyPhoto.js"></script>
    <script src="../../../resources/js/plugins.js"></script>
    <script src="../../../resources/js/init.js"></script>
	<style type="text/css">
	
	body{
		background-color: white;
	}
		
input {

  margin: 40px 25px;

  width: 200px;

  display: block;

  border: none;

  padding: 10px 0;

 // border: solid 0.5px #D8D8D8;

  -webkit-transition: all 0.3s cubic-bezier(0.64, 0.09, 0.08, 1);

 /*  transition: all 0.3s cubic-bezier(0.64, 0.09, 0.08, 1);
 */
/*   background: -webkit-linear-gradient(top, rgba(255, 255, 255, 0) 96%, #1abc9c 4%);
 *//* 
  background: linear-gradient(to bottom, rgba(255, 255, 255, 0) 96%, #1abc9c 4%);
 */
  background-position: -200px 0;

  background-size: 200px 100%;

  background-repeat: no-repeat;

  color: black;
}
 

input:focus, input:valid {

 box-shadow: none;

 outline: none;

 background-position: 0 0;

}
/* 
input::-webkit-input-placeholder {
 font-family: 'roboto', sans-serif;
 -webkit-transition: all 0.3s ease-in-out;
 transition: all 0.3s ease-in-out;
} */

input:focus::-webkit-input-placeholder, input:valid::-webkit-input-placeholder {
 color: black;
 font-size: 15px;
 -webkit-transform: translateY(-5px);
 transform: translateY(-5px);
 visibility: visible !important;
}

//

div {
    display: inline-block;
    position: relative;
}

#textareahr>hr {
    border-bottom: 2px solid #08298A;
    bottom: -1px;
    margin: 0;
    position: relative;
    top:0px;
    width: 103%;

}




.btn-primary {
    background-color: #7bc143;
    border-color: #7bc143;
    color: yellow; }
.btn-primary:hover,
.btn-primary:focus {
    border-color: #6fb03a;
    background-color: #6fb03a;
    color: #FFF; }
.btn-primary:active,
.btn-primary:visited,
.btn-primary:active:focus,
.btn-primary:active:hover {
    border-color: #639d34;
    background-color: #639d34;
    color: #FFF; }

#single-page-slider {
		background-image: url("../../../resources/imgs/banner/gongji-banner.jpg");
		bakcground-color: #A9A9A9;
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
	}


	
	

</style>
	 <script>
	$(function(){
	var windowWidth=$(window).width();
	
	if(windowWidth<=832){
		$("#notice_size").width(windowWidth-50);
	}else{
		$("#notice_size").width(800);
	}
	if(windowWidth<=711){
		$("#subject").css("width","23%");
		$("#subject_detail").css("width","69%");
		$("#writer").css("width","23%");
		$("#writer_detail").css("width","69%");
	}else{
		$("#subject").css("width","10%");
		$("#subject_detail").css("width","89%");
		$("#writer").css("width","10%");
		$("#writer_detail").css("width","89%");
	}


	
	$(window).resize(function(){
		windowWidth=$(window).width();
		console.log(windowWidth);
		if(windowWidth<=832){
			$("#notice_size").width(windowWidth-50);
		}else{
			$("#notice_size").width(800);

		}
		if(windowWidth<=711){
			$("#subject").css("width","23%");
			$("#subject_detail").css("width","69%");
			$("#writer").css("width","23%");
			$("#writer_detail").css("width","69%");
		}else{
			$("#subject").css("width","10%");
			$("#subject_detail").css("width","89%");
			$("#writer").css("width","10%");
			$("#writer_detail").css("width","89%");
		}
		
		
	});
		
	});
	</script>
</head>
<body>
<%@include file="../Header.jsp" %>

    <section id="single-page-slider" class="no-margin">
        <div class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="item active">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="center gap fade-down section-heading">
                                    <script>
                                    	if(window.location.href.indexOf("eng")!=-1){
                                    		document.write("<h2 class='main-title'>NOTICE</h2>");
                                    	}else if(window.location.href.indexOf("china")!=-1){
                                    		document.write("<h2 class='main-title'>公告事项</h2>");
                                    	}else{
                                    		document.write("<h2 class='main-title'>공지사항</h2>");
                                    	}
                                    </script>
                                    <hr>
                                </div>
                            </div>   
                        </div>
                    </div>
                </div><!--/.item-->
            </div><!--/.carousel-inner-->
        </div><!--/.carousel-->
    </section><!--/#main-slider-->
  
    <!-- body -->
	 <div class="container" style="width:100%; position: relative;"  id="dd" >
<div style="width:800px; margin:auto;" id="notice_size">
   	<div class="row" style="margin-top: 10px;  position: relative; top: 15px; left:-5px; padding-bottom: 5px;">
   	 <div  class="col-md-10" style="width:100%; margin:auto; margin-top:10px;  padding-bottom: 5px; position: relative; left: 5px;" id="spanss">
   	 	<script>
   	 	if(window.location.href.indexOf("eng")!=-1){
   	 		document.write("<span  style='float: right;' ><h6>Modification date <fmt:formatDate pattern='yy-MM-dd' value='${read.update_date}'/></h6></span>");
   	 		document.write("<span  style='float: right;'><h6>Number of views <c:out value='${read.view_cnt}'/> &emsp;</h6></span>");
   	 	}else if(window.location.href.indexOf("china")!=-1){
   	 		document.write("<span  style='float: right;' ><h6>修订日期<fmt:formatDate pattern='yy-MM-dd' value='${read.update_date}'/></h6></span>");
	 		document.write("<span  style='float: right;'><h6>查询数<c:out value='${read.view_cnt}'/> &emsp;</h6></span>");
   	 	}else{
   	 	document.write("<span  style='float: right;' ><h6>수정날짜<fmt:formatDate pattern='yy-MM-dd' value='${read.update_date}'/></h6></span>");
	 	document.write("<span  style='float: right;'><h6>조회수<c:out value='${read.view_cnt}'/> &emsp;</h6></span>");
   	 	}
   	 	</script>
 
   	 </div>
  	
   	</div>
   	 <div class="row" style=" margin-top: 10px; position: relative;" >
   	 	<div class="col-xs-2 col-md-1" id="subject" style="width:10%; margin: auto; background-color: #F0F0F0; height: 63px; border-bottom: 1.6px solid #BDBDBD; border-top:2.5px solid #08298A; ">
   	 		<script>
   	 		if(window.location.href.indexOf("eng")!=-1){
   	 			document.write("<p style='margin-top: 20px; font-weight: bold; font-size: 13px;'>Title</p>");
   	 		}else if(window.location.href.indexOf("china")!=-1){
   	 			document.write("<p style='margin-top: 20px; font-weight: bold; font-size: 13px;'>题目</p>");

   	 		}else{
   	 			document.write("<p style='margin-top: 20px; font-weight: bold; font-size: 13px;'>제목</p>");

   	 		}
   	 		</script>
   	 		
   	 		
   	 	</div>
		 <div class="col-xs-10 col-md-9" id="subject_detail" style="width:89%; margin: auto; height: 63px; border-bottom: 1.6px solid #BDBDBD; border-top:2.5px solid #08298A;" >
	  		<input type="text"  id="title" name="title" value='&emsp;<c:out value="${read.title }"/>' readonly="readonly" style="width:100%;height:42px; background-color:white; position: relative; left: -25px; top:-32px; ">
		</div>
	</div>
   	 
   	 
  
	<div class="row" style=" padding-left: 0px;">
   	 	<div class="col-xs-2 col-md-1" id="writer" style="width:10%; margin: auto; background-color: #F0F0F0; height: 63px; border-bottom: 1.6px solid #BDBDBD; ">
   	 		<script>
   	 		if(window.location.href.indexOf("eng")!=-1){
   	   	 		document.write("<p style='margin-top:19px; font-weight:bold; font-size:13px;'>Writer</p>");
   	 		}else if(window.location.href.indexOf("china")!=-1){
   	   	 		document.write("<p style='margin-top:19px; font-weight:bold; font-size:13px;'>写手</p>");

   	 		}else{
   	   	 		document.write("<p style='margin-top:19px; font-weight:bold; font-size:13px;'>작성자</p>");

   	 		}
   	 			
   	 		</script>
   	 		
   	 	
   	 	</div>
		 <div class="col-xs-10 col-md-9" id="writer_detail" style="width:89%; margin: auto; height: 63px; border-bottom: 1.6px solid #BDBDBD;" >
	  		<input type="text"  id="title" name="title" value='&emsp;<c:out value="${read.writer}"/>' readonly="readonly" style="height:42px; background-color:white; position: relative; left: -25px; top:-32px;">
		</div>
	</div>
  <div class="row" style="border: margin-top: 10px; padding-left: 0px; position: relative; top: 0px;"> 	  
	 <div class="col-xs-12 col-md-10" style="width:100%; padding-top: 7px; position: relative; left: -13px; " id="textareahr" >
   		<textarea rows="13" id="content" name="content" wrap="VIRTUAL"   readonly="readonly" style="background-color: white; border-bottom:1; border-top:0; border-left:0; border-right:0; overflow-y:hidden; resize:none; background:clear; width: 103%; height:80%; position: relative; top: 10px;">&ensp;<c:out value="${read.content}"/></textarea><hr>
   	</div>
   </div>
   
	<div style="width: 100px; margin: auto; padding-bottom: 12px; float: right; top: 15px;" id="li">
	<script>
	if(window.location.href.indexOf("eng")!=-1){
		document.write("<a href='/eng/notice' class='btn btn-info btn-outlined' style='font-weight: bold;width:100%;' >LIST</a>");
	}else if(window.location.href.indexOf("china")!=-1){
		document.write("<a href='/china/notice' class='btn btn-info btn-outlined' style='font-weight: bold;width:100%;' >目录</a>");

	}else{
		document.write("<a href='/notice' class='btn btn-info btn-outlined' style='font-weight: bold;width:100%;' >목록</a>");
	}
	</script>
	</div>
    </div> 
   </div>
<!-- body end-->
	<!-- footer -->
<%@include file="../Footer.jsp" %>


</body>
</html>