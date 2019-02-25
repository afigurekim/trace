<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정10</title>
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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip1').value = data.zonecode;
                document.getElementById("address1").value = roadAddr;
                document.getElementById("address1").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
              /*  if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }*/

          /*      var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }*/
            }
        }).open();
    }
   
    
    
    
    function checkPwd(){
    	var passReg=/[a-z0-9]{10,15}$/g;
    
     	
    var password=$("#passwd").val();
    var repassword=$("#repasswd").val();
    var check_pw=password.search(/[0-9]/g);
    var check_pw2=password.search(/[a-z]/ig);


    if(password.length<6){
    	$("#passwd").css("background-color","#FFCECE");
    }
    if(repassword.length<6){
    	$("#passwd").css("background-color","#FFCECE");
    }
    if(password ==""){
    	$("#passwd").css("background-color","#FFCECE");
    }
    else if(repassword==""){
    	$("#repasswd").css("background-color","#FFCECE");
    }
    else if(password!=repassword){
    	$("#passwd").css("background-color","#FFCECE");
    	$("#repasswd").css("background-color","#FFCECE");
    }
    else if(password.length>=6 && repassword.length >=6 && password==repassword && passReg.test(password) &&check_pw >=0 && check_pw2>=0)
    {
    	$("#passwd").css("background-color","#B0F6AC");
    	$("#repasswd").css("background-color","#B0F6AC");
    }
    
    }
$(function(){
		
	$("#joinform").submit(function(event){
		var that=$(this);
		var pw1=$("#passwd").val();
		var pw2=$("#repasswd").val();
		
		if(pw1!=pw2){
			alert("비밀번호가 서로 다릅니다.");
			event.preventDefault();

		}else{
			that.submit();
		}
		
	});  
	
	
	
});

