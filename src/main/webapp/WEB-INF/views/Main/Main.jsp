<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>발자취</title>
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
  
    
<style>
#background{
background-image:url('../resources/imgs/main.jpg');
background-size:100% 100%;

}
</style>
<script type="text/javascript">
$(function(){
	var windowWidth = $( window ).width();
	var bodysize=$("#background").width();

	$(window).resize(function(){
		 windowWidth = $( window ).width();
		console.log("윈도우 크기"+windowWidth);
	//$("#background").css("background-size",windowWidth 100%);
		
	});
});
</script>
</head><!--/head-->
<body id="background">
<%@include file="../Header.jsp" %>
    
    <div id="content-wrapper" style="margin-top:50px; overflow:hidden;">
        <script src="../resources/js/three.js"></script>
	<script src="../resources/js/tween.min.js"></script>
	<script src="../resources/js/TrackballControls.js"></script>
	<script src="../resources/js/CSS3DRenderer.js"></script>
	
		<div id="container" style="width:90%;"></div>
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
			"009", 1, 9, 
			"010", 2, 1, 
			"011", 2, 2, 
			"012", 2, 3, 
			"013", 2, 4, 
			"014", 2, 5, 
			"015", 2, 6, 
			"016", 2, 7, 
			"017", 2, 8, 
			"018", 2, 9, 
			"019", 3, 1, 
			"020", 3, 2, 
			"021", 3, 3, 
			"022", 3, 4, 
			"023", 3, 5, 
			"024", 3, 6, 
			"025", 3, 7, 
			"026", 3, 8, 
			"027", 3, 9, 
			"028", 4, 1, 
			"029", 4, 2, 
			"030", 4, 3, 
			"031", 4, 4, 
			"032", 4, 5, 
			"033", 4, 6, 
			"034", 4, 7, 
			"035", 4, 8, 
			"036", 4, 9, 
			"037", 5, 1, 
			"038", 5, 2, 
			"039", 5, 3, 
			"040", 5, 4, 
			"041", 5, 5, 
			"042", 5, 6, 
			"043", 5, 7, 
			"044", 5, 8, 
			"045", 5, 9, 
			"046", 6, 1, 
			"047", 6, 2, 
			"048", 6, 3, 
			"049", 6, 4, 
			"050", 6, 5, 
			"051", 6, 6, 
			"052", 6, 7, 
			"053", 6, 8, 
			"054", 6, 9, 
			"055", 7, 1, 
			"056", 7, 2, 
			"057", 7, 3, 
			"058", 7, 4, 
			"059", 7, 5, 
			"060", 7, 6, 
			"061", 7, 7, 
			"062", 7, 8, 
			"063", 7, 9, 
			"064", 8, 1, 
			"065", 8, 2, 
			"066", 8, 3, 
			"067", 8, 4, 
			"068", 8, 5, 
			"069", 8, 6, 
			"070", 8, 7, 
			"071", 8, 8, 
			"072", 8, 9, 
			"073", 9, 1, 
			"074", 9, 2, 
			"075", 9, 3, 
			"076", 9, 4, 
			"077", 9, 5, 
			"078", 9, 6, 
			"079", 9, 7, 
			"080", 9, 8, 
			"081", 9, 9, 
			"082", 10, 1, 
			"083", 10, 2, 
			"084", 10, 3, 
			"085", 10, 4, 
			"086", 10, 5, 
			"087", 10, 6, 
			"088", 10, 7, 
			"089", 10, 8, 
			"090", 10, 9, 
			"091", 11, 1, 
			"092", 11, 2, 
			"093", 11, 3, 
			"094", 11, 4, 
			"095", 11, 5, 
			"096", 11, 6, 
			"097", 11, 7, 
			"098", 11, 8, 
			"099", 11, 9, 
			"100", 12, 1, 
			"101", 12, 2, 
			"102", 12, 3, 
			"103", 12, 4, 
			"104", 12, 5, 
			"105", 12, 6, 
			"106", 12, 7, 
			"107", 12, 8, 
			"108", 12, 9, 
			"109", 13, 1, 
			"110", 13, 2, 
			"111", 13, 3, 
			"112", 13, 4, 
			"113", 13, 5, 
			"114", 13, 6, 
			"115", 13, 7, 
			"116", 13, 8, 
			"117", 13, 9, 
			"118", 14, 1, 
			"119", 14, 2, 
			"120", 14, 3, 
			"121", 14, 4, 
			"122", 14, 5, 
			"123", 14, 6, 
			"124", 14, 7, 
			"125", 14, 8
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
  

    <%@include file="../Footer.jsp"%>

</body>
</html>