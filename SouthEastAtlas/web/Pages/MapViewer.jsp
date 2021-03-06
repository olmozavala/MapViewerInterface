<%@page pageEncoding="iso-8859-1"%>
<%@ taglib prefix="menuHelper" uri="/WEB-INF/TLD/htmlStaticFunctions.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="names" class="com.mapviewer.model.PagesNames" scope="page"> </jsp:useBean>
<jsp:useBean id="globals" class="com.mapviewer.model.Globals" scope="page"> </jsp:useBean>

	<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN"
		"http://www.w3.org/tr/html4/loose.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/Atlas Open Layers.dwt" codeOutsideHTMLIsLocked="false" -->
		<head>
			<link rel="icon" href="${basepath}/common/images/icon/USMap.ico" type="image/x-icon" />
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<meta name="Description" content="Atlas template description" />
		<meta name="Keywords" content="Climate atlas" />

		<link href="${basepath}/common/CSS/mapStyle.css" rel="stylesheet" type="text/css"/>
		<link href="${basepath}/common/CSS/calendar/jscal2.css" rel="stylesheet" type="text/css"/>
		<link href="${basepath}/common/CSS/calendar/border-radius.css" rel="stylesheet" type="text/css"/>
		<link href="${basepath}/common/CSS/calendar/steel/steel.css" rel="stylesheet" type="text/css"/>

		<!--		<script type="text/javascript" src="http://openlayers.org/api/OpenLayers.js"></script>-->
		<script type="text/javascript" src="${basepath}/common/JS/openlayers/OpenLayers.js"> </script>
		<script type="text/javascript" src="${basepath}/common/JS/validation.js"> </script>
		<script type="text/javascript" src="${basepath}/common/JS/ajax/ajax.js"> </script>
		<script type="text/javascript" src="${basepath}/common/JS/mapDisplay/mapDisplay.js"> </script>
		<script type="text/javascript" src="${basepath}/common/JS/mapDisplay/animation.js"> </script>
		<script type="text/javascript" src="${basepath}/common/JS/utilities.js"> </script>
		<script language="javascript"  src="${basepath}/common/JS/fecha/funciones.js"></script>
		<script language="javascript"  src="${basepath}/common/JS/calendar/jscal2.js"></script>
		<script language="javascript"  src="${basepath}/common/JS/calendar/lang/en.js"></script>

		<script type="text/javascript"  >
			var layerDetails = ${layerDetails};
			var mainLayer = '${mainLayer}';
			var basepath= '${basepath}';
			var opacity = 1;//Default opacity
			var netcdf = ${netcdf};
			var map;
			var widthNum = 0;
			var heightNum = 0;
		</script>

		<%@include file="OpenLayersConfig.jsp" %>

		<title>Digital Atlas</title>
	</head>
	<body onload="init();initNetcdf();getWCSV1Ajax('${basepath}');" scroll="no">
		<div class="mapTitle" id="layerTitle"> <p> Southeast Digital Climate Atlas <br> ${layerTitle} </p> </div>
		<div id="map"> <!-- This div contains all the map --> </div>      
		<div id="mapOverlayDiv" ><img id="mapOverlay" alt="map overlay" onload="javascript:animationLoaded();" /></div>

		<!--	Divs that contains the calendars	-->
		<div class="startDateCal" id="cal-start"></div>
		<div class="endDateCal" id="cal-end"></div>

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
								<img class="alphaText" border="0" onclick="changeTransp(.15);" 
									 onmouseover="rollImage(this,'${basepath}/common/images/Menu/MinusInv.png' )"
									 onmouseout="rollImage(this,'${basepath}/common/images/Menu/Minus.png' )"
									 src="${basepath}/common/images/Menu/Minus.png" alt="DecTrans" width="20" height="20" />
								Transparency 
								<img class="alphaText" border="0" onclick="changeTransp(-.15);"
									 onmouseover="rollImage(this,'${basepath}/common/images/Menu/PlusInv.png' )"
									 onmouseout="rollImage(this,'${basepath}/common/images/Menu/Plus.png' )"
									 src="${basepath}/common/images/Menu/Plus.png" alt="IncTrans" width="20" height="20" /></p>
						</td></tr>

					<!-- Link to download the real data (Geotiff file) -->
					<tr><td align="center">
							<a  id="downloadData" style="text-align:center;">
								<p  class="invShadow" onmouseover="changeShadow(this,1)" onmouseout="changeShadow(this,2)">
									Download data</p>
							</a>
						</td></tr>

                    <!-- Link to download kml files-->
					<tr  id="mainkml"> <td>
							<a  href="${linkKML}" style="text-align:center;">
								<p class="invShadow" onmouseover="changeShadow(this,1)" onmouseout="changeShadow(this,2)">
									<img  border="0" src="${basepath}/common/images/kmz/google_earth_logo.png" width="35" height="32" alt="Descargar en KML" />
									Kml data</p>
							</a>
						</td> </tr>

					<!--This part shows the animation options-->
					<c:if test='${netcdf}'> 
						<tr id="s-animation" ><td><p class="invShadow"  onclick="stopAnimation();" onmouseover="changeShadow(this, 1);" 
													 onmouseout="changeShadow(this,2)"> Stop animation </p></td></tr>

						<tr id="l-animation" ><td><p class="invShadow"  onmouseover="changeShadow(this, 1);" 
													 onmouseout="changeShadow(this,2)"> <blink>Loading ... </blink></p></td></tr>
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
							<!-- Email -->
							<a href="mailto:olmozavala@gmail.com">
								<p class="invShadow" onclick="MapViewersubmitForm();" onmouseover="changeShadow(this,1)" 
								   onmouseout="changeShadow(this,2)">
									Email 
								</p>
							</a>
						</td></tr>
					<tr><td align="center">
							<!-- Resize window -->
							<p class="invShadow" onclick="refreshWindow();" onmouseover="changeShadow(this,1)" 
							   onmouseout="changeShadow(this,2)">
								Resize window 
							</p>
							</a>
						</td></tr>

				</table>
            </form>
		</div>

		<!--		<div class="layersData" id="layersSpecData" > </div>-->
		<div class="layersLongLat">
			<!-- This div displays the specific data of the map -->
			<b>Longitude:  &nbsp;&nbsp;Latitude: &nbsp;</b><br>
			<div id="location" ></div>
		</div>    

		<!-- Foot page --> 
		<div id="pieDePaginaIzq" class="leftFoot">
			<p class="footNote" align="left">
				<a  href="http://www.fsu.edu/">
					<img border="0" src="${basepath}/common/images/Logos/FSU.png" alt="FSU" width="61" height="60" /></a>
				&nbsp;
				<a  href="http://coaps.fsu.edu/">
					<img border="0" src="${basepath}/common/images/Logos/COAPSoz.png" alt="COAPS" width="60" height="60" /></a>
				&nbsp 

				<a  href="http://climatecenter.fsu.edu/">
					<img class="whiteBack" border="0" src="${basepath}/common/images/Logos/FCCLogoOZ.png" alt="Florida Climate Center" width="203" height="60" /></a>

				<a   href="http://floridaclimateinstitute.org/">
					<img border="0" src="${basepath}/common/images/Logos/FCIoz.png" alt="Florida Climate Institute" width="223" height="60" /></a>

				&nbsp 

				&copy; <script language="javascript">document.write(getDate("%Y"));</script>. US Southeast Digital Climate Atlas. All Rights Reserved.
			</p>
		</div>


    </body>
</html>
