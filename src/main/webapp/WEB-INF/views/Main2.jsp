<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>

    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <script type="text/javascript" src="/resources/js/upload.js"></script>
<link rel="stylesheet" type="text/css" href="../../resources/css/style.css">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>



<style>

@import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);
.jh{font-family: 'Jeju Hallasan', cursive;}

#footer2{
position:fixed;
bottom:0;
width:100%;
}
.container2{
    position: relative;
    margin: 135px auto 135px;
    width: 1050px;
    min-height: 700px;
}
.jbFixed{
position:fixed;
top:0px;
}
.background{
fill:#f7fcfd;
pointer-events:all;}
#map{
border:1px solid #ddd;}
#states path{
cursor:pointer;}

#states path{
fill:#ccece6;
stroke:#fff;
stroke-width:1.5px;}

#states text{
cursor:pointer;
font-size:12px;
font-family:'Nanum Gothic';}

#inner1{
padding-top:4px;
padding-bottom:4px;
}
#menu2>ul>li{
margin-top:150px;
}
.element {
				width: 480px;
				height: 320px;
				box-shadow: 0px 0px 12px rgba(0,0,0,0.5);
				border: 1px solid rgba(105,105,105,0.25);
				text-align: center;
				cursor: default;
			}
			.element:hover {
				box-shadow: 0px 0px 12px rgba(0,0,0,0.75);
				border: 1px solid rgba(105,105,105,0.75);
			}
				.element .symbol {
					position: absolute;
					top: 0px;
					left: 0px;
					right: 0px;
					font-size: 60px;
					font-weight: bold;
					color: rgba(0,0,0,0.75);
					text-shadow: 0 0 10px rgba(105,105,105,0.95);
				}
</style>
<script type="text/javascript">
/*
window.onload = function () {
    $(".box").each(function () {
        // 개별적으로 Wheel 이벤트 적용
        $(this).on("mousewheel DOMMouseScroll", function (e) {
            e.preventDefault();
            var delta = 0;
            if (!event) event = window.event;
            if (event.wheelDelta) {
                delta = event.wheelDelta / 120;
                if (window.opera) delta = -delta;
            } else if (event.detail) delta = -event.detail / 3;
            var moveTop = null;
            // 마우스휠을 위에서 아래로
            if (delta < 0) {
                if ($(this).next() != undefined) {
                    moveTop = $(this).next().offset().top;
                }
            // 마우스휠을 아래에서 위로
            } else {
                if ($(this).prev() != undefined) {
                    moveTop = $(this).prev().offset().top;
                }
            }
            // 화면 이동 0.8초(800)
            $("html,body").stop().animate({
                scrollTop: moveTop + 'px'
            }, {
                duration: 800, complete: function () {
                }
            });
        });
    });
}
$(function(){
    var lastScrollTop = 0,
        delta = 15;
    $(window).scroll(function (event) {
        var st = $(this).scrollTop();
        if (Math.abs(lastScrollTop - st) <= delta) return;
        if ((st > lastScrollTop) && (lastScrollTop > 0)) {
            $("#header").css("top", "0px");
        } else {
            $("#header").css("top", "0px");
        }
        lastScrollTop = st;
    });
});  
*/
</script>
</head>
<body>

<%@include file="Header.jsp" %>
 
