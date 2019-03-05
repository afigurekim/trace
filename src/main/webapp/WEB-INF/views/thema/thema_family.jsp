<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>테마별 가족</title>
    <link href="../../../resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../../resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../../resources/css/pe-icons.css" rel="stylesheet">
    <link href="../../../resources/css/prettyPhoto.css" rel="stylesheet">
    <link href="../../../resources/css/animate.css" rel="stylesheet">
    <link href="../../../resources/css/style.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <script src="../../../resources/js/jquery.js"></script>
    <link rel="shortcut icon" href="../../../resources/imgs/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../../../resources/imgs/ico/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../../../resources/imgs/ico/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../../../resources/imgs/ico/images/ico/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon-precomposed" href="../../../resources/imgs/ico/apple-touch-icon-57x57.png">
    <script src="../../../resources/js/bootstrap.min.js"></script>
    <script src="../../../resources/js/jquery.prettyPhoto.js"></script>
    <script src="../../../resources/js/plugins.js"></script>
    <script src="../../../resources/js/init.js"></script>
    <script type="text/javascript">
   
    </script>
<style>
#img_size{
 background-image: url("../resources/imgs/cloud.png");
}
		#single-page-slider {
			background-image: url("../resources/imgs/banner/thema-family-banner.jpg");
			bakcground-color: #01b29e;
			background-size: cover;
			background-repeat: no-repeat;
			background-position: center;
		}
</style>

<script>
$(function(){
	var windowWidth = $( window ).width();
	var count=${pageMaker.cri.perPageNum};
	$(window).resize(function(){
		 windowWidth = $( window ).width();
		console.log("윈도우 크기"+windowWidth);
/*		if(windowWidth<=1182){
			$(".item-inner>a>img").eq(1).height(223);
		}
		if(windowWidth<=974){
			$(".item-inner>a>img").eq(1).height(168);
		}*/
		//if(windowWidth<=745){
			for(var i=1;i<count;i++){
				$(".item-inner>a>img").eq(i).height($(".item-inner>a>img").eq(0).height());
			}

	});

	for(var i=1;i<count;i++){
		$(".item-inner>a>img").eq(i).height($(".item-inner>a>img").eq(0).height());
	}	
	
	var width=$(".item-inner>a>img").eq(0).width();
	var height=$(".item-inner>a>img").eq(0).height();
	
	var width_Per=372;
	console.log(width);
	console.log(height+"높이");
	//alert($(".item-inner>a>img").eq(1).height(272));
	$("#all_thema").click(function(){
		
		if(window.location.href.indexOf("eng")!=-1){
			window.location.href="/eng/thema";
		}else if(window.location.href.indexOf("china")!=-1){
			window.location.href="/china/thema";
		}else{
			window.location.href="/thema";
		}
	});
	
	$("#study").click(function(){
		
		if(window.location.href.indexOf("eng")!=-1){
			window.location.href="/eng/thema/study";
		}else if(window.location.href.indexOf("china")!=-1){
			window.location.href="/china/thema/study";
		}else{
			window.location.href="/thema/study";
		}
	});
	
	$("#date").click(function(){
		
		if(window.location.href.indexOf("eng")!=-1){
			window.location.href="/eng/thema/date";
		}else if(window.location.href.indexOf("china")!=-1){
			window.location.href="/china/thema/date";
		}else{
			window.location.href="/thema/date";
		}
	});
	
	$("#family").click(function(){
			
			if(window.location.href.indexOf("eng")!=-1){
				window.location.href="/eng/thema/family";
			}else if(window.location.href.indexOf("china")!=-1){
				window.location.href="/china/thema/family";
			}else{
				window.location.href="/thema/family";
			}
	});

	});
</script>
</head><!--/head-->
<body>
<%@include file="../Header.jsp" %>

    <section id="single-page-slider" class="no-margin">
        <div class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="item active">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="center gap fade-down section-heading">
                                    <h2 class="main-title">테마별</h2>
                                    <hr>
                                    <p>교육 · 가족 · 데이트 </p>
                                </div>
                            </div>   
                        </div>
                    </div>
                </div><!--/.item-->
            </div><!--/.carousel-inner-->
        </div><!--/.carousel-->
    </section><!--/#main-slider-->

    <div id="content-wrapper">
        <section id="portfolio" class="white">
            <div class="container">
                    
                    <ul class="portfolio-filter fade-down center">
                        <li><a class="btn btn-outlined btn-primary" id="all_thema" href="#" data-filter="*">전체보기</a></li>
                        <li><a class="btn btn-outlined btn-primary " id="study" data-filter="*">교육</a></li>
                        <li><a class="btn btn-outlined btn-primary "  id="date" href="#" data-filter="*">데이트</a></li>
                        <li><a class="btn btn-outlined btn-primary active" id="family" href="#" data-filter="*">가족</a></li>
                    
                    </ul><!--/#portfolio-filter-->
						
                    <ul class="portfolio-items col-3 isotope fade-up">
				      <c:forEach items="${list}" var="Historic_siteVO" varStatus="status">
               			<!--  <script>
               			var address="${Historic_siteVO.address}";
               			if(address.indexOf("서울")!=-1){
                            document.write("<li class='portfolio-item apps seoul isotope-item'>");
               			}else if(address.indexOf("인천")!=-1){
                            document.write("<li class='portfolio-item apps incheon isotope-item'>");

               			}else if(address.indexOf("대구")!=-1){
                            document.write("<li class='portfolio-item kyungsang isotope-item'>");
               			}
               			else if(address.indexOf("광주")!=-1){
                            document.write("<li class='portfolio-item kyungsang isotope-item'>");
               			}else if(address.indexOf("대전")!=-1){
                            document.write("<li class='portfolio-item kyungsang isotope-item'>");
               			}
               			document.write("<div class='item-inner'>");
               			document.write("<a href='/region/read?bno=${Historic_siteVO.bno}'>");
               			document.write("<img class='img-responsive img-blog' src='${Historic_siteVO.first_image}'>");
               			document.write("<h5>${Historic_siteVO.site_name}</h5>");
               			document.write("</a>");
               			document.write("</div>");
               			document.write("</li>");
               			</script>  -->
           				 <li class='portfolio-item apps seoul isotope-item'>
               			
                          <div class="item-inner">
                          <script type="text/javascript">
                          if(window.location.href.indexOf("eng")!=-1){
                            document.write("<a href='/eng/thema/read?bno=${Historic_siteVO.bno}'>");

                          }else if(window.location.href.indexOf("china")!=-1){
                              document.write("<a href='/china/thema/read?bno=${Historic_siteVO.bno}'>");

                          }else{
                            document.write("<a href='/thema/read?bno=${Historic_siteVO.bno}'>");
                        	  
                          }
                          </script>
								
                                <img class="img-responsive img-blog" src="${Historic_siteVO.first_image}">
								
								
								 <h5 style="overflow:hidden">${Historic_siteVO.site_name}</h5>
								
				            	</a>		
						</div>
						</li>  
					  </c:forEach>
					  <!-- 
                         <li class="portfolio-item apps isotope-item">
                            <div class="item-inner">
                                <img src="http://placehold.it/800x600" alt="">
                                <h5>Lorem ipsum11 dolor sit amet</h5>
                                    <a href="#" rel="prettyPhoto"></a>             
                            </div>           
                        </li>
                        <li class="portfolio-item joomla bootstrap isotope-item">
                            <div class="item-inner">
                                <img src="http://placehold.it/800x600" alt="">
                                <h5>Lorem ipsum22 dolor sit amet</h5>
                                <div class="overlay">
                                    <a class="preview btn btn-outlined btn-primary" href="http://placehold.it/800x600" rel="prettyPhoto"><i class="fa fa-eye"></i></a>              
                                </div>           
                            </div>           
                        </li>
                        <li class="portfolio-item bootstrap wordpress isotope-item">
                            <div class="item-inner">
                                <img src="http://placehold.it/800x600" alt="">
                                <h5>Lorem ipsum33 dolor sit amet</h5>
                                <div class="overlay">
                                    <a class="preview btn btn-outlined btn-primary" href="http://placehold.it/800x600" rel="prettyPhoto"><i class="fa fa-eye"></i></a>        
                                </div>           
                            </div>           
                        </li>
                        <li class="portfolio-item joomla 
                        wordpress apps isotope-item">
                            <div class="item-inner">
                                <img src="http://placehold.it/800x600" alt="">
                                <h5>Lorem ipsum44 dolor sit amet</h5>
                                <div class="overlay">
                                    <a class="preview btn btn-outlined btn-primary" href="http://placehold.it/800x600" rel="prettyPhoto"><i class="fa fa-eye"></i></a>          
                                </div>           
                            </div>           
                        </li>
                        <li class="portfolio-item joomla html isotope-item">
                            <div class="item-inner">
                                <img src="http://placehold.it/800x600" alt="">
                                <h5>Lorem ipsum55 dolor sit amet</h5>
                                <div class="overlay">
                                    <a class="preview btn btn-outlined btn-primary" href="http://placehold.it/800x600" rel="prettyPhoto"><i class="fa fa-eye"></i></a>          
                                </div>    
                            </div>       
                        </li>
                        <li class="portfolio-item wordpress html isotope-item">
                            <div class="item-inner">
                                <img src="http://placehold.it/800x600" alt="">
                                <h5>Lorem ipsum66 dolor sit amet</h5>
                                <div class="overlay">
                                    <a class="preview btn btn-outlined btn-primary" href="http://placehold.it/800x600" rel="prettyPhoto"><i class="fa fa-eye"></i></a>           
                                </div>           
                            </div>           
                        </li>
                        <li class="portfolio-item joomla wordpress apps isotope-item">
                            <div class="item-inner">
                                <img src="http://placehold.it/800x600" alt="">
                                <h5>Lorem ipsum77 dolor sit amet</h5>
                                <div class="overlay">
                                    <a class="preview btn btn-outlined btn-primary" href="http://placehold.it/800x600" rel="prettyPhoto"><i class="fa fa-eye"></i></a>          
                                </div>           
                            </div>           
                        </li>
                        <li class="portfolio-item joomla html isotope-item">
                            <div class="item-inner">
                                <img src="http://placehold.it/800x600" alt="">
                                <h5>Lorem ipsum88 dolor sit amet</h5>
                                <div class="overlay">
                                    <a class="preview btn btn-outlined btn-primary" href="http://placehold.it/800x600" rel="prettyPhoto"><i class="fa fa-eye"></i></a>          
                                </div>    
                            </div>       
                        </li>
                        <li class="portfolio-item wordpress html isotope-item">
                            <div class="item-inner">
                                <img src="http://placehold.it/800x600" alt="">
                                <h5>Lorem ipsum99 dolor sit amet</h5>
                                <div class="overlay">
                                    <a class="preview btn btn-outlined btn-primary" href="http://placehold.it/800x600" rel="prettyPhoto"><i class="fa fa-eye"></i></a>           
                                </div>           
                            </div>           
                        </li>-->
                    </ul>
                    <div class="text-center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
							<script type="text/javascript">
							 if(window.location.href.indexOf("eng")!=-1){
		                            document.write("<li><a href=/eng/thema/family?page=${pageMaker.startPage-1}&laquo;</a></li>");
		                          }else if(window.location.href.indexOf("china")!=-1){
			                            document.write("<li><a href=/china/thema/family?page=${pageMaker.startPage-1}&laquo;</a></li>");

		                          }else{
			                            document.write("<li><a href=/thema/family?page=${pageMaker.startPage-1}&laquo;</a></li>");
		                        	  
		                          }
							</script>
							</c:if>
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li 
									<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
								<script type="text/javascript">
								if(window.location.href.indexOf("eng")!=-1){
		                            document.write("<a href='/eng/thema/family?page=${idx}'>${idx}</a>");
		                          }else if(window.location.href.indexOf("china")!=-1){
			                       document.write("<a href='/china/thema/family?page=${idx}'>${idx}</a>");

		                          }else{
				                       document.write("<a href='/thema/family?page=${idx}'>${idx}</a>");
		                        	  
		                          }
								</script>
								
								</li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage>0 }">
							<script type="text/javascript">
								if(window.location.href.indexOf("eng")!=-1){
		                            document.write("<li><a href='/eng/thema/family?page=${pageMaker.endPage +1}'>&raquo;</a></li>");
		                          }else if(window.location.href.indexOf("china")!=-1){
			                            document.write("<li><a href='/china/thema/family?page=${pageMaker.endPage +1}'>&raquo;</a></li>");

		                          }else{
			                            document.write("<li><a href='/thema/family?page=${pageMaker.endPage +1}'>&raquo;</a></li>");
		                        	  
		                          }
								</script>
							
							</c:if>
							
						</ul>
					</div>
                </div>
            </section>
    </div>
<%@include file="../Footer.jsp" %>

</body>
</html>