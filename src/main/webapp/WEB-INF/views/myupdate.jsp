<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정 성공</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/mypage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<style>
	#left-menu {
		width: 15%;
		float: left;
	}
	.thumb {
		padding: 5px;
		height: 110px;
	}
	.col1{
		width: 20%;
	}
	.col4, .col5{
		width: 15%;
	}
	.col6{
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
        	<h2 class="jh">정보수정</h2>
        </div>
	        <div id="join_content3">
			    <div id="join">
			            <iframe name="hf" id="hf" style="display:none;"></iframe>
			            
			            <form name="joinform" id="joinform">
			                <div id="personInfo">
			                    <table class="person-tb">
 			                        <tbody>
				                        <tr>
			                                <th>
			                                    <div class="tb-l pl-30"> 회원정보 수정이 성공적으로 완료되었습니다.</div>
			                                </th>
			                            </tr>
			                        </tbody>
			                    </table>
			                </div>
			            <!-- #personInfo -->
			            <div class="btn-area">
			                <a href="/myinfo" style="background-color:white; border:none;">
			                   <img alt="정보수정" src="../resources/imgs/btn_member_info.gif">
			                 </a>
			            </div>
			        </form>
			    <!-- #join -->
			    </div>
		</div>
    </div>
  </div>
 

<%@include file="MainFooter.jsp" %>


</body>
</html>