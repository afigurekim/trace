<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>소개</title>
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="../resources/css/pe-icons.css" rel="stylesheet">
    <link href="../resources/css/prettyPhoto.css" rel="stylesheet">
    <link href="../resources/css/animate.css" rel="stylesheet">
    <link href="../resources/css/style.css" rel="stylesheet">
    <link href="../resources/css/intro-style.css" rel="stylesheet">
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
    <script src="../resources/js/intro-app.js"></script>
  
<script type="text/javascript">
$(function(){
	var windowWidth = $( window ).width();
	$(window).resize(function(){
		windowWidth = $( window ).width();
		console.log("윈도우 크기"+windowWidth);
	});
});
</script>
</head>
<body>
<%@include file="Header.jsp" %>

<div class="intro-parallax" id="parallax-1" data-image-src="../resources/imgs/intro/intro-01.jpg">
    <div class="intro-caption">
      <span class="intro-border">&nbsp;<b>발자취</b>란?</span>
    </div>
  </div>

  <div class="intro-parallax" id="parallax-2" data-image-src="../resources/imgs/intro/intro-02.jpg" >
    <div class="intro-caption">
      <span class="intro-border">&nbsp;발자취는 국내 주요 유적지와 문화재에 대한 정보를<br>&nbsp;지역별, 시대별, 테마별로 소개하면서<br>&nbsp;해당 지역에 대한 지역정보도 제공하는<br>&nbsp;<b>역사유물 지역정보</b> 제공 웹사이트 입니다.</span>
    </div>
  </div>

  <div class="intro-text">
    <p><i>맛집, 카페, 영화관, 쇼핑.</i><br>여러분의 외출 패턴도 이제 식상하지 않으신 가요?</p>
  </div>

  <div class="intro-parallax" id="parallax-3" data-image-src="../resources/imgs/intro/intro-03.jpg">
    <div class="intro-caption">
      <span class="intro-border">&nbsp;발자취는 대한민국 전국에서 찾을 수 있는 <b>유적지와 문화재를</b><br>&nbsp;지역, 시대, 테마 등의 카테고리로 나누어<br>&nbsp;각 장소의 정보와 후기를 통해서<br>&nbsp;여러분이 가 볼만한 장소인지를 파악하는데 도움을 줍니다.</span>
    </div>
  </div>

  <div class="intro-parallax" id="parallax-4" data-image-src="../resources/imgs/intro/intro-04.jpg" data-height="400px">
    <div class="intro-caption">
      <span class="intro-border">&nbsp;전국 각 지역의 날씨정보 제공</span>
    </div>
  </div>

  <div class="intro-parallax" id="parallax-5" data-image-src="../resources/imgs/intro/intro-05.jpg" data-height="400px">
    <div class="intro-caption">
      <span class="intro-border">&nbsp;가 볼만한 유적지, 문화재 소개</span>
    </div>
  </div>

  <div class="intro-parallax" id="parallax-6" data-image-src="../resources/imgs/intro/intro-06.jpg" data-height="400px">
    <div class="intro-caption">
      <span class="intro-border">&nbsp;인근 맛집 정보 제공</span>
    </div>
  </div>

  <div class="intro-parallax" id="parallax-7" data-image-src="../resources/imgs/intro/intro-07.jpg">
    <div class="intro-caption">
      <span class="intro-border">&nbsp;회원등록을 하시면 관심이 가는 장소를 찜하는 것도 가능하며,<br>&nbsp;에디터의 추천코스로 연인과의 데이트, 가족과의 나들이,<br>&nbsp;역사교육 등 여러가지 상황을 위한<br>&nbsp;맞춤형 코스를 조회하여 보실 수도 있습니다.</span>
    </div>
  </div>

<%@include file="intro-footer.jsp" %> 

</body>
</html>