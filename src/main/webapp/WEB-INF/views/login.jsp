<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>발자취 로그인</title>
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
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  
    
 <style type="text/css">
    
		    @import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);
		.jh{font-family: 'Jeju Hallasan', cursive;}
		
		
		.modal {
		        text-align: center;
		}
		
		
		 
		@media screen and (min-width: 768px) { 
		        .modal:before {
		                display: inline-block;
		                vertical-align: middle;
		                content: " ";
		                height: 100%;
		        }
		}
		 
		.modal-dialog {
		        display: inline-block;
		        text-align: left;
		        vertical-align: middle;
		}
		#single-page-slider {
			background-image: url("../resources/imgs/banner/login-banner.jpg");
			bakcground-color: #A9A9A9;
			background-size: cover;
			background-repeat: no-repeat;
			background-position: center;
		}
		    
    </style>
<script type="text/javascript">
$(function(){
	var windowWidth=$(window).width();
	
	
	if(windowWidth<=768){
		$(".modal-content").css("width","382.99px");
		$("#modal-find2").css("margin-left","115px");
		$("#modal-find").css("margin-left","115px");

		//$(".modal-content").width(600);
		$(".modal-content").css("margin-top","120px");
		$("#modal_name").css("left",0);
		$("#modal_name").css("top",0);
		$("#modal_name2").css("left",0);
		$("#modal_name2").css("top",0);
		}else{
			$(".modal-content").css("width","600px");
			$(".modal-content").css("margin-top","0px");
			$("#modal-find2").css("margin-left","215px");
			$("#modal-find").css("margin-left","215px");

		}
	
	$(window).resize(function(){
		windowWidth=$(window).width();
		console.log(windowWidth);
		/*
		if(windowWidth<=893){
			$(".row").css("width","355px");
			$(".row").css("margin","auto");
		}else{
			$(".row").css("width","1170px");

		}*/
		if(windowWidth<=768){
		$(".modal-content").css("width","382.99px");
		$("#modal-find").css("margin-left","115px");
		$("#modal-find2").css("margin-left","115px");
		$(".col-sm-2").css("left",0);
		$(".col-sm-2").css("top",0);
		//$(".modal-content").width(600);
		$(".modal-content").css("margin-top","120px");

		}else{
			$(".modal-content").css("width","600px");
			$(".modal-content").css("margin-top","0px");
			$("#modal-find").css("margin-left","215px");

			$("#modal-find2").css("margin-left","215px");
			$("#modal_name").css("left","100px");
			$("#modal_name").css("top","-30px");
			$("#modal_email").css("left","100px");
			$("#modal_name2").css("left","100px");
			$("#modal_name2").css("top","-30px");
			$("#modal_email2").css("left","100px");
			$("#modal_Id2").css("left","100px");
			$("#modal_Phone2").css("left","100px");
			
		}
		

	});

	$("#btnbn").click(function(e){
		
		e.preventDefault();
		
		
		var id=$("#member_idid").val();
		var pw=$("#member_pw").val();
	
		
		$.ajax({
			url:"/login",
			type:'post',
			data:{
				sid:id,
				spw:pw,
			},
			success:function(data){
				 if(data==2){
					window.location.href="http://localhost:8181/";
				 }else if(data==0){
					 alert("아이디/비밀번호를 확인해주세요");
				 }else if(data==1){
					 alert("이메일 인증을 해주세요");
				 }
			}
		});
	});
});

