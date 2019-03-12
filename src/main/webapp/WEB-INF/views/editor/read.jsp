<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- 반응형 디자인을 위한 css 파일 -->
<link href="../../../resources/css/editor_mobile_read.css" rel="stylesheet">

<link href="../../../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../../../resources/css/font-awesome.min.css"
	rel="stylesheet">
<link href="../../../resources/css/pe-icons.css" rel="stylesheet">
<link href="../../../resources/css/prettyPhoto.css" rel="stylesheet">
<link href="../../../resources/css/animate.css" rel="stylesheet">
<link href="../../../resources/css/style.css" rel="stylesheet">
<script src="../../../resources/js/jquery.js"></script>
<link rel="shortcut icon" href="../../../resources/imgs/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../../../resources/imgs/ico/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../../../resources/imgs/ico/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../../../resources/imgs/ico/images/ico/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon-precomposed"
	href="../../../resources/imgs/ico/apple-touch-icon-57x57.png">
<script src="../../../resources/js/bootstrap.min.js"></script>
<script src="../../../resources/js/jquery.prettyPhoto.js"></script>
<script src="../../../resources/js/plugins.js"></script>
<script src="../../../resources/js/init.js"></script>

<!-- include summernote css/js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script> -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="../../../resources/js/summernote/summernote-ko-KR.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<title>에디터 추천코스</title>
<script type="text/javascript">
	//summernote 호출 함수
	$(document).ready(function() {
		$('#summernote').summernote({
			
			minHeight : null,
			maxHeight : null,
			focus : false,
			toolbar : [],
		});

		$('#summernote').summernote('disable');
		
		

		var windowWidth = $( window ).width();

		if(windowWidth<=719){
			$("#comments-list").width(windowWidth-30);
		}else{
			$("#comments-list").width(700);

		}

		
		$(window).resize(function(){
			 windowWidth = $( window ).width();
			console.log(windowWidth);
			if(windowWidth<=719){
				$("#comments-list").width(windowWidth-30);
			}else{
				$("#comments-list").width(700);

			}
		});
		
	});
</script>

<style>
#img_size {
	background-image: url("../../../resources/imgs/cloud.png");
}

#single-page-slider {
	background-image:
		url("../../../resources/imgs/banner/editor2-banner.jpg");
	bakcground-color: #01b29e;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
}

.text-center {
	margin-top: 100px;
}

.note-editor.note-frame {
	border: none;
}

.note-editor.note-frame .note-editing-area .note-editable[contenteditable="false"]
	{
	background-color: #f8f8f8;
}

.table {
	width: 70%;
	margin-left: 200px;
}

#right {
	text-align: right;
}

.box-footer {
	margin-top: 30px;
	text-align: center;
}

#newReplyWriter {
	margin-bottom: 15px;
}
.text-center{
	margin-top: 0px;
}

