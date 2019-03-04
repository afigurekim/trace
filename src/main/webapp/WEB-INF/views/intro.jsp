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
      <span class="intro-border">
        <script type="text/javascript">
			if(window.location.href.indexOf("eng")!=-1){
				document.write("What is <b>Traces</b>?");
			}else if(window.location.href.indexOf("china")!=-1){
				document.write("<b>足迹</b>是什么?");
			}else{
				document.write("<b>발자취</b>란?");
			}
		</script>
      </span>             
    </div>
  </div>

  <div class="intro-parallax" id="parallax-2" data-image-src="../resources/imgs/intro/intro-02.jpg" >
    <div class="intro-caption">
      <span class="intro-border">
        <script type="text/javascript">
			if(window.location.href.indexOf("eng")!=-1){
				document.write("Traces is a website that provides <b>regional information about major Korean historical sites and cultural assets</b> by region, historic era, and theme, and also provides information about local businesses around the area.");
			}else if(window.location.href.indexOf("china")!=-1){
				document.write("脚印是按照地区,时代,主题介绍韩国主要遗址和文化遗产信息,并提供有关地区信息的<b>历史文物地区信息</b>提供网站。");
			}else{
				document.write("발자취는 국내 주요 유적지와 문화재에 대한 정보를 지역별, 시대별, 테마별로 소개하면서 해당 지역에 대한 지역정보도 제공하는 <b>역사유물 지역정보</b> 제공 웹사이트 입니다.");
			}
		</script>
      </span>
    </div>
  </div>

  <div class="intro-text">
  	<p>
        <script type="text/javascript">
			if(window.location.href.indexOf("eng")!=-1){
				document.write("<i>A meal, cafe, movie theater, shopping.</i><br>Aren't your outing patterns boring anymore?");
			}else if(window.location.href.indexOf("china")!=-1){
				document.write("<i>美食店,咖啡馆,电影院,购物......</i><br>各位的外出方式是不是也腻了?");
			}else{
				document.write("<i>맛집, 카페, 영화관, 쇼핑.</i><br>여러분의 외출 패턴도 이제 식상하지 않으신 가요?");
			}
		</script>
	</p>
  </div>

  <div class="intro-parallax" id="parallax-3" data-image-src="../resources/imgs/intro/intro-03.jpg">
    <div class="intro-caption">
      <span class="intro-border">
        <script type="text/javascript">
			if(window.location.href.indexOf("eng")!=-1){
				document.write("Traces divide <b>historic sites and cultural assets</b> that can be found throughout Korea into categories such as region, historic era, and theme, and help you find out if they are a good place to visit through information and reviews.");
			}else if(window.location.href.indexOf("china")!=-1){
				document.write("足迹将韩国全国范围内能找到的<b>遗址和文化遗产</b>分为地区,时代,主题等类别,通过各个场所的信息和后期信息,帮助大家了解是否值得一去。");
			}else{
				document.write("발자취는 대한민국 전국에서 찾을 수 있는 <b>유적지와 문화재를</b> 지역, 시대, 테마 등의 카테고리로 나누어 각 장소의 정보와 후기를 통해서 여러분이 가 볼만한 장소인지를 파악하는데 도움을 줍니다.");
			}
		</script>
      </span>
    </div>
  </div>

  <div class="intro-parallax" id="parallax-4" data-image-src="../resources/imgs/intro/intro-04.jpg" data-height="400px">
    <div class="intro-caption">
      <span class="intro-border">
        <script type="text/javascript">
			if(window.location.href.indexOf("eng")!=-1){
				document.write("Provide weather information for each region of Korea");
			}else if(window.location.href.indexOf("china")!=-1){
				document.write("韩国各地提供天气信息");
			}else{
				document.write("전국 각 지역의 날씨정보 제공");
			}
		</script>
      </span>
    </div>
  </div>

  <div class="intro-parallax" id="parallax-5" data-image-src="../resources/imgs/intro/intro-05.jpg" data-height="400px">
    <div class="intro-caption">
      <span class="intro-border">
        <script type="text/javascript">
			if(window.location.href.indexOf("eng")!=-1){
				document.write("Introducing cultural assets and historic sites worth visiting");
			}else if(window.location.href.indexOf("china")!=-1){
				document.write("值得一看的遗址和文化遗产介绍");
			}else{
				document.write("가 볼만한 유적지, 문화재 소개");
			}
		</script>
      </span>
    </div>
  </div>

  <div class="intro-parallax" id="parallax-6" data-image-src="../resources/imgs/intro/intro-06.jpg" data-height="400px">
    <div class="intro-caption">
      <span class="intro-border">
        <script type="text/javascript">
			if(window.location.href.indexOf("eng")!=-1){
				document.write("Provide information on nearby restaurants and accommodations");
			}else if(window.location.href.indexOf("china")!=-1){
				document.write("提供附近美食店及住宿设施信息");
			}else{
				document.write("인근 맛집, 숙박시설 정보 제공");
			}
		</script>
      </span>
    </div>
  </div>

  <div class="intro-parallax" id="parallax-7" data-image-src="../resources/imgs/intro/intro-07.jpg">
    <div class="intro-caption">
      <span class="intro-border">
        <script type="text/javascript">
			if(window.location.href.indexOf("eng")!=-1){
				document.write("If you sign up for an account, you can save places of interest. You can also check customized courses for activities such as dates, family outing, history education, etc. by checking the recommended courses of our editor.");
			}else if(window.location.href.indexOf("china")!=-1){
				document.write("注册会员后可保存感兴趣的场所,也可作为编辑推荐的路线,为恋人约会,与家人出游,历史教育等各种情况查询。");
			}else{
				document.write("회원등록을 하시면 관심이 가는 장소를 찜하는 것도 가능하며, 에디터의 추천코스로 연인과의 데이트, 가족과의 나들이, 역사교육 등 여러가지 상황을 위한 맞춤형 코스를 조회하여 보실 수도 있습니다.");
			}
		</script>
      </span>
    </div>
  </div>

<%@include file="intro-footer.jsp" %> 

</body>
</html>