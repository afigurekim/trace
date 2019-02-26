<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>내 댓글214pxw</title>
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
	    $(document).ready(function($) {
	    	$(".clickable-row").css("cursor", "pointer");
	        $(".clickable-row").click(function() {
	        	window.location = $(this).data("href");
	        });
	    });
    </script>
    <style>
    	#single-page-slider {
			background-image: url("../resources/imgs/mypage-banner.jpg");
			bakcground-color: #483D8B;
			background-size: cover;
			background-repeat: no-repeat;
			background-position: center;
		}
	</style>
  
</head><!--/head-->
<body>
<%@include file="../Header.jsp" %>
<!-- 내가 작성한 댓글 리스트 페이지 -->
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
    <div id="content-wrapper" class="no-margin">
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
                        <h3>내 댓글</h3>
                        <br>
                        <div class="table-wrapper">
                        <table class="table">
				        	<thead>
				        		<tr>
				        			<th class="col-md-1" style="white-space: nowrap;">글번호</th>
				        			<th class="col-md-2" style="white-space: nowrap;">장소</th>
				        			<th class="col-xs-1 hidden-xs" style="white-space: nowrap;">내용</th>
				        			<th class="col-md-2" style="white-space: nowrap;">작성일</th>
				        			<th class="col-md-1"></th>
				        		</tr>
				        	</thead>
				        	<tbody>
				        		<c:forEach items="${mycommentList}" var="ReplyVO" varStatus="status">
				        		<tr class="clickable-row" data-href="/period/read?bno=${ReplyVO.bno}">
									<td class="col-md-1" style="vertical-align: middle">${status.index+1}</td><!-- 글번호는 프론트에서 처리 -->
									<td class="col-md-2" style="vertical-align: middle; white-space: nowrap;">${ReplyVO.site_name}</td>
									<td class="col-xs-1 hidden-xs" style="vertical-align: middle; white-space: nowrap;">${ReplyVO.reply_text}</td>
									<td class="col-md-2" style="vertical-align: middle; white-space: nowrap;"><fmt:formatDate value="${ReplyVO.update_date}" pattern="yyyy/MM/dd"/></td>
									<!-- 댓글이 작성된 페이지로 이동하는 이동 버튼 (시대 페이지 기준 주소) -->
									<td class="col-md-1" style="vertical-align: middle">
										<a role="button" class="btn btn-primary" href="/period/read?bno=${ReplyVO.bno}">
											이동
										</a>
									</td>
								</tr>
				        		</c:forEach>
				        	</tbody>
			        	</table>
			        	</div>
                    </div><!-- col -->
                </div><!-- row -->  
                <!-- <div class="gap"></div> -->        
            </div>
        </section><!-- section -->
    </div>
 

<%@include file="../Footer.jsp" %>


</body>
</html>