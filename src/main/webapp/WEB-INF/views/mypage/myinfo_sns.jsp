<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>정보수정</title>
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
    <style>
		#single-page-slider {
			background-image: url("../resources/imgs/banner/mypage-banner.jpg");
			bakcground-color: #483D8B;
			background-size: cover;
			background-repeat: no-repeat;
			background-position: center;
		}
	</style>
</head><!--/head-->
<body>
<%@include file="../Header.jsp" %>
<!-- 정보수정 성공 후 안내 페이지 -->
    <section id="single-page-slider" class="no-margin">
        <div class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="item active">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="center gap fade-down section-heading">
	                                <script type="text/javascript">
					        		if(window.location.href.indexOf("eng")!=-1){
					        			document.write("<h2 class="main-title">My Page</h2><hr><p>My Places · My Comments · Account</p>");
					        		}else if(window.location.href.indexOf("china")!=-1){
					        			document.write("<h2 class="main-title">我的页面</h2><hr><p>我的地点 · 我的评论 · 帐户</p>");
					        		}else{
					        			document.write("<h2 class="main-title">마이페이지</h2><hr><p>찜 목록 · 내 댓글 · 정보수정</p>");
					        		}
					        		</script>
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
                <div id="join_responsive" class="row">
                    <div class="col-md-2 fade-up">
                        <script type="text/javascript">
		        		if(window.location.href.indexOf("eng")!=-1){
		        			document.write("<h3>My Page</h3><p><a href="/mypage">My Places</a><br/><a href="/mycomment">My Comments</a><br/><a href="/myinfo">Account</a><br/></p>");
		        		}else if(window.location.href.indexOf("china")!=-1){
		        			document.write("<h3>我的页面</h3><p><a href="/mypage">我的地点</a><br/><a href="/mycomment">我的评论</a><br/><a href="/myinfo">帐户</a><br/></p>");
		        		}else{
		        			document.write("<h3>마이페이지</h3><p><a href="/mypage">찜 목록</a><br/><a href="/mycomment">내 댓글</a><br/><a href="/myinfo">정보수정</a><br/></p>");
		        		}
		        		</script>
                    </div><!-- col -->
                
                    <div class="col-md-10 fade-up">
		        		<h3>
                        	<script type="text/javascript">
			        		if(window.location.href.indexOf("eng")!=-1){
			        			document.write("Account");
			        		}else if(window.location.href.indexOf("china")!=-1){
			        			document.write("帐户");
			        		}else{
			        			document.write("정보수정");
			        		}
			        		</script>
						</h3>
		                <form role="joinform" id="joinform">
		                	<br>
		                	<h4>
			                	<script type="text/javascript">
				        		if(window.location.href.indexOf("eng")!=-1){
				        			document.write("Account information is not editable for logins with Naver/Kakao.");
				        		}else if(window.location.href.indexOf("china")!=-1){
				        			document.write("使用Naver / Kakao登录时，帐户信息不可编辑。");
				        		}else{
				        			document.write("네이버/카카오 로그인 하신 경우 개인정보를 저장하지 않습니다.");
				        		}
				        		</script>
			        		</h4>
		                	<br>
		                	<!-- 정보수정 페이지로 돌아가는 버튼 -->
		                    <div class="form-group text-center">
		                        <a type="submit" id="join-submit" class="btn btn-primary" role="button" href="/mypage">
		                        	<script type="text/javascript">
					        		if(window.location.href.indexOf("eng")!=-1){
					        			document.write("Return");
					        		}else if(window.location.href.indexOf("china")!=-1){
					        			document.write("返回");
					        		}else{
					        			document.write("돌아가기");
					        		}
					        		</script>
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