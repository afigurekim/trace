<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 댓글</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/mypage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<style>
	#left-menu {
		width: 15%;
		float: left;
	}
	.tablecontent {
		font-size: 16px;
	}
	.thumb {
		padding: 5px;
		height: 110px;
	}
	.col1{
		width: 10%;
	}
	.col2{
		width: 20%;
	}
	.col4{
		width: 15%;
	}
	.col5{
		width: 10%;
	}
</style>
</head>
<body>
<%@include file="Header.jsp" %>
<div id="wrap">
	<div id="join_content">
	<!-- .mypageWrap -->
		<div id="left-menu" class="jh">
			<h2>마이페이지</h2>
			<h3><a href="/mypage">찜목록</a></h3>
			<h3><a href="/mycomment">내 댓글</a></h3>
			<h3><a href="/myinfo">정보수정</a></h3>
		</div>
		<div style="margin-top:70px">
        	<h2 class="jh">내 댓글</h2>
        </div>
        <div>
        	<table class="table tablecontent" style="width:80%">
        	<thead>
        		<tr>
        			<th class="col1">장소</th>
        			<th class="col2">지역</th>
        			<th>내용</th>
        			<th class="col4">작성일</th>
        			<th class="col5">이동</th>
        		</tr>
        	</thead>
        	<tbody class="repliesBody">
        	</tbody>
        	</table>
        </div>
    </div>
  </div>

<script id="template" type="text/x-handlebars-template">
{{#each .}}
	<tr>
		<td class="col1">{{bno}}</td>
		<td class="col2">{{bno}}</td>
		<td>{{reply_text}}</td>
		<td class="col4">{{prettifyDate reg_date}}</td>
		<td class="col5"><button type="button" class="btn btn-default">이동</button></td>
	</tr>
{{/each}}
</script>
 
<script type="text/javascript">
var user_id="mrhong1234";
var replyPage=1;
function getPage(pageInfo){
$.ajax({
	url:pageInfo,
	async: false,
	success:function(data){
		console.log("+댓글 갯수+"+data.length);
		var str="";
		printData(data.list,$("#repliesBody"),$("#template"));
		printPaging(data.pageMaker,$(".pagination"));
		$("#replycntSmall").html("[ " +data.pageMaker.totalCount +" ]");
	}
});
}

Handlebars.registerHelper("prettifyDate",function(timeValue){
	var dateObj= new Date(timeValue);
	var year= dateObj.getFullYear();
	var month = dateObj.getMonth()+1;
	var date= dateObj.getDate();
	return year+"/"+month+"/"+date;

});

var printData= function(replyArr,target,templateObject){
	var template= Handlebars.compile(templateObject.html());
	var html=template(replyArr);
	target.after(html);
}

var printPaging= function(pageMaker,target){
	
	var str="";
	if(pageMaker.prev){
		str+= "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
	}
	for(var i=pageMaker.startPage,len=pageMaker.endPage;i<=len;i++)
		{
		var strClass= pageMaker.cri.page==i?'class=active':'';
		str+="<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
		}
	if(pageMaker.next){
		str+="<li><a href='"+(pageMaker.endPage +1)+"'> >> </a></li>";
	}
	target.html(str);
}

$(".pagination").on("click","li a",function(event){
	event.preventDefault();
	replyPage =$(this).attr("href");
	getPage("/myreply/"+user_id+"/"+replyPage);
});
</script>
<%@include file="MainFooter.jsp" %>

</body>
</html>