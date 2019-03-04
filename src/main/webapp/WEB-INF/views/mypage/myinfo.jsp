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
    <script type="text/javascript">
	function checkPwd(){
		var passReg=/[a-z0-9]{10,15}$/g;
	
	 	
	var password=$("#passwd").val();
	var repassword=$("#repasswd").val();
	var check_pw=password.search(/[0-9]/g);
	var check_pw2=password.search(/[a-z]/ig);
	
	
	if(password.length<6){
		$("#passwd").css("background-color","#FFCECE");
	}
	if(repassword.length<6){
		$("#passwd").css("background-color","#FFCECE");
	}
	if(password ==""){
		$("#passwd").css("background-color","#FFCECE");
	}
	else if(repassword==""){
		$("#repasswd").css("background-color","#FFCECE");
	}
	else if(password!=repassword){
		$("#passwd").css("background-color","#FFCECE");
		$("#repasswd").css("background-color","#FFCECE");
	}
	else if(password.length>=6 && repassword.length >=6 && password==repassword && passReg.test(password) &&check_pw >=0 && check_pw2>=0)
	{
		$("#passwd").css("background-color","#B0F6AC");
		$("#repasswd").css("background-color","#B0F6AC");
	}
	
	}
	
	$(function(){
		
	$("#joinform").submit(function(event){
		var that=$(this);
		var pw1=$("#passwd").val();
		var pw2=$("#repasswd").val();
		
		if(pw1!=pw2){
			alert("비밀번호가 서로 다릅니다.");
			event.preventDefault();
		}else{
			that.submit();
		}
		
	});  
	
	
	
	});
	
	
	$(function(){
		var windowWidth = $( window ).width();
		var joinWidth=$("#joinform").width();
		 $("#join_responsive").css("width","909.98px");
		 $("#join_responsive").css("margin","auto");
		 $("#join_responsive").css("margin-top","0px");
	
		 if(windowWidth<=1182){
			 $("#join_responsive").width(windowWidth*.8333);
		 }
		$(window).resize(function(){
			 windowWidth = $( window ).width();
			 joinWidth=$("#joinform").width();
			
			 if(windowWidth<=1182){
				 $("#join_responsive").width(windowWidth*.8333);
			 }else{
				 $("#join_responsive").css("width","909.98px");
			 }
			console.log("폼크기"+joinWidth);
			console.log("윈도우 크기"+windowWidth);
		});
	});
	
	</script>
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
<!-- 내 정보 수정 페이지 (가입 페이지에서 아이디 체크, 이메일 체크 스크립트 들어낸 코드) -->
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
                    <div id="menu_responsive" class="col-md-2 fade-up">
                        <h3>마이페이지</h3>
                        <p><a href="/mypage">찜 목록</a><br/>
                            <a href="/mycomment">내 댓글</a><br/>
                            <a href="/myinfo">정보수정</a><br/>
                        </p>
                    </div><!-- col -->
                
                    <div id="join_responsive" class="col-md-10 fade-up">
		        		<h3>정보수정</h3>
		                <form role="joinform" id="joinform" action="/myinfo" method="post">
		                	<c:forEach items="${memberList}" var="MemberVO" varStatus="status">
		                    <div class="form-group">
		                        <label for="inputName">성명</label>
		                        <input type="text" class="form-control" id="name" name="user_name" value="${MemberVO.user_name}" required placeholder="이름을 입력해 주세요">
		                    </div>
		                     <div class="form-group">
		                        <label for="InputId">아이디</label><br>
			                    <b>${MemberVO.user_id}</b>
			                    <input type="hidden" name="user_id" value="${MemberVO.user_id}"><br>
			                    <span><small><b>* 아이디는 변경이 불가합니다.</b></small></span>
		
		                    </div>
		                    <div class="form-group">
		                        <label for="inputPassword">비밀번호</label>
		                        <input type="password" class="form-control" id="passwd" name="user_pw" oninput="checkPwd()" value="${MemberVO.user_pw}" required placeholder="비밀번호는 문자와 숫자를 조합하여 10~15자리로 만들어 주세요.">
		                    </div>
		                    <div class="form-group">
		                        <label for="inputPasswordCheck">비밀번호 확인</label>
		                        <input type="password" class="form-control" id="repasswd" name="repasswd" oninput="checkPwd()" value="${MemberVO.user_pw}" required placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
		                    </div>
		                    
		                    <div class="form-group">
		                        <label for="InputEmail">이메일 주소</label><br>
		                        <b>${MemberVO.email}</b>
			                    <input type="hidden" name="email" value="${MemberVO.email}"><br>
			                    <span><small><b>* 이메일은 변경이 불가합니다.</b></small></span>
		                 
		                    </div>
		                    <div class="form-group">
		                        <label for="inputMobile">휴대폰 번호</label>
		                        <input type="tel" class="form-control" id="phone"  name="phone" value="${MemberVO.phone}" required placeholder="-없이 휴대폰번호를 입력해 주세요">
		                    </div>
		                   <!-- 정보수정이 성공하면 성공 페이지로 이동 -->
		                    <div class="form-group text-center">
		                        <button type="submit" id="join-submit" class="btn btn-primary">
		                            정보수정<i class="fa fa-check spaceLeft"></i>
		                        </button>
		                        <button type="reset" class="btn btn-warning">
		                            수정취소<i class="fa fa-times spaceLeft"></i>
		                        </button>
		                    </div>
		                    </c:forEach>
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