<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>찜 목록</title>
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
    jQuery(document).ready(function($){
    'use strict';
        jQuery('body').backstretch([
            "http://placehold.it/800x600",
            "http://placehold.it/800x600",
            "http://placehold.it/800x600"
        ], {duration: 5000, fade: 500});
    });
    </script>
    <style>
		.thumb {
			padding: 5px;
			height: 110px;
		}
		tbody tr td {
			style="vertical-align: middle"
		}
		.tblcol-1 {
			width: 20%;
		}
		.tblcol-4, .tblcol-5 {
			width: 15%;
		}
		.tblcol-6 {
			width: 10%;
		}
	</style>
  
</head><!--/head-->
<body>
<div id="preloader"></div>
    <header class="navbar navbar-inverse navbar-fixed-top opaqued" role="banner">
    <div id="search-wrapper">
        <div class="container">
            <input id="search-box" placeholder="Search">
        </div>
    </div>
    </div>
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="/"><h1><span class="pe-7s-gleam bounce-in"></span> IMPACT</h1></a>
            </div>
             <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/intro">소개</a></li>
                     <li class="dropdown active">
                       <a href="#" class="dropdown-toggle" data-toggle="dropdown">유적지 <i class="icon-angle-down"></i></a>
                        <ul class="dropdown-menu">
	                    <li><a href="/period">시대별</a></li>
	                    <li><a href="/thema">테마별</a></li>
	                    <li><a href="/region/main">지역별</a></li>
                        </ul>
                    </li> 

                    <li><a href="/join">회원가입</a></li> 
                    <li><a href="/login">로그인</a></li> 
                    <li><a href="/mypage">마이페이지</a></li> 
                    <li><a href="/write">공지사항</a></li> 
                    
                 
                    <li><span class="search-trigger"><i class="fa fa-search"></i></span></li>
                </ul>
            </div>
        </div>
    </header><!--/header-->

    <section id="single-page-slider" class="no-margin">
        <div class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="item active">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="center gap fade-down section-heading">
                                    <h2 class="main-title">마이페이지</h2>
                                    <hr>
                                    <p>찜 목록 · 내 댓글 · 정보수정</p>
                                </div>
                            </div>   
                        </div>
                    </div>
                </div><!--/.item-->
            </div><!--/.carousel-inner-->
        </div><!--/.carousel-->
    </section><!--/#main-slider-->
    
    <div id="content-wrapper" style="margin-top:70px;">
        <section id="contact" class="white">
            <div class="container">
                <div class="gap"></div>
                <div class="row">
                    <div class="col-md-2 fade-up">
                        <h3>마이페이지</h3>
                        <p><a href="/mypage">찜 목록</a><br/>
                            <a href="/mycomment">내 댓글</a><br/>
                            <a href="/myupdate">정보수정</a><br/>
                        </p>
                    </div><!-- col -->
                
                    <div class="col-md-10 fade-up">
                        <h3>찜 목록</h3>
                        <br>
                        <table class="table">
                        	<thead>
                        		<tr>
                        			<th class="tblcol-1"></th>
                        			<th>장소</th>
                        			<th>지역</th>
                        			<th class="tblcol-4">시대</th>
                        			<th class="tblcol-5">테마</th>
                        			<th class="tblcol-6"></th>
                        		</tr>
                        	</thead>
                        	<tbody>
                        		<tr>
                        			<td class="tblcol-1" style="vertical-align: middle"><img class="thumb" src="/resources/imgs/sun.png"></td>
                        			<td style="vertical-align: middle">남한산성</td>
                        			<td style="vertical-align: middle">서울 ㅇㅇ구</td>
                        			<td class="tblcol-4" style="vertical-align: middle">현대</td>
                        			<td class="tblcol-5" style="vertical-align: middle">가족</td>
                        			<td class="tblcol-6" style="vertical-align: middle"><button type="button" class="btn btn-default">삭제</button></td>
                        		</tr>
                        		<tr>
                        			<td class="tblcol-1" style="vertical-align: middle"><img class="thumb" src="/resources/imgs/sun.png"></td>
                        			<td style="vertical-align: middle">동대문</td>
                        			<td style="vertical-align: middle">서울 ㅁㅁ구</td>
                        			<td class="tblcol-4" style="vertical-align: middle">고대</td>
                        			<td class="tblcol-5" style="vertical-align: middle">데이트</td>
                        			<td class="tblcol-6" style="vertical-align: middle"><button type="button" class="btn btn-default">삭제</button></td>
                        		</tr>
                        		<tr>
                        			<td class="tblcol-1" style="vertical-align: middle"><img class="thumb" src="/resources/imgs/sun.png"></td>
                        			<td style="vertical-align: middle">서대문</td>
                        			<td style="vertical-align: middle">서울 ㅂㅂ구</td>
                        			<td class="tblcol-4" style="vertical-align: middle">조선</td>
                        			<td class="tblcol-5" style="vertical-align: middle">역사</td>
                        			<td class="tblcol-6" style="vertical-align: middle"><button type="button" class="btn btn-default">삭제</button></td>
                        		</tr>
                        		<tr>
                        			<td class="tblcol-1" style="vertical-align: middle"><img class="thumb" src="/resources/imgs/sun.png"></td>
                        			<td style="vertical-align: middle">숭례문</td>
                        			<td style="vertical-align: middle">서울 ㄱㄱ구</td>
                        			<td class="tblcol-4" style="vertical-align: middle">삼국</td>
                        			<td class="tblcol-5" style="vertical-align: middle">가족</td>
                        			<td class="tblcol-6" style="vertical-align: middle"><button type="button" class="btn btn-default">삭제</button></td>
                        		</tr>
                        		<tr>
                        			<td class="tblcol-1" style="vertical-align: middle"><img class="thumb" src="/resources/imgs/sun.png"></td>
                        			<td style="vertical-align: middle">광화문</td>
                        			<td style="vertical-align: middle">서울 ㅅㅅ구</td>
                        			<td class="tblcol-4" style="vertical-align: middle">조선</td>
                        			<td class="tblcol-5" style="vertical-align: middle">데이트</td>
                        			<td class="tblcol-6" style="vertical-align: middle"><button type="button" class="btn btn-default">삭제</button></td>
                        		</tr>
                        	</tbody>
                        </table>
                    </div><!-- col -->
                </div><!-- row -->  
                <div class="gap"></div>         
            </div>
        </section><!-- section -->
    </div>

    <div id="footer-wrapper">
        

        <footer id="footer" class="">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        &copy; 2019 <a target="_blank" href="http://www.distinctivethemes.com" title="Premium Themes and Templates">Distinctive Themes</a>. All Rights Reserved.
                    </div>
                    <div class="col-sm-6">
                        <ul class="pull-right">
                            <li><a id="gototop" class="gototop" href="#"><i class="fa fa-chevron-up"></i></a></li><!--#gototop-->
                        </ul>
                    </div>
                </div>
            </div>
        </footer><!--/#footer-->
    </div>


</body>
</html>