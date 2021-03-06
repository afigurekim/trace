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
	    $(document).ready(function() {
	    	$(".clickable-row").css("cursor", "pointer");
	        $(".clickable-row").click(function(event) {
	        	if(!$(event.target).hasClass("delcol")) {
	        		window.location = $(this).data("href");
	        	}
	        });
	        if("${login_id}"=="" && "${login_id2}"==""){
	        	alert("로그인 후 이용해주세요");
	        	window.location.href="/login";
	        }
	        
	        $("#myinfo").click(function(){
	        	if(window.location.href.indexOf("eng")!=-1){
	        		window.location.href="/eng/myinfo";
	        	}else if(window.location.href.indexOf("china")!=-1){
	        		window.location.href="/china/myinfo";
	        	}else{
	        		window.location.href="/myinfo";
	        	}
	        });
	        
	        $("#mypage_jim").click(function(){
	        
				if(window.location.href.indexOf("eng")!=-1){
	        		window.location.href="/eng/mypage";
	        	}else if(window.location.href.indexOf("china")!=-1){
	        		window.location.href="/china/mypage";
	        	}else{
	        		window.location.href="/mypage";
	        	}
	        });
	        
	        $("#mycomment").click(function(){
				if(window.location.href.indexOf("eng")!=-1){
	        		window.location.href="/eng/mycomment";
	        	}else if(window.location.href.indexOf("china")!=-1){
	        		window.location.href="/china/mycomment";
	        	}else{
	        		window.location.href="/mycomment";
	        	}
	        });
	    });
    </script>
    <style>
		.thumb {
			padding: 5px;
			width: 110px;
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
					        			document.write("<h2 class=\"main-title\">My Page</h2><hr><p>My Places · My Comments · Account</p>");
					        		}else if(window.location.href.indexOf("china")!=-1){
					        			document.write("<h2 class=\"main-title\">我的页面</h2><hr><p>我的地点 · 我的评论 · 帐户</p>");
					        		}else{
					        			document.write("<h2 class=\"main-title\">마이페이지</h2><hr><p>찜 목록 · 내 댓글 · 정보수정</p>");
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
        <section id="portfolio" class="white" style="margin-bottom:50px;">
            <div class="container">
                <div class="gap"></div>
                <div class="row">
                       
                    	
                        <!-- <script type="text/javascript">
		        		if(window.location.href.indexOf("eng")!=-1){
		        			document.write("<h3 style='text-align:center;'>My Page</h3><p style='text-align:center;'><a href=\"/eng/mypage\">My Places</a><br/><a href=\"/eng/mycomment\">My Comments</a><br/><a href=\"/eng/myinfo\">Account</a><br/></p>");
		        		}else if(window.location.href.indexOf("china")!=-1){
		        			document.write("<h3 style='text-align:center;'>我的页面</h3><p style='text-align:center;'><a href=\"/china/mypage\">我的地点</a><br/><a href=\"/china/mycomment\">我的评论</a><br/><a href=\"/china/myinfo\">帐户</a><br/></p>");
		        		}else{
		        			document.write("<h3 style='text-align:center;'>마이페이지</h3><p style='text-align:center;'><a href=\"/mypage\">찜 목록</a><br/><a href=\"/mycomment\">내 댓글</a><br/><a href=\"/myinfo\">정보수정</a><br/></p>");
		        		}
		        		</script> -->
                   <!-- col -->
                
                    <div class="col-md-10 fade-up" style="width:100%; margin:auto;">
                     <ul class="portfolio-filter fade-down center">
                        
                        <li><a class="btn btn-outlined btn-primary active" id="mypage_jim" href="#" data-filter="*">
                        <script>
	                        if(window.location.href.indexOf("eng")!=-1){
			        			document.write("My Places");
			        		}else if(window.location.href.indexOf("china")!=-1){
			        			document.write("我的地点");
			        		}else{
			        			document.write("찜 목록");
			        		}
                        </script>
                        </a></li>
                        <li><a class="btn btn-outlined btn-primary" id='mycomment' href="#" data-filter="*">
                        <script>
	                        if(window.location.href.indexOf("eng")!=-1){
			        			document.write("My Comments");
			        		}else if(window.location.href.indexOf("china")!=-1){
			        			document.write("我的评论");
			        		}else{
			        			document.write("내 댓글");
			        		}
                        </script>
                        </a></li>
                           <li><a class="btn btn-outlined btn-primary" id='myinfo' href="#" data-filter="*">
                        <script>
	                        if(window.location.href.indexOf("eng")!=-1){
			        			document.write("Account");
			        		}else if(window.location.href.indexOf("china")!=-1){
			        			document.write("帐户");
			        		}else{
			        			document.write("정보 수정");
			        		}
                        </script>
                        </a></li>
                        
                    	</ul>
                    
                        <br>
                        <div>
                        <table class="table">
                        	<thead>
                        		<tr>
                        			<th class="col-md-1 hidden-xs"></th>
                        			<th class="col-md-2" style="overflow: hidden; white-space: nowrap;">
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
                        			<th class="col-md-4 hidden-sm hidden-xs" style="overflow: hidden; white-space: nowrap;">
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
                        			<th class="col-md-1 hidden-md hidden-sm hidden-xs" style="overflow: hidden; white-space: nowrap;">
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
                        			<th class="col-md-2 hidden-md hidden-sm hidden-xs" style="overflow: hidden; white-space: nowrap;">
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
               					<script type="text/javascript">
					        		if(window.location.href.indexOf("eng")!=-1){
					        			document.write("<tr class=\"clickable-row\" data-href=\"/eng/period/read?bno=${MemberSiteVO.bno}\">");
					        		}else if(window.location.href.indexOf("china")!=-1){
					        			document.write("<tr class=\"clickable-row\" data-href=\"/china/period/read?bno=${MemberSiteVO.bno}\">");
					        		}else{
					        			document.write("<tr class=\"clickable-row\" data-href=\"/period/read?bno=${MemberSiteVO.bno}\">");
					        		}
				        		</script>
									<td class="col-md-1 hidden-xs" style="vertical-align: middle;"><img class="thumb" style="width:110px; height:85.56px;" src="${MemberSiteVO.first_image}"></td>
                        			<td class="col-md-2" style="vertical-align: middle; overflow: hidden; white-space: pre-wrap;">${MemberSiteVO.site_name}</td>
                        			<td class="col-md-4 hidden-sm hidden-xs" style="vertical-align: middle; overflow: hidden; white-space: pre-wrap;">${MemberSiteVO.address}</td>
                        			<td class="col-md-1 hidden-md hidden-sm hidden-xs" style="vertical-align: middle; overflow: hidden; white-space: pre-wrap;">${MemberSiteVO.period}</td>
                        			<td class="col-md-2 hidden-md hidden-sm hidden-xs" style="vertical-align: middle; overflow: hidden; white-space: pre-wrap;">${MemberSiteVO.thema}</td>
                        			<td class="col-md-1" style="vertical-align: middle">
                       					<script type="text/javascript">
						        		if(window.location.href.indexOf("eng")!=-1){
						        			document.write("<a class=\"btn btn-primary\" role=\"button\" href=\"/eng/period/read?bno=${MemberSiteVO.bno}\">View</a>");
						        		}else if(window.location.href.indexOf("china")!=-1){
						        			document.write("<a class=\"btn btn-primary\" role=\"button\" href=\"/china/period/read?bno=${MemberSiteVO.bno}\">移动</a>");
						        		}else{
						        			document.write("<a class=\"btn btn-primary\" role=\"button\" href=\"/period/read?bno=${MemberSiteVO.bno}\">이동</a>");
						        		}
						        		</script>
                        			</td>
                        			<!-- 찜 목록 아이템 삭제 버튼 -->
                        			<td class="col-md-1" style="vertical-align: middle">
                        				<div class="delcol">
                        				<form>
                        					<button id="delbtn${MemberSiteVO.jno}" type="button" class="btn btn-warning">
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
					                       	<script type="text/javascript">
					                       		$("#delbtn${MemberSiteVO.jno}").click(function(e){
										    		e.preventDefault();
										    		
										    		var jno=${MemberSiteVO.jno};
										    		$.ajax({
										    		  url:"/jimdel",
										    		  type:'post',
										    		  data:{
										    		  	jno:jno,
										    		  },
										    		  success:function(data){
											        		if(window.location.href.indexOf("eng")!=-1){
										        				alert("The place has been removed from your list");
										        	        	window.location.href="/eng/mypage";
										        			}else if(window.location.href.indexOf("china")!=-1){
										        				alert("该地点已从您的列表中删除");
										        	        	window.location.href="/china/mypage";
										        			}else{
										        				alert("장소가 찜목록에서 삭제되었습니다");
										        	        	window.location.href="/mypage";
										        			}
										    		  }	
										    		});
										    	});
											</script>
                        				</form>
                        				</div>
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
            <div class="text-center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
							<script type="text/javascript">
							 if(window.location.href.indexOf("eng")!=-1){
		                            document.write("<li><a href=/eng/mypage?page=${pageMaker.startPage-1}&laquo;</a></li>");
		                          }else if(window.location.href.indexOf("china")!=-1){
			                            document.write("<li><a href=/china/mypage?page=${pageMaker.startPage-1}&laquo;</a></li>");

		                          }else{
			                            document.write("<li><a href=/mypage?page=${pageMaker.startPage-1}&laquo;</a></li>");
		                        	  
		                          }
							</script>
							</c:if>
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li 
									<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
								<script type="text/javascript">
								if(window.location.href.indexOf("eng")!=-1){
		                            document.write("<a href='/eng/mypage?page=${idx}'>${idx}</a>");
		                          }else if(window.location.href.indexOf("china")!=-1){
			                       document.write("<a href='/china/mypage?page=${idx}'>${idx}</a>");

		                          }else{
				                       document.write("<a href='/mypage?page=${idx}'>${idx}</a>");
		                        	  
		                          }
								</script>
								
								</li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage>0 }">
							<script type="text/javascript">
								if(window.location.href.indexOf("eng")!=-1){
		                            document.write("<li><a href='/eng/mypage?page=${pageMaker.endPage +1}'>&raquo;</a></li>");
		                          }else if(window.location.href.indexOf("china")!=-1){
			                            document.write("<li><a href='/china/mypage?page=${pageMaker.endPage +1}'>&raquo;</a></li>");

		                          }else{
			                            document.write("<li><a href='/mypage?page=${pageMaker.endPage +1}'>&raquo;</a></li>");
		                        	  
		                          }
								</script>
							
							</c:if>
							
						</ul>
					</div>
        </section><!-- section -->
    </div>

<%@include file="../Footer.jsp" %>


</body>
</html>