<%@page pageEncoding="iso-8859-1"%>
<%@ taglib prefix="menuHelper" uri="/WEB-INF/TLD/htmlStaticFunctions.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="names" class="com.mapviewer.model.PagesNames" scope="page"> </jsp:useBean>
<jsp:useBean id="globals" class="com.mapviewer.model.Globals" scope="page"> </jsp:useBean>

<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN"
	"http://www.w3.org/tr/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/Atlas Open Layers.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<link rel="icon" href="${basepath}/common/images/icon/Gulf.ico" type="image/x-icon" />
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<meta name="Description" content="Atlas template description" />
		<meta name="Keywords" content="Climatic atlas" />
		
		<link href="${basepath}/common/CSS/mapStyle.css" rel="stylesheet" type="text/css"/>
		<!--[if gte IE 6]>
		<link href="${basepath}/common/CSS/mapStyleIE.css" rel="stylesheet" type="text/css"/>
		<![endif]-->
		<link href="${basepath}/common/CSS/calendar/jscal2.css" rel="stylesheet" type="text/css"/>
		<link href="${basepath}/common/CSS/calendar/border-radius.css" rel="stylesheet" type="text/css"/>
		<link href="${basepath}/common/CSS/calendar/reduce-spacing.css" rel="stylesheet" type="text/css"/>
		<link href="${basepath}/common/CSS/calendar/steel/steel.css" rel="stylesheet" type="text/css"/>
		<link href="${basepath}/common/JS/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css"/>
		
<!--		<script type="text/javascript" src="http://openlayers.org/api/OpenLayers.js"></script>-->
		<script type="text/javascript" src="${basepath}/common/JS/openlayers/OpenLayers.js"> </script>
		<script type="text/javascript" src="${basepath}/common/JS/utilities.js"> </script>
		<script type="text/javascript" src="${basepath}/common/JS/mapDisplay/mapDisplay.js"> </script>
		<script type="text/javascript" src="${basepath}/common/JS/mapDisplay/animation.js"> </script>
		<script type="text/javascript" src="${basepath}/common/JS/validation.js"> </script>
		<script type="text/javascript" src="${basepath}/common/JS/ajax/ajax.js"> </script>
		<script type="text/javascript" src="${basepath}/common/JS/fecha/funciones.js"></script>

		<script type="text/javascript" src="${basepath}/common/JS/calendar/jscal2.js"></script>
		<script type="text/javascript" src="${basepath}/common/JS/calendar/lang/en.js"></script>
		<!--	It seems that OpenLayers is already loadin the jquery library	-->
<!--		<script type="text/javascript" src="${basepath}/common/JS/jquery/jquery.js"></script>-->
<!--		<script type="text/javascript" src="${basepath}/common/JS/jquery/jquery.muosewheel.pack.js"></script>-->
<!--		<script type="text/javascript" src="${basepath}/common/JS/fancybox/jquery.fancybox.pack.js"></script>-->
		
		<script type="text/javascript"  >
			var layerDetails = ${layerDetails};
			var mainLayer = '${mainLayer}';
			var mappalette= '${palette}';
			var paletteUrl = '${paletteUrl}';
			var basepath= '${basepath}';
			var lay_style= '${style}';
			var map;
			var widthNum = 0;
			var heightNum = 0;
			var minPalVal = layerDetails.scaleRange[0];
			var maxPalVal  = layerDetails.scaleRange[1];
			var netcdf = ${netcdf};
            var max_time_range = '${max_time_range}';
			var first_optional_layer = '2';//Which number correponds to the first optional layer
		</script>
		
		<%@include file="OpenLayersConfig.jsp" %>
		
		<title>Gulf of Mexico</title>
	</head>
	<body onload="init();initNetcdf('${animationURL}');" scroll="no">
		
		<div class="mapTitle" id="layerTitle"> <p> Deep-C Gulf of Mexico<br> ${layerTitle} </p> </div>
		<div id="map"> <!-- This div contains all the map --> </div>      
		<div id="mapOverlayDiv" ><img id="mapOverlay" alt="map overlay" onload="javascript:animationLoaded();" /></div>
