<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/join.css" /></head>
</head>
<body>
<%@include file="Header.jsp" %>
<div id="wrap">
	<div id="join_content">
    <div id="join">
        <h1 class="tit-join"></h1>
            <iframe name="hf" id="hf" style="display:none;"></iframe><form name="joinform" id="joinform" action="/member/joinpro.php" method="post"><input type="hidden" name="checkid" id="checkid" value="N"><input type="hidden" name="check1" value="1546094819"><input type="hidden" name="check2" value="8f7736b01cfa47fdb805978b7d7a4d75"><input type="hidden" name="checkcp" value="N" id="checkcp"><input type="hidden" name="usecheckcp" value="" id="usecheckcp"><input type="hidden" name="checknick" value="N" id="checknick"><input type="hidden" name="usechecknick" value="" id="usechecknick"><input type="hidden" name="usecheckemail" value="" id="usecheckemail"><input type="hidden" name="checkemail" value="N" id="checkemail"><input type="hidden" name="usecheckemail" value="" id="usecheckemail">
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
                                        <input type="text" name="name" id="name" value="" class="MS_input_txt" size="15" maxlength="30" msg="이름" valch="yes">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30"> 아이디</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-id">
                                        <input type="text" name="id" id="id" class="MS_input_txt" islen="3" size="10" maxlength="12" msg="아이디" valch="yes">
                                        <a href="javascript:checkid();" onfocus="this.blur();">
                                        <img alt="중복확인" src="http://bongjashop.imglink.kr/wepix_design/contents/btn_overlap_h19.gif" border="0" align="absmiddle">
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
                                        <input type="password" name="passwd" id="passwd" class="MS_input_txt" value="" islen="3" size="15" maxlength="20" msg="비밀번호" valch="yes" onkeyup="check_pwd_length(this);" aria-autocomplete="list"> 
                                        <span class="idpw-info">* ID와 비밀번호는 문자와 숫자를 조합하여 3~12자리로 만들어 주세요.</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30">비밀번호 확인</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-paw">
                                        <input type="password" name="repasswd" id="repasswd" class="MS_input_txt" value="" size="15" maxlength="20" onkeyup="check_pwd_length(this);" msg="비밀번호 확인" valch="yes">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30"> 생일/성별</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6">
                                    	<input style="width:80px;height:21px" type="text" class="MS_input_txt" name="byear" value="" valch="yes" msg="생년월일"> 년
    									<input style="width:80px;height:21px" type="text" class="MS_input_txt" name="bmonth" value="" valch="yes" msg="생년월일"> 월
    									<input style="width:80px;height:21px" type="text" class="MS_input_txt" name="bday" value="" valch="yes" msg="생년월일"> 일&nbsp;&nbsp;
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
                                        <input type="text" name="zip1" id="zip1" class="MS_input_txt" value="" size="3" maxlength="3" onfocus="this.blur();" msg="우편번호" valch="yes">-
                                        <input type="text" name="zip2" id="zip2" class="MS_input_txt" value="" size="3" maxlength="3" onfocus="this.blur();" msg="우편번호" valch="yes"> 
                                        <span>
                                        <a href="javascript:openDaumPostcode();">
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
                                        <input type="text" name="addr1" id="addr1" class="MS_input_txt" value="" size="40" maxlength="100" readonly="readonly">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30">상세주소</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-add">
                                        <input type="text" name="addr2" id="addr2" class="MS_input_txt" value="" size="40" maxlength="100">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30"> 연락처</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-tel">
                                    	<input style="width:80px;height:21px" type="text" name="phone1" id="phone1" class="MS_input_txt" value="" msg="연락처" valch="yes"> -
                                        <input style="width:80px;height:21px" type="text" name="phone2" id="phone2" class="MS_input_txt" value="" size="4" maxlength="4" msg="연락처" valch="yes">-
                                        <input style="width:80px;height:21px" type="text" name="phone3" id="phone3" class="MS_input_txt" value="" size="4" maxlength="4" msg="연락처" valch="yes">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30"> 이메일</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-email">
                                        <input style="width:160px;" type="text" name="email" id="email" class="MS_input_txt" size="20" maxlength="40" value="" msg="이메일" valch="yes">
                                    	<a href="#" id="authemail"><img src="../resources/imgs/이메일인증.png" height="22px;"></a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30">휴대폰</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-mobile">
                                    	<input style="width:80px;height:21px" type="text" name="cp1" id="cp1" class="MS_input_txt" value="" msg="휴대전화" valch="yes"> -
                                        <input style="width:80px;height:21px" type="text" name="cp2" id="cp2" class="MS_input_txt" value="" size="4" maxlength="4" msg="휴대전화" valch="yes"> -
                                        <input style="width:80px;height:21px" type="text" name="cp3" id="cp3" class="MS_input_txt" value="" size="4" maxlength="4" msg="휴대전화" valch="yes">
                                        <!--<a href="javascript:checkcp();" onfocus="this.blur();"><img src="http://cdn-bikeselling.bizhost.kr/img/mem_btn_check.gif" align='absmiddle'></a>-->
                                        
                                    </div>
                                </td>
                            </tr>
                         </tbody>
                    </table>
                </div>
            <!-- #personInfo -->
            <div class="btn-area">
                <a href="javascript:member_check();">
                    <img alt="가입완료" src="http://cdn-bikeselling.bizhost.kr/img/btn_member_join1.gif">
                </a>
                &nbsp;
                <a href="Javascript:history.back();">
                    <img alt="돌아가기" src="http://cdn-bikeselling.bizhost.kr/img/btn_member_join_cancel.gif">
                </a>
            </div>
            
        </div></form>
    <!-- #join -->
    </div>
	</div>
</div>
<%@include file="MainFooter.jsp" %>

</body>
</html>