//ID찾기
  	
  $(function(){
	  $("#findBtn").click(function(e){
	//	  alert("gi");
		  e.preventDefault();
		//  alert("아이디 찾기중....");
		
		 var email=$("#find_email").val(); 
		 var name=$("#find_name").val();
		 
	//	 alert(name);
	//	 alert(email);
		 
		 $.ajax({
			 url:"/find_id",
		 	 type:'post',
		 	 data:{
		 		 sname:name,
		 		 semail:email
		 	 },
		 	 success:function(data){
		 		 if(data!=""){
		 			 if(window.location.href.indexOf("eng")!=-1){
			 				$("#eid").html("ID IS"+data);

		 			 }else if(window.location.href.indexOf("china")!=-1){
			 				$("#eid").html("用户名 "+data+"是的.");

		 			 }else{
			 				$("#eid").html("아이디는 "+data+"입니다");
		 			 }
		 		 }else{
		 			 if(window.location.href.indexOf("eng")!=-1){
				 			$("#eid").html("No matching ID.");

		 			 }else if(window.location.href.indexOf("china")!=-1){
				 			$("#eid").html("没有一致的用户名");
		 			 }else{
				 			$("#eid").html("일치하는 아이디가 없습니다");
		 			 }
		 		 }

		 	}   
		 });
	  });
  });
  
  
  //비밀번호 찾기
  
    $(function(){
	  $("#findBtn1").click(function(e){
		  e.preventDefault();
	//	  alert("비밀번호 찾기중....");
		  
		 var id=$("#find_id1").val(); 
		 var name=$("#find_name1").val();
		 var phone=$("#find_phone").val();
			
		 var email=$("#find_email1").val();
		 
	//	 alert(id);
	//	 alert(name);
	/* 	 alert(phone1);
		 alert(phone2);
		 alert(phone3);
		 alert(email); */
		 
		 $.ajax({
			 url:"/find_pw",
		 	 type:'post',
		 	 async:false,
		 	 data:{
		 		 tid:id,
		 		 tname:name,
		 		 tphone:phone,
		 		 temail:email
		 	 },
		 	 success:function(data){
		 		   $(document).ready(function() {
		 			    var fpw= data;
		 			  //  alert("kkkkkk"+fpw);
		 			  if(fpw!=""){
		 			    $("#tpw").html("귀하의 이메일로 비밀번호를 발송하였습니다");
		 			  }else{
			 			    $("#tpw").html("일치하는 회원이 없습니다");

		 			  }
		 			    });  
		 	}   
		 });
	  });
  });
