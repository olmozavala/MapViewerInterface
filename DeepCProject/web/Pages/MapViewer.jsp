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

    <body onload="init();initMenus('${animationURL}')" scroll="no">

        <%@include file="RequiredDivs.jsp" %>
        <c:if test='${netcdf}'>
            <%@include file="NcWMSOptions.jsp" %>
        </c:if>

        <!-- Simple text that shows 'Loading...' -->
        <c:if test='${netcdf}'>
            <span id="l-animation"> <p  class="bigFontSize"> Loading 
                    <img src="${basepath}/common/images/load.gif" height="12" border="0" alt="loading"/> </p> 
            </span>
            <span id="hideCalendarParent">
                <p id="hideCalendar" class="buttonStyle" onclick="hideCalendarFunc();" >Hide Calendar</p> <br>
            </span>
            <span id="s-animation">
                <p class="buttonStyle" onclick="stopAnimation();" > Stop animation </p>
            </span>
        </c:if>

        <!-- This is the div that contains all of the user options, drop down of
          main layers, vector layers, kml data, etc. -->
        <div id="allMenuParent" >
            <form id="baseForm" name="baseForm" action="${basepath}${names.acdmServlet}" method="post">
                <table id="t_allMenu" border="0">
                    <!-- Creates the menus from the static function createMenu inside HtmlMenuBuilder -->
                    <tr>
                        <td id="mainMenuParent" onmouseover="hoverInstructions('mainMenuParentHover', '1')" onmouseout="hoverInstructions('mainMenuParentHover', '2')" >
                            ${menuHelper:createMainMenu(MenuDelUsuario,language)} 

                            <span id="mainMenuParentHover" class="commonHover"  >&nbsp;Layer Variable and Year&nbsp;</span>

                        </td>
                    </tr>


                    <!-- Transparency -->
                    <tr id="transParag"  onmouseover="hoverInstructions('transParentHover', '1')" onmouseout="hoverInstructions('transParentHover', '2')" >
                        <!-- Container should have id='transParent-->
                        <td><%@include file="Options/Transparency.jsp" %>

                            <span id="transParentHover" class="commonHover">


                                &nbsp;Change the color transparency of current layer to view the underneath topology &nbsp;

                            </span>
                        </td>
                    </tr>

                    <c:choose>
                        <c:when test='${netcdf}'>
                            <!-- Elevation -->
                            <tr ><td id="elevationParent"><%@include file="Options/Elevation.jsp" %>
                                    <span id="elevationParentHover" class="commonHover">
                                        Change the elevation/pressure level of the layer. Click the - sign to decrease and the + to increase. Press the middle button to select a level                          

                                    </span></td></tr>

                            <!-- Button to select transect regions -->
                            <tr > <td id="transectParent" onmouseover="hoverInstructions('transectParentHover', '1')" onmouseout="hoverInstructions('transectParentHover', '2')"><%@include file="Options/TransectTool.jsp" %>
                                    <span id="transectParentHover" class="commonHover">Draw a line(s) by clicking on the map on different points and then double click to display graph of chosen points</span>

                                </td> </tr>

                            <!-- Current palette and color range -->
                            <tr > <td id="palettesParent"  onmouseover="hoverInstructions('palettesHover', '1')" onmouseout="hoverInstructions('palettesHover', '2')"><%@include file="Options/Palettes.jsp" %>
                                    <span id="palettesHover" class="commonHover">Change the color ranges displayed and choose the color pattern of your choice</span></td> </tr>

                        </c:when>
                        <c:when test='${!netcdf}'>
                            <!-- Download data-->
                            <tr id="download"><td><%@include file="Options/DownloadData.jsp" %></td></tr>
                        </c:when>
                    </c:choose>

                    <!-- Link to download kml files-->
                    <tr> 
                        <td id="mainKmlParent" onmouseover="hoverInstructions('mainKmlParentHover', '1')" onmouseout="hoverInstructions('mainKmlParentHover', '2')"> 
                            <%@include file="Options/KmlLink.jsp" %>
                            <span id="mainKmlParentHover" class="commonHover" >&nbsp;Open current animation/display of map in Google Earth&nbsp;</span>

                        </td>
                    </tr>
                    <!--This part shows the animation options-->

                    <!-- List of optional layers -->
                    <tr>
                        <td id="optionalMenuParent"> 
                            <%@include file="Options/OptionalLayers.jsp" %>
                        </td>
                    </tr>

                    <tr>
                        <td id="resizeScreenParent">
                            <!-- Resize window -->
                            <p id="resizeScreenText" class="buttonStyle" onclick="refreshWindow();" >
                                Resize window 
                            </p>
                        </td>
                    </tr>

                    <!-- Email -->
                    <tr>
                        <td id="emailParent">
                            <a href="mailto:osz09@gmail.com">
                                <p id="emailText" class="buttonStyle" onclick="MapViewersubmitForm();" >
                                    Contact
                                </p>
                            </a> 
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