</script>
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
			            
			            <form name="joinform" id="joinform" action="/myinfo" method="post">
			                <div id="personInfo">
			
			                    <table class="person-tb">
 			                        <colgroup>
			                            <col width="135">
			                                <col width="720">
			                        </colgroup>
			                        <tbody>
			                        <c:forEach items="${memberList}" var="MemberVO" varStatus="status">
			                            <tr>
			                                <th>
			                                    <div class="tb-l pl-30"> 아이디</div>
			                                </th>
			                                <td>
			                                    <div class="tb-l pl-6 pl-id">
			                                        <b>${MemberVO.user_id}</b>
			                                        <input type="hidden" name="user_id" value="${MemberVO.user_id}">
			                                        <span class="idpw-info">* 아이디는 변경이 불가합니다.</span>
			                                    </div>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th>
			                                    <div class="tb-l pl-30"> 이름</div>
			                                </th>
			                                <td>
			                                    <div class="tb-l pl-6 pl-id">
			                                        <input type="text" name="user_name" id="name" value="${MemberVO.user_name}" class="MS_input_txt" size="15" maxlength="30" msg="이름" valch="yes" required>
			                                    </div>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th>
			                                    <div class="tb-l pl-30"> 비밀번호</div>
			                                </th>
			                                <td>
			                                    <div class="tb-l pl-6 pl-paw">
			                                        <input type="password" name="user_pw" id="passwd" class="MS_input_txt" value="${MemberVO.user_pw}" islen="3" size="15" maxlength="20" msg="비밀번호"  oninput="checkPwd()" valch="yes"  required aria-autocomplete="list"> 
			                                        <span class="idpw-info">* 비밀번호는 문자와 숫자를 조합하여 10~15자리로 만들어 주세요.</span>
			                                    </div>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th>
			                                    <div class="tb-l pl-30">비밀번호 확인</div>
			                                </th>
			                                <td>
			                                    <div class="tb-l pl-6 pl-paw">
			                                        <input type="password" name="repasswd" id="repasswd" class="MS_input_txt" value="${MemberVO.user_pw}" size="15" maxlength="20"   oninput="checkPwd()" msg="비밀번호 확인"   required valch="yes">
			                                    </div>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th>
			                                    <div class="tb-l pl-30"> 생일/성별</div>
			                                </th>
			                                <td>
			                                    <div class="tb-l pl-6">
			                                    	<input style="width:80px;height:21px" type="text" class="MS_input_txt" name="birth_day"  required  value="${MemberVO.birth_day}" valch="yes" msg="생년월일"> (주민번호 앞자리)
			    								
			    									&nbsp;&nbsp;
			    									<script>
			    										$(document).ready(function() {
			    											$("input[name='sex'][value='<c:out value="${MemberVO.sex}"/>']").prop("checked",true);
			    										});
			    									</script>
			                                        <input type="radio" name="sex" value="남" class="MS_radio">남 &nbsp;&nbsp;
			                                        <input type="radio" name="sex" value="여" class="MS_radio">여   <!-- <a href="javascript:view14();"> [14세미만 가입안내]</a>-->
			                                    </div>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th>
			                                    <div class="tb-l pl-30"> 우편번호</div>
			                                </th>
			                                <td>
			                                    <div class="tb-l pl-6 pl-zip">
			                                        <input type="text" name="post" id="zip1" class="MS_input_txt" value="${MemberVO.post}" size="6" maxlength="6"  msg="우편번호" valch="yes" required>
			                                        <span>
			                                        <a href="#" onclick="sample4_execDaumPostcode()">
			                                        <img alt="우편번호검색" src="http://bongjashop.imglink.kr/wepix_design/contents/btn_postcode_h19.gif" align="absmiddle">
			                                        </a>
			                                        </span>
			                                    </div>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th>
			                                    <div class="tb-l pl-30"> 집주소</div>
			                                </th>
			                                <td>
			                                    <div class="tb-l pl-6 pl-add">
			                                        <input type="text" name="address1" id="address1" class="MS_input_txt" value="${MemberVO.address1}" size="40" maxlength="100" readonly="readonly" required>
			                                    </div>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th>
			                                    <div class="tb-l pl-30">상세주소</div>
			                                </th>
			                                <td>
			                                    <div class="tb-l pl-6 pl-add">
			                                        <input type="text" name="address2" id="address2" class="MS_input_txt" value="${MemberVO.address2}" size="40" maxlength="100"  required >
			                                    </div>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th>
			                                    <div class="tb-l pl-30"> 연락처</div>
			                                </th>
			                                <td>
			                                    <div class="tb-l pl-6 pl-tel">
			                                    	<input style="width:80px;height:21px" type="text" name="contact1" id="phone1" class="MS_input_txt" value="${MemberVO.contact1}" msg="연락처" valch="yes"  required > -
			                                        <input style="width:80px;height:21px" type="text" name="contact2" id="phone2" class="MS_input_txt" value="${MemberVO.contact2}" size="4" maxlength="4" msg="연락처" valch="yes"  required >-
			                                        <input style="width:80px;height:21px" type="text" name="contact3" id="phone3" class="MS_input_txt" value="${MemberVO.contact3}" size="4" maxlength="4" msg="연락처" valch="yes"  required >
			                                    </div>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th>
			                                    <div class="tb-l pl-30"> 이메일</div>
			                                </th>
			                                <td>
			                                    <div class="tb-l pl-6 pl-email">
			                                        <b>${MemberVO.email}</b>
			                                        <input type="hidden" name="email" value="${MemberVO.email}">
			                                        <span class="idpw-info">* 이메일은 변경이 불가합니다.</span>
			                                    </div>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th>
			                                    <div class="tb-l pl-30">휴대폰</div>
			                                </th>
			                                <td>
			                                    <div class="tb-l pl-6 pl-mobile">
			                                    	<input style="width:80px;height:21px" type="text" name="phone1" id="cp1" class="MS_input_txt" value="${MemberVO.phone1}" msg="휴대전화" valch="yes"  required > -
			                                        <input style="width:80px;height:21px" type="text" name="phone2" id="cp2" class="MS_input_txt" value="${MemberVO.phone2}" size="4" maxlength="4" msg="휴대전화" valch="yes"  required > -
			                                        <input style="width:80px;height:21px" type="text" name="phone3" id="cp3" class="MS_input_txt" value="${MemberVO.phone3}" size="4" maxlength="4" msg="휴대전화" valch="yes"  required >
			                                        <!--<a href="javascript:checkcp();" onfocus="this.blur();"><img src="http://cdn-bikeselling.bizhost.kr/img/mem_btn_check.gif" align='absmiddle'></a>-->
			                                        
			                                    </div>
			                                </td>
			                            </tr>
			                            </c:forEach>
			                         </tbody>
			                    </table>
			                </div>
			            <!-- #personInfo -->
			            <div class="btn-area">
			               
			                <button type="submit" style="background-color:white; border:none;">
			                   <img alt="정보수정" src="../resources/imgs/btn_member_info.gif">
			                 </button>
			                &nbsp;
			                <button type="reset" style="background-color:white;border:none;">
			                    <img alt="취소" src="../resources/imgs/btn_member_info_cancel.gif">
			                </button>
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