<!--		<div id="panZoom"></div>-->
                                    
		<!--	Divs that contains the calendars	-->
                                    <div class="hideButtonCal">
                                        
                                        <p class="invShadow"   id="hide_show" onclick="hideCalendar();" onmouseover="changeShadow(this, 1);" 
						   onmouseout="changeShadow(this,2)">Hide Calendar</p>
                                        
                                        
                                    </div>
		<div class="startDateCal" id="cal-start"><p class="calTitle">Start date (Current)</p></div>
		<div class="endDateCal" id="cal-end"><p class="calTitle">End date</p></div>
		<div class="palettesDiv" id="palettes-div"><p class="defShadow">Select new palette <table id="palettesTable"></table></p></div>
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
			<form id="baseForm" name="baseForm" action="${basepath}${names.acdmServlet}" method="post">
				<table class="menus" border="0">
					<!-- Creates the menus from the static function createMenu inside HtmlMenuBuilder -->
					${menuHelper:createMainMenu(MenuDelUsuario,language)} 
					<!-- Transparency -->
					<tr id="transParag"><td>
							<p class="alphaText"> 
								<img class="alphaText" border="0" onclick="changeTransp(.15, layer1);" 
									 onmouseover="rollImage(this,'${basepath}/common/images/Menu/MinusInv.png' )"
									 onmouseout="rollImage(this,'${basepath}/common/images/Menu/Minus.png' )"
									 src="${basepath}/common/images/Menu/Minus.png" alt="DecTrans" width="20" height="20" />
								Transparency 
								<img class="alphaText" border="0" onclick="changeTransp(-.15, layer1);"
									 onmouseover="rollImage(this,'${basepath}/common/images/Menu/PlusInv.png' )"
									 onmouseout="rollImage(this,'${basepath}/common/images/Menu/Plus.png' )"
									 src="${basepath}/common/images/Menu/Plus.png" alt="IncTrans" width="20" height="20" /></p>
						</td></tr>
					<!--					If the layer is a netcdf file then we show the optional and default palettes-->
					<c:if test='${netcdf}'> 
						<tr><td>

								<!--
							<p class="defShadow" onmouseover="changeShadow(this,2)"
							   					 onmouseout="changeShadow(this,1)"
												 onclick="displayPalettes();">
								Change palette
							</p> -->
								<table border="0" class="palette" align="center">
									<tr>
										<td> 
											<img id="imgPalette" src="${paletteUrl}" onclick="displayPalettes();" 
												 onmouseover="this.style.cursor ='pointer';"
												 onmouseout="this.style.cursor ='crosshair';"/>
										</td>
										<td class="waitBack">
											<p class="palMinMax">
												&nbsp; 
												max: <input onblur="UpdatePalette(mappalette); "id="maxPal" name="maxPal" type="text" size="2" /> 
												&nbsp;
												<br><br><br><br> 
												&nbsp;
												min: <input onblur="UpdatePalette(mappalette);" id="minPal" name="minPal" type="text" size="2" />
												&nbsp;
											</p>
										</td>
									</tr>
						</tr>
					</table>
					
					</td></tr>
				</c:if>
				
				<tr style="display: none;"><td align="center">
						<!-- Link to download the real data (Geotiff file) -->
						<p id="downloadData" class="defShadow" onclick="getWCSV1Ajax('${basepath}');" onmouseover="changeShadow(this,2)" 
						   onmouseout="changeShadow(this,1)">Download data</p>
						<!--							<p id="wcs"></p>-->
						<div id="wcslink"> </div>
					</td></tr>
				
				<!-- Link to download kml files-->
				<tr  id="mainkml"> <td>
						<a  id="kmlLink" href="${linkKML}" style="text-align:center;">
							<p class="defShadow" onmouseover="changeShadow(this,2)" onmouseout="changeShadow(this,1)">
								<img  border="0" src="${basepath}/common/images/kmz/google_earth_logo.png" width="35" height="32" alt="Descargar en KML" />
								Kml data</p>
						</a>
					</td> </tr>
				<!--This part shows the animation options-->
				<c:if test='${netcdf}'> 
					<tr id="s-animation" ><td><p class="defShadow"  onclick="stopAnimation();" onmouseover="changeShadow(this, 2);" 
												 onmouseout="changeShadow(this,1)"> Stop animation </p></td></tr>
					
					<tr id="l-animation" ><td><p class="defShadow" onmouseover="changeShadow(this, 2);" 
												 onmouseout="changeShadow(this,1)"> Loading 
								<img src="${basepath}/common/images/load.gif" height="12" border="0" alt="loading"></A>
							</p></td></tr>
						</c:if>
				
				<tr><td align="left">
						<!-- This sections generate the menu of optional layers, normally vector layers -->
						<table class="vectorLayer">
							<c:forEach var="vectorLayer" items="${vectorLayers.childs}" varStatus="indice">
								<tr> <td >
										<input id="checkBox${indice.count}" type="checkbox" name="vectorLayersSelected"
											   value="${vectorLayer.node.id}" onclick="manageOptionalLayers(layer${totalLayers - sizeVectLayers + indice.count - 1},this.checked)"
											   <c:if test='${vectorLayer.selected}'> checked </c:if>
												   /> 
										${menuHelper:transName(vectorLayer,language)} 
									</td>
									<td align="RIGHT">
										<A href="${linksKmzVect[indice.count-1]}">
											<img src="${basepath}/common/images/kmz/kmz.png" border="0" alt="Descargar KMZ"></A>
										&nbsp;
									</td> </tr>
								</c:forEach>
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
						<a href="mailto:osz09@gmail.com">
							<p class="defShadow" onclick="MapViewersubmitForm();" onmouseover="changeShadow(this,2)" 
							   onmouseout="changeShadow(this,1)">
								Email 
							</p>
						</a> 
					</td></tr>

