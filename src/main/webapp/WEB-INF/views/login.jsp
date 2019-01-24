<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
           	   <a href="#"><img style="margin-top:20px;" src="../resources/imgs/네이버 로그인.png"></a>
			   <a href="#"><img src="../resources/imgs/카카오 로그인.png"></a>
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