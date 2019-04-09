<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<!-- <script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->
<script type="text/javascript" src="../../../resources/js/jquery.js"></script>
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
<script>

</script>
</head>
<body>
<script>
var filter = "win16|win32|win64|mac";
var mobile=false;

if(navigator.platform){

if(0 > filter.indexOf(navigator.platform.toLowerCase())){

	mobile=true;

}else{
mobile=false;

}

}





var state=window.location.href.substring(window.location.href.indexOf("main")+5);
var lang="";
if(window.location.href.indexOf("eng")!=-1){
	lang="eng";
}else if(window.location.href.indexOf("china")!=-1){
	lang="china";
}
if(mobile==false)
{
	if(state=="seoul"){
	document.write("<div class='videoContainer'><video src='../../../resources/video/seoul.mp4' width='100%' height='100%' autoplay muted></video></div>");
	
	}else if(state=="incheon")
	{
	document.write("<div class='videoContainer'><video src='../../../resources/video/incheon.mp4' width='100%' height='100%' autoplay muted></video></div>");
	}else if(state=="kyunggido"){
		document.write("<div class='videoContainer'><video src='../../../resources/video/gyeonggi.mp4' width='100%' height='100%' autoplay muted></video></div>");
		state="kyunggi";
	}else if(state=="kangwondo"){
		document.write("<div class='videoContainer'><video src='../../../resources/video/gangwon.mp4' width='100%' height='100%' autoplay muted></video></div>");
		state="kangwon";
	}else if(state=="chungchungnamdo"){
		document.write("<div class='videoContainer'><video src='../../../resources/video/chungcheongnam.mp4' width='100%' height='100%' autoplay muted></video></div>");
		state="chungchung";
	}else if(state=="chungchungbookdo"){
		document.write("<div class='videoContainer'><video src='../../../resources/video/chungcheongbuk.mp4' width='100%' height='100%' autoplay muted></video></div>");
		state="chungchung";
	}else if(state=="daejun"){
		document.write("<div class='videoContainer'><video src='../../../resources/video/daejeon.mp4' width='100%' height='100%' autoplay muted></video></div>");
		state="chungchung";
	}else if(state=="kyungsangbookdo"){
		document.write("<div class='videoContainer'><video src='../../../resources/video/gyeongsangbuk.mp4' width='100%' height='100%' autoplay muted></video></div>");
		state="kyungsang";
	}else if(state=="kyungsangnamdo"){
		document.write("<div class='videoContainer'><video src='../../../resources/video/gyeongsangnam.mp4' width='100%' height='100%' autoplay muted></video></div>");
		state="kyungsang";
	}else if(state=="junlanamdo"){
		document.write("<div class='videoContainer'><video src='../../../resources/video/jeollanam.mp4' width='100%' height='100%' autoplay muted></video></div>");
		state="junla";
	}else if(state=="junlabookdo"){
		document.write("<div class='videoContainer'><video src='../../../resources/video/jeollabuk.mp4' width='100%' height='100%' autoplay muted></video></div>");
		state="junla";
	}else if(state=="daegoo"){
		document.write("<div class='videoContainer'><video src='../../../resources/video/daegu.mp4' width='100%' height='100%' autoplay muted></video></div>");
		state="kyungsang";
	}else if(state=="ulsan"){
		document.write("<div class='videoContainer'><video src='../../../resources/video/ulsan.mp4' width='100%' height='100%' autoplay muted></video></div>");
		state="kyungsang";
	}else if(state=="busan"){
		document.write("<div class='videoContainer'><video src='../../../resources/video/busan.mp4' width='100%' height='100%' autoplay muted></video></div>");
		state="kyungsang";
	}else if(state=="kwangju"){
		document.write("<div class='videoContainer'><video src='../../../resources/video/gwangju.mp4' width='100%' height='100%' autoplay muted></video></div>");
		state="junla";
	}else if(state=="jeju"){
		document.write("<div class='videoContainer'><video src='../../../resources/video/jeju.mp4' width='100%' height='100%' autoplay muted></video></div>");
	}

	$(function(){
		$("body").hide();
		$("body").fadeIn(3000);
		setTimeout(function(){$("body").fadeOut(6000);},6000);
		if(lang!=""){
			setTimeout(function(){location.href="/"+lang+"/region/"+state},9000);
		}else{
			setTimeout(function(){location.href="/region/"+state},9000);
	
		}
	});
}else{
	$(function(){
		$("body").hide();
		$("body").fadeIn(1000);
		setTimeout(function(){$("body").fadeOut(1000);},1000);
		if(lang!=""){
			setTimeout(function(){location.href="/"+lang+"/region/"+state},1000);
		}else{
			setTimeout(function(){location.href="/region/"+state},1000);
	
		}
	});
}
</script>

</body>
</html>