</script>
</head><!--/head-->
<body>
<%@include file="Header.jsp" %>

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
                                    		document.write("<h2 class='main-title'>LOGIN</h2>");
                                    	}else if(window.location.href.indexOf("china")!=-1){
                                    		document.write("<h2 class='main-title'>登录</h2>");
                                    	}else{
                                    		document.write("<h2 class='main-title'>로그인</h2>");
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
<form method="post" style="width:350px; margin:auto;">  
  <div class="big-gap"></div>
  <div class="row">
     <div class="">
       <div class="input-group">
   <span class="input-group-addon"><img alt="" src="../resources/imgs/people2.png" style="width: 18px; height: 18px;"></span>
   <script>
   		if(window.location.href.indexOf("eng")!=-1){
   			document.write("<input type='text' class='form-control input-lg' id='member_idid' aria-describedby='inputSuccess4Status' placeholder='&ensp;ID' style='width:100%'>");
   		}else if(window.location.href.indexOf("china")!=-1){
   			document.write("<input type='text' class='form-control input-lg' id='member_idid' aria-describedby='inputSuccess4Status' placeholder='&ensp;身份证' style='width:100%'>");

   		}else{
   			document.write("<input type='text' class='form-control input-lg' id='member_idid' aria-describedby='inputSuccess4Status' placeholder='&ensp;아이디' style='width:100%'>");

   		}
   </script>  
   </div>  
	</div>
</div>
	            
<div class="row" style="margin-bottom: 5px;">
   <div class="">
     <div class="input-group">
 		<span class="input-group-addon"><img alt="" src="../resources/imgs/lock3.png" style="width: 18px; height: 18px;"></span>
		<script>
			if(window.location.href.indexOf("eng")!=-1){
				document.write("<input type='password' class='form-control input-lg' id='member_pw' aria-describedby='inputGroupSuccess3Status' placeholder='&ensp;PASSWORD'  style='width:100%'>");
			}else if(window.location.href.indexOf("china")!=-1){
				document.write("<input type='password' class='form-control input-lg' id='member_pw' aria-describedby='inputGroupSuccess3Status' placeholder='&ensp;密码'  style='width:100%'>");

			}else {
				document.write("<input type='password' class='form-control input-lg' id='member_pw' aria-describedby='inputGroupSuccess3Status' placeholder='&ensp;비밀번호'  style='width:100%'>");
			}
		</script>
		
 	</div> 
   </div>
</div>
	            
<div class="row" >
    <div class="">
    <script>
    	if(window.location.href.indexOf("eng")!=-1){
    		document.write("<button type='button' class='btn btn-default btn-lg' id='btnbn' style='width:100%; font-weight:bolder;'>LOGIN</button>");
    	}else if(window.location.href.indexOf("china")!=-1){
    		document.write("<button type='button' class='btn btn-default btn-lg' id='btnbn' style='width:100%; font-weight:bolder;'>登录</button>");

    	}else{
    		document.write("<button type='button' class='btn btn-default btn-lg' id='btnbn' style='width:100%; font-weight:bolder;'>로그인</button>");

    	}
    </script>
   		
   </div>
</div>
</form>

<div class="row" style="margin-bottom: 9px; width: 380px;  margin-left: auto; margin-right: auto;">
    <div class=""><!-- 
   	<button type="button" class="btn btn-default btn-lg" id="btbtn" style="width:60%; font-weight:bolder;">Sign up</button> -->
   	<script>
   		if(window.location.href.indexOf("eng")!=-1){
   			document.write("<button type='button' class='btn btn-default btn-lg'  style='width:49.5%; font-weight:bolder;' data-target='#exampleModalCenter' data-toggle='modal' >FIND ID</button>");
   			document.write("<button type='button' class='btn btn-default btn-lg'  style='width:49.5%; font-weight:bolder;' data-target='#exampleModalCenter1' data-toggle='modal' >FIND PASSWORD</button>");

   		}else if(window.location.href.indexOf("china")!=-1){
   			document.write("<button type='button' class='btn btn-default btn-lg'  style='width:49.5%; font-weight:bolder;' data-target='#exampleModalCenter' data-toggle='modal' >寻找用户名</button>");
   			document.write("<button type='button' class='btn btn-default btn-lg'  style='width:49.5%; font-weight:bolder;' data-target='#exampleModalCenter1' data-toggle='modal' >寻找密码</button>");

   		}else{
   			document.write("<button type='button' class='btn btn-default btn-lg'  style='width:49.5%; font-weight:bolder;' data-target='#exampleModalCenter' data-toggle='modal' >아이디 찾기</button>");
   			document.write("<button type='button' class='btn btn-default btn-lg'  style='width:49.5%; font-weight:bolder;' data-target='#exampleModalCenter1' data-toggle='modal' >비밀번호 찾기</button>");

   		}
   	</script>
   <!-- 		<span style="margin-left: 15px;"><a data-toggle="modal"  data-target="#exampleModalCenter" style="text-decoration: none; font-weight: bold; font-size: 14px;">ID /</a></span>
      	<span><a data-toggle="modal"  data-target="#exampleModalCenter1" style="text-decoration: none; font-weight: bold; font-size: 14px;">Password 찾기</a></span>
    
    --></div>
</div>

	<div class="row" style="margin-bottom: 0px; width: 380px;  margin-left: auto; margin-right: auto; margin-top: 10px; border-top: 1.3px solid gray; padding-top: 15px;" >
    <div class="">
    <script>
    	if(window.location.href.indexOf("eng")!=-1){
    		document.write("<a href='/eng/join' class='btn btn-default btn-lg' id='btbtn' style='width:100%; font-weight:bolder; '>SIGN UP</a>");
    	}else if(window.location.href.indexOf("china")!=-1){
    		document.write("<a href='/china/join' class='btn btn-default btn-lg' id='btbtn' style='width:100%; font-weight:bolder; '>注册会员</a>");
    	}else{
    		document.write("<a href='/join' class='btn btn-default btn-lg' id='btbtn' style='width:100%; font-weight:bolder; '>회원가입</a>");

    	}
    </script>
   </div>
</div>
 <div class="row">
	 <div class="" style="width: 380px; margin: auto; padding-top: 2px;" >
	 	
	     <span><a href="${url} "><img src="../resources/imgs/loginbtn-naver.png" style="width: 188px; height: 39px; position: relative; margin-left: 0px;"></a></span>  
		 <span><a id="custom-login-btn" href="javascript:loginWithKakao()">
			<img src="../resources/imgs/loginbtn-kakao.png" style="width: 188px; height: 39px; position: relative; margin-left: 0px;">
			   </a>
		 </span>
			  <script type="text/javascript">
				      // 사용할 앱의 JavaScript 키를 설정해 주세요.
				      Kakao.init('976f456333f18614366222d9de9153d7');
				      // 카카오 로그인 버튼을 생성합니다.
				     // Kakao.Auth.createLoginButton({
				    //   container: '#kakao-login-btn',
				    
				    function loginWithKakao(){
				    	Kakao.Auth.login({
				        success: function(authObj) {
				          // 로그인 성공시, API를 호출합니다.
			  
				          
				            Kakao.API.request({
					            url: '/v2/user/me',
					            success: function(res) {
					              console.log(JSON.stringify(res.kaccount_email));
					              console.log(JSON.stringify(res.id));
					              //sessionStorage.setItem("id", res.id);
					              //window.location.href="http://localhost:8080/";
								$.ajax({
									url:"/kakao/login/"+res.id,
									type:'get',
									success:function(data)
									{
										if(data==1){
										window.location.href="http://localhost:8181/";
										}
									}
								});
				            },
				            fail: function(error) {
				              alert(JSON.stringify(error));
				            }
				          });    
				        },
				        fail: function(err) {
				          alert(JSON.stringify(err));
				        }
						 });
							};
		
			</script>		
		</div>      	 
	</div>


</div>

    <%@include file="Footer.jsp" %>
    
    
    <!--아이디 찾기 Modal -->
				<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document">
				  <!-- Modal Content -->
				    <div class="modal-content">
				      <div class="modal-header">
				      	<script>
				      		if(window.location.href.indexOf("eng")!=-1){
								document.write("<h3 class='modal-title' id='exampleModalLongTitle' style='font-weight: bold; position: relative; top: 10px; left: 10px;'>FIND ID</h3>");
				      		}else if(window.location.href.indexOf("china")!=-1){
								document.write("<h3 class='modal-title' id='exampleModalLongTitle' style='font-weight: bold; position: relative; top: 10px; left: 10px;'>寻找用户名</h3>");
				      		}else{
								document.write("<h3 class='modal-title' id='exampleModalLongTitle' style='font-weight: bold; position: relative; top: 10px; left: 10px;'>아이디 찾기</h3>");
				      		}
				      		
				      	</script>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				   <!-- body -->
				      <div class="modal-body">
				      	<div style="border-bottom: 1.5px solid gray">
				      		<img alt="" id="modal-find" src="../resources/imgs/find.png" style="width:128px; height:128px; margin-left:215px; margin-bottom:10px;">
				      		<script>
				     			if(window.location.href.indexOf("eng")!=-1){
				     				document.write("<p style='text-align:center; font-size: 13px;'>Enter your name and email to find your ID.</p>");
				     			}else if(window.location.href.indexOf("china")!=-1){
				     				document.write("<p style='text-align:center; font-size: 13px;'>请输入姓名和邮箱查找用户名</p>");
				     			}else{
				     				document.write("<p style='text-align:center; font-size: 13px;'>이름과 이메일을 입력하여 아이디를 찾아보세요</p>");

				     			}
				      		</script>
				      		
				      		
				     
				      		
				      	</div>
				      	<form class="form-horizontal" method="post">
						  <div class="form-group" style="margin-top: 60px; ">
						  <script>
						  		if(window.location.href.indexOf("eng")!=-1){
						  			document.write("<label for='id' id='modal_name' class='col-sm-2' style='font-weight: bold; font-size: 16px; position: relative; left: 100px; top:-30px;'>NAME</label>");
						  			document.write("<div class='col-sm-8'>");
						  			document.write("<input type='text' class='form-control' id='find_name' placeholder='NAME' style='position:relative;'>");
						  		}else if(window.location.href.indexOf("china")!=-1){
						  			document.write("<label for='id' id='modal_name' class='col-sm-2' style='font-weight: bold; font-size: 16px; position: relative; left: 100px; top:-30px;'>名</label>");
						  			document.write("<div class='col-sm-8'>");
						  			document.write("<input type='text' class='form-control' id='find_name' placeholder='名' style='position:relative;'>");
						  		}else{
						  			document.write("<label for='id' id='modal_name' class='col-sm-2' style='font-weight: bold; font-size: 16px; position: relative; left: 100px; top:-30px;'>이름</label>");
						  			document.write("<div class='col-sm-8'>");
						  			document.write("<input type='text' class='form-control' id='find_name' placeholder='이름' style='position:relative;'>");
						  		}
						  </script>
						  
						     </div>
						  </div>
						   <div class="form-group" style="">
						   	<script>
						   		if(window.location.href.indexOf("eng")!=-1){
						   			document.write("<label for='inputEmail3' id='modal_email' class='col-sm-2' style='font-weight: bold; font-size: 14px; position: relative; left: 100px;'>EMAIL</label><br>");
						   			document.write("<div class='col-sm-8'>");
						   			document.write("<input type='email' class='form-control' id='find_email' placeholder='EMAIL'>");
						   		}else if(window.location.href.indexOf("china")!=-1){
						   			document.write("<label for='inputEmail3' id='modal_email' class='col-sm-2' style='font-weight: bold; font-size: 14px; position: relative; left: 100px;'>电子邮件</label><br>");
						   			document.write("<div class='col-sm-8'>");
						   			document.write("<input type='email' class='form-control' id='find_email' placeholder='电子邮件'>");
						   		}else{
						   			document.write("<label for='inputEmail3' id='modal_email' class='col-sm-2' style='font-weight: bold; font-size: 14px; position: relative; left: 100px;'>이메일</label><br>");
						   			document.write("<div class='col-sm-8'>");
						   			document.write("<input type='email' class='form-control' id='find_email' placeholder='이메일'>");
						   		}
						   	</script>
						   
						        <br>
						    </div>
						  </div>
					  </div>
				      <div class="modal-footer">
				      <script>
				      		if(window.location.href.indexOf("eng")!=-1){
				      			document.write("<button type='button' class='btn btn-primary' id='findBtn' data-toggle='modal' data-target='#exampleModal'>FIND</button>");
				      			document.write("<button type='button' class='btn btn-secondary' data-dismiss='modal'>ClOSE</button");
				      		}else if(window.location.href.indexOf("china")!=-1){
				      			document.write("<button type='button' class='btn btn-primary' id='findBtn' data-toggle='modal' data-target='#exampleModal'>寻找</button>");
				      			document.write("<button type='button' class='btn btn-secondary' data-dismiss='modal'>关闭</button");
				      		}else{
				      			document.write("<button type='button' class='btn btn-primary' id='findBtn' data-toggle='modal' data-target='#exampleModal'>찾기</button>");
				      			document.write("<button type='button' class='btn btn-secondary' data-dismiss='modal'>닫기</button");
				      		}
				      </script>
	
				        </form>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- Modal안에 모달 -->
					<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					      <script>
					      	if(window.location.href.indexOf("eng")!=-1){
					      		document.write("<h5 class='modal-title' id='exampleModalLabel'>ID</h5>");
					      		document.write("<button type='button' class='close' data-dismiss='modal' aria-label='ClOSE'><span aria-hidden='true'>&times;</span></button>");
					      	}else if(window.location.href.indexOf("china")!=-1){
					      		document.write("<h5 class='modal-title' id='exampleModalLabel'>用户名</h5>");
					      		document.write("<button type='button' class='close' data-dismiss='modal' aria-label='关闭'><span aria-hidden='true'>&times;</span></button>");
					      	}else{
					      		document.write("<h5 class='modal-title' id='exampleModalLabel'>아이디</h5>");
					      		document.write("<button type='button' class='close' data-dismiss='modal' aria-label='닫기'><span aria-hidden='true'>&times;</span></button>");
					      	}
					      </script>
					    
					      </div>
					      <!-- ID결과 -->
					      <div class="modal-body">
					       <h4 style="text-align: center" id="eid"></h4>
					      </div>
					      <div class="modal-footer">
					        <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
					        <script>
					        	if(window.location.href.indexOf("eng")!=-1){
					        		document.write("<button type='button' class='btn btn-secondary' data-dismiss='modal'>Close</button>");
					        	}else if(window.location.href.indexOf("china")!=-1){
					        		document.write("<button type='button' class='btn btn-secondary' data-dismiss='modal'>关闭</button>");
					        	}else{
					        		document.write("<button type='button' class='btn btn-secondary' data-dismiss='modal'>닫기</button>");
					        	}
					        </script>
					      </div>
					    </div>
					  </div>
					</div>
					
					
				<!--비밀번호 찾기 Modal -->
				<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document">
				  <!-- Modal Content -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <h3 class="modal-title" id="exampleModalLongTitle" style="font-weight: bold; position: relative; top: 10px; left: 10px;">비밀번호 찾기</h3>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				   <!-- body -->
				      <div class="modal-body">
				      	<div style="border-bottom: 1.5px solid gray"">
				      		<img alt="" id="modal-find2" src="../resources/imgs/lock.png" style="width:128px; height:128px; margin-left:215px; margin-bottom:10px;">
				      		<p style="text-align:center; font-size: 13px;">이름과 이메일을 입력하여 아이디를 찾아보세요</p>
				      	</div>
				      	<form class="form-horizontal" method="post">
						  <div class="form-group" style="margin-top: 60px;">
						    <label for="id" id="modal_name2" class="col-sm-2" style="font-weight: bold; font-size: 16px; position: relative; left: 100px; top:-30px;">이름</label>
						    <div class="col-sm-8">
						     <input type="text" class="form-control" id="find_name1" placeholder="Name" style="position: relative; ">
						     </div>
						  </div>
						   <div class="form-group">
						    <label for="inputEmail3" id="modal_email2" class="col-sm-2 " style="font-weight: bold; font-size: 14px; position: relative; left: 100px;">이메일</label><br>
						    <div class="col-sm-8">
						      <input type="email" class="form-control" id="find_email1" placeholder="Email" >
						       
						    </div>
						  </div>
						  <div class="form-group" >
						    <label for="ID" id="modal_Id2" class="col-sm-2 " style="font-weight: bold; font-size: 14px; position: relative; left:100px; ">아이디</label><br>
						    <div class="col-sm-8">
						      <input type="text" class="form-control" id="find_id1" placeholder="ID" >
						        
						    </div>
						  </div>
						  <div class="form-group" style="">
						    <label for="phone" id="modal_Phone2" class="col-sm-2 " style="font-weight: bold; font-size: 14px; position: relative; left: 100px;">폰</label><br>
						    <div class="col-sm-8" >
						     	 <input type="text" class="form-control" id="find_phone" placeholder="Phone">
						        <br>
						    </div>
						  </div>
					  </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary" id="findBtn1" data-toggle="modal" data-target="#exampleModal1">Find</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        </form>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- Modal안에 모달 -->
					<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel"></h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <!-- 비밀번호결과 -->
					      <div class="modal-body">
					       <h4 style="text-align: center" id="tpw"></h4>
					      </div>
					      <div class="modal-footer">
					        <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
					         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					      </div>
					    </div>
					  </div>
					</div>
					



</body>
</html>