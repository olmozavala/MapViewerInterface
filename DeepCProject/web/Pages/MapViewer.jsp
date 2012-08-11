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
    <body onload="init();initNetcdf('${animationURL}');" scroll="no">

        <%@include file="RequiredDivs.jsp" %>
        <%@include file="NcWMSOptions.jsp" %>
        <!-- This is the div that contains all of the user options, drop down of
          main layers, vector layers, kml data, etc. -->
        <div id="layersMenu" class="layersMenu">
            <form id="baseForm" name="baseForm" action="${basepath}${names.acdmServlet}" method="post">
                <table class="menus" border="0">
                    <!-- Creates the menus from the static function createMenu inside HtmlMenuBuilder -->
                    ${menuHelper:createMainMenu(MenuDelUsuario,language)} 

                    <!-- Elevation -->
                    <c:if test='${netcdf}'>
                        <tr id="elevation" ><td><%@include file="Options/Elevation.jsp" %></td></tr>
                    </c:if>

                    <!-- Transparency -->
                    <tr id="transParag"><td><%@include file="Options/Transparency.jsp" %></td></tr>

                    <!-- If the layer is a netcdf file then we show the optional and default palettes-->
                    <c:if test='${netcdf}'> 
                        <tr><td><%@include file="Options/Palettes.jsp" %></td></tr>
                    </c:if>

                    <!-- Current palette and color range -->
                    <tr <c:if test='${netcdf}'> style="display: none;" </c:if>>
                        <td><%@include file="Options/Palettes.jsp" %></td>
                    </tr>

                    <!-- Link to download kml files-->  
                    <tr  id="mainkml"> <td> <%@include file="Options/KmlLink.jsp" %></td></tr>

                    <!--This part shows the animation options-->
                    <c:if test='${netcdf}'> 
                        <tr id="s-animation" ><td><p class="small awesome"  onclick="stopAnimation();" > Stop animation </p></td></tr>

                        <tr id="l-animation" ><td><p class="defShadow" > Loading 
                                    <img src="${basepath}/common/images/load.gif" height="12" border="0" alt="loading"></A>
                                </p></td></tr>
                            </c:if>

                    <!-- List of optional layers -->
                    <tr><td align="left"> <%@include file="Options/OptionalLayers.jsp" %></td></tr>

                    <tr>
                        <td align="center">
                            <!-- Resize window -->
                            <p class="small awesome" onclick="refreshWindow();" >
                                Resize window 
                            </p>
                        </td>
                    </tr>

                    <!-- Email -->
                    <tr>
                        <td align="center">
                            <a href="mailto:osz09@gmail.com">
                                <p class="small awesome" onclick="MapViewersubmitForm();" >
                                    Email 
                                </p>
                            </a> 
                        </td>
                    </tr>

                    <!-- Map Instructions-->
                    <tr>
                        <%@include file="Options/MapInstructions.jsp" %>
                        <td align="center">
                            <div id="helpDiv">
                                <p class="small awesome" onclick="displayHelp();" >
                                    Help
                                </p></div>
                        </td>
                    </tr>

                </table>
            </form>
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

