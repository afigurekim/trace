<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/list.css" /></head>
  <script type="text/javascript" src="/resources/js/upload.js"></script>
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);
#jh{font-family: 'Jeju Hallasan', cursive;}

#footer2{
margin-top:30px;}
#inner1{
padding-top:4px;
padding-bottom:4px;
}
#inner2{
}
.plc-list>li{
width:85.4px;
}

</style>
<script type="text/javascript">
$(function(){
		if(window.location.href=="http://localhost:8181/region/jeju" || window.location.href.includes("http://localhost:8181/region/jeju?page="))
		{
			$("#jeju").css('background-color','wheat');
		}	
	



});	


</script>
</head>
<body>
<%@include file="../Header.jsp" %>
<div id="wrap">
	<div class="content">
	
		<div style="margin-bottom:30px;">
            <img src="../resources/imgs/mainregion.jpg">
            
      	</div>
      	<div class="pl-cate" id="jh">
			
			<ul class="plc-list" id="sub_category" style="margin-top:15px;">
				<li style="margin-left: -40px;"><a href="/region" id="allregion">전체보기</a></li>
				<li><a href="/region/seoul" id="seoul">서울</a></li>
				<li><a href="/region/incheon" id="incheon">인천</a></li>
				<li><a href="/region/kyunggi" id='kyunggi'>경기도</a></li>
				<li><a href="/region/kangwon" id="kangwon">강원도</a></li>
				<li><a href="/region/chungchung" id="chungchung">충청도</a></li>
				<li><a href="/region/kyungsang" id='kyungsang'>경상도</a></li>
				<li><a href="/region/junla" id="junla">전라도</a></li>
				<li><a href="/region/jeju" id='jeju'>제주도</a></li>
			</ul>
		</div>
		<div class="pl-sort">

			<div align="right" style="margin-top:-19px;">
				<ul>
					<select name="name">
						<option value="#" selected="">정렬방법</option>
						<option value="#">이름순</option>
						<option value="#">별점순</option>
					</select>
				</ul>
			</div>
		</div>
	<div class="clearfix">
	</div>
	
	<div class="glist">
		<ul class="listman">
		<c:forEach items="${list}" var="Historic_siteVO" varStatus="status">
		<li>
			<div class="listimg">
				<a href="/region/read?bno=${Historic_siteVO.bno}">
				<img src="${Historic_siteVO.first_image}">
				
            	</a>		
			</div>
			<div class="additem">
				<p class="gname">${Historic_siteVO.site_name}</p>			
				<p class="gname_pre" style="text-overflow:elipsis;">${Historic_siteVO.address}</p>
				
			</div>
		</li>
		</c:forEach>
    
	</ul>
		
	</div>
		
</div>
	
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li><a href="/region/seoul?page=${pageMaker.startPage-1}">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li 
					<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
				<a href="/region/seoul?page=${idx}">${idx}</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage>0 }">
				<li><a href="/region/seoul?page=${pageMaker.endPage +1}">&raquo;</a></li>
			</c:if>
			
		</ul>
	</div>
	
	
</div>
<%@include file="../MainFooter.jsp" %>

</body>
</html>