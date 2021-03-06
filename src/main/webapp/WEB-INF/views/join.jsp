<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>발자취 회원가입</title>
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
  <script src="../resources/js/postcode.v2.js"></script>	
  
    
<style>

</style>
<script type="text/javascript">
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
		if(window.location.href.indexOf("eng")!=-1){
			alert("Plese enter your ID");
			return;
		}else if(window.location.href.indexOf("china")!=-1){
			alert("请输入账户名。");
			return;
		}else{
			alert("아이디를 입력해주세요");
			return;
		}
	}
	$.ajax({
		url:'/checkid',
		data:{
			sid:id,
		},
		success:function(data){
			if(data==0){
				if(window.location.href.indexOf("eng")!=-1){
					alert("ID available");
				}else if(window.location.href.indexOf("china")!=-1){
					alert("可使用ID");
				}else{
					alert("아이디 사용가능");

				}
				
				$("#useridcheck").val(1);

				
			}
			else if(data==1){
					if(window.location.href.indexOf("eng")!=-1){
						alert("This ID already exists.");
					}else if(window.location.href.indexOf("china")!=-1){
						alert("已存在的ID");
					}else{
						alert("이미 존재하는 아이디입니다");
	
					}
				
			}
		}
	});
}
function emailcheck(){
  var email=$("#email").val();
	  $.ajax({
		  	url:"/emailcheck",
		  	data:{
		  		semail:email,
		  	},
		  	success:function(data){
		  		if(data==0){
		  			if(window.location.href.indexOf("eng")!=-1){
		  				alert("Email Enabled");
		  			}else if(window.location.href.indexOf("china")!=-1){
		  				alert("可以使用电子邮件");
		  			}else{
			  			alert("이메일 사용가능");
		  			}
		  			$("#useremailcheck").val(1);
		  		}else {
		  			if(window.location.href.indexOf("eng")!=-1){
		  				alert("This email is already in use.");
		  			}else if(window.location.href.indexOf("china")!=-1){
		  				alert("已经使用中的邮件。");
		  			}else{
		  				alert("이미 사용중인 이메일입니다");
		  			}
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


$(function(){
	var windowWidth = $( window ).width();
	var joinWidth=$("#joinform").width();
	 $("#join_responsive").css("width","609.98px");
	 $("#join_responsive").css("margin","auto");
	 $("#join_responsive").css("margin-top","150px");

	 if(windowWidth<=626){
		 $("#join_responsive").width(windowWidth-30);
	 }
	$(window).resize(function(){
		 windowWidth = $( window ).width();
		 joinWidth=$("#joinform").width();
		
		 if(windowWidth<=626){
			 $("#join_responsive").width(windowWidth-30);

		 }else{
			 $("#join_responsive").css("width","609.98px");
		 }
		console.log("폼크기"+joinWidth);
		console.log("윈도우 크기"+windowWidth);
	});
});

</script>
</head><!--/head-->
<body>
<%@include file="Header.jsp" %>

    
    <div id="content-wrapper" style="margin-top:-30px;">
        <div id="join_responsive">
        		<script type="text/javascript">
        		if(window.location.href.indexOf("eng")!=-1){
        			document.write("<h3>JOIN</h3>");
        		}else if(window.location.href.indexOf("china")!=-1){
        			document.write("<h3>加入会员 </h3>");
        		}else{
        			document.write("<h3>회원가입</h3>");
        		}
        		</script>
        		<script>
        		if(window.location.href.indexOf("eng")!=-1){
            		document.write("<form role='joinform' id='joinform' action='/eng/join' method='post'>");

        		}else if(window.location.href.indexOf("china")!=-1){
            		document.write("<form role='joinform' id='joinform' action='/china/join' method='post'>");

        		}else{
            		document.write("<form role='joinform' id='joinform' action='/join' method='post'>");

        		}
        		</script>
                    <div class="form-group">
                    <script>
                	if(window.location.href.indexOf("eng")!=-1){
            			document.write("<label for='inputName'>NAME</label>");
            			document.write("<input type='text' class='form-control' id='name' name='user_name' required placeholder='Enter a name'>");

            		}else if(window.location.href.indexOf("china")!=-1){
            			document.write("<label for='inputName'>名</label>");
            			document.write("<input type='text' class='form-control' id='name' name='user_name' required placeholder='请输入名字。''>");
            		}else{
            			document.write("<label for='inputName'>이름</label>");
            			document.write("<input type='text' class='form-control' id='name' name='user_name' required placeholder='이름을 입력해주세요'>");
            		}
                    </script>
                    </div>
                     <div class="form-group">
                     <script>
                     if(window.location.href.indexOf("eng")!=-1){
             			document.write("<label for='InputId'>ID</label>");
             			document.write("<input type='text' class='form-control' id='userid' name='user_id' required placeholder='Enter a ID'>");
						document.write("<button type='button' class='btn btn-primary' style='margin-top:10px' onclick='idcheck()'>ID redundancy check </button>");
             		}else if(window.location.href.indexOf("china")!=-1){
             			document.write("<label for='InputId'>用户名</label>");
             			document.write("<input type='text' class='form-control' id='userid' name='user_id' required placeholder='请输入账户名。'>");
						document.write("<button type='button' class='btn btn-primary' style='margin-top:10px' onclick='idcheck()'>用户名重复确认 </button>");

             		}else{
             			document.write("<label for='InputId'>아이디</label>");
             			document.write("<input type='text' class='form-control' id='userid' name='user_id' required placeholder='아이디를 입력해주세요'>");
						document.write("<button type='button' class='btn btn-primary' style='margin-top:10px' onclick='idcheck()'>아이디 중복확인 </button>");

             		}
                   
                     </script>
                    	 <input type="hidden" id="useridcheck" value="0">

                    </div>
                    <div class="form-group">
                    <script>
	                    if(window.location.href.indexOf("eng")!=-1){
	                    	document.write("<label for='inputPassword'>PASSWORD</label>");
	             			document.write("<input type='password' class='form-control' id='passwd' name='user_pw' oninput='checkPwd()' required placeholder='Please combine letters and numbers into 10 to 15 digits for the password.''>");
	                    }else if(window.location.href.indexOf("china")!=-1){
	                    	document.write("<label for='inputPassword'>密码</label>");
	             			document.write("<input type='password' class='form-control' id='passwd' name='user_pw' oninput='checkPwd()' required placeholder='密码请将文字和数字组合成10~15位.''>");

	             		}else{
	             			document.write("<label for='inputPassword'>비밀번호</label>");
	             			document.write("<input type='password' class='form-control' id='passwd' name='user_pw' oninput='checkPwd()' required placeholder='비밀번호는 문자와 숫자를 조합하여 10~15자리로 만들어 주세요.'>");

	             		}	
                    </script>
                    </div>
                    <div class="form-group">
                    <script>
                    	if(window.location.href.indexOf("eng")!=-1){
                    		document.write("<label for='inputPasswordCheck'>REPASSWORD</label>");
                    		document.write("<input type='password' class='form-control' id='repasswd' name='repasswd' oninput='checkPwd()' required placeholder='Please enter your password again to confirm it.'>");
                    	}else if(window.location.href.indexOf("china")!=-1){
                    		document.write("<label for='inputPasswordCheck'>密码确认</label>");
                    		document.write("<input type='password' class='form-control' id='repasswd' name='repasswd' oninput='checkPwd()' required placeholder='为了确认密码请重新输入一次。'>");

                    	}else{
                    		document.write("<label for='inputPasswordCheck'>비밀번호 확인</label>");
                    		document.write("<input type='password' class='form-control' id='repasswd' name='repasswd' oninput='checkPwd()' required placeholder='비밀번호 확인을 위해 다시한번 입력 해 주세요'>");

                    	}
                    </script>
                    </div>
                    
                    <div class="form-group">
                    <script>
                    	if(window.location.href.indexOf("eng")!=-1){
                        	document.write("<label for='InputEmail'>EMAIL</label>");
                    		document.write("<input type='email' class='form-control' id='email' name='email'  required  placeholder='please enter your email'>");
                    		document.write("<button type='button' class='btn btn-primary' style='margin-top:10px;' onclick='emailcheck()'>Check for duplicate email");
                    	}else if(window.location.href.indexOf("china")!=-1){
                        	document.write("<label for='InputEmail'> 电子邮件</label>");
                    		document.write("<input type='email' class='form-control' id='email' name='email'  required  placeholder='请输入电子邮件'>");
                    		document.write("<button type='button' class='btn btn-primary' style='margin-top:10px;' onclick='emailcheck()'>确认邮件重复");

                    	}else{
                    		document.write("<label for='InputEmail'>이메일</label>");
                    		document.write("<input type='email' class='form-control' id='email' name='email'  required  placeholder='이메일 주소를 입력해주세요'>");
                    		document.write("<button type='button' class='btn btn-primary' style='margin-top:10px;' onclick='emailcheck()'>이메일 중복확인");

                    	}
                    </script>
                        <input type="hidden" id="useremailcheck" value="0">
                
                    </div>
                    <div class="form-group">
                    <script>
                    	if(window.location.href.indexOf("eng")!=-1){
                    		document.write("<label for='inputMobile'>PhoneNumber</label>");
                    		document.write("<input type='tel' class='form-control' id='phone'  name='phone' required placeholder='Enter cell phone number without -.'>");
                    	}else if(window.location.href.indexOf("china")!=-1){
                    		document.write("<label for='inputMobile'>手机号</label>");
                    		document.write("<input type='tel' class='form-control' id='phone'  name='phone' required placeholder='请输入没有手机号码的电话号码。'>");

                    	}else{
                    		document.write("<label for='inputMobile'>휴대폰 번호</label>");
                    		document.write("<input type='tel' class='form-control' id='phone'  name='phone' required placeholder='-없이 휴대폰번호를 입력해 주세요'>");
                    	}
                    </script>
                    </div>
               
                    <div class="form-group text-center">
                    <script>
                    	if(window.location.href.indexOf("eng")!=-1){
                    		document.write("<button type='submit' id='join-submit' class='btn btn-primary'>JOIN<i class='fa fa-check spaceLeft'></i></button>");
                    		document.write("<button type='reset' class='btn btn-warning'>CANCELLATION<i class='fa fa-times spaceLeft'></i></button>");
                    	}else if(window.location.href.indexOf("china")!=-1){
                    		document.write("<button type='submit' id='join-submit' class='btn btn-primary'>加入会员<i class='fa fa-check spaceLeft'></i></button>");
                    		document.write("<button type='reset' class='btn btn-warning'>取消<i class='fa fa-times spaceLeft'></i></button>");

                    	}else{
                    		document.write("<button type='submit' id='join-submit' class='btn btn-primary'>회원가입<i class='fa fa-check spaceLeft'></i></button>");
                    		document.write("<button type='reset' class='btn btn-warning'>취소<i class='fa fa-times spaceLeft'></i></button>");

                    	}
                    </script>
                     
                 
                    </div>

				</form>
				</div>
        
        
        </div>

<%@include file="Footer.jsp" %>


</body>
</html>