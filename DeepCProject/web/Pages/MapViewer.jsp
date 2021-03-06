<%@page pageEncoding="iso-8859-1"%>
<%@page errorPage="Error/ErrorPage.jsp" %>
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
        <%@include file="Header/GlobalJavaScript.jsp" %>
        <%@include file="Header/Header.jsp" %>
        <%@include file="OpenLayersConfig.jsp" %>
    </head>

	<body onresize="refreshWindow();" >

        <%@include file="RequiredDivs.jsp" %>
        <c:if test='${netcdf}'>
            <%@include file="NcWMSOptions.jsp" %>
			<span id="elevationSelector"> </span>
        </c:if>

        <!-- Simple text that shows 'Loading...' -->
        <c:if test='${netcdf}'>
			<div id="l-animation">
				<p class="bigFontSize"> <fmt:message key="ncwms.loading" /> 
					<span id="loadperc">0</span> % <img src="${basepath}/common/images/load.gif" height="12" border="0" alt="loading" />	</p>
			</div>
            <span id="s-animation">
                <p class="buttonStyle" onclick="stopAnimation();" > Stop animation </p>
            </span>
            <%@include file="Options/OptionalPalettes.jsp" %>
        </c:if>

		<c:if test="${cqlfilter}">
			<%-- CQL Custom filter buttons and text field. --%>
			<%@include file="Options/CQLFilter.jsp" %> 
		</c:if>

        <!-- This is the div that contains all of the user options, drop down of
          main layers, vector layers, kml data, etc. -->
        <div id="allMenuParent" >
            <form id="baseForm" name="baseForm" action="${basepath}${names.acdmServlet}" method="post">
                <table id="t_allMenu" border="0">
                    <!-- Creates the menus from the static function createMenu inside HtmlMenuBuilder -->
                    <tr>
                        <td id="mainMenuParent" onmouseover="hoverInstructions('mainMenuParentHover', '1')" 
							onmouseout="hoverInstructions('mainMenuParentHover', '2')" >
                            ${menuHelper:createMainMenu(MenuDelUsuario,language)} 
                        </td>
                    </tr>
					<c:if test="${cqlfilter}">
						<tr>
							<td id="ocqlMenuButtonParent">
								<p id="idOcqlMenuButton" class="buttonStyle" onclick="toggleCustomFilterTextBox();">
									<fmt:message key="cql.custom" />
								</p>
							</td>
						</tr>
					</c:if>


                    <!-- Transparency -->
                    <tr id="transParent"  onmouseover="hoverInstructions('transParentHover', '1')" onmouseout="hoverInstructions('transParentHover', '2')" >
                        <!-- Container should have id='transParent'-->
                        <td align="center" ><%@include file="Options/Transparency.jsp" %>
                        </td>
                    </tr>

                    <c:choose>
                        <c:when test='${netcdf}'>
                            <!-- Elevation -->
                            <tr ><td align="center" id="elevationParent"><%@include file="Options/Elevation.jsp" %>
								</td></tr>

                            <!-- Button to select transect regions -->
                            <tr > <td id="transectParent" onmouseover="hoverInstructions('transectParentHover', '1')" 
									  onmouseout="hoverInstructions('transectParentHover', '2')"><%@include file="Options/TransectTool.jsp" %>
                                </td> </tr>

                            <!-- Current palette and color range -->
                            <tr> <td align="center" id="palettesMenuParent"  onmouseover="hoverInstructions('palettesHover', '1')" 
									 onmouseout="hoverInstructions('palettesHover', '2')">
									<%@include file="Options/Palettes.jsp" %>
								</td> 
							</tr>
							<td id="hideCalendarButtonParent" valign="center" >
								<p class="buttonStyle" id="hideCalendar" 
								   onmouseover="hoverInstructions('hideCalendarHover', '1')" 
								   onmouseout="hoverInstructions('hideCalendarHover', '2')"
								   onclick="hideCalendarFunc();">Hide Calendar</p>
							</td>
						</c:when>
						<c:when test='${!netcdf}'>
							<!-- Download data-->
							<tr id="download"><td><%@include file="Options/DownloadData.jsp" %></td></tr>
						</c:when>
					</c:choose>

					<!-- Link to download kml files-->
					<tr> 
						<td id="mainKmlParent" onmouseover="hoverInstructions('mainKmlParentHover', '1')" 
							onmouseout="hoverInstructions('mainKmlParentHover', '2')"> 
							<%@include file="Options/KmlLink.jsp" %>
						</td>
					</tr>

					<!-- List of optional layers -->
					<tr>
						<td id="optionalMenuParent" onmouseover="hoverInstructions('optionalMenuParentHover', '1')" 
							onmouseout="hoverInstructions('optionalMenuParentHover', '2')"> 
							<%@include file="Options/OptionalLayers.jsp" %>
						</td>
					</tr>
					<!-- Map Instructions-->
					<tr>
						<td id="helpParent">
							<p id="helpText" class="buttonStyle" onclick="displayHelp();" >
								Help
							</p>
						</td>
					</tr>

				</table>
			</form>
		</div>

		<%@include file="Options/MapInstructions.jsp" %>

		<!-- Foot page --> 
		<div id="pieDePaginaIzq" class="leftFoot">
			<!--			<p class="footNote" align="left">-->
			&nbsp;
			<a  href="http://www.deep-c.org/">
		<!--					<img border="0" src="${basepath}/common/images/Logos/logo-uniatmos-chi.png" alt="UNIATMOS" width="169" height="54" /> </a>-->
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
					&copy; <script language="javascript">document.write(getDate("%Y"));</script>.  Deep-C Consortium. All Rights Reserved. &nbsp;
				</p>
		</div>
	</body>

</html>
