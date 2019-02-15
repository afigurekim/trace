<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/join.css" /></head>
<style>
#footer2{
margin-top:30px;}
</style>
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
   
  function idcheck(){
	  var id=$("#userid").val();
		if(id==""){
			alert("아이디를 입력해주세요");
			return;
		}
		$.ajax({
			url:'/checkid',
			data:{
				sid:id,
			},
			success:function(data){
				if(data==0){
					alert("아이디 사용가능");
					
					$("#useridcheck").val(1);

					
				}
				else if(data==1){alert("이미 존재하는 아이디입니다")};
			}
		});
  }
  function emailcheck(){
	  var email=$("#email").val();
  	  $.ajax({
  		  	url:"emailcheck",
  		  	data:{
  		  		semail:email,
  		  	},
  		  	success:function(data){
  		  		if(data==0){
  		  			alert("이메일 사용가능");
  		  			$("#useremailcheck").val(1);
  		  		}else {
  		  			alert("이미 사용중인 이메일입니다");
  		  		}
  		  	}
  	  
  	  });
  	  
  }
$(function(){
		
	$("#joinform").submit(function(event){
		var that=$(this);
		var pw1=$("#passwd").val();
		var pw2=$("#repasswd").val();
		
		if($("#useridcheck").val()=="0"){
			alert("아이디 중복을 확인해주세요");
			event.preventDefault();
		}else if(pw1!=pw2){
			alert("비밀번호가 서로 다릅니다.");
			event.preventDefault();

		}else if($("#useremailcheck").val()=="0"){
			alert("이메일 인증을 해주세요");
			event.preventDefault();
		}else{
			that.submit();
		}
		
	});  
	
	
	
});


</script>


</head>
<body>
<%@include file="Header.jsp" %>
<div id="wrap">
	<div id="join_content">
    <div id="join">
        <h1 class="tit-join"></h1>
            <iframe name="hf" id="hf" style="display:none;"></iframe>
            
            <form name="joinform" id="joinform" action="/join" method="post">
                <h3 class="cont-tit">회원가입 항목</h3>
                <div id="personInfo">

                    <table class="person-tb">
                        <colgroup>
                            <col width="135">
                                <col width="720">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30"> 이름</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-id">
                                        <input type="text" name="username" id="name" value="" class="MS_input_txt" size="15" maxlength="30" msg="이름" valch="yes" required>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30"> 아이디</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-id">
                                        <input type="text" name="userid" id="userid" class="MS_input_txt" islen="3" size="10" maxlength="12" msg="아이디" valch="yes" required>
                                        <a href="#" onclick="idcheck()">
                                        <img alt="중복확인" src="http://bongjashop.imglink.kr/wepix_design/contents/btn_overlap_h19.gif" border="0" align="absmiddle">
                                        <input type="hidden" id="useridcheck" value="0">
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30"> 비밀번호</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-paw">
                                        <input type="password" name="userpw" id="passwd" class="MS_input_txt" value="" islen="3" size="15" maxlength="20" msg="비밀번호"  oninput="checkPwd()" valch="yes"  required aria-autocomplete="list"> 
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
                                        <input type="password" name="repasswd" id="repasswd" class="MS_input_txt" value="" size="15" maxlength="20"   oninput="checkPwd()" msg="비밀번호 확인"   required valch="yes">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30"> 생일/성별</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6">
                                    	<input style="width:80px;height:21px" type="text" class="MS_input_txt" name="birthday"  required  value="" valch="yes" msg="생년월일"> (주민번호 앞자리)
    								
    									&nbsp;&nbsp;
                                        <input type="radio" name="sex" value="M" class="MS_radio">남 &nbsp;&nbsp;
                                        <input type="radio" name="sex" value="F" class="MS_radio" checked="">여   <!-- <a href="javascript:view14();"> [14세미만 가입안내]</a>-->
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30"> 우편번호</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-zip">
                                        <input type="text" name="post" id="zip1" class="MS_input_txt" value="" size="6" maxlength="6"  msg="우편번호" valch="yes" required>
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
                                        <input type="text" name="address1" id="address1" class="MS_input_txt" value="" size="40" maxlength="100" readonly="readonly" required>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30">상세주소</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-add">
                                        <input type="text" name="address2" id="address2" class="MS_input_txt" value="" size="40" maxlength="100"  required >
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30"> 연락처</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-tel">
                                    	<input style="width:80px;height:21px" type="text" name="contact1" id="phone1" class="MS_input_txt" value="" msg="연락처" valch="yes"  required > -
                                        <input style="width:80px;height:21px" type="text" name="contact2" id="phone2" class="MS_input_txt" value="" size="4" maxlength="4" msg="연락처" valch="yes"  required >-
                                        <input style="width:80px;height:21px" type="text" name="contact3" id="phone3" class="MS_input_txt" value="" size="4" maxlength="4" msg="연락처" valch="yes"  required >
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30"> 이메일</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-email">
                                        <input style="width:160px;" type="text" name="email" id="email" class="MS_input_txt" size="20" maxlength="40" value="" msg="이메일" valch="yes" required>
                                    	<a href="#" id="authemail" onclick="emailcheck()"><img src="../resources/imgs/이메일중복확인.png"  style="width:92px; height:23px; vertical-align:bottom"></a>
                                        <input type="hidden" id="useremailcheck" value="0">
                                   
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30">휴대폰</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-mobile">
                                    	<input style="width:80px;height:21px" type="text" name="phone1" id="cp1" class="MS_input_txt" value="" msg="휴대전화" valch="yes"  required > -
                                        <input style="width:80px;height:21px" type="text" name="phone2" id="cp2" class="MS_input_txt" value="" size="4" maxlength="4" msg="휴대전화" valch="yes"  required > -
                                        <input style="width:80px;height:21px" type="text" name="phone3" id="cp3" class="MS_input_txt" value="" size="4" maxlength="4" msg="휴대전화" valch="yes"  required >
                                        <!--<a href="javascript:checkcp();" onfocus="this.blur();"><img src="http://cdn-bikeselling.bizhost.kr/img/mem_btn_check.gif" align='absmiddle'></a>-->
                                        
                                    </div>
                                </td>
                            </tr>
                         </tbody>
                    </table>
                </div>
            <!-- #personInfo -->
            <div class="btn-area">
               
                <button type="submit" style="background-color:white; border:none;">
                   <img alt="가입완료" src="http://cdn-bikeselling.bizhost.kr/img/btn_member_join1.gif">
                 </button>
                &nbsp;
                <button type="reset" style="background-color:white;border:none;">
                    <img alt="취소" src="http://cdn-bikeselling.bizhost.kr/img/btn_member_join_cancel.gif">
                </button>
            </div>
            
        </div></form>
    <!-- #join -->
    </div>
	</div>
</div>
<%@include file="MainFooter.jsp" %>


</body>
</html>