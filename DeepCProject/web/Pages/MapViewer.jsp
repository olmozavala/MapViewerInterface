<%@page pageEncoding="iso-8859-1"%>
<%@ taglib prefix="menuHelper" uri="/WEB-INF/TLD/htmlStaticFunctions.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="names" class="com.mapviewer.model.PagesNames" scope="page"> </jsp:useBean>
<jsp:useBean id="globals" class="com.mapviewer.model.Globals" scope="page"> </jsp:useBean>

	<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN"
		"http://www.w3.org/tr/html4/loose.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">

		<head>
        <%@include file="Header/GlobalJavaScript.jsp" %>
        <%@include file="Header/Header.jsp" %>
        <%@include file="OpenLayersConfig.jsp" %>
    </head>

    <body onload="setHoverPositions()" onresize="refreshWindow();">

		<form id="baseForm" name="baseForm" action="${basepath}${names.acdmServlet}" method="post">
			<!-- These are the dropdowns for the base layer-->
			<span id="mainMenuParent" onmouseover="hoverInstructions('mainMenuParentHover', '1')" 
				  onmouseout="hoverInstructions('mainMenuParentHover', '2')" >
				<p class="defShadow" style="cursor:move"> Base Layers </p>
				${menuHelper:createMainMenu(MenuDelUsuario,language)}
				<br>
					<span id="mainMenuParentHover" class="commonHover"  >
						Base layer selection. Mostly raster data.
					</span>
			</span>

			<!-- User Menu -->
			<%@include file="TopMenu.jsp" %>
			<%@include file="RequiredDivs.jsp" %>
			<c:if test='${netcdf}'>
				<%@include file="NcWMSOptions.jsp" %>

				<!-- Current palette and color range -->
				<div id="palettesParent"> <%@include file="Options/Palettes.jsp" %> </div>
				<!--<span id="loadingAnimContainer" class="loadingAnimContainer" style="display:block;visibility:visible">-->

				<div id="l-animation">
					<p class="bigFontSize"> Loading 0 % <img src="${basepath}/common/images/load.gif" height="12" border="0" alt="loading" />	</A>	</p>
				</div>
			</c:if>

			<!-- Foot page --> 
			<div id="pieDePaginaIzq" class="leftFoot">
				&nbsp;
				<a  href="http://www.deep-c.org/">
					<a  href="http://www.fsu.edu/">
						<img border="0" src="${basepath}/common/images/Logos/FSU.png" alt="FSU" width="30" height="30" /></a>
					&nbsp;
					<a  href="http://coaps.fsu.edu/">
						<img border="0" src="${basepath}/common/images/Logos/COAPSoz.png" alt="COAPS" width="30" height="30" /></a>
					&nbsp 
					<a  href="http://www.deep-c.org/">
						<img border="0" src="${basepath}/common/images/Logos/DeepC.png" alt="DeepC" width="51" height="30" /></a>
					&nbsp 
					<a  href="http://www.noaa.gov/">
						<img border="0" src="${basepath}/common/images/Logos/NOAA.png" alt="NOAA" width="30" height="30" /></a>

						<!--
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
	  					-->
					<p class="footNote" align="left">
						&nbsp 
						&copy; <script language="javascript">document.write(getDate("%Y"));</script>.  Deep-C Consortium. All Rights Reserved. &nbsp;
					</p>
					<a id="emailText" href="mailto:osz09@fsu.edu"> Contact </a>

			</div>

		</form>
    </body>

</html>

