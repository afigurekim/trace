<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);
.jh{font-family: 'Jeju Hallasan', cursive;}
</style>
<link rel="stylesheet" type="text/css" href="../../resources/css/style.css" />
<style>


.zeta-menu { margin: 0; padding: 0; }
.zeta-menu li {
  float: left;
  list-style:none;
  position: relative;
}
.zeta-menu li:hover { background: white; }
.zeta-menu a {
  color: white;
  display: block;
  padding: 10px 20px;
  text-decoration: none;
}
.zeta-menu ul {
  background: #eee;
  display: none;
  padding: 0;
  position: absolute;
  left: 0;
  top: 33px;
  width: 200px;
}
.zeta-menu ul li { float: none; }
.zeta-menu ul li:hover { background: #ddd; }
.zeta-menu ul li:hover a { color: black; }
.zeta-menu ul a { color: black; }
.zeta-menu ul ul { left: 100%; top: 0; }
.zeta-menu ul ul li {float:left; margin-right:10px;}
</style>
<script type="text/javascript">
$(function(){
	  $("#menu2 li").hover(function(){
	    $('ul:first',this).show();
	  }, function(){
	    $('ul:first',this).hide();
	  });
	  $("#menu2 li:has(ul)>a").each( function() {
	    $(this).html( $(this).html() );
	  });
	 
	});
</script>
</head>

<body>

	<div id="header">
		 <div id="inner1">
		
			 <div id="menu" class="jh">
				 <img src="../resources/imgs/한국어.png" style="width:50px;height:50px;float:right; margin-top:-15px;">
				 <img src="../resources/imgs/영어.png" style="width:50px;height:50px;float:right; margin-top:-15px;">
				 <img src="../resources/imgs/중국어.png" style="width:50px;height:50px;float:right;margin-top:-15px;">
				 <ul>
				 	<li><a href="/join">회원가입</a></li>
					<li><a href="/login">로그인</a></li>
				 	<li><a href="/mypage">마이리스트</a></li>
				 	<li><a href="/notice">공지사항</a></li>
			 		<li><a href="/write">글쓰기</a></li>
				 </ul>
			 </div>
		 </div>
		
		
		 <div id="inner2">
		 
		 	<div id="menu2" class="jh">
		 	 <div id="logo" style="float:left; margin-left:-150px;">
		 	<a href="/"><img src="../resources/imgs/로고.png" style="height:69px"></a>
		 </div>
			 <ul class="zeta-menu">
			 	<li><a href="/intro">소개</a></li>
			 	<li><a href="/period">시대별</a>
			 		<ul>
			 			<li><a href="#" style="background-color:white;"></a><li>
			 			<li><a href="/period/sunsa">선사시대</a></li>
			 			<li><a href="/period/samgook">삼국시대</a></li>
						<li><a href="/period/korea">고려시대</a></li>
			 			<li><a href="/period/josun">조선시대</a></li>
						<li><a href="/period/hyundae">근현대</a></li>			 			
			 					 		
			 		</ul>
			 	</li>
			 	
			 	<li><a href="/thema">테마별</a>
			 		<ul>
			 			<li><a href="#" style="background-color:white;"></a><li>
			 			<li><a href="/thema/study">교육</a></li>
			 			<li><a href="/thema/date">데이트</a></li>
			 			<li><a href="/thema/family">가족</a></li>
			 		</ul>
			 	</li>
			 		
			 	<li><a href="/region/main">지역별</a>
			 		<ul>
			 			<li><a href="#" style="background-color:white;"></a><li>	
			 			<li><a href="#">서울</a></li>
			 			<li><a href="#">인천</a></li>
			 			<li><a href="#">경기도</a></li>
			 			<li><a href="#">강원도</a></li>
			 			<li><a href="#">충청도</a></li>
			 			<li><a href="#">경상도</a></li>
			 			<li><a href="#">전라도</a></li>
			 			<li><a href="#">제주도</a></li>
			 		</ul>
			 	</li>
			 	<li><a href="#">에디터 추천코스</a></li>
			 	
			 </ul>
			</div>
		 </div>
	</div>
	
</body>
</html>