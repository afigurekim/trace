<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script src="../resources/js/jquery.js"></script>
<style type="text/css">
html, div, body, h3 {
	margin: 0;
	padding: 0;
}

h3 {
	display: inline-block;
	padding: 0.6em;
}
</style>



<script type="text/javascript">
		
</script>
<script>
</script>




</head>


<body>
	<div
		style="background-color: #15a181; width: 100%; height: 50px; text-align: center; color: white;">
		<script>
			if(window.location.href.indexOf("eng")!=-1){
				document.write("<h3>Success as a member of the Footprint Tour</h3>");
				document.write("Please sign in after your email");
			}else if(window.location.href.indexOf("china")!=-1){
				document.write("<h3>足迹之旅会员成功</h3>");
				document.write("请确认邮件后登录");
			}else{
				document.write("<h3>발자취 투어 회원가입 성공</h3>");
				document.write("이메일 인증 후 로그인 해주세요");
			}
		</script>

	</div>
	<br>
	<h2 style="text-align: center" id="name"></h2>
	<h4 style="text-align: center" id="email"></h4>

<script>
$(function(){
	$("body").hide();
	$("body").fadeIn(1000);
	
	setTimeout(function(){$("body").fadeOut(2000);},2000);
	setTimeout(function(){location.href="/"},2000);
})
</script>

</body>
</html>