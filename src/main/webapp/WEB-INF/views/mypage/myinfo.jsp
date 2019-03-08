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
    <title>정보수정</title>
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
   		$("#join-submit").click(function(e){
    		e.preventDefault();

			var pw1=$("#passwd").val();
			var pw2=$("#repasswd").val();
			
			if(pw1!=pw2){
        		if(window.location.href.indexOf("eng")!=-1){
        			alert("Please check that PASSWORD and REPASSWORD are same.");
        		}else if(window.location.href.indexOf("china")!=-1){
        			alert("密码各不相同。");
        		}else{
        			alert("비밀번호가 서로 다릅니다.");
        		}
			}else{
				var user_id = $("#userid").val();
				var user_name = $("#name").val();
				var user_pw = $("#passwd").val();
				var phone = $("#phone").val();
				
				$.ajax({
		    		  url:"/myupdate",
		    		  type:'post',
		    		  data:{
		    		  	user_id:user_id,
		    		  	user_name:user_name,
		    		  	user_pw:user_pw,
		    		  	phone:phone,
		    		  },
		    		  success:function(data){
			        		if(window.location.href.indexOf("eng")!=-1){
		        				alert("The account information has been updated.");
		        	        	window.location.href="/eng/myinfo";
		        			}else if(window.location.href.indexOf("china")!=-1){
		        				alert("帐户信息已更新。");
		        	        	window.location.href="/china/myinfo";
		        			}else{
		        				alert("정보수정이 성공적으로 완료되었습니다.");
		        	        	window.location.href="/myinfo";
		        			}
		    		  }	
	    		});
			}
    	});
	});
	
	$(function(){
		var windowWidth = $( window ).width();
		var joinWidth=$("#joinform").width();
		
		 if(windowWidth<=626){
			 $("#joinform").width(windowWidth-30);
		 }else{
			 $("#joinform").width(600);

		 }
		 
		$(window).resize(function(){
			 windowWidth = $( window ).width();
			 joinWidth=$("#joinform").width();
			
			 if(windowWidth<=626){
				 $("#joinform").width(windowWidth-30);
			 }else{
				 $("#joinform").width(600);

			 }
			console.log("폼크기"+joinWidth);
			console.log("윈도우 크기"+windowWidth);
		});
	});
	
	</script>
    <style>
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
<!-- 내 정보 수정 페이지 (가입 페이지에서 아이디 체크, 이메일 체크 스크립트 들어낸 코드) -->
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
        <section id="portfolio" class="white">
            <div class="container">
                <div class="gap"></div>
                <div class="row">
                    
                
                    <div id="join_responsive" class="col-md-10 fade-up" style="width:100%;height:100%;">
                    <ul class="portfolio-filter fade-down center">
                        
                        <li><a class="btn btn-outlined btn-primary" id="mypage_jim" href="#" data-filter="*">
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
                           <li><a class="btn btn-outlined btn-primary active" id='myinfo' href="#" data-filter="*">
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
		        	
		                <script type="text/javascript">
			        		if(window.location.href.indexOf("eng")!=-1){
			        			document.write("<form role=\"joinform\" id=\"joinform\" style='width:600px;margin:auto;'  method=\"post\">");
			        		}else if(window.location.href.indexOf("china")!=-1){
			        			document.write("<form role=\"joinform\" id=\"joinform\" style='width:600px;margin:auto;' method=\"post\">");
			        		}else{
			        			document.write("<form role=\"joinform\" id=\"joinform\" style='width:600px;margin:auto;'  method=\"post\">");
			        		}
		        		</script>
		                	<c:forEach items="${memberList}" var="MemberVO" varStatus="status">
		                    <div class="form-group">
			                    <script>
			                	if(window.location.href.indexOf("eng")!=-1){
			            			document.write("<label for='inputName'>NAME</label>");
			            			document.write("<input type='text' class='form-control' id='name' name='user_name' value='${MemberVO.user_name}' required placeholder='Enter a name'>");
			
			            		}else if(window.location.href.indexOf("china")!=-1){
			            			document.write("<label for='inputName'>名</label>");
			            			document.write("<input type='text' class='form-control' id='name' name='user_name' value='${MemberVO.user_name}' required placeholder='请输入名字。''>");
			            		}else{
			            			document.write("<label for='inputName'>이름</label>");
			            			document.write("<input type='text' class='form-control' id='name' name='user_name' value='${MemberVO.user_name}' required placeholder='이름을 입력해주세요'>");
			            		}
			                    </script>
		                     </div>
		                     <div class="form-group">
		                        <label for="InputId">
		                        	<script type="text/javascript">
					        		if(window.location.href.indexOf("eng")!=-1){
					        			document.write("ID");
					        		}else if(window.location.href.indexOf("china")!=-1){
					        			document.write("用户名");
					        		}else{
					        			document.write("아이디");
					        		}
					        		</script>
								</label><br>
			                    <b>${MemberVO.user_id}</b>
			                    <input type="hidden" id="userid" name="user_id" value="${MemberVO.user_id}"><br>
			                    <span><small><b>
		                        	<script type="text/javascript">
					        		if(window.location.href.indexOf("eng")!=-1){
					        			document.write("* ID cannot be modified.");
					        		}else if(window.location.href.indexOf("china")!=-1){
					        			document.write("* 用户名无法修改。");
					        		}else{
					        			document.write("* 아이디는 변경이 불가합니다.");
					        		}
					        		</script>
								</b></small></span>
		
		                    </div>
		                    <div class="form-group">
			                    <script>
				                    if(window.location.href.indexOf("eng")!=-1){
				                    	document.write("<label for='inputPassword'>PASSWORD</label>");
				             			document.write("<input type='password' class='form-control' id='passwd' name='user_pw' oninput='checkPwd()' value='${MemberVO.user_pw}' required placeholder='Please combine letters and numbers into 10 to 15 digits for the password.''>");
				                    }else if(window.location.href.indexOf("china")!=-1){
				                    	document.write("<label for='inputPassword'>密码</label>");
				             			document.write("<input type='password' class='form-control' id='passwd' name='user_pw' oninput='checkPwd()' value='${MemberVO.user_pw}' required placeholder='密码请将文字和数字组合成10~15位.''>");
			
				             		}else{
				             			document.write("<label for='inputPassword'>비밀번호</label>");
				             			document.write("<input type='password' class='form-control' id='passwd' name='user_pw' oninput='checkPwd()' value='${MemberVO.user_pw}' required placeholder='비밀번호는 문자와 숫자를 조합하여 10~15자리로 만들어 주세요.'>");
				             		}	
			                    </script>
		                    </div>
		                    <div class="form-group">
			                    <script>
			                    	if(window.location.href.indexOf("eng")!=-1){
			                    		document.write("<label for='inputPasswordCheck'>REPASSWORD</label>");
			                    		document.write("<input type='password' class='form-control' id='repasswd' name='repasswd' oninput='checkPwd()' value='${MemberVO.user_pw}' required placeholder='Please enter your password again to confirm it.'>");
			                    	}else if(window.location.href.indexOf("china")!=-1){
			                    		document.write("<label for='inputPasswordCheck'>密码确认</label>");
			                    		document.write("<input type='password' class='form-control' id='repasswd' name='repasswd' oninput='checkPwd()' value='${MemberVO.user_pw}' required placeholder='为了确认密码请重新输入一次。'>");
			
			                    	}else{
			                    		document.write("<label for='inputPasswordCheck'>비밀번호 확인</label>");
			                    		document.write("<input type='password' class='form-control' id='repasswd' name='repasswd' oninput='checkPwd()' value='${MemberVO.user_pw}' required placeholder='비밀번호 확인을 위해 다시한번 입력 해 주세요'>");
			                    	}
			                    </script>
		                    </div>
		                    <div class="form-group">
		                        <label for="InputEmail">
		                        	<script type="text/javascript">
					        		if(window.location.href.indexOf("eng")!=-1){
					        			document.write("EMAIL");
					        		}else if(window.location.href.indexOf("china")!=-1){
					        			document.write("电子邮件");
					        		}else{
					        			document.write("이메일");
					        		}
					        		</script>
								</label><br>
		                        <b>${MemberVO.email}</b>
			                    <input type="hidden" name="email" value="${MemberVO.email}"><br>
			                    <span><small><b>
		                        	<script type="text/javascript">
					        		if(window.location.href.indexOf("eng")!=-1){
					        			document.write("* EMAIL cannot be modified.");
					        		}else if(window.location.href.indexOf("china")!=-1){
					        			document.write("* 电子邮件无法修改。");
					        		}else{
					        			document.write("* 이메일 변경이 불가합니다.");
					        		}
					        		</script>
								</b></small></span>
		                 
		                    </div>
		                    <div class="form-group">
			                    <script>
			                    	if(window.location.href.indexOf("eng")!=-1){
			                    		document.write("<label for='inputMobile'>PhoneNumber</label>");
			                    		document.write("<input type='tel' class='form-control' id='phone' name='phone' value='${MemberVO.phone}' required placeholder='Enter cell phone number without -.'>");
			                    	}else if(window.location.href.indexOf("china")!=-1){
			                    		document.write("<label for='inputMobile'>手机号</label>");
			                    		document.write("<input type='tel' class='form-control' id='phone' name='phone' value='${MemberVO.phone}' required placeholder='请输入没有手机号码的电话号码。'>");
			
			                    	}else{
			                    		document.write("<label for='inputMobile'>휴대폰 번호</label>");
			                    		document.write("<input type='tel' class='form-control' id='phone' name='phone' value='${MemberVO.phone}' required placeholder='-없이 휴대폰번호를 입력해 주세요'>");
			                    	}
			                    </script>
		                    </div>
		                   <!-- 정보수정이 성공하면 성공 페이지로 이동 -->
		                    <div class="form-group text-center">
		                        <button type="button" id="join-submit" class="btn btn-primary">
		                        	<script type="text/javascript">
					        		if(window.location.href.indexOf("eng")!=-1){
					        			document.write("Submit");
					        		}else if(window.location.href.indexOf("china")!=-1){
					        			document.write("信息修正");
					        		}else{
					        			document.write("정보수정");
					        		}
					        		</script>
									<i class="fa fa-check spaceLeft"></i>
		                        </button>
		                        <button type="reset" class="btn btn-warning">
		                        	<script type="text/javascript">
					        		if(window.location.href.indexOf("eng")!=-1){
					        			document.write("Cancel");
					        		}else if(window.location.href.indexOf("china")!=-1){
					        			document.write("取消修改");
					        		}else{
					        			document.write("수정취소");
					        		}
					        		</script>
									<i class="fa fa-times spaceLeft"></i>
		                        </button>
		                    </div>
		                    </c:forEach>
						</form>
                </div><!-- row -->  
                <div class="gap"></div>
            </div>
            </div>
        </section><!-- section -->
    </div>

<%@include file="../Footer.jsp" %>


</body>
</html>