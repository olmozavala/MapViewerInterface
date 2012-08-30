<%-- 
    Document   : RequiredDivs
    Created on : Aug 3, 2012, 5:58:26 PM
    Author     : olmozavala
--%>

<!-- User Menu -->

 <%@include file="TopMenu.jsp" %>


<!-- Map title -->
<div class="mapTitle" id="layerTitle"> <p id="pTitleText"> Deep-C Gulf of Mexico<br> ${layerTitle} </p> </div>

<!-- This div contains all the map --> 
<div id="map"> </div>      
<div class="layersLongLat">
	<!-- This div displays the specific data of the map -->
	<b>Longitude:  &nbsp;&nbsp;Latitude: &nbsp;</b>
	<div id="location" ></div>
</div>    
