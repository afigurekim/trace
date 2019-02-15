<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type='text/css' href="../resources/css/list.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.js"></script>
<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=ac75ebf7-25c5-474a-be2a-b845ccf8e3bb"></script>
  <script type="text/javascript" src="/resources/js/upload.js"></script>

<style>
body{
    font-family: 'Noto Sans Kr','Nanum Gothic','Malgun gothic',Dotum,arial,sans-serif;
}
#inner1{
	padding-top:6px;
	padding-bottom:16px;
}

.hschDetail_tit{
	position: relative;
    margin-bottom: 30px;
    border-top: 2px solid #535a75;
    border-bottom: 1px solid #535a75;
    padding: 15px 0;
    text-align: center;	
}
.hschDeatil_tit>p{
    color: #555;
    text-align: center;
    font-weight: 400;
}
.hschDetail_tit>strong{
	olor: #000;
    font-size: 21px;
    font-weight: 600;
}
.hschDetail_info>.hschDi_img{
    width: 48.5%;
    height: auto;
    vertical-align: middle;
    max-height: 100%;
    max-width: 100%;
	background: #ddd;
    text-align: center;
}
.hschDetail_info>div{
	position: relative;
    float: left;
    width: 48.5%;
}
.hschDetail_info>.hschDi_info{
    float: left;
    width: 48.5%;
    table-layout: fixed;
    border-collapse: collapse;
    border-top: 1px solid #535a75;
    border-bottom: 1px solid #535a75;
    margin-left: 3%;
    font-size: 15px;
    color: #555;
    font-weight: 300;
    line-height: 1.5;
}
.hschDi_info>tbody>tr>th{
	text-align:left;
}
.hschDi_info>tbody>tr:first-child{
	border-top:0;
}
.hschDi_info>tbody>tr{
    border-top: 1px solid #d5d5db;
}
tbody>tr>td{
padding: 10px 10px 10px 2px;
}

.hschDetail_con{
    margin-top: 30px;
    padding: 30px 27px;
    background: #f8f8f9;
}
.hschDetail_con>p:last-child{
	margin-bottom:0;
}
.hschDetail_con>p{
	text-align:justify;
	font-size:15px;
	line-height:30px;
}

.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
 
<script type="text/javascript">

function abc(){

	var ctx = document.getElementById("myChart");
	var myChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: ["1점","2점","3점","4점","5점"],
	    datasets: [{
	      label: '',
	      data: [20,10,50,40,70],
	      backgroundColor: [
	        'rgba(255, 99, 132, 0.2)',
	        'rgba(54, 162, 235, 0.2)',
	        'rgba(255, 206, 86, 0.2)',
	        'rgba(75, 192, 192, 0.2)',
	        'rgba(153, 102, 255, 0.2)',
	        'rgba(255, 159, 64, 0.2)',
	        'rgba(255, 99, 132, 0.2)',
	        'rgba(54, 162, 235, 0.2)',
	        'rgba(255, 206, 86, 0.2)',
	        'rgba(75, 192, 192, 0.2)',
	        'rgba(153, 102, 255, 0.2)'
	      ],
	      borderColor: [
	        'rgba(255,99,132,1)',
	        'rgba(54, 162, 235, 1)',
	        'rgba(255, 206, 86, 1)',
	        'rgba(75, 192, 192, 1)',
	        'rgba(153, 102, 255, 1)',
	        'rgba(255, 159, 64, 1)',
	        'rgba(255,99,132,1)',
	        'rgba(54, 162, 235, 1)',
	        'rgba(255, 206, 86, 1)',
	        'rgba(75, 192, 192, 1)',
	        'rgba(153, 102, 255, 1)'
	
	      ],
	      borderWidth: 1
	    }]
	  },
	  options: {
		  legend:{
			  display:false,
			  labels:{
				  boxWidth:0,
			  }
		  },
	    responsive: false,
	    scales: {
	      xAxes: [{
	        ticks: {
	         
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          beginAtZero: true
	        }
	      }]
	      
	    }
	  }
	});

}

