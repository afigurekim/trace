<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
 
    </script>
    <style>
		.thumb {
			padding: 5px;
			height: 110px;
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
<%@include file="../Header.jsp" %>
<!-- 마이 페이지 첫 화면 + 찜 목록 조회 페이지 -->
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
    <!-- 마이 페이지 좌측 메뉴 -->
    <div id="content-wrapper" style="margin-top:70px;">
        <section id="contact" class="white">
            <div class="container">
                <div class="gap"></div>
                <div class="row">
                    <div class="col-md-2 fade-up">
                        <h3>마이페이지</h3>
                        <p><a href="/mypage">찜 목록</a><br/>
                            <a href="/mycomment">내 댓글</a><br/>
                            <a href="/myinfo">정보수정</a><br/>
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
                        			<th>주소</th>
                        			<th class="tblcol-4">시대</th>
                        			<th class="tblcol-5">테마</th>
                        			<th class="tblcol-6"></th>
                        		</tr>
                        	</thead>
                        	<tbody>
                        		
                        		<c:forEach items="${mysiteList}" var="MemberSiteVO" varStatus="status">
                        		<tr>
                        			<td class="tblcol-1" style="vertical-align: middle"><img class="thumb" src="${MemberSiteVO.first_image}"></td>
                        			<td style="vertical-align: middle">${MemberSiteVO.site_name}</td>
                        			<td style="vertical-align: middle">${MemberSiteVO.address}</td>
                        			<td class="tblcol-4" style="vertical-align: middle">${MemberSiteVO.period}</td>
                        			<td class="tblcol-5" style="vertical-align: middle">${MemberSiteVO.thema}</td>
                        			<!-- 찜 목록 아이템 삭제 버튼 -->
                        			<td class="tblcol-6" style="vertical-align: middle">
                        				<form action="/mypage" method="post">
                        					<input type="hidden" name="jno" value="${MemberSiteVO.jno}"/>
                        					<button type="submit" id="join-submit" class="btn btn-warning">
                        						삭제<i class="fa fa-times spaceLeft"></i>
                        					</button>
                        				</form>
                        			</td>
                        		</tr>
                        		</c:forEach>
                        	</tbody>
                        </table>
                    </div><!-- col -->
                </div><!-- row -->  
                <div class="gap"></div>         
            </div>
        </section><!-- section -->
    </div>

<%@include file="../Footer.jsp" %>


</body>
</html>