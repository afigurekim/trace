<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../resources/css/join.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script id="template" type="text/x-handlebars-template">
<li class="listfile" style="display:inline-block; list-style:none;">
	<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
	<div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}"class="btn btn-default btn-xs pull-right delbtn"><small data-src="{{fullName}}">X</small>
	</a>	
	</div>
</li>
</script>
<style>
.fileDrop{
width:68%;
height:100px;
border:1px dotted gray;
background-color:lightslategrey;
margin-top:10px;
}
small{
	border:1px solid;
}
button {
  background-color: gray; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}
</style>

</head>
<body>
<%@include file="Header.jsp" %>
<div id="wrap">
	<div id="join_content" style="margin-top:150px;">
    <div id="join">
        <h1 class="tit-join"></h1>
            <iframe name="hf" id="hf" style="display:none;"></iframe>
            
            <form name="joinform" id="registerForm"  method="post">
                <h3 class="cont-tit">유적지 등록</h3>
                <div id="personInfo">

                    <table class="person-tb">
                        <colgroup>
                            <col width="135">
                                <col width="720">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30"> 유적지이름</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-id">
                                        <input type="text" name="history_name" value="" class="MS_input_txt" size="15" maxlength="30"valch="yes">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30">유적지 설명</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-id">
                                    	<textarea row="20" cols="50" name="detail"></textarea>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30">위도</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-zip">
                                        <input type="text" name="latitude"  class="MS_input_txt" value="" islen="3" size="10" maxlength="20" valch="yes"  aria-autocomplete="list"> 
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30">경도</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-zip">
                                        <input type="text" name="longitude"  class="MS_input_txt" value="" size="10" maxlength="20" valch="yes">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30">별점</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-zip">
                                    	<input style="width:40px;height:15px" type="text" class="MS_input_txt" name="star" value="" valch="yes" >
    						
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30">간략주소</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-add">
                                        <input type="text" name="address1" id="address1" class="MS_input_txt" value="" size="20" maxlength="100">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30">상세주소</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-add">
                                        <input type="text" name="address2" id="address2" class="MS_input_txt" value="" size="40" maxlength="100">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30">시대</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-zip">
                                        <input type="text" name="period" id="" class="MS_input_txt" value="" size="8" maxlength="6"  valch="yes">
                      
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="tb-l pl-30">테마</div>
                                </th>
                                <td>
                                    <div class="tb-l pl-6 pl-add">
                                        <input type="text" name="thema" class="MS_input_txt" value="" size="5" maxlength="100">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                            	<th>
                            		<div class="tb-l pl-30">이미지</div>
                    
                            	</th>
                            	<td>
                            	   <div class="fileDrop"></div>
                           	
                            	</td>
                            </tr>
                         </tbody>
                    </table>
                    
                    
                    
                    <div class="box-footer" style="width:1048px; height:130px;">
                    <div>
                    	<hr>
                    </div>
                    
                    <ul class="mailbox-attachments clearfix uploadedList">
                    </ul>
					</div>
					                   
                </div>
            <!-- #personInfo -->
            <div class="btn-area">
               
                <button type="submit">등록
                 </button>
                &nbsp;
                <button type="reset" id="reset" >취소</button>
            </div>
            
        </div></form>
    <!-- #join -->
    </div>
	</div>
</div>

<%@include file="MainFooter.jsp" %>

<script type="text/javascript">

var files;
var file;
var formData;
var fileInfo;
var html;
var filelist=new Array();
function checkImageType(fileName){
	var pattern=/jpg$|gif$|png$|jpeg$/i;
	return fileName.match(pattern);
}
function getOriginalName(fileName){
	if(checkImageType(fileName)){
		return;
	}
	var idx=fileName.indexOf("_")+1;
	return fileName.substr(idx);
}

function getImageLink(fileName){
	if(!checkImageType(fileName)){
		return;
	}
	var front=fileName.substr(0,12);
	var end = fileName.substr(14);
	
	return front+end;
}
var template = Handlebars.compile($("#template").html());

$(".fileDrop").on("dragenter dragover",function(event){
	event.preventDefault();
	
});
$(".fileDrop").on("drop",function(event){
	event.preventDefault();
	 files=event.originalEvent.dataTransfer.files;
	
	 file=files[0];
	
	formData=new FormData();
	
	formData.append("file",file);

	
	$.ajax({
		url:'/uploadAjax',
		data:formData,
		dataType:'text',
		processData:false,
		contentType:false,
		type:'POST',
		success:function(data){
		
			fileInfo= getFileInfo(data);
			filelist.push(fileInfo.fullName);
			 html= template(fileInfo);
			$(".uploadedList").append(html);
		}
		
	});
});
$(".uploadedList").on("click","small",function(event){
	event.preventDefault();
	
	var that=$(this);
	
	$.ajax({
		url:"deleteFile",
		type:"post",
		data:{fileName:$(this).attr("data-src")},
		dataType:"text",
		success:function(result){
			if(result=='deleted'){
				that.parent("a").parent("div").parent("li").remove();
			}
		}
	
	});
});

$("#registerForm").submit(function(event){
	event.preventDefault();
	var that=$(this);
	var str="";
	$(".uploadedList .delbtn").each(function(index){
		 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
	});
	that.append(str);
	that.get(0).submit();
});
$("#reset").click(function(){

	for(var i=0;i<filelist.length;i++){
		$.ajax({
			url:"deleteFile",
			type:"post",
			data:{fileName:filelist[i]},
			dataType:"text",
			success:function(result){
				if(result=='deleted'){
					$(".listfile").remove();
				}
			}
		
		});
	}
});

function noEvent(){
	
	if(event.keyCode==116){
		for(var i=0;i<filelist.length;i++){
			$.ajax({
				url:"deleteFile",
				type:"post",
				data:{fileName:filelist[i]},
				dataType:"text",
				success:function(result){
					if(result=='deleted'){
						$(".listfile").remove();
					}
				}
			
			});
		}
	}else if(event.ctrlKey && (event.keyCode==78 || event.keyCode==82)){
		for(var i=0;i<filelist.length;i++){
			$.ajax({
				url:"deleteFile",
				type:"post",
				data:{fileName:filelist[i]},
				dataType:"text",
				success:function(result){
					if(result=='deleted'){
						$(".listfile").remove();
					}
				}
			
			});
		}	
	}
}

document.onkeydown=noEvent;


</script>

</body>
</html>