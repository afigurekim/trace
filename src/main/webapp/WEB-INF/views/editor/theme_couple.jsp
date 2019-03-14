<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- 반응형 디자인을 위한 css 파일 -->
<link href="../../../resources/css/editor_mobile_list.css" rel="stylesheet">

<link href="../../../resources/css/bootstrap.min.css" rel="stylesheet">

<link href="../../../resources/css/font-awesome.min.css"
	rel="stylesheet">
<link href="../../../resources/css/pe-icons.css" rel="stylesheet">
<link href="../../../resources/css/prettyPhoto.css" rel="stylesheet">
<link href="../../../resources/css/animate.css" rel="stylesheet">
<link href="../../../resources/css/style.css" rel="stylesheet">
<script src="../../../resources/js/jquery.js"></script>
<link rel="shortcut icon" href="../../../resources/imgs/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../../../resources/imgs/ico/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../../../resources/imgs/ico/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../../../resources/imgs/ico/images/ico/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon-precomposed"
	href="../../../resources/imgs/ico/apple-touch-icon-57x57.png">
<script src="../../../resources/js/bootstrap.min.js"></script>
<script src="../../../resources/js/jquery.prettyPhoto.js"></script>
<script src="../../../resources/js/plugins.js"></script>
<script src="../../../resources/js/init.js"></script>
<title>에디터 추천코스</title>
<script type="text/javascript">
//상단의 초록색 메뉴 클릭시 이동하는 이벤트 함수 
 $(function(){
	$("#listAll").click(function(){
		if(window.location.href.indexOf("kor")!=-1){
			window.location.href="/editor/listAll";
			
		}else if(window.location.href.indexOf("eng")!=-1){
			window.location.href="/eng/editor/listAll";
		}else if(window.location.href.indexOf("china")!=-1){
			window.location.href="/china/editor/listAll";
		}else{
			window.location.href="/editor/listAll";
		}
		$(this).addClass('active'); 
		
	});	
	
		

	$("#family").click(function(){
		if(window.location.href.indexOf("kor")!=-1){
			window.location.href="/editor/theme_family";
		}else if(window.location.href.indexOf("eng")!=-1){
			window.location.href="/eng/editor/theme_family";
		}else if(window.location.href.indexOf("china")!=-1){
			window.location.href="/china/editor/theme_family";
		}else{
			window.location.href="/editor/theme_family";
		}
		$(this).addClass('active'); 
	});	
	$("#couple").click(function(){
		if(window.location.href.indexOf("kor")!=-1){
			window.location.href="/editor/theme_couple";
		}else if(window.location.href.indexOf("eng")!=-1){
			window.location.href="/eng/editor/theme_couple";
		}else if(window.location.href.indexOf("china")!=-1){
			window.location.href="/china/editor/theme_couple";
		}else{
			window.location.href="/editor/theme_couple";
		}
	});	
	$("#edu").click(function(){
		if(window.location.href.indexOf("kor")!=-1){
			window.location.href="/editor/theme_edu";
		}else if(window.location.href.indexOf("eng")!=-1){
			window.location.href="/eng/editor/theme_edu";
		}else if(window.location.href.indexOf("china")!=-1){
			window.location.href="/china/editor/theme_edu";
		}else{
			window.location.href="/editor/theme_edu";
		}
	});	
	$("#religion").click(function(){
		if(window.location.href.indexOf("kor")!=-1){
			window.location.href="/editor/theme_religion";
		}else if(window.location.href.indexOf("eng")!=-1){
			window.location.href="/eng/editor/theme_religion";
		}else if(window.location.href.indexOf("china")!=-1){
			window.location.href="/china/editor/theme_religion";
		}else{
			window.location.href="/editor/theme_religion";
		}
	});	
});
	
</script>

<style>
#img_size {
	background-image: url("../../../resources/imgs/cloud.png");
}

#single-page-slider {
	background-image: url("../../../resources/imgs/banner/editor2-banner.jpg");
	bakcground-color: #01b29e;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
}

#portfolio {
	margin-top: 70px;
}


