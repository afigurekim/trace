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
	    $(document).ready(function($) {
	    	$(".clickable-row").css("cursor", "pointer");
	        $(".clickable-row").click(function() {
	        	if(!$(event.target).hasClass("tblcol-7")) {
	        		window.location = $(this).data("href");
	        	}
	        });
	        if("${login_id}"=="" && "${login_id2}"==""){
	        	alert("로그인 후 이용해주세요");
	        	window.location.href="/login";
	        }
	    });
    </script>
    <style>
		.thumb {
			padding: 5px;
			width: 110px;
		}
		.tblcol-1 {
			width: 15%;
		}
		.tblcol-3 {
			width: 30%;
		}
		.tblcol-4, .tblcol-5 {
			width: 10%;
		}
		.tblcol-6, .tblcol-7 {
			width: 5%;
		}
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
<!-- 마이 페이지 첫 화면 + 찜 목록 조회 페이지 -->
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
                <div class="row">
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
			        			document.write("My Places");
			        		}else if(window.location.href.indexOf("china")!=-1){
			        			document.write("我的地点");
			        		}else{
			        			document.write("찜 목록");
			        		}
			        		</script>
						</h3>
                        <br>
                        <div>
                        <table class="table">
                        	<thead>
                        		<tr>
                        			<th class="col-md-1 hidden-xs"></th>
                        			<th class="col-md-3" style="white-space: nowrap;">
										<script type="text/javascript">
						        		if(window.location.href.indexOf("eng")!=-1){
						        			document.write("Place");
						        		}else if(window.location.href.indexOf("china")!=-1){
						        			document.write("地点");
						        		}else{
						        			document.write("장소");
						        		}
						        		</script>
									</th>
                        			<th class="col-md-4 hidden-sm hidden-xs" style="white-space: nowrap;">
										<script type="text/javascript">
						        		if(window.location.href.indexOf("eng")!=-1){
						        			document.write("Address");
						        		}else if(window.location.href.indexOf("china")!=-1){
						        			document.write("地址");
						        		}else{
						        			document.write("주소");
						        		}
						        		</script>
									</th>
                        			<th class="col-md-1 hidden-md hidden-sm hidden-xs" style="white-space: nowrap;">
										<script type="text/javascript">
						        		if(window.location.href.indexOf("eng")!=-1){
						        			document.write("Period");
						        		}else if(window.location.href.indexOf("china")!=-1){
						        			document.write("期");
						        		}else{
						        			document.write("시대");
						        		}
						        		</script>
									</th>
                        			<th class="col-md-1 hidden-md hidden-sm hidden-xs" style="white-space: nowrap;">
										<script type="text/javascript">
						        		if(window.location.href.indexOf("eng")!=-1){
						        			document.write("Activity");
						        		}else if(window.location.href.indexOf("china")!=-1){
						        			document.write("活动");
						        		}else{
						        			document.write("테마");
						        		}
						        		</script>
									</th>
                        			<th class="col-md-1"></th>
                        			<th class="col-md-1"></th>
                        		</tr>
                        	</thead>
                        	<tbody>
                        		
                        		<c:forEach items="${mysiteList}" var="MemberSiteVO" varStatus="status">
                        		<tr class="clickable-row" data-href="/period/read?bno=${MemberSiteVO.bno}">
                        			<td class="col-md-1 hidden-xs" style="vertical-align: middle;"><img class="thumb" src="${MemberSiteVO.first_image}"></td>
                        			<td class="col-md-3" style="vertical-align: middle; white-space: nowrap;">${MemberSiteVO.site_name}</td>
                        			<td class="col-md-4 hidden-sm hidden-xs" style="vertical-align: middle; white-space: nowrap;">${MemberSiteVO.address}</td>
                        			<td class="col-md-1 hidden-md hidden-sm hidden-xs" style="vertical-align: middle; white-space: nowrap;">${MemberSiteVO.period}</td>
                        			<td class="col-md-1 hidden-md hidden-sm hidden-xs" style="vertical-align: middle; white-space: nowrap;">${MemberSiteVO.thema}</td>
                        			<td class="col-md-1" style="vertical-align: middle">
                        				<a class="btn btn-primary" role="button" href="/period/read?bno=${MemberSiteVO.bno}">
                        					<script type="text/javascript">
							        		if(window.location.href.indexOf("eng")!=-1){
							        			document.write("View");
							        		}else if(window.location.href.indexOf("china")!=-1){
							        			document.write("移动");
							        		}else{
							        			document.write("이동");
							        		}
							        		</script>
                        				</a>
                        			</td>
                        			<!-- 찜 목록 아이템 삭제 버튼 -->
                        			<td class="col-md-1" style="vertical-align: middle">
                        				<script type="text/javascript">
	                        			    $(function(){
	                        			    	$("#delbtn").click(function(e){
	                        			    		e.preventDefault();
	                        			    		
	                        			    		var jno=${MemberSiteVO.jno};
	                        			    		$.ajax({
	                        			    		  url:"/jimdel",
	                        			    		  type:'post',
	                        			    		  data:{
	                        			    		  	jno:jno,
	                        			    		  },
	                        			    		  success:function(){
	      								        		if(window.location.href.indexOf("eng")!=-1){
	    								        			document.write("The place has been removed from your list");
	    								        		}else if(window.location.href.indexOf("china")!=-1){
	    								        			document.write("该地点已从您的列表中删除");
	    								        		}else{
	    								        			document.write("장소가 찜목록에서 삭제되었습니다");
	    								        		}
	                        			    		  }	
	                        			    		});
	                        			    	});
	                        			    });
                        				</script>
                        				<form>
                        					<button id="delbtn" type="submit" class="btn btn-warning">
                        						<script type="text/javascript">
								        		if(window.location.href.indexOf("eng")!=-1){
								        			document.write("Remove");
								        		}else if(window.location.href.indexOf("china")!=-1){
								        			document.write("删除");
								        		}else{
								        			document.write("삭제");
								        		}
								        		</script>
                        					</button>
                        				</form>
                        			</td>
                        		</tr>
                        		</c:forEach>
                        	</tbody>
                        </table>
                        </div>
                    </div><!-- col -->
                </div><!-- row -->  
                <div class="gap"></div> 
            </div>
        </section><!-- section -->
    </div>

<%@include file="../Footer.jsp" %>


</body>
</html>