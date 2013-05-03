<%-- 
This is the main jsp file that forms the html webpage. It contains the skeleton of the html application. 
--%>

<%@page pageEncoding="iso-8859-1"%>
<%--<%@page errorPage="Error/ErrorPage.jsp" %>--%>
<%@ taglib prefix="menuHelper" uri="/WEB-INF/TLD/htmlStaticFunctions.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<jsp:useBean id="names" class="com.mapviewer.model.PagesNames" scope="page"> </jsp:useBean>
<jsp:useBean id="globals" class="com.mapviewer.model.Globals" scope="page"> </jsp:useBean>

<!--This part is used to change the texts depending on the language of the user browser-->
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.mapviewer.messages.text" />

	<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN"
		"http://www.w3.org/tr/html4/loose.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml" lang="${language}">

		<head>
        <%@include file="Header/GlobalJavaScript.jsp" %> <%-- Sets all the javascript global variables that are initiated by the java application --%>

        <%@include file="Header/Header.jsp" %> <%-- contains all the css links and javascript links --%>
        <%@include file="OpenLayersConfig.jsp" %> <%-- this is a javascript file that initiazlies the OpenLayers map --%>
    </head>


    <body id="bodyClass" onresize="refreshWindow();" >
        <%-- Main form of the application (main menu), it executes a new page everytime a new menu item is chosen --%>

        <form id="baseForm" name="baseForm" action="${basepath}${names.acdmServlet}" method="post">

            <span id="helpDiv" style="border-radius: 10px;">
                <%@include file="Options/MapInstructions.jsp" %>
            </span> 

            <!-- List of optional layers -->
            <span class="draggableWindow" id="optionalMenuParent" 
				  onmouseover="hoverInstructions('optionalLayersParentHover', '1')" 
                  onmouseout="hoverInstructions('optionalLayersParentHover', '2')" >
				<%@include file="Options/OptionalLayers.jsp" %>
					<span id="optionalLayersParentHover" class="commonHover">
						<fmt:message key="help.optional.layers1" />
						 <img src="${basepath}/common/images/kmz/kmz.png"> 
						<fmt:message key="help.optional.layers2" />
					</span>
			</span>

            <!-- These are the dropdowns for the base layer-->
            <span class="draggableWindow" id="mainMenuParent" onmouseover="hoverInstructions('mainMenuParentHover', '1')" 
                  onmouseout="hoverInstructions('mainMenuParentHover', '2')" >
                <p class="defShadow" style="cursor:move"> <span class="ie_shadow"><fmt:message key="main.base" /></span><span class="minimizeButton" onclick="minimizeWindow('mainMenuMinimize', 'mainMenuParent')" style="position:absolute;right:7px;top:7px;">-</span> </p>
                ${menuHelper:createMainMenu(MenuDelUsuario,language)}
                <br>
                    <c:if test="${cqlfilter}">
                        <span id="ocqlMenuButtonParent">
                            <button type="button" name="type" id="idOcqlMenuButton" class="buttonStyle" 
                                    onclick="toggleCustomFilterTextBox();" ><fmt:message key="cql.custom" /></button>
                        </span>
                    </c:if>
					<span id="mainMenuParentHover" class="commonHover">
						<fmt:message key="help.mainlayers" />
					</span>
            </span>

            <c:if test="${cqlfilter}">
                <%-- CQL Custom filter buttons and text field. --%>
                <%@include file="Options/CQLFilter.jsp" %> 
            </c:if>

            <!-- User Menu -->
            <%@include file="TopMenu.jsp" %> <%-- Upper menu with user options --%>
            <%@include file="RequiredDivs.jsp" %> <%-- Contains the title of the layer and the div that hold the whole map --%>
            <c:if test='${netcdf}'>
                <%@include file="NcWMSOptions.jsp" %>  <%-- This page has all the calendars, the animaton divs  --%>

                <!-- Elevation -->
                <span class="draggableWindow" id="elevationSelector"> </span>

                <!-- Current palette and color range -->
                <!--<div id="palettesParent">-->
                <%@include file="Options/Palettes.jsp" %> 
                <!--</div>-->
                <!--<span id="loadingAnimContainer" class="loadingAnimContainer" style="display:block;visibility:visible">-->

                <div id="l-animation">
                    <p class="bigFontSize"> <fmt:message key="ncwms.loading" /> <span id="loadperc">0</span> % <img src="${basepath}/common/images/load.gif" height="12" border="0" alt="loading" />	</p>
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

                    <p class="footNote" align="left">
                        &nbsp 
                        &copy; <script language="javascript">document.write(getDate("%Y"));</script>.  <fmt:message key="main.copyr" /> &nbsp;
                    </p>
                    <a id="emailText" href="mailto:osz09@fsu.edu, aahmed@coaps.fsu.edu"> <fmt:message key="main.contact" /></a>
            </div>
        </form>

		<!-- minimizable windows file -->
		<%@include file="Options/MinimizeWindows.jsp" %>

		<!-- Help texts file -->
		<%@include file="Help/HelpTexts.jsp" %>
    </body>
</html>

