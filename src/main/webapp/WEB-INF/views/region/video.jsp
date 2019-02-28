<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
body{
margin:0;
padding:0;
}
.videoContainer 
{
    position:absolute;
    height:100%;
    width:100%;
    overflow: hidden;
    background-color:black;
}

.videoContainer video 
{
    min-width: 100%;
    min-height: 100%;
}
</style>
</head>
<body>
<script>
var state=window.location.href.substring(window.location.href.indexOf("main")+5);
var lang=window.location.href.substring(window.location.href.indexOf("/")+17,window.location.href.indexOf("/region"));
if(state=="seoul"){
document.write("<div class='videoContainer'><video src='../../../resources/video/seoul.mp4' width='100%' height='100%' autoplay ></video></div>");

}else if(state=="incheon")
{
document.write("<div class='videoContainer'><video src='../../../resources/video/incheon.mp4' width='100%' height='100%' autoplay></video></div>");
}else if(state=="kyunggido"){
	document.write("<div class='videoContainer'><video src='../../../resources/video/gyeonggi.mp4' width='100%' height='100%' autoplay></video></div>");
	state="kyunggi";
}else if(state=="kangwondo"){
	document.write("<div class='videoContainer'><video src='../../../resources/video/gangwon.mp4' width='100%' height='100%' autoplay></video></div>");
	state="kangwon";
}else if(state=="chungchungnamdo"){
	document.write("<div class='videoContainer'><video src='../../../resources/video/chungcheongnam.mp4' width='100%' height='100%' autoplay></video></div>");
	state="chungchung";
}else if(state=="chungchungbookdo"){
	document.write("<div class='videoContainer'><video src='../../../resources/video/chungcheongbuk.mp4' width='100%' height='100%' autoplay></video></div>");
	state="chungchung";
}else if(state=="daejun"){
	document.write("<div class='videoContainer'><video src='../../../resources/video/daejeon.mp4' width='100%' height='100%' autoplay></video></div>");
	state="chungchung";
}else if(state=="kyungsangbookdo"){
	document.write("<div class='videoContainer'><video src='../../../resources/video/gyeongsangbuk.mp4' width='100%' height='100%' autoplay></video></div>");
	state="kyungsang";
}else if(state=="kyungsangnamdo"){
	document.write("<div class='videoContainer'><video src='../../../resources/video/gyeongsangnam.mp4' width='100%' height='100%' autoplay></video></div>");
	state="kyungsang";
}else if(state=="junlanamdo"){
	document.write("<div class='videoContainer'><video src='../../../resources/video/jeollanam.mp4' width='100%' height='100%' autoplay></video></div>");
	state="junla";
}else if(state=="junlabookdo"){
	document.write("<div class='videoContainer'><video src='../../../resources/video/jeollabuk.mp4' width='100%' height='100%' autoplay></video></div>");
	state="junla";
}else if(state=="daegoo"){
	document.write("<div class='videoContainer'><video src='../../../resources/video/daegu.mp4' width='100%' height='100%' autoplay></video></div>");
	state="kyungsang";
}else if(state=="ulsan"){
	document.write("<div class='videoContainer'><video src='../../../resources/video/ulsan.mp4' width='100%' height='100%' autoplay></video></div>");
	state="kyungsang";
}else if(state=="busan"){
	document.write("<div class='videoContainer'><video src='../../../resources/video/busan.mp4' width='100%' height='100%' autoplay></video></div>");
	state="kyungsang";
}else if(state=="kwangju"){
	document.write("<div class='videoContainer'><video src='../../../resources/video/gwangju.mp4' width='100%' height='100%' autoplay></video></div>");
	state="junla";
}else if(state=="jeju"){
	document.write("<div class='videoContainer'><video src='../../../resources/video/jeju.mp4' width='100%' height='100%' autoplay></video></div>");
}

$(function(){
	$("body").hide();
	$("body").fadeIn(3000);
	setTimeout(function(){$("body").fadeOut(6000);},6000);
	if(lang!="/"){
		setTimeout(function(){location.href="/"+lang+"/region/"+state},9000);
	}else{
		setTimeout(function(){location.href="/region/"+state},9000);

	}
});
</script>

</body>
</html>