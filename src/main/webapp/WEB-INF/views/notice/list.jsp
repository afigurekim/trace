<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>공지사항</title>
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
    
$(function(){
	var windowWidth=$(window).width();
	
	if(windowWidth<=425){
		$("tr>#dd").css("width","255px");
		
	}else{
		$("tr>#dd").css("width","570px");
		}
	
	$(window).resize(function(){
		windowWidth=$(window).width();
		console.log(windowWidth);
		
		
		if(windowWidth<=470 && windowWidth>426){
			$("tr>#dd").css("width","300px");
		}
		else if(windowWidth<=520 && windowWidth>470){
			$("tr>#dd").css("width","350px");
		}
		else if(windowWidth<=570 && windowWidth>520){
			$("tr>#dd").css("width","400px");
		}
		else if(windowWidth<=620 && windowWidth>570){
			$("tr>#dd").css("width","450px");
		}
		else if(windowWidth<=770 && windowWidth>620){
				$("tr>#dd").css("width","500px");
		}else{
			$("tr>#dd").css("width","570px");
		}
		
		if(windowWidth<=425){
			$("tr>#dd").css("width","255px");
			
		}
		
	});
		
	});
    </script>
    
    
    <style type="text/css">
    body{
    background-color: white;
    }
   	tr>#dd {
   	  display:inline-block;
   	  overflow:hidden;
	  white-space: nowrap;
	  text-overflow: ellipsis;
	}
	 .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
	 border:none;
	 }
	tr>th,td{
		text-align: center;
	}
	
	tr>#dd,#d{
		text-align: left;
	}
	
	#subtr{
		height:44px;
	}
		
	#subtr>th{
		padding-top: 9px;
		background-color: #FBFBFB;
		font-size: 16px;
		font-weight: 900;
	}
		
	#contr{
		height:50px;
	}
	
	#contr>td{
		padding-top: 13px;
		font-weight: 500;
	}
	
	#contr>td>a{
		font-weight: 500;
		font-size: 14px;
	}
	
	#single-page-slider {
		background-image: url("../../../resources/imgs/banner/gongji-banner.jpg");
		bakcground-color: #A9A9A9;
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
	}
	
    </style>

</head><!--/head-->
<body>
<%@include file="../Header.jsp" %>


    <!-- body -->
  <!--   
    <div style="width:100%;height:200px; background-color:gray;margin-bottom:70px;"></div>
    -->

     <section id="single-page-slider" class="no-margin">
        <div class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="item active">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="center gap fade-down section-heading">
                                    <script>
                                    	if(window.location.href.indexOf("eng")!=-1){
                                    		document.write("<h2 class='main-title'>NOTICE</h2>");
                                    	}else if(window.location.href.indexOf("china")!=-1){
                                    		document.write("<h2 class='main-title'>公告事项</h2>");
                                    	}else{
                                    		document.write("<h2 class='main-title'>공지사항</h2>");
                                    	}
                                    </script>
                                    <hr>
                                </div>
                            </div>   
                        </div>
                    </div>
                </div><!--/.item-->
            </div><!--/.carousel-inner-->
        </div><!--/.carousel-->
    </section><!--/#main-slider-->
    
     
<div class="container" style="margin-top: 40px; margin-bottom:230px;">
	<div class="table-responsive">
	  <table class="table" cellspacing="0" cellpadding="0">
	   
	      <tr style="border-top: 2.3px solid #D8D8D8; border-bottom: 2.3px solid #D8D8D8;" id="subtr">
		<th class="col-md-1 hidden-xs hidden-sm">No</th>
		<th class="col-md-6" id="d">제목</th>
		<th class="visible-xs visible-sm">
		날짜
		</th>
		<th class="col-md-2 hidden-xs hidden-sm">작성자</th>
		<th class="col-md-2 hidden-xs hidden-sm">날짜</th>
		<th class="col-md-1 hidden-xs hidden-sm">조회수</th>
		 </tr>
	   
	   
	<c:forEach items="${list }" var="vo">
	   <tr style="border-top: 1px solid #D8D8D8;" id="contr">
			<td class="col-md-1 hidden-xs hidden-sm"><a href="/notice/read?bno=${vo.bno }"><c:out value="${vo.bno}"/></a></td>
			<td class="col-md-6" id="dd"><a href="/notice/read?bno=${vo.bno }" ><c:out value="${vo.title }"/></a></td> 
			<td class="visible-xs visible-sm">
				<div><span><a href="/notice/read?bno=${vo.bno }" ><fmt:formatDate pattern="yy-MM-dd" value="${vo.reg_date }"/></a></span></div>
			</td>
			<td class="col-md-2 hidden-xs hidden-sm"><a href="/notice/read?bno=${vo.bno }" >${vo.writer }</a></td>
			<td class="col-md-2 hidden-xs hidden-sm"><a href="/notice/read?bno=${vo.bno }" ><fmt:formatDate pattern="yy-MM-dd" value="${vo.reg_date }"/></a></td>
			<td class="col-md-1 hidden-xs hidden-sm"><c:out value="${vo.view_cnt }"/></td>
	   </tr> 
	 </c:forEach>  
	</table>
</div>

</div>	<!-- 테이블 end -->

<div class="text-center" style="margin: auto; height: 80px; margin-top: 0px;">
	<ul class="pagination">
		<c:if test="${pageMaker.prev}">
			<li><a href="notice?page=${pageMaker.startPage-1}">&laquo;</a></li>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<li 
				<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
			<a href="notice?page=${idx}">${idx}</a>
			</li>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage>0 }">
			<li><a href="notice?page=${pageMaker.endPage +1}">&raquo;</a></li>
		</c:if>
	</ul>
</div>

	<!-- body end-->
	<!-- footer -->
	<%@include file="../Footer.jsp" %>
	
	   
</body>
</html>