<div id="content" style="position:fixed; margin-top:40px;">
	<script src="../resources/js/three.js"></script>
	<script src="../resources/js/tween.min.js"></script>
	<script src="../resources/js/TrackballControls.js"></script>
	<script src="../resources/js/CSS3DRenderer.js"></script>
	
		<div id="container"></div>
		<div id="menu">
			<button id="table">TABLE</button>
			<button id="sphere">SPHERE</button>
			<button id="helix">HELIX</button>
			<button id="grid">GRID</button>
		</div>

		<script>
		var main_image=new Array();
		$.ajax({
			url:'/mainimage',
			type:'GET',
			async:false,
			success:function(data){
				console.log(data.list.length);
				for(var i=0;i<data.list.length;i++){
					main_image.push(data.list[i].first_image);
				}			
				
			}
		});
			var table = [
				"001", 1, 1, 
				"002", 1, 2, 
				"003", 1, 3, 
				"004", 1, 4, 
				"005", 1, 5, 
				"006", 1, 6, 
				"007", 1, 7, 
				"008", 1, 8, 
				"009", 2, 1, 
				"010", 2, 2, 
				"011", 2, 3, 
				"012", 2, 4, 
				"013", 2, 5, 
				"014", 2, 6, 
				"015", 2, 7, 
				"016", 2, 8, 
				"017", 3, 1, 
				"018", 3, 2, 
				"019", 3, 3, 
				"020", 3, 4, 
				"021", 3, 5, 
				"022", 3, 6, 
				"023", 3, 7, 
				"024", 3, 8, 
				"025", 4, 1, 
				"026", 4, 2, 
				"027", 4, 3, 
				"028", 4, 4, 
				"029", 4, 5, 
				"030", 4, 6, 
				"031", 4, 7, 
				"032", 4, 8, 
				"033", 5, 1, 
				"034", 5, 2, 
				"035", 5, 3, 
				"036", 5, 4, 
				"037", 5, 5, 
				"038", 5, 6, 
				"039", 5, 7, 
				"040", 5, 8, 
				"041", 6, 1, 
				"042", 6, 2, 
				"043", 6, 3, 
				"044", 6, 4, 
				"045", 6, 5, 
				"046", 6, 6, 
				"047", 6, 7, 
				"048", 6, 8, 
				"049", 7, 1, 
				"050", 7, 2, 
				"051", 7, 3, 
				"052", 7, 4, 
				"053", 7, 5, 
				"054", 7, 6, 
				"055", 7, 7, 
				"056", 7, 8, 
				"057", 8, 1, 
				"058", 8, 2, 
				"059", 8, 3, 
				"060", 8, 4, 
				"061", 8, 5, 
				"062", 8, 6, 
				"063", 8, 7, 
				"064", 8, 8, 
				"065", 9, 1, 
				"066", 9, 2, 
				"067", 9, 3, 
				"068", 9, 4, 
				"069", 9, 5, 
				"070", 9, 6, 
				"071", 9, 7, 
				"072", 9, 8, 
				"073", 10, 1, 
				"074", 10, 2, 
				"075", 10, 3, 
				"076", 10, 4, 
				"077", 10, 5, 
				"078", 10, 6, 
				"079", 10, 7, 
				"080", 10, 8
			];
			var camera, scene, renderer;
			var controls;
			var objects = [];
			var targets = { table: [], sphere: [], helix: [], grid: [] };
			init();
			animate();
			function init() {
				camera = new THREE.PerspectiveCamera( 40, window.innerWidth / window.innerHeight, 1, 10000 );
				camera.position.z = 6000;
				scene = new THREE.Scene();
				// table
				console.log(table.length/3);
				for ( var i = 0; i < table.length; i += 3 ) {
					var element = document.createElement( 'div' );
					element.className = 'element';
					element.style.backgroundColor = 'rgb(255,255,255)';
					var symbol = document.createElement( 'div' );
					symbol.className = 'symbol';
					if(i==0){
						console.log(i);

						symbol.innerHTML = "<img src="+main_image[i]+" style='width:480px;height:320px;'/>";
					}else{
						console.log(i/3);

						symbol.innerHTML = "<img src="+main_image[i/3]+" style='width:480px;height:320px;'/>";
					}
					element.appendChild( symbol );
					var object = new THREE.CSS3DObject( element );
					object.position.x = Math.random() * 4000 - 2000;
					object.position.y = Math.random() * 4000 - 2000;
					object.position.z = Math.random() * 4000 - 2000;
					scene.add( object );
					objects.push( object );
					//
					var object = new THREE.Object3D();
					object.position.x = ( table[ i + 1 ] * 530 ) - 4000;
					object.position.y = - ( table[ i + 2 ] * 370 ) + 1900;
					targets.table.push( object );
				}
				// sphere
				var vector = new THREE.Vector3();
				for ( var i = 0, l = objects.length; i < l; i ++ ) {
					var phi = Math.acos( - 1 + ( 2 * i ) / l );
					var theta = Math.sqrt( l * Math.PI ) * phi;
					var object = new THREE.Object3D();
					object.position.setFromSphericalCoords( 2000, phi, theta );
					vector.copy( object.position ).multiplyScalar( 2 );
					object.lookAt( vector );
					targets.sphere.push( object );
				}
				// helix
				var vector = new THREE.Vector3();
				for ( var i = 0, l = objects.length; i < l; i ++ ) {
					var theta = i * 0.175 + Math.PI;
					var y = - ( i * 8 ) + 450;
					var object = new THREE.Object3D();
					object.position.setFromCylindricalCoords( 2400, theta, y );
					vector.x = object.position.x * 4;
					vector.y = object.position.y;
					vector.z = object.position.z;
					object.lookAt( vector );
					targets.helix.push( object );
				}
				// grid
				for ( var i = 0; i < objects.length; i ++ ) {
					var object = new THREE.Object3D();
					object.position.x = ( ( i % 5 ) * 500 ) - 1000;
					object.position.y = ( - ( Math.floor( i / 5 ) % 5 ) * 500 ) + 1000;
					object.position.z = ( Math.floor( i / 25 ) ) * 1000 - 2000;
					targets.grid.push( object );
				}
				//
				renderer = new THREE.CSS3DRenderer();
				renderer.setSize( window.innerWidth, window.innerHeight );
				document.getElementById( 'container' ).appendChild( renderer.domElement );
				//
				controls = new THREE.TrackballControls( camera, renderer.domElement );
				controls.rotateSpeed = 0.5;
				controls.minDistance = 500;
				controls.maxDistance = 6000;
				controls.addEventListener( 'change', render );
				
				$(function(){
					$(".symbol").click(function(){
						alert($(this).html);
					
					});
					var count=1;
					setInterval(function(){
						if(count==1){
							transform( targets.helix, 2000 );
						}else if(count==2){
							transform( targets.grid, 2000 );
						}else if(count==3){
							transform(targets.sphere,2000);
						}else if(count==4){
							transform( targets.table, 2000 );

						}
						count++;
						if(count>4){
							count=1;
						}
					},10000);
				})
				
				
				
				var button = document.getElementById( 'table' );
				button.addEventListener( 'click', function () {
					transform( targets.table, 2000 );
				}, false );
				var button = document.getElementById( 'sphere' );
				button.addEventListener( 'click', function () {
					transform( targets.sphere, 2000 );
				}, false );
				var button = document.getElementById( 'helix' );
				button.addEventListener( 'click', function () {
					transform( targets.helix, 2000 );
				}, false );
				var button = document.getElementById( 'grid' );
				button.addEventListener( 'click', function () {
					transform( targets.grid, 2000 );
				}, false );
				transform( targets.sphere, 2000 );
				//
				window.addEventListener( 'resize', onWindowResize, false );
			}
			function transform( targets, duration ) {
				TWEEN.removeAll();
				for ( var i = 0; i < objects.length; i ++ ) {
					var object = objects[ i ];
					var target = targets[ i ];
					new TWEEN.Tween( object.position )
						.to( { x: target.position.x, y: target.position.y, z: target.position.z }, Math.random() * duration + duration )
						.easing( TWEEN.Easing.Exponential.InOut )
						.start();
					new TWEEN.Tween( object.rotation )
						.to( { x: target.rotation.x, y: target.rotation.y, z: target.rotation.z }, Math.random() * duration + duration )
						.easing( TWEEN.Easing.Exponential.InOut )
						.start();
				}
				new TWEEN.Tween( this )
					.to( {}, duration * 2 )
					.onUpdate( render )
					.start();
			}
			function onWindowResize() {
				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();
				renderer.setSize( window.innerWidth, window.innerHeight );
				render();
			}
			function animate() {
				requestAnimationFrame( animate );
				TWEEN.update();
				controls.update();
			}
			function render() {
				renderer.render( scene, camera );
			}
		</script>
	</div>
	








<%@include file="MainFooter.jsp" %>


</body>
</html>
	