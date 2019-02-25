<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>

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
                <a class="navbar-brand" href="/"><img src="../resources/imgs/메인로고.png" style="width:150px;height:70px; margin-top:-25px"></a>
            </div>
             <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                	<li style="margin-top:12px;"><a href="#" style="background-image:url('../resources/imgs/한국어.png'); width:40px; height:30px; background-size:40px 30px;"></a><a href="#" style="background-image:url('../resources/imgs/영어.png'); width:40px; height:30px; background-size:40px 30px;"></a><a href="#" style="background-image:url('../resources/imgs/중국어.png'); width:40px; height:30px; background-size:40px 30px;"></a></li>
                    <li><a href="/intro">소개</a></li>
                     <li class="dropdown active">
                       <a href="#" class="dropdown-toggle" data-toggle="dropdown">유적지 <i class="icon-angle-down"></i></a>
                        <ul class="dropdown-menu">
	                    <li><a href="/period">시대별</a></li>
	                    <li><a href="/thema">테마별</a></li>
	                    <li><a href="/region/main">지역별</a></li>
                        </ul>
                    </li> 

                    <script type="text/javascript">
					 	if(("${login_id2}"=="" || "${login_id2}"==null) && ("${login_id}"=="" || "${login_id}"==null)){
					 		document.write("<li><a href='/join'>회원가입</a></li>");
					 		document.write("<li><a href='/login'>로그인</a></li>");

					 	}
					 
					 	else{
					 	
					 		document.write("<li><a href='/logout' onclick='logout()'>로그아웃</a></li>");
					 	}
					 	</script>
                    <li><a href="/mypage">마이페이지</a></li> 
                    <li><a href="/write">공지사항</a></li> 
                    
                 
                </ul>
            </div>
        </div>
    </header><!--/header-->
	
</body>
</html>