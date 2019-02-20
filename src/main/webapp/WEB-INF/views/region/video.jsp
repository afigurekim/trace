<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
body{
margin:0;
padding:0;}
</style>
</head>
<body>
<script>
var state=window.location.href.substring(window.location.href.indexOf("main")+5);
if(state=="seoul"){
document.write("<video src='../../resources/video/seoul.mp4' width='100%' height='100%' autoplay></video>");

}else if(state=="incheon")
{
document.write("<video src='../../resources/video/incheon.mp4' width='100%' height='100%' autoplay></video>");
}else if(state=="kyunggido"){
	document.write("<video src='../../resources/video/gyeonggi.mp4' width='100%' height='100%' autoplay></video>");
	state="kyunggi";
}else if(state=="kangwondo"){
	document.write("<video src='../../resources/video/gangwon.mp4' width='100%' height='100%' autoplay></video>");
	state="kangwon";
}else if(state=="chungchungnamdo"){
	document.write("<video src='../../resources/video/chungcheongnam.mp4' width='100%' height='100%' autoplay></video>");
	state="chungchung";
}else if(state=="chungchungbookdo"){
	document.write("<video src='../../resources/video/chungcheongbuk.mp4' width='100%' height='100%' autoplay></video>");
	state="chungchung";
}else if(state=="daejun"){
	document.write("<video src='../../resources/video/daejeon.mp4' width='100%' height='100%' autoplay></video>");
	state="chungchung";
}else if(state=="kyungsangbookdo"){
	document.write("<video src='../../resources/video/gyeongsangbuk.mp4' width='100%' height='100%' autoplay></video>");
	state="kyungsang";
}else if(state=="kyungsangnamdo"){
	document.write("<video src='../../resources/video/gyeongsangnam.mp4' width='100%' height='100%' autoplay></video>");
	state="kyungsang";
}else if(state=="junlanamdo"){
	document.write("<video src='../../resources/video/jeollanam.mp4' width='100%' height='100%' autoplay></video>");
	state="junla";
}else if(state=="junlabookdo"){
	document.write("<video src='../../resources/video/jeollabuk.mp4' width='100%' height='100%' autoplay></video>");
	state="junla";
}else if(state=="daegoo"){
	document.write("<video src='../../resources/video/daegu.mp4' width='100%' height='100%' autoplay></video>");
	state="kyungsang";
}else if(state=="ulsan"){
	document.write("<video src='../../resources/video/ulsan.mp4' width='100%' height='100%' autoplay></video>");
	state="kyungsang";
}else if(state=="busan"){
	document.write("<video src='../../resources/video/busan.mp4' width='100%' height='100%' autoplay></video>");
	state="kyungsang";
}else if(state=="kwangju"){
	document.write("<video src='../../resources/video/gwangju.mp4' width='100%' height='100%' autoplay></video>");
	state="junla";
}else if(state=="jeju"){
	document.write("<video src='../../resources/video/jeju.mp4' width='100%' height='100%' autoplay></video>");
}

$(function(){
	$("body").hide();
	$("body").fadeIn(3000);
	
	setTimeout(function(){$("body").fadeOut(6000);},6000);
	setTimeout(function(){location.href="/region/"+state},9000);
})
</script>
</body>
</html>