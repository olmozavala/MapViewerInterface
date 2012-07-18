


 
 

<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN"
	"http://www.w3.org/tr/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/Atlas Open Layers.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<link rel="icon" href="/DeepCProject/common/images/icon/Gulf.ico" type="image/x-icon" />
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<meta name="Description" content="Atlas template description" />
		<meta name="Keywords" content="Climatic atlas" />
		
		<link href="/DeepCProject/common/CSS/mapStyle.css" rel="stylesheet" type="text/css"/>
		<!--[if gte IE 6]>
		<link href="/DeepCProject/common/CSS/mapStyleIE.css" rel="stylesheet" type="text/css"/>
		<![endif]-->
		<link href="/DeepCProject/common/CSS/calendar/jscal2.css" rel="stylesheet" type="text/css"/>
		<link href="/DeepCProject/common/CSS/calendar/border-radius.css" rel="stylesheet" type="text/css"/>
		<link href="/DeepCProject/common/CSS/calendar/reduce-spacing.css" rel="stylesheet" type="text/css"/>
		<link href="/DeepCProject/common/CSS/calendar/steel/steel.css" rel="stylesheet" type="text/css"/>
		
		<!--		<script type="text/javascript" src="http://openlayers.org/api/OpenLayers.js"></script>-->
		<script type="text/javascript" src="/DeepCProject/common/JS/openlayers/OpenLayers.js"> </script>
		<script type="text/javascript" src="/DeepCProject/common/JS/utilities.js"> </script>
		<script type="text/javascript" src="/DeepCProject/common/JS/mapDisplay/mapDisplay.js"> </script>
		<script type="text/javascript" src="/DeepCProject/common/JS/mapDisplay/animation.js"> </script>
		<script type="text/javascript" src="/DeepCProject/common/JS/validation.js"> </script>
		<script type="text/javascript" src="/DeepCProject/common/JS/ajax/ajax.js"> </script>
		<script type="text/javascript" src="/DeepCProject/common/JS/fecha/funciones.js"></script>
		<script type="text/javascript" src="/DeepCProject/common/JS/calendar/jscal2.js"></script>
		<script type="text/javascript" src="/DeepCProject/common/JS/calendar/lang/en.js"></script>
		
		<script type="text/javascript"  >
			var layerDetails = {"numColorBands":254,"moreInfo":"","scaleRange":["10.0","34.0"],"timeAxisUnits":"ISO8601","supportedStyles":["boxfill"],"defaultPalette":"rainbow","copyright":"","nearestTimeIso":"2010-12-31T00:00:00.000Z","units":"degC","logScaling":false,"datesWithData":{"2010":{"9":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31],"8":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30],"7":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31],"6":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31],"5":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30],"4":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31],"3":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30],"11":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31],"2":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31],"10":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30],"1":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28],"0":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]}},"zaxis":{"positive":false,"values":[0,-5,-10,-15,-20,-25,-30,-40,-50,-60,-70,-80,-90,-100,-125,-150,-200,-250,-300,-400,-500,-600,-700,-800,-900,-1000,-1100,-1200,-1300,-1400,-1500,-1750,-2000,-2500,-3000,-3500,-4000,-4500,-5000,-5500],"units":"m"},"palettes":["alg","redblue","ncview","greyscale","alg2","occam","rainbow","sst_36","occam_pastel-30","ferret"],"bbox":["-98.0","18.09164810180664","-76.4000244140625","31.960647583007812"]};
			var mainLayer = 'hycom2010/temperature';
			var mappalette= 'default';
			var basepath= '/DeepCProject';
			var style= 'boxfill';
			var map;
			var opacity = 1;//Default opacity
			var widthNum = 0;
			var heightNum = 0;
			var minPalVal = layerDetails.scaleRange[0];
			var maxPalVal  = layerDetails.scaleRange[1];
			var netcdf = true;
		</script>
		
		
