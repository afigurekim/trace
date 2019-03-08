<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<script type="text/javascript">

</script>
<body>


	<div id="preloader"></div>
    <header class="navbar navbar-inverse navbar-fixed-top opaqued" role="banner">
    <div id="search-wrapper">
        <div class="container">
            <input id="search-box" placeholder="Search">
        </div>
    </div>
 
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="/"><img src="../../../resources/imgs/메인로고.png" style="width:150px;height:70px; margin-top:-25px"></a>
            </div>
             <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                	<li style="margin-top:12px;"><a href="/kor" style="background-image:url('../../../resources/imgs/한국어.png'); width:40px; height:30px; background-size:40px 30px;"></a><a href="/eng" style="background-image:url('../../../resources/imgs/영어.png'); width:40px; height:30px; background-size:40px 30px;"></a><a href="/china" style="background-image:url('../../../resources/imgs/중국어.png'); width:40px; height:30px; background-size:40px 30px;"></a></li>
                    
                    <script type="text/javascript">

                    if(window.location.href.indexOf("kor")!=-1){
                    	document.write("<li><a href='/intro'>소개</a></li>");
                    	document.write("<li class='dropdown active'>");
                    	document.write("<a href='#' class='dropdown-toggle' data-toggle='dropdown'>유적지 <i class='icon-angle-down'></i></a>");
                    	document.write("<ul class='dropdown-menu'>");
                    	document.write("<li><a href='/period'>시대별</a></li>");
                    	document.write("<li><a href='/thema'>테마별</a></li>");
                    	document.write("<li><a href='/region/main'>지역별</a></li>");
                    	document.write("<li><a href='#'>에디터 추천코스</a></li>");
                    	document.write("</ul>");
                    	document.write("</li>");
					 	if(("${login_id2}"=="" || "${login_id2}"==null) && ("${login_id}"=="" || "${login_id}"==null)){
					 		document.write("<li><a href='/join'>회원가입</a></li>");
					 		document.write("<li><a href='/login'>로그인</a></li>");
					 	}
					 	else{
					 		document.write("<li><a href='/logout' onclick='logout()'>로그아웃</a></li>");
		                    document.write("<li><a id='mypage' href='/mypage'>마이페이지</a></li>"); 
					 	}
	                    document.write("<li><a href='/notice'>공지사항</a></li>");
                    }
                    else if(window.location.href.indexOf("eng")!=-1){
                    	document.write("<li><a href='/eng/intro'>INTRO</a></li>");
                    	document.write("<li class='dropdown active'>");
                    	document.write("<a href='#' class='dropdown-toggle' data-toggle='dropdown'>HISTORIC SITE <i class='icon-angle-down'></i></a>");
                    	document.write("<ul class='dropdown-menu'>");
                    	document.write("<li><a href='/eng/period'>PERIOD</a></li>");
                    	document.write("<li><a href='/eng/thema'>THEME</a></li>");
                    	document.write("<li><a href='/eng/region/main'>REGION</a></li>");
                    	document.write("<li><a href='#'>EDITOR RECOMMEND</a></li>");
                    	document.write("</ul>");
                    	document.write("</li>");
					 	if(("${login_id2}"=="" || "${login_id2}"==null) && ("${login_id}"=="" || "${login_id}"==null)){
					 		document.write("<li><a href='/eng/join'>JOIN</a></li>");
					 		document.write("<li><a href='/eng/login'>LOGIN</a></li>");
					 	}
					 	else{
		                    document.write("<li><a href='/logout' onclick='logout()'>LOGOUT</a></li>");
		                    document.write("<li><a id='mypage' href='/eng/mypage'>MYPAGE</a></li>"); 
					 	}
	                    document.write("<li><a href='/eng/notice'>NOTICE</a></li>");
                    }
                    else if(window.location.href.indexOf("china")!=-1){
                    	document.write("<li><a href='/china/intro'>贴士</a></li>");
                    	document.write("<li class='dropdown active'>");
                    	document.write("<a href='#' class='dropdown-toggle' data-toggle='dropdown'>遺跡地 <i class='icon-angle-down'></i></a>");
                    	document.write("<ul class='dropdown-menu'>");
                    	document.write("<li><a href='/china/period'>時代</a></li>");
                    	document.write("<li><a href='/china/thema'>题目</a></li>");
                    	document.write("<li><a href='/china/region/main'>地域</a></li>");
                    	document.write("<li><a href='#'>编辑推荐路线</a></li>");
                    	document.write("</ul>");
                    	document.write("</li>");
					 	if(("${login_id2}"=="" || "${login_id2}"==null) && ("${login_id}"=="" || "${login_id}"==null)){
					 		document.write("<li><a href='/china/join'>加入会员</a></li>");
					 		document.write("<li><a href='/china/login'>签到</a></li>");
					 	}
					 	else{
					 		document.write("<li><a href='/logout' onclick='logout()'>退出 </a></li>");
		                    document.write("<li><a id='mypage' href='/china/mypage'>我的页面</a></li>"); 

					 	}
	                    document.write("<li><a id='mypage' href='/china/mypage'>我的页面</a></li>"); 
	                    document.write("<li><a href='/china/notice'>公知事項</a></li>");
                    }else{
                    	document.write("<li><a href='/intro'>소개</a></li>");
                    	document.write("<li class='dropdown active'>");
                    	document.write("<a href='#' class='dropdown-toggle' data-toggle='dropdown'>유적지 <i class='icon-angle-down'></i></a>");
                    	document.write("<ul class='dropdown-menu'>");
                    	document.write("<li><a href='/period'>시대별</a></li>");
                    	document.write("<li><a href='/thema'>테마별</a></li>");
                    	document.write("<li><a href='/region/main'>지역별</a></li>");
                    	document.write("<li><a href='#'>에디터 추천코스</a></li>");
                    	document.write("</ul>");
                    	document.write("</li>");
					 	if(("${login_id2}"=="" || "${login_id2}"==null) && ("${login_id}"=="" || "${login_id}"==null)){
					 		document.write("<li><a href='/join'>회원가입</a></li>");
					 		document.write("<li><a href='/login'>로그인</a></li>");

					 	}
					 	else{
						 	
					 		document.write("<li><a href='/logout' onclick='logout()'>로그아웃</a></li>");
		                    document.write("<li><a id='mypage' href='/mypage'>마이페이지</a></li>"); 

					 	}
	                    document.write("<li><a href='/notice'>공지사항</a></li>");
                    }
                    </script>
                    
                    
                 
                </ul>
            </div>
        </div>
    </header><!--/header-->
	
</body>
</html>