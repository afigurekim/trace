<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);
.jh{font-family: 'Jeju Hallasan', cursive;}
</style>
<link rel="stylesheet" type="text/css" href="../../resources/css/join.css">

</head>
<body>
<%@include file="Header.jsp" %>

<div id="wrap">
	<div id="join_content">
	<div id="loginWrap">
    <div class="page-body">
       	   <div class="mlog-sign">
       	                 			<h1 class="jh">회원 로그인</h1>
       	   
	    	   <form name="loginform" id="loginform" action="loginpro.php" method="post"><input type="hidden" name="url" value="/member/join.php">
                <div class="mlog">
                        <ul class="frm-list">
                            <li class="id"><label><span class="name">아이디</span><span><input type="text" id="member_id" name="id" maxlength="20" onkeypress="javascript:if(event.keyCode == 13) { loginch() }" class="MS_login_id" value=""></span></label></li>
                            <li class="id"><label><span class="name">비밀번호</span><span><input type="password" id="member_passwd" name="passwd" maxlength="20" onkeypress="javascript:if(event.keyCode == 13) { loginch() }" value="" class="MS_login_pw" style="margin-left:10px;"></span></label></li>
                        </ul>
                        <p class="buttonlogin"><span><a href="javascript:loginch();" class="btnlogin">LOGIN</a></span></p>
                </div>
           	</form>
           	 <div class="sign">
           	   <p class="msg">- 아이디 또는 비밀번호를 잊어버렸나요!</p>
           	   <a href="#"><img src="../resources/imgs/아이디찾기.png"></a>
           	    <a href="#"><img src="../resources/imgs/비밀번호 찾기.png"></a>
           	    <div id="naver_id_login" style="margin-top:20px;">
           	   </div>
           	   <script type="text/javascript">
            	var naver_id_login = new naver_id_login("nFs3k4lMgKQ6pNrJTLZ1", "http://localhost:8181/callback");
            	
              	var state = naver_id_login.getUniqState();
              	naver_id_login.setButton("white",3.60);
              	naver_id_login.setDomain("http://localhost:8181/login");
              	naver_id_login.setState(state);
              	naver_id_login.setPopup();
              	naver_id_login.init_naver_id_login();
                // 네이버 사용자 프로필 조회
                naver_id_login.get_naver_userprofile("naverSignInCallback()");
                // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
                function naverSignInCallback() {
                  alert(naver_id_login.getProfileData('email'));
                  alert(naver_id_login.getProfileData('nickname'));
                  alert(naver_id_login.getProfileData('age'));
                }
              	
            
  </script>
			   <a href="#"><img src="../resources/imgs/카카오 로그인.png" style="width:185px; height:40px;"></a>
			   <hr style="margin-top:20px; margin-bottom:20px;">
                    <p class="msg">- 회원가입을 하시면 더 많은 혜택을 받으실 수 있습니다.</p>
                    <p class="buttonlogin1"><span><a href="/member/join.php" class="btnlogin1">JOIN US</a></span></p>
                    <p class="msg"></p>
                    <p class="msg"></p>
                    <p class="msg"></p>
                  

                </div>
           </div>
            <!-- .mlog-sign -->
       
       </div>
       
	
	
</div>

	</div>
</div>

<%@include file="MainFooter.jsp"%>
</body>
</html>