<script type="text/javascript"  >
	var width;
	var height;
	// TODO verify how this variable works for other layers and see
	// from where we can obtain the current elevation.
	var elevation = 0;

	//Should contain the selected start date and is used to obtain punctual
	// data from the temporal data.
	var startDate;

	//Creates 100 layer objects
	for(var i = 0; i<100; i++)
	{
	   eval("var layer"+i);
	}

	OpenLayers.IMAGE_RELOAD_ATTEMPTS=5;
	OpenLayers.DOTS_PER_INCH=90.7142857142857;
	OpenLayers.Util.onImageLoadErrorColor = 'transparent';
	function init(){
		//var screenRef = window.screen;
		var widthNum = 0; //Variable numerica que guarda el ancho de la pantalla cliente
		var heightNum =0; //Variable numerica que guarda el alto de la pantalla cliente
		if (parseInt(navigator.appVersion)) {//Verificamos el tipo de navegador del cliente
		  if (navigator.appName=='Netscape') {//Si el navegador es Netscape
			  //Se obtiene el numero de columnas y renglones de la siguiente forma
			  widthNum = window.innerWidth;
			  heightNum = window.innerHeight;
		}
		if (navigator.appName.indexOf('Microsoft')!=-1) {//Si el navegador es Explorer
			  //Se obtiene el numero de columnas y renglones de la siguiente forma
			  widthNum = document.body.offsetWidth;
			  heightNum = document.documentElement.clientHeight;
		 }
		}
		// Modifies the size of the map. The multiplied value represent the proportion of the screen 1 being complete screen 
		// The -1 is used to avoid a bug when using zoom with mouse selection
		widthNum  = Math.round(widthNum*1.0 -1);
		heightNum = Math.round(heightNum*1.0 -1);
		//Convertimos los numeros a cadenas
		width  = widthNum.toString();
		height = heightNum.toString();
		//Modificamos el ancho y alto del mapa de OPenLayers que contiene las capas del servidor de mapas
		document.getElementById('map').style.width = width+'px';
		document.getElementById('map').style.height= height+'px';

		var bounds = new OpenLayers.Bounds(-180.0,-90.0,180.0,90.0);

		var options = { controls: [],maxExtent: bounds,numZoomLevels: 6,maxResolution: 0.05,
								minResolution: 0.01,projection: 'EPSG:4326',units: 'degrees'};

		map = new OpenLayers.Map('map', options);
		map.addControl(new OpenLayers.Control.PanZoomBar({div: $('panZoom')}));
		map.addControl(new OpenLayers.Control.Navigation());
//		map.addControl(new OpenLayers.Control.LayerSwitcher({allowSelection:true});
//		map.addControl(new OpenLayers.Control.OverviewMap());
		map.addControl(new OpenLayers.Control.KeyboardDefaults());
		map.addControl(new OpenLayers.Control.ScaleLine({topOutUnits: 'km'}));
		map.addControl(new OpenLayers.Control.MousePosition({element: $('location')}));

		
	layer0 = new OpenLayers.Layer.WMS(
			"bluemarble","http://maps.opengeo.org/geowebcache/service/wms",
			{layers: 'bluemarble', format: 'image/png' },
			{ tileSize: new OpenLayers.Size(256,256)});

	layer1 = new OpenLayers.Layer.WMS('2010 Temperature','http://viewer.coaps.fsu.edu/ncWMS/wms', {height: 512,width: 512,layers: 'hycom2010/temperature',styles: '',srs: 'EPSG:4326',transparent: true,format_options: '',format: 'image/gif',tiled: true,tilesOrigin: '-98.0,18.09164810180664'},
			{transitionEffect: 'resize'},{buffer: 1, displayOutsideMaxExtent: true});
	layer2 = new OpenLayers.Layer.WMS('Name Not found','http://viewer.coaps.fsu.edu/geoserver/wms', {height: 512,width: 512,layers: 'comm:states',styles: '',srs: 'EPSG:4326',transparent: true,format_options: '',format: 'image/jpeg',tiled: true,tilesOrigin: '-120.0,-59.983333333333'},
			{buffer: 1, displayOutsideMaxExtent: true});
	layer2.setVisibility(false);
	layer3 = new OpenLayers.Layer.WMS('Name Not found','http://viewer.coaps.fsu.edu/geoserver/wms', {height: 512,width: 512,layers: 'comm:test',styles: '',srs: 'EPSG:4326',transparent: true,format_options: '',format: 'image/jpeg',tiled: true,tilesOrigin: '-120.0,-59.983333333333'},
			{buffer: 1, displayOutsideMaxExtent: true});
	layer3.setVisibility(false);
	map.addLayers([layer0,layer1,layer2,layer3]);

	map.events.register('click', map, function (e) {
		var url0 ='/DeepCProject/redirect?server=http://viewer.coaps.fsu.edu/geoserver/wms&LAYERS=comm:gebco&STYLES=&WIDTH='+map.size.w+'&HEIGHT='+map.size.h+'&SRS=EPSG:4326&FORMAT=image/jpeg&SERVICE=WMS&VERSION=1.1.1&REQUEST=GetFeatureInfo&EXCEPTIONS=application/vnd.ogc.se_xml&BBOX='+map.getExtent().toBBOX()+'&x='+parseInt(e.xy.x)+'&y='+parseInt(e.xy.y)+'&INFO_FORMAT=text/html&NETCDF=false&QUERY_LAYERS=comm:gebco&FEATURE_COUNT=50';
		if(layer0.getVisibility()){
			 setPopUp(e);
			 var asynchronous0 = new Asynchronous();
			 asynchronous0.complete = AsyncUpdateEvent;
			 asynchronous0.call(url0);
		}
		var url1 ='/DeepCProject/redirect?server=http://viewer.coaps.fsu.edu/ncWMS/wms&LAYERS=hycom2010/temperature&STYLES=&WIDTH='+map.size.w+'&HEIGHT='+map.size.h+'&SRS=EPSG:4326&FORMAT=image/gif&SERVICE=WMS&VERSION=1.1.1&REQUEST=GetFeatureInfo&EXCEPTIONS=application/vnd.ogc.se_xml&BBOX='+map.getExtent().toBBOX()+'&x='+parseInt(e.xy.x)+'&y='+parseInt(e.xy.y)+'&ELEVATION='+elevation+'&TIME='+startDate+'&INFO_FORMAT=text/xml&NETCDF=true&QUERY_LAYERS=hycom2010/temperature&FEATURE_COUNT=50';
		if(layer1.getVisibility()){
			 setPopUp(e);
			 var asynchronous1 = new Asynchronous();
			 asynchronous1.complete = AsyncUpdateEvent;
			 asynchronous1.call(url1);
		}
		var url2 ='/DeepCProject/redirect?server=http://viewer.coaps.fsu.edu/geoserver/wms&LAYERS=comm:states&STYLES=&WIDTH='+map.size.w+'&HEIGHT='+map.size.h+'&SRS=EPSG:4326&FORMAT=image/jpeg&SERVICE=WMS&VERSION=1.1.1&REQUEST=GetFeatureInfo&EXCEPTIONS=application/vnd.ogc.se_xml&BBOX='+map.getExtent().toBBOX()+'&x='+parseInt(e.xy.x)+'&y='+parseInt(e.xy.y)+'&INFO_FORMAT=text/html&NETCDF=false&QUERY_LAYERS=comm:states&FEATURE_COUNT=50';
		if(layer2.getVisibility()){
			 setPopUp(e);
			 var asynchronous2 = new Asynchronous();
			 asynchronous2.complete = AsyncUpdateEvent;
			 asynchronous2.call(url2);
		}
		var url3 ='/DeepCProject/redirect?server=http://viewer.coaps.fsu.edu/geoserver/wms&LAYERS=comm:test&STYLES=&WIDTH='+map.size.w+'&HEIGHT='+map.size.h+'&SRS=EPSG:4326&FORMAT=image/jpeg&SERVICE=WMS&VERSION=1.1.1&REQUEST=GetFeatureInfo&EXCEPTIONS=application/vnd.ogc.se_xml&BBOX='+map.getExtent().toBBOX()+'&x='+parseInt(e.xy.x)+'&y='+parseInt(e.xy.y)+'&INFO_FORMAT=text/html&NETCDF=false&QUERY_LAYERS=comm:test&FEATURE_COUNT=50';
		if(layer3.getVisibility()){
			 setPopUp(e);
			 var asynchronous3 = new Asynchronous();
			 asynchronous3.complete = AsyncUpdateEvent;
			 asynchronous3.call(url3);
		}
	});
map.zoomToMaxExtent();
	map.setCenter(new OpenLayers.LonLat(lon=-87.08335,lat=25.0))
	map.zoomTo(2)


	}
