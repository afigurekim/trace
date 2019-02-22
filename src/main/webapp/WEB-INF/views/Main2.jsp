<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | Impact By Distinctive Themes</title>
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="../resources/css/pe-icons.css" rel="stylesheet">
    <link href="../resources/css/prettyPhoto.css" rel="stylesheet">
    <link href="../resources/css/animate.css" rel="stylesheet">
    <link href="../resources/css/style.css" rel="stylesheet">
    <script src="../resources/js/jquery.js"></script>
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="../resources/imgs/ico/favicon.ico">
    <link rel="apple-touch-icon" sizes="144x144" href="../resources/imgs/ico/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="114x114" href="../resources/imgs/ico/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="../resources/imgs/ico/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" href="../resources/imgs/ico/apple-touch-icon-57x57.png">

    <script src="../resources/js/plugins.js"></script>
    <script src="../resources/js/bootstrap.min.js"></script>
    <script src="../resources/js/jquery.prettyPhoto.js"></script>   
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWDPCiH080dNCTYC-uprmLOn2mt2BMSUk&amp;sensor=true"></script> 
    <script src="../resources/js/init.js"></script>
    <script type="text/javascript">
   /* jQuery(document).ready(function($){
	'use strict';
      	jQuery('body').backstretch([
	        "../resources/imgs/bg/bg1.jpg",
	        "../resources/imgs/bg/bg2.jpg",
	        "../resources/imgs/bg/bg3.jpg"
	    ], {duration: 5000, fade: 500, centeredY: true });

	
    });*/
    </script>
</head><!--/head-->
<body>
<div id="preloader"></div>
    <header class="navbar navbar-inverse navbar-fixed-top " role="banner">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <i class="fa fa-bars"></i>
                </button>
                 <a class="navbar-brand" href="index.html"><h1><span class="pe-7s-gleam bounce-in"></span> 발자취</h1></a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/intro">소개</a></li>
                     <li class="dropdown active">
                       <a href="#" class="dropdown-toggle" data-toggle="dropdown">유적지 <i class="icon-angle-down"></i></a>
                        <ul class="dropdown-menu">
	                    <li><a href="/period">시대별</a></li>
	                    <li><a href="/thema">테마별</a></li>
	                    <li><a href="/region/main">지역별</a></li>
                        </ul>
                    </li> 

                    <li><a href="/join">회원가입</a></li> 
                    <li><a href="/login">로그인</a></li> 
                    <li><a href="/mypage">마이페이지</a></li> 
                    <li><a href="/write">공지사항</a></li> 
                    
                 
                    <li><span class="search-trigger"><i class="fa fa-search"></i></span></li>
                </ul>
            </div>
        </div>
    </header><!--/header-->
<div id="content" style="position:fixed; margin-top:40px;">
	<script src="../resources/js/three.js"></script>
	<script src="../resources/js/tween.min.js"></script>
	<script src="../resources/js/TrackballControls.js"></script>
	<script src="../resources/js/CSS3DRenderer.js"></script>
	
		<div id="container"></div>
		<div id="menu" style="display:none;">
			<button id="table">TABLE</button>
			<button id="sphere">SPHERE</button>
			<button id="helix">HELIX</button>
			<button id="grid">GRID</button>
		</div>

		<script type="text/javascript">
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
						}
						count++;
						if(count>3){
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
    <div id="content-wrapper">
        


     
        </div>

    <div id="footer-wrapper">
        
        <footer id="footer" class="">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        &copy; 2019 <a target="_blank" href="http://www.distinctivethemes.com" title="Premium Themes and Templates">Distinctive Themes</a>. All Rights Reserved.
                    </div>
                    <div class="col-sm-6">
                        <ul class="pull-right">
                            <li><a id="gototop" class="gototop" href="#"><i class="fa fa-chevron-up"></i></a></li><!--#gototop-->
                        </ul>
                    </div>
                </div>
            </div>
        </footer><!--/#footer-->
    </div>


</body>
</html>