.h4, .h5, .h6, h4, h5, h6 {
	margin-top : 20px;
}
.table>thead>tr>th {
    vertical-align: bottom;
    border-bottom: 2px solid #08208A;
</style>

</head>
<body>
	<%@include file="../Header.jsp"%>
	<form role="form" method="POST">
		<input type="hidden" name='bno' value="${editorVO.bno} " />
	</form>

	<section id="single-page-slider" class="no-margin">
		<div class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<div class="item active">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div class="center gap fade-down section-heading">
									<script type="text/javascript">
									  if(window.location.href.indexOf("kor")!=-1){
										  document.write("<h2 class='main-title'>에디터 추천코스</h2>");
										  document.write("<hr>");
										  document.write("<p>발자취 에디터가 추천하는 역사 탐험</p>");
									  }else if(window.location.href.indexOf("eng")!=-1){
										  document.write("<h2 class='main-title'>Baljachwi editor's Recommended places</h2>");
										  document.write("<hr>");
										  document.write("<p>Exploring&nbsp;&nbsp;historical&nbsp;&nbsp;place&nbsp;&nbsp;recommended&nbsp;&nbsp;by&nbsp;&nbsp;the&nbsp;&nbsp;Baljachwi&nbsp;&nbsp; Editor</p>" );
									  }else if(window.location.href.indexOf("china")!=-1){
										  document.write("<h2 class='main-title'>足迹编辑推荐处</h2>");
										  document.write("<hr>");
										  document.write("<p>足迹编辑推荐的历史探险</p>" );
									  }else{
										  document.write("<h2 class='main-title'>에디터 추천코스</h2>");
										  document.write("<hr>");
										  document.write("<p>발자취 에디터가 추천하는 역사 탐험</p>" );
									  }
									</script>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/.item-->
			</div>
			<!--/.carousel-inner-->
		</div>
		<!--/.carousel-->
	</section>
	<!--/#main-slider-->

	<div id="content-wrapper">


		<section id="portfolio" class="white">
			<div class="container">
				<div class="form-group">
					<table class="table" id = "read_table">
						<thead>
							<tr>
								<th font-size=" 10px" scope="col">${read.title }</th>
							</tr>
						</thead>
						<tbody>
							<tr>

								<td id="right"><script>
								if(window.location.href.indexOf("kor")!=-1){
									  document.write("작성 날짜");
								  }else if(window.location.href.indexOf("eng")!=-1){
									  document.write("DATE");
								}else if(window.location.href.indexOf("china")!=-1){
									  document.write("日期");
								  }else{
									  document.write("작성 날짜");
								  }
								  </script> &nbsp;:&nbsp; <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
										value="${read.regdate }" />&nbsp;&nbsp; <script>
								if(window.location.href.indexOf("kor")!=-1){
									  document.write("조회수");
								  }else if(window.location.href.indexOf("eng")!=-1){
									  document.write("VIEWS");
								}else if(window.location.href.indexOf("china")!=-1){
									  document.write("查询数");
								  }else{
									  document.write("조회수");
								  }
								  </script> &nbsp;:&nbsp;${read.viewcnt }&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td><textarea class="form-control " id="summernote"
										name="content" placeholder="content">${read.content }</textarea></td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
			<div id="comments">
  <div id="comments-list" style="width:700px; margin:auto;">
   <ul class="timeline" style="margin-top:10px;">
		<li class="time-label" id="repliesDiv" style="margin-bottom:30px;list-style-type:none; margin-left:-39px; font-size:20px; font-weight:700; height:30px;"><span class="bg-green" style="float:left">
		<i class="fa fa-comments bg-blue"></i>
		<script type="text/javascript">
       		if(window.location.href.indexOf("eng")!=-1){
       			document.write("Comments");
       		}else if(window.location.href.indexOf("china")!=-1){
       			document.write("留言");
       		}else{
       			document.write("댓글");
       		}
    	 </script>
	     </span><p id="reply_count" style="margin-left:10px;"></p></li>
	</ul>
	<div class="text-center">
		<ul id="pagination" class="pagination pagination-sm no-margin">
		</ul>
	</div>
	<div class="row">
		<div class="col-md-12">
		
		<div class="box box-success">
			<div class="box-header">
				<h3 class="box-title">
				<script type="text/javascript">
		       		if(window.location.href.indexOf("eng")!=-1){
		       			document.write("Leave Comments");
		       		}else if(window.location.href.indexOf("china")!=-1){
		       			document.write("留言注册");
		       		}else{
		       			document.write("댓글 등록");
		       		}
		    	 </script>
		    	 </h3>
			</div>
			<div class="box-body">
					<script type="text/javascript">
					if("${login_id}"!=""){
			       		if(window.location.href.indexOf("eng")!=-1){
			       			document.write("<input class='form-control' type='text' placeholder='Writer' id='newReplyWriter' value=${login_id} readonly>");
			       		}else if(window.location.href.indexOf("china")!=-1){
			       			document.write("<input class='form-control' type='text' placeholder='写手' id='newReplyWriter' value=${login_id} readonly>");
			       		}else{
			       			document.write("<input class='form-control' type='text' placeholder='글쓴이' id='newReplyWriter' value=${login_id} readonly>");
			       		}
					}else if("${login_id2}"!=""){
			       		if(window.location.href.indexOf("eng")!=-1){
			       			document.write("<input class='form-control' type='text' placeholder='Writer' id='newReplyWriter' value=${login_id2} readonly>");
			       		}else if(window.location.href.indexOf("china")!=-1){
			       			document.write("<input class='form-control' type='text' placeholder='写手' id='newReplyWriter' value=${login_id2} readonly>");
			       		}else{
			       			document.write("<input class='form-control' type='text' placeholder='글쓴이' id='newReplyWriter' value=${login_id2} readonly>");
			       		}
					}else{
			       		if(window.location.href.indexOf("eng")!=-1){
			       			document.write("<input class='form-control' type='text' placeholder='Writer' id='newReplyWriter' readonly>");
			       		}else if(window.location.href.indexOf("china")!=-1){
			       			document.write("<input class='form-control' type='text' placeholder='写手' id='newReplyWriter' readonly>");
			       		}else{
			       			document.write("<input class='form-control' type='text' placeholder='글쓴이' id='newReplyWriter' readonly>");
			       		}
					}
					</script> 
					<div style="margin-top:15px; margin-bottom:15px;">
					<script type="text/javascript">
			       		if(window.location.href.indexOf("eng")!=-1){
			       			document.write("<textarea rows=\"8\"  id=\"newReplyText\" class=\"form-control\" placeholder=\"Comments\"></textarea>");
			       		}else if(window.location.href.indexOf("china")!=-1){
			       			document.write("<textarea rows=\"8\"  id=\"newReplyText\" class=\"form-control\" placeholder=\"内容\"></textarea>");
			       		}else{
			       			document.write("<textarea rows=\"8\"  id=\"newReplyText\" class=\"form-control\" placeholder=\"내용\"></textarea>");
			       		}
			    	 </script>
					</div>
			</div>
			
		<div class="box-footer">
			<button type="submit" class="btn btn-primary btn-outlined" id="replyAddBtn">
				<script type="text/javascript">
		       		if(window.location.href.indexOf("eng")!=-1){
		       			document.write("Submit");
		       		}else if(window.location.href.indexOf("china")!=-1){
		       			document.write("注册");
		       		}else{
		       			document.write("등록");
		       		}
		    	 </script>
	    	 </button>
		</div>
		</div>
		
		</div>
	</div>                           
       	</div>
    </div>
		</section>
		<!--  댓글 관련 -->
		
	</div>
	<!-- Modal -->
	<div id="modifyModal" class="modal modal-primary" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content -->
			<div class="modal-content" style="margin-top: 300px;">
				<div class="modal-header">
					<h4 class="modal-title"></h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="replytext" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">
						<script>
								if(window.location.href.indexOf("kor")!=-1){
									  document.write("취소");
							 	}else if(window.location.href.indexOf("eng")!=-1){
								  document.write("Cancel");
								}else if(window.location.href.indexOf("china")!=-1){
								  document.write("取消");
							 	 }else{
								  document.write("취소");
							  	}
						</script>
					</button>
					<button type="button" class="btn btn-primary" id="replyModBtn">
						<script>
								if(window.location.href.indexOf("kor")!=-1){
									  document.write("수정");
							 	}else if(window.location.href.indexOf("eng")!=-1){
								  document.write("Modify");
								}else if(window.location.href.indexOf("china")!=-1){
								  document.write("修整");
							 	 }else{
								  document.write("수정");
							  	}
						</script>
					</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">
						<script>
								if(window.location.href.indexOf("kor")!=-1){
									  document.write("삭제");
							 	}else if(window.location.href.indexOf("eng")!=-1){
								  document.write("Delete");
								}else if(window.location.href.indexOf("china")!=-1){
								  document.write("删除");
							 	 }else{
								  document.write("삭제");
							  	}
						</script>
					</button>

				</div>
			</div>
		</div>
	</div>
	<!-- end modal -->
	<script id="template" type="text/x-handlebars-template">
		{{#each .}}
			<li class="replyLi" data-rno={{rno}} style="list-style-type:none;">
			<div class="timeline-footer" style="float:right;">
				<a class="btn btn-primary btn-outlined" id="modify_modal"
				data-toggle="modal" data-target="#modifyModal">
				<span class="trans">수정하기</span></a>
			</div>
			<div class="timeline-item">
			<h4 class="timeline-header">{{replyer}}</h4>
			<div class="timeline-body">{{replytext}} </div>
			<span class="time">
				<i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
			</span>
		</div>
		<hr>
		</li>
		{{/each}}
	</script>
	<script>
	
		Handlebars.registerHelper("prettifyDate", function(timeValue) {
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "/" + month + "/" + date;
		});

		var printData = function(replyArr, target, templateObject) {
			var template = Handlebars.compile(templateObject.html());

			var html = template(replyArr);
			$(".replyLi").remove();
			target.after(html);
			for(var i=0;i<replyArr.length;i++){
			
				if(replyArr[i].replyer !="${login_id2}" && replyArr[i].replyer !="${login_id}")
				{
					console.log("아이디가 일치하지 않음");
					$("#modify_modal").hide();

				}
			}
		}
		
		var bno = ${read.bno};
		var replyPage = 1;
		var str = "";
	
		$(function(){
			getPage("/editor/read/" + bno + "/" + replyPage);
		});		
	
		function getPage(pageInfo) {
			$.ajax({
				url:pageInfo,
				async: false,
				success:function(data){
					var str="";
					printData(data.list,$("#repliesDiv"),$("#template"));
					printPaging(data.pageMaker,$(".pagination"));
					$("#modifyModal").modal('hide');
				}
			});
		}
		
		//페이징 화면에 나타내기 <li> 이용
			var printPaging = function(pageMaker, target) {
	
				var str = "";

				 if (pageMaker.prev) {
					str += "<li><a href = '" + (pageMaker.startPage - 1)
							+ "'> >> </a></li>";
				} 
				for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
					var strClass = pageMaker.cri.page == i ? 'class=active' : '';
					str += "<li " + strClass+"><a href ='"+i+"'>"
							+ i + "</a></li>";
				}
				 if (pageMaker.next) {
					str += "<li><a href='" + (pageMaker.endPage + 1)
							+ "'> >> </a></li>";
				} 
				target.html(str);
				if(window.location.href.indexOf("kor")!=-1){
					$('.trans').text("수정하기");
			 	}else if(window.location.href.indexOf("eng")!=-1){
			 		$('.trans').text("Modify");
				}else if(window.location.href.indexOf("china")!=-1){
					$('.trans').text("修整");
			 	 }else{
			 		$('.trans').text("수정하기");
			  	}
			};

		//페이징 처리
		$(".pagination").on("click", "li a", function(event) {
			event.preventDefault();
			replyPage = $(this).attr("href");
			getPage("/editor/read/" + bno + "/" + replyPage);
		});
		//댓글 등록하기
		$("#replyAddBtn").on("click", function() {
			var replyerObj = $("#newReplyWriter");
			var replytextObj = $("#newReplyText");
			var replyer = replyerObj.val();
			var replytext = replytextObj.val();
			if(replyer==""){
				if(window.location.href.indexOf("eng")!=-1){
					alert("Please sign in.");
				}else if(window.location.href.indexOf("china")!=-1){
					alert("登录后可使用。");
				}else{
					alert("로그인 후 이용이 가능합니다.");
				}
				return;
			}
			if(replytext==""){
				if(window.location.href.indexOf("eng")!=-1){
					alert("Please write a comment.");
				}else if(window.location.href.indexOf("china")!=-1){
					alert("请输入回帖。");
				}else{
					alert("댓글을 입력해주세요.");
				}
				return;
			}

			$.ajax({
				type : 'post',
				url : '/editor/read/',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					bno : bno,
					replyer : replyer,
					replytext : replytext
				}),
				success : function(result) {
					console.log("result : " + result);
					if (result == 'SUCESS') {
						if(window.location.href.indexOf("kor")!=-1){
							alert("등록 되었습니다.");
					 	}else if(window.location.href.indexOf("eng")!=-1){
					 		alert("The comments are registered.");
						}else if(window.location.href.indexOf("china")!=-1){
							alert("有备无患。");
					 	 }else{
					 		alert("등록 되었습니다.");
					  	}
						
						replytextObj.val("");
						getPage("/editor/read/" + bno + "/" + replyPage);
						
					}
				}
			});
		});

		//modal 버튼의 페이지 처리
		$(".timeline").on("click",".replyLi", function(event) {
			var reply = $(this);

			$("#replytext").val(reply.find('.timeline-body').text());
			$(".modal-title").html(reply.attr("data-rno"));
		});
		
		//댓글 수정
		$("#replyModBtn").on("click",function(){
			var rno=$(".modal-title").html();
			var replytext=$("#replytext").val();
			
			$.ajax({
				type:'put',
				url:'/editor/read/'+rno,
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override": "PUT"},
					data:JSON.stringify({
						replytext : replytext
						}),
					dataType:'text',
					success:function(result){
						console.log("result: "+ result);
						if(result == "SUCCESS"){
							if(window.location.href.indexOf("kor")!=-1){
								alert("수정 되었습니다.");
						 	}else if(window.location.href.indexOf("eng")!=-1){
						 		alert("The comments are modified.");
							}else if(window.location.href.indexOf("china")!=-1){
								alert("注释被修改了。");
						 	 }else{
						 		alert("수정 되었습니다.");
						  	}
							getPage("/editor/read/" + bno + "/" + replyPage);
						}
					}
			});
			
		});
		//댓글 삭제
		$("#replyDelBtn").on("click",function(){
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type:'delete',
				url:'/editor/read/'+rno,
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override":"DELETE"
				},
				dataType:'text',
				success:function(result){
					console.log("result :" +result);
					if(result == 'SUCCESS'){
						if(window.location.href.indexOf("kor")!=-1){
							alert("삭제 되었습니다.");
					 	}else if(window.location.href.indexOf("eng")!=-1){
					 		alert("The comments are deleted.");
						}else if(window.location.href.indexOf("china")!=-1){
							alert("这些评论被删除了。");
					 	 }else{
					 		alert("삭제 되었습니다.");
					  	}
						getPage("/editor/read/" + bno + "/" + replyPage);
					}
				}
			});
			
		});
	
	</script>


	<%@include file="../Footer.jsp"%>
</body>
</html>