<tr><td align="center">
						<!-- help -->
						<table id="helpInstructions" border="0" cellpadding="5" cellmargin="5" align="center">
                                                        
                                                        
                                                    <tr rowhei><td colspan="2" height="30" class="helpTitle" valign="top"><font color="black">Map Instructions</font><button type="button" class="cancelButton" onclick="hideHelp()">x</button></td></tr>
                                                        <tr><td>Move Map:</td><td>Click the map with the mouse and drag around.</td></tr>
                                                        <tr><td>To Zoom:</td><td>1) Use mouse wheel to zoom in and out.<BR/>2) Use + and - buttons located at the top left, besides the calendar.</td></tr>
                                                        <tr><td>Optional Layers:</td><td>These layers are located at the right of your screen, you can turn them on or off. For example if you want to show the US States on the map then you check the box of US States. </td></tr>
                                                        <tr><td>Map Layers:</td><td>These are located at the upper right corner. You can toggle between the different variable options for the layers such as temperature, salinity, velocity, etc. You can also choose the year of the data you would like to see. </td></tr>
                                                        <tr><td>Edit Layers:</td><td>You can change the color of the dataset by pressing the color pallete located at the top right. You can also choose a range of max and min for the dataset.</td></tr>
                                                        <tr><td>Display Animation:</td><td>1) Choose a beginning date in the calendar as a starting date. Depending if the dataset is weekly, monthly, or yearly the end calendar will change accordingly to the maximum time range allowed. 
                                                                <BR/>2) Choose an ending date. Note that a "Display animation" button is now showing up. Chose a frame you would like and click Display animation.
                                                                        <BR/>3) Wait while the animation is being loaded. This might take a few seconds depending on the time range selected. 
                                                            
                                                            
                                                            
                                                            
                                                            </td></tr>
                                                        <tr><td>Stop animation:</td><td>This button will disable the animation. You can cancel it before or after the animation is loaded.</td></tr>
                                                        <tr><td>Hide Calendar:</td><td>Toggle between this option to show/hide the calendar.</td></tr>
                                                        <tr><td>Download Data:</td><td>Click on the Kml data button to download data.</td></tr>
                                                        <tr><td>Help:</td><td>Display Instructions/Hide Instructions</td></tr>
                                                        <tr><td>Resize Window:</td><td>If you need to adjust the map size to your current window size.</td></tr>
                                                        <tr><td>Email: </td><td>If you have any questions or want to report a bug.</td></tr>
                                                        <tr><td>Help:</td><td>Display Instructions/Hide Instructions</td></tr>
                                                        
                                                        
                                                        
                                                        
                                                        
                                                    </table>    
                                                <div id="helpDiv">
							<p class="defShadow" onclick="displayHelp();" onmouseover="changeShadow(this,2)" 
							   onmouseout="changeShadow(this,1)">
								Help
							</p></div>
						 
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
<!--					<img border="0" src="${basepath}/common/images/Logos/logo-uniatmos-chi.png" alt="UNIATMOS" width="169" height="54" /> </a>-->
					<a  href="http://www.fsu.edu/">
						<img border="0" src="${basepath}/common/images/Logos/FSU.png" alt="FSU" width="61" height="60" /></a>
					&nbsp;
					<a  href="http://coaps.fsu.edu/">
						<img border="0" src="${basepath}/common/images/Logos/COAPSoz.png" alt="COAPS" width="60" height="60" /></a>
					&nbsp 
					<a  href="http://www.deep-c.org/">
						<img border="0" src="${basepath}/common/images/Logos/DeepC.png" alt="DeepC" width="102" height="60" /></a>
					&nbsp 
					<a  href="http://www.noaa.gov/">
						<img border="0" src="${basepath}/common/images/Logos/NOAA.png" alt="NOAA" width="61" height="60" /></a>
			<p class="footNote" align="left">
					&nbsp 
					&copy; <script language="javascript">document.write(getDate("%Y"));</script>.  Deep-C Consortium. All Rights Reserved. &nbsp;
			</p>
		</div>
    </body>
</html>