</style>
</head>
<body>
	<%@include file="../Header.jsp"%>
	<section id="single-page-slider" class="no-margin" style="margin-bottom:120px; overflow:hidden;">
		<div class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<div class="item active">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div class="center gap fade-down section-heading">
									<script type="text/javascript">
									  if(window.location.href.indexOf("kor")!=-1){
										  document.write("<h2 class='main-title'>에디터 추천코스</h2>");
										  document.write("<hr>");
										  document.write("<p>발자취 에디터가 추천하는 역사 탐험</p>");
									  }else if(window.location.href.indexOf("eng")!=-1){
										  document.write("<h2 class='main-title'>Baljachwi editor's Recommended places</h2>");
										  document.write("<hr>");
										  document.write("<p>Exploring&nbsp;&nbsp;historical&nbsp;&nbsp;place&nbsp;&nbsp;recommended&nbsp;&nbsp;by&nbsp;&nbsp;the&nbsp;&nbsp;Baljachwi&nbsp;&nbsp; Editor</p>" );
									  }else if(window.location.href.indexOf("china")!=-1){
										  document.write("<h2 class='main-title'>足迹编辑推荐处</h2>");
										  document.write("<hr>");
										  document.write("<p>足迹编辑推荐的历史探险</p>" );
									  }else{
										  document.write("<h2 class='main-title'>에디터 추천코스</h2>");
										  document.write("<hr>");
										  document.write("<p>발자취 에디터가 추천하는 역사 탐험</p>" );
									  }
									</script>			
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/.item-->
			</div>
			<!--/.carousel-inner-->
		</div>
		<!--/.carousel-->
	</section>
	<!--/#main-slider-->


	<section id="portfolio"style="margin-top:0px; margin-bottom:120px;">
		<div class="container">
		<script type="text/javascript">
			document.write("<ul class='portfolio-filter fade-down center'>");
				
				 if(window.location.href.indexOf("kor")!=-1){
					 document.write("<li><a class='btn btn-outlined btn-primary 'id='listAll'>전체보기</a></li>");
					  document.write("&nbsp;&nbsp;&nbsp;");
					  document.write("<li><a class='btn btn-outlined btn-primary ' id='family'>가족</a></li>");
					  document.write("&nbsp;&nbsp;&nbsp;");
					  document.write("<li><a class='btn btn-outlined btn-primary active' id='couple'>데이트</a></li>");
					  document.write("&nbsp;&nbsp;&nbsp;");
					  document.write("<li><a class='btn btn-outlined btn-primary' id='edu'>교 육</a></li>");
					  document.write("&nbsp;&nbsp;&nbsp;");
					  document.write("<li><a class='btn btn-outlined btn-primary ' id='religion'>종 교</a></li>");
				  }else if(window.location.href.indexOf("eng")!=-1){
					  document.write("<li><a class='btn btn-outlined btn-primary 'id='listAll'>ALL</a></li>");
					  document.write("&nbsp;&nbsp;&nbsp;");
					  document.write("<li><a class='btn btn-outlined btn-primary' id='family'>FAMILY</a></li>");
					  document.write("&nbsp;&nbsp;&nbsp;");
					  document.write("<li><a class='btn btn-outlined btn-primary active' id='couple'>DATE</a></li>");
					  document.write("&nbsp;&nbsp;&nbsp;");
					  document.write("<li><a class='btn btn-outlined btn-primary' id='edu'>EDUCATION</a></li>");
					  document.write("&nbsp;&nbsp;&nbsp;");
					  document.write("<li><a class='btn btn-outlined btn-primary ' id='religion'>RELIGION</a></li>");
				  }else if(window.location.href.indexOf("china")!=-1){
					  document.write("<li><a class='btn btn-outlined btn-primary 'id='listAll'>所有的</a></li>");
					  document.write("&nbsp;&nbsp;&nbsp;");
					  document.write("<li><a class='btn btn-outlined btn-primary' id='family'>一家人</a></li>");
					  document.write("&nbsp;&nbsp;&nbsp;");
					  document.write("<li><a class='btn btn-outlined btn-primary active' id='couple'>恋人</a></li>");
					  document.write("&nbsp;&nbsp;&nbsp;");
					  document.write("<li><a class='btn btn-outlined btn-primary' id='edu'>教育</a></li>");
					  document.write("&nbsp;&nbsp;&nbsp;");
					  document.write("<li><a class='btn btn-outlined btn-primary ' id='religion'>宗教</a></li>");
				  }else{
					  document.write("<li><a class='btn btn-outlined btn-primary 'id='listAll'>전체보기</a></li>");
					  document.write("&nbsp;&nbsp;&nbsp;");
					  document.write("<li><a class='btn btn-outlined btn-primary' id='family'>가 족</a></li>");
					  document.write("&nbsp;&nbsp;&nbsp;");
					  document.write("<li><a class='btn btn-outlined btn-primary active' id='couple'>데이트</a></li>");
					  document.write("&nbsp;&nbsp;&nbsp;");
					  document.write("<li><a class='btn btn-outlined btn-primary' id='edu'>교 육</a></li>");
					  document.write("&nbsp;&nbsp;&nbsp;");
					  document.write("<li><a class='btn btn-outlined btn-primary ' id='religion'>종 교</a></li>");
				  }
				
			document.write("</ul>");
			</script>
			
			<div class="col-md-12" id = "div_table">
	<table class="table" id = "listAll_table">
		<colgroup id="tb_bno">
	    	<col/>
	  	</colgroup>
	  	<colgroup id="tb_title">
	   		 <col/>
	  	</colgroup>
	  <colgroup id="tb_writer">
	    <col/>
	  </colgroup>
	  <colgroup id="tb_regdate">
	    <col/>
	  </colgroup>
	  <colgroup id="tb_view">
	    <col/>
	  </colgroup>
		<thead>
			<tr  style="background-color:#FBFBFB; border-top:2.3px solid #D8D8D8;">
				<script>
			  if(window.location.href.indexOf("kor")!=-1){
							  document.write("<th scope='col' class='tb_bno'>글번호</th>");
							  document.write("<th scope='col' class='tb_title'>글제목</th>");
							  document.write("<th scope='col' class='tb_writer'>글쓴이</th>");
							  document.write("<th scope='col' class='tb_regdate'>날짜</th>");
							  document.write("<th scope='col' class='tb_view'>조회수</th>");
						  }else if(window.location.href.indexOf("eng")!=-1){
							  document.write("<th scope='col' class='tb_bno'>NO.</th>");
							  document.write("<th scope='col' class='tb_title'>SUBJECT</th>");
							  document.write("<th scope='col' class='tb_writer'>WRITER</th>");
							  document.write("<th scope='col' class='tb_regdate'>DATE</th>");
							  document.write("<th scope='col' class='tb_view'>VIEWS</th>");
							}else if(window.location.href.indexOf("china")!=-1){
								document.write("<th scope='col' class='tb_bno'>文号</th>");
								  document.write("<th scope='col' class='tb_title'>词藻</th>");
								  document.write("<th scope='col' class='tb_writer'>写文章的人</th>");
								  document.write("<th scope='col' class='tb_regdate'>日期</th>");
								  document.write("<th scope='col' class='tb_view'>查询数</th>");
						  }else{
							  document.write("<th scope='col' class='tb_bno'>글번호</th>");
							  document.write("<th scope='col' class='tb_title'>글제목</th>");
							  document.write("<th scope='col' class='tb_writer'>글쓴이</th>");
							  document.write("<th scope='col' class='tb_regdate'>날짜</th>");
							  document.write("<th scope='col' class='tb_view'>조회수</th>");
						  }
						  </script>
			</tr>
		</thead>

						<c:forEach items="${list }" var="vo">
							<!-- 테마별로 제공하기 위한 if문 -->
								<tr>
									<td class="tb_bno"><c:out value="${vo.bno }" /></td>
									<td width="45%" class="tb_title">
									<script>
											if(window.location.href.indexOf("kor")!=-1){
												  document.write("<a href='/editor/read?bno=${vo.bno }'>");
											  }else if(window.location.href.indexOf("eng")!=-1){
												  document.write("<a href='/eng/editor/read?bno=${vo.bno }'>");
											}else if(window.location.href.indexOf("china")!=-1){
												  document.write("<a href='/china/editor/read?bno=${vo.bno }'>");
											  }else{
												  document.write("<a href='/editor/read?bno=${vo.bno }'>");
											  }
									</script>
									<c:out
												value="${vo.title }" /></a></td>
									<td class="tb_writer"><c:out value="${vo.writer }" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${vo.regdate }" /></td>
									<td class="tb_view"><c:out value="${vo.viewcnt }" /></td>
								</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev }">
						<li><a href="theme_couple?page=${pageMaker.startPage -1  }">
						<span aria-hidden="true">&laquo;</span>
						</a>
						</li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage}" var="idx">
						<li
							<c:out value = "${pageMaker.cri.page == idx?'class=active':'' }"/>>
							<a href="theme_couple?page=${idx }">${idx }</a>
						</li>
					</c:forEach>
					<c:if test = "${pageMaker.next && pageMaker.endPage>0 }">
						<li><a href="theme_couple?page=${pageMaker.endPage +1 }">
						<span aria-hidden="true">&raquo;</span>
						</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
		</div>
	</section>
	</div>
	<%@include file="../Footer.jsp"%>
</body>
</html>