</script>
		
		<title>Gulf of Mexico</title>
	</head>
	<body onload="init();initNetcdf('');" scroll="no">
		
		<div class="mapTitle" id="layerTitle"> <p> Deep-C Gulf of Mexico<br> 2010 Temperature </p> </div>
		<div id="map"> <!-- This div contains all the map --> </div>      
		<div id="mapOverlayDiv" ><img id="mapOverlay" alt="map overlay" onload="javascript:animationLoaded();" /></div>
<!--		<div id="panZoom"></div>-->
		
		<!--	Divs that contains the calendars	-->
		<div class="startDateCal" id="cal-start"><p class="calTitle">Start date (Current)</p></div>
		<div class="endDateCal" id="cal-end"><p class="calTitle">End date</p></div>
		<div class="dispAnimation" id="p-animation">
			<table >
				<tr><td style="width:140px">
						<p class="invShadow"  onclick="dispAnimation();" onmouseover="changeShadow(this, 1);" 
						   onmouseout="changeShadow(this,2)"> Display animation </p> </td>
					<td style="width:190px; text-align: center" >
						<select id="timeSelect" name="timeSelect">
						</select>
					</td>
				</tr>
			</table>
		</div>
		
		<!-- This is the div that contains all of the user options, drop down of
				  main layers, vector layers, kml data, etc. -->
		<div id="layersMenu" class="layersMenu">
			<form id="baseForm" name="baseForm" action="/DeepCProject/mapviewer" method="post">
				<table class="menus" border="0">
					<!-- Creates the menus from the static function createMenu inside HtmlMenuBuilder -->
					
					<tr><td class='simpleSpace'>
						<select class='menu' id='dropDownLevels1' name='dropDownLevels' onchange='MapViewersubmitForm();'>
							<option value='Temp' selected>Temperature </option>
							<option value='Salinity' >Salinity </option>
							<option value='SeaElev' >Elevation </option>
							<option value='SeaVel' >Velocity </option>
					</select></td></tr>

					<tr><td class='simpleSpace'>
						<select class='menu' id='dropDownLevels2' name='dropDownLevels' onchange='MapViewersubmitForm();'>
							<option value='2010' selected>2010 </option>
							<option value='2011' >2011 </option>
							<option value='2012' >2012 </option>
					</select></td></tr>
 
					<!-- Transparency -->
					<tr id="transParag"><td>
							<p class="alphaText"> 
								<img class="alphaText" border="0" onclick="changeTransp(.15);" 
									 onmouseover="rollImage(this,'/DeepCProject/common/images/Menu/MinusInv.png' )"
									 onmouseout="rollImage(this,'/DeepCProject/common/images/Menu/Minus.png' )"
									 src="/DeepCProject/common/images/Menu/Minus.png" alt="DecTrans" width="20" height="20" />
								Transparency 
								<img class="alphaText" border="0" onclick="changeTransp(-.15);"
									 onmouseover="rollImage(this,'/DeepCProject/common/images/Menu/PlusInv.png' )"
									 onmouseout="rollImage(this,'/DeepCProject/common/images/Menu/Plus.png' )"
									 src="/DeepCProject/common/images/Menu/Plus.png" alt="IncTrans" width="20" height="20" /></p>
						</td></tr>
					<!--					If the layer is a netcdf file then we show the optional and default palettes-->
					 
						<tr><td>
								<select id="paletteSelect" name="paletteSelect" onchange="UpdatePalette();"
										onkeyup="UpdatePalette();" onkeydown="UpdatePalette();">
								</select>
							</td></tr>
						<tr><td>
								<table border="0" class="palette" align="center">
									<tr>
										<td> <img id="imgPalette" src="http://viewer.coaps.fsu.edu/ncWMS/wms?REQUEST=GetLegendGraphic&LAYER=hycom2010/temperature&COLORBARONLY=true&PALETTE=default&WIDTH=20&HEIGHT=100&NUMCOLORBANDS=254"/></td>
										<td class="waitBack">
											<p class="palMinMax">
												&nbsp; 
												max: <input onblur="UpdatePalette(); "id="maxPal" name="maxPal" type="text" size="2" /> 
												&nbsp;
												<br><br><br><br> 
												&nbsp;
												min: <input onblur="UpdatePalette();" id="minPal" name="minPal" type="text" size="2" />
												&nbsp;
											</p>
										</td>
									</tr>
						</tr>
					</table>
					
					</td></tr>
				
				
				<tr style="display: none;"><td align="center">
						<!-- Link to download the real data (Geotiff file) -->
						<p id="downloadData" class="defShadow" onclick="getWCSV1Ajax('/DeepCProject');" onmouseover="changeShadow(this,2)" 
						   onmouseout="changeShadow(this,1)">Download data</p>
						<!--							<p id="wcs"></p>-->
						<div id="wcslink"> </div>
					</td></tr>
				
				<!-- Link to download kml files-->
				<tr  id="mainkml"> <td>
						<a  id="kmlLink" href="http://viewer.coaps.fsu.edu/ncWMS/wms?layers=hycom2010/temperature&FORMAT=application/vnd.google-earth.kmz&REQUEST=GetMap&VERSION=1.1.1&BBOX=-98.0,18.09164810180664,-76.400024,31.960647583007812&WIDTH=512&HEIGHT=512&TRANSPARENT=true&COLORSCALERANGE=10.0,34.0&STYLES=boxfill/null&SRS=EPSG:4326&ELEVATION=0&TIME=2010-12-31T00:00:00.000Z" style="text-align:center;">
							<p class="defShadow" onmouseover="changeShadow(this,2)" onmouseout="changeShadow(this,1)">
								<img  border="0" src="/DeepCProject/common/images/kmz/google_earth_logo.png" width="35" height="32" alt="Descargar en KML" />
								Kml data</p>
						</a>
					</td> </tr>
				<!--This part shows the animation options-->
				 
					<tr id="s-animation" ><td><p class="defShadow"  onclick="stopAnimation();" onmouseover="changeShadow(this, 2);" 
												 onmouseout="changeShadow(this,1)"> Stop animation </p></td></tr>
					
					<tr id="l-animation" ><td><p class="defShadow" onmouseover="changeShadow(this, 2);" 
												 onmouseout="changeShadow(this,1)"> Loading 
								<img src="/DeepCProject/common/images/load.gif" height="12" border="0" alt="loading"></A>
							</p></td></tr>
						
				
				<tr><td align="left">
						<!-- This sections generate the menu of optional layers, normally vector layers -->
						<table class="vectorLayer">
							
								<tr> <td >
										<input id="checkBox1" type="checkbox" name="vectorLayersSelected"
											   value="us_st" onclick="manageOptionalLayers(layer2,this.checked)"
											   
												   /> 
										US States 
									</td>
									<td align="RIGHT">
										<A href="http://viewer.coaps.fsu.edu/geoserver/wms/kml?layers=comm:states">
											<img src="/DeepCProject/common/images/kmz/kmz.png" border="0" alt="Descargar KMZ"></A>
										&nbsp;
									</td> </tr>
								
								<tr> <td >
										<input id="checkBox2" type="checkbox" name="vectorLayersSelected"
											   value="deep" onclick="manageOptionalLayers(layer3,this.checked)"
											   
												   /> 
										DeepC 
									</td>
									<td align="RIGHT">
										<A href="http://viewer.coaps.fsu.edu/geoserver/wms/kml?layers=comm:test">
											<img src="/DeepCProject/common/images/kmz/kmz.png" border="0" alt="Descargar KMZ"></A>
										&nbsp;
									</td> </tr>
								
						</table>
					</td></tr>
				<!-- Instructions file
				<tr><td align="center" >
						<a href="/doc/InstruccionesDeUsoACDMV2.pdf">
							<p class="invShadow" onmouseover="changeShadow(this,1)" 
							   onmouseout="changeShadow(this,2)">Instructions </p>
						</a>
					</td></tr>                   
				-->
				<tr><td align="center">
						<!-- Resize window -->
						<p class="defShadow" onclick="refreshWindow();" onmouseover="changeShadow(this,2)" 
						   onmouseout="changeShadow(this,1)">
							Resize window 
						</p>
						</a>
					</td></tr>
				<tr><td align="center">
						<!-- Email -->
						<a href="mailto:olmozavala@gmail.com">
							<p class="defShadow" onclick="MapViewersubmitForm();" onmouseover="changeShadow(this,2)" 
							   onmouseout="changeShadow(this,1)">
								Email 
							</p>
						</a> 
					</td></tr>
				
				</table>
            </form>
		</div>
		
		<!--		<div class="layersData" id="layersSpecData" > </div>-->
		<div class="layersLongLat">
			<!-- This div displays the specific data of the map -->
			<b>Longitude:  &nbsp;&nbsp;Latitude: &nbsp;</b>
			<div id="location" ></div>
		</div>    
		
		<!-- Foot page --> 
		<div id="pieDePaginaIzq" class="leftFoot">
			<!--			<p class="footNote" align="left">-->
				&nbsp;
				<a  href="http://www.deep-c.org/">
<!--					<img border="0" src="/DeepCProject/common/images/Logos/logo-uniatmos-chi.png" alt="UNIATMOS" width="169" height="54" /> </a>-->
					<a  href="http://www.fsu.edu/">
						<img border="0" src="/DeepCProject/common/images/Logos/FSU.png" alt="FSU" width="61" height="60" /></a>
					&nbsp;
					<a  href="http://coaps.fsu.edu/">
						<img border="0" src="/DeepCProject/common/images/Logos/COAPSoz.png" alt="COAPS" width="60" height="60" /></a>
					&nbsp 
					<a  href="http://www.deep-c.org/">
						<img border="0" src="/DeepCProject/common/images/Logos/DeepC.png" alt="DeepC" width="102" height="60" /></a>
					&nbsp 
					<a  href="http://www.noaa.gov/">
						<img border="0" src="/DeepCProject/common/images/Logos/NOAA.png" alt="NOAA" width="61" height="60" /></a>
			<p class="footNote" align="left">
					&nbsp 
					&copy; <script language="javascript">document.write(getDate("%Y"));</script>.  Deep-C Consortium. All Rights Reserved. &nbsp;
			</p>
		</div>
    </body>
</html>
