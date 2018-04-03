package  {
	//Importamos las librerías necesarias
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	import flash.net.URLRequest;
	import flash.events.*;
	import flash.net.*;
	import flash.display.*;
	
	public class Proyecto extends MovieClip{
		
		//Declaramos el objeto de la galeria
		var v:simpleFlv = new simpleFlv();
		
		//Variables de validacion
		var validar:int = 0;
		var validarV:int = 0;
		
		//Variables a utilizar
		//son propias del XML y se usarán
		//en la galería
		var columnas:Number;
		var xs:Number;
		var ye:Number;
		var thumb_width:Number;
		var thumb_height:Number;
		var images:XMLList;
		var total:Number;
		//MovieClips que se utilizarán
		var container_mc:MovieClip;
		var preloaders_mc:MovieClip;
		var full_mc:MovieClip;
		var x_counter:Number = 0;
		var y_counter:Number = 0;
		//Tweens
		var my_tweens:Array = [];
		var container_mc_tween:Tween;
		var full_tween:Tween;
		
		public function Proyecto() {
			
			//Empezamos con los Tweens de la portada
			var poli_mcc:Tween = new Tween(mcLogo,"y",Strong.easeIn,-100,19.85,3,true);
			var nombre_mcc:Tween = new Tween(mcUPV,"x",Bounce.easeIn,-300,371.20,1,true);
			var pra_mcc:Tween = new Tween(mcNombre,"x",Strong.easeIn,-300,406.85,2,true);
			var hm_mcc:Tween = new Tween(mcMatricula,"x",Strong.easeIn,-300,380.10,1,true);
			var siguienecc_mc:Tween = new Tween(mcPractica,"y",Strong.easeIn,-410,343.00,2,true);
			var logo_mcc:Tween = new Tween(mcHerramientas,"y",Strong.easeIn,-500,267.25,1,true);
			//Y el botón entrar con su listener
			btnEntrar.addEventListener(MouseEvent.CLICK,entrar);
		}
		//Función entrar que se ejecuta con el botón del primer
		//frame
		function entrar(e:MouseEvent):void{
			//Me manda al segundo frame y empieza todos los
			//listeners
			gotoAndStop(2);
			//BOTONES PRINCIPALES DE LA IZQUIERDA
			btnPractica.addEventListener(MouseEvent.CLICK,verPracticas);
			btnGaleria.addEventListener(MouseEvent.CLICK,galerias);
			btnVideojuegos.addEventListener(MouseEvent.CLICK,videojuegoss);
			btnInicio.addEventListener(MouseEvent.CLICK,inicios);
			btnVideos.addEventListener(MouseEvent.CLICK,videosT);
			//BOTONES DE PRACTICAS
			practicas.p1.addEventListener(MouseEvent.CLICK,ir1);
			practicas.p2.addEventListener(MouseEvent.CLICK,ir2);
			practicas.p3.addEventListener(MouseEvent.CLICK,ir3);
			practicas.p4.addEventListener(MouseEvent.CLICK,ir4);
			practicas.p5.addEventListener(MouseEvent.CLICK,ir5);
			practicas.p6.addEventListener(MouseEvent.CLICK,ir6);
			practicas.p7.addEventListener(MouseEvent.CLICK,ir7);
			practicas.p8.addEventListener(MouseEvent.CLICK,ir8);
			practicas.p9.addEventListener(MouseEvent.CLICK,ir9);
			practicas.p10.addEventListener(MouseEvent.CLICK,ir10);
			practicas.p11.addEventListener(MouseEvent.CLICK,ir11);
			practicas.p12.addEventListener(MouseEvent.CLICK,ir12);
			practicas.p13.addEventListener(MouseEvent.CLICK,ir13);
			practicas.p14.addEventListener(MouseEvent.CLICK,ir14);
			//BOTONES DE VIDEOJUEGOS
			videojuegos.v1.addEventListener(MouseEvent.CLICK,irv1);
			videojuegos.v2.addEventListener(MouseEvent.CLICK,irv2);
			videojuegos.v3.addEventListener(MouseEvent.CLICK,irv3);
			videojuegos.v4.addEventListener(MouseEvent.CLICK,irv4);
		}
		
		function inicios(e:MouseEvent):void{
			//FUNCIÓN AL PRESIONAR INICIO
			inicio.x = 223.95;
			//tween 
			var inicioTween:Tween = new Tween(inicio,"alpha",Strong.easeIn,0,1,1,true);		
			//mandamos todos los movie clips fuera
			practicas.x = 1045;
			videojuegos.x = 1045;
			videos.x = 1045;
			//validamos que no este la galeria abierta
			if(validar > 0){
				removeChild(container_mc);
				x_counter = 0;
				y_counter = 0;
				validar = 0;
			}
			//validamos que se esten viendo los videos
			if(validarV > 0){
				v.remover();
				validarV = 0;
			}
		}
		
		function videosT(e:MouseEvent):void{
			//FUNCION PARA EL BOTÓN DE VIDEOS
			//Videos
			//Usamos Tweens para mover
			var videosTween:Tween = new Tween(videos,"x",Strong.easeIn,1045,264.55,1.3,true);
			var inicioTween:Tween = new Tween(inicio,"alpha",Strong.easeIn,1,0,1,true);
			//mandamos todo a otro lado
			practicas.x = 1045;
			videojuegos.x = 1045;
			inicio.x = 1045;
			//añadimos listeners de los eventos de videos
			videos.video1.addEventListener(MouseEvent.CLICK,ingles);
			videos.video2.addEventListener(MouseEvent.CLICK,espanol);
			//validamos la galeria
			if(validar > 0){
				removeChild(container_mc);
				x_counter = 0;
				y_counter = 0;
				validar = 0;
			}
			validarV++;
		}
		//FUNCIONES DE VIDEOS PARA REPRODUCIR
		function espanol(e:MouseEvent):void{
			var videosTween:Tween = new Tween(videos,"x",Strong.easeIn,264.55,1045,1.3,true);
			v.playMyFlv("videoEspanol.mp4");
			addChild(v);
		}
		function ingles(e:MouseEvent):void{
			var videosTween:Tween = new Tween(videos,"x",Strong.easeIn,264.55,1045,1.3,true);
			v.playMyFlv("videoIngles.mp4");
			addChild(v);
		}
		
		function verPracticas(e:MouseEvent):void{
			//FUNCIÓN PARA PRÁCTICAS
			//Tweens
			var practicasa:Tween = new Tween(practicas,"x",Strong.easeIn,1045,211.85,1.3,true);
			var inicioTween:Tween = new Tween(inicio,"alpha",Strong.easeIn,1,0,1,true);
			videojuegos.x = 1045;
			inicio.x = 1045;
			videos.x = 1045;
			//validamos la galeria
			if(validar > 0){
				removeChild(container_mc);
				x_counter = 0;
				y_counter = 0;
				validar = 0;
			}
			//validamos los videos
			if(validarV > 0){
				v.remover();
				validarV = 0;
			}
		}
		function videojuegoss(e:MouseEvent):void{
			//FUNCIÓN DE VIDEOJUEGOS
			var videojue:Tween = new Tween(videojuegos,"x",Strong.easeIn,1045,293.05,1.3,true);
			var inicioTween:Tween = new Tween(inicio,"alpha",Strong.easeIn,1,0,1,true);
			practicas.x = 1045;
			videos.x = 1045;
			inicio.x = 1045;
			if(validar > 0){
				removeChild(container_mc);
				x_counter = 0;
				y_counter = 0;
				validar = 0;
			}
			if(validarV > 0){
				v.remover();
				validarV = 0;
			}
		}
		
		function galerias(e:MouseEvent):void{
			validar++;
			practicas.x = 1045;
			videos.x = 1045;
			inicio.x = 1045;
			videojuegos.x = 1045;
			if(validarV > 0){
				v.remover();
				validarV = 0;
			}
			//Sacamos el xml de donde es y lo ejecutamos
			var myXMLLoader:URLLoader = new URLLoader();
			myXMLLoader.load(new URLRequest("galeria.xml"));
			myXMLLoader.addEventListener(Event.COMPLETE, procesoXML);
		}
		function ir1(e:MouseEvent):void{
			var miURL: URLRequest = new URLRequest("html/t3/tarea3.html");
			navigateToURL(miURL, "self");
		}
		function ir2(e:MouseEvent):void{
			var miURL: URLRequest = new URLRequest("html/t4/tarea4.html");
			navigateToURL(miURL, "self");
		}
		function ir3(e:MouseEvent):void{
			var miURL: URLRequest = new URLRequest("html/t5/t5.html");
			navigateToURL(miURL, "self");
		}
		function ir4(e:MouseEvent):void{
			var miURL: URLRequest = new URLRequest("html/p1/p1.html");
			navigateToURL(miURL, "self");
		}
		function ir5(e:MouseEvent):void{
			var miURL: URLRequest = new URLRequest("html/p2/p2.html");
			navigateToURL(miURL, "self");
		}
		function ir6(e:MouseEvent):void{
			var miURL: URLRequest = new URLRequest("html/p3/p3.html");
			navigateToURL(miURL, "self");
		}
		function ir7(e:MouseEvent):void{
			var miURL: URLRequest = new URLRequest("html/p4/p4.html");
			navigateToURL(miURL, "self");
		}
		function ir8(e:MouseEvent):void{
			var miURL: URLRequest = new URLRequest("html/p5/p5.html");
			navigateToURL(miURL, "self");
		}
		function ir9(e:MouseEvent):void{
			var miURL: URLRequest = new URLRequest("html/p6/p6.html");
			navigateToURL(miURL, "self");
		}
		function ir10(e:MouseEvent):void{
			var miURL: URLRequest = new URLRequest("html/p7/p7.swf");
			navigateToURL(miURL, "self");
		}
		function ir11(e:MouseEvent):void{
			var miURL: URLRequest = new URLRequest("html/p8/p8.html");
			navigateToURL(miURL, "self");
		}
		function ir12(e:MouseEvent):void{
			var miURL: URLRequest = new URLRequest("html/p9/p9.html");
			navigateToURL(miURL, "self");
		}
		function ir13(e:MouseEvent):void{
			var miURL: URLRequest = new URLRequest("html/p10/pratica10.swf");
			navigateToURL(miURL, "self");
		}
		function ir14(e:MouseEvent):void{
			var miURL: URLRequest = new URLRequest("html/p11/p11.html");
			navigateToURL(miURL, "self");
		}
		function irv1(e:MouseEvent):void{
			var miURL: URLRequest = new URLRequest("html/v3/p4.html");
			navigateToURL(miURL, "self");
		}
		function irv2(e:MouseEvent):void{
			var miURL: URLRequest = new URLRequest("html/v2/memorama.html");
			navigateToURL(miURL, "self");
		}
		function irv3(e:MouseEvent):void{
			var miURL: URLRequest = new URLRequest("html/v1/serp.html");
			navigateToURL(miURL, "self");
		}
		function irv4(e:MouseEvent):void{
			var miURL: URLRequest = new URLRequest("html/v4/gato.html");
			navigateToURL(miURL, "self");
		}
		
		//Guardamos en variables locales los datos del xml
		function procesoXML(e:Event):void {
			var myXML:XML = new XML(e.target.data);
			//Estos son datos del xml
			columnas = myXML.@COLUMNAS;
			xs = myXML.@XPOSICION;
			ye = myXML.@YPOSICION;
			thumb_width = myXML.@WIDTH;
			thumb_height = myXML.@HEIGHT-3;
			images = myXML.IMAGE;
			//Total de imagenes
			total = images.length();
		
			//Ejecutamos los métodos necesarios para crear los movieclips
			createContainer();
			//Y llamamos las imagenes pequeñas
			callThumbs();

		}
		
		//Crear los contenidos
		//En esta funcion tenemos los containers 
		//Esta es la funcion que se ejecuta mas arriba
		function createContainer():void {
			//Creamos el movieclip
			container_mc = new MovieClip();
			//En la posicion x y y especificada
			container_mc.x = xs+90;
			container_mc.y = ye;
			//Y lo añadimos
			addChild(container_mc);
			//Añadimos un listener al dar clic
			container_mc.addEventListener(MouseEvent.CLICK, callFull);
			//ESTO NO SE HA VISTO EN CLASE
			//SE COLOCA COMO SI FUERA BOTÓN
			container_mc.buttonMode = true;
			
			//Creamos un nuevo MovieClip
			//En la posicion x y y de mi container 
			preloaders_mc = new MovieClip();
			preloaders_mc.x = container_mc.x;
			preloaders_mc.y = container_mc.y;
			//Lo agregamos
			addChild(preloaders_mc);
		}
		//Función llamada de las imágenes
		function callThumbs():void {
			//For que se va a ejecutar por cada imagen que tengamos
			for (var i:Number = 0; i < total; i++) {
				
				//Creamos la variable thumb que guardaremos el xml
				var th:String = images[i].@THUMB;
				
				if(!(th == "thumbs/thumb1.jpg") && !(th == "thumbs/thumb2.jpg") && !(th == "thumbs/thumb3.jpg") && !(th == "thumbs/thumb4.jpg") 
				   && !(th == "thumbs/thumb5.jpg") && !(th == "thumbs/thumb6.jpg") && !(th == "thumbs/thumb7.jpg") && !(th == "thumbs/thumb8.jpg")
				   && !(th == "thumbs/thumb9.jpg") && !(th == "thumbs/thumb10.jpg") && !(th == "thumbs/thumb11.jpg") && !(th == "thumbs/thumb12.jpg")
				   && !(th == "thumbs/thumb13.jpg") && !(th == "thumbs/thumb14.jpg") && !(th == "thumbs/thumb15.jpg")&& !(th == "thumbs/thumb16.jpg")
				   && !(th == "thumbs/thumb17.jpg") && !(th == "thumbs/thumb18.jpg") && !(th == "thumbs/thumb19.jpg") && !(th == "thumbs/thumb20.jpg")){
					var thumb_url = "thumbs/cuatro.png";
				}else{
					var thumb_url = images[i].@THUMB;
				}
				
				//Guardamos en el Loader
				var thumb_loader = new Loader();
				//Hacemos un request
				thumb_loader.load(new URLRequest(thumb_url));
				//Tenemos un listener de evento completo
				thumb_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, thumbLoaded);
				//Agregamos un nombre
				thumb_loader.name = i;
				//Asignamos posiciones x y y
				thumb_loader.x = (thumb_width+15)*x_counter;
				thumb_loader.y = (thumb_height+10)*y_counter;
				//Si ya es más grande que las columnas entonces
				//Agregamos una columna en x y y
				if (x_counter+1 < columnas) {
					x_counter++;
				} else {
					x_counter = 0;
					y_counter++;
				}
			}
		}
		
		//Funcion de cuando se ejecuten las imagenes peque{as
		function thumbLoaded(e:Event):void {
			//Agregamos un loader
			var my_thumb:Loader = Loader(e.target.loader);
			//Se lo añadimos a cada uno de los containers
			container_mc.addChild(my_thumb);
			//Creamos un Tween que tampoco se ha visto en clase
			//Pero que investigue y se coloca un "alpha" que es un Tween
			//Nuevo
			my_tweens[Number(my_thumb.name)]=new Tween(my_thumb, "alpha", Strong.easeIn, 0,1,0.5, true);
			
			//Removemos el listener
			my_thumb.contentLoaderInfo.removeEventListener(Event.COMPLETE, thumbLoaded);
		}
		
		function callFull(e:MouseEvent):void {
			//Nuevo loader
			var full_loader:Loader = new Loader();
			//Guardamos la url completa con el nombre de las imagenes
			var th:String = images[e.target.name].@FULL;
				
				if(!(th == "full_images/image1.jpg") && !(th == "full_images/image2.jpg") && !(th == "full_images/image3.jpg") && !(th == "full_images/image4.jpg") 
				   && !(th == "full_images/image5.jpg") && !(th == "full_images/image6.jpg") && !(th == "full_images/image7.jpg") && !(th == "full_images/image8.jpg")
				   && !(th == "full_images/image9.jpg") && !(th == "full_images/image10.jpg") && !(th == "full_images/image11.jpg") && !(th == "full_images/image12.jpg")
				   && !(th == "full_images/image13.jpg") && !(th == "full_images/image14.jpg") && !(th == "full_images/image15.jpg")&& !(th == "full_images/image16.jpg")
				   && !(th == "full_images/image17.jpg") && !(th == "full_images/image18.jpg") && !(th == "full_images/image19.jpg") && !(th == "full_images/image20.jpg")){
					var full_url = "full_images/cuatro.jpg";
				}else{
					var full_url = images[e.target.name].@FULL;
				}
						
			//Creamos un url request
			full_loader.load(new URLRequest(full_url));
			//Creamos un url loader con un eventListener
			full_loader.contentLoaderInfo.addEventListener(Event.INIT, fullLoaded);
			//Quitamos que sea botón
			container_mc.buttonMode = false;
		}
		//Función para añadir las imagenes 
		function fullLoaded(e:Event):void {
			//Creamos un movieclip nuevo
			full_mc = new MovieClip();
			//Lo colocamos en boton
			full_mc.buttonMode = true;
			//Añadimos un child
			addChild(full_mc);
			//Creamos un loader
			var my_loader:Loader = Loader(e.target.loader);
			//Añadimos un child de my_loader
			full_mc.addChild(my_loader);
			//Tween alpha que se explico antes
			full_tween = new Tween(my_loader, "alpha", Strong.easeIn, 0,1,1.5, true);
			//Posicion en x y y a la mitad de mi frame
			my_loader.x = ((1023 - my_loader.width)/2)+40;
			//my_loader.x = 400;
			my_loader.y = (768 - my_loader.height)/2;
			//Añadimos un listener al loader para cerrar la imagen grande
			my_loader.addEventListener(MouseEvent.CLICK,removeFull);
		}
		//Funcion para eliminar la foto grande
		function removeFull(e:MouseEvent):void {
			//Loader
			var my_loader:Loader = Loader (e.currentTarget);
			//tween para eliminar la foto grande
			full_tween = new Tween(my_loader, "alpha", Strong.easeOut, 1,0,0.5, true);
			//Motion_FINISH para eliminar el tween
			full_tween.addEventListener(TweenEvent.MOTION_FINISH, tweenFinished);
		}
		
		//Tween terminado
		function tweenFinished(e:TweenEvent):void {
			//Loader
			var my_loader:Loader = Loader (e.target.obj);
			//Unload para eliminar el loader
			my_loader.unload();
			//Removemos el objeto  del loader
			full_mc.removeChild(my_loader);
			//Eliminamos la foto completa
			removeChild(full_mc);
			//Colocamos en nulo para eliminarlo
			full_mc = null;
			//Volvemos a añadir el listener y en modo botón
			container_mc.addEventListener(MouseEvent.CLICK, callFull);
			container_mc.buttonMode = true;
			//Tween presente para 
			var my_tween:Tween = Tween(e.target);
			my_tween.removeEventListener(TweenEvent.MOTION_FINISH, tweenFinished);
		}
	}
}

