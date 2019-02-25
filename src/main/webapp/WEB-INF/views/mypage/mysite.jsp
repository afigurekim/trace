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
    
    </script>
    <script type="text/javascript">
	$(function(){
		var windowWidth = $( window ).width();
		var joinWidth=$("#joinform").width();
		 $("#join_responsive").css("width","909.98px");
		 $("#join_responsive").css("margin","auto");
		 $("#join_responsive").css("margin-top","0px");
	
		 if(windowWidth<=626){
			 $("#join_responsive").width(windowWidth-30);
		 }
		$(window).resize(function(){
			 windowWidth = $( window ).width();
			 joinWidth=$("#joinform").width();
			
			 if(windowWidth<=626){
				 $("#join_responsive").width(windowWidth-30);
	
			 }else{
				 $("#join_responsive").css("width","909.98px");
			 }
			console.log("폼크기"+joinWidth);
			console.log("윈도우 크기"+windowWidth);
		});
	});
	
	</script>
</head><!--/head-->
<body>
<%@include file="../Header.jsp" %>
<!-- 찜 목록 삭제 후 처리 페이지 -->
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
                <div id="join_responsive" class="row">
                    <div class="col-md-2 fade-up">
                        <h3>마이페이지</h3>
                        <p><a href="/mypage">찜 목록</a><br/>
                            <a href="/mycomment">내 댓글</a><br/>
                            <a href="/myinfo">정보수정</a><br/>
                        </p>
                    </div><!-- col -->
                
                    <div class="col-md-10 fade-up">
		        		<h3>찜 목록</h3>
		                <form role="joinform" id="joinform">
		                	<br>
		                	<h4>찜 목록의 유적지가 성공적으로 삭제되었습니다.</h4>
		                	<br>
		                	<!-- 찜 목록으로 돌아가는 버튼 -->
		                    <div class="form-group text-center">
		                        <a type="submit" id="join-submit" class="btn btn-primary" role="button" href="/mypage">
		                            돌아가기
		                        </a>
		                    </div>
						</form>
                </div><!-- row -->  
                <div class="gap"></div>         
            </div>
            </div>
        </section><!-- section -->
    </div>

<%@include file="../Footer.jsp" %>


</body>
</html>