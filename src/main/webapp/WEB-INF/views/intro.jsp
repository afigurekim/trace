<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>About Us | Impact By Distinctive Themes</title>
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="../resources/css/pe-icons.css" rel="stylesheet">
    <link href="../resources/css/prettyPhoto.css" rel="stylesheet">
    <link href="../resources/css/animate.css" rel="stylesheet">
    <link href="../resources/css/style.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <script src="../resources/js/jquery.js"></script>
    <link rel="shortcut icon" href="../resources/imgs/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../resources/imgs/ico/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../resources/imgs/ico/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../resources/imgs/ico/images/ico/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon-precomposed" href="../resources/imgs/ico/apple-touch-icon-57x57.png">
    <script src="../resources/js/bootstrap.min.js"></script>
    <script src="../resources/js/jquery.prettyPhoto.js"></script>
    <script src="../resources/js/plugins.js"></script>
    <script src="../resources/js/init.js"></script>
  
<script type="text/javascript">
$(function(){
	var windowWidth = $( window ).width();
	$(window).resize(function(){
		 windowWidth = $( window ).width();
		console.log("윈도우 크기"+windowWidth);
		
		if(windowWidth<=1205){
			$("#intro").width(windowWidth);
		}else{
			$("#intro").width(1080);

		}
	});
});
</script>
</head>
<body>
<%@include file="Header.jsp" %>

<div>
<div style="width:100%; height:200px; background-color:#282625;"></div>
<div style="width:100%;">
	<div style="width:1080px; margin:auto;">
			<img src="../resources/imgs/소개글.png" id="intro">
	</div>
	</div>
</div>
<%@include file="Footer.jsp" %> 

</body>
</html>