var latitude=0;
var longitude=0;
function getLocation(){
	if (navigator.geolocation) { // GPS를 지원하면
	    navigator.geolocation.getCurrentPosition(function(position) {
	    	latitude=position.coords.latitude;
	    	longitude=position.coords.longitude;
	    	map = new Tmap.Map({
				div : 'map_div',
				width : "100%",
				height : "400px",
			});
			map.setCenter(new Tmap.LonLat("126.9850380932383", "37.566567545861645").transform("EPSG:4326", "EPSG:3857"), 15);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 즁심점으로 설정합니다.
			var routeLayer = new Tmap.Layer.Vector("route");//벡터 레이어 생성
			var markerLayer = new Tmap.Layer.Markers("start");// 마커 레이어 생성
			map.addLayer(routeLayer);//map에 벡터 레이어 추가
			map.addLayer(markerLayer);//map에 마커 레이어 추가

			// 시작
			var size = new Tmap.Size(24, 38);//아이콘 크기 설정
			var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
			var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png />', size, offset);//마커 아이콘 설정
			var marker_s = new Tmap.Marker(new Tmap.LonLat("126.9850380932383", "37.566567545861645").transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
			markerLayer.addMarker(marker_s);//마커 레이어에 마커 추가

			// 도착
			var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png />', size, offset);//마커 아이콘 설정
			var marker_e = new Tmap.Marker(new Tmap.LonLat("127.10331814639885", "37.403049076341794").transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
			markerLayer.addMarker(marker_e);//마커 레이어에 마커 추가
			var headers = {}; 
			headers["appKey"]="ac75ebf7-25c5-474a-be2a-b845ccf8e3bb";//실행을 위한 키 입니다. 발급받으신 AppKey를 입력하세요.
			$.ajax({
				method:"POST",
				headers : headers,
				url:"https://api2.sktelecom.com/tmap/routes?version=1&format=xml",//자동차 경로안내 api 요청 url입니다.
				async:false,
				data:{
					//출발지 위경도 좌표입니다.
					startX :longitude,
					startY :latitude,
					//목적지 위경도 좌표입니다.
					endX : ${boardVO.longitude},
					endY : ${boardVO.latitude},
					//출발지, 경유지, 목적지 좌표계 유형을 지정합니다.
					reqCoordType : "WGS84GEO",
					resCoordType : "EPSG3857",
					//각도입니다.
					angle : "172",
					//경로 탐색 옵션 입니다.
					searchOption : 0,
					//교통정보 포함 옵션입니다.
					trafficInfo : "Y"
					
				},
				//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
				success:function(response){
					prtcl = response;
					
					// 결과 출력
					var innerHtml ="";
					var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
					xmlDoc = $.parseXML( prtclString ),
					$xml = $( xmlDoc ),
					$intRate = $xml.find("Document");
			    	
					var tDistance = " 총 거리 : "+($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue/1000).toFixed(1)+"km,";
					var tTime = " 총 시간 : "+($intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue/60).toFixed(0)+"분,";	
					var tFare = " 총 요금 : "+$intRate[0].getElementsByTagName("tmap:totalFare")[0].childNodes[0].nodeValue+"원,";	
					var taxiFare = " 예상 택시 요금 : "+$intRate[0].getElementsByTagName("tmap:taxiFare")[0].childNodes[0].nodeValue+"원";	

					$("#result").text(tDistance+tTime+tFare+taxiFare);
					
					routeLayer.removeAllFeatures();//레이어의 모든 도형을 지웁니다.
							
					var traffic = $intRate[0].getElementsByTagName("traffic")[0];
					//교통정보가 포함되어 있으면 교통정보를 포함한 경로를 그려주고
					//교통정보가 없다면  교통정보를 제외한 경로를 그려줍니다.
					if(!traffic){
						var prtclLine = new Tmap.Format.KML({extractStyles:true, extractAttributes:true}).read(prtcl);//데이터(prtcl)를 읽고, 벡터 도형(feature) 목록을 리턴합니다.
						
						//표준 데이터 포맷인 KML을 Read/Write 하는 클래스 입니다.
						//벡터 도형(Feature)이 추가되기 직전에 이벤트가 발생합니다.
						routeLayer.events.register("beforefeatureadded", routeLayer, onBeforeFeatureAdded);
				        function onBeforeFeatureAdded(e) {
					        	var style = {};
					        	switch (e.feature.attributes.styleUrl) {
					        	case "#pointStyle":
						        	style.externalGraphic = "http://topopen.tmap.co.kr/imgs/point.png"; //렌더링 포인트에 사용될 외부 이미지 파일의 url입니다.
									style.graphicHeight = 16; //외부 이미지 파일의 크기 설정을 위한 픽셀 높이입니다.
									style.graphicOpacity = 1; //외부 이미지 파일의 투명도 (0-1)입니다.
									style.graphicWidth = 16; //외부 이미지 파일의 크기 설정을 위한 픽셀 폭입니다.
					        	break;
					        	default:
									style.strokeColor = "#ff0000";//stroke에 적용될 16진수 color
									style.strokeOpacity = "1";//stroke의 투명도(0~1)
									style.strokeWidth = "5";//stroke의 넓이(pixel 단위)
					        	};
				        	e.feature.style = style;
				        }
						
						routeLayer.addFeatures(prtclLine); //레이어에 도형을 등록합니다.
					}else{
						//기존 출발,도착지 마커릉 지웁니다.
						markerLayer.removeMarker(marker_s); 
						markerLayer.removeMarker(marker_e);
						routeLayer.removeAllFeatures();//레이어의 모든 도형을 지웁니다.
						
						//-------------------------- 교통정보를 그려주는 부분입니다. -------------------------- 
						var trafficColors = {
								extractStyles:true,
								
								/* 실제 교통정보가 표출되면 아래와 같은 Color로 Line이 생성됩니다. */
								trafficDefaultColor:"#000000", //Default
								trafficType1Color:"#009900", //원할
								trafficType2Color:"#8E8111", //지체
								trafficType3Color:"#FF0000", //정체
								
							};    
						var kmlForm = new Tmap.Format.KML(trafficColors).readTraffic(prtcl);
						routeLayer = new Tmap.Layer.Vector("vectorLayerID"); //백터 레이어 생성
						routeLayer.addFeatures(kmlForm); //교통정보를 백터 레이어에 추가   
						
						map.addLayer(routeLayer); // 지도에 백터 레이어 추가
						//-------------------------- 교통정보를 그려주는 부분입니다. -------------------------- 
					}
					
					map.zoomToExtent(routeLayer.getDataExtent());//map의 zoom을 routeLayer의 영역에 맞게 변경합니다.	
				},
				//요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
				error:function(request,status,error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		    }, function(error) {
	      console.error(error);
	    }, {
	      enableHighAccuracy: false,
	      maximumAge: 0,
	      timeout: Infinity
	    });
	  } else {
	    alert('GPS를 지원하지 않습니다');
	    
	   
	  }
}
</script>
</head>
<body onload="getLocation(),abc()">
<%@include file="../Header.jsp" %>

<div id="wrap">
	<div class="content">
		<div class="hschDetail_tit">
		<strong>${boardVO.history_name}</strong>
		</div>
		
		<div class="hschDetail_info">
			<div class="hschDi_img" style="height:397px;">
			<a href="#" onclick="dirImg('1636095');" title="사진을 클릭하시면 크게 확인하실 수 있습니다." style="line-height: 301px;">
 				<img  src="/displayFile?fileName=${imglist[0]}"style="width:100%;height:100%;">
                 
			</a>
				
			</div>
			
			<table class="hschDi_info">
				      <colgroup>
				        <col style="width:125px">
				        <col>
				       </colgroup>
				       <tbody>
				       <tr>
					       <th scope="row">유적지 이름</th>
					       <td>${boardVO.history_name}</td>
				       </tr>                             
				       <tr>
				           <th scope="row">소재지</th>
				           <td>${boardVO.address2}</td>
				           </tr>
				       <tr>
					       <th scope="row">시대</th>
					       <td>${boardVO.period}</td>
				       </tr>
				       <tr>
					       <th scope="row">테마</th>
					       <td>${boardVO.thema}</td>
				       </tr>
				       <tr>
					       <th scope="row">별점</th>
						   <td>${boardVO.star}</td>
				       </tr>
				       <tr>
				       		<th>후기 평점</th>
				       		<td>
				       		<div id="canvas" style="width:1280px; margin:auto;">
								<canvas id="myChart"style="float:left; margin-top:10px;margin-left:21px; width:400px;height:200px;"></canvas>
							</div>
				       		</td>
				       </tr>      
				      </tbody>
				</table>
						
		</div>
		
		
		<div style="border-bottom: 1px solid #535a75; margin-top:30px;">
		<a href="#" style="border:1px solid black; float:right; margin-left:10px;text-decoration:none;" >찜하기</a>
			<p style="text-align:right; margin-right:10px;">리뷰평점<select>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
			<button type="button">등록</button>
		
		</p>
		</div>
			<div class="hschDetail_con" id="expDiv">
              	<p>${boardVO.detail}</p>
              </div>
         <div style="border-bottom: 1px solid #535a75; margin-top:30px;"></div>
         	<div>
         		<a href="#"><img src="../resources/imgs/문화재청.png"></a>
         		<a href="#"><img src="../resources/imgs/길찾기.png"></a>
         	</div>
		<div id="map_div">
		</div>
		<p id="result"></p>
	
		
		
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="${boardVO.history_name} 근처 맛집" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85e0cc19a20ba6c0287ea1beb32633e7&libraries=services"></script>

<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);
        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('근처 맛집 검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            daum.maps.event.addListener(marker, 'click', function() {
                // 마커 위에 인포윈도우를 표시합니다
				window.open("http://map.daum.net/link/search/"+title);
            });
            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
         	   
	</div>
</div>
<%@include file="../MainFooter.jsp" %